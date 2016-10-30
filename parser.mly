/* Ocamlyacc parser for MicroC */
%{
open Ast
%}

%token VARIABLE EOF ASSIGN SEMI INT NUC SEQUENCE PLUS MINUS TIMES DIVIDE LPAREN RPAREN COMMA BEGIN END IF ELSEIF ELSE FOR WHILE CONTINUE BREAK 
%token INCLUDE LOCAL THEN RETURN MODULO EXPONENTIAL AND OR NOT EQ NEQ LT LEQ GT GEQ COMPLEMENT TRANSCRIBE TRANSLATE TRANSLATETWO BOOL VOID CHAR
%token DOUBLE AA CODON TRUE FALSE 
%token <int> INT_LIT
%token <string> ID
%token <string> SEQUENCE_LIT
%token <char> CHAR_LIT
%token <float> DOUBLE_LIT

%right ASSIGN
%left PLUS MINUS
%left TIMES DIVIDE
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
