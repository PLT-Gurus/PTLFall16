/* Ocamlyacc parser for MicroC */
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

decls: 	{[], []}
|	decls vdecl { ($2 :: fst $1), snd $1}
|	decls stmt {fst $1, ($2 :: snd $1) }




stmt_list:
	/* nothing */		{[]}
|	stmt_list stmt {$2::$1}

stmt:
 	expr SEMI {Expr $1}
|	BEGIN stmt_list END {Stmtlist(List.rev $2)}



vdecl:
	typename ID ASSIGN expr SEMI{ $1,$2,$4 }

expr:
    INT_LIT {Litint($1)}
|	SEQUENCE_LIT {Sequence($1)}
|	expr PLUS expr  {Binop($1,Add,$3)}
|	expr MINUS expr {Binop($1,Sub,$3)}
|	expr TIMES expr {Binop($1,Mul,$3)}
|	expr DIVIDE expr  {Binop($1,Div,$3)}
|   				{ Noexpr}

typename:
	INT 	{Int}
|	SEQUENCE {Seq}
