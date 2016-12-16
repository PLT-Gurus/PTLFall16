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
  let p_stmts=prog.A.stmts in
  let p_funcs=prog.A.funcs in


  let context = L.global_context () in
  let the_module = L.create_module context "DNAs"
  and i32_t  = L.i32_type  context
  and i8_t   = L.i8_type   context
  and i1_t   = L.i1_type   context
  and void_t = L.void_type context in
  let str_t  = L.pointer_type i8_t
  in

  let ltype_of_typ = function
    A.Int  -> i32_t
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
    {name="test"          ;ret=i32_t;       arg=[|i32_t;i32_t|]           };
    {name="printf"        ;ret=i32_t;       arg=[| L.pointer_type i8_t |] };
    {name="complement"    ;ret=str_t;       arg=[|str_t|]                 };
    {name="transcribe"    ;ret=str_t;       arg=[|str_t|]                 }
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

    let int_format_str = L.build_global_stringptr "%d\n" "fmt_int" builder in
    let str_format_str = L.build_global_stringptr "%s\n" "fmt_str" builder in

    let add_formal map (v_typ, v_name) param =
      L.set_value_name v_name param;
      let local = L.build_alloca (ltype_of_typ v_typ) v_name builder in
      ignore (L.build_store param local builder);
      StringMap.add v_name local map
    in

      (*varis : a map to save all local vars*)
    let varis =
      List.fold_left2 add_formal StringMap.empty fdecl.A.formals
          (Array.to_list (L.params the_function))
    in

    let add_local bvtup (v_typ, v_name) =
      let local_var = L.build_alloca (ltype_of_typ v_typ) v_name (fst bvtup) in
      ((fst bvtup),StringMap.add v_name local_var (snd bvtup))
    in

    let lookup n varis = StringMap.find n varis in

    let bvtup=(builder,varis) in

    (*add_expr bvtup*)
    let rec add_expr bvtup = function
      | A.Litint i  -> L.const_int i32_t i

      | A.Litbool b -> L.const_int i1_t (if b then 1 else 0)

      | A.Litchar c -> L.const_int i8_t (int_of_char c)

      | A.Id s -> L.build_load (lookup s (snd bvtup)) s (fst bvtup)

      | A.Binop (e1, op, e2) ->
          let e1' = add_expr bvtup e1
          and e2' = add_expr bvtup e2 in
          (match op with
              A.Add     -> L.build_add
            | A.Sub     -> L.build_sub
            | A.Mult    -> L.build_mul
            | A.Div     -> L.build_sdiv
            | A.Mod     -> L.build_add (*todo# make it work later*)
            | A.Exp     -> L.build_add (*todo# make it work later*)
            | A.And     -> L.build_and
            | A.Or      -> L.build_or
            | A.Equal   -> L.build_icmp L.Icmp.Eq
            | A.Neq     -> L.build_icmp L.Icmp.Ne
            | A.Less    -> L.build_icmp L.Icmp.Slt
            | A.Leq     -> L.build_icmp L.Icmp.Sle
            | A.Greater -> L.build_icmp L.Icmp.Sgt
            | A.Geq     -> L.build_icmp L.Icmp.Sge
          ) e1' e2' "bop" (fst bvtup)

      | A.Lunop(op, e) ->
          let e' = add_expr bvtup e in
          (match op with
              A.Neg         -> L.build_neg e' "left_uop" (fst bvtup)
            | A.Not         -> L.build_not e' "left_uop" (fst bvtup)
            | A.Expon       -> L.build_not e' "left_uop" (fst bvtup) (*todo# make it work later*)
            | A.Comp        -> ext_call "complement" [e] bvtup
           )

      | A.Runop(e, op) ->
          (match op with
            | A.Transcb     -> ext_call "transcribe" 
            | A.Translt     -> ext_call "transcribe"  (*todo# change name*)
            | A.Translttwo  -> ext_call "transcribe"  (*todo# change name*)
          ) [e] bvtup

      | A.Assign (s, e) -> let e' = add_expr bvtup e in
          ignore (L.build_store e' (lookup s (snd bvtup)) (fst bvtup)); e'

      | A.Call ("test", arg) ->
          ext_call "test" arg bvtup

      | A.Call ("print_int", [e] ) ->
          L.build_call (StringMap.find "printf" ext_funcs) [| int_format_str ; (add_expr bvtup e) |]
          "printf" (fst bvtup)
      
      | A.Call ("print_str", [s]) ->
          L.build_call (StringMap.find "printf" ext_funcs) [| str_format_str ; (add_expr bvtup s) |]
          "printf" (fst bvtup)

      | A.Call (f, act) ->
          let (fdef, fdecl) = StringMap.find f function_decls in
          let actuals = List.rev (List.map (add_expr bvtup) (List.rev act)) in
          let result = (match fdecl.A.typ with A.Void -> ""
                                              | _ -> f ^ "_result") in
          L.build_call fdef (Array.of_list actuals) result (fst bvtup)

      | A.Stringlit(str) ->
           L.build_global_stringptr str "context" (fst bvtup)

      | A.Sequence(str) ->
          L.build_global_stringptr str "context" (fst bvtup)

      | A.Litdna(str) ->
              L.build_global_stringptr str "context" (fst bvtup)

      | A.Litrna(str) ->
                L.build_global_stringptr str "context" (fst bvtup)

      | A.Litpep(str) ->
                L.build_global_stringptr str "context" (fst bvtup)

      | A.Noexpr -> L.const_int i32_t 0

      | _ -> L.const_int i32_t 0 (*todo# finish all the exprs*)
     
    and ext_call f_name arg bvtup=
      let arg=List.map (add_expr bvtup) (List.rev arg) in
        let arg=Array.of_list arg in
          L.build_call (StringMap.find f_name ext_funcs) arg f_name (fst bvtup)
    in

   (*add_terminal*)
    let add_terminal builder f =
      match L.block_terminator (L.insertion_block builder) with
        Some _ -> ()
      | None -> ignore (f builder) in

    (*add_stmt*)
    let rec add_stmt bvtup = function
        A.Block sl -> List.fold_left add_stmt bvtup sl

      | A.Expr e -> ignore (add_expr bvtup e); bvtup

      | A.VDecl(typ,id,expr) ->
          let bvtup=add_local bvtup (typ, id) in
          ignore(add_stmt bvtup (A.Expr (A.Assign (id, expr))));
          bvtup

      | A.Return e ->
          ignore (match fdecl.A.typ with
              A.Void -> L.build_ret_void (fst bvtup)
            | _ -> L.build_ret (add_expr bvtup e) (fst bvtup));
          bvtup

      | A.If (cond, then_stmt, sub_stmt) ->
          let bool_val = add_expr bvtup cond in
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
          let bool_val = add_expr (pred_builder,snd bvtup) cond in

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
