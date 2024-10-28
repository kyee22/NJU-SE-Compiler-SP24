
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.RuleNode;
import org.antlr.v4.runtime.tree.TerminalNode;
import org.antlr.v4.runtime.Token;
import tool.Color;
import tool.PRINTER;

public class SysYHighlightFormatVisitor extends SysYParserBaseVisitor<Void> {
    private int indentation = 0;
    private boolean indentationFlag = false;
    private boolean insideDeclaration = false;
    private Color currentColor = null;
    private Color[] rainbowTab = {Color.BRIGHT_RED, Color.BRIGHT_GREEN, Color.BRIGHT_YELLOW,
                                  Color.BRIGHT_BLUE, Color.BRIGHT_MAGENTA, Color.BRIGHT_CYAN};
    private int rainbowTabIndex = 0;
    private boolean isHaedLine = true;
    private int indentationLevel = 0;



    @Override
    public Void visitTerminal(TerminalNode node) {
        Token token = node.getSymbol();
        if (token.getType() == SysYParser.EOF) {
            return null;
        }

        /** Lab2 Part 2&3 Phase 1:
         *      不考虑颜色和格式：筛除空白符后与标准答案相同，则得10%分数
         */
        //System.out.print(token.getText() + " ");  // phase 1

        flushIndentation();
        doPreSpace(node);
        doColorHighlight(node);
        doPostSpace(node);
        doNewline(node);

        return null;
    }
    
    private void flushIndentation() {
        if (indentationFlag) {
            PRINTER.printIndentaion(indentationLevel);
            indentationFlag = false;
        }
    }

    /** Lab2 Part 2&3 Phase 2:
     *      仅考虑颜色：除空白符外，每个字符的颜色与标准答案相同，则得40%分数
     */
    private void doColorHighlight(TerminalNode node) {
        Token token = node.getSymbol();

        switch (token.getType()) {
            case SysYLexer.CONST:
            case SysYLexer.INT:
            case SysYLexer.VOID:
            case SysYLexer.IF:
            case SysYLexer.ELSE:
            case SysYLexer.WHILE:
            case SysYLexer.BREAK:
            case SysYLexer.CONTINUE:
            case SysYLexer.RETURN:
                PRINTER.print(token.getText(), Color.BRIGHT_CYAN, insideDeclaration);
                break;

            case SysYLexer.PLUS:
            case SysYLexer.MINUS:
            case SysYLexer.MUL:
            case SysYLexer.DIV:
            case SysYLexer.MOD:
            case SysYLexer.ASSIGN:
            case SysYLexer.EQ:
            case SysYLexer.NEQ:
            case SysYLexer.LT:
            case SysYLexer.GT:
            case SysYLexer.LE:
            case SysYLexer.GE:
            case SysYLexer.NOT:
            case SysYLexer.AND:
            case SysYLexer.OR:
            case SysYLexer.COMMA:
            case SysYLexer.SEMICOLON:
                PRINTER.print(token.getText(), Color.BRIGHT_RED, insideDeclaration);
                break;

            case SysYLexer.L_PAREN:
            case SysYLexer.L_BRACKT:
            case SysYLexer.L_BRACE:
                PRINTER.print(token.getText(), pushRainbowColor(), insideDeclaration);
                break;

            case SysYLexer.R_PAREN:
            case SysYLexer.R_BRACKT:
            case SysYLexer.R_BRACE:
                PRINTER.print(token.getText(), popRainbowColor(), insideDeclaration);
                break;
                
            default:
                if (currentColor != null) {
                    PRINTER.print(token.getText(), currentColor, insideDeclaration);
                } else {
                    PRINTER.print(token.getText());
                }
        }
    }


