import org.antlr.v4.runtime.misc.Pair;
import tool.REPORTER;
import tool.TypeError;
import type.*;
import org.antlr.v4.runtime.tree.ParseTree;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class SysYTypeCheckVisitor extends SysYParserBaseVisitor<Void> {
    private Scope<Type> curScope;
    private TypeManager manager;

    public SysYTypeCheckVisitor() {
        this.curScope = new Scope();
        this.manager = new TypeManager();
    }

    @Override
    public Void visitProgram(SysYParser.ProgramContext ctx) {
        Void r = super.visitProgram(ctx);
        REPORTER.summary();
        return r;
    }

    @Override
    public Void visitFuncDef(SysYParser.FuncDefContext ctx) {
        /**
         *  funcDef : funcType funcName L_PAREN (funcFParams)? R_PAREN block
         *         ;
         */
        String funcName = ctx.funcName().getText();
        if (curScope.resolve(funcName) != null) {
            REPORTER.report(ctx.funcName().getStart().getLine(), TypeError.REDEF_FUNC, funcName);
            return null;
        }

        // determine return type
        String funcTypeName = ctx.funcType().getText();
        Type retType;
        if (funcTypeName.equals("int")) {
            retType = manager.makeIntType();
        } else {
            retType = manager.makeVoidType();
        }

        // determine params type
        List<Type> paramsType = new ArrayList<>();
        Set<String> usedParamNames = new HashSet<>();
        List<String> paramsName = new ArrayList<>();
        if (ctx.funcFParams() != null) {
            for (SysYParser.FuncFParamContext fParamContext : ctx.funcFParams().funcFParam()) {
                String paramName = fParamContext.IDENT().getText();
                if (!usedParamNames.contains(paramName)) {
                    paramsType.add(processParam(fParamContext));
                    paramsName.add(paramName);
                    usedParamNames.add(paramName);
                } else {
                    REPORTER.report(fParamContext.getStart().getLine(), TypeError.REDEF_VAR, paramName);
                }
            }
        }
        Type funcType = manager.makeFuncType(retType, paramsType, paramsName);
        curScope.define(funcName, funcType);

        visit(ctx.block());
        return null;
    }

    private Type processParam(SysYParser.FuncFParamContext ctx) {
        int dimen = ctx.L_BRACKT().size();
        Type type = manager.makeNestedArrayType(dimen);
        return type;
    }

    @Override
    public Void visitBlock(SysYParser.BlockContext ctx) {
        Scope<Type> scope = new Scope(curScope);
        curScope = scope;

        // 获取当前节点的父节点
        ParseTree parent = ctx.getParent();
        // 检查父节点是否是 FuncDefContext 类型
        if (parent instanceof SysYParser.FuncDefContext) {
            SysYParser.FuncDefContext funcDefContext = (SysYParser.FuncDefContext) parent;
            // 如果是 FuncDefContext 类型，执行相关操作
            /** Cast Discussion (1/4)
             *      The cast here is safe, the funcName must be resolved to a funcType.
             *      Why?
             */
            FuncType funcType = (FuncType) curScope.resolve(funcDefContext.funcName().IDENT().getText());
            curScope.defineAll(funcType.getParamsName(), funcType.getParamsType());
        }

        ctx.blockItem().forEach(this::visit); // 依次visit block中的节点

        //切换回父级作用域
        curScope = curScope.getParent();

        return null;
    }

    @Override
    public Void visitVarDecl(SysYParser.VarDeclContext ctx) {
        /**
         *  varDecl : bType varDef (COMMA varDef)* SEMICOLON
         *         ;
         */
        for (int i = 0; i < ctx.varDef().size(); i ++) {
            visit(ctx.varDef(i)); // 依次visit def，即依次visit c=4 和 d=5
        }
        return null;
    }

    @Override
    public Void visitVarDef(SysYParser.VarDefContext ctx) {
        /**
         *  varDef  : IDENT (L_BRACKT constExp R_BRACKT)*
         *         | IDENT (L_BRACKT constExp R_BRACKT)* ASSIGN initVal
         *         ;
         */
        String varName = ctx.IDENT().getText(); // c or d
        Type type = curScope.localResolve(varName);
        if (type != null) {
            REPORTER.report(ctx.IDENT().getSymbol().getLine(), TypeError.REDEF_VAR, varName);
            return null;
        }

        // further visit initVal
        if (ctx.ASSIGN() != null) {
            visit(ctx.initVal());
        }

        if (ctx.constExp().isEmpty()) { //非数组
            curScope.define(varName, manager.makeIntType());
        } else { // 数组
            // further visit initVal
            for (SysYParser.ConstExpContext constExpContext : ctx.constExp()) {
                visit(constExpContext);
            }
            int dimen = ctx.L_BRACKT().size();
            type = manager.makeNestedArrayType(dimen);
            curScope.define(varName, type);
        }

        type = curScope.resolve(varName);
        if (ctx.ASSIGN() != null && !(manager.isArrayType(type) || manager.isIntType(type))) {
            REPORTER.report(ctx.IDENT().getSymbol().getLine(), TypeError.ASSIGN_TO_NON_LVALUE, varName);
            return null;
        }

        if (ctx.ASSIGN() != null && !type.equals(resolveInitValue(ctx.initVal()))) {
            REPORTER.report(ctx.initVal().getStart().getLine(), TypeError.MISMATCHED_ASSIGN, null);
            return null;
        }

        return null;
    }

    @Override
    public Void visitConstDecl(SysYParser.ConstDeclContext ctx) {
        /**
         *  constDecl : CONST bType constDef (COMMA constDef)* SEMICOLON
         *           ;
         */
        for (int i = 0; i < ctx.constDef().size(); i ++) {
            visit(ctx.constDef(i)); // 依次visit def，即依次visit c=4 和 d=5
        }
        return null;
    }

    @Override
    public Void visitConstDef(SysYParser.ConstDefContext ctx) {
        /**
         *  constDef : IDENT (L_BRACKT constExp R_BRACKT)* ASSIGN constInitVal
         *          ;
         */
        String varName = ctx.IDENT().getText();
        Type type = curScope.localResolve(varName);
        if (type != null) {
            REPORTER.report(ctx.IDENT().getSymbol().getLine(), TypeError.REDEF_VAR, varName);
            return null;
        }

        // further visit constInitVal
        if (ctx.ASSIGN() != null) {
            visit(ctx.constInitVal());
        }

        if (ctx.constExp().isEmpty()) {
            curScope.define(varName, manager.makeIntType());
        } else {
            // further visit initVal
            for (SysYParser.ConstExpContext constExpContext : ctx.constExp()) {
                visit(constExpContext);
            }
            int dimen = ctx.L_BRACKT().size();
            type = manager.makeNestedArrayType(dimen);
            curScope.define(varName, type);
        }

        type = curScope.resolve(varName);
        if (ctx.ASSIGN() != null && !(manager.isArrayType(type) || manager.isIntType(type))) {
            REPORTER.report(ctx.IDENT().getSymbol().getLine(), TypeError.ASSIGN_TO_NON_LVALUE, varName);
            return null;
        }

        if (ctx.ASSIGN() != null && !type.equals(resolveConstInitValue(ctx.constInitVal()))) {
            REPORTER.report(ctx.constInitVal().getStart().getLine(), TypeError.MISMATCHED_ASSIGN, null);
            return null;
        }

        return null;
    }

    @Override
    public Void visitLVal(SysYParser.LValContext ctx) {
        /**
         *  lVal
         *    : IDENT (L_BRACKT exp R_BRACKT)*
         *    ;
         */
        String varName = ctx.IDENT().getText();
        Type type = curScope.resolve(varName);
        if (type == null) {
            REPORTER.report(ctx.IDENT().getSymbol().getLine(), TypeError.UNDEF_VAR, varName);
            return null;
        }

        int arrayAccessDimen = ctx.L_BRACKT().size();
        if (arrayAccessDimen > 0) {
            if (!manager.isArrayType(type)) {
                REPORTER.report(ctx.IDENT().getSymbol().getLine(), TypeError.ILLEGAL_ARRAY_ACCESS, varName);
                return null;
            }
            ArrayType arrayType = (ArrayType) type;
            for (SysYParser.ExpContext expContext : ctx.exp()) {
                if (!manager.isIntType(resolveExp(expContext))) {
                    REPORTER.report(ctx.IDENT().getSymbol().getLine(), TypeError.MISMATCHED_OPRAND, varName);
                    return null;
                }
            }
            if (arrayType.getDimensions() < arrayAccessDimen) {
                REPORTER.report(ctx.IDENT().getSymbol().getLine(), TypeError.ILLEGAL_ARRAY_ACCESS, varName);
                return null;
            }
            type = manager.makeNestedArrayType(arrayType.getDimensions() - arrayAccessDimen);
        }


        if (!ctx.exp().isEmpty()) {
            for (SysYParser.ExpContext expContext : ctx.exp()) {
                visit(expContext);
            }
        }

        /**
         *  stmt : lVal ASSIGN exp SEMICOLON                    #AssignStatement
         *      | ......
         *      ;
         */
        //ParseTree parent = ctx.getParent();
        //if (parent instanceof SysYParser.AssignStatementContext) {
        //    SysYParser.AssignStatementContext assignStatementContext = (SysYParser.AssignStatementContext) parent;
        //    if (!manager.isArrayType(type) && !manager.isIntType(type)) {
        //        REPORTER.report(ctx.IDENT().getSymbol().getLine(), TypeError.ASSIGN_TO_NON_LVALUE, varName);
        //        return null;
        //    }
        //    // it could be asserted that `type` is IntType or ArrayType
        //    Type assignType = resolveExp(assignStatementContext.exp());
        //    if (!type.equals(assignType)) {
        //        REPORTER.report(assignStatementContext.ASSIGN().getSymbol().getLine(), TypeError.MISMATCHED_ASSIGN, null);
        //        return null;
        //    }
        //}
        return null;
    }

    @Override
    public Void visitAssignStatement(SysYParser.AssignStatementContext ctx) {
        visit(ctx.exp());
        visit(ctx.lVal());
        Type lType = resolveLVal(ctx.lVal());
        Type rType = resolveExp(ctx.exp());

        if (!manager.isArrayType(lType) && !manager.isIntType(lType)) {
            REPORTER.report(ctx.lVal().IDENT().getSymbol().getLine(), TypeError.ASSIGN_TO_NON_LVALUE,
                            ctx.lVal().IDENT().getText());
            return null;
        }
        // it could be asserted that `type` is IntType or ArrayType
        if (!lType.equals(rType)) {
            REPORTER.report(ctx.ASSIGN().getSymbol().getLine(), TypeError.MISMATCHED_ASSIGN, null);
            return null;
        }
        return null;
    }

    @Override
    public Void visitPlusExp(SysYParser.PlusExpContext ctx) {
        visit(ctx.exp(0));
        visit(ctx.exp(1));
        Type type0 = resolveExp(ctx.exp(0));
        Type type1 = resolveExp(ctx.exp(1));
        if (!manager.isIntType(type0) || !manager.isIntType(type1)) {
            REPORTER.report(ctx.exp(0).getStart().getLine(), TypeError.MISMATCHED_OPRAND, null);
        }
        return null;
    }

    @Override
    public Void visitMulExp(SysYParser.MulExpContext ctx) {
        visit(ctx.exp(0));
        visit(ctx.exp(1));
        Type type0 = resolveExp(ctx.exp(0));
        Type type1 = resolveExp(ctx.exp(1));
        if (!manager.isIntType(type0) || !manager.isIntType(type1)) {
            REPORTER.report(ctx.exp(0).getStart().getLine(), TypeError.MISMATCHED_OPRAND, null);
        }
        return null;
    }

    @Override
    public Void visitUnaryExp(SysYParser.UnaryExpContext ctx) {
        visit(ctx.exp());
        Type type = resolveExp(ctx.exp());
        if (!manager.isIntType(type)) {
            REPORTER.report(ctx.exp().getStart().getLine(), TypeError.MISMATCHED_OPRAND, null);
        }
        return null;
    }

    @Override
    public Void visitCallExp(SysYParser.CallExpContext ctx) {
        String funcName = ctx.funcName().IDENT().getText();
        Type type = curScope.resolve(funcName);
        if (type == null) {
            REPORTER.report(ctx.funcName().getStart().getLine(), TypeError.UNDEF_FUNC, funcName);
            return null;
        }
        if (!manager.isFuncType(type)) {
            REPORTER.report(ctx.funcName().getStart().getLine(), TypeError.CALL_NON_FUNC, funcName);
            return null;
        }
        /** Cast Discussion (2/4)
         *      The cast here is safe, the funcName must be resolved to a funcType.
         *      The `IF` above ensures that.
         */
        FuncType funcType = (FuncType) type;
        List<Type> params = funcType.getParamsType();
        List<Type> args = new ArrayList<>();
        if (ctx.funcRParams() != null) {
            for (SysYParser.ParamContext paramContext : ctx.funcRParams().param()) {
                visit(paramContext.exp());
                args.add(resolveExp(paramContext.exp()));
            }
        }

        if (params.size() != args.size()) {
            REPORTER.report(ctx.funcName().getStart().getLine(), TypeError.MISMATCHED_ARG, funcName);
            return null;
        }
        for (int i = 0; i < params.size(); ++i) {
            if (!params.get(i).equals(args.get(i))) {
                REPORTER.report(ctx.funcName().getStart().getLine(), TypeError.MISMATCHED_ARG, funcName);
                return null;
            }
        }
        return null;
    }

    @Override
    public Void visitReturnStatement(SysYParser.ReturnStatementContext ctx) {
        super.visitReturnStatement(ctx);
        ParseTree parent = ctx;

        while (!(parent instanceof SysYParser.FuncDefContext)) {
            parent = parent.getParent();
        }

        SysYParser.FuncDefContext funcDefContext = (SysYParser.FuncDefContext) parent;
        /** Cast Discussion (3/4)
         *      The cast here is unsafe!!
         *      the funcName may be resolved to intType/arrayType which is literally legal.
         */
        //Version 1: buggy!! dangerous!!
        //FuncType funcType = (FuncType) curScope.resolve(funcDefContext.funcName().getText()); // wrong
        FuncType funcType = (FuncType) curScope.resolveFuncType(funcDefContext.funcName().getText()); // safer
        Type expectedRetType = funcType.getReturnType();
        Type actualRetType = manager.makeVoidType();
        if (ctx.exp() != null) {
            visit(ctx.exp());
            actualRetType = resolveExp(ctx.exp());
        }
        if (!expectedRetType.equals(actualRetType)) {
            REPORTER.report(ctx.RETURN().getSymbol().getLine(), TypeError.MISMATCHED_RET, null);
        }

        return null;
    }

    private Type resolveExp(SysYParser.ExpContext expContext) {
        /**
         *  exp
         *    : L_PAREN exp R_PAREN                            #NestedExp
         *    | lVal                                           #LValExp
         *    | number                                         #NumberExp
         *    | funcName L_PAREN funcRParams? R_PAREN          #CallExp
         *    | unaryOp exp                                    #UnaryExp
         *    | exp (MUL | DIV | MOD) exp                      #MulExp
         *    | exp (PLUS | MINUS) exp                         #PlusExp
         *    ;
         */
        if (expContext instanceof SysYParser.NestedExpContext) {
            return resolveExp(((SysYParser.NestedExpContext) expContext).exp());
        } else if (expContext instanceof SysYParser.LValExpContext) {
            // 假设 call 合法, 其求值类型一定为 lVal 的类型
            // 若不合法，也不关这里的事情
            return resolveLVal(((SysYParser.LValExpContext) expContext).lVal());
        } else if (expContext instanceof SysYParser.CallExpContext) {
            // 假设 call 合法, 其求值类型一定为 func 的返回值类型
            // 若不合法，也不关这里的事情
            SysYParser.CallExpContext callExpContext = (SysYParser.CallExpContext) expContext;
            String funcName = callExpContext.funcName().IDENT().getText();
            Type type = curScope.resolve(funcName);
            /** Cast Discussion (4/4)
             *      The cast here is unsafe unless with `&& type instanceof FuncType`
             *      the funcName may be resolved to intType/arrayType which is literally legal.
             */
            if (type != null && type instanceof FuncType) {
                FuncType funcType = (FuncType) type;
                return funcType.getReturnType();
            } else {
                return null;
            }
        } else {
            // 假设 Number, unary, binary 合法, 其求值类型一定为 int
            // 若不合法，也不关这里的事情
            return manager.makeIntType();
        }
    }

    private Type resolveLVal(SysYParser.LValContext ctx) {
        String varName = ctx.IDENT().getText();
        Type type = curScope.resolve(varName);
        if (type == null) {
            //REPORTER.report(ctx.IDENT().getSymbol().getLine(), TypeError.UNDEF_VAR, varName);
            return null;
        }

        int arrayAccessDimen = ctx.L_BRACKT().size();
        if (arrayAccessDimen > 0) {
            if (!manager.isArrayType(type)) {
                //REPORTER.report(ctx.IDENT().getSymbol().getLine(), TypeError.ILLEGAL_ARRAY_ACCESS, varName);
                return null;
            }
            ArrayType arrayType = (ArrayType) type;
            for (SysYParser.ExpContext expContext : ctx.exp()) {
                if (!manager.isIntType(resolveExp(expContext))) {
                    //REPORTER.report(ctx.IDENT().getSymbol().getLine(), TypeError.MISMATCHED_OPRAND, varName);
                    return null;
                }
            }
            if (arrayType.getDimensions() < arrayAccessDimen) {
                //REPORTER.report(ctx.IDENT().getSymbol().getLine(), TypeError.ILLEGAL_ARRAY_ACCESS, varName);
                return null;
            }
            type = manager.makeNestedArrayType(arrayType.getDimensions() - arrayAccessDimen);
        }

        return type;
    }

    @Override
    public Void visitOrCond(SysYParser.OrCondContext ctx) {
        visit(ctx.cond(0));
        visit(ctx.cond(1));
        Type type0 = resolveCond(ctx.cond(0));
        Type type1 = resolveCond(ctx.cond(1));
        if (!manager.isIntType(type0) || !manager.isIntType(type1)) {
            REPORTER.report(ctx.cond(0).getStart().getLine(), TypeError.MISMATCHED_OPRAND, null);
            return null;
        }
        return null;
    }

    @Override
    public Void visitAndCond(SysYParser.AndCondContext ctx) {
        visit(ctx.cond(0));
        visit(ctx.cond(1));
        Type type0 = resolveCond(ctx.cond(0));
        Type type1 = resolveCond(ctx.cond(1));
        if (!manager.isIntType(type0) || !manager.isIntType(type1)) {
            REPORTER.report(ctx.cond(0).getStart().getLine(), TypeError.MISMATCHED_OPRAND, null);
            return null;
        }
        return null;
    }

    @Override
    public Void visitEqualityCond(SysYParser.EqualityCondContext ctx) {
        visit(ctx.cond(0));
        visit(ctx.cond(1));
        Type type0 = resolveCond(ctx.cond(0));
        Type type1 = resolveCond(ctx.cond(1));
        if (!manager.isIntType(type0) || !manager.isIntType(type1)) {
            REPORTER.report(ctx.cond(0).getStart().getLine(), TypeError.MISMATCHED_OPRAND, null);
            return null;
        }
        return null;
    }

    @Override
    public Void visitRelationalCond(SysYParser.RelationalCondContext ctx) {
        visit(ctx.cond(0));
        visit(ctx.cond(1));
        Type type0 = resolveCond(ctx.cond(0));
        Type type1 = resolveCond(ctx.cond(1));
        if (!manager.isIntType(type0) || !manager.isIntType(type1)) {
            REPORTER.report(ctx.cond(0).getStart().getLine(), TypeError.MISMATCHED_OPRAND, null);
            return null;
        }
        return null;
    }

    private Type resolveCond(SysYParser.CondContext condContext) {
        /**
         *  cond
         *    : exp                                            #ExpCond
         *    | cond (LT | GT | LE | GE) cond                  #RelationalCond
         *    | cond (EQ | NEQ) cond                           #EqualityCond
         *    | cond AND cond                                  #AndCond
         *    | cond OR cond                                   #OrCond
         *    ;
         */
        if (condContext instanceof SysYParser.ExpCondContext) {
            return resolveExp(((SysYParser.ExpCondContext) condContext).exp());
        } else {
            // 假设 Number, unary, binary 合法, 其求值类型一定为 int
            // 若不合法，也不关这里的事情
            return manager.makeIntType();
        }
    }

    private Type resolveInitValue(SysYParser.InitValContext initValContext) {
        /**
         *  initVal : exp
         *         | L_BRACE (initVal (COMMA initVal)*)? R_BRACE
         *         ;
         */
        if (initValContext.L_BRACE() == null) {
            return resolveExp(initValContext.exp());
        }
        if (initValContext.initVal().isEmpty()) {
            return manager.makeNestedArrayType(1);
        }

        // assume inside dimens are all the same
        Type type = resolveInitValue(initValContext.initVal(0));
        int dimen = (type != null && manager.isArrayType(type)) ? ((ArrayType) type).getDimensions()
                  : 0;
        return manager.makeArrayType(type, dimen + 1);
    }

    private Type resolveConstInitValue(SysYParser.ConstInitValContext constInitValContext) {
        /**
         *  constInitVal : constExp
         *              | L_BRACE (constInitVal (COMMA constInitVal)*)? R_BRACE
         *              ;
         *
         *  constExp
         *    : exp
         *    ;
         */
        if (constInitValContext.L_BRACE() == null) {
            return resolveExp(constInitValContext.constExp().exp());
        }
        if (constInitValContext.constInitVal().isEmpty()) {
            return manager.makeNestedArrayType(1);
        }
        // assume inside dimens are all the same
        Type type = resolveConstInitValue(constInitValContext.constInitVal(0));
        int dimen = (type != null && manager.isArrayType(type)) ? ((ArrayType) type).getDimensions()
                  : 0;
        return manager.makeArrayType(type, dimen + 1);
    }
}
