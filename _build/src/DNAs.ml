open Ast

type action = Ast | Llvm | Compile

let _ =
   let action = if Array.length Sys.argv > 1 then
    List.assoc Sys.argv.(1) [ ("-a", Ast);
            ("-l", Llvm);
            ("-c", Compile) ]
  else Compile in

  let lexbuf = Lexing.from_channel stdin in
  let ast = Parser.program Scanner.token lexbuf in
(*  Semant.check ast; *)
  match action with
    Ast-> print_string (Ast.string_of_program ast)
  | Llvm-> print_string (Llvm.string_of_llmodule (Codegen.translate ast))
  | Compile->let m = Codegen.translate ast in
    Llvm_analysis.assert_valid_module m;
    print_string (Llvm.string_of_llmodule m)
