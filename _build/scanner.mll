(* Ocamllex scanner for DNA# *)

{ open Parser }

rule token = parse
  [' ' '\t' '\r' '\n'] { token lexbuf } (* Whitespace *)
| "/*"     { comment lexbuf }           (* Comments *)
| "variable"{VARIABLE}					(* Test, remove after *)
(* Assignment Bop *)
| '='		{ASSIGN}
(* Non-functional stuff & flow control key words *)
| '('       {LPAREN}
| ')'       {RPAREN}
| ';'       {SEMI}
| ','       {COMMA}
| "begin"   {BEGIN}
| "end"     {END}
| "if"      {IF}
| "elseif"  {ELSEIF}
| "else"    {ELSE}
| "for"     {FOR}
| "while"   {WHILE}
| "continue"{CONTINUE}
| "break"   {BREAK}
| "include" {INCLUDE}
| "local"   {LOCAL}
| "then"    {THEN}
| "return"  {RETURN}
(* Arithmetic Binary Operators*)
| '+'		{PLUS}
| '-'		{MINUS}
| '*'		{TIMES}
| '/'		{DIVIDE}
| '%'       {MODULO}
| '^'       {EXPONENTIAL}
(* Logical Binary Operators *)
| '&'       {AND}
| '|'       {OR}
| '!'       {NOT}
(* Relational Binary Operators *)
| "=="      {EQ}
| "!="      {NEQ}
| '<'       {LT}
| "<="      {LEQ}
| '>'       {GT}
| ">="      {GEQ}
(* Bio Expression Operators *)
| '@'       {COMPLEMENT}
| "->"      {TRANSCRIBE}
| "+>"      {TRANSLATE}
| "%>"      {TRANSLATETWO}
(*Data Types *)
| "int"     {INT}
| "bool"    {BOOL}
| "void"    {VOID}
| "char"    {CHAR}
| "double"  {DOUBLE}
| "aa"      {AA}
| "nuc"     {NUC}
| "string" 	{STRING}
(*Complex Data Types *)
| "codon"   {CODON}
| "DNA"     {SEQUENCE}						(* MAKE GENERAL FUNCTION TO ALLOW RNA INPUT*)
| "RNA"     {SEQUENCE}
| "peptide" {SEQUENCE}
(* Literals *)
| "true"    {TRUE}
| "false"   {FALSE}

(* Removed char lit *)

| ['0'-'9']+ as lxm { INT_LIT(int_of_string lxm) }

| (((['0'-'9']+ '.' ['0'-'9']* | '.' ['0'-'9']+ )(['e''E']['+''-']? ['0'-'9']+)?) | (['0'-'9']+ (['e''E']['+''-']? ['0'-'9']+))) as lxm {DOUBLE_LIT(float_of_string lxm)}

| ['a'-'z' 'A'-'Z' '_']['a'-'z' 'A'-'Z' '0'-'9' '_']* as lxm { ID(lxm)}

| '#'       {stringparse lexbuf}

| '"'([^'"']* as lxm)'"'  {STRING_LIT(lxm)}

| eof { EOF }

| _ as char { raise (Failure("Main: illegal character " ^ Char.escaped char)) }

and comment = parse
  "*/" { token lexbuf }
| _    { comment lexbuf }

and stringparse= parse
  '#'   {token lexbuf}
| ['A'-'D''G''H''K''M''N''R'-'T''U'-'W''a'-'d''g''h''k''m''n''r'-'t''u'-'w']+ as lxm	{SEQUENCE_LIT(lxm)}		(*Why does this work? Shouldn't it register new line as an illegal character?? *)
| _ as char {raise (Failure("SCAN ERROR : illegal character in sequence " ^ Char.escaped char))}
