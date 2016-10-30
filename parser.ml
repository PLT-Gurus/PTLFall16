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

open Parsing;;
let _ = parse_error;;
# 3 "parser.mly"
open Ast
# 22 "parser.ml"
let yytransl_const = [|
  257 (* VARIABLE *);
    0 (* EOF *);
  258 (* ASSIGN *);
  259 (* SEMI *);
  260 (* INT *);
  261 (* NUC *);
  262 (* SEQUENCE *);
  263 (* PLUS *);
  264 (* MINUS *);
  265 (* TIMES *);
  266 (* DIVIDE *);
    0|]

let yytransl_block = [|
  267 (* INT_LIT *);
  268 (* ID *);
  269 (* SEQUENCE_LIT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\003\000\005\000\005\000\006\000\006\000\
\006\000\006\000\006\000\004\000\004\000\000\000"

let yylen = "\002\000\
\002\000\002\000\001\000\004\000\001\000\001\000\001\000\003\000\
\003\000\003\000\003\000\001\000\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\003\000\012\000\013\000\014\000\000\000\000\000\
\000\000\001\000\002\000\000\000\000\000\005\000\006\000\004\000"

let yydgoto = "\002\000\
\006\000\007\000\008\000\009\000\016\000\000\000"

let yysindex = "\004\000\
\253\254\000\000\000\000\000\000\000\000\000\000\006\000\004\255\
\252\254\000\000\000\000\007\255\247\254\000\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000"

let yytablesize = 9
let yytable = "\003\000\
\004\000\014\000\005\000\015\000\001\000\010\000\011\000\012\000\
\013\000"

let yycheck = "\003\001\
\004\001\011\001\006\001\013\001\001\000\000\000\003\001\012\001\
\002\001"

let yynames_const = "\
  VARIABLE\000\
  EOF\000\
  ASSIGN\000\
  SEMI\000\
  INT\000\
  NUC\000\
  SEQUENCE\000\
  PLUS\000\
  MINUS\000\
  TIMES\000\
  DIVIDE\000\
  "

let yynames_block = "\
  INT_LIT\000\
  ID\000\
  SEQUENCE_LIT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt) in
    Obj.repr(
# 19 "parser.mly"
          (_1)
# 105 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'vdecl) in
    Obj.repr(
# 21 "parser.mly"
            (_1)
# 112 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 22 "parser.mly"
       (Semi)
# 118 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'typename) in
    let _2 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : 'typ) in
    Obj.repr(
# 24 "parser.mly"
                         ( VDecl(_1,_2,_4) )
# 127 "parser.ml"
               : 'vdecl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 26 "parser.mly"
         (Litint(_1))
# 134 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 27 "parser.mly"
               (Sequence(_1))
# 141 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'typ) in
    Obj.repr(
# 30 "parser.mly"
         (_1)
# 148 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 31 "parser.mly"
                 (Binop(_1,Add,_3))
# 156 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 32 "parser.mly"
                  (Binop(_1,Sub,_3))
# 164 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 33 "parser.mly"
                  (Binop(_1,Mul,_3))
# 172 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 34 "parser.mly"
                 (Binop(_1,Div,_3))
# 180 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 37 "parser.mly"
      (Int)
# 186 "parser.ml"
               : 'typename))
; (fun __caml_parser_env ->
    Obj.repr(
# 38 "parser.mly"
           (Seq)
# 192 "parser.ml"
               : 'typename))
(* Entry program *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let program (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.program)
