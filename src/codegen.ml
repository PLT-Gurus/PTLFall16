(*LLVM tutorial: Make sure to read the OCaml version of the tutorial

http://llvm.org/docs/tutorial/index.html

Detailed documentation on the OCaml LLVM library:

http://llvm.moe/
http://llvm.moe/ocaml/
*)

module L = Llvm
module A = Ast
module LK=Linker
module StringMap = Map.Make(String)

type ext_func={name:string;ret:L.lltype;arg:L.lltype array}
let translate prog =
  let p_stmts=prog.A.pstmts in
  let p_funcs=prog.A.funcs in


  let context = L.global_context () in
  let the_module = L.create_module context "DNAs"
  and double_t = L.double_type context
  and i32_t  = L.i32_type  context
  and i8_t   = L.i8_type   context
  and i1_t   = L.i1_type   context
  and void_t = L.void_type context in
  let str_t  = L.pointer_type i8_t in
  let intptr_t = L.pointer_type i32_t in
  let str_dt = L.pointer_type str_t in

  let ltype_of_typ = function
  | A.Double ->double_t
  | A.Int  -> i32_t
  | A.Char -> i8_t
  | A.Bool -> i1_t
  | A.Void -> void_t
  | A.Str -> str_t
  | A.Seq -> str_t
  | A.DNA -> str_t
  | A.RNA -> str_t
  | A.Pep -> str_t
  | _ -> void_t (*todo# add later*)
  in

  let main_func={
    A.fname="main";
    A.typ=A.Int;
    A.formals=[];
    A.stmts=p_stmts;
  } in

  let ext_func_lst=[
    (*NOTICE : the sequence of arg list has to be reverse order of origin C-func !!!*)
    {name="test"          ;ret=i32_t      ;arg=[|i32_t;i32_t|]           };
    {name="printf"        ;ret=i32_t      ;arg=[|L.pointer_type i8_t |]  };
    {name="complement"    ;ret=str_t      ;arg=[|str_t|]                 };
    {name="transcribe"    ;ret=str_t      ;arg=[|str_t|]                 };
    {name="translate"     ;ret=str_t      ;arg=[|str_t|]                 };
    {name="translate2"    ;ret=str_t      ;arg=[|str_t|]                 };
    {name="concat"        ;ret=str_t      ;arg=[|str_t; str_t|]          };
    {name="strlength"     ;ret=i32_t      ;arg=[|str_t|]                 };
    {name="readFASTAFile" ;ret=str_t      ;arg=[|str_t|]                 };
    {name="readFile"      ;ret=str_t      ;arg=[|str_t|]                 };
    {name="double2int"    ;ret=i32_t      ;arg=[|double_t|]              };
    {name="int2double"    ;ret=double_t   ;arg=[|i32_t|]                 };
    {name="db_exp"        ;ret=double_t   ;arg=[|double_t;double_t|]     };
    {name="mod"           ;ret=i32_t      ;arg=[|i32_t;i32_t|]           };
    {name="exp_ii"        ;ret=i32_t      ;arg=[|i32_t;i32_t|]           };
    {name="exp_di"        ;ret=double_t   ;arg=[|i32_t;double_t|]        };
    {name="exp_id"        ;ret=double_t   ;arg=[|double_t;i32_t|]        };
    {name="exp_dd"        ;ret=double_t   ;arg=[|double_t;double_t|]     };
    {name="print_tf"      ;ret=i32_t      ;arg=[|i1_t|]                  };
    {name="getChar"       ;ret=i8_t       ;arg=[|str_dt; i32_t|]         };
    {name="formatPep"     ;ret=str_t      ;arg=[|str_t|]                 };
    {name="printPep"      ;ret=i32_t      ;arg=[|str_t|]                 }
  ]
  in

  let build_ext_func map ef=
    let func_typ=L.var_arg_function_type ef.ret ef.arg in
    let func_dec=L.declare_function ef.name func_typ the_module in
      StringMap.add ef.name func_dec map
  in

  let ext_funcs=List.fold_left build_ext_func StringMap.empty ext_func_lst in


  (* Declare printf(), which the print built-in function will call
  let printf_t = L.var_arg_function_type i32_t [| L.pointer_type i8_t |] in
  let printf_func = L.declare_function "printf" printf_t the_module in



  let test_t=L.var_arg_function_type i32_t [|i32_t;i32_t|] in
  let test_func=L.declare_function "test" test_t the_module in

  let complement_t=L.var_arg_function_type str_t [|str_t|] in
  let complement_func= L.declare_function "complement" complement_t the_module

  let transcribe_t=L.var_arg_function_type str_t [|str_t|] in
  let transcribe_func=L.declare_function "transcribe" transcribe_t the_module in
  *)
(*
  let build_extern_call func arg bvtup=
    (*arg should be a list of arguments of func call*)
    let arg=List.map (add_expr bvtup) (List.rev arg) in
      let arg=Array.of_list arg in
        L.build_call test_func arg "test" (fst bvtup)
  in
  *)

  let p_funcs=p_funcs@[main_func] in

  let function_decls =
    let function_decl m fdecl =
      let f_name = fdecl.A.fname
      and f_formals =
        Array.of_list (List.map (fun (t,_) -> ltype_of_typ t) fdecl.A.formals) in
      let f_type = L.function_type (ltype_of_typ fdecl.A.typ) f_formals in
      StringMap.add f_name (L.define_function f_name f_type the_module, fdecl) m in
    List.fold_left function_decl StringMap.empty p_funcs
  in

  let build_function_body fdecl =
    let (the_function, _) = StringMap.find fdecl.A.fname function_decls in
    let builder = L.builder_at_end context (L.entry_block the_function) in

    let int_format_str = L.build_global_stringptr "%d" "fmt_int" builder in
    let str_format_str = L.build_global_stringptr "%s" "fmt_str" builder in
    let double_format_str = L.build_global_stringptr "%.3f" "fmt_str" builder in
    let char_format_str = L.build_global_stringptr "%c" "fmt_str" builder in

    let add_formal map (v_typ, v_name) param =
      L.set_value_name v_name param;
      let local = L.build_alloca (ltype_of_typ v_typ) v_name builder in
      ignore (L.build_store param local builder);
      StringMap.add v_name ((local, v_typ), L.const_int i32_t 1) map

      (* NOTE:  make size work for add_formal*)
    in

      (*varis : a map to save all local vars*)
    let varis =
      List.fold_left2 add_formal StringMap.empty fdecl.A.formals
          (Array.to_list (L.params the_function))
    in

    let lookup n varis = StringMap.find n varis in

    let bvtup=(builder,varis) in


    (*add_expr bvtup*)
    let rec add_expr bvtup = function
      | A.Litint i  -> ((L.const_int i32_t i), A.Int)

      | A.Litdouble d -> ((L.const_float double_t d), A.Double)

      | A.Litbool b -> ((L.const_int i1_t (if b then 1 else 0)), A.Bool)

      | A.Litchar c -> ((L.const_int i8_t (int_of_char c)), A.Char)

      | A.Id s -> ((L.build_load (fst (fst (lookup s (snd bvtup)))) s (fst bvtup)), (snd (fst (lookup s (snd bvtup)))))

      | A.ArrayAcc(id, index) ->

          let index = fst (add_expr bvtup index) in
          let arr = fst (fst (lookup id (snd bvtup))) in
          let arrType = snd (fst (lookup id (snd bvtup))) in
          let arrSize =  snd (lookup id (snd bvtup)) in
          let testPrint = (match arrSize with
              a when a = (L.const_int i32_t 1) -> arrType = A.Char; ext_call_alternate "getChar" [index; arr] bvtup
            | _ ->   let val1 = L.build_gep arr [|index|] id (fst bvtup) in
                    L.build_load val1 "tmp" (fst bvtup)

                ) in
          if (testPrint = (L.const_int i8_t (-1))) then raise (Failure "Array index out of access") else ignore();

          (testPrint, arrType)

      | A.Binop (e1, op, e2) ->
          let e1' = fst (add_expr bvtup e1)
          and e2' = fst (add_expr bvtup e2)in
          let e1Type = snd (add_expr bvtup e1) in
          let e2Type = snd (add_expr bvtup e2) in
          (match op with
              A.Add     ->
                let astType1 = L.type_of e1' in
                let astType2 = L.type_of e2' in

                let throwAway = match astType1 with
                      type_str when type_str = str_t -> ext_call_alternate "concat" [e2';e1'] bvtup
                    | type_int when type_int = i32_t ->

                        (match astType2 with
                          type_int when type_int = i32_t -> (*i-i*)L.build_add e1' e2' "bop" (fst bvtup)
                        | type_double when type_double = double_t -> (*i-d*)L.build_fadd
                            (ext_call_alternate "int2double" [e1'] bvtup) e2' "bop" (fst bvtup) )
                    | type_double when type_double = double_t ->
                        (match astType2 with
                          type_int when type_int = i32_t -> (*d-i*)L.build_fadd
                            e1' (ext_call_alternate "int2double" [e2'] bvtup) "bop" (fst bvtup)
                        | type_double when type_double = (*d-d*)double_t -> L.build_fadd e1' e2' "bop" (fst bvtup) )
                in (throwAway, e1Type)

            | A.Sub     ->
                let astType1 = L.type_of e1' in
                let astType2 = L.type_of e2' in
                let ret = match astType1 with
                   type_int when type_int = i32_t ->
                        (match astType2 with
                          type_int when type_int = i32_t -> (*i-i*)L.build_sub e1' e2' "bop" (fst bvtup)
                        | type_double when type_double = double_t -> (*i-d*)L.build_fsub
                            (ext_call_alternate "int2double" [e1'] bvtup) e2' "bop" (fst bvtup) )
                    | type_double when type_double = double_t ->
                        (match astType2 with
                          type_int when type_int = i32_t -> (*d-i*)L.build_fsub
                            e1' (ext_call_alternate "int2double" [e2'] bvtup) "bop" (fst bvtup)
                        | type_double when type_double = (*d-d*)double_t -> L.build_fsub e1' e2' "bop" (fst bvtup) )
                in (ret, e1Type)

            | A.Mult    ->
                let astType1 = L.type_of e1' in
                let astType2 = L.type_of e2' in
                let ret = match astType1 with
                   type_int when type_int = i32_t ->
                        (match astType2 with
                          type_int when type_int = i32_t -> (*i-i*)L.build_mul e1' e2' "bop" (fst bvtup)
                        | type_double when type_double = double_t -> (*i-d*)L.build_fmul
                            (ext_call_alternate "int2double" [e1'] bvtup) e2' "bop" (fst bvtup) )
                    | type_double when type_double = double_t ->
                        (match astType2 with
                          type_int when type_int = i32_t -> (*d-i*)L.build_fmul
                            e1' (ext_call_alternate "int2double" [e2'] bvtup) "bop" (fst bvtup)
                        | type_double when type_double = (*d-d*)double_t -> L.build_fmul e1' e2' "bop" (fst bvtup) )
                in (ret, e1Type)

            | A.Div     ->
                let astType1 = L.type_of e1' in
                let astType2 = L.type_of e2' in
                let ret = match astType1 with
                   type_int when type_int = i32_t ->
                        (match astType2 with
                          type_int when type_int = i32_t -> (*i-i*)L.build_sdiv e1' e2' "bop" (fst bvtup)
                        | type_double when type_double = double_t -> (*i-d*)L.build_fdiv
                            (ext_call_alternate "int2double" [e1'] bvtup) e2' "bop" (fst bvtup) )
                    | type_double when type_double = double_t ->
                        (match astType2 with
                          type_int when type_int = i32_t -> (*d-i*)L.build_fdiv
                            e1' (ext_call_alternate "int2double" [e2'] bvtup) "bop" (fst bvtup)
                        | type_double when type_double = (*d-d*)double_t -> L.build_fdiv e1' e2' "bop" (fst bvtup))
                in (ret, e1Type)

            | A.Mod     -> ((ext_call "mod" [e1;e2] bvtup),  e1Type)

            | A.Expon     ->
                let astType1 = L.type_of e1' in
                let astType2 = L.type_of e2' in
                let ret = match astType1 with
                   type_int when type_int = i32_t ->
                        (match astType2 with
                          type_int when type_int = i32_t -> (*i-i*) ext_call_alternate "exp_ii" [e1';e2'] bvtup
                        | type_double when type_double = double_t -> (*i-d*)ext_call_alternate "exp_id" [e1';e2'] bvtup )
                    | type_double when type_double = double_t ->
                        (match astType2 with
                          type_int when type_int = i32_t -> ext_call_alternate "exp_di" [e1';e2'] bvtup(*d-i*)
                        | type_double when type_double = double_t -> ext_call_alternate "exp_dd" [e1';e2'] bvtup(*d-d*))
                in (ret, e1Type)

            | A.And     -> ((L.build_and e1' e2' "bop" (fst bvtup)), e1Type)

            | A.Or      -> ((L.build_or e1' e2' "bop" (fst bvtup)), e1Type)

            | A.Equal   ->
                (let astType = L.type_of e1' in
                match astType with
                   type_int when type_int = i32_t ->
                      ((L.build_icmp L.Icmp.Eq e1' e2' "bop" (fst bvtup)), A.Int)
                  |type_double when type_double = double_t ->
                      ((L.build_fcmp L.Fcmp.Ueq e1' e2' "bop" (fst bvtup) ), A.Double))

            | A.Neq     ->
                (let astType = L.type_of e1' in
                match astType with
                   type_int when type_int = i32_t ->
                      ((L.build_icmp L.Icmp.Ne e1' e2' "bop" (fst bvtup)), A.Int)
                  |type_double when type_double = double_t ->
                      ((L.build_fcmp L.Fcmp.Une e1' e2' "bop" (fst bvtup) ), A.Double))

            | A.Less    ->
                (let astType = L.type_of e1' in
                match astType with
                   type_int when type_int = i32_t ->
                      ((L.build_icmp L.Icmp.Slt e1' e2' "bop" (fst bvtup)), A.Int)
                  |type_double when type_double = double_t ->
                      ((L.build_fcmp L.Fcmp.Ult e1' e2' "bop" (fst bvtup) ), A.Double))

            | A.Leq     ->
                (let astType = L.type_of e1' in
                match astType with
                   type_int when type_int = i32_t ->
                      ((L.build_icmp L.Icmp.Sle e1' e2' "bop" (fst bvtup)), A.Int)
                  |type_double when type_double = double_t ->
                      ((L.build_fcmp L.Fcmp.Ule e1' e2' "bop" (fst bvtup)), A.Double))

            | A.Greater ->
                (let astType = L.type_of e1' in
                match astType with
                   type_int when type_int = i32_t ->
                      ((L.build_icmp L.Icmp.Sgt e1' e2' "bop" (fst bvtup)), A.Int)
                  |type_double when type_double = double_t ->
                      ((L.build_fcmp L.Fcmp.Ugt e1' e2' "bop" (fst bvtup) ), A.Double))

            | A.Geq     ->
                (let astType = L.type_of e1' in
                match astType with
                   type_int when type_int = i32_t ->
                      ((L.build_icmp L.Icmp.Sge e1' e2' "bop" (fst bvtup)), A.Int)
                  |type_double when type_double = double_t ->
                      ((L.build_fcmp L.Fcmp.Uge e1' e2' "bop" (fst bvtup)), A.Double) )
          )

      | A.Lunop(op, e) ->
          let e' = fst (add_expr bvtup e) in
          let eType = snd (add_expr bvtup e) in
          (match op with
              A.Neg         -> ((L.build_neg e' "left_uop" (fst bvtup)), eType)
            | A.Not         -> ((L.build_not e' "left_uop" (fst bvtup)), eType)
        (*    | A.Expon       -> ((L.build_not e' "left_uop" (fst bvtup)), eType) *)
            | A.Comp        -> ((ext_call "complement" [e] bvtup), eType)
           )
      | A.SizeOf(id) ->  (* Gets size of array *) (*NOTE: change to get size of strings too *)

          let var = lookup id (snd bvtup) in
          let varValue = fst (add_expr bvtup (A.Id(id))) in
          let varType = snd (add_expr bvtup (A.Id(id))) in
          let typeOf = L.type_of (varValue) in
          let size = if typeOf = str_t then ext_call_alternate "strlength" [varValue] bvtup else snd var in
          (size, varType)
      | A.Fread(filename) ->
            let filename = fst (add_expr bvtup (A.Stringlit(filename))) in
            let contents = ext_call_alternate "readFASTAFile" [filename] bvtup in
            (contents, A.Str)
      | A.Read(filename) ->
            let filename = fst (add_expr bvtup (A.Stringlit(filename))) in
            let contents = ext_call_alternate "readFile" [filename] bvtup in
            (contents, A.Str)

      | A.Runop(e, op) ->
          (((match op with

            | A.Transcb     -> ext_call "transcribe"
            | A.Translt     -> ext_call "translate"
            | A.Translttwo  -> ext_call "translate2"
          ) [e] bvtup), (snd (add_expr bvtup e)))

      | A.Assign (s, e) -> 
          let e' = add_expr bvtup e in 
          let eVal = fst e' in
          let eType = snd e' in
          ignore (L.build_store eVal (fst (fst (lookup s (snd bvtup)))) (fst bvtup)); (eVal, eType)

      | A.ArrayAssign (id, index, exprhs) ->
          let exprValue = fst (add_expr bvtup exprhs) in
          let exprType = snd (add_expr bvtup exprhs) in
          let index = fst (add_expr bvtup index) in
          let arr = fst (fst (lookup id (snd bvtup))) in
          let val1 = L.build_gep arr [|index|] id (fst bvtup) in
          let testPrint = L.build_store exprValue val1 (fst bvtup) in
          (exprValue, exprType)


      | A.Call ("test", arg) ->
          (ext_call "test" arg bvtup, A.Int)

      | A.Call ("print", [e] ) ->

          let astType = snd (add_expr bvtup e) in
          let eval = fst (add_expr bvtup e) in
          let result = match astType with
           A.Int ->
             L.build_call (StringMap.find "printf" ext_funcs) [| int_format_str ; (eval) |]
            "printf" (fst bvtup)

          | A.Bool ->
            if eval = (L.const_int i1_t 0) then L.build_call (StringMap.find "printf" ext_funcs) [| str_format_str ; (fst (add_expr bvtup (A.Stringlit("false")) ))|]
            "printf" (fst bvtup)  else L.build_call (StringMap.find "printf" ext_funcs) [| str_format_str ; (fst (add_expr bvtup (A.Stringlit("true"))))|]
            "printf" (fst bvtup)

          | A.Double ->
            L.build_call (StringMap.find "printf" ext_funcs) [| double_format_str ; (eval) |]
            "printf" (fst bvtup)
          | A.Char ->
            L.build_call (StringMap.find "printf" ext_funcs) [| char_format_str ; (eval) |]
            "printf" (fst bvtup)
          | A.Void -> raise (Failure "Cannot print void type "); (L.const_int i32_t 0)
          | A.Pep -> ext_call "printPep" [e] bvtup
          | _ -> L.build_call (StringMap.find "printf" ext_funcs) [| str_format_str ; (eval) |]
                  "printf" (fst bvtup) in
                  (result, A.Int)

      | A.Call (f, act) ->
          let (fdef, fdecl) = StringMap.find f function_decls in
          let actuals = List.rev  (List.map (fun a -> fst (add_expr bvtup a)) (List.rev act)) in
          let result = (match fdecl.A.typ with A.Void -> ""
                                              | _ -> f ^ "_result") in
          ((L.build_call fdef (Array.of_list actuals) result (fst bvtup)), fdecl.A.typ)

      | A.Stringlit(str) ->
           ((L.build_global_stringptr str "context" (fst bvtup)), A.Str)

      | A.Sequence(str) ->
          ((L.build_global_stringptr str "context" (fst bvtup)), A.Seq)

      | A.Litdna(str) ->
              ((L.build_global_stringptr str "context" (fst bvtup)), A.DNA)

      | A.Litrna(str) ->
                ((L.build_global_stringptr str "context" (fst bvtup)), A.RNA)

      | A.Litpep(str) ->
                let pepTemp = ((L.build_global_stringptr str "context" (fst bvtup)), A.Pep) in
                let pepResult = ext_call_alternate "formatPep" [fst pepTemp] bvtup in
                (pepResult, A.Pep)

      | A.Noexpr -> ((L.const_int i32_t 0), A.Int)

      | _ -> ((L.const_int i32_t 0), A.Int) (*todo# finish all the exprs*)

    and ext_call f_name arg bvtup=
      let arg=List.map (fun a -> fst (add_expr bvtup a)) arg in
        let arg=Array.of_list arg in
          L.build_call (StringMap.find f_name ext_funcs) arg f_name (fst bvtup)
    and ext_call_alternate f_name arg bvtup= (* NOTE: Do you need List.rev? *)
      let arg= (List.rev arg) in
        let arg=Array.of_list arg in
        L.build_call (StringMap.find f_name ext_funcs) arg f_name (fst bvtup)
    in


    let add_local bvtup (v_typ, v_name, isArray, arrSize) =
      match isArray with

      true -> let local_var = L.build_array_alloca (ltype_of_typ v_typ) arrSize v_name (fst bvtup) in
      ((fst bvtup),StringMap.add v_name ((local_var, v_typ), arrSize) (snd bvtup));

      | false ->
      (* check for strings *)

      let local_var = L.build_alloca (ltype_of_typ v_typ) v_name (fst bvtup) in
      ((fst bvtup),StringMap.add v_name ((local_var, v_typ), arrSize) (snd bvtup))

    in
   (*add_terminal*)
    let add_terminal builder f =
      match L.block_terminator (L.insertion_block builder) with
        Some _ -> ()
      | None -> ignore (f builder) in

    (*add_stmt*)
    let rec add_stmt bvtup = function
        A.Block sl -> List.fold_left add_stmt bvtup sl

      | A.Expr e -> ignore (fst (add_expr bvtup e)); bvtup

      | A.VDecl(typ,id,expr) ->
          let bvtup=add_local bvtup (typ, id, false, (L.const_int i32_t 1) ) in
          ignore(add_stmt bvtup (A.Expr (A.Assign (id, expr))));
          bvtup
      | A.ArrayDecl(typ, size, id)->
          (* Make this work with non-hardcoded size and with our scoping rules. What is bvtup? *)
         let size = fst (add_expr bvtup size) in
         let bvtup = add_local bvtup (typ, id, true, size) in

        (* L.build_call test_func [|testPrint;toStore|] "test" (fst bvtup);  *)
         bvtup

      | A.Return e ->
          ignore (match fdecl.A.typ with
              A.Void -> L.build_ret_void (fst bvtup)
            | _ -> L.build_ret (fst (add_expr bvtup e)) (fst bvtup));
          bvtup

      | A.If (cond, then_stmt, sub_stmt) ->
          let bool_val = fst (add_expr bvtup cond) in
          let merge_bb = L.append_block context "merge" the_function in

          let then_bb = L.append_block context "then" the_function in
              add_terminal (fst (add_stmt ((L.builder_at_end context then_bb),snd bvtup) then_stmt))
              (L.build_br merge_bb);

          let else_bb = L.append_block context "else" the_function in
              add_terminal (fst (add_stmt ((L.builder_at_end context else_bb),snd bvtup) sub_stmt))
              (L.build_br merge_bb);

          ignore (L.build_cond_br bool_val then_bb else_bb (fst bvtup));
          (L.builder_at_end context merge_bb,snd bvtup)

      | A.Elseif(cond,then_stmt,sub_stmt) ->
          add_stmt bvtup (A.If (cond,then_stmt,sub_stmt))

      | A.Else (then_stmts) ->
          add_stmt bvtup then_stmts

      | A.While (cond, do_stmt) ->
          let pred_bb = L.append_block context "while" the_function in
            ignore (L.build_br pred_bb (fst bvtup));

          let body_bb = L.append_block context "while_body" the_function in
            add_terminal (fst (add_stmt ((L.builder_at_end context body_bb),snd bvtup) do_stmt))
            (L.build_br pred_bb);

          let pred_builder = L.builder_at_end context pred_bb in
          let bool_val = fst (add_expr (pred_builder,snd bvtup) cond) in

          let merge_bb = L.append_block context "merge" the_function in
            ignore (L.build_cond_br bool_val body_bb merge_bb pred_builder);

          (L.builder_at_end context merge_bb,snd bvtup)

      | A.For (e1, e2, e3, for_stmt) -> add_stmt bvtup
          ( A.Block [A.Expr e1 ; A.While (e2, A.Block [for_stmt; A.Expr e3]) ] )

      |_->bvtup
    in

    (* create the Tuple_of_Builder_and_Varis -> bvtup *)

    (* Build the code for each statement in the function *)
    let bvtup = add_stmt bvtup (A.Block fdecl.A.stmts) in

    (* Add a return if the last block falls off the end *)
    add_terminal (fst bvtup) (match fdecl.A.typ with
        A.Void -> L.build_ret_void
      | t -> L.build_ret (L.const_int (ltype_of_typ t) 0))
  in
  List.iter build_function_body p_funcs;

  (*link external C funcs*)
  LK.link_bc the_module LK.c_lib_path;

  (*return the_module*)
  the_module
