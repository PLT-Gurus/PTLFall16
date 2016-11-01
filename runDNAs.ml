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
(*print_endline "Src File :";;	
print_endline file_str;;*)
(*functions : Printing AST*)

(*print expr*)
let string_of_op = function
	  Add 		-> "+"
	| Sub 		-> "-"
	| Mult		-> "*"
	| Div 		-> "/"
	| Mod 		-> "%"
	| Exp 		-> "^"
	| And 		-> "&"
	| Or  		-> "|"
	| Equal 	-> "=="
	| Neq 		-> "!="
	| Less 		-> "<"
	| Leq 		-> "<="
	| Greater 	-> ">"
	| Geq		-> ">="


let string_of_typ = function
	  Int  		->"int"
	| Bool 		->"bool"
	| Void 		->"nul"
	| Char 		->"char"
	| Double 	->"double"
	| Aa 		->"AA"
	| Nuc 		->"nuc"
	| Codon 	->"codon"
	| Seq 		->"seq"

let string_of_uop = function
	  Expon 	-> "^" (*not quite sure about this one*)
	| Neg 		-> "-"
	| Comp 		-> "@"
	| Transcb 	-> "->"
	| Translt 	-> "+>"
	| Translttwo-> "%>" 
	| Not		-> "!"

let rec string_of_expr = function
	  Litint(i) ->
	  	string_of_int i
	| Id(str)->
	  	str
	| Sequence(str)->
		str
	| Litbool(true)->
		"true"
	| Litbool(false)->
		"false"
	| Litchar(ch)->
		String.make 1 ch
	| Litdouble(flt)->
		string_of_float flt
	| Binop(exp1,op,exp2)->
		string_of_expr exp1 ^ string_of_op op ^
		string_of_expr exp2
	| Lunop(uop,exp)->
		string_of_uop uop ^ string_of_expr exp
	| Runop(exp,uop)->
		string_of_expr exp ^ string_of_uop uop
	| Assign(str,exp)->
		str ^ "=" ^ string_of_expr exp
	| Call(str,l_expr)->
		str ^ "(" ^ 
		String.concat "," (List.map string_of_expr l_expr) ^
		")"
	| Noexpr->
		""

(*print vari & vari list*)
let rec string_of_vari_list l_vari=
	String.concat "\n" (List.map string_of_vari l_vari)

and string_of_vari (t, id, exp) = 
	string_of_typ t ^ " " ^ id ^ " " ^ string_of_expr exp


(*print stmt & stmt list*)
let rec string_of_stmt n stmt=
	 let blk=String.make (n*2) ' ' in
	 match stmt with
	|Block(l_stmt)->
	 	blk ^ "{\n" ^ string_of_stmt_list n l_stmt ^ blk ^ "}\n"
	
	|If(cond,l_stmt,l_vari,next_stmt)->
		blk ^ "if->\n" ^ 
		blk ^ "  cond= (" ^ string_of_expr cond ^ ")\n" ^
		blk ^ "  vari= " ^ string_of_vari_list l_vari ^ "\n" ^
		blk ^ "  body={\n" ^ string_of_stmt_list (n+2) l_stmt ^ blk ^ "  }\n" ^
		string_of_stmt n next_stmt
	
	|For(strt,cond,step,l_stmt,l_vari)->
		blk ^ "for->\n" ^ 
		blk ^ "  init= " ^ string_of_expr strt ^ "\n" ^ 
		blk ^ "  cond= " ^ string_of_expr cond ^ "\n" ^ 
		blk ^ "  step= " ^ string_of_expr step ^ "\n" ^ 
		blk ^ "  vari= " ^ string_of_vari_list l_vari ^ "\n" ^
		blk ^ "  body={\n" ^ string_of_stmt_list (n+2) l_stmt ^ blk ^ "  }\n"
	
	|While(cond,l_stmt,l_vari)->
		blk ^ "while->\n" ^ 
		blk ^ "  cond= (" ^ string_of_expr cond ^ ")\n" ^
		blk ^ "  vari= " ^ string_of_vari_list l_vari ^ "\n" ^
		blk ^ "  body={\n" ^ string_of_stmt_list (n+2) l_stmt ^ blk ^ "  }\n"
	
	|Return(exp)->
		blk ^ "return->\n" ^ 
		blk ^ "  value= " ^ string_of_expr exp ^ "\n"
	
	|Expr(exp)->
		blk ^ "expr->\n" ^ 
		blk ^ "  value= " ^ string_of_expr exp ^ "\n"
	
	|Elseif(cond,l_stmt,l_vari,b_stmt)->
		blk ^ "elseif->\n" ^ 
		blk ^ "  cond= (" ^ string_of_expr cond ^ ")\n" ^
		blk ^ "  vari= " ^ string_of_vari_list l_vari ^ "\n" ^
		blk ^ "  body={\n" ^ string_of_stmt_list (n+2) l_stmt ^ blk ^ "  }\n" ^
		string_of_stmt n b_stmt
	
	|Else(l_stmt,l_vari)->
		blk ^ "else->\n" ^ 
		blk ^ "  vari= " ^ string_of_vari_list l_vari ^ "\n" ^
		blk ^ "  body={\n" ^ string_of_stmt_list (n+2) l_stmt ^ blk ^ "  }\n"
	
	|Nobranching->
		"\n"

and string_of_stmt_list n l_stmt=
	String.concat "" (List.map (string_of_stmt n) l_stmt)

let string_of_func func_decl=
	"One func\n"

let string_of_program program=
	let l_var=program.variables in
	let l_stm=program.stmts in
	let l_fun=program.funcs in
		"----- Vari List -----\n" ^ String.concat "" (List.map string_of_vari l_var) ^ "\n" ^
		"----- Stmt List -----\n" ^ String.concat "" (List.map (string_of_stmt 0) l_stm) ^ "\n" ^
		"----- Func List -----\n" ^ String.concat "" (List.map string_of_func l_fun) ^ "\n"

(*main*)
let _ =
	let lexbuf = Lexing.from_string file_str in
	let program = Parser.program Scanner.token lexbuf in
	let res_str = string_of_program program in
		print_endline res_str;;
