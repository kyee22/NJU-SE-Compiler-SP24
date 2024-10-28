import org.antlr.v4.runtime.tree.ParseTree;
import org.bytedeco.javacpp.*;
import org.bytedeco.llvm.LLVM.*;
import org.bytedeco.llvm.presets.LLVM;
import type.FuncType;
import type.Scope;
import static org.bytedeco.llvm.global.LLVM.*;
import tool.Number;
import type.Type;

import java.util.ArrayDeque;
import java.util.Deque;


public class SysYGenLLVMIRVisitor extends SysYParserBaseVisitor<LLVMValueRef> {
    /////////////////////////// Visitor 相关 ///////////////////////////
    private static final int VARIADIC_FALSE = 0;
    private static final int VARIADIC_TRUE = 1;
    private static final int SEXT_FALSE = 0;
    private static final int SEXT_TRUE = 1;
    private static int nTemp = 0;
    private Scope<LLVMValueRef> curScope = new Scope<>();
    private LLVMValueRef curFunction = null;
    private LLVMBasicBlockRef curBasicBlock = null;
    private Deque<LLVMBasicBlockRef> breakLabels = new ArrayDeque<>();
    private Deque<LLVMBasicBlockRef> continueLabels = new ArrayDeque<>();
    Scope<LLVMTypeRef> typeSystem = new Scope<>();

    /////////////////////////// LLVM 相关 ///////////////////////////

    //创建module
    LLVMModuleRef module = LLVMModuleCreateWithName("module");

    //初始化IRBuilder，后续将使用这个builder去生成LLVM IR
    LLVMBuilderRef builder = LLVMCreateBuilder();

    //考虑到我们的语言中仅存在int一个基本类型，可以通过下面的语句为LLVM的int型重命名方便以后使用
    LLVMTypeRef i32Type = LLVMInt32Type();
    LLVMTypeRef i1Type = LLVMInt1Type();
    LLVMTypeRef voidType = LLVMVoidType();
    //创建一个常量,这里是常数0
    LLVMValueRef zero_i32 = LLVMConstInt(i32Type, 0, SEXT_FALSE);
    LLVMValueRef one_i1 =  LLVMConstInt(i1Type, 1, SEXT_FALSE);
    LLVMValueRef one_i32 = LLVMConstInt(i32Type, 1, SEXT_FALSE);

    public static final BytePointer error = new BytePointer();

    @Override
    public LLVMValueRef visitProgram(SysYParser.ProgramContext ctx) {
        // init work
        typeSystem.define("int", i32Type);
        typeSystem.define("void", voidType);
        return super.visitProgram(ctx);
    }

    @Override
    public LLVMValueRef visitFuncDef(SysYParser.FuncDefContext ctx) {
        /**
         *  funcDef : funcType funcName L_PAREN (funcFParams)? R_PAREN block
         *         ;
         */
        String funcNameStr = ctx.funcName().IDENT().getText();
        String retTypeStr = ctx.funcType().getText();
        int nParams = ctx.funcFParams() != null ? ctx.funcFParams().funcFParam().size()
                                                : 0;
        // 生成函数参数类型
        PointerPointer<Pointer> paramsType = new PointerPointer<>(nParams);
        for (int i = 0; i < nParams; ++i) {
            String typeStr = ctx.funcFParams().funcFParam(i).bType().getText();// 这里没有考虑数组
            LLVMTypeRef type = typeSystem.resolve(typeStr);
            paramsType.put(i, type);
        }
        // 生成返回值类型
        LLVMTypeRef retType = typeSystem.resolve(retTypeStr);
        // 生成函数类型
        LLVMTypeRef ft = LLVMFunctionType(retType, paramsType, nParams, VARIADIC_FALSE);
        // 生成函数，即向之前创建的module中添加函数
        LLVMValueRef function = LLVMAddFunction(module, funcNameStr, ft);
        curScope.define(funcNameStr, function);
        curFunction = function;
        // 创建基本块
        String blockName = funcNameStr + "Entry";
        LLVMBasicBlockRef bb = LLVMAppendBasicBlock(function, blockName);
        checkout(bb);

        // 开启新的作用域
        Scope<LLVMValueRef> scope = new Scope(curScope);
        curScope = scope;

        // 以局部变量的形式定义参数
        for (int i = 0; i < nParams; ++i) {
            String typeStr = ctx.funcFParams().funcFParam(i).bType().getText();// 这里没有考虑数组
            LLVMTypeRef type = typeSystem.resolve(typeStr);
            String paramName = ctx.funcFParams().funcFParam(i).IDENT().getText();
            LLVMValueRef value = LLVMGetParam(function, i);
            LLVMValueRef paramVar = LLVMBuildAlloca(builder, type, paramName);
            LLVMBuildStore(builder, value, paramVar);

            curScope.define(paramName, paramVar);
        }

        visit(ctx.block());
        if (LLVMGetTypeKind(retType) == LLVMVoidTypeKind) {
            LLVMBuildRetVoid(builder);
        } else {
            LLVMBuildRet(builder, zero_i32);
        }

        return function;
    }

