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
  | NUC
  | INT
  | DOUBLE
  | AA
  | BOOL
  | CHAR
  | VOID
  | CODON
  | SEQUENCE
  | TRUE
  | FALSE
  | LPAREN
  | RPAREN
  | SEMI
  | COMMA
  | INCLUDE
  | RETURN
  | EOF
  | LOCAL
  | VARIABLE
  | INT_LIT of (int)
  | ID of (string)
  | SEQUENCE_LIT of (string)
  | CHAR_LIT of (char)
  | DOUBLE_LIT of (float)

val program :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.program
