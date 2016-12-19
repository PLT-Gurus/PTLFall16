open Llvm
open Llvm.MemoryBuffer
open Llvm_bitreader

let c_lib_path="lib/c_lib.bc"

let link_bc modu filename = 
	let llctx = Llvm.global_context () in
    let llmem = Llvm.MemoryBuffer.of_file filename in
    let llm = Llvm_bitreader.parse_bitcode llctx llmem in
    	ignore(Llvm_linker.link_modules' modu llm)