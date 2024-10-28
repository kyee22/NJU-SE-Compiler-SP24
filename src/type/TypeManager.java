package type;

import java.util.List;

public class TypeManager {
    public Type makeVoidType() {
        return new VoidType();
    }

    public Type makeIntType() {
        return new IntType();
    }

    public Type makeArrayType(Type elemType, int dimen) {
        return new ArrayType(elemType, dimen);
    }

    public Type makeNestedArrayType(int dimen) {
        Type type = makeIntType();
        for (int i = 1; i <= dimen; ++i) {
            type = makeArrayType(type, i);
        }
        return type;
    }

    public Type makeFuncType(Type retType, List<Type> paramsType, List<String> paramsName) {
        return new FuncType(retType, paramsType, paramsName);
    }

    public boolean isIntType(Type type) {
        if (type == null) {
            return false;
        }

        return type instanceof IntType;
    }

    public boolean isFuncType(Type type) {
        if (type == null) {
            return false;
        }
        return type instanceof FuncType;
    }

    public boolean isArrayType(Type type) {
        if (type == null) {
            return false;
        }
        return type instanceof ArrayType;
    }

    public boolean isVoidType(Type type) {
        if (type == null) {
            return false;
        }
        return type instanceof VoidType;
    }
}
