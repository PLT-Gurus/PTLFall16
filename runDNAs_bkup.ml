open Ast
(*Help print things *)

(*functions : File Reading*)
open Printf
 
let read_whole_chan chan =
  let buf = Buffer.create 65536 in
  let rec loop () =
    let line = input_line chan in
    Buffer.add_string buf line;
    Buffer.add_char buf '\n';
    loop () in
  try
    loop ()
  with
    End_of_file -> Buffer.contents buf
  
let read_whole_file filename =
  let chan = open_in filename in
  read_whole_chan chan

let file="test.dnas";;
let file_str=read_whole_file file;;

print_endline "\n\n------ DNA # ------";;
print_endline "Src File :";;	
print_endline file_str;;

(*functions : Printing AST*)

let string_of_expr expr=
	"One expr"

(*print vari & vari list*)
let rec string_of_vari_list l_vari=
	String.concat "" (List.map string_of_vari l_vari)

and string_of_vari vdecl=
	"One variable\n"

(*print stmt & stmt list*)
let rec string_of_stmt stmt=function
	 Block(l_stmt)->
	 	"{\n" ^ String.concat "" (List.map string_of_stmt l_stmt) ^ "}\n"
	|If(cond,l_stmt,l_vari,next_stmt)->
		"Stmt:if->\n" ^ 
		"if_cond=" ^ string_of_expr cond ^ 
		"stmt=" ^ (String.concat "" (List.map string_of_stmt l_stmt)) ^
		"vari=" ^ string_of_vari_list l_vari ^
		string_of_stmt next_stmt
	|For(strt,cond,step,l_stmt,l_vari)->
		"Stmt:for->\n" ^ 
		"init=" ^ string_of_expr strt ^ 
		"end_cond=" ^ string_of_expr cond ^ 
		"step_len=" ^ string_of_expr step ^ 
		"local_vari=" ^ string_of_vari_list l_vari ^
		"body=" ^ (String.concat "" (List.map string_of_stmt l_stmt))
	|While(cond,l_stmt,l_vari)->
		"Stmt:while->\n" ^ 
		"cond=" ^ string_of_expr cond ^
		"local_vari=" ^ string_of_vari_list l_vari ^
		"body=" ^ (String.concat "" (List.map string_of_stmt l_stmt))
	|Return(exp)->
		"Stmt:return->\n" ^ 
		"value=" ^ string_of_expr exp
	|Expr(exp)->
		"Stmt:expr->\n" ^ 
		"value=" ^ string_of_expr exp
	|Elseif(cond,l_stmt,l_vari,b_stmt)->
		"Stmt:elseif->\n" ^ 
		"if_cond=" ^ string_of_expr cond ^
		"local_vari=" ^ string_of_vari_list l_vari ^
		"body=" ^ (String.concat "" (List.map string_of_stmt l_stmt)) ^
		string_of_stmt b_stmt
	|Else(l_stmt,l_vari)->
		"Stmt:else->\n" ^ 
		"local_vari=" ^ string_of_vari_list l_vari ^
		"body=" ^ (String.concat "" (List.map string_of_stmt l_stmt))
	|Nobranching->
		"\n"


let string_of_func func_decl=
	"One func\n"

let string_of_program program=
	let l_var=program.variables in
	let l_stm=program.stmts in
	let l_fun=program.funcs in
		"Vari List:\n   " ^ String.concat " , " (List.map string_of_vari l_var) ^ "\n" ^
		"Stmt List:\n   " ^ String.concat " , " (List.map string_of_stmt l_stm) ^ "\n" ^
		"Func List:\n   " ^ String.concat " , " (List.map string_of_func l_fun) ^ "\n"

(*main*)
let _ =
	let lexbuf = Lexing.from_string file_str in
	let program = Parser.program Scanner.token lexbuf in
	let res_str = string_of_program program in
		print_endline res_str;;

