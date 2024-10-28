import org.bytedeco.llvm.LLVM.*;
import ra.BaseRegisterAllocator;
import ra.LinearScanRegisterAllocator;
import ra.Location;
import ra.RegisterAllocator;
import riscv.RISCVBuilder;
import tool.DEBUGGER;
import static riscv.RISCVBuilder.*;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

import static org.bytedeco.llvm.global.LLVM.*;

public class RISCVGenerator {

    private RISCVBuilder builder = new RISCVBuilder();

    public void engine(LLVMModuleRef module) {
        for (LLVMValueRef value = LLVMGetFirstGlobal(module); value != null; value = LLVMGetNextGlobal(value)) {
            String varName = LLVMGetValueName(value).getString();
            String valueStr = String.valueOf(LLVMConstIntGetSExtValue(LLVMGetInitializer(value)));
            builder.buildData(varName, valueStr);
        }

        builder.buildSeg("text");
        builder.buildGlobal("main");
        builder.buildLabel("main");

        for (LLVMValueRef func = LLVMGetFirstFunction(module); func != null; func = LLVMGetNextFunction(func)) {

            RegisterAllocator allocator = new LinearScanRegisterAllocator();
            int stackSize = allocator.allocate(func);
            builder.buildOp3(INSTR_ADDI, REG_SP, REG_SP, String.valueOf(-stackSize));

            for (LLVMBasicBlockRef bb = LLVMGetFirstBasicBlock(func); bb != null; bb = LLVMGetNextBasicBlock(bb)) {
                for (LLVMValueRef inst = LLVMGetFirstInstruction(bb); inst != null; inst = LLVMGetNextInstruction(inst)) {
                    switch (LLVMGetInstructionOpcode(inst)) {
                        case LLVMRet:
                            doReturn(allocator, inst, stackSize);
                            break;
                        case LLVMAdd:
                            doArithmetical(allocator, inst, INSTR_ADD);
                            break;
                        case LLVMSub:
                            doArithmetical(allocator, inst, INSTR_SUB);
                            break;
                        case LLVMMul:
                            doArithmetical(allocator, inst, INSTR_MUL);
                            break;
                        case LLVMSDiv:
                            doArithmetical(allocator, inst, INSTR_DIV);
                            break;
                        case LLVMSRem:
                            doArithmetical(allocator, inst, INSTR_REM);
                            break;
                        case LLVMStore:
                            doStore(allocator, inst);
                            break;
                        case LLVMLoad:
                            doLoad(allocator, inst);
                            break;
                        default:
                            break;
                    }
                }

            }
        }
    }

    private void doReturn(RegisterAllocator allocator, LLVMValueRef inst, int stackSize) {
        LLVMValueRef retValue = LLVMGetOperand(inst, 0);
        Location location = allocator.resolveOprand(retValue);
        if (location.isMem()) {
            builder.buildLD(REG_T0, REG_SP, location.getData());
        } else if (location.isImm()) {
            builder.buildOp2(INSTR_LI, REG_T0, location.getData());
        }
        String reg = location.isMem() ? REG_T0 :
                     location.isImm() ? REG_T0 : location.getData();

        builder.buildOp3(INSTR_ADDI, REG_SP, REG_SP, String.valueOf(stackSize));
        builder.buildOp2(INSTR_MV, REG_A0, reg);
        builder.buildOp2(INSTR_LI, REG_A7, SYS_EXIT2);
        builder.buildOp0(INSTR_ECALL);
    }

    private void doArithmetical(RegisterAllocator allocator, LLVMValueRef inst, String op) {
        LLVMValueRef oprand1 = LLVMGetOperand(inst, 0);
        LLVMValueRef oprand2 = LLVMGetOperand(inst, 1);
        Location location1 = allocator.resolveOprand(oprand1);
        Location location2 = allocator.resolveOprand(oprand2);
        Location location3 = allocator.resolveOprand(inst);

        if (location1.isMem()) {
            builder.buildLD(REG_T0, REG_SP, location1.getData());
        } else if (location1.isImm()) {
            builder.buildOp2(INSTR_LI, REG_T0, location1.getData());
        }
        String rs1 = location1.isMem() ? REG_T0 :
                     location1.isImm() ? REG_T0 : location1.getData();

        if (location2.isMem()) {
            builder.buildLD(REG_T1, REG_SP, location2.getData());
        } else if (location2.isImm()) {
            builder.buildOp2(INSTR_LI, REG_T1, location2.getData());
        }
        String rs2 = location2.isMem() ? REG_T1 :
                     location2.isImm() ? REG_T1 : location2.getData();

        String rd = location3.isMem() ? REG_T0
                                      : location3.getData();
        builder.buildOp3(op, rd, rs1, rs2);

        if (location3.isMem()) {
            builder.buildST(REG_T0, REG_SP, location3.getData());
        }
    }

    private void doStore(RegisterAllocator allocator, LLVMValueRef inst) {
        LLVMValueRef oprand1 = LLVMGetOperand(inst, 0);
        LLVMValueRef oprand2 = LLVMGetOperand(inst, 1);
        Location location1 = allocator.resolveOprand(oprand1);
        Location location2 = allocator.resolveOprand(oprand2);

        if (location1.isImm()) {
            builder.buildOp2(INSTR_LI, REG_T0, location1.getData());
        } else if (location1.isMem()) {
            builder.buildLD(REG_T0, REG_SP, location1.getData());
        }
        String reg = location1.isImm() ? REG_T0 :
                     location1.isMem() ? REG_T0 : location1.getData();

        if (location2.isGlb()) {
            builder.buildOp2(INSTR_LA, REG_T1, location2.getData());
            builder.buildST(reg, REG_T1, "0");
        } else if (location2.isMem()) {
            builder.buildST(reg, REG_SP, location2.getData());
        } else {
            builder.buildOp2(INSTR_MV, location2.getData(), reg);
        }
    }

    private void doLoad(RegisterAllocator allocator, LLVMValueRef inst) {
        LLVMValueRef oprand2 = LLVMGetOperand(inst, 0);
        Location location1 = allocator.resolveOprand(inst);
        Location location2 = allocator.resolveOprand(oprand2);

        String reg = location1.isMem() ? REG_T0
                                       : location1.getData();
        if (location2.isGlb()) {
            builder.buildOp2(INSTR_LA, REG_T1, location2.getData());
            builder.buildLD(reg, REG_T1, "0");
        } else if (location2.isMem()) {
            builder.buildLD(reg, REG_SP, location2.getData());
        } else {
            builder.buildOp2(INSTR_MV, reg, location2.getData());
        }

        if (location1.isMem()) {
            builder.buildST(REG_T0, REG_SP, location1.getData());
        }
    }

    public void dump(String path) {
        DEBUGGER.println("⏳  dump asm into " + path + " ...");
        String code = builder.dump();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(path))) {
            writer.write(code);
            DEBUGGER.println("🌟 dump done. ");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
