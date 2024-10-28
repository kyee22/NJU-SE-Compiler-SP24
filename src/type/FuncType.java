package type;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public class FuncType extends Type {
    private Type returnType;  // 函数的返回类型
    private List<Type> paramsType;  // 函数的参数类型列表
    private List<String> paramsName;

    public FuncType(Type returnType, List<Type> paramsType, List<String> paramsName) {
        this.returnType = returnType;
        this.paramsType = paramsType;
        this.paramsName = paramsName;
    }

    public Type getReturnType() {
        return returnType;
    }

    public List<Type> getParamsType() {
        return paramsType;
    }

    public List<String> getParamsName() {
        return paramsName;
    }

    @Override
    public String toString() {
        return "FUNCTION returning " + returnType.toString() + " with parameters " + paramsType.toString();
    }
}
