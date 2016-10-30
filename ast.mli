type uop = ASSIGN | 

type op = Add | Sub | Mul | Div |

type typ =
	Litint of int
|	Sequence of string

type typename = Int | Seq
type bind = typename * string
type expr =
	Litint of int
|	Sequence of string
| 	Binop of expr * op * expr
type stmt =
	VDecl of typename * string * expr (* replace with bind *)
|   Semi
|   Binop of expr * op * expr
type program = stmt
