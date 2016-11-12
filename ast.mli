type uop = Expon | Neg | Comp | Transcb | Translt | Translttwo | Not

type op = Add | Sub | Mult | Div | Mod | Exp | And | Or | Equal | Neq | Less | Leq | Greater | Geq

type typ = Int | Bool | Void | Char | Double | Aa | Nuc | Codon | Seq | Str

type ending = End

type expr = Litint of int
		| Id of string
		| Sequence of string
		| Stringlit of string
		| Litbool of bool
		| Litchar of char
		| Litdouble of float
		| Binop of expr * op * expr
		| Lunop of uop * expr
		| Runop of expr * uop
		| Assign of string * expr
		| Call of string * expr list
		| Noexpr


type stmt = 
		Block of stmt list
		| If of expr * stmt list * stmt
		| For of expr * expr * expr * stmt list 
		| While of expr * stmt list 
		| Return of expr
		| Expr of expr
 		| Nobranching
		| Elseif of expr * stmt list * stmt
		| Else of stmt list 
		| VDecl of typ * string * expr

type bind = typ * string

type func_decl = {
	typ		: typ;
	fname	: string;
	formals	: bind list;
	stmts: stmt list;
	
}

type program =  {
	stmts: stmt list;
	funcs: func_decl list;
}

(*printing functions*)
