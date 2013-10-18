(* generated by ocamltarzan with: camlp4o -o /tmp/yyy.ml -I pa/ pa_type_conv.cmo pa_vof.cmo  pr_o.cmo /tmp/xxx.ml  *)

open Ast_php_simple
module Ast_php = Meta_ast_php

let rec vof_program v = Ocaml.vof_list vof_stmt v
and vof_wrapped_string (s, tok) =
  Ocaml.VString s
and vof_name x = Ocaml.vof_list vof_wrapped_string x
and vof_qualified_ident x = Ocaml.vof_list vof_wrapped_string x
and vof_ident x =vof_wrapped_string x
and vof_var x = vof_wrapped_string x

and vof_stmt =
  function
  | Expr v1 -> let v1 = vof_expr v1 in Ocaml.VSum (("Expr", [ v1 ]))
  | Block v1 ->
      let v1 = Ocaml.vof_list vof_stmt v1 in Ocaml.VSum (("Block", [ v1 ]))
  | If ((v1, v2, v3)) ->
      let v1 = vof_expr v1
      and v2 = vof_stmt v2
      and v3 = vof_stmt v3
      in Ocaml.VSum (("If", [ v1; v2; v3 ]))
  | While ((v1, v2)) ->
      let v1 = vof_expr v1
      and v2 = Ocaml.vof_list vof_stmt v2
      in Ocaml.VSum (("While", [ v1; v2 ]))
  | Do ((v1, v2)) ->
      let v1 = Ocaml.vof_list vof_stmt v1
      and v2 = vof_expr v2
      in Ocaml.VSum (("Do", [ v1; v2 ]))
  | For ((v1, v2, v3, v4)) ->
      let v1 = Ocaml.vof_list vof_expr v1
      and v2 = Ocaml.vof_list vof_expr v2
      and v3 = Ocaml.vof_list vof_expr v3
      and v4 = Ocaml.vof_list vof_stmt v4
      in Ocaml.VSum (("For", [ v1; v2; v3; v4 ]))
  | Switch ((v1, v2)) ->
      let v1 = vof_expr v1
      and v2 = Ocaml.vof_list vof_case v2
      in Ocaml.VSum (("Switch", [ v1; v2 ]))
  | Foreach ((v1, v2, v3)) ->
      let v1 = vof_expr v1
      and v2 = vof_pattern v2
      and v3 = Ocaml.vof_list vof_stmt v3
      in Ocaml.VSum (("Foreach", [ v1; v2; v3 ]))
  | Return (v1) ->
      let v1 = Ocaml.vof_option vof_expr v1
      in Ocaml.VSum (("Return", [ v1 ]))
  | Break v1 ->
      let v1 = Ocaml.vof_option vof_expr v1 in Ocaml.VSum (("Break", [ v1 ]))
  | Continue v1 ->
      let v1 = Ocaml.vof_option vof_expr v1
      in Ocaml.VSum (("Continue", [ v1 ]))
  | Throw v1 -> let v1 = vof_expr v1 in Ocaml.VSum (("Throw", [ v1 ]))
  | Try ((v1, v2, v3)) ->
      let v1 = Ocaml.vof_list vof_stmt v1
      and v2 = vof_catch v2
      and v3 = Ocaml.vof_list vof_catch v3
      in Ocaml.VSum (("Try", [ v1; v2; v3 ]))
  | StaticVars v1 ->
      let v1 =
        Ocaml.vof_list
          (fun (v1, v2) ->
             let v1 = vof_wrapped_string v1
             and v2 = Ocaml.vof_option vof_expr v2
             in Ocaml.VTuple [ v1; v2 ])
          v1
      in Ocaml.VSum (("StaticVars", [ v1 ]))
  | Global v1 ->
      let v1 = Ocaml.vof_list vof_expr v1 in Ocaml.VSum (("Global", [ v1 ]))
  | ClassDef v1 ->
      let v1 = vof_class_def v1 in Ocaml.VSum (("ClassDef", [ v1 ]))
  | FuncDef v1 ->
      let v1 = vof_func_def v1 in Ocaml.VSum (("FuncDef", [ v1 ]))
  | ConstantDef v1 ->
      let v1 = vof_constant_def v1 in Ocaml.VSum (("ConstantDef", [ v1 ]))
  | TypeDef v1 ->
      let v1 = vof_type_def v1 in Ocaml.VSum (("TypeDef", [ v1 ]))
  | NamespaceDef v1 ->
      let v1 = vof_qualified_ident v1
      in Ocaml.VSum (("NamespaceDef", [ v1 ]))
  | NamespaceUse ((v1, v2)) ->
      let v1 = vof_qualified_ident v1
      and v2 = Ocaml.vof_option vof_ident v2
      in Ocaml.VSum (("NamespaceUse", [ v1; v2 ]))