    @Override
    public LLVMValueRef visitBlock(SysYParser.BlockContext ctx) {
        if (!(ctx.getParent() instanceof SysYParser.FuncDefContext)) {
            // 开启新的作用域
            Scope<LLVMValueRef> scope = new Scope(curScope);
            curScope = scope;
        }

        // 依次visit block中的节点
        ctx.blockItem().forEach(this::visit);

        //切换回父级作用域
        curScope = curScope.getParent();

        return null;
    }

    @Override
    public LLVMValueRef visitVarDef(SysYParser.VarDefContext ctx) {
        /**
         *  varDef  : IDENT (L_BRACKT constExp R_BRACKT)*
         *         | IDENT (L_BRACKT constExp R_BRACKT)* ASSIGN initVal
         *         ;
         *  initVal : exp
         *         | L_BRACE (initVal (COMMA initVal)*)? R_BRACE
         *         ;
         */
        if (!ctx.L_BRACKT().isEmpty()) {
            throw new RuntimeException("Array Unimplemented!");
        }
        String varName = ctx.IDENT().getText();
        if (curScope.isGlobalScope()) {
            LLVMValueRef globalVar = LLVMAddGlobal(module, i32Type, varName);
            LLVMSetInitializer(globalVar, zero_i32);
            if (ctx.initVal() != null) {
                LLVMValueRef value = visit(ctx.initVal());
                LLVMSetInitializer(globalVar, value);
            }
            curScope.define(varName, globalVar);
        } else {
            LLVMValueRef localVar = LLVMBuildAlloca(builder, i32Type, varName);
            if (ctx.initVal() != null) {
                LLVMValueRef value = visit(ctx.initVal());
                LLVMBuildStore(builder, value, localVar);
            }
            curScope.define(varName, localVar);
        }
        return null;
    }

    @Override
    public LLVMValueRef visitConstDef(SysYParser.ConstDefContext ctx) {
        /**
         *  constDef : IDENT (L_BRACKT constExp R_BRACKT)* ASSIGN constInitVal
         *          ;
         */
        if (!ctx.L_BRACKT().isEmpty()) {
            throw new RuntimeException("Array Unimplemented!");
        }
        String varName = ctx.IDENT().getText();
        if (curScope.isGlobalScope()) {
            LLVMValueRef globalVar = LLVMAddGlobal(module, i32Type, varName);
            LLVMSetInitializer(globalVar, zero_i32);
            if (ctx.ASSIGN() != null) {
                LLVMValueRef value = visit(ctx.constInitVal());
                LLVMSetInitializer(globalVar, value);
            }
            curScope.define(varName, globalVar);
        } else {
            LLVMValueRef localVar = LLVMBuildAlloca(builder, i32Type, varName);
            if (ctx.constInitVal() != null) {
                LLVMValueRef value = visit(ctx.constInitVal());
                LLVMBuildStore(builder, value, localVar);
            }
            curScope.define(varName, localVar);
        }
        return null;
    }

    @Override
    public LLVMValueRef visitAssignStatement(SysYParser.AssignStatementContext ctx) {
        /**
         *  // with tag
         * stmt : lVal ASSIGN exp SEMICOLON                    #AssignStatement
         *      ......
         *      ;
         */
        String varName = ctx.lVal().IDENT().getText();
        LLVMValueRef lVar = curScope.resolve(varName);
        LLVMValueRef rValue = visit(ctx.exp());
        return LLVMBuildStore(builder, rValue, lVar);
    }

