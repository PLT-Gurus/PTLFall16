(* Ocamllex scanner for DNA# *)

{ open Parser }

let seq = ['A''G''C''a''g''c']*
let dna = ['A''G''T''C''a''g''t''c']+
let rna = ['A''G''U''C''a''g''u''c']+
let nuc = ['A''G''U''C''a''g''u''c''T''t']
let dnuc = ['A''G''T''C''a''g''t''c']
let rnuc = ['A''G''U''C''a''g''u''c']
let aa = ['A''C'-'I''K'-'N''P'-'T''U'-'W''Y''a''c'-'i''k'-'n''p'-'t''u'-'w''y']
let pep = (aa '-')+ aa

rule token = parse
  [' ' '\t' '\r' '\n'] { token lexbuf } (* Whitespace *)
| "/*"      { comment lexbuf }           (* Comments *)
| "//"      {singlecom lexbuf}          (* single line comment*)
| "variable"{VARIABLE}					(* Test, remove after *)
(* Assignment Bop *)
| '='		{ASSIGN}
(* Non-functional stuff & flow control key words *)
| '.'		{PERIOD}
| "length"    {SIZEOF}
| '('       {LPAREN}
| ')'       {RPAREN}
| '['		{LBRACK}
| ']' 		{RBRACK}
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
(*| "import"	{IMPORT} *)
(* Concat operator, specifically for data of string types (strings, DNA, RNA, etc. ) *)
| "+=" 		{STRCAT}
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
| "Seq"     {SEQUENCE}
| "codon"   {CODON}
| "DNA"     {DNA}						(* MAKE GENERAL FUNCTION TO ALLOW RNA INPUT*)
| "RNA"     {RNA}
| "Pep"     {PEPTIDE}						(*WRITE CODE TO ALLOW FOR PEPTIDE ENTRIES *)
(* Literals *)
| "true"    {TRUE}
| "false"   {FALSE}

(* Removed char lit *)
| ['0'-'9']+ as lxm { INT_LIT(int_of_string lxm) }

| (((['0'-'9']+ '.' ['0'-'9']* | '.' ['0'-'9']+ )(['e''E']['+''-']? ['0'-'9']+)?) | (['0'-'9']+ (['e''E']['+''-']? ['0'-'9']+))) as lxm {DOUBLE_LIT(float_of_string lxm)}

| ['a'-'z' 'A'-'Z' '_']['a'-'z' 'A'-'Z' '0'-'9' '_']* as lxm { ID(lxm)}

| '"'([^'"']* as lxm)'"'  {STRING_LIT(lxm)}

| '#'(seq as lxm)       {SEQUENCE_LIT(lxm)}
| '#'(dna as lxm)       {DNA_LIT(lxm)}
| '#'(rna as lxm)       {RNA_LIT(lxm)}
| '#'(pep as lxm)       {PEP_LIT(lxm)}
| '#'(dna)([^';'] as char)  {raise (Failure("SCAN ERROR : illegal character '" ^ Char.escaped char ^ "' in DNA sequence ."))}
| '#'(rnuc)+([^';'] as char)  {raise (Failure("SCAN ERROR : illegal character '" ^ Char.escaped char ^ "' in RNA sequence ."))}
| '#'(aa '-')*([^';'] as char)   {raise (Failure("SCAN ERROR : illegal character '" ^ Char.escaped char ^ "' in Peptide sequence ."))}
| eof { EOF }

| _ as char { raise (Failure("Main: illegal character " ^ Char.escaped char)) }

and comment = parse
  "*/" { token lexbuf }
| _    { comment lexbuf }

and singlecom = parse
  ['\n' '\r']    {token lexbuf}
| _     {singlecom lexbuf}

and stringparse= parse
  ';'   {token lexbuf}
| ['A''C'-'I''K'-'N''P'-'T''U'-'W''Y''a''c'-'i''k'-'n''p'-'t''u'-'w''y'] as char	{raise(Failure("SCAN ERROR : amino acid " ^ Char.escaped char ^ "is not a sequence"))}
| _ as char {raise (Failure("SCAN ERROR : illegal character in sequence " ^ Char.escaped char))}
