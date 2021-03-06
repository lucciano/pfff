open Common
open OUnit

open Ast_js
module Ast = Ast_js
module Flag = Flag_parsing_js

(*****************************************************************************)
(* Subsystem testing *)
(*****************************************************************************)

let test_stats_js xs =
  Stats_js.main xs

(*****************************************************************************)
(* Main entry for Arg *)
(*****************************************************************************)

let actions () = [
  "-stats_js", "   <file>", 
  Common.mk_action_n_arg test_stats_js;
]
