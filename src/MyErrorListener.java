import org.antlr.v4.runtime.BaseErrorListener;
import org.antlr.v4.runtime.RecognitionException;
import org.antlr.v4.runtime.Recognizer;

import javax.swing.*;
import java.lang.reflect.Type;
import java.util.ArrayList;

public class MyErrorListener extends BaseErrorListener {
    private boolean hasError;
    private ArrayList<String> errorInfo;
    private String  type;

    public MyErrorListener(String type) {
        super();
        this.hasError = false;
        this.errorInfo = new ArrayList<>();
        this.type = type;
    }

    /**
     *  · Lab 1
     *  · Lab 2 Part 1
     */

    @Override
    public void syntaxError(Recognizer<?, ?> recognizer, Object offendingSymbol,
                            int line, int charPositionInLine, String msg, RecognitionException e) {
        hasError = true;
        errorInfo.add("Error type " + type + " at Line " + line + ": " + msg + ".");
    }

    public boolean hasError() {
        return hasError;
    }

    public void printErrorInfo() {
        for (String s : errorInfo) {
            if (type.equals("A")) {
                System.err.println(s);
            } else {
                System.out.println(s);
            }
        }
    }
}