    @Override
    public LLVMValueRef visitIfStatement(SysYParser.IfStatementContext ctx) {
        /**
         *  stmt :
         *      | IF L_PAREN cond R_PAREN ifStmt=stmt (ELSE elseStmt=stmt)?    #IfStatement
         *      ;
         */
        LLVMValueRef cond = visit(ctx.cond());
        LLVMValueRef bool = LLVMBuildICmp(builder, LLVMIntNE, cond, zero_i32, newTemp());
        LLVMBasicBlockRef trueBlock = LLVMAppendBasicBlock(curFunction, "IF_TRUE");
        LLVMBasicBlockRef falseBlock = LLVMAppendBasicBlock(curFunction, "IF_FALSE");
        LLVMBasicBlockRef endBlock = LLVMAppendBasicBlock(curFunction, "IF_END");
        LLVMBuildCondBr(builder, bool, trueBlock, falseBlock);

        checkout(trueBlock);
        visit(ctx.ifStmt);
        LLVMBuildBr(builder, endBlock);

        checkout(falseBlock);
        if (ctx.ELSE() != null) {
            visit(ctx.elseStmt);
        }
        LLVMBuildBr(builder, endBlock);

        checkout(endBlock);
        return null;
    }

    @Override
    public LLVMValueRef visitWhileStatement(SysYParser.WhileStatementContext ctx) {
        /**
         *  stmt :
         *      | WHILE L_PAREN cond R_PAREN stmt                              #WhileStatement
         *      ;
         */
        LLVMBasicBlockRef beginBlock = LLVMAppendBasicBlock(curFunction, "WHILE-BEGIN");
        LLVMBasicBlockRef trueBlock = LLVMAppendBasicBlock(curFunction, "WHILE-BODY");
        LLVMBasicBlockRef endBlock = LLVMAppendBasicBlock(curFunction, "WHILE-END");

        LLVMBuildBr(builder, beginBlock);

        checkout(beginBlock);
        LLVMValueRef cond = visit(ctx.cond());
        LLVMValueRef bool = LLVMBuildICmp(builder, LLVMIntNE, cond, zero_i32, newTemp());
        LLVMBuildCondBr(builder, bool, trueBlock, endBlock);


        checkout(trueBlock);
        breakLabels.push(endBlock);
        continueLabels.push(beginBlock);
        visit(ctx.stmt());
        breakLabels.pop();
        continueLabels.pop();
        LLVMBuildBr(builder, beginBlock);

        checkout(endBlock);
        return null;
    }

    @Override
    public LLVMValueRef visitBreakStatement(SysYParser.BreakStatementContext ctx) {
        LLVMBuildBr(builder, breakLabels.peek());
        return null;
    }

    @Override
    public LLVMValueRef visitContinueStatement(SysYParser.ContinueStatementContext ctx) {
        LLVMBuildBr(builder, continueLabels.peek());
        return super.visitContinueStatement(ctx);
    }

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

    @Override
    public LLVMValueRef visitPlusExp(SysYParser.PlusExpContext ctx) {
        LLVMValueRef oprand1 = visit(ctx.exp(0));
        LLVMValueRef oprand2 = visit(ctx.exp(1));
        switch (ctx.op.getType()) {
            case SysYLexer.PLUS:
                return LLVMBuildAdd(builder, oprand1, oprand2, newTemp());

            case SysYLexer.MINUS:
                return LLVMBuildSub(builder, oprand1, oprand2, newTemp());

            default:
                throw new IllegalArgumentException("No such a op : " + ctx.op.getText());
        }
    }

    @Override
    public LLVMValueRef visitMulExp(SysYParser.MulExpContext ctx) {
        LLVMValueRef oprand1 = visit(ctx.exp(0));
        LLVMValueRef oprand2 = visit(ctx.exp(1));
        switch (ctx.op.getType()) {
            case SysYLexer.MUL:
                return LLVMBuildMul(builder, oprand1, oprand2, newTemp());

            case SysYLexer.DIV:
                return LLVMBuildSDiv(builder, oprand1, oprand2, newTemp());

            case SysYLexer.MOD:
                return LLVMBuildSRem(builder, oprand1, oprand2, newTemp());

            default:
                throw new IllegalArgumentException("No such a op : " + ctx.op.getText());
        }
    }

    @Override
    public LLVMValueRef visitCallExp(SysYParser.CallExpContext ctx) {
        String funcName = ctx.funcName().IDENT().getText();
        LLVMValueRef function = curScope.resolve(funcName);
        int nArgs = ctx.funcRParams() != null ? ctx.funcRParams().param().size()
                                              : 0;
        // 生成函数参数类型
        PointerPointer<Pointer> args = new PointerPointer<>(nArgs);
        for (int i = 0; i < nArgs; ++i) {
            args.put(i, visit(ctx.funcRParams().param(i)));
        }

        LLVMTypeRef retType = LLVMGetReturnType(LLVMGetElementType(LLVMTypeOf(function)));
        String retVarStr = LLVMGetTypeKind(retType) == LLVMVoidTypeKind ? ""
                                                                        : "returnValue";
        // Note that return type might be 'void'
        //      ==> return value cannot be assigned to a variable
        //          ==> the 4th argument need to be set "" in that case
        return LLVMBuildCall(builder, function, args, nArgs, retVarStr);
    }

