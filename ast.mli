type typ =
	Litint of int
|	Sequence of string 
type typename = Int | Seq 
type bind = typename * string
type expr = typ
type stmt = 
	VDecl of typename * string * expr (* replace with bind *)
type program = stmt
  	

