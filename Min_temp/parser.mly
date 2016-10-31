%{
open Ast
%}

(* Assignment Binary Operator *)
%token ASSIGN
(* Logical Binary Operators *)
%token OR AND NOT
(* Relational Binary Operators *)
%token LT LEQ EQ NEQ GEQ GT
(* Arithmetic Binary Operators *)
%token PLUS MINUS TIMES DIVIDE MODULO EXPONENTIAL
(* Bio Expression Operators *)
%token COMPLEMENT TRANSCRIBE  TRANSLATE  TRANSLATETWO
(* Control Flow  *)
%token BEGIN END IF ELSEIF ELSE THEN FOR WHILE CONTINUE BREAK
(* Data Types  *)
%token NUC INT DOUBLE AA BOOL CHAR VOID
(* Complex Data Types *)
%token CODON SEQUENCE
(* Literal  *)
%token TRUE FALSE

(* Others  *)
%token LPAREN RPAREN
%token SEMI COMMA
%token INCLUDE
%token RETURN EOF
%token LOCAL VARIABLE

%token <int> INT_LIT
%token <string> ID
%token <string> SEQUENCE_LIT
%token <char> CHAR_LIT
%token <float> DOUBLE_LIT

%right ASSIGN
%left  OR
%left  AND
%left  LT          LEQ        EQ      NEQ  GEQ   GT
%left  PLUS        MINUS
%left  TIMES       DIVIDE     MODULO
%left  TRANSLATETWO
%left  TRANSLATE
%left  TRANSCRIBE
%left  EXPONENTIAL
%right NOT         COMPLEMENT
%left  LPAREN      RPAREN

%start program
%type <Ast.program> program

%%

program:	decls EOF {$1}

decls: 	{{variables = []; stmts = []; funcs = [];}}
|	decls vdecl {{ ($2 :: $1.variables); $1.stmts; $1.funcs;}}
|	decls stmt {{ $1.variables; $2 :: $1.stmts; $1.funcs }}
|	decls func_decl {{ $1.variables; $1.stmts; $2 :: $1.funcs }}
