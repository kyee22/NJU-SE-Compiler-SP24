
parser grammar SysYParser;

options {
    tokenVocab = SysYLexer;
}

program
    : compUnit
    ;


// 编译单元
compUnit
    : (funcDef | decl)* EOF
    ;

// 声明
decl : constDecl
     | varDecl
     ;


// 常量声明
constDecl : CONST bType constDef (COMMA constDef)* SEMICOLON
          ;

// 基本类型
bType : INT
      ;

// 常数定义 ConstDef → Ident { '[' ConstExp ']' } '=' ConstInitVal
constDef : IDENT (L_BRACKT constExp R_BRACKT)* ASSIGN constInitVal
         ;

// 常量初值 ConstInitVal → ConstExp
// | '{' [ ConstInitVal { ',' ConstInitVal } ] '}'
constInitVal : constExp
             | L_BRACE (constInitVal (COMMA constInitVal)*)? R_BRACE
             ;

// 变量声明 VarDecl → BType VarDef { ',' VarDef } ';'
varDecl : bType varDef (COMMA varDef)* SEMICOLON
        ;

//变量定义 VarDef → Ident { '[' ConstExp ']' }
//| Ident { '[' ConstExp ']' } '=' InitVal
varDef  : IDENT (L_BRACKT constExp R_BRACKT)*
        | IDENT (L_BRACKT constExp R_BRACKT)* ASSIGN initVal
        ;

//变量初值 InitVal → Exp | '{' [ InitVal { ',' InitVal } ] '}'
initVal : exp
        | L_BRACE (initVal (COMMA initVal)*)? R_BRACE
        ;


//函数定义 FuncDef → FuncType Ident '(' [FuncFParams] ')' Block
funcDef : funcType funcName L_PAREN (funcFParams)? R_PAREN block
        ;

// helper rule: funcName
funcName : IDENT
         ;


//函数类型 FuncType → 'void' | 'int'
funcType : VOID
         | INT
         ;

//函数形参表 FuncFParams → FuncFParam { ',' FuncFParam }
funcFParams : funcFParam (COMMA funcFParam)*
            ;

// 函数形参 FuncFParam → BType Ident ['[' ']' { '[' Exp ']' }]
funcFParam : bType IDENT (L_BRACKT R_BRACKT (L_BRACKT exp R_BRACKT)*)?
           ;

//语句块 Block → '{' { BlockItem } '}'
block : L_BRACE (blockItem)* R_BRACE
      ;

//语句块项 BlockItem → Decl | Stmt
blockItem : decl
          | stmt
          ;

//语句 Stmt → LVal '=' Exp ';' | [Exp] ';' | Block
//| 'if' '( Cond ')' Stmt [ 'else' Stmt ]
//| 'while' '(' Cond ')' Stmt
//| 'break' ';' | 'continue' ';'
//| 'return' [Exp] ';'

// without tag
//stmt : lVal ASSIGN exp SEMICOLON
//     | (exp)? SEMICOLON
//     | block
//     | IF L_PAREN cond R_PAREN stmt (ELSE stmt)?
//     | WHILE L_PAREN cond R_PAREN stmt
//     | BREAK SEMICOLON
//     | CONTINUE SEMICOLON
//     | RETURN (exp)? SEMICOLON
//     ;

// with tag
stmt : lVal ASSIGN exp SEMICOLON                                    #AssignStatement
     | (exp)? SEMICOLON                                             #ExprStatement
     | block                                                        #BlockStatement
     | IF L_PAREN cond R_PAREN ifStmt=stmt (ELSE elseStmt=stmt)?    #IfStatement
     | WHILE L_PAREN cond R_PAREN stmt                              #WhileStatement
     | BREAK SEMICOLON                                              #BreakStatement
     | CONTINUE SEMICOLON                                           #ContinueStatement
     | RETURN (exp)? SEMICOLON                                      #ReturnStatement
     ;

//表达式 Exp → AddExp 注：SysY 表达式是 int 型表达式
exp
   : L_PAREN exp R_PAREN                            #NestedExp
   | lVal                                           #LValExp
   | number                                         #NumberExp
   | funcName L_PAREN funcRParams? R_PAREN          #CallExp
   | unaryOp exp                                    #UnaryExp
   | exp op=(MUL | DIV | MOD) exp                   #MulExp
   | exp op=(PLUS | MINUS) exp                      #PlusExp
   ;

cond
   : exp                                            #ExpCond
   | cond op=(LT | GT | LE | GE) cond               #RelationalCond
   | cond op=(EQ | NEQ) cond                        #EqualityCond
   | cond AND cond                                  #AndCond
   | cond OR cond                                   #OrCond
   ;

lVal
   : IDENT (L_BRACKT exp R_BRACKT)*
   ;

number
   : INTEGER_CONST
   ;

unaryOp
   : PLUS
   | MINUS
   | NOT
   ;

funcRParams
   : param (COMMA param)*
   ;

param
   : exp
   ;

constExp
   : exp
   ;


v1 : v2 | v1 I v2;
v2 : v3 | v2 '+' v3 | I v3;
v3 : ')' v1 '*' | '(';