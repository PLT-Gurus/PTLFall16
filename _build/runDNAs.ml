open Ast
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

print_endline "\n\n------ DNA AST# ------";;
let lexbuf = Lexing.from_string file_str;;
let program = Parser.program Scanner.token lexbuf;;
let res_str = string_of_program program;;
print_endline res_str;;

let ast_file="dnas_ast.txt" in
  let oc=open_out ast_file in
    fprintf oc "%s\n" res_str;;

print_endline "\n\n------ LLVM # ------";;
let llvm_prog = Codegen.translate program;;
print_string (Llvm.string_of_llmodule llvm_prog);;

let lvm_file="dnas_llvm.ll" in
  let oc=open_out lvm_file in
    fprintf oc "%s\n" (Llvm.string_of_llmodule llvm_prog);;

  (*Llvm_analysis.assert_valid_module m;*)

  