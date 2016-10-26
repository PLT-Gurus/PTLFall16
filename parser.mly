/* Ocamlyacc parser for MicroC */
%{
open Ast
%}

%token VARIABLE EOF ASSIGN SEMI INT NUC SEQUENCE
%token <int> INT_LIT
%token <string> ID
%token <string> SEQUENCE_LIT

%start program
%type <Ast.program> program
./
%%

program: 
	stmt EOF {$1}
stmt:
 	typename ID ASSIGN expr  { VDecl($1,$2,$4) }
typ:
	INT_LIT {Litint($1)}
|	SEQUENCE_LIT {Sequence($1)}

expr:
    typ 	{$1}

typename:
	INT 	{Int}
|	SEQUENCE {Seq}
