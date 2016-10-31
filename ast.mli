type uop = Expon | Neg | Comp | Transcb | Translt | Translttwo

type op = Add | Sub | Mult | Div | Mod | And | Or | Not | Equal | Neq | Less | Leq | Greater | Geq

type typ = Int | Bool | Void | Char | Double | Aa | Nuc | Codon | Seq

type ending = End

type expr = Litint of int
		| Id of string
		| Sequence of string
		| Litbool of bool
		| Litchar of char
		| Litdouble of float
		| Noexpr
		| Binop of expr * op * expr
		| Lunop of uop * expr
		| Runop of expr * uop
		| Assign of string * expr
		| Call of string * expr list

type stmt = Block of stmt list
		| If of expr * stmt * stmt
		| Elseif of expr * stmt * stmt
		| Else of stmt
		| Nobraching
		| For of expr * expr * expr * stmt
		| While of expr * stmt
		| Return of expr
		| Expr of expr

type vdecl = typ * string * expr

type bind = typ * string

type func_decl = {
	typ		: typ;
	fname	: string;
	formals	: bind list;
	locals	: vdecl list;
	body	: stmt list;
}

type program =  {
	variables: vdecl list;
	stmts: stmt list;
	funcs: func_decl list;
}
