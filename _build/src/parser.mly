%{
open Ast
%}

%token ASSIGN
%token OR AND NOT NEG
%token LT LEQ EQ NEQ GEQ GT
%token PLUS MINUS TIMES DIVIDE MODULO EXPONENTIAL STRCAT
%token COMPLEMENT TRANSCRIBE  TRANSLATE  TRANSLATETWO
%token BEGIN END IF ELSEIF ELSE THEN FOR WHILE CONTINUE BREAK SIZEOF
%token NUC INT DOUBLE AA BOOL CHAR VOID STRING DNA RNA
%token CODON SEQUENCE PEPTIDE
%token TRUE FALSE

%token LPAREN RPAREN LBRACK RBRACK
%token SEMI COMMA COLON PERIOD
%token INCLUDE
%token RETURN EOF
%token LOCAL VARIABLE

%token <int> INT_LIT
%token <string> ID
%token <string> SEQUENCE_LIT
%token <string> DNA_LIT
%token <string> RNA_LIT
%token <string> PEP_LIT
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

decls:  {{pstmts = []; funcs = [];}}
    |   decls stmt {{pstmts = $1.pstmts @ [$2] ; funcs = $1.funcs;}}

    |   decls func_decl {{pstmts = $1.pstmts; funcs = $1.funcs @ [$2] }}

func_decl:
    typ ID LPAREN formals_opt RPAREN stmt_list END
    {{ typ = $1; fname = $2; formals = $4; stmts = List.rev $6;}}

formals_opt:
    /* nothing */ {[]}
    |   formal_list { List.rev $1 }

formal_list:
     typ ID {[($1, $2)]}
    |formal_list COMMA typ ID { ($3, $4) :: $1 }



typ:
        INT     {Int}
    |   BOOL    {Bool}
    |   VOID    {Void}
    |   CHAR    {Char}
    |   DOUBLE  {Double}
    |   AA      {Aa}
    |   NUC     {Nuc}
    |   CODON   {Codon}
    |   SEQUENCE {Seq}
    |   DNA     {DNA}
    |   RNA     {RNA}
    |   PEPTIDE {Pep}
    |   STRING  {Str}

stmt_list:
     /* nothing */  {[]}
    |   stmt_list stmt { $2 :: $1 }

stmt:
        expr SEMI   { Expr $1 }
    |   RETURN expr_opt SEMI    {Return $2 }
    |   BEGIN stmt_list END   {Block(List.rev $2)}
    |   FOR expr_opt SEMI expr SEMI expr_opt THEN stmt_list END { For($2, $4, $6, Block(List.rev $8)) }
    |   WHILE expr THEN stmt_list END  { While($2, Block(List.rev $4)) }
    |   IF expr THEN stmt_list bstmt END{ If($2, Block(List.rev $4), $5) }
    |   typ ID ASSIGN expr SEMI    { VDecl($1, $2, $4)}
    |   typ LBRACK expr RBRACK ID SEMI { ArrayDecl($1,$3, $5)} /* CHANGE LATER TO FORCE ASSIGNMENT */

bstmt:
        /* nothing */   {Nobranching}
    |   ELSEIF expr THEN stmt_list bstmt { Elseif($2, Block(List.rev $4), $5) }
    |   ELSE stmt_list   { Else(Block(List.rev $2))}

expr:
        TRUE    { Litbool(true) }
    |   FALSE   { Litbool(false) }
    |   ID      { Id($1) }
    |   INT_LIT {Litint($1)}
    |   DOUBLE_LIT  { Litdouble($1) }
    |   SEQUENCE_LIT  { Sequence($1) }
    |   ID LBRACK expr RBRACK {ArrayAcc($1, $3)}
    |   DNA_LIT  { Litdna($1) }
    |   RNA_LIT  { Litrna($1) }
    |   PEP_LIT  { Litpep($1) }
    |   STRING_LIT    { Stringlit($1)}
    |   expr PLUS expr  {Binop($1,Add,$3)}
    |   expr MINUS expr {Binop($1,Sub,$3)}
    |   expr TIMES expr {Binop($1,Mult,$3)}
    |   expr DIVIDE expr{Binop($1,Div,$3)}
    |   expr MODULO expr{Binop($1,Mod,$3)}
    |   expr EXPONENTIAL expr {Binop($1,Exp,$3)}
    |   expr AND expr {Binop($1,And,$3)}
    |   expr OR expr{Binop($1,Or,$3)}
    |   expr EQ expr  {Binop($1,Equal,$3)}
    |   expr NEQ expr {Binop($1,Neq,$3)}
    |   expr LT expr {Binop($1,Less,$3)}
    |   expr LEQ expr{Binop($1,Leq,$3)}
    |   expr GT expr {Binop($1,Greater,$3)}
    |   expr GEQ expr{Binop($1,Geq,$3)}
    |   MINUS expr %prec NEG {Lunop(Neg, $2)}
    |   NOT expr {Lunop(Not, $2)}
    |   COMPLEMENT expr {Lunop(Comp, $2)}
    |   expr TRANSCRIBE {Runop($1, Transcb)}
    |   expr TRANSLATE  {Runop($1, Translt)}
    |   expr TRANSLATETWO   {Runop($1, Translttwo)}
    |   expr STRCAT expr {Strcat($1, $3)}
    |   ID ASSIGN expr  {Assign($1, $3)}
    |   ID LBRACK expr RBRACK ASSIGN expr {ArrayAssign($1,$3,$6)}
    |   LPAREN expr RPAREN  {$2}
    |   ID LPAREN actuals_opt RPAREN    {Call($1, $3)}
    |   ID PERIOD SIZEOF {SizeOf($1)}
    |   LT typ GT expr {Typecast($2, $4)}

expr_opt:
        /* nothing */   {Noexpr}
    |   expr    { $1 }

actuals_opt:
        /* nothing */ { [] }
    |   actuals_list { List.rev $1 }

actuals_list:
        expr { [$1] }
    |   actuals_list COMMA expr { $3 :: $1 }