    /** Lab2 Part 2&3 Phase 3:
     *      仅考虑格式：每行格式均与标准答案相同，则得40%分数
     */
    private void doPostSpace(TerminalNode node) {
        Token token = node.getSymbol();
        ParseTree parent = node.getParent();

        switch (token.getType()) {
            // Lab 2 Phase 3 "comma followed by space"
            case SysYLexer.COMMA:
                PRINTER.print(" ");
                break;

            // Lab 2 Phase 3 "keyword followed by space"
            case SysYLexer.CONST:
            case SysYLexer.INT:
            case SysYLexer.VOID:
            case SysYLexer.IF:
            //case SysYLexer.ELSE:
            case SysYLexer.WHILE:
                PRINTER.print(" ");
                break;
            case SysYLexer.RETURN:
                assert (parent instanceof SysYParser.ReturnStatementContext);
                SysYParser.ReturnStatementContext stmtCtx = (SysYParser.ReturnStatementContext) parent;
                if (stmtCtx.exp() != null) {
                    PRINTER.print(" ");
                }
                break;

            // TODO else紧接换行的话不用空格
            case SysYLexer.ELSE: {
                boolean flag = true;
                int index = 0;
                for (; index < parent.getChildCount(); ++index) {
                    if (parent.getChild(index) == node) {
                        break;
                    }
                }
                if (index < parent.getChildCount() - 1) {
                    ParseTree nextSibling = parent.getChild(index + 1);
                    if ((nextSibling instanceof SysYParser.AssignStatementContext)
                            || (nextSibling instanceof SysYParser.ExprStatementContext)
                            || (nextSibling instanceof SysYParser.BreakStatementContext)
                            || (nextSibling instanceof SysYParser.ContinueStatementContext)
                            || (nextSibling instanceof SysYParser.ReturnStatementContext)
                            || (nextSibling instanceof SysYParser.WhileStatementContext)) {
                        // 当前节点右边的第一个兄弟节点不是 blockStatement
                        flag = false;
                    }
                }
                if (flag) {
                    PRINTER.print(" ");
                }
                break;
            }

            // Lab 2 Phase 3 "binary-op followed by space"
            case SysYLexer.PLUS:
            case SysYLexer.MINUS:
                if (((RuleNode)parent).getRuleContext().getRuleIndex() != SysYParser.RULE_unaryOp) {
                    PRINTER.print(" ");
                }
                break;
            case SysYLexer.MUL:
            case SysYLexer.DIV:
            case SysYLexer.MOD:
            case SysYLexer.ASSIGN:
            case SysYLexer.EQ:
            case SysYLexer.NEQ:
            case SysYLexer.LT:
            case SysYLexer.LE:
            case SysYLexer.GE:
            case SysYLexer.GT:
            case SysYLexer.AND:
            case SysYLexer.OR:
                PRINTER.print(" ");
                break;

            default:
                break;
        }
    }