and vof_type_def { t_name = v_t_name; t_kind = v_t_kind } =
  let bnds = [] in
  let arg = vof_type_def_kind v_t_kind in
  let bnd = ("t_kind", arg) in
  let bnds = bnd :: bnds in
  let arg = vof_ident v_t_name in
  let bnd = ("t_name", arg) in let bnds = bnd :: bnds in Ocaml.VDict bnds
and vof_type_def_kind =
  function
  | Alias v1 -> let v1 = vof_hint_type v1 in Ocaml.VSum (("Alias", [ v1 ]))
  | Newtype v1 ->
      let v1 = vof_hint_type v1 in Ocaml.VSum (("Newtype", [ v1 ]))

and vof_case =
  function
  | Case ((v1, v2)) ->
      let v1 = vof_expr v1
      and v2 = Ocaml.vof_list vof_stmt v2
      in Ocaml.VSum (("Case", [ v1; v2 ]))
  | Default v1 ->
      let v1 = Ocaml.vof_list vof_stmt v1 in Ocaml.VSum (("Default", [ v1 ]))
and vof_catch (v1, v2, v3) =
  let v1 = vof_hint_type v1
  and v2 = vof_var v2
  and v3 = Ocaml.vof_list vof_stmt v3
  in Ocaml.VTuple [ v1; v2; v3 ]
and vof_expr =
  function
  | Int v1 -> let v1 = Ocaml.vof_string v1 in Ocaml.VSum (("Int", [ v1 ]))
  | Double v1 ->
      let v1 = Ocaml.vof_string v1 in Ocaml.VSum (("Double", [ v1 ]))
  | String v1 ->
      let v1 = vof_wrapped_string v1 in Ocaml.VSum (("String", [ v1 ]))
  | Guil v1 ->
      let v1 = Ocaml.vof_list vof_encaps v1 in Ocaml.VSum (("Guil", [ v1 ]))
  | Id v1 ->
      let v1 = vof_name v1 in Ocaml.VSum (("Id", [ v1 ]))
  | Var v1 ->
      let v1 = vof_var v1 in Ocaml.VSum (("Var", [ v1 ]))
  | This name ->
      let v1 = vof_wrapped_string name in
      Ocaml.VSum (("This", [ v1 ]))
  | Array_get ((v1, v2)) ->
      let v1 = vof_expr v1
      and v2 = Ocaml.vof_option vof_expr v2
      in Ocaml.VSum (("Array_get", [ v1; v2 ]))
  | Obj_get ((v1, v2)) ->
      let v1 = vof_expr v1
      and v2 = vof_expr v2
      in Ocaml.VSum (("Obj_get", [ v1; v2 ]))
  | Class_get ((v1, v2)) ->
      let v1 = vof_expr v1
      and v2 = vof_expr v2
      in Ocaml.VSum (("Class_get", [ v1; v2 ]))
  | Assign ((v1, v2, v3)) ->
      let v1 = Ocaml.vof_option Ast_php.vof_binaryOp v1
      and v2 = vof_expr v2
      and v3 = vof_expr v3
      in Ocaml.VSum (("Assign", [ v1; v2; v3 ]))
  | Infix ((v1, v2)) ->
      let v1 = Ast_php.vof_fixOp v1
      and v2 = vof_expr v2
      in Ocaml.VSum (("Infix", [ v1; v2 ]))
  | Postfix ((v1, v2)) ->
      let v1 = Ast_php.vof_fixOp v1
      and v2 = vof_expr v2
      in Ocaml.VSum (("Postfix", [ v1; v2 ]))
  | Binop ((v1, v2, v3)) ->
      let v1 = Ast_php.vof_binaryOp v1
      and v2 = vof_expr v2
      and v3 = vof_expr v3
      in Ocaml.VSum (("Binop", [ v1; v2; v3 ]))
  | Unop ((v1, v2)) ->
      let v1 = Ast_php.vof_unaryOp v1
      and v2 = vof_expr v2
      in Ocaml.VSum (("Unop", [ v1; v2 ]))
  | Call ((v1, v2)) ->
      let v1 = vof_expr v1
      and v2 = Ocaml.vof_list vof_expr v2
      in Ocaml.VSum (("Call", [ v1; v2 ]))
  | Ref v1 -> let v1 = vof_expr v1 in Ocaml.VSum (("Ref", [ v1 ]))
  | Xhp v1 -> let v1 = vof_xml v1 in Ocaml.VSum (("Xhp", [ v1 ]))
  | ConsArray (v1) ->
      let v1 = Ocaml.vof_list vof_array_value v1
      in Ocaml.VSum (("ConsArray", [ v1 ]))
  | Collection (v1, v2) ->
      let v1 = vof_name v1 in
      let v2 = Ocaml.vof_list vof_array_value v2 in
      Ocaml.VSum (("Collection", [ v1 ; v2 ]))
  | List v1 ->
      let v1 = Ocaml.vof_list vof_expr v1 in Ocaml.VSum (("List", [ v1 ]))
  | Arrow ((v1, v2)) ->
      let v1 = vof_expr v1
      and v2 = vof_expr v2
      in Ocaml.VSum (("Arrow", [ v1; v2 ]))
  | New ((v1, v2)) ->
      let v1 = vof_expr v1
      and v2 = Ocaml.vof_list vof_expr v2
      in Ocaml.VSum (("New", [ v1; v2 ]))
  | InstanceOf ((v1, v2)) ->
      let v1 = vof_expr v1
      and v2 = vof_expr v2
      in Ocaml.VSum (("InstanceOf", [ v1; v2 ]))
  | CondExpr ((v1, v2, v3)) ->
      let v1 = vof_expr v1
      and v2 = vof_expr v2
      and v3 = vof_expr v3
      in Ocaml.VSum (("CondExpr", [ v1; v2; v3 ]))
  | Cast ((v1, v2)) ->
      let v1 = Ast_php.vof_ptype v1
      and v2 = vof_expr v2
      in Ocaml.VSum (("Cast", [ v1; v2 ]))
  | Lambda v1 -> let v1 = vof_func_def v1 in Ocaml.VSum (("Lambda", [ v1 ]))
