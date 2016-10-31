open Ast
(*Help print things *)


let rec expr = function
Litint(typ) -> Litint typ
| Sequence(typ) -> Sequence typ
| Binop(e1,op,e2) ->
	let v1 = expr e1 and v2 = expr e2 in
	match op with
		Add -> v1 + v2
	|   Sub -> v1 - v2
	|   Mult -> v1 * v2
	|   Div -> v1 / v2

let string_of_typename = function
Int -> "int"
|  Seq -> "sequence"

let string_of_lit = function
Litint(typ) -> string_of_int typ
| Sequence(typ) -> typ

let rec stmt = function
	VDecl(typ, identifier, expr1) -> [|(string_of_typename typ) ; identifier; string_of_lit (expr expr1)|]
| 	Semi -> [||]

let _ =
	let lexbuf = Lexing.from_channel stdin in
	let expr = Parser.program Scanner.token lexbuf in
	let result = stmt expr in
	let resultlist = Array.to_list result in
	List.map print_endline resultlist
