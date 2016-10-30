type uop = Expon | Neg | Comp | Transcb | Translt | Translttwo

type op = Add | Sub | Mult | Div | Mod | And | Or | Not | Equal | Neq | Less | Leq | Greater | Geq

type typ = Int | Bool | Void | Char | Double | Aa | Nuc | Codon | Seq

type ending = End

type bind = typ * string

type expr = Litint of int
		| Id of string
		| Sequence of string
		| Litbool of bool
		| Noexpr
		| Binop of expr * op * expr
		| Lunop of uop * expr
		| Runop of expr * uop
		| Assign of string * expr
		| Call of string * expr list

type stmt = Block of stmt list
		| If of expr * stmt * stmt
		| Elseif of expr * stmt * stmt
		| For of expr * expr * expr * stmt
		| While of expr * stmt
		| Return of expr
		| Expr of expr * ending

type func_decl = {
	typ		: typ;
	fname	: string;
	formals	: bind list;
	locals	: bind list;
	body	: stmt list;
}

type program = bind list * func_decl list;
