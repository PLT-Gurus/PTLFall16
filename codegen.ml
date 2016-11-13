
module L = Llvm
module A = Ast

module StringMap = Map.Make(String)

let translate prog =
  let p_stmts=prog.A.stmts in
  let p_funcs=prog.A.funcs in


  let context = L.global_context () in
  let the_module = L.create_module context "DNAs"
  and i32_t  = L.i32_type  context
  and i8_t   = L.i8_type   context
  and i1_t   = L.i1_type   context
  and void_t = L.void_type context in

  let ltype_of_typ = function
      A.Int  -> i32_t
    | A.Char -> i8_t
    | A.Bool -> i1_t
    | A.Void -> void_t   
    | _ -> void_t (*todo# add later*) 
  in

  let main_func={
    A.fname="main";
    A.typ=A.Int;
    A.formals=[];
    A.stmts=p_stmts;
  } in

  (* Declare printf(), which the print built-in function will call *)
  let printf_t = L.var_arg_function_type i32_t [| L.pointer_type i8_t |] in
  let printf_func = L.declare_function "printf" printf_t the_module 
  in

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

    let int_format_str = L.build_global_stringptr "%d\n" "fmt" builder in

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

    let p_varis=ref varis in

    let add_local bdr (v_typ, v_name) =
      let local_var = L.build_alloca (ltype_of_typ v_typ) v_name bdr in 
      p_varis := StringMap.add v_name local_var (!p_varis)
    in
    
    (*todo# consider the scope problem
    let lookup n = try StringMap.find n local_vars
      with Not_found -> StringMap.find n global_vars
    in*)
    let lookup n = StringMap.find n (!p_varis) in
    
    (*add_expr builder*)
    let rec add_expr builder = function
        A.Litint i  -> L.const_int i32_t i
      
      | A.Litbool b -> L.const_int i1_t (if b then 1 else 0)
      
      | A.Litchar c -> L.const_int i8_t (int_of_char c)
      
      | A.Id s -> L.build_load (lookup s) s builder
      
      | A.Binop (e1, op, e2) ->
          let e1' = add_expr builder e1
          and e2' = add_expr builder e2 in
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
          ) e1' e2' "bop" builder

      | A.Lunop(op, e) ->
          let e' = add_expr builder e in
          (match op with
              A.Neg         -> L.build_neg
            | A.Not         -> L.build_not
            | A.Expon       -> L.build_not (*todo# make it work later*)
            | A.Comp        -> L.build_not (*todo# make it work later*)
           ) e' "left_uop" builder

      | A.Runop(e, op) ->
          let e' = add_expr builder e in
          (match op with
            | A.Transcb     -> L.build_not (*todo# make it work later*)
            | A.Translt     -> L.build_not (*todo# make it work later*)
            | A.Translttwo  -> L.build_not (*todo# make it work later*)
          ) e' "right_uop" builder

      | A.Assign (s, e) -> let e' = add_expr builder e in
          ignore (L.build_store e' (lookup s) builder); e'
      
      | A.Call ("print", [e]) | A.Call ("printb", [e]) ->
          L.build_call printf_func [| int_format_str ; (add_expr builder e) |]
          "printf" builder
      
      | A.Call (f, act) ->
          let (fdef, fdecl) = StringMap.find f function_decls in
          let actuals = List.rev (List.map (add_expr builder) (List.rev act)) in
          let result = (match fdecl.A.typ with A.Void -> ""
                                              | _ -> f ^ "_result") in
          L.build_call fdef (Array.of_list actuals) result builder
          
      | A.Noexpr -> L.const_int i32_t 0
      
      | _ -> L.const_int i32_t 0 (*todo# finish all the exprs*)
    in

   (*add_terminal*)
    let add_terminal builder f =
      match L.block_terminator (L.insertion_block builder) with
        Some _ -> ()
      | None -> ignore (f builder) in
  
    (*add_stmt*)
    let rec add_stmt builder = function
        A.Block sl -> List.fold_left add_stmt builder sl

      | A.Expr e -> ignore (add_expr builder e); builder

      | A.VDecl(typ,id,expr) ->
          add_local builder (typ, id);
          add_stmt builder (A.Expr (A.Assign (id, expr)))

      | A.Return e -> ignore (match fdecl.A.typ with
            A.Void -> L.build_ret_void builder
          | _ -> L.build_ret (add_expr builder e) builder); builder
      
      | A.If (cond, then_stmt, sub_stmt) ->
          let bool_val = add_expr builder cond in
          let merge_bb = L.append_block context "merge" the_function in

          let then_bb = L.append_block context "then" the_function in
              add_terminal (add_stmt (L.builder_at_end context then_bb) then_stmt)
              (L.build_br merge_bb);

          let else_bb = L.append_block context "else" the_function in
              add_terminal (add_stmt (L.builder_at_end context else_bb) sub_stmt)
              (L.build_br merge_bb);

          ignore (L.build_cond_br bool_val then_bb else_bb builder);
          L.builder_at_end context merge_bb

      | A.Elseif(cond,then_stmt,sub_stmt) ->
          add_stmt builder (A.If (cond,then_stmt,sub_stmt))

      | A.Else (then_stmts) -> 
          add_stmt builder then_stmts    
      
      | A.While (cond, do_stmt) ->
          let pred_bb = L.append_block context "while" the_function in
            ignore (L.build_br pred_bb builder);

          let body_bb = L.append_block context "while_body" the_function in
            add_terminal (add_stmt (L.builder_at_end context body_bb) do_stmt)
            (L.build_br pred_bb);

          let pred_builder = L.builder_at_end context pred_bb in
          let bool_val = add_expr pred_builder cond in

          let merge_bb = L.append_block context "merge" the_function in
            ignore (L.build_cond_br bool_val body_bb merge_bb pred_builder);
            L.builder_at_end context merge_bb

      | A.For (e1, e2, e3, for_stmt) -> add_stmt builder
          ( A.Block [A.Expr e1 ; A.While (e2, A.Block [for_stmt; A.Expr e3]) ] )

      |_->builder
    in

    (* Build the code for each statement in the function *)
    let builder = add_stmt builder (A.Block fdecl.A.stmts) in

    (* Add a return if the last block falls off the end *)
    add_terminal builder (match fdecl.A.typ with
        A.Void -> L.build_ret_void
      | t -> L.build_ret (L.const_int (ltype_of_typ t) 0))
  in

  List.iter build_function_body p_funcs; 

  the_module
