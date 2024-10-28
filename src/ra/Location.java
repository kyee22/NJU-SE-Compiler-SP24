package ra;

public class Location {
    private enum Kind {
        REG,
        MEM,
        IMM,
        GLB,
    }

    private Kind kind;
    private String data;

    private Location(Kind kind, String data) {
        this.kind = kind;
        this.data = data;
    }

    public static Location makeMemLocation(int offset) {
        return new Location(Kind.MEM, String.valueOf(offset));
    }

    public static Location makeImmLocation(long immdiate) {
        return new Location(Kind.IMM, String.valueOf(immdiate));
    }

    public static Location makeGlbLocation(String label) {
        return new Location(Kind.GLB, label);
    }

    public static Location makeRegLocation(String reg) {
        return new Location(Kind.REG, reg);
    }

    public boolean isMem() {
        return this.kind == Kind.MEM;
    }

    public boolean isImm() {
        return this.kind == Kind.IMM;
    }

    public boolean isReg() {
        return this.kind == Kind.REG;
    }

    public boolean isGlb() {
        return this.kind == Kind.GLB;
    }

    public String getData() {
        return data;
    }
}