    private void doPreSpace(TerminalNode node) {
        Token token = node.getSymbol();
        ParseTree parent = node.getParent();

        switch (token.getType()) {
            // Lab 2 Phase 3 "space before binary-op"
            case SysYLexer.PLUS:
            case SysYLexer.MINUS:
                if (((RuleNode)parent).getRuleContext().getRuleIndex() != SysYParser.RULE_unaryOp) {
                    PRINTER.print(" ");
                }
                break;
            case SysYLexer.MUL:
            case SysYLexer.DIV:
            case SysYLexer.MOD:
            case SysYLexer.ASSIGN:
            case SysYLexer.EQ:
            case SysYLexer.NEQ:
            case SysYLexer.LT:
            case SysYLexer.LE:
            case SysYLexer.GE:
            case SysYLexer.GT:
            case SysYLexer.AND:
            case SysYLexer.OR:
                PRINTER.print(" ");
                break;

            //// Lab 2 Phase 3 "space before funcName"
            //case SysYLexer.IDENT:
            //    if ((parent instanceof SysYParser.FuncNameContext)
            //        && (parent.getParent() instanceof SysYParser.FuncDefContext)) {
            //        PRINTER.print(" ");
            //    }
            //    break;

            // Lab 2 Phase 3 "space before L_BRACE"
            case SysYLexer.L_BRACE:
                boolean flag = true; // '{' 前不需要加空格的情况??

                // case 1) 单独存在的代码块的左花括号单独一行，且前面没有额外的空格
                if ((parent instanceof SysYParser.BlockContext)
                    && (parent.getParent() != null && parent.getParent() instanceof SysYParser.BlockStatementContext)
                    && (parent.getParent().getParent() != null && parent.getParent().getParent() instanceof SysYParser.BlockItemContext)) {
                    flag = false;
                }
                // case 2) 每条声明语句中的花括号都在同一行，即使它们存在嵌套关系（如{{1, 2, 3}, {1, 2, 3}};）
                //if (parent instanceof SysYParser.InitValContext) { // buggy!
                if (parent instanceof SysYParser.InitValContext || parent instanceof SysYParser.ConstInitValContext) {
                    flag = false;
                }
                // case 3) 'else' 和 '{' 只有一个空格 (doPostSpace 已经在 else 之后加了一个空格)
                if ((parent instanceof SysYParser.BlockContext)
                        && (parent.getParent() != null && parent.getParent() instanceof  SysYParser.BlockStatementContext)
                        && (parent.getParent().getParent() != null && parent.getParent().getParent() instanceof SysYParser.IfStatementContext)) {
                    SysYParser.IfStatementContext grandgrandParent = (SysYParser.IfStatementContext) parent.getParent().getParent();
                    int index = 0;
                    for (; index < grandgrandParent.getChildCount(); ++index) {
                        if (grandgrandParent.getChild(index) == parent.getParent()) {
                            break;
                        }
                    }
                    if (index > 0) {
                        ParseTree previousSibling = grandgrandParent.getChild(index - 1);
                        if (previousSibling instanceof TerminalNode) {
                            TerminalNode terminalNode = (TerminalNode) previousSibling;
                            if (terminalNode.getSymbol().getType() == SysYLexer.ELSE) {
                                flag = false;
                                //System.out.println("L_BRACE after ELSE");
                            }
                        }
                    }
                }
                if (flag) {
                    PRINTER.print(" ");
                }
                break;

            default:
                break;
        }

    }

    private void doNewline(TerminalNode node) {
        Token token = node.getSymbol();
        ParseTree parent = node.getParent();


        switch (token.getType()) {
            case SysYLexer.L_BRACE:         // 换行 (1/5)
            case SysYLexer.R_BRACE:         // 换行 (2/5)
                if (!(parent instanceof SysYParser.InitValContext || parent instanceof SysYParser.ConstInitValContext)) {
                    PRINTER.println("");
                    isHaedLine = false;
                    indentationFlag = true;
                }
                break;

            case SysYLexer.SEMICOLON:       // 换行 (3/5)
                PRINTER.println("");
                isHaedLine = false;
                indentationFlag = true;
                break;

            case SysYLexer.R_PAREN: {
                int index = 0;
                for (; index < parent.getChildCount(); ++index) {
                    if (parent.getChild(index) == node) {
                        break;
                    }
                }
                if (index < parent.getChildCount() - 1) {
                    ParseTree nextSibling = parent.getChild(index + 1);
                    if ((nextSibling instanceof SysYParser.AssignStatementContext)
                            || (nextSibling instanceof SysYParser.ExprStatementContext)
                            || (nextSibling instanceof SysYParser.IfStatementContext)
                            || (nextSibling instanceof SysYParser.BreakStatementContext)
                            || (nextSibling instanceof SysYParser.ContinueStatementContext)
                            || (nextSibling instanceof SysYParser.ReturnStatementContext)
                            || (nextSibling instanceof SysYParser.WhileStatementContext)) {
                        // 当前节点右边的第一个兄弟节点不是 blockStatement
                        PRINTER.println("");    // 换行 (5/5)
                        isHaedLine = false;
                        indentationFlag = true;
                    }
                }
                break;
            }

            case SysYLexer.ELSE: {
                int index = 0;
                for (; index < parent.getChildCount(); ++index) {
                    if (parent.getChild(index) == node) {
                        break;
                    }
                }
                if (index < parent.getChildCount() - 1) {
                    ParseTree nextSibling = parent.getChild(index + 1);
                    if ((nextSibling instanceof SysYParser.AssignStatementContext)
                            || (nextSibling instanceof SysYParser.ExprStatementContext)
                            || (nextSibling instanceof SysYParser.BreakStatementContext)
                            || (nextSibling instanceof SysYParser.ContinueStatementContext)
                            || (nextSibling instanceof SysYParser.ReturnStatementContext)
                            || (nextSibling instanceof SysYParser.WhileStatementContext)) {
                        // 当前节点右边的第一个兄弟节点不是 blockStatement
                        PRINTER.println("");
                        isHaedLine = false;
                        indentationFlag = true;
                    }
                }
                break;
            }

            default:
                break;
        }

    }

