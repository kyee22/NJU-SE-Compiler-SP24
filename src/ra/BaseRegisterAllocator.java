package ra;

import org.bytedeco.llvm.LLVM.LLVMBasicBlockRef;
import org.bytedeco.llvm.LLVM.LLVMValueRef;

import java.util.*;

import static org.bytedeco.llvm.global.LLVM.*;
import static org.bytedeco.llvm.global.LLVM.LLVMSRem;

public class BaseRegisterAllocator implements RegisterAllocator {
    private Map<LLVMValueRef, Location> map = new HashMap<>();

    @Override
    public int allocate(LLVMValueRef func) {
        Set<LLVMValueRef> varsSet = new HashSet<>();
        for (LLVMBasicBlockRef bb = LLVMGetFirstBasicBlock(func); bb != null; bb = LLVMGetNextBasicBlock(bb)) {
            for (LLVMValueRef inst = LLVMGetFirstInstruction(bb); inst != null; inst = LLVMGetNextInstruction(inst)) {
                int operandNum = LLVMGetNumOperands(inst);

                List<LLVMValueRef> varsLst = new ArrayList<>();

                varsLst.add(inst);
                for (int i = 0; i < operandNum; ++i) {
                    varsLst.add(LLVMGetOperand(inst, i));
                }

                for (LLVMValueRef llvmValueRef : varsLst) {
                    String var = LLVMGetValueName(llvmValueRef).getString();
                    if (var.isEmpty()) {
                        continue;
                    }
                    if (LLVMIsAGlobalValue(llvmValueRef) != null) {
                        continue;
                    }
                    if (LLVMIsAConstantInt(llvmValueRef) != null) {
                        continue;
                    }
                    if (varsSet.contains(llvmValueRef)) {
                        continue;
                    }
                    varsSet.add(llvmValueRef);
                }

            }
        }

        int offset = 0;
        for (LLVMValueRef llvmValueRef : varsSet) {
            map.put(llvmValueRef, Location.makeMemLocation(offset));
            offset += 4;
        }

        return varsSet.size() * 4;
    }



    @Override
    public Location resolveOprand(LLVMValueRef oprand) {
        if (LLVMIsAConstantInt(oprand) != null) {
            return Location.makeImmLocation(LLVMConstIntGetSExtValue(oprand));
        }
        if (LLVMIsAGlobalValue(oprand) != null) {
            return Location.makeGlbLocation(LLVMGetValueName(oprand).getString());
        }
        if (!map.containsKey(oprand)) {
            throw new IllegalArgumentException("No such a oprand: " + LLVMGetValueName(oprand).getString());
        }

        return map.get(oprand);
    }
}
