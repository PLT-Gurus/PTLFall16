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
		| Elseif of expr * stmt list * stmt
		| Else of stmt list 
		| VDecl of typ * string * expr
		| Nobranching

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
(*functions : Printing AST*)

(*print expr*)
let string_of_op = function
	  Add 		-> "+"
	| Sub 		-> "-"
	| Mult		-> "*"
	| Div 		-> "/"
	| Mod 		-> "%"
	| Exp 		-> "^"
	| And 		-> "&"
	| Or  		-> "|"
	| Equal 	-> "=="
	| Neq 		-> "!="
	| Less 		-> "<"
	| Leq 		-> "<="
	| Greater 	-> ">"
	| Geq		-> ">="


let string_of_typ = function
	  Int  		->"int"
	| Bool 		->"bool"
	| Void 		->"nul"
	| Char 		->"char"
	| Double 	->"double"
	| Aa 		->"AA"
	| Nuc 		->"nuc"
	| Codon 	->"codon"
	| Seq 		->"seq"
	| Str       ->"str"

let string_of_uop = function
	  Expon 	-> "^" (*not quite sure about this one*)
	| Neg 		-> "-"
	| Comp 		-> "@"
	| Transcb 	-> "->"
	| Translt 	-> "+>"
	| Translttwo-> "%>" 
	| Not		-> "!"

let rec string_of_expr = function
	  Litint(i) ->
	  	string_of_int i
	| Id(str)->
	  	str
	| Sequence(str)->
		str
	| Stringlit(str)->
		str
	| Litbool(true)->
		"true"
	| Litbool(false)->
		"false"
	| Litchar(ch)->
		String.make 1 ch
	| Litdouble(flt)->
		string_of_float flt
	| Binop(exp1,op,exp2)->
		string_of_expr exp1 ^ string_of_op op ^
		string_of_expr exp2
	| Lunop(uop,exp)->
		string_of_uop uop ^ string_of_expr exp
	| Runop(exp,uop)->
		string_of_expr exp ^ string_of_uop uop
	| Assign(str,exp)->
		str ^ "=" ^ string_of_expr exp
	| Call(str,l_expr)->
		str ^ "(" ^ 
		String.concat "," (List.map string_of_expr l_expr) ^
		")"
	| Noexpr->
		""


(*print stmt & stmt list*)
let rec string_of_stmt n stmt=
	 let blk=String.make (n*2) ' ' in
	 match stmt with
	|Block(l_stmt)->
	 	blk ^ "{\n" ^ string_of_stmt_list n l_stmt ^ blk ^ "}\n"
	
	|If(cond,l_stmt,next_stmt)->
		blk ^ "if->\n" ^ 
		blk ^ "  cond= (" ^ string_of_expr cond ^ ")\n" ^
		blk ^ "  body={\n" ^ string_of_stmt_list (n+2) l_stmt ^ blk ^ "  }\n" ^
		string_of_stmt n next_stmt
	
	|For(strt,cond,step,l_stmt)->
		blk ^ "for->\n" ^ 
		blk ^ "  init= " ^ string_of_expr strt ^ "\n" ^ 
		blk ^ "  cond= " ^ string_of_expr cond ^ "\n" ^ 
		blk ^ "  step= " ^ string_of_expr step ^ "\n" ^ 
		blk ^ "  body={\n" ^ string_of_stmt_list (n+2) l_stmt ^ blk ^ "  }\n"
	
	|While(cond,l_stmt)->
		blk ^ "while->\n" ^ 
		blk ^ "  cond= (" ^ string_of_expr cond ^ ")\n" ^
		blk ^ "  body={\n" ^ string_of_stmt_list (n+2) l_stmt ^ blk ^ "  }\n"
	
	|Return(exp)->
		blk ^ "return->\n" ^ 
		blk ^ "  value= " ^ string_of_expr exp ^ "\n"
	
	|Expr(exp)->
		blk ^ "expr->\n" ^ 
		blk ^ "  value= " ^ string_of_expr exp ^ "\n"
	
	|Elseif(cond,l_stmt,b_stmt)->
		blk ^ "elseif->\n" ^ 
		blk ^ "  cond= (" ^ string_of_expr cond ^ ")\n" ^
		blk ^ "  body={\n" ^ string_of_stmt_list (n+2) l_stmt ^ blk ^ "  }\n" ^
		string_of_stmt n b_stmt
	
	|Else(l_stmt)->
		blk ^ "else->\n" ^ 
		blk ^ "  body={\n" ^ string_of_stmt_list (n+2) l_stmt ^ blk ^ "  }\n"
	
	|VDecl(typ,str,exp)->
		blk ^ "vari->\n" ^
		blk ^ "  " ^ string_of_typ typ ^ " " ^ str ^ " = " ^ string_of_expr exp ^ "\n"

	|Nobranching->
		"\n"

and string_of_stmt_list n l_stmt=
	String.concat "" (List.map (string_of_stmt n) l_stmt)

let rec string_of_bind (typ,str)=
	string_of_typ typ ^ " " ^ str
and string_of_bind_list l_bid=
	"( "^String.concat ", " (List.map string_of_bind l_bid) ^ " )"

let string_of_func func_decl=
	let f_name=func_decl.fname in
	let f_typ=func_decl.typ in
	let f_form=func_decl.formals in
	let f_body=func_decl.stmts in
		string_of_typ f_typ ^ " function:" ^ f_name ^ string_of_bind_list f_form ^
		"\nbody->\n" ^ string_of_stmt_list 2 f_body ^ "\n"


let string_of_program program=
	let l_stm=program.stmts in
	let l_fun=program.funcs in
		"----- Stmt List -----\n" ^ String.concat "" (List.map (string_of_stmt 0) l_stm) ^ "\n" ^
		"----- Func List -----\n" ^ String.concat "" (List.map string_of_func l_fun) ^ "\n"
