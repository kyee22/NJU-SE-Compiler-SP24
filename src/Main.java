import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.Token;
import org.bytedeco.llvm.LLVM.*;

import org.stringtemplate.v4.ST;
import tool.Color;
import tool.DEBUGGER;
import tool.PRINTER;

import static org.bytedeco.llvm.global.LLVM.*;

import java.io.IOException;

public class Main {
    private static final int LAB = 6;

    public static void buildWorld() {
        LLVMInitializeCore(LLVMGetGlobalPassRegistry());
        LLVMLinkInMCJIT();
        LLVMInitializeNativeAsmPrinter();
        LLVMInitializeNativeAsmParser();
        LLVMInitializeNativeTarget();

        DEBUGGER.MODE_ON = true;
    }

    public static void main(String[] args) throws IOException {
        if (LAB <= 3 && args.length != 1) {
            PRINTER.println("Expected 1 argument but provided " + args.length + " arguments", Color.BRIGHT_RED);
            PRINTER.println("Usage: <INPUT_PATH>", Color.BRIGHT_RED);
        }
        if (LAB >= 4 && args.length != 2) {
            PRINTER.println("Expected 2 arguments but provided " + args.length + " arguments", Color.BRIGHT_RED);
            PRINTER.println("Usage: <INPUT_PATH> <OUTPUT_PATH>", Color.BRIGHT_RED);
        }
        // input Char Stream
        CharStream input = CharStreams.fromFileName(args[0]);

        buildWorld();

        /** Lab 1: Lexer 实验
         *      词法分析:
         *          (1) 错误处理和 token 输出.
         */
        // make Lexer
        SysYLexer sysYLexer = new SysYLexer(input);
        MyErrorListener myLexerErrorListener = new MyErrorListener("A");
        sysYLexer.removeErrorListeners();
        sysYLexer.addErrorListener(myLexerErrorListener);

        // Lexer: Char Streams ----> Tokens
        CommonTokenStream tokens = new CommonTokenStream(sysYLexer);
        if (myLexerErrorListener.hasError()) {
            myLexerErrorListener.printErrorInfo();
        }

        // make Parser
        SysYParser sysYParser = new SysYParser(tokens);
        MyErrorListener myParserErrorListener = new MyErrorListener("B");
        sysYParser.removeErrorListeners();
        sysYParser.addErrorListener(myParserErrorListener);

        // Parser: Tokens ----> AST
        ParseTree tree = sysYParser.program();

        switch (LAB) {
            case 2:
                /** Lab 2: Parser 实验
                 *      语法分析:
                 *          (1) 错误处理;
                 *          (2) 代码高亮;
                 *          (3) 代码格式化.
                 */
                SysYHighlightFormatVisitor visitor = new SysYHighlightFormatVisitor();
                if (myParserErrorListener.hasError()) {
                    myParserErrorListener.printErrorInfo();
                    return;
                }
                visitor.visit(tree);
                break;

            case 3:
                /** Lab3: Type Check 实验
                 *      语义分析:
                 *          (1) 类型检查.
                 */
                SysYTypeCheckVisitor typeCheckVisitor = new SysYTypeCheckVisitor();
                typeCheckVisitor.visit(tree);
                break;

            case 4:
            case 5:
            case 6:
                /** Lab4: IR 实验
                 *      LLVM IR 生成:
                 *          (1) 翻译 main 函数和表达式;
                 *          (2) 翻译局部变量和全局变量.
                 */
                /** Lab5: IR 实验
                 *      LLVM IR 生成:
                 *          (1) 函数定义与调用;
                 *          (2) 流程控制.
                 */
                SysYGenLLVMIRVisitor sysYGenLLVMIRVisitor = new SysYGenLLVMIRVisitor();
                sysYGenLLVMIRVisitor.visit(tree);

                if (LAB == 4 || LAB == 5) {
                    sysYGenLLVMIRVisitor.dump(args[1]);
                    break;
                }

                /** Lab6: Code Gen 实验
                 *      RISC-V 目标代码生成和寄存器分配:
                 *          (1) main 函数和表达式;
                 *          (2) 局部变量和全局变量;
                 *          (3) 线性扫描寄存器分配算法.
                 */
                if (DEBUGGER.MODE_ON) {
                    String irpath = args[1].replace(".asm", ".ll")
                                           .replace("asm", "ir");
                    sysYGenLLVMIRVisitor.dump(irpath);
                }
                LLVMModuleRef ir = sysYGenLLVMIRVisitor.result();
                RISCVGenerator riscvGenerator = new RISCVGenerator();
                riscvGenerator.engine(ir);
                riscvGenerator.dump(args[1]);
                break;

            default:
                break;

        }
    }



    public static void printTokenFormat(Token token) {
        String tokenType = SysYLexer.VOCABULARY.getSymbolicName(token.getType());
        String tokenText = token.getText();
        String fixedText;
        if (tokenText.startsWith("0x") || tokenText.startsWith("0X")) {
            fixedText = String.valueOf(Integer.parseInt(tokenText.substring(2), 16));
        } else if (tokenText.startsWith("0") && tokenText.length() > 1) {
            fixedText = String.valueOf(Integer.parseInt(tokenText.substring(1), 8));
        } else {
            fixedText = tokenText;
        }
        System.err.println(tokenType + " " + fixedText + " at Line " + token.getLine() + ".");
    }
}
