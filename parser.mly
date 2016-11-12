%{
open Ast
%}

%token ASSIGN
%token OR AND NOT NEG
%token LT LEQ EQ NEQ GEQ GT
%token PLUS MINUS TIMES DIVIDE MODULO EXPONENTIAL
%token COMPLEMENT TRANSCRIBE  TRANSLATE  TRANSLATETWO
%token BEGIN END IF ELSEIF ELSE THEN FOR WHILE CONTINUE BREAK
%token NUC INT DOUBLE AA BOOL CHAR VOID STRING
%token CODON SEQUENCE
%token TRUE FALSE

%token LPAREN RPAREN LBRACK RBRACK
%token SEMI COMMA COLON
%token INCLUDE
%token RETURN EOF
%token LOCAL VARIABLE

%token <int> INT_LIT
%token <string> ID
%token <string> SEQUENCE_LIT
%token <float> DOUBLE_LIT
%token <string> STRING_LIT


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
%right NOT         COMPLEMENT   NEG
%left  LPAREN      RPAREN

%start program
%type <Ast.program> program

%%

program: decls EOF {$1}

decls: 	{{variables = []; stmts = []; body = []; funcs = [];}}
    |	decls collection {{ variables = $1.variables @ fst $2 ; stmts = $1.stmts @ snd $2 ; body= $1.body @ [$2]; funcs = $1.funcs;}}

    |	decls func_decl {{ variables = $1.variables; stmts = $1.stmts; body=$1.body; funcs = $1.funcs @ [$2] }}


block:
    {{variables = []; stmts = [];body=[];funcs=[];}}
    |   block collection {{ variables = $1.variables @ fst $2 ; stmts = $1.stmts @ snd $2 ; body= $1.body @ [$2]; funcs = [];}}


vdecl:
	typ ID ASSIGN expr SEMI    { $1, $2, $4 }


func_decl:
    typ ID LPAREN formals_opt RPAREN block END
    {{ typ = $1; fname = $2; formals = $4; variables = $6.variables; stmts = $6.stmts; body = $6.body;}}

formals_opt:
    /* nothing */ {[]}
    |   formal_list { List.rev $1 }

formal_list:
     typ ID {[($1, $2)]}
    |formal_list COMMA typ ID { ($3, $4) :: $1 }

vdecl_list:
     /* nothing */  {[]}
    |vdecl_list vdecl   { $2 :: $1 }

collection:
    |   vdecl   {($1::[],[])}
    |   stmt    {([],$1::[])}

typ:
	    INT 	{Int}
    |   BOOL    {Bool}
    |   VOID    {Void}
    |   CHAR    {Char}
    |   DOUBLE  {Double}
    |   AA      {Aa}
    |   NUC     {Nuc}
    |	SEQUENCE {Seq}
    |   STRING {Str}

stmt_list:
     /* nothing */  {[]}
    |stmt_list stmt { $2 :: $1 }

stmt:
        expr SEMI   { Expr $1 }
    |   RETURN expr_opt SEMI    {Return $2 }
    |	BEGIN stmt_list END   {Block(List.rev $2)}
    |   FOR expr_opt SEMI expr SEMI expr_opt THEN block END { For($2, $4, $6, $8.stmts, $8.variables, $8.body) }
    |   WHILE expr THEN block END  { While($2, $4.stmts, $4.variables, $4.body) }
    |   IF expr THEN block bstmt END{ If($2, $4.stmts, $4.variables, $4.body, $5) }

bstmt:
        /* nothing */   {Nobranching}
    |   ELSEIF expr THEN block bstmt { Elseif($2, $4.stmts, $4.variables, $4.body, $5) }
    |   ELSE block   { Else($2.stmts, $2.variables, $2.body)}

expr:
        TRUE    { Litbool(true) }
    |   FALSE   { Litbool(false) }
    |   ID      { Id($1) }
    |   INT_LIT {Litint($1)}
    |   DOUBLE_LIT  { Litdouble($1) }
    |	SEQUENCE_LIT  { Sequence($1) }
    |   STRING_LIT    { Stringlit($1)}
    |	expr PLUS expr  {Binop($1,Add,$3)}
    |	expr MINUS expr {Binop($1,Sub,$3)}
    |	expr TIMES expr {Binop($1,Mult,$3)}
    |	expr DIVIDE expr{Binop($1,Div,$3)}
    |	expr MODULO expr{Binop($1,Mod,$3)}
    |	expr EXPONENTIAL expr {Binop($1,Exp,$3)}
    |	expr AND expr {Binop($1,And,$3)}
    |	expr OR expr{Binop($1,Or,$3)}
    |	expr EQ expr  {Binop($1,Equal,$3)}
    |	expr NEQ expr {Binop($1,Neq,$3)}
    |	expr LT expr {Binop($1,Less,$3)}
    |	expr LEQ expr{Binop($1,Leq,$3)}
    |	expr GT expr {Binop($1,Greater,$3)}
    |	expr GEQ expr{Binop($1,Geq,$3)}
    |   MINUS expr %prec NEG {Lunop(Neg, $2)}
    |   NOT expr {Lunop(Not, $2)}
    |	COMPLEMENT expr {Lunop(Comp, $2)}
    |   expr TRANSCRIBE {Runop($1, Transcb)}
    |   expr TRANSLATE  {Runop($1, Translt)}
    |   expr TRANSLATETWO   {Runop($1, Translttwo)}
    |   ID ASSIGN expr  {Assign($1, $3)}
    |   LPAREN expr RPAREN  {$2}
    |   ID LPAREN actuals_opt RPAREN    {Call($1, $3)}

expr_opt:
        /* nothing */   {Noexpr}
    |   expr    { $1 }

actuals_opt:
        /* nothing */ { [] }
    |   actuals_list { List.rev $1 }

actuals_list:
        expr { [$1] }
    |   actuals_list COMMA expr { $3 :: $1 }