and vof_vector_elt e = vof_expr e
and vof_map_elt (e1, e2) =
  Ocaml.VTuple ([ vof_expr e1; vof_expr e2])
and vof_encaps x = vof_expr x
and vof_xhp =
  function
  | XhpText v1 ->
      let v1 = Ocaml.vof_string v1 in Ocaml.VSum (("XhpText", [ v1 ]))
  | XhpExpr v1 -> let v1 = vof_expr v1 in Ocaml.VSum (("XhpExpr", [ v1 ]))
  | XhpXml v1 -> let v1 = vof_xml v1 in Ocaml.VSum (("XhpXml", [ v1 ]))
and
  vof_xml {
            xml_tag = v_xml_tag;
            xml_attrs = v_xml_attrs;
            xml_body = v_xml_body
          } =
  let bnds = [] in
  let arg = Ocaml.vof_list vof_xhp v_xml_body in
  let bnd = ("xml_body", arg) in
  let bnds = bnd :: bnds in
  let arg =
    Ocaml.vof_list
      (fun (v1, v2) ->
         let v1 = vof_var v1
         and v2 = vof_xhp_attr v2
         in Ocaml.VTuple [ v1; v2 ])
      v_xml_attrs in
  let bnd = ("xml_attrs", arg) in
  let bnds = bnd :: bnds in
  let arg = vof_ident v_xml_tag in
  let bnd = ("xml_tag", arg) in let bnds = bnd :: bnds in Ocaml.VDict bnds
and vof_xhp_attr x = vof_expr x

and vof_constant_def { cst_name = v_cst_name; cst_body = v_cst_body } =
  let bnds = [] in
  let arg = vof_expr v_cst_body in
  let bnd = ("cst_body", arg) in
  let bnds = bnd :: bnds in
  let arg = vof_wrapped_string v_cst_name in
  let bnd = ("cst_name", arg) in let bnds = bnd :: bnds in
  Ocaml.VDict bnds
