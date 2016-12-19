
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
let v_types_list = ["int"; "bool"; "char"; "double"; "aa"; "nuc"; "codon"; "seq"; "DNA"; "RNA"; "Peptide"; "str"];;
let types_map = List.fold_left (fun m (t) -> StringMap.add t true m) StringMap.empty v_types_list;;


(* Raise an exception if a given binding is to a void type *)
let check_not_void exceptf = function
	(Void, n) -> raise (Failure (exceptf n))
	| _ -> ()
;;

let check_v_type t = try ignore(StringMap.find (string_of_typ t) types_map)
	with Not_found -> raise (Failure ("unrecognized type " ^ (string_of_typ t)))
;;

let map_array_type t =
	match t with
	| Int -> ArrayInt
	| Double -> ArrayDouble
	| Str -> ArrayStr
	| Bool -> ArrayBool
	| Char -> ArrayChar
	| Aa -> ArrayAa
	| Nuc -> ArrayNuc
	| Codon -> ArrayCodon
	| Seq -> ArraySeq
	| DNA -> ArrayDNA
	| RNA -> ArrayRNA
	| Pep -> ArrayPep
	| _ -> ArrayInt
;;

let array_type_unfold t =
	match t with
	| ArrayInt -> Int
	| ArrayDouble -> Double
	| ArrayStr -> Str
	| ArrayBool -> Bool
	| ArrayChar -> Char
	| ArrayAa -> Aa
	| ArrayNuc -> Nuc
	| ArrayCodon -> Codon
	| ArraySeq -> Seq
	| ArrayDNA -> DNA
	| ArrayRNA -> RNA
	| ArrayPep -> Pep
	| Str -> Char
	| DNA -> Nuc
	| RNA -> Nuc
	| Pep -> Aa
	| _ -> Int
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
	match lvaluet with
	  DNA -> if rvaluet == DNA || rvaluet == Seq then lvaluet else raise err
	| RNA -> if rvaluet == RNA || rvaluet == Seq then lvaluet else raise err
	| Pep -> lvaluet
	| _ -> if lvaluet == rvaluet then lvaluet else raise err

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
		| Litdna _ -> DNA
		| Litrna _ -> RNA
		| Litpep _ -> Pep
		| LitCodon _ -> Str
		| Sequence _ -> Seq (* is this correct? *)
		| Stringlit _ -> Str (* is this correct?  *)
		| Litdouble _ -> Double (*is this correct? *)
		| ArrayAcc(s,e) -> let check_int_expr3 e =
				if expr e != Int then raise (Failure ("expected Integer expression in " ^ string_of_expr e))
				else ()
			in check_int_expr3 e;
			array_type_unfold (type_of_identifier s)

(*		| Strcat(e1, e2) as ex -> let lt = expr e1
			and rt = expr e2 in
			check_assign lt rt (Failure ("illegal concatenation " ^ string_of_typ lt ^
			" = " ^ string_of_typ rt ^ " in " ^
			string_of_expr ex))		*)
		| Binop(e1, op, e2) as e -> let t1 = expr e1 and t2 = expr e2 in
		(match op with
			Add | Sub | Mult | Div | Expon when t1 = Int && t2 = Int -> Int
			| Add | Sub | Mult | Div | Expon when t1 = Double && t2 = Double -> Double
			| Add when t1 =  Str && t2 = Str -> Str
			| Add when t1 =  Codon && t2 = Codon -> RNA
			| Add when t1 =  DNA && t2 = DNA -> DNA
			| Add when t1 =  RNA && t2 = RNA -> RNA
			| Add when t1 =  Seq && t2 = Seq -> Seq
			| Add when t1 =  DNA && t2 = Seq -> DNA
			| Add when t1 =  Seq && t2 = DNA -> DNA
			| Add when t1 =  RNA && t2 = Seq -> RNA
			| Add when t1 =  Seq && t2 = RNA -> RNA
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
			| Comp when t = Seq || t = DNA -> DNA
			| Not when t = Bool -> Bool
			| _ -> raise (Failure ("illegal left unary operator " ^ string_of_uop op ^
				string_of_typ t ^ " in " ^ string_of_expr ex)))
		| Runop(e, op) as ex -> let t = expr e in
		(match op with
			  Transcb when t = Seq || t = DNA -> RNA
			| Translt when t = Seq || t = RNA -> Pep
			| Translttwo when t = Seq -> Aa
			| _ -> raise (Failure ("illegal right unary operator " ^ string_of_uop op ^
				string_of_typ t ^ " in " ^ string_of_expr ex)))
		| Noexpr -> Void
		| Assign(var, e) as ex -> let lt = type_of_identifier var
		and rt = expr e in
		check_assign lt rt (Failure ("illegal assignment " ^ string_of_typ lt ^
			" = " ^ string_of_typ rt ^ " in " ^
		string_of_expr ex))
		| ArrayAssign(s,e1,e2) as ex -> let check_int_expr2 e =
				if expr e != Int then raise (Failure ("expected Integer expression in " ^ string_of_expr e))
				else ()
			in check_int_expr2 e1;
			let lt = array_type_unfold (type_of_identifier s)
			and rt = expr e2 in
			check_assign lt rt (Failure ("illegal assignment " ^ string_of_typ lt ^
				" = " ^ string_of_typ rt ^ " in " ^
			string_of_expr ex))
		| SizeOf(s) -> ignore(type_of_identifier s); Int
	(*	| Typecast =()
		| Fread = ()
		| Read = () *)
		| Call(fname, actuals) as call -> if fname = "print" then (
				if List.length actuals != 1 then
					raise (Failure ("expecting " ^ string_of_int 1 ^ " argument in print function call."))
				else
					List.iter (fun e -> ignore (expr e)) actuals;
					Void
			)
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
		(* check whether an expression is Boolean *)
		let check_bool_expr e =
			if expr e != Bool then raise (Failure ("expected Boolean expression in " ^ string_of_expr e))
			else ()
		in
		(* check whether an expression is Integer *)
		let check_int_expr e =
			if expr e != Int then raise (Failure ("expected Integer expression in " ^ string_of_expr e))
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
			| ArrayDecl(t, e, s) -> ignore(check_v_type t);
			(locals_list) := StringMap.add s (map_array_type t) !(locals_list);
			check_int_expr e
			| Nobranching -> ()

		in

		stmt (Block func.stmts)
;;

let check_func func function_decls =

	List.iter (check_not_void (fun n -> "illegal void formal " ^ n ^ " in " ^ func.fname)) func.formals;

	report_duplicate (fun n -> "duplicate formal " ^ n ^ " in " ^ func.fname) (List.map snd func.formals);

	(locals_list) := List.fold_left (fun m (t, n) -> StringMap.add n t m) !(locals_list) func.formals;
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
