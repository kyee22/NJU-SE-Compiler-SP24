package tool;

public class DEBUGGER {
    public static boolean MODE_ON;

    public static void println(String message) {
        if (MODE_ON) {
            System.out.println(message);
        }
    }

}
