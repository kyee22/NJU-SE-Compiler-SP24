package tool;

import type.Type;

import java.util.concurrent.TimeUnit;

public enum TypeError {
    UNDEF_VAR(1),
    UNDEF_FUNC(2),
    REDEF_VAR(3),
    REDEF_FUNC(4),
    MISMATCHED_ASSIGN(5),
    MISMATCHED_OPRAND(6),
    MISMATCHED_RET(7),
    MISMATCHED_ARG(8),
    ILLEGAL_ARRAY_ACCESS(9),
    CALL_NON_FUNC(10),
    ASSIGN_TO_NON_LVALUE(11);

    private final int value;

    // 枚举的构造函数，必须是私有的
    private TypeError(int value) {
        this.value = value;
    }

    // 获取枚举常量的值
    public int getValue() {
        return value;
    }

}
