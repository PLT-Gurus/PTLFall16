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

program: 
	stmt EOF {$1}
stmt:
 	vdecl SEMI{$1}
|	SEMI      {Semi}
vdecl:
	typename ID ASSIGN typ  { VDecl($1,$2,$4) }
typ:
	INT_LIT      {Litint($1)}
|	SEQUENCE_LIT {Sequence($1)}

expr:
        typ 	        {$1}
|	expr PLUS expr  {Binop($1,Add,$3)}
|	expr MINUS expr {Binop($1,Sub,$3)}
|	expr TIMES expr {Binop($1,Mul,$3)}
|	expr PLUS expr  {Binop($1,Div,$3)}

typename:
	INT 	{Int}
|	SEQUENCE {Seq}