and vof_func_def {
                 f_ref = v_f_ref;
                 f_name = v_f_name;
                 f_params = v_f_params;
                 f_return_type = v_f_return_type;
                 f_body = v_f_body;
                 f_kind = v_f_type;
                 m_modifiers = v_f_modifiers;
                 f_attrs = v_f_attrs;
                 l_uses = v_l_uses;
               } =
  let bnds = [] in
  let arg = Ocaml.vof_list vof_stmt v_f_body in
  let bnd = ("f_body", arg) in
  let bnds = bnd :: bnds in
  let arg = Ocaml.vof_list vof_attribute v_f_attrs in
  let bnd = ("f_attrs", arg) in
  let bnds = bnd :: bnds in
  let arg = Ocaml.vof_list vof_lexical_var v_l_uses in
  let bnd = ("l_uses", arg) in
  let bnds = bnd :: bnds in
  let arg = Ocaml.vof_list vof_modifier v_f_modifiers in
  let bnd = ("m_modifiers", arg) in
  let bnds = bnd :: bnds in
  let arg = Ocaml.vof_option vof_hint_type v_f_return_type in
  let bnd = ("f_return_type", arg) in
  let bnds = bnd :: bnds in
  let arg = Ocaml.vof_bool v_f_ref in
  let bnd = ("f_ref", arg) in
  let bnds = bnd :: bnds in
  let arg = Ocaml.vof_list vof_parameter v_f_params in
  let bnd = ("f_params", arg) in
  let bnds = bnd :: bnds in
  let arg = vof_function_type v_f_type in
  let bnd = ("f_kind", arg) in
  let bnds = bnd :: bnds in
  let arg = vof_wrapped_string v_f_name in
  let bnd = ("f_name", arg) in
  let bnds = bnd :: bnds in
  Ocaml.VDict bnds
and vof_lexical_var (is_ref, name) =
  Ocaml.VTuple ([Ocaml.vof_bool is_ref; vof_var name])
and vof_function_type =
  function
  | Function -> Ocaml.VSum (("Function", []))
  | Method -> Ocaml.VSum (("Method", []))
  | AnonLambda -> Ocaml.VSum (("AnonLambda", []))
and
  vof_parameter {
                  p_attrs = v_p_attrs;
                  p_type = v_p_type;
                  p_ref = v_p_ref;
                  p_name = v_p_name;
                  p_default = v_p_default
                } =
  let bnds = [] in
  let arg = Ocaml.vof_option vof_expr v_p_default in
  let bnd = ("p_default", arg) in
  let bnds = bnd :: bnds in
  let arg = Ocaml.vof_bool v_p_ref in
  let bnd = ("p_ref", arg) in
  let bnds = bnd :: bnds in
  let arg = Ocaml.vof_list vof_attribute v_p_attrs in
  let bnd = ("p_attrs", arg) in
  let bnds = bnd :: bnds in
  let arg = Ocaml.vof_option vof_hint_type v_p_type in
  let bnd = ("p_type", arg) in
  let bnds = bnd :: bnds in
  let arg = vof_wrapped_string v_p_name in
  let bnd = ("p_name", arg) in
  let bnds = bnd :: bnds in
  Ocaml.VDict bnds
and vof_hint_type =
  function
  | Hint v1 -> let v1 = vof_name v1 in Ocaml.VSum (("Hint", [ v1 ]))
  | HintArray -> Ocaml.VSum (("HintArray", []))
  | HintQuestion t -> (Ocaml.VSum (("HintQuestion", [ vof_hint_type t ])))
  | HintTuple l -> Ocaml.VSum (("HintTuple", List.map vof_hint_type l))
  | HintCallback (args, ret) ->
      Ocaml.VSum (("HintCallback",
                   [ Ocaml.VList (List.map vof_hint_type args);
                     Ocaml.vof_option vof_hint_type ret ]))
  | HintShape v1 ->
      let v1 =
        Ocaml.vof_list
          (fun (v1, v2) ->
             let v1 = vof_wrapped_string v1
             and v2 = vof_hint_type v2
             in Ocaml.VTuple [ v1; v2 ])
          v1
      in Ocaml.VSum (("HintShape", [ v1 ]))

