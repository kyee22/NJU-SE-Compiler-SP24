package tool;


import java.util.*;

public class REPORTER {
    private static Map<Integer, TypeError> reported = new HashMap<>();
    private static TypeError[] acceptDupErrorList = {
            TypeError.REDEF_VAR,// 1
            //TypeError.UNDEF_VAR,// 3
            //TypeError.MISMATCHED_OPRAND,//6
            //TypeError.MISMATCHED_ARG,// 8 ×
            //TypeError.ILLEGAL_ARRAY_ACCESS,// 9
            //TypeError.CALL_NON_FUNC,// 10
            //TypeError.UNDEF_FUNC,//2
    };
    private static Set<TypeError> acceptDupError = new HashSet<>(Arrays.asList(acceptDupErrorList));

    public static void report(int lineNo, TypeError typeError, String name) {
        if (!reported.containsKey(lineNo) || (reported.get(lineNo) == typeError && acceptDupError.contains(typeError))) {
            System.err.print("Error type " + typeError.getValue() + " at Line " + lineNo + ": ");
            printMessage(typeError, name);
            reported.put(lineNo, typeError);
        }
    }

    private static void printMessage(TypeError typeError, String name) {
        String message;
        switch (typeError) {
            case UNDEF_VAR://1
                message = "Undefined variable: " + name + ".";
                break;
            case UNDEF_FUNC://2
                message = "Undefined function: " + name + ".";
                break;
            case REDEF_FUNC://3
                message = "Redefined function: " + name + ".";
                break;
            case REDEF_VAR://4
                message = "Redefined variable: " + name + ".";
                break;
            case MISMATCHED_ASSIGN://5
                message = "Type mismatched for assignment.";
                break;
            case MISMATCHED_OPRAND://6
                message = "Type mismatched for operands.";
                break;
            case MISMATCHED_RET://7
                message = "Type mismatched for return.";
                break;
            case MISMATCHED_ARG://8
                message = "Function is not applicable for arguments.";
                break;
            case ILLEGAL_ARRAY_ACCESS://9
                message = "Illegal array access: " + name + ".";
                break;
            case CALL_NON_FUNC://10
                message = "Not a function: " + name + ".";
                break;
            case ASSIGN_TO_NON_LVALUE://11
                message = "Illegal assignment to Non-LValue " + name + ".";
                break;
            default:
                message = "";
                break;
        }
        System.err.println(message);
    }

    public static void summary() {
        if (reported.isEmpty()) {
            System.err.println("No semantic errors in the program!");
        }
    }
}