    @Override
    public Void visitDecl(SysYParser.DeclContext ctx) {
        insideDeclaration = true;
        Color hold_color = currentColor;
        currentColor = Color.BRIGHT_MAGENTA;

        Void r = super.visitDecl(ctx);

        insideDeclaration = false;
        currentColor = hold_color;


        return r;
    }

    @Override
    public Void visitFuncDef(SysYParser.FuncDefContext ctx) {
        if (!isHaedLine) {       // 换行 (4/5)
            PRINTER.println("");
            isHaedLine = false;
            indentationFlag = true;
        }
        return super.visitFuncDef(ctx);
    }

    /*
     *  `visitStmt` in Phase 2:
     */

    //@Override
    //public Void visitStmt(SysYParser.StmtContext ctx) {
    //    Color hold_color = currentColor;
    //    currentColor = Color.WHITE;
    //
    //    Void r = super.visitStmt(ctx);
    //
    //    currentColor = hold_color;
    //
    //    return r;
    //}

    /*
     *  `visitStmt` in Phase 3 BEGIN
     *      给语法规则打上标签后，visitStmt 方法将不会直接调用。
     *      相反，ANTLR 会生成标签对应的具体访问方法，例如 visitAssignStatement, visitExprStatement, 等等。
     *      需要为每个标签编写具体的访问方法。
     */

    @Override
    public Void visitAssignStatement(SysYParser.AssignStatementContext ctx) {
        Color hold_color = currentColor;
        currentColor = Color.WHITE;

        ParseTree parent = ((RuleNode) ctx).getParent();
        boolean flag = (parent instanceof SysYParser.IfStatementContext) || (parent instanceof SysYParser.WhileStatementContext);
        if (flag) {
            indentationLevel += 1;
        }

        Void r = super.visitAssignStatement(ctx);

        if (flag) {
            indentationLevel -= 1;
        }

        currentColor = hold_color;
        return r;
    }

    @Override
    public Void visitExprStatement(SysYParser.ExprStatementContext ctx) {
        Color hold_color = currentColor;
        currentColor = Color.WHITE;

        ParseTree parent = ((RuleNode) ctx).getParent();
        boolean flag = (parent instanceof SysYParser.IfStatementContext) || (parent instanceof SysYParser.WhileStatementContext);
        if (flag) {
            indentationLevel += 1;
        }

        Void r = super.visitExprStatement(ctx);

        if (flag) {
            indentationLevel -= 1;
        }

        currentColor = hold_color;
        return r;
    }

    @Override
    public Void visitBlockStatement(SysYParser.BlockStatementContext ctx) {
        Color hold_color = currentColor;
        currentColor = Color.WHITE;

        Void r = super.visitBlockStatement(ctx);

        currentColor = hold_color;
        return r;
    }

    @Override
    public Void visitIfStatement(SysYParser.IfStatementContext ctx) {
        Color hold_color = currentColor;
        currentColor = Color.WHITE;

        ParseTree parent = ((RuleNode) ctx).getParent();
        boolean flag = (parent instanceof SysYParser.IfStatementContext) || (parent instanceof SysYParser.WhileStatementContext);
        if (parent instanceof SysYParser.IfStatementContext) {
            int index = 0;
            for (; index < parent.getChildCount(); ++index) {
                if (parent.getChild(index) == ctx) {
                    break;
                }
            }
            if (index > 0) {
                ParseTree previousSibling = parent.getChild(index - 1);
                if (previousSibling instanceof TerminalNode) {
                    TerminalNode terminalNode = (TerminalNode) previousSibling;
                    if (terminalNode.getSymbol().getType() == SysYLexer.ELSE) {
                        flag = false;
                    }
                }
            }
        }
        if (flag) {
            indentationLevel += 1;
        }


        Void r = super.visitIfStatement(ctx);

        if (flag) {
            indentationLevel -= 1;
        }

        currentColor = hold_color;
        return r;
    }

