package type;

import java.util.List;

public class ArrayType extends Type {
    private Type contained; // 元素类型，可能是基本类型或另一个数组
    private int dimensions; // 数组的维度

    public ArrayType(Type contained, int dimensions) {
        this.contained = contained;
        this.dimensions = dimensions;
    }

    public Type getContained() {
        return contained;
    }

    public int getDimensions() {
        return dimensions;
    }

    @Override
    public String toString() {
        return "ArrayType{" +
                "contained=" + contained +
                ", dimensions=" + dimensions +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (o == this) {
            return true;
        }
        if (o == null || !(o instanceof ArrayType)) {
            return false;
        }

        return dimensions == ((ArrayType) o).getDimensions();
    }
}
