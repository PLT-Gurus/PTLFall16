(* Semantic checking for the MicroC compiler *)

open Ast

module StringMap = Map.Make(String)

(* Semantic checking of a program. Returns void if successful,
   throws an exception if something is wrong.

   Check each global variable, then check each function *)

let check (globals, functions) =
  (* helper function to determine if duplicates exist in a list *)
  let report_duplicate exceptf list = 
    let rec helper = function
    n1 :: n2 :: __ when n1 = n2 -> raise (Failure (exceptf n1))
      | _:: t -> helper t
      | [] -> ()
    in helper (List.sort compare list)
  in
  let getVars (a, b, c) = b in
  (* Semantically check global variables *)
  report_duplicate (fun n -> "duplicate global variable " ^ n) (List.map getVars globals);

