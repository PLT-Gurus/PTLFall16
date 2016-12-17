
(* Semantic checking for #DNA compiler *)

open Ast

module StringMap = Map.Make(String)
(* Semantic checking of a program.
   Returns void if successful,throws an exception if something is wrong.
   Check each global statement, then check each function
*)
(* Top-level functions - global checking functions *)


let globals = [];;

let symbols = ()
(*
List.fold_left (fun m (t, n) -> StringMap.add n t m) StringMap.empty func.formals
*)
(* Raise an exception if a given binding is to a void type *)
let check_not_void exceptf = function
	(Void, n) -> raise (Failure (exceptf n))
	| _ -> ()
;;
let type_of_identifier s = ()
	(*
		try StringMap.find s symbols
		with Not_found -> raise (Failure ("undeclared identifier " ^ s))
*)
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
	if List.mem "print_int" (List.map (fun fd -> fd.fname) funcs)
	then raise (Failure ("function print_int may not be defined")) else ();
	report_duplicate (fun n -> "duplicate function " ^ n) (List.map (fun fd -> fd.fname) funcs)
;;

let built_in_decls = StringMap.add "print_int"
	{ typ = Void; fname = "print_int"; formals = [(Int, "x")];
	  stmts = [] } (StringMap.singleton "print_str"
	{ typ = Void; fname = "print_str"; formals = [(Str, "x")];
	  stmts = [] })
;;
(*  the following needs to be nested
let function_decl s = try StringMap.find s function_decls
	with Not_found -> raise (Failure ("unrecognized function " ^ s))
;;
*)
(*  Min's version
let type_of_identifier s syms =
	try StringMap.find s syms
	with Not_found -> raise (Failure ("undeclared identifier " ^ s))
;;
*)



let check_stmt func =

	let rec expr = function
		Litint _ -> Int
		| Litbool _ -> Bool
		| Litchar _ -> Char
	(*	| Id s -> type_of_identifier s *)
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
	(*	| Assign(var, e) as ex -> let lt = type_of_identifier var
		and rt = expr e in
		check_assign lt rt (Failure ("illegal assignment " ^ string_of_typ lt ^
			" = " ^ string_of_typ rt ^ " in " ^
		string_of_expr ex))
		| Call(fname, actuals) as call -> let fd = function_decl fname in
		if List.length actuals != List.length fd.formals then
		raise (Failure ("expecting " ^ string_of_int
			(List.length fd.formals) ^ " arguments in " ^ string_of_expr call))
		else
			List.iter2 (fun (ft, _) e -> let et = expr e in
				ignore (check_assign ft et
					(Failure ("illegal actual argument found " ^ string_of_typ et ^
						" expected " ^ string_of_typ ft ^ " in " ^ string_of_expr e))))
			fd.formals actuals;
			fd.typ


			*)
		in	(* end of expression checking *)

		let check_bool_expr e = ()
		(*

		if expr e != Bool
			then raise (Failure ("expected Boolean expression in " ^ string_of_expr e))
			else ()

			*)
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
		(*	| Return e -> let t = expr e in if t = func.typ then () else
			raise (Failure ("return gives " ^ string_of_typ t ^ " expected " ^
				string_of_typ func.typ ^ " in " ^ string_of_expr e))
				*)
			| If(p, b1, b2) -> check_bool_expr p; stmt b1; stmt b2
			| For(e1, e2, e3, st) -> ignore (expr e1); check_bool_expr e2;
			ignore (expr e3); stmt st
			| While(p, s) -> check_bool_expr p; stmt s
			| Elseif (p, s1, s2) -> check_bool_expr p; stmt s1; stmt s2
			| Else (st) -> stmt st
		(*	| VDecl(t, s, e) -> List.find (fun s -> fst s = string_of_typ t) ["int";"bool";"void";"char";"double";"aa";"nuc";"codon";"seq";"str"];ignore(expr e) (*not sure how to do this one*)
			| Nobranching -> Void (*is this correct?*)
		*)

		in

		stmt (Block func.stmts)
;;

let check_func func =
	List.iter (check_not_void (fun n -> "illegal void formal " ^ n ^ " in " ^ func.fname)) func.formals;

	report_duplicate (fun n -> "duplicate formal " ^ n ^ " in " ^ func.fname) (List.map snd func.formals)
(*
	let symbols = List.fold_left (fun m (t, n) -> StringMap.add n t m) StringMap.empty func.formals
	in
*)
(*	check_stmt func *)


;;


let check prog =
	check_UDF_conflict prog.funcs;
	let function_decls = List.fold_left (fun m fd -> StringMap.add fd.fname fd m) built_in_decls prog.funcs
	in
		let dummy_func = {
			typ = Void;
			fname = "dummy_func";
			formals = [];
			stmts = prog.pstmts
			} in
		check_stmt dummy_func;
		List.iter check_func prog.funcs
