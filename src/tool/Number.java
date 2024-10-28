package tool;

public class Number {
    public static int parseInteger(String text) {
        if (text.startsWith("0x") || text.startsWith("0X")) {
            return Integer.parseInt(text.substring(2), 16);
        } else if (text.startsWith("0") && text.length() > 1) {
            return Integer.parseInt(text.substring(1), 8);
        } else {
            return Integer.parseInt(text);
        }
    }
}

