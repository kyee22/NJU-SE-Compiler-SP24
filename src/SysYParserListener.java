// Generated from ./src/SysYParser.g4 by ANTLR 4.9.1
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link SysYParser}.
 */
public interface SysYParserListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link SysYParser#program}.
	 * @param ctx the parse tree
	 */
	void enterProgram(SysYParser.ProgramContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#program}.
	 * @param ctx the parse tree
	 */
	void exitProgram(SysYParser.ProgramContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#compUnit}.
	 * @param ctx the parse tree
	 */
	void enterCompUnit(SysYParser.CompUnitContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#compUnit}.
	 * @param ctx the parse tree
	 */
	void exitCompUnit(SysYParser.CompUnitContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#decl}.
	 * @param ctx the parse tree
	 */
	void enterDecl(SysYParser.DeclContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#decl}.
	 * @param ctx the parse tree
	 */
	void exitDecl(SysYParser.DeclContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#constDecl}.
	 * @param ctx the parse tree
	 */
	void enterConstDecl(SysYParser.ConstDeclContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#constDecl}.
	 * @param ctx the parse tree
	 */
	void exitConstDecl(SysYParser.ConstDeclContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#bType}.
	 * @param ctx the parse tree
	 */
	void enterBType(SysYParser.BTypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#bType}.
	 * @param ctx the parse tree
	 */
	void exitBType(SysYParser.BTypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#constDef}.
	 * @param ctx the parse tree
	 */
	void enterConstDef(SysYParser.ConstDefContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#constDef}.
	 * @param ctx the parse tree
	 */
	void exitConstDef(SysYParser.ConstDefContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#constInitVal}.
	 * @param ctx the parse tree
	 */
	void enterConstInitVal(SysYParser.ConstInitValContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#constInitVal}.
	 * @param ctx the parse tree
	 */
	void exitConstInitVal(SysYParser.ConstInitValContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#varDecl}.
	 * @param ctx the parse tree
	 */
	void enterVarDecl(SysYParser.VarDeclContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#varDecl}.
	 * @param ctx the parse tree
	 */
	void exitVarDecl(SysYParser.VarDeclContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#varDef}.
	 * @param ctx the parse tree
	 */
	void enterVarDef(SysYParser.VarDefContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#varDef}.
	 * @param ctx the parse tree
	 */
	void exitVarDef(SysYParser.VarDefContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#initVal}.
	 * @param ctx the parse tree
	 */
	void enterInitVal(SysYParser.InitValContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#initVal}.
	 * @param ctx the parse tree
	 */
	void exitInitVal(SysYParser.InitValContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#funcDef}.
	 * @param ctx the parse tree
	 */
	void enterFuncDef(SysYParser.FuncDefContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#funcDef}.
	 * @param ctx the parse tree
	 */
	void exitFuncDef(SysYParser.FuncDefContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#funcName}.
	 * @param ctx the parse tree
	 */
	void enterFuncName(SysYParser.FuncNameContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#funcName}.
	 * @param ctx the parse tree
	 */
	void exitFuncName(SysYParser.FuncNameContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#funcType}.
	 * @param ctx the parse tree
	 */
	void enterFuncType(SysYParser.FuncTypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#funcType}.
	 * @param ctx the parse tree
	 */
	void exitFuncType(SysYParser.FuncTypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#funcFParams}.
	 * @param ctx the parse tree
	 */
	void enterFuncFParams(SysYParser.FuncFParamsContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#funcFParams}.
	 * @param ctx the parse tree
	 */
	void exitFuncFParams(SysYParser.FuncFParamsContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#funcFParam}.
	 * @param ctx the parse tree
	 */
	void enterFuncFParam(SysYParser.FuncFParamContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#funcFParam}.
	 * @param ctx the parse tree
	 */
	void exitFuncFParam(SysYParser.FuncFParamContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#block}.
	 * @param ctx the parse tree
	 */
	void enterBlock(SysYParser.BlockContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#block}.
	 * @param ctx the parse tree
	 */
	void exitBlock(SysYParser.BlockContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#blockItem}.
	 * @param ctx the parse tree
	 */
	void enterBlockItem(SysYParser.BlockItemContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#blockItem}.
	 * @param ctx the parse tree
	 */
	void exitBlockItem(SysYParser.BlockItemContext ctx);
	/**
	 * Enter a parse tree produced by the {@code AssignStatement}
	 * labeled alternative in {@link SysYParser#stmt}.
	 * @param ctx the parse tree
	 */
	void enterAssignStatement(SysYParser.AssignStatementContext ctx);
	/**
	 * Exit a parse tree produced by the {@code AssignStatement}
	 * labeled alternative in {@link SysYParser#stmt}.
	 * @param ctx the parse tree
	 */
	void exitAssignStatement(SysYParser.AssignStatementContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExprStatement}
	 * labeled alternative in {@link SysYParser#stmt}.
	 * @param ctx the parse tree
	 */
	void enterExprStatement(SysYParser.ExprStatementContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExprStatement}
	 * labeled alternative in {@link SysYParser#stmt}.
	 * @param ctx the parse tree
	 */
	void exitExprStatement(SysYParser.ExprStatementContext ctx);
	/**
	 * Enter a parse tree produced by the {@code BlockStatement}
	 * labeled alternative in {@link SysYParser#stmt}.
	 * @param ctx the parse tree
	 */
	void enterBlockStatement(SysYParser.BlockStatementContext ctx);
	/**
	 * Exit a parse tree produced by the {@code BlockStatement}
	 * labeled alternative in {@link SysYParser#stmt}.
	 * @param ctx the parse tree
	 */
	void exitBlockStatement(SysYParser.BlockStatementContext ctx);
	/**
	 * Enter a parse tree produced by the {@code IfStatement}
	 * labeled alternative in {@link SysYParser#stmt}.
	 * @param ctx the parse tree
	 */
	void enterIfStatement(SysYParser.IfStatementContext ctx);
	/**
	 * Exit a parse tree produced by the {@code IfStatement}
	 * labeled alternative in {@link SysYParser#stmt}.
	 * @param ctx the parse tree
	 */
	void exitIfStatement(SysYParser.IfStatementContext ctx);
	/**
	 * Enter a parse tree produced by the {@code WhileStatement}
	 * labeled alternative in {@link SysYParser#stmt}.
	 * @param ctx the parse tree
	 */
	void enterWhileStatement(SysYParser.WhileStatementContext ctx);
	/**
	 * Exit a parse tree produced by the {@code WhileStatement}
	 * labeled alternative in {@link SysYParser#stmt}.
	 * @param ctx the parse tree
	 */
	void exitWhileStatement(SysYParser.WhileStatementContext ctx);
	/**
	 * Enter a parse tree produced by the {@code BreakStatement}
	 * labeled alternative in {@link SysYParser#stmt}.
	 * @param ctx the parse tree
	 */
	void enterBreakStatement(SysYParser.BreakStatementContext ctx);
	/**
	 * Exit a parse tree produced by the {@code BreakStatement}
	 * labeled alternative in {@link SysYParser#stmt}.
	 * @param ctx the parse tree
	 */
	void exitBreakStatement(SysYParser.BreakStatementContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ContinueStatement}
	 * labeled alternative in {@link SysYParser#stmt}.
	 * @param ctx the parse tree
	 */
	void enterContinueStatement(SysYParser.ContinueStatementContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ContinueStatement}
	 * labeled alternative in {@link SysYParser#stmt}.
	 * @param ctx the parse tree
	 */
	void exitContinueStatement(SysYParser.ContinueStatementContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ReturnStatement}
	 * labeled alternative in {@link SysYParser#stmt}.
	 * @param ctx the parse tree
	 */
	void enterReturnStatement(SysYParser.ReturnStatementContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ReturnStatement}
	 * labeled alternative in {@link SysYParser#stmt}.
	 * @param ctx the parse tree
	 */
	void exitReturnStatement(SysYParser.ReturnStatementContext ctx);
	/**
	 * Enter a parse tree produced by the {@code PlusExp}
	 * labeled alternative in {@link SysYParser#exp}.
	 * @param ctx the parse tree
	 */
	void enterPlusExp(SysYParser.PlusExpContext ctx);
	/**
	 * Exit a parse tree produced by the {@code PlusExp}
	 * labeled alternative in {@link SysYParser#exp}.
	 * @param ctx the parse tree
	 */
	void exitPlusExp(SysYParser.PlusExpContext ctx);
	/**
	 * Enter a parse tree produced by the {@code MulExp}
	 * labeled alternative in {@link SysYParser#exp}.
	 * @param ctx the parse tree
	 */
	void enterMulExp(SysYParser.MulExpContext ctx);
	/**
	 * Exit a parse tree produced by the {@code MulExp}
	 * labeled alternative in {@link SysYParser#exp}.
	 * @param ctx the parse tree
	 */
	void exitMulExp(SysYParser.MulExpContext ctx);
	/**
	 * Enter a parse tree produced by the {@code CallExp}
	 * labeled alternative in {@link SysYParser#exp}.
	 * @param ctx the parse tree
	 */
	void enterCallExp(SysYParser.CallExpContext ctx);
	/**
	 * Exit a parse tree produced by the {@code CallExp}
	 * labeled alternative in {@link SysYParser#exp}.
	 * @param ctx the parse tree
	 */
	void exitCallExp(SysYParser.CallExpContext ctx);
	/**
	 * Enter a parse tree produced by the {@code NestedExp}
	 * labeled alternative in {@link SysYParser#exp}.
	 * @param ctx the parse tree
	 */
	void enterNestedExp(SysYParser.NestedExpContext ctx);
	/**
	 * Exit a parse tree produced by the {@code NestedExp}
	 * labeled alternative in {@link SysYParser#exp}.
	 * @param ctx the parse tree
	 */
	void exitNestedExp(SysYParser.NestedExpContext ctx);
	/**
	 * Enter a parse tree produced by the {@code LValExp}
	 * labeled alternative in {@link SysYParser#exp}.
	 * @param ctx the parse tree
	 */
	void enterLValExp(SysYParser.LValExpContext ctx);
	/**
	 * Exit a parse tree produced by the {@code LValExp}
	 * labeled alternative in {@link SysYParser#exp}.
	 * @param ctx the parse tree
	 */
	void exitLValExp(SysYParser.LValExpContext ctx);
	/**
	 * Enter a parse tree produced by the {@code UnaryExp}
	 * labeled alternative in {@link SysYParser#exp}.
	 * @param ctx the parse tree
	 */
	void enterUnaryExp(SysYParser.UnaryExpContext ctx);
	/**
	 * Exit a parse tree produced by the {@code UnaryExp}
	 * labeled alternative in {@link SysYParser#exp}.
	 * @param ctx the parse tree
	 */
	void exitUnaryExp(SysYParser.UnaryExpContext ctx);
	/**
	 * Enter a parse tree produced by the {@code NumberExp}
	 * labeled alternative in {@link SysYParser#exp}.
	 * @param ctx the parse tree
	 */
	void enterNumberExp(SysYParser.NumberExpContext ctx);
	/**
	 * Exit a parse tree produced by the {@code NumberExp}
	 * labeled alternative in {@link SysYParser#exp}.
	 * @param ctx the parse tree
	 */
	void exitNumberExp(SysYParser.NumberExpContext ctx);
	/**
	 * Enter a parse tree produced by the {@code OrCond}
	 * labeled alternative in {@link SysYParser#cond}.
	 * @param ctx the parse tree
	 */
	void enterOrCond(SysYParser.OrCondContext ctx);
	/**
	 * Exit a parse tree produced by the {@code OrCond}
	 * labeled alternative in {@link SysYParser#cond}.
	 * @param ctx the parse tree
	 */
	void exitOrCond(SysYParser.OrCondContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ExpCond}
	 * labeled alternative in {@link SysYParser#cond}.
	 * @param ctx the parse tree
	 */
	void enterExpCond(SysYParser.ExpCondContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ExpCond}
	 * labeled alternative in {@link SysYParser#cond}.
	 * @param ctx the parse tree
	 */
	void exitExpCond(SysYParser.ExpCondContext ctx);
	/**
	 * Enter a parse tree produced by the {@code AndCond}
	 * labeled alternative in {@link SysYParser#cond}.
	 * @param ctx the parse tree
	 */
	void enterAndCond(SysYParser.AndCondContext ctx);
	/**
	 * Exit a parse tree produced by the {@code AndCond}
	 * labeled alternative in {@link SysYParser#cond}.
	 * @param ctx the parse tree
	 */
	void exitAndCond(SysYParser.AndCondContext ctx);
	/**
	 * Enter a parse tree produced by the {@code EqualityCond}
	 * labeled alternative in {@link SysYParser#cond}.
	 * @param ctx the parse tree
	 */
	void enterEqualityCond(SysYParser.EqualityCondContext ctx);
	/**
	 * Exit a parse tree produced by the {@code EqualityCond}
	 * labeled alternative in {@link SysYParser#cond}.
	 * @param ctx the parse tree
	 */
	void exitEqualityCond(SysYParser.EqualityCondContext ctx);
	/**
	 * Enter a parse tree produced by the {@code RelationalCond}
	 * labeled alternative in {@link SysYParser#cond}.
	 * @param ctx the parse tree
	 */
	void enterRelationalCond(SysYParser.RelationalCondContext ctx);
	/**
	 * Exit a parse tree produced by the {@code RelationalCond}
	 * labeled alternative in {@link SysYParser#cond}.
	 * @param ctx the parse tree
	 */
	void exitRelationalCond(SysYParser.RelationalCondContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#lVal}.
	 * @param ctx the parse tree
	 */
	void enterLVal(SysYParser.LValContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#lVal}.
	 * @param ctx the parse tree
	 */
	void exitLVal(SysYParser.LValContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#number}.
	 * @param ctx the parse tree
	 */
	void enterNumber(SysYParser.NumberContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#number}.
	 * @param ctx the parse tree
	 */
	void exitNumber(SysYParser.NumberContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#unaryOp}.
	 * @param ctx the parse tree
	 */
	void enterUnaryOp(SysYParser.UnaryOpContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#unaryOp}.
	 * @param ctx the parse tree
	 */
	void exitUnaryOp(SysYParser.UnaryOpContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#funcRParams}.
	 * @param ctx the parse tree
	 */
	void enterFuncRParams(SysYParser.FuncRParamsContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#funcRParams}.
	 * @param ctx the parse tree
	 */
	void exitFuncRParams(SysYParser.FuncRParamsContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#param}.
	 * @param ctx the parse tree
	 */
	void enterParam(SysYParser.ParamContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#param}.
	 * @param ctx the parse tree
	 */
	void exitParam(SysYParser.ParamContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#constExp}.
	 * @param ctx the parse tree
	 */
	void enterConstExp(SysYParser.ConstExpContext ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#constExp}.
	 * @param ctx the parse tree
	 */
	void exitConstExp(SysYParser.ConstExpContext ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#v1}.
	 * @param ctx the parse tree
	 */
	void enterV1(SysYParser.V1Context ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#v1}.
	 * @param ctx the parse tree
	 */
	void exitV1(SysYParser.V1Context ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#v2}.
	 * @param ctx the parse tree
	 */
	void enterV2(SysYParser.V2Context ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#v2}.
	 * @param ctx the parse tree
	 */
	void exitV2(SysYParser.V2Context ctx);
	/**
	 * Enter a parse tree produced by {@link SysYParser#v3}.
	 * @param ctx the parse tree
	 */
	void enterV3(SysYParser.V3Context ctx);
	/**
	 * Exit a parse tree produced by {@link SysYParser#v3}.
	 * @param ctx the parse tree
	 */
	void exitV3(SysYParser.V3Context ctx);
}