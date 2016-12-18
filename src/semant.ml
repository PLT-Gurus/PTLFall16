
(* Semantic checking for #DNA compiler *)

open Ast

module StringMap = Map.Make(String)
(* Semantic checking of a program.
   Returns void if successful,throws an exception if something is wrong.
   Check each global statement, then check each function
*)
(* Top-level functions - global checking functions *)


let globals_list = ref StringMap.empty;;
let locals_list = ref StringMap.empty;;
let count = ref true;;
let v_types_list = ["int"; "bool"; "char"; "double"; "aa"; "nuc"; "codon"; "seq"; "string"; "DNA"; "RNA"; "str"];;
let types_map = List.fold_left (fun m (t) -> StringMap.add t true m) StringMap.empty v_types_list;;


(* Raise an exception if a given binding is to a void type *)
let check_not_void exceptf = function
	(Void, n) -> raise (Failure (exceptf n))
	| _ -> ()
;;

let check_v_type t = try ignore(StringMap.find (string_of_typ t) types_map)
	with Not_found -> raise (Failure ("unrecognized type " ^ (string_of_typ t)))
;;


(* check for duplicates *)
let report_duplicate exceptf list =
	let rec helper = function
		n1 :: n2 :: __ when n1 = n2 -> raise (Failure (exceptf n1))
		| _:: t -> helper t
		| [] -> ()
	in helper (List.sort compare list)
;;

(* Raise an exception of the given rvalue type cannot be assigned to
the given lvalue type *)

let check_assign lvaluet rvaluet err =
	if lvaluet == rvaluet then lvaluet else raise err








(* function checking starts from here *)
(*  check user defined functions conflict with built-in functions
	function over loading to change this later  *)
let check_UDF_conflict funcs =
	if List.mem "print" (List.map (fun fd -> fd.fname) funcs)
	then raise (Failure ("function print may not be defined")) else ();
	report_duplicate (fun n -> "duplicate function " ^ n) (List.map (fun fd -> fd.fname) funcs)
;;

let built_in_decls = StringMap.empty
;;

let function_decl s function_decls = try StringMap.find s function_decls
	with Not_found -> raise (Failure ("unrecognized function " ^ s))
;;

(*  Min's version
let type_of_identifier s syms =
	try StringMap.find s syms
	with Not_found -> raise (Failure ("undeclared identifier " ^ s))
;;
*)



let check_stmt func function_decls =



	let type_of_identifier s =

		try StringMap.find s !(locals_list)
			with Not_found -> raise (Failure ("undeclared identifier " ^ s))
	in

	let rec expr = function
		Litint _ -> Int
		| Litbool _ -> Bool
		| Litchar _ -> Char
		| Id s -> type_of_identifier s (* there is an issue for order of initialization *)
		| Litdna _ -> Str
		| Litrna _ -> Str
		| Litpep _ -> Str
		| LitCodon _ -> Str
		| Sequence _ -> Str (* is this correct? *)
		| Stringlit _ -> Str (* is this correct?  *)
		| Litdouble _ -> Double (*is this correct? *)
		| Binop(e1, op, e2) as e -> let t1 = expr e1 and t2 = expr e2 in
		(match op with
			Add | Sub | Mult | Div | Exp when t1 = Int && t2 = Int -> Int
			| Add | Sub | Mult | Div | Exp when t1 = Double && t2 = Double -> Double
			| Mod when t1 = Int && t2 = Int -> Int
			| Equal | Neq when t1 = t2 -> Bool
			| Less | Leq | Greater | Geq when t1 = Int && t2 = Int -> Bool
			| And | Or when t1 = Bool && t2 = Bool -> Bool
			| _ -> raise (Failure ("illegal binary operator " ^
				string_of_typ t1 ^ " " ^ string_of_op op ^ " " ^
				string_of_typ t2 ^ " in " ^ string_of_expr e))
		)
		| Lunop(op, e) as ex -> let t = expr e in
		(match op with
			Neg when t = Int -> Int
			| Comp when t = Str -> Str
			| Not when t = Bool -> Bool
			| _ -> raise (Failure ("illegal left unary operator " ^ string_of_uop op ^
				string_of_typ t ^ " in " ^ string_of_expr ex)))
		| Runop(e, op) as ex -> let t = expr e in
		(match op with
			Expon when t = Int -> Int   (* Exponential should be a binary operator *)
			| Transcb when t = Seq -> Seq
			| Translt when t = Seq -> Seq
			| Translttwo when t = Seq -> Aa
			| _ -> raise (Failure ("illegal right unary operator " ^ string_of_uop op ^
				string_of_typ t ^ " in " ^ string_of_expr ex)))
		| Noexpr -> Void
		| Assign(var, e) as ex -> let lt = type_of_identifier var
		and rt = expr e in
		check_assign lt rt (Failure ("illegal assignment " ^ string_of_typ lt ^
			" = " ^ string_of_typ rt ^ " in " ^
		string_of_expr ex))
		| Call(fname, actuals) as call -> if fname = "print" then Void
			else( let fd = function_decl fname function_decls in
				if List.length actuals != List.length fd.formals then
					raise (Failure ("expecting " ^ string_of_int
					(List.length fd.formals) ^ " arguments in " ^ string_of_expr call))
				else
					List.iter2 (fun (ft, _) e -> let et = expr e in
					ignore (check_assign ft et
						(Failure ("illegal actual argument found " ^ string_of_typ et ^
						" expected " ^ string_of_typ ft ^ " in " ^ string_of_expr e))))
						fd.formals actuals;
						fd.typ	)

		in	(* end of expression checking *)

		let check_bool_expr e =
			if expr e != Bool then raise (Failure ("expected Boolean expression in " ^ string_of_expr e))
			else ()
		in

		(* stmt checking *)
		let rec stmt = function
			Block sl -> let rec check_block = function
				[Return _ as s] -> stmt s
				| Return _ :: _ -> raise (Failure "nothing may follow a return")
				| Block sl :: ss -> check_block (sl @ ss)
				| s :: ss -> stmt s ; check_block ss
				| [] -> ()
			in check_block sl
			| Expr e -> ignore (expr e)
			| Return e -> let t = expr e in if t = func.typ then () else
			raise (Failure ("return gives " ^ string_of_typ t ^ " expected " ^
				string_of_typ func.typ ^ " in " ^ string_of_expr e))
			| If(p, b1, b2) -> check_bool_expr p; stmt b1; stmt b2
			| For(e1, e2, e3, st) -> ignore (expr e1); check_bool_expr e2;
			ignore (expr e3); stmt st
			| While(p, s) -> check_bool_expr p; stmt s
			| Elseif (p, s1, s2) -> check_bool_expr p; stmt s1; stmt s2
			| Else (st) -> stmt st
			| VDecl(t, s, e) ->
				ignore(check_v_type t);
				(locals_list) := StringMap.add s t !(locals_list);
				ignore(let lt = t and rt = expr e in check_assign lt rt (Failure ("illegal assignment " ^ string_of_typ lt ^
					" = " ^ string_of_typ rt ^ " in " ^ s ^" = "^
				string_of_expr e)))

			| Nobranching -> () (*is this correct?*)

		in

		stmt (Block func.stmts)
;;

let check_func func function_decls =

	List.iter (check_not_void (fun n -> "illegal void formal " ^ n ^ " in " ^ func.fname)) func.formals;

	report_duplicate (fun n -> "duplicate formal " ^ n ^ " in " ^ func.fname) (List.map snd func.formals);
	if !(count) then ()
	else (locals_list) := List.fold_left (fun m (t, n) -> StringMap.add n t m) !(locals_list) func.formals;
(*
	let symbols = List.fold_left (fun m (t, n) -> StringMap.add n t m) StringMap.empty func.formals
	in
*)
	check_stmt func function_decls;
	if !(count) then (
		(globals_list) := !(locals_list);
		(count) := false;	)
	else
		(locals_list) := StringMap.empty
;;


let check prog =
	check_UDF_conflict prog.funcs;
	let func_decls = List.fold_left (fun m fd -> StringMap.add fd.fname fd m) built_in_decls prog.funcs
	in
		let dummy_func = {
			typ = Void;
			fname = "dummy_func";
			formals = [];
			stmts = prog.pstmts
			} in
		check_stmt dummy_func func_decls;
		List.iter (fun n -> check_func n func_decls) prog.funcs
