
module Make

# 6 "src/languages/icnf/parser.mly"
           (L : Dolmen_intf.Location.S)
# 7 "src/languages/icnf/parser.ml"


# 7 "src/languages/icnf/parser.mly"
           (T : Ast.Term with type location := L.t)
# 12 "src/languages/icnf/parser.ml"


# 8 "src/languages/icnf/parser.mly"
           (S : Ast.Statement with type location := L.t and type term := T.t)
# 17 "src/languages/icnf/parser.ml"

= struct
  
  module MenhirBasics = struct
    
    exception Error of int
    
    let _eRR =
      fun _s ->
        raise (Error _s)
    
    type token = Tokens.token
    
  end
  
  include MenhirBasics
  
  type ('s, 'r) _menhir_state = 
    | MenhirState00 : ('s, _menhir_box_file) _menhir_state
      (** State 00.
        Stack shape : .
        Start symbol: file. *)

    | MenhirState01 : (('s, _menhir_box_file) _menhir_cell1_NEWLINE, _menhir_box_file) _menhir_state
      (** State 01.
        Stack shape : NEWLINE.
        Start symbol: file. *)

    | MenhirState03 : (('s, _menhir_box_file) _menhir_cell1_list_NEWLINE_, _menhir_box_file) _menhir_state
      (** State 03.
        Stack shape : list(NEWLINE).
        Start symbol: file. *)

    | MenhirState07 : ((('s, _menhir_box_file) _menhir_cell1_list_NEWLINE_, _menhir_box_file) _menhir_cell1_start, _menhir_box_file) _menhir_state
      (** State 07.
        Stack shape : list(NEWLINE) start.
        Start symbol: file. *)

    | MenhirState08 : (('s, _menhir_box_file) _menhir_cell1_NEWLINE, _menhir_box_file) _menhir_state
      (** State 08.
        Stack shape : NEWLINE.
        Start symbol: file. *)

    | MenhirState11 : (('s, _menhir_box_file) _menhir_cell1_A, _menhir_box_file) _menhir_state
      (** State 11.
        Stack shape : A.
        Start symbol: file. *)

    | MenhirState15 : (('s, 'r) _menhir_cell1_atom, 'r) _menhir_state
      (** State 15.
        Stack shape : atom.
        Start symbol: <undetermined>. *)

    | MenhirState21 : (('s, _menhir_box_file) _menhir_cell1_clause, _menhir_box_file) _menhir_state
      (** State 21.
        Stack shape : clause.
        Start symbol: file. *)

    | MenhirState23 : (('s, 'r) _menhir_cell1_atom, 'r) _menhir_state
      (** State 23.
        Stack shape : atom.
        Start symbol: <undetermined>. *)

    | MenhirState25 : (('s, _menhir_box_file) _menhir_cell1_assumption, _menhir_box_file) _menhir_state
      (** State 25.
        Stack shape : assumption.
        Start symbol: file. *)

    | MenhirState29 : ('s, _menhir_box_input) _menhir_state
      (** State 29.
        Stack shape : .
        Start symbol: input. *)

    | MenhirState33 : (('s, _menhir_box_input) _menhir_cell1_NEWLINE, _menhir_box_input) _menhir_state
      (** State 33.
        Stack shape : NEWLINE.
        Start symbol: input. *)

    | MenhirState35 : (('s, _menhir_box_input) _menhir_cell1_A, _menhir_box_input) _menhir_state
      (** State 35.
        Stack shape : A.
        Start symbol: input. *)

  
  and ('s, 'r) _menhir_cell1_assumption = 
    | MenhirCell1_assumption of 's * ('s, 'r) _menhir_state * (S.t)
  
  and ('s, 'r) _menhir_cell1_atom = 
    | MenhirCell1_atom of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position
  
  and ('s, 'r) _menhir_cell1_clause = 
    | MenhirCell1_clause of 's * ('s, 'r) _menhir_state * (S.t)
  
  and ('s, 'r) _menhir_cell1_list_NEWLINE_ = 
    | MenhirCell1_list_NEWLINE_ of 's * ('s, 'r) _menhir_state * (unit list)
  
  and ('s, 'r) _menhir_cell1_start = 
    | MenhirCell1_start of 's * ('s, 'r) _menhir_state * (S.t)
  
  and ('s, 'r) _menhir_cell1_A = 
    | MenhirCell1_A of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_NEWLINE = 
    | MenhirCell1_NEWLINE of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and _menhir_box_input = 
    | MenhirBox_input of (S.t option) [@@unboxed]
  
  and _menhir_box_file = 
    | MenhirBox_file of (S.t list) [@@unboxed]
  
  let _menhir_action_02 =
    fun _endpos__4_ _startpos__1_ l ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 53 "src/languages/icnf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.assumption ~loc l )
# 136 "src/languages/icnf/parser.ml"
       : (S.t))
  
  let _menhir_action_03 =
    fun _endpos_i_ _startpos_i_ i ->
      let _endpos = _endpos_i_ in
      let _startpos = _startpos_i_ in
      (
# 57 "src/languages/icnf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.atom ~loc i )
# 146 "src/languages/icnf/parser.ml"
       : (T.t))
  
  let _menhir_action_04 =
    fun _endpos__3_ _startpos_l_ l ->
      let _endpos = _endpos__3_ in
      let _startpos = _startpos_l_ in
      (
# 49 "src/languages/icnf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.clause ~loc l )
# 156 "src/languages/icnf/parser.ml"
       : (S.t))
  
  let _menhir_action_05 =
    fun l ->
      (
# 31 "src/languages/icnf/parser.mly"
    ( l )
# 164 "src/languages/icnf/parser.ml"
       : (S.t list))
  
  let _menhir_action_06 =
    fun i ->
      (
# 19 "src/languages/icnf/parser.mly"
    ( i )
# 172 "src/languages/icnf/parser.ml"
       : (S.t option))
  
  let _menhir_action_07 =
    fun s ->
      (
# 21 "src/languages/icnf/parser.mly"
    ( Some s )
# 180 "src/languages/icnf/parser.ml"
       : (S.t option))
  
  let _menhir_action_08 =
    fun c ->
      (
# 23 "src/languages/icnf/parser.mly"
    ( Some c )
# 188 "src/languages/icnf/parser.ml"
       : (S.t option))
  
  let _menhir_action_09 =
    fun a ->
      (
# 25 "src/languages/icnf/parser.mly"
    ( Some a )
# 196 "src/languages/icnf/parser.ml"
       : (S.t option))
  
  let _menhir_action_10 =
    fun () ->
      (
# 27 "src/languages/icnf/parser.mly"
    ( None )
# 204 "src/languages/icnf/parser.ml"
       : (S.t option))
  
  let _menhir_action_11 =
    fun () ->
      (
# 216 "<standard.mly>"
    ( [] )
# 212 "src/languages/icnf/parser.ml"
       : (unit list))
  
  let _menhir_action_12 =
    fun x xs ->
      (
# 219 "<standard.mly>"
    ( x :: xs )
# 220 "src/languages/icnf/parser.ml"
       : (unit list))
  
  let _menhir_action_13 =
    fun () ->
      (
# 216 "<standard.mly>"
    ( [] )
# 228 "src/languages/icnf/parser.ml"
       : (T.t list))
  
  let _menhir_action_14 =
    fun x xs ->
      (
# 219 "<standard.mly>"
    ( x :: xs )
# 236 "src/languages/icnf/parser.ml"
       : (T.t list))
  
  let _menhir_action_15 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 244 "src/languages/icnf/parser.ml"
       : (T.t list))
  
  let _menhir_action_16 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 252 "src/languages/icnf/parser.ml"
       : (T.t list))
  
  let _menhir_action_17 =
    fun () ->
      (
# 39 "src/languages/icnf/parser.mly"
    ( [] )
# 260 "src/languages/icnf/parser.ml"
       : (S.t list))
  
  let _menhir_action_18 =
    fun l ->
      (
# 41 "src/languages/icnf/parser.mly"
    ( l )
# 268 "src/languages/icnf/parser.ml"
       : (S.t list))
  
  let _menhir_action_19 =
    fun c l ->
      (
# 43 "src/languages/icnf/parser.mly"
    ( c :: l )
# 276 "src/languages/icnf/parser.ml"
       : (S.t list))
  
  let _menhir_action_20 =
    fun a l ->
      (
# 45 "src/languages/icnf/parser.mly"
    ( a :: l )
# 284 "src/languages/icnf/parser.ml"
       : (S.t list))
  
  let _menhir_action_21 =
    fun _endpos__3_ _startpos__1_ ->
      let _endpos = _endpos__3_ in
      let _startpos = _startpos__1_ in
      (
# 35 "src/languages/icnf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.p_inccnf ~loc () )
# 294 "src/languages/icnf/parser.ml"
       : (S.t))
  
  let _menhir_print_token : token -> string =
    fun _tok ->
      match _tok with
      | Tokens.A ->
          "A"
      | Tokens.EOF ->
          "EOF"
      | Tokens.INCCNF ->
          "INCCNF"
      | Tokens.INT _ ->
          "INT"
      | Tokens.NEWLINE ->
          "NEWLINE"
      | Tokens.P ->
          "P"
      | Tokens.ZERO ->
          "ZERO"
  
  let _menhir_fail : unit -> 'a =
    fun () ->
      Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
      assert false
  
  include struct
    
    [@@@ocaml.warning "-4-37"]
    
    let _menhir_run_46 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_input =
      fun _menhir_stack _v ->
        MenhirBox_input _v
    
    let rec _menhir_goto_input : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
      fun _menhir_stack _v _menhir_s ->
        match _menhir_s with
        | MenhirState29 ->
            _menhir_run_46 _menhir_stack _v
        | MenhirState33 ->
            _menhir_run_43 _menhir_stack _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_43 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_NEWLINE -> _ -> _menhir_box_input =
      fun _menhir_stack _v ->
        let MenhirCell1_NEWLINE (_menhir_stack, _menhir_s, _) = _menhir_stack in
        let i = _v in
        let _v = _menhir_action_06 i in
        _menhir_goto_input _menhir_stack _v _menhir_s
    
    let _menhir_run_44 : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
      fun _menhir_stack _v _menhir_s ->
        let c = _v in
        let _v = _menhir_action_08 c in
        _menhir_goto_input _menhir_stack _v _menhir_s
    
    let _menhir_run_27 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_list_NEWLINE_, _menhir_box_file) _menhir_cell1_start -> _ -> _menhir_box_file =
      fun _menhir_stack _v ->
        let MenhirCell1_start (_menhir_stack, _, _) = _menhir_stack in
        let MenhirCell1_list_NEWLINE_ (_menhir_stack, _, _) = _menhir_stack in
        let l = _v in
        let _v = _menhir_action_05 l in
        MenhirBox_file _v
    
    let rec _menhir_goto_problem : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _v _menhir_s ->
        match _menhir_s with
        | MenhirState07 ->
            _menhir_run_27 _menhir_stack _v
        | MenhirState25 ->
            _menhir_run_26 _menhir_stack _v
        | MenhirState21 ->
            _menhir_run_22 _menhir_stack _v
        | MenhirState08 ->
            _menhir_run_17 _menhir_stack _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_26 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_assumption -> _ -> _menhir_box_file =
      fun _menhir_stack _v ->
        let MenhirCell1_assumption (_menhir_stack, _menhir_s, a) = _menhir_stack in
        let l = _v in
        let _v = _menhir_action_20 a l in
        _menhir_goto_problem _menhir_stack _v _menhir_s
    
    and _menhir_run_22 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_clause -> _ -> _menhir_box_file =
      fun _menhir_stack _v ->
        let MenhirCell1_clause (_menhir_stack, _menhir_s, c) = _menhir_stack in
        let l = _v in
        let _v = _menhir_action_19 c l in
        _menhir_goto_problem _menhir_stack _v _menhir_s
    
    and _menhir_run_17 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_NEWLINE -> _ -> _menhir_box_file =
      fun _menhir_stack _v ->
        let MenhirCell1_NEWLINE (_menhir_stack, _menhir_s, _) = _menhir_stack in
        let l = _v in
        let _v = _menhir_action_18 l in
        _menhir_goto_problem _menhir_stack _v _menhir_s
    
    let _menhir_run_10 : type  ttv_stack. ttv_stack -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_s ->
        let _v = _menhir_action_17 () in
        _menhir_goto_problem _menhir_stack _v _menhir_s
    
    let _menhir_run_45 : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
      fun _menhir_stack _v _menhir_s ->
        let a = _v in
        let _v = _menhir_action_09 a in
        _menhir_goto_input _menhir_stack _v _menhir_s
    
    let rec _menhir_run_08 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell1_NEWLINE (_menhir_stack, _menhir_s, _endpos) in
        let _menhir_s = MenhirState08 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.NEWLINE ->
            _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INT _v ->
            _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.EOF ->
            _menhir_run_10 _menhir_stack _menhir_s
        | Tokens.A ->
            _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 8
    
    and _menhir_run_09 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_i_, _startpos_i_, i) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_03 _endpos_i_ _startpos_i_ i in
        _menhir_goto_atom _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_i_ _v _menhir_s _tok
    
    and _menhir_goto_atom : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState29 ->
            _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState33 ->
            _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState07 ->
            _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState08 ->
            _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState25 ->
            _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState23 ->
            _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState21 ->
            _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState35 ->
            _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState15 ->
            _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState11 ->
            _menhir_run_15 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_23 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.INT _v_0 ->
            let _menhir_stack = MenhirCell1_atom (_menhir_stack, _menhir_s, _v, _startpos) in
            _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState23
        | Tokens.ZERO ->
            let (_startpos_x_, x) = (_startpos, _v) in
            let _v = _menhir_action_15 x in
            _menhir_goto_nonempty_list_atom_ _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_x_ _v _menhir_s
        | _ ->
            _eRR 23
    
    and _menhir_goto_nonempty_list_atom_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s ->
        match _menhir_s with
        | MenhirState29 ->
            _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s
        | MenhirState33 ->
            _menhir_run_40 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s
        | MenhirState23 ->
            _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState07 ->
            _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s
        | MenhirState25 ->
            _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s
        | MenhirState21 ->
            _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s
        | MenhirState08 ->
            _menhir_run_18 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_40 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.NEWLINE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let (_endpos__3_, _startpos_l_, l) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_04 _endpos__3_ _startpos_l_ l in
            _menhir_goto_clause _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 41
    
    and _menhir_goto_clause : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState29 ->
            _menhir_run_44 _menhir_stack _v _menhir_s
        | MenhirState33 ->
            _menhir_run_44 _menhir_stack _v _menhir_s
        | MenhirState07 ->
            _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState25 ->
            _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState21 ->
            _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState08 ->
            _menhir_run_21 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_21 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_clause (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.NEWLINE ->
            _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState21
        | Tokens.INT _v_0 ->
            _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState21
        | Tokens.EOF ->
            _menhir_run_10 _menhir_stack MenhirState21
        | Tokens.A ->
            _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState21
        | _ ->
            _eRR 21
    
    and _menhir_run_11 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_A (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.INT _v ->
            _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState11
        | Tokens.ZERO ->
            let _v = _menhir_action_13 () in
            _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _eRR 11
    
    and _menhir_run_12 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_A -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.NEWLINE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_A (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__4_, l) = (_endpos, _v) in
            let _v = _menhir_action_02 _endpos__4_ _startpos__1_ l in
            _menhir_goto_assumption _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 13
    
    and _menhir_goto_assumption : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState29 ->
            _menhir_run_45 _menhir_stack _v _menhir_s
        | MenhirState33 ->
            _menhir_run_45 _menhir_stack _v _menhir_s
        | MenhirState07 ->
            _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState08 ->
            _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState25 ->
            _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState21 ->
            _menhir_run_25 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_25 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_assumption (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.NEWLINE ->
            _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState25
        | Tokens.INT _v_0 ->
            _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState25
        | Tokens.EOF ->
            _menhir_run_10 _menhir_stack MenhirState25
        | Tokens.A ->
            _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState25
        | _ ->
            _eRR 25
    
    and _menhir_run_24 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_atom -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_atom (_menhir_stack, _menhir_s, x, _startpos_x_) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_16 x xs in
        _menhir_goto_nonempty_list_atom_ _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_x_ _v _menhir_s
    
    and _menhir_run_18 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.NEWLINE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let (_endpos__3_, _startpos_l_, l) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_04 _endpos__3_ _startpos_l_ l in
            _menhir_goto_clause _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 19
    
    and _menhir_run_15 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_atom (_menhir_stack, _menhir_s, _v, _startpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.INT _v_0 ->
            _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState15
        | Tokens.ZERO ->
            let _v_1 = _menhir_action_13 () in
            _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1
        | _ ->
            _eRR 15
    
    and _menhir_run_16 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_atom -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_atom (_menhir_stack, _menhir_s, x, _) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_14 x xs in
        _menhir_goto_list_atom_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_goto_list_atom_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState35 ->
            _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState15 ->
            _menhir_run_16 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState11 ->
            _menhir_run_12 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_36 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_A -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.NEWLINE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let MenhirCell1_A (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__4_, l) = (_endpos, _v) in
            let _v = _menhir_action_02 _endpos__4_ _startpos__1_ l in
            _menhir_goto_assumption _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 37
    
    let _menhir_run_07 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_list_NEWLINE_ as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_start (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.NEWLINE ->
            _menhir_run_08 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
        | Tokens.INT _v_0 ->
            _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState07
        | Tokens.EOF ->
            _menhir_run_10 _menhir_stack MenhirState07
        | Tokens.A ->
            _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState07
        | _ ->
            _eRR 7
    
    let _menhir_run_03 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_list_NEWLINE_ (_menhir_stack, _menhir_s, _v) in
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.INCCNF ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.NEWLINE ->
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _tok = _menhir_lexer _menhir_lexbuf in
                let _v_0 =
                  let (_startpos__1_, _endpos__3_) = (_startpos, _endpos) in
                  _menhir_action_21 _endpos__3_ _startpos__1_
                in
                _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState03 _tok
            | _ ->
                _eRR 5)
        | _ ->
            _eRR 4
    
    let rec _menhir_run_02 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_NEWLINE -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_NEWLINE (_menhir_stack, _menhir_s, _) = _menhir_stack in
        let (xs, x) = (_v, ()) in
        let _v = _menhir_action_12 x xs in
        _menhir_goto_list_NEWLINE_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_goto_list_NEWLINE_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState00 ->
            _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState01 ->
            _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    let rec _menhir_run_01 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell1_NEWLINE (_menhir_stack, _menhir_s, _endpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.NEWLINE ->
            _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
        | Tokens.P ->
            let _v = _menhir_action_11 () in
            _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _eRR 1
    
    let _menhir_run_00 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.NEWLINE ->
            _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState00
        | Tokens.P ->
            let _v = _menhir_action_11 () in
            _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00
        | _ ->
            _eRR 0
    
    let _menhir_run_39 : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
      fun _menhir_stack _v _menhir_s ->
        let s = _v in
        let _v = _menhir_action_07 s in
        _menhir_goto_input _menhir_stack _v _menhir_s
    
    let _menhir_goto_start : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState29 ->
            _menhir_run_39 _menhir_stack _v _menhir_s
        | MenhirState33 ->
            _menhir_run_39 _menhir_stack _v _menhir_s
        | MenhirState03 ->
            _menhir_run_07 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    let _menhir_run_30 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.INCCNF ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.NEWLINE ->
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let (_startpos__1_, _endpos__3_) = (_startpos, _endpos) in
                let _v = _menhir_action_21 _endpos__3_ _startpos__1_ in
                _menhir_goto_start _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
            | _ ->
                _eRR 31)
        | _ ->
            _eRR 30
    
    let _menhir_run_34 : type  ttv_stack. ttv_stack -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
      fun _menhir_stack _menhir_s ->
        let _v = _menhir_action_10 () in
        _menhir_goto_input _menhir_stack _v _menhir_s
    
    let _menhir_run_35 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_A (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.INT _v ->
            _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState35
        | Tokens.ZERO ->
            let _v = _menhir_action_13 () in
            _menhir_run_36 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _eRR 35
    
    let rec _menhir_run_33 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell1_NEWLINE (_menhir_stack, _menhir_s, _endpos) in
        let _menhir_s = MenhirState33 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.P ->
            _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.NEWLINE ->
            _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INT _v ->
            _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.EOF ->
            _menhir_run_34 _menhir_stack _menhir_s
        | Tokens.A ->
            _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 33
    
    let _menhir_run_29 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _menhir_s = MenhirState29 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.P ->
            _menhir_run_30 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.NEWLINE ->
            _menhir_run_33 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INT _v ->
            _menhir_run_09 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.EOF ->
            _menhir_run_34 _menhir_stack _menhir_s
        | Tokens.A ->
            _menhir_run_35 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 29
    
  end
  
  let input =
    fun _menhir_lexer _menhir_lexbuf ->
      let _menhir_stack = () in
      let MenhirBox_input v = _menhir_run_29 _menhir_stack _menhir_lexbuf _menhir_lexer in
      v
  
  let file =
    fun _menhir_lexer _menhir_lexbuf ->
      let _menhir_stack = () in
      let MenhirBox_file v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
      v
  
end
