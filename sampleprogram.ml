open Ast
(*Help print things *)


let rec expr = function
Litint(typ) -> Litint typ
| Sequence(typ) -> Sequence typ

let string_of_typename = function
Int -> "int"
|  Seq -> "sequence"
 
let string_of_lit = function
Litint(typ) -> string_of_int typ
| Sequence(typ) -> typ

let rec stmt = function 
	VDecl(typ, identifier, expr1) -> [|(string_of_typename typ) ; identifier; string_of_lit (expr expr1)|]

let _ =
	let lexbuf = Lexing.from_channel stdin in 
	let expr = Parser.program Scanner.token lexbuf in 
	let result = stmt expr in 
	print_endline ("");
	print_endline(result.(0));
	print_endline(result.(1));
	print_endline(result.(2));
	