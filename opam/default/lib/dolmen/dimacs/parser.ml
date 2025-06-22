
module Make

# 6 "src/languages/dimacs/parser.mly"
           (L : Dolmen_intf.Location.S)
# 7 "src/languages/dimacs/parser.ml"


# 7 "src/languages/dimacs/parser.mly"
           (T : Ast.Term with type location := L.t)
# 12 "src/languages/dimacs/parser.ml"


# 8 "src/languages/dimacs/parser.mly"
           (S : Ast.Statement with type location := L.t and type term := T.t)
# 17 "src/languages/dimacs/parser.ml"

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

    | MenhirState01 : (('s, 'r) _menhir_cell1_NEWLINE, 'r) _menhir_state
      (** State 01.
        Stack shape : NEWLINE.
        Start symbol: <undetermined>. *)

    | MenhirState03 : (('s, _menhir_box_file) _menhir_cell1_list_NEWLINE_, _menhir_box_file) _menhir_state
      (** State 03.
        Stack shape : list(NEWLINE).
        Start symbol: file. *)

    | MenhirState09 : ((('s, _menhir_box_file) _menhir_cell1_list_NEWLINE_, _menhir_box_file) _menhir_cell1_start, _menhir_box_file) _menhir_state
      (** State 09.
        Stack shape : list(NEWLINE) start.
        Start symbol: file. *)

    | MenhirState10 : (('s, _menhir_box_file) _menhir_cell1_NEWLINE, _menhir_box_file) _menhir_state
      (** State 10.
        Stack shape : NEWLINE.
        Start symbol: file. *)

    | MenhirState17 : (('s, _menhir_box_file) _menhir_cell1_clause, _menhir_box_file) _menhir_state
      (** State 17.
        Stack shape : clause.
        Start symbol: file. *)

    | MenhirState19 : (('s, 'r) _menhir_cell1_atom, 'r) _menhir_state
      (** State 19.
        Stack shape : atom.
        Start symbol: <undetermined>. *)

    | MenhirState23 : ('s, _menhir_box_input) _menhir_state
      (** State 23.
        Stack shape : .
        Start symbol: input. *)

    | MenhirState24 : (('s, _menhir_box_input) _menhir_cell1_list_NEWLINE_, _menhir_box_input) _menhir_state
      (** State 24.
        Stack shape : list(NEWLINE).
        Start symbol: input. *)

  
  and ('s, 'r) _menhir_cell1_atom = 
    | MenhirCell1_atom of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position
  
  and ('s, 'r) _menhir_cell1_clause = 
    | MenhirCell1_clause of 's * ('s, 'r) _menhir_state * (S.t)
  
  and ('s, 'r) _menhir_cell1_list_NEWLINE_ = 
    | MenhirCell1_list_NEWLINE_ of 's * ('s, 'r) _menhir_state * (unit list)
  
  and ('s, 'r) _menhir_cell1_start = 
    | MenhirCell1_start of 's * ('s, 'r) _menhir_state * (S.t)
  
  and ('s, 'r) _menhir_cell1_NEWLINE = 
    | MenhirCell1_NEWLINE of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and _menhir_box_input = 
    | MenhirBox_input of (S.t option) [@@unboxed]
  
  and _menhir_box_file = 
    | MenhirBox_file of (S.t list) [@@unboxed]
  
  let _menhir_action_02 =
    fun _endpos_i_ _startpos_i_ i ->
      let _endpos = _endpos_i_ in
      let _startpos = _startpos_i_ in
      (
# 48 "src/languages/dimacs/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.atom ~loc i )
# 110 "src/languages/dimacs/parser.ml"
       : (T.t))
  
  let _menhir_action_03 =
    fun _endpos__3_ _startpos_c_ c ->
      let _endpos = _endpos__3_ in
      let _startpos = _startpos_c_ in
      (
# 44 "src/languages/dimacs/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.clause ~loc c )
# 120 "src/languages/dimacs/parser.ml"
       : (S.t))
  
  let _menhir_action_04 =
    fun () ->
      (
# 36 "src/languages/dimacs/parser.mly"
    ( [] )
# 128 "src/languages/dimacs/parser.ml"
       : (S.t list))
  
  let _menhir_action_05 =
    fun l ->
      (
# 38 "src/languages/dimacs/parser.mly"
    ( l )
# 136 "src/languages/dimacs/parser.ml"
       : (S.t list))
  
  let _menhir_action_06 =
    fun c l ->
      (
# 40 "src/languages/dimacs/parser.mly"
    ( c :: l )
# 144 "src/languages/dimacs/parser.ml"
       : (S.t list))
  
  let _menhir_action_07 =
    fun h l ->
      (
# 27 "src/languages/dimacs/parser.mly"
    ( h :: l )
# 152 "src/languages/dimacs/parser.ml"
       : (S.t list))
  
  let _menhir_action_08 =
    fun () ->
      (
# 19 "src/languages/dimacs/parser.mly"
    ( None )
# 160 "src/languages/dimacs/parser.ml"
       : (S.t option))
  
  let _menhir_action_09 =
    fun s ->
      (
# 21 "src/languages/dimacs/parser.mly"
    ( Some s )
# 168 "src/languages/dimacs/parser.ml"
       : (S.t option))
  
  let _menhir_action_10 =
    fun c ->
      (
# 23 "src/languages/dimacs/parser.mly"
    ( Some c )
# 176 "src/languages/dimacs/parser.ml"
       : (S.t option))
  
  let _menhir_action_11 =
    fun () ->
      (
# 216 "<standard.mly>"
    ( [] )
# 184 "src/languages/dimacs/parser.ml"
       : (unit list))
  
  let _menhir_action_12 =
    fun x xs ->
      (
# 219 "<standard.mly>"
    ( x :: xs )
# 192 "src/languages/dimacs/parser.ml"
       : (unit list))
  
  let _menhir_action_13 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 200 "src/languages/dimacs/parser.ml"
       : (T.t list))
  
  let _menhir_action_14 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 208 "src/languages/dimacs/parser.ml"
       : (T.t list))
  
  let _menhir_action_15 =
    fun _endpos__5_ _startpos__1_ nbclause nbvar ->
      let _endpos = _endpos__5_ in
      let _startpos = _startpos__1_ in
      (
# 31 "src/languages/dimacs/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      S.p_cnf ~loc nbvar nbclause )
# 219 "src/languages/dimacs/parser.ml"
       : (S.t))
  
  let _menhir_print_token : token -> string =
    fun _tok ->
      match _tok with
      | Tokens.CNF ->
          "CNF"
      | Tokens.EOF ->
          "EOF"
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
    
    let _menhir_goto_input : type  ttv_stack. ttv_stack -> _ -> _menhir_box_input =
      fun _menhir_stack _v ->
        MenhirBox_input _v
    
    let _menhir_run_35 : type  ttv_stack. (ttv_stack, _menhir_box_input) _menhir_cell1_list_NEWLINE_ -> _ -> _menhir_box_input =
      fun _menhir_stack _v ->
        let MenhirCell1_list_NEWLINE_ (_menhir_stack, _, _) = _menhir_stack in
        let c = _v in
        let _v = _menhir_action_10 c in
        _menhir_goto_input _menhir_stack _v
    
    let _menhir_run_21 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_list_NEWLINE_, _menhir_box_file) _menhir_cell1_start -> _ -> _menhir_box_file =
      fun _menhir_stack _v ->
        let MenhirCell1_start (_menhir_stack, _, h) = _menhir_stack in
        let MenhirCell1_list_NEWLINE_ (_menhir_stack, _, _) = _menhir_stack in
        let l = _v in
        let _v = _menhir_action_07 h l in
        MenhirBox_file _v
    
    let rec _menhir_goto_cnf : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _v _menhir_s ->
        match _menhir_s with
        | MenhirState09 ->
            _menhir_run_21 _menhir_stack _v
        | MenhirState17 ->
            _menhir_run_18 _menhir_stack _v
        | MenhirState10 ->
            _menhir_run_16 _menhir_stack _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_18 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_clause -> _ -> _menhir_box_file =
      fun _menhir_stack _v ->
        let MenhirCell1_clause (_menhir_stack, _menhir_s, c) = _menhir_stack in
        let l = _v in
        let _v = _menhir_action_06 c l in
        _menhir_goto_cnf _menhir_stack _v _menhir_s
    
    and _menhir_run_16 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_NEWLINE -> _ -> _menhir_box_file =
      fun _menhir_stack _v ->
        let MenhirCell1_NEWLINE (_menhir_stack, _menhir_s, _) = _menhir_stack in
        let l = _v in
        let _v = _menhir_action_05 l in
        _menhir_goto_cnf _menhir_stack _v _menhir_s
    
    let _menhir_run_12 : type  ttv_stack. ttv_stack -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_s ->
        let _v = _menhir_action_04 () in
        _menhir_goto_cnf _menhir_stack _v _menhir_s
    
    let rec _menhir_run_11 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_i_, _startpos_i_, i) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_02 _endpos_i_ _startpos_i_ i in
        let _startpos = _startpos_i_ in
        match (_tok : MenhirBasics.token) with
        | Tokens.INT _v_0 ->
            let _menhir_stack = MenhirCell1_atom (_menhir_stack, _menhir_s, _v, _startpos) in
            _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState19
        | Tokens.ZERO ->
            let (_startpos_x_, x) = (_startpos, _v) in
            let _v = _menhir_action_13 x in
            _menhir_goto_nonempty_list_atom_ _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_x_ _v _menhir_s
        | _ ->
            _eRR 19
    
    and _menhir_goto_nonempty_list_atom_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s ->
        match _menhir_s with
        | MenhirState24 ->
            _menhir_run_32 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s
        | MenhirState19 ->
            _menhir_run_20 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState09 ->
            _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s
        | MenhirState17 ->
            _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s
        | MenhirState10 ->
            _menhir_run_13 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_32 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.NEWLINE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let (_endpos__3_, _startpos_c_, c) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_03 _endpos__3_ _startpos_c_ c in
            _menhir_goto_clause _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 33
    
    and _menhir_goto_clause : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState24 ->
            _menhir_run_35 _menhir_stack _v
        | MenhirState09 ->
            _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState17 ->
            _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState10 ->
            _menhir_run_17 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_17 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_clause (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.NEWLINE ->
            _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState17
        | Tokens.INT _v_0 ->
            _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState17
        | Tokens.EOF ->
            _menhir_run_12 _menhir_stack MenhirState17
        | _ ->
            _eRR 17
    
    and _menhir_run_10 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell1_NEWLINE (_menhir_stack, _menhir_s, _endpos) in
        let _menhir_s = MenhirState10 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.NEWLINE ->
            _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INT _v ->
            _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.EOF ->
            _menhir_run_12 _menhir_stack _menhir_s
        | _ ->
            _eRR 10
    
    and _menhir_run_20 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_atom -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_atom (_menhir_stack, _menhir_s, x, _startpos_x_) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_14 x xs in
        _menhir_goto_nonempty_list_atom_ _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_x_ _v _menhir_s
    
    and _menhir_run_13 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.NEWLINE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let (_endpos__3_, _startpos_c_, c) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_03 _endpos__3_ _startpos_c_ c in
            _menhir_goto_clause _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 14
    
    let _menhir_run_24 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.P ->
            let _menhir_stack = MenhirCell1_list_NEWLINE_ (_menhir_stack, _menhir_s, _v) in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.CNF ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.INT _v_0 ->
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.INT _v_2 ->
                        let _tok = _menhir_lexer _menhir_lexbuf in
                        (match (_tok : MenhirBasics.token) with
                        | Tokens.NEWLINE ->
                            let _endpos_5 = _menhir_lexbuf.Lexing.lex_curr_p in
                            let _v_6 =
                              let (_startpos__1_, _endpos__5_, nbclause, nbvar) = (_startpos, _endpos_5, _v_2, _v_0) in
                              _menhir_action_15 _endpos__5_ _startpos__1_ nbclause nbvar
                            in
                            let _v = _v_6 in
                            let MenhirCell1_list_NEWLINE_ (_menhir_stack, _, _) = _menhir_stack in
                            let s = _v in
                            let _v = _menhir_action_09 s in
                            _menhir_goto_input _menhir_stack _v
                        | _ ->
                            _eRR 28)
                    | _ ->
                        _eRR 27)
                | _ ->
                    _eRR 26)
            | _ ->
                _eRR 25)
        | Tokens.INT _v_7 ->
            let _menhir_stack = MenhirCell1_list_NEWLINE_ (_menhir_stack, _menhir_s, _v) in
            _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v_7 MenhirState24
        | Tokens.EOF ->
            let _v = _menhir_action_08 () in
            _menhir_goto_input _menhir_stack _v
        | _ ->
            _menhir_fail ()
    
    let _menhir_run_03 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_list_NEWLINE_ (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.P ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.CNF ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.INT _v_0 ->
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.INT _v_2 ->
                        let _tok = _menhir_lexer _menhir_lexbuf in
                        (match (_tok : MenhirBasics.token) with
                        | Tokens.NEWLINE ->
                            let _endpos_5 = _menhir_lexbuf.Lexing.lex_curr_p in
                            let _tok = _menhir_lexer _menhir_lexbuf in
                            let _v_6 =
                              let (_startpos__1_, _endpos__5_, nbclause, nbvar) = (_startpos, _endpos_5, _v_2, _v_0) in
                              _menhir_action_15 _endpos__5_ _startpos__1_ nbclause nbvar
                            in
                            let (_v, _menhir_s) = (_v_6, MenhirState03) in
                            let _menhir_stack = MenhirCell1_start (_menhir_stack, _menhir_s, _v) in
                            (match (_tok : MenhirBasics.token) with
                            | Tokens.NEWLINE ->
                                _menhir_run_10 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState09
                            | Tokens.INT _v_0 ->
                                _menhir_run_11 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState09
                            | Tokens.EOF ->
                                _menhir_run_12 _menhir_stack MenhirState09
                            | _ ->
                                _eRR 9)
                        | _ ->
                            _eRR 7)
                    | _ ->
                        _eRR 6)
                | _ ->
                    _eRR 5)
            | _ ->
                _eRR 4)
        | _ ->
            _eRR 3
    
    let rec _menhir_run_02 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_NEWLINE -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let MenhirCell1_NEWLINE (_menhir_stack, _menhir_s, _) = _menhir_stack in
        let (xs, x) = (_v, ()) in
        let _v = _menhir_action_12 x xs in
        _menhir_goto_list_NEWLINE_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_list_NEWLINE_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState23 ->
            _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState00 ->
            _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState01 ->
            _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _menhir_fail ()
    
    let rec _menhir_run_01 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell1_NEWLINE (_menhir_stack, _menhir_s, _endpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.NEWLINE ->
            _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState01
        | Tokens.EOF | Tokens.INT _ | Tokens.P ->
            let _v = _menhir_action_11 () in
            _menhir_run_02 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
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
            _menhir_run_03 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState00 _tok
        | _ ->
            _eRR 0
    
    let _menhir_run_23 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.NEWLINE ->
            _menhir_run_01 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState23
        | Tokens.EOF | Tokens.INT _ | Tokens.P ->
            let _v = _menhir_action_11 () in
            _menhir_run_24 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState23 _tok
        | _ ->
            _eRR 23
    
  end
  
  let input =
    fun _menhir_lexer _menhir_lexbuf ->
      let _menhir_stack = () in
      let MenhirBox_input v = _menhir_run_23 _menhir_stack _menhir_lexbuf _menhir_lexer in
      v
  
  let file =
    fun _menhir_lexer _menhir_lexbuf ->
      let _menhir_stack = () in
      let MenhirBox_file v = _menhir_run_00 _menhir_stack _menhir_lexbuf _menhir_lexer in
      v
  
end