and
  vof_class_def {
                  c_kind = v_c_type;
                  c_name = v_c_name;
                  c_extends = v_c_extends;
                  c_attrs = v_c_attrs;
                  c_xhp_fields = v_c_xhp_fields;
                  c_xhp_attr_inherit = v_c_xhp_attr_inherit;
                  c_uses = v_c_traits;
                  c_implements = v_c_implements;
                  c_constants = v_c_constants;
                  c_variables = v_c_variables;
                  c_methods = v_c_body
                } =
  let bnds = [] in
  let arg = Ocaml.vof_list vof_method_def v_c_body in
  let bnd = ("c_body", arg) in
  let bnds = bnd :: bnds in
  let arg = Ocaml.vof_list vof_class_var v_c_variables in
  let bnd = ("c_variables", arg) in
  let bnds = bnd :: bnds in
  let arg = Ocaml.vof_list vof_xhp_field v_c_xhp_fields in
  let bnd = ("c_xhp_fields", arg) in
  let bnds = bnd :: bnds in
  let arg = Ocaml.vof_list vof_class_name v_c_xhp_attr_inherit in
  let bnd = ("c_xhp_attr_inherit", arg) in
  let bnds = bnd :: bnds in
  let arg = Ocaml.vof_list vof_constant_def v_c_constants in
  let bnd = ("c_constants", arg) in
  let bnds = bnd :: bnds in
  let arg = Ocaml.vof_list vof_attribute v_c_attrs in
  let bnd = ("c_attrs", arg) in
  let bnds = bnd :: bnds in
  let arg = Ocaml.vof_list vof_class_name v_c_implements in
  let bnd = ("c_implements", arg) in
  let bnds = bnd :: bnds in
  let arg = Ocaml.vof_option vof_class_name v_c_extends in
  let bnd = ("c_extends", arg) in
  let bnds = bnd :: bnds in
  let arg = vof_class_type v_c_type in
  let bnd = ("c_kind", arg) in
  let bnds = bnd :: bnds in
  let arg = vof_wrapped_string v_c_name in
  let bnd = ("c_name", arg) in
  let bnds = bnd :: bnds in
  Ocaml.VDict bnds
and vof_class_name x = vof_hint_type x
and vof_class_type =
  function
  | ClassRegular -> Ocaml.VSum (("ClassRegular", []))
  | ClassFinal -> Ocaml.VSum (("ClassFinal", []))
  | ClassAbstract -> Ocaml.VSum (("ClassAbstract", []))
  | Interface -> Ocaml.VSum (("Interface", []))
  | Trait -> Ocaml.VSum (("Trait", []))
and vof_xhp_field (v1, v2) =
  let v1 = vof_class_var v1 in
  let v2 = Ocaml.VBool v2 in
  Ocaml.VSum (("Xhp_field", [ v1; v2 ]))
and
  vof_class_var {
                  cv_name = v_cv_name;
                  cv_type = v_cv_type;
                  cv_value = v_cv_value;
                  cv_modifiers = v_cv_modifiers
                } =
  let bnds = [] in
  let arg = Ocaml.vof_list vof_modifier v_cv_modifiers in
  let bnd = ("cv_modifiers", arg) in
  let bnds = bnd :: bnds in
  let arg = Ocaml.vof_option vof_expr v_cv_value in
  let bnd = ("cv_value", arg) in
  let bnds = bnd :: bnds in
  let arg = Ocaml.vof_option vof_hint_type v_cv_type in
  let bnd = ("cv_type", arg) in
  let bnds = bnd :: bnds in
  let arg = vof_var v_cv_name in
  let bnd = ("cv_name", arg) in let bnds = bnd :: bnds in Ocaml.VDict bnds
and vof_modifier x = Ast_php.vof_modifier x
and vof_attribute v = vof_expr v
and vof_method_def x = vof_func_def x
and vof_pattern x = vof_expr x
and vof_array_value x = vof_expr x

let vof_any =
  function
  | Program v1 -> let v1 = vof_program v1 in Ocaml.VSum (("Program", [ v1 ]))
  | Stmt v1 -> let v1 = vof_stmt v1 in Ocaml.VSum (("Stmt", [ v1 ]))
  | Expr2 v1 -> let v1 = vof_expr v1 in Ocaml.VSum (("Expr2", [ v1 ]))
  | Param v1 -> let v1 = vof_parameter v1 in Ocaml.VSum (("Param", [ v1 ]))
