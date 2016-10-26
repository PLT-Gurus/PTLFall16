(* Ocamllex scanner for DNA# *)

{ open Parser }

rule token = parse
  [' ' '\t' '\r' '\n'] { token lexbuf } (* Whitespace *)
| "/*"     { comment lexbuf }           (* Comments *)
| "variable" {VARIABLE}					(* Test, remove after *)
| "="		 {ASSIGN}
| ";"		 {SEMI}
(*Operators *)
| "+"		{PLUS}
| "-"		{MINUS}
| "*"		{TIMES}
| "/"		{DIVIDE}
(* Variables *)
| "int"		 {INT}
| "nuc" 	 {NUC} 						(*nucleotide*)
| "DNA"		 {SEQUENCE}						(* MAKE GENERAL FUNCTION TO ALLOW RNA INPUT*)
| "RNA"		 {SEQUENCE}
| "#"		{stringparse lexbuf}
| ['0'-'9']+ as lxm { INT_LIT(int_of_string lxm) }
| ['a' -'z']+ as lxm { ID(lxm)}
| eof { EOF }
| _ as char { raise (Failure("illegal character " ^ Char.escaped char)) }

and comment = parse
  "*/" { token lexbuf }
| _    { comment lexbuf }

and stringparse= parse
	['a' 't' 'g' 'c' 'u']* as lxm	{SEQUENCE_LIT(lxm)}		(*Why does this work? Shouldn't it register new line as an illegal character?? *)		
|   _ as char {raise (Failure("illegal character in sequence " ^ Char.escaped char))}

