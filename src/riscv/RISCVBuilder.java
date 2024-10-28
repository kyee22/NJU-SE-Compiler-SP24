package riscv;

public class RISCVBuilder {
    public static final String REG_A0 = "a0";
    public static final String REG_A1 = "a1";
    public static final String REG_A2 = "a2";
    public static final String REG_A3 = "a3";
    public static final String REG_A4 = "a4";
    public static final String REG_A5 = "a5";
    public static final String REG_A6 = "a6";
    public static final String REG_A7 = "a7";
    public static final String REG_T0 = "t0";
    public static final String REG_T1 = "t1";
    public static final String REG_T2 = "t2";
    public static final String REG_T3 = "t3";
    public static final String REG_T4 = "t4";
    public static final String REG_T5 = "t5";
    public static final String REG_T6 = "t6";
    public static final String REG_S0 = "s0";
    public static final String REG_S1 = "s1";
    public static final String REG_S2 = "s2";
    public static final String REG_S3 = "s3";
    public static final String REG_S4 = "s4";
    public static final String REG_S5 = "s5";
    public static final String REG_S6 = "s6";
    public static final String REG_S7 = "s7";
    public static final String REG_S8 = "s8";
    public static final String REG_S9 = "s9";
    public static final String REG_S10 = "s10";
    public static final String REG_S11 = "s11";
    public static final String REG_GP = "gp";
    public static final String REG_SP = "sp";
    public static final String REG_FP = "fp";
    public static final String REG_RA = "ra";
    public static final String REG_ZERO = "zero";
    public static final String INSTR_ADDI =  "addi";
    public static final String INSTR_ADD = "add";
    public static final String INSTR_SUB = "sub";
    public static final String INSTR_MUL = "mul";
    public static final String INSTR_DIV = "div";
    public static final String INSTR_REM = "rem";
    public static final String INSTR_LI = "li";
    public static final String INSTR_LA = "la";
    public static final String INSTR_MV = "mv";
    public static final String INSTR_ECALL = "ecall";

    public static String SYS_EXIT2 = "93";
    private StringBuilder sb;

    public RISCVBuilder() {
        this.sb = new StringBuilder();
    }


    public void buildSeg(String segName) {
        sb.append("\n\t." + segName + "\n");
    }

    public void buildLabel(String label) {
        sb.append(label + ":\n");
    }

    public void buildGlobal(String label) {
        sb.append("\t.globl " + label + "\n");
    }

    public void buildData(String varName, String value) {
        buildSeg("data");
        sb.append(varName + ":\n");
        sb.append("\t.word " + value + "\n");
    }

    public void buildOp0(String op) {
        sb.append("\t" + op + "\n");
    }


    public void buildOp1(String op, String oprand1) {
        sb.append(String.format("\t%-6s %s\n", op, oprand1));
        //sb.append("\t" + op + " " + oprand1 + "\n");
    }

    public void buildOp2(String op, String oprand1, String oprand2) {
        sb.append(String.format("\t%-6s %s %s\n", op, oprand1, oprand2));
        //sb.append("\t" + op + " " + oprand1 + " " + oprand2 + "\n");
    }

    public void buildLD(String reg, String base, String offset) {
        sb.append(String.format("\t%-6s %s %s(%s)\n", "lw", reg, offset, base));
        //sb.append("\t" + "lw " + reg + " " + offset + "(" + base + ")\n");
    }

    public void buildST(String reg, String base, String offset) {
        sb.append(String.format("\t%-6s %s %s(%s)\n", "sw", reg, offset, base));
        //sb.append("\t" + "sw " + reg + " " + offset + "(" + base + ")\n");
    }


    public void buildOp3(String op, String oprand1, String oprand2, String oprand3) {
        sb.append(String.format("\t%-6s %s %s %s\n", op, oprand1, oprand2, oprand3));
        //sb.append("\t" + op + " " + oprand1 + " " + oprand2 + " " + oprand3 + "\n");
    }

    public String dump() {
        return sb.toString();
    }
}
