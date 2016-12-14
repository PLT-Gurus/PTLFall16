open Ast

let _ =
	let lexbuf = Lexing.from_channel stdin in
	let ast = Parser.program Scanner.token lexbuf in
	let astTest = (ast.variables, ast.funcs) in
	Semant.check astTest;