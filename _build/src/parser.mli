type token =
  | ASSIGN
  | OR
  | AND
  | NOT
  | NEG
  | LT
  | LEQ
  | EQ
  | NEQ
  | GEQ
  | GT
  | PLUS
  | MINUS
  | TIMES
  | DIVIDE
  | MODULO
  | EXPONENTIAL
  | STRCAT
  | COMPLEMENT
  | TRANSCRIBE
  | TRANSLATE
  | TRANSLATETWO
  | BEGIN
  | END
  | IF
  | ELSEIF
  | ELSE
  | THEN
  | FOR
  | WHILE
  | CONTINUE
  | BREAK
  | SIZEOF
  | FREAD
  | READ
  | CAST
  | NUC
  | INT
  | DOUBLE
  | AA
  | BOOL
  | CHAR
  | VOID
  | STRING
  | DNA
  | RNA
  | CODON
  | SEQUENCE
  | PEPTIDE
  | TRUE
  | FALSE
  | LPAREN
  | RPAREN
  | LBRACK
  | RBRACK
  | SEMI
  | COMMA
  | COLON
  | PERIOD
  | INCLUDE
  | RETURN
  | EOF
  | LOCAL
  | VARIABLE
  | INT_LIT of (int)
  | ID of (string)
  | SEQUENCE_LIT of (string)
  | CHAR_LIT of (char)
  | NUC_LIT of (char)
  | AA_LIT of (char)
  | DNA_LIT of (string)
  | RNA_LIT of (string)
  | PEP_LIT of (string)
  | DOUBLE_LIT of (float)
  | STRING_LIT of (string)

val program :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.program
