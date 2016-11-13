open Ast
(*Help print things *)

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

let _ =
	let lexbuf = Lexing.from_string file_str in
	let program = Parser.program Scanner.token lexbuf in
	let res_str = string_of_program program in
	let llvm_prog = Codegen.translate program in
    print_endline res_str;
		(*Llvm_analysis.assert_valid_module m;*)
		print_endline "\n\n------ LLVM # ------";
    print_string (Llvm.string_of_llmodule llvm_prog);;