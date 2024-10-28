package ra;

import org.bytedeco.llvm.LLVM.LLVMBasicBlockRef;
import org.bytedeco.llvm.LLVM.LLVMValueRef;
import org.bytedeco.llvm.global.LLVM;
import tool.DEBUGGER;

import static riscv.RISCVBuilder.*;

import java.util.*;

import static org.bytedeco.llvm.global.LLVM.*;
import static org.bytedeco.llvm.global.LLVM.LLVMGetValueName;

public class LinearScanRegisterAllocator implements RegisterAllocator {
    private Map<LLVMValueRef, Location> locationMap = new HashMap<>();
    private Map<LLVMValueRef, Interval> intervals = new HashMap<>();
    private TreeSet<Interval> active = new TreeSet<>(Comparator
                .comparingInt(Interval::getEndPoint)
                .thenComparingInt(Interval::getStartPoint)
                .thenComparingInt(i -> i.llvmValueRef.hashCode())
            );

    private int stackSize = 0;
    private Deque<String> freeRegPool = new ArrayDeque<>(Arrays.asList(
            REG_T2, REG_T3, REG_T4, REG_T5, REG_T6,
            REG_S0, REG_S1, REG_S2, REG_S3, REG_S4, REG_S5, REG_S6, REG_S7, REG_S8, REG_S9, REG_S10, REG_S11,
            REG_A1, REG_A2, REG_A3, REG_A4, REG_A5, REG_A6
    )); // Reserved Registers: t0, t1, a0, a7 and other regs.

    private int threshold = freeRegPool.size();

    /**
     *  Algorithm see https://web.cs.ucla.edu/~palsberg/course/cs132/linearscan.pdf
     */
    @Override
    public int allocate(LLVMValueRef func) {
        // 活跃变量分析
        liveVarsAnalysis(func);

        // 提取键值对 并按 startPoint 排序
        List<Map.Entry<LLVMValueRef, Interval>> entryList = new ArrayList<>(intervals.entrySet());
        entryList.sort(Comparator.comparingInt(entry -> entry.getValue().getStartPoint()));

        // 算法流程:
        for (Map.Entry<LLVMValueRef, Interval> entry : entryList) {
            Interval interval = entry.getValue();
            expireOldIntervals(interval);
            if (active.size() == threshold) {
                spillAtInterval(interval);
            } else {
                Location location = Location.makeRegLocation(freeRegPool.pop());
                locationMap.put(interval.llvmValueRef, location);
                active.add(interval);
            }
        }

        //visualize();
        return stackSize;
    }

    private void expireOldIntervals(Interval curInterval) {
        List<Interval> deleteLst = new ArrayList<>();

        for (Interval interval : active) {
            if (interval.endPoint >= curInterval.startPoint) {
                break;
            }
            deleteLst.add(interval);
            freeRegPool.push(locationMap.get(interval.llvmValueRef).getData());
        }

        for (Interval interval : deleteLst) {
            active.remove(interval);
        }
    }

    private void spillAtInterval(Interval curInterval) {
        Interval spill = active.last();
        if (spill.endPoint > curInterval.endPoint) {
            locationMap.put(curInterval.llvmValueRef, locationMap.get(spill.llvmValueRef));
            locationMap.put(spill.llvmValueRef, Location.makeMemLocation(stackSize));
            stackSize += 4;
            active.pollLast();
            active.add(curInterval);
        } else {
            locationMap.put(curInterval.llvmValueRef, Location.makeMemLocation(stackSize));
            stackSize += 4;
        }
    }

    @Override
    public Location resolveOprand(LLVMValueRef oprand) {
        if (LLVMIsAConstantInt(oprand) != null) {
            return Location.makeImmLocation(LLVMConstIntGetSExtValue(oprand));
        }
        if (LLVMIsAGlobalValue(oprand) != null) {
            return Location.makeGlbLocation(LLVMGetValueName(oprand).getString());
        }
        if (!locationMap.containsKey(oprand)) {
            throw new IllegalArgumentException("No such a oprand: " + LLVMGetValueName(oprand).getString());
        }

        return locationMap.get(oprand);
    }

    private void liveVarsAnalysis(LLVMValueRef func) {
        int point = 0;

        for (LLVMBasicBlockRef bb = LLVMGetFirstBasicBlock(func); bb != null; bb = LLVMGetNextBasicBlock(bb)) {
            for (LLVMValueRef inst = LLVMGetFirstInstruction(bb); inst != null; inst = LLVMGetNextInstruction(inst)) {
                int operandNum = LLVMGetNumOperands(inst);

                List<LLVMValueRef> varsLst = new ArrayList<>();
                varsLst.add(inst);
                for (int i = 0; i < operandNum; ++i) {
                    varsLst.add(LLVMGetOperand(inst, i));
                }

                for (LLVMValueRef llvmValueRef : varsLst) {
                    if (LLVMGetValueName(llvmValueRef).getString().isEmpty()
                        || LLVMIsAGlobalValue(llvmValueRef) != null
                        || LLVMIsAConstantInt(llvmValueRef) != null) {
                        continue;
                    }
                    if (intervals.containsKey(llvmValueRef)) {
                        intervals.get(llvmValueRef).endPoint = point;
                    } else {
                        intervals.put(llvmValueRef, new Interval(point, point, llvmValueRef));
                    }
                }

                ++point;
            }
        }
    }

    public void visualize() {
        // 提取键值对 并按 startPoint 排序
        List<Map.Entry<LLVMValueRef, Interval>> entryList = new ArrayList<>(intervals.entrySet());
        entryList.sort(Comparator.comparingInt(entry -> entry.getValue().getStartPoint()));

        // 算法流程:
        for (Map.Entry<LLVMValueRef, Interval> entry : entryList) {
            Interval interval = entry.getValue();
            System.out.print(String.format("(%3s)", locationMap.get(interval.llvmValueRef).getData()));
            System.out.println(interval);
        }
    }

    private class Interval {
        private int startPoint;
        private int endPoint;
        private LLVMValueRef llvmValueRef;

        public Interval(int startPoint, int endPoint, LLVMValueRef llvmValueRef) {
            this.startPoint = startPoint;
            this.endPoint = endPoint;
            this.llvmValueRef = llvmValueRef;
        }

        private int getStartPoint() {
            return startPoint;
        }

        private int getEndPoint() {
            return endPoint;
        }

        @Override
        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append(String.format("%6s[%3d, %3d]: ", LLVMGetValueName(llvmValueRef).getString(), startPoint, endPoint));
            for (int i = 0; i < startPoint; ++i) {
                sb.append(" ");
            }
            sb.append("|");
            for (int i = startPoint + 1; i < endPoint; ++i) {
                sb.append("-");
            }
            sb.append("|");
            return sb.toString();
        }
    }
}
