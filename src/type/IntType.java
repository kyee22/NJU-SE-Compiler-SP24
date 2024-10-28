package type;

public class IntType extends Type {
    @Override
    public String toString() {
        return "INT";
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || !(o instanceof IntType)) {
            return false;
        }
        return true;
    }
}