    @Override
    public Void visitWhileStatement(SysYParser.WhileStatementContext ctx) {
        Color hold_color = currentColor;
        currentColor = Color.WHITE;

        ParseTree parent = ((RuleNode) ctx).getParent();
        boolean flag = (parent instanceof SysYParser.IfStatementContext) || (parent instanceof SysYParser.WhileStatementContext);
        if (flag) {
            indentationLevel += 1;
        }

        Void r = super.visitWhileStatement(ctx);

        if (flag) {
            indentationLevel -= 1;
        }


        currentColor = hold_color;
        return r;
    }

    @Override
    public Void visitBreakStatement(SysYParser.BreakStatementContext ctx) {
        Color hold_color = currentColor;
        currentColor = Color.WHITE;

        ParseTree parent = ((RuleNode) ctx).getParent();
        boolean flag = (parent instanceof SysYParser.IfStatementContext) || (parent instanceof SysYParser.WhileStatementContext);
        if (flag) {
            indentationLevel += 1;
        }

        Void r = super.visitBreakStatement(ctx);

        if (flag) {
            indentationLevel -= 1;
        }

        currentColor = hold_color;
        return r;
    }

    @Override
    public Void visitContinueStatement(SysYParser.ContinueStatementContext ctx) {
        Color hold_color = currentColor;
        currentColor = Color.WHITE;

        ParseTree parent = ((RuleNode) ctx).getParent();
        boolean flag = (parent instanceof SysYParser.IfStatementContext) || (parent instanceof SysYParser.WhileStatementContext);
        if (flag) {
            indentationLevel += 1;
        }

        Void r = super.visitContinueStatement(ctx);

        if (flag) {
            indentationLevel -= 1;
        }

        currentColor = hold_color;
        return r;
    }

    @Override
    public Void visitReturnStatement(SysYParser.ReturnStatementContext ctx) {
        Color hold_color = currentColor;
        currentColor = Color.WHITE;

        ParseTree parent = ((RuleNode) ctx).getParent();
        boolean flag = (parent instanceof SysYParser.IfStatementContext) || (parent instanceof SysYParser.WhileStatementContext);
        if (flag) {
            indentationLevel += 1;
        }

        Void r = super.visitReturnStatement(ctx);

        if (flag) {
            indentationLevel -= 1;
        }

        currentColor = hold_color;
        return r;
    }
    /*
     *  `visitStmt` in Phase 3 END
     */


    @Override
    public Void visitBlock(SysYParser.BlockContext ctx) {
        Void r = null;

        r = visit(ctx.L_BRACE());
        indentationLevel += 1;

        for (SysYParser.BlockItemContext blockItemCtx : ctx.blockItem()) {
            r = visit(blockItemCtx);
        }

        indentationLevel -= 1;
        r = visit(ctx.R_BRACE());

        return r;
    }

    @Override
    public Void visitNumber(SysYParser.NumberContext ctx) {
        Color hold_color = currentColor;
        currentColor = Color.MAGENTA;

        Void r = super.visitNumber(ctx);

        currentColor = hold_color;

        return r;
    }

    @Override
    public Void visitFuncName(SysYParser.FuncNameContext ctx) {
        Color hold_color = currentColor;
        currentColor = Color.BRIGHT_YELLOW;

        Void r = super.visitFuncName(ctx);

        currentColor = hold_color;

        return r;
    }

    private Color pushRainbowColor() {
        Color r = rainbowTab[rainbowTabIndex];
        rainbowTabIndex = (rainbowTabIndex + 1) % rainbowTab.length;
        return r;
    }

    private Color popRainbowColor() {
        if (rainbowTabIndex == 0) {
            rainbowTabIndex = rainbowTab.length - 1;
        } else {
            rainbowTabIndex -= 1;
        }
        return rainbowTab[rainbowTabIndex];
    }
}