    @Override
    public LLVMValueRef visitNestedExp(SysYParser.NestedExpContext ctx) {
        return visit(ctx.exp());
    }

    @Override
    public LLVMValueRef visitLValExp(SysYParser.LValExpContext ctx) {
        /**
         *  lVal
         *    : IDENT (L_BRACKT exp R_BRACKT)*
         *    ;
         */
        if (!ctx.lVal().L_BRACKT().isEmpty()) {
            throw new RuntimeException("Array Unimplemented!");
        }
        String varName = ctx.lVal().IDENT().getText();
        LLVMValueRef var = curScope.resolve(varName);
        return LLVMBuildLoad(builder, var, varName);
    }

    @Override
    public LLVMValueRef visitUnaryExp(SysYParser.UnaryExpContext ctx) {
        LLVMValueRef oprand = visit(ctx.exp());
        switch (ctx.unaryOp().getText()) {
            case "+":
                return oprand;

            case "-":
                return LLVMBuildNeg(builder, oprand, newTemp());

            case "!":
                LLVMValueRef tmp = LLVMBuildICmp(builder, LLVMIntNE, zero_i32, oprand, newTemp());
                tmp = LLVMBuildXor(builder, tmp, one_i1, newTemp());
                return LLVMBuildZExt(builder, tmp, i32Type, newTemp());

            default:
                throw new IllegalArgumentException("No such a unary op : " + ctx.unaryOp().getText());
        }
    }

    @Override
    public LLVMValueRef visitNumberExp(SysYParser.NumberExpContext ctx) {
        int number = Number.parseInteger(ctx.getText());
        return LLVMConstInt(i32Type, number, SEXT_TRUE);
    }

    @Override
    public LLVMValueRef visitReturnStatement(SysYParser.ReturnStatementContext ctx) {
        /**
         *  stmt :
         *      ......
         *      | RETURN (exp)? SEMICOLON                      #ReturnStatement
         *      ;
         */
        if (ctx.exp() != null) {
            LLVMValueRef retVal = visit(ctx.exp());
            LLVMBuildRet(builder, retVal);
        } else {
            LLVMBuildRetVoid(builder);
        }
        return null;
    }

    /**
     *  cond
     *    : exp                                            #ExpCond
     *    | cond (LT | GT | LE | GE) cond                  #RelationalCond
     *    | cond (EQ | NEQ) cond                           #EqualityCond
     *    | cond AND cond                                  #AndCond
     *    | cond OR cond                                   #OrCond
     *    ;
     */
    @Override
    public LLVMValueRef visitExpCond(SysYParser.ExpCondContext ctx) {
        return visit(ctx.exp());
    }

    @Override
    public LLVMValueRef visitOrCond(SysYParser.OrCondContext ctx) {
        LLVMValueRef oprand1 = visit(ctx.cond(0));
        LLVMValueRef bool1 = LLVMBuildICmp(builder, LLVMIntNE, oprand1, zero_i32, newTemp());

        LLVMBasicBlockRef hold = curBasicBlock;
        LLVMBasicBlockRef falseBlock = LLVMAppendBasicBlock(curFunction, "OR_FALSE");
        LLVMBasicBlockRef trueBlock = LLVMAppendBasicBlock(curFunction, "OR_TRUE");
        LLVMBasicBlockRef endBlock = LLVMAppendBasicBlock(curFunction, "OR_END");
        LLVMValueRef addr = LLVMBuildAlloca(builder, i32Type, "addr");
        LLVMBuildCondBr(builder, bool1, trueBlock, falseBlock);

        checkout(falseBlock);
        LLVMValueRef oprand2 = visit(ctx.cond(1));
        LLVMBuildStore(builder, oprand2, addr);
        LLVMBuildBr(builder, endBlock);

        checkout(trueBlock);
        LLVMBuildStore(builder, oprand1, addr);
        LLVMBuildBr(builder, endBlock);

        checkout(endBlock);
        LLVMValueRef oprand = LLVMBuildLoad(builder, addr, newTemp());
        LLVMValueRef bool = LLVMBuildICmp(builder, LLVMIntNE, oprand, zero_i32, newTemp());
        return LLVMBuildZExt(builder, bool, i32Type, newTemp());
    }

