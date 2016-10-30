type token =
  | VARIABLE
  | EOF
  | ASSIGN
  | SEMI
  | INT
  | NUC
  | SEQUENCE
  | PLUS
  | MINUS
  | TIMES
  | DIVIDE
  | INT_LIT of (int)
  | ID of (string)
  | SEQUENCE_LIT of (string)

val program :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.program
