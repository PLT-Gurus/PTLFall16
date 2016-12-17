open Ast


let report_duplicate exceptf list = 
				let rec helper = function
					n1 :: n2 :: __ when n1 = n2 -> raise (Failure (exceptf n1))
					| _:: t -> helper t
					| [] -> ()
				in helper (List.sort compare list)
in

let _ =
	let lexbuf = Lexing.from_channel stdin in
	let ast = Parser.program Scanner.token lexbuf in
	let astTest = (ast.variables, ast.funcs) in
	Semant.check astTest;