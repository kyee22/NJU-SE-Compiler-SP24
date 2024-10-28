package type;

public class VoidType extends Type {
    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || !(o instanceof VoidType)) {
            return false;
        }
        return true;
    }
}