    @Override
    public LLVMValueRef visitAndCond(SysYParser.AndCondContext ctx) {
        LLVMValueRef oprand1 = visit(ctx.cond(0));
        LLVMValueRef bool1 = LLVMBuildICmp(builder, LLVMIntNE, oprand1, zero_i32, newTemp());

        LLVMBasicBlockRef hold = curBasicBlock;
        LLVMBasicBlockRef falseBlock = LLVMAppendBasicBlock(curFunction, "AND_FALSE");
        LLVMBasicBlockRef trueBlock = LLVMAppendBasicBlock(curFunction, "AND_TRUE");
        LLVMBasicBlockRef endBlock = LLVMAppendBasicBlock(curFunction, "AND_END");
        LLVMValueRef addr = LLVMBuildAlloca(builder, i32Type, "addr");
        LLVMBuildCondBr(builder, bool1, trueBlock, falseBlock);

        checkout(trueBlock);
        LLVMValueRef oprand2 = visit(ctx.cond(1));
        LLVMBuildStore(builder, oprand2, addr);
        LLVMBuildBr(builder, endBlock);

        checkout(falseBlock);
        LLVMBuildStore(builder, oprand1, addr);
        LLVMBuildBr(builder, endBlock);

        checkout(endBlock);
        LLVMValueRef oprand = LLVMBuildLoad(builder, addr, newTemp());
        LLVMValueRef bool = LLVMBuildICmp(builder, LLVMIntNE, oprand, zero_i32, newTemp());
        return LLVMBuildZExt(builder, bool, i32Type, newTemp());
    }

    @Override
    public LLVMValueRef visitEqualityCond(SysYParser.EqualityCondContext ctx) {
        LLVMValueRef oprand1 = visit(ctx.cond(0));
        LLVMValueRef oprand2 = visit(ctx.cond(1));
        LLVMValueRef value_i1;
        switch (ctx.op.getType()) {
            case SysYLexer.EQ:
                value_i1 = LLVMBuildICmp(builder, LLVMIntEQ, oprand1, oprand2, newTemp());
                return LLVMBuildZExt(builder, value_i1, i32Type, newTemp());

            case SysYLexer.NEQ:
                value_i1 = LLVMBuildICmp(builder, LLVMIntNE, oprand1, oprand2, newTemp());
                return LLVMBuildZExt(builder, value_i1, i32Type, newTemp());

            default:
                throw new IllegalArgumentException("No such a op : " + ctx.op.getText());
        }
    }

    @Override
    public LLVMValueRef visitRelationalCond(SysYParser.RelationalCondContext ctx) {
        LLVMValueRef oprand1 = visit(ctx.cond(0));
        LLVMValueRef oprand2 = visit(ctx.cond(1));
        LLVMValueRef value_i1;
        switch (ctx.op.getType()) {
            case SysYLexer.LT:
                value_i1 = LLVMBuildICmp(builder, LLVMIntSLT, oprand1, oprand2, newTemp());
                return LLVMBuildZExt(builder, value_i1, i32Type, newTemp());

            case SysYLexer.GT:
                value_i1 = LLVMBuildICmp(builder, LLVMIntSGT, oprand1, oprand2, newTemp());
                return LLVMBuildZExt(builder, value_i1, i32Type, newTemp());

            case SysYLexer.LE:
                value_i1 = LLVMBuildICmp(builder, LLVMIntSLE, oprand1, oprand2, newTemp());
                return LLVMBuildZExt(builder, value_i1, i32Type, newTemp());

            case SysYLexer.GE:
                value_i1 = LLVMBuildICmp(builder, LLVMIntSGE, oprand1, oprand2, newTemp());
                return LLVMBuildZExt(builder, value_i1, i32Type, newTemp());

            default:
                throw new IllegalArgumentException("No such a op : " + ctx.op.getText());
        }
    }

    public void dump(String path) {
        System.out.println("⏳  dump ir into " + path + " ...");
        if (LLVMPrintModuleToFile(module, path, error) != 0) {    // module是你自定义的LLVMModuleRef对象
            LLVMDisposeMessage(error);
        } else {
            System.out.println("🌟 dump done. ");
        }
    }

    public void show() {
        LLVMDumpModule(module);
    }

    public LLVMModuleRef result() {
        return module;
    }
    
    private String newTemp() {
        return "tmp" + nTemp++;
    }

    private void checkout(LLVMBasicBlockRef block) {
        curBasicBlock = block;
        LLVMPositionBuilderAtEnd(builder, curBasicBlock);
    }
}
