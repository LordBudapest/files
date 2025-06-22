
module Make

# 4 "src/languages/smtlib2/v2.6/script/parser.mly"
           (L : Dolmen_intf.Location.S)
# 7 "src/languages/smtlib2/v2.6/script/parser.ml"


# 5 "src/languages/smtlib2/v2.6/script/parser.mly"
           (I : Ast.Id)
# 12 "src/languages/smtlib2/v2.6/script/parser.ml"


# 6 "src/languages/smtlib2/v2.6/script/parser.mly"
           (T : Ast.Term with type location := L.t and type id := I.t)
# 17 "src/languages/smtlib2/v2.6/script/parser.ml"


# 7 "src/languages/smtlib2/v2.6/script/parser.mly"
           (S : Ast.Statement with type location := L.t and type id := I.t and type term := T.t)
# 22 "src/languages/smtlib2/v2.6/script/parser.ml"


# 8 "src/languages/smtlib2/v2.6/script/parser.mly"
           (E : Ast.Extension with type location := L.t and type term := T.t and type statement := S.t)
# 27 "src/languages/smtlib2/v2.6/script/parser.ml"

= struct
  
  module MenhirBasics = struct
    
    exception Error of int
    
    let _eRR =
      fun _s ->
        raise (Error _s)
    
    type token = Tokens.token
    
  end
  
  include MenhirBasics
  
# 15 "src/languages/smtlib2/v2.6/script/parser.mly"
  

  let pp_num_list fmt (l, singular, plural) =
    let n = List.length l in
    Format.fprintf fmt "%d %s" n (if n = 1 then singular else plural)

  let mismatched_lists ~loc l1 l2 =
    let msg = Format.dprintf
      "@[<v>@[<hov>Expected@ two@ lists@ of@ the@ same@ size,@ but@ got:@]@ \
        - @[<hov>%a@]@ - @[<hov>%a@]@]"
      pp_num_list l1 pp_num_list l2
    in
    raise (L.Syntax_error (loc, `Regular msg))


# 61 "src/languages/smtlib2/v2.6/script/parser.ml"
  
  type ('s, 'r) _menhir_state = 
    | MenhirState000 : ('s, _menhir_box_file) _menhir_state
      (** State 000.
        Stack shape : .
        Start symbol: file. *)

    | MenhirState001 : (('s, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_state
      (** State 001.
        Stack shape : OPEN.
        Start symbol: file. *)

    | MenhirState003 : ((('s, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_SET_OPTION, _menhir_box_file) _menhir_state
      (** State 003.
        Stack shape : OPEN SET_OPTION.
        Start symbol: file. *)

    | MenhirState004 : (('s, 'r) _menhir_cell1_KEYWORD, 'r) _menhir_state
      (** State 004.
        Stack shape : KEYWORD.
        Start symbol: <undetermined>. *)

    | MenhirState007 : ((('s, 'r) _menhir_cell1_KEYWORD, 'r) _menhir_cell1_OPEN, 'r) _menhir_state
      (** State 007.
        Stack shape : KEYWORD OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState018 : (('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_state
      (** State 018.
        Stack shape : OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState054 : (('s, 'r) _menhir_cell1_s_expr, 'r) _menhir_state
      (** State 054.
        Stack shape : s_expr.
        Start symbol: <undetermined>. *)

    | MenhirState070 : ((('s, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_SET_INFO, _menhir_box_file) _menhir_state
      (** State 070.
        Stack shape : OPEN SET_INFO.
        Start symbol: file. *)

    | MenhirState084 : ((('s, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_GET_VALUE _menhir_cell0_OPEN, _menhir_box_file) _menhir_state
      (** State 084.
        Stack shape : OPEN GET_VALUE OPEN.
        Start symbol: file. *)

    | MenhirState086 : (('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_state
      (** State 086.
        Stack shape : OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState088 : ((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_UNDERSCORE _menhir_cell0_SYMBOL, 'r) _menhir_state
      (** State 088.
        Stack shape : OPEN UNDERSCORE SYMBOL.
        Start symbol: <undetermined>. *)

    | MenhirState094 : (('s, 'r) _menhir_cell1_index, 'r) _menhir_state
      (** State 094.
        Stack shape : index.
        Start symbol: <undetermined>. *)

    | MenhirState096 : ((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_OPEN, 'r) _menhir_state
      (** State 096.
        Stack shape : OPEN OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState097 : ((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_AS, 'r) _menhir_state
      (** State 097.
        Stack shape : OPEN AS.
        Start symbol: <undetermined>. *)

    | MenhirState098 : (('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_state
      (** State 098.
        Stack shape : OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState099 : (((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_AS, 'r) _menhir_cell1_identifier, 'r) _menhir_state
      (** State 099.
        Stack shape : OPEN AS identifier.
        Start symbol: <undetermined>. *)

    | MenhirState100 : (('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_state
      (** State 100.
        Stack shape : OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState101 : ((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_identifier, 'r) _menhir_state
      (** State 101.
        Stack shape : OPEN identifier.
        Start symbol: <undetermined>. *)

    | MenhirState102 : (('s, 'r) _menhir_cell1_sort, 'r) _menhir_state
      (** State 102.
        Stack shape : sort.
        Start symbol: <undetermined>. *)

    | MenhirState109 : ((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_MATCH, 'r) _menhir_state
      (** State 109.
        Stack shape : OPEN MATCH.
        Start symbol: <undetermined>. *)

    | MenhirState111 : (((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_MATCH, 'r) _menhir_cell1_term _menhir_cell0_OPEN, 'r) _menhir_state
      (** State 111.
        Stack shape : OPEN MATCH term OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState112 : (('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_state
      (** State 112.
        Stack shape : OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState114 : ((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_OPEN, 'r) _menhir_state
      (** State 114.
        Stack shape : OPEN OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState115 : (((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_pattern_symbol, 'r) _menhir_state
      (** State 115.
        Stack shape : OPEN OPEN pattern_symbol.
        Start symbol: <undetermined>. *)

    | MenhirState116 : ((('s, 'r) _menhir_cell1_pattern_symbol, 'r) _menhir_cell1_pattern_symbol, 'r) _menhir_state
      (** State 116.
        Stack shape : pattern_symbol pattern_symbol.
        Start symbol: <undetermined>. *)

    | MenhirState121 : ((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_pattern, 'r) _menhir_state
      (** State 121.
        Stack shape : OPEN pattern.
        Start symbol: <undetermined>. *)

    | MenhirState130 : (('s, 'r) _menhir_cell1_match_case, 'r) _menhir_state
      (** State 130.
        Stack shape : match_case.
        Start symbol: <undetermined>. *)

    | MenhirState133 : ((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_LET _menhir_cell0_OPEN, 'r) _menhir_state
      (** State 133.
        Stack shape : OPEN LET OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState135 : (('s, 'r) _menhir_cell1_OPEN _menhir_cell0_SYMBOL, 'r) _menhir_state
      (** State 135.
        Stack shape : OPEN SYMBOL.
        Start symbol: <undetermined>. *)

    | MenhirState138 : (('s, 'r) _menhir_cell1_var_binding, 'r) _menhir_state
      (** State 138.
        Stack shape : var_binding.
        Start symbol: <undetermined>. *)

    | MenhirState141 : (((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_LET _menhir_cell0_OPEN, 'r) _menhir_cell1_nonempty_list_var_binding_ _menhir_cell0_CLOSE, 'r) _menhir_state
      (** State 141.
        Stack shape : OPEN LET OPEN nonempty_list(var_binding) CLOSE.
        Start symbol: <undetermined>. *)

    | MenhirState145 : ((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_FORALL _menhir_cell0_OPEN, 'r) _menhir_state
      (** State 145.
        Stack shape : OPEN FORALL OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState147 : (('s, 'r) _menhir_cell1_OPEN _menhir_cell0_SYMBOL, 'r) _menhir_state
      (** State 147.
        Stack shape : OPEN SYMBOL.
        Start symbol: <undetermined>. *)

    | MenhirState150 : (('s, 'r) _menhir_cell1_sorted_var, 'r) _menhir_state
      (** State 150.
        Stack shape : sorted_var.
        Start symbol: <undetermined>. *)

    | MenhirState153 : (((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_FORALL _menhir_cell0_OPEN, 'r) _menhir_cell1_nonempty_list_sorted_var_ _menhir_cell0_CLOSE, 'r) _menhir_state
      (** State 153.
        Stack shape : OPEN FORALL OPEN nonempty_list(sorted_var) CLOSE.
        Start symbol: <undetermined>. *)

    | MenhirState157 : ((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_EXISTS _menhir_cell0_OPEN, 'r) _menhir_state
      (** State 157.
        Stack shape : OPEN EXISTS OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState159 : (((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_EXISTS _menhir_cell0_OPEN, 'r) _menhir_cell1_nonempty_list_sorted_var_ _menhir_cell0_CLOSE, 'r) _menhir_state
      (** State 159.
        Stack shape : OPEN EXISTS OPEN nonempty_list(sorted_var) CLOSE.
        Start symbol: <undetermined>. *)

    | MenhirState162 : ((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_ATTRIBUTE, 'r) _menhir_state
      (** State 162.
        Stack shape : OPEN ATTRIBUTE.
        Start symbol: <undetermined>. *)

    | MenhirState163 : (((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_ATTRIBUTE, 'r) _menhir_cell1_term, 'r) _menhir_state
      (** State 163.
        Stack shape : OPEN ATTRIBUTE term.
        Start symbol: <undetermined>. *)

    | MenhirState166 : (('s, 'r) _menhir_cell1_attribute, 'r) _menhir_state
      (** State 166.
        Stack shape : attribute.
        Start symbol: <undetermined>. *)

    | MenhirState168 : ((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_qual_identifier, 'r) _menhir_state
      (** State 168.
        Stack shape : OPEN qual_identifier.
        Start symbol: <undetermined>. *)

    | MenhirState169 : (('s, 'r) _menhir_cell1_term, 'r) _menhir_state
      (** State 169.
        Stack shape : term.
        Start symbol: <undetermined>. *)

    | MenhirState187 : ((('s, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_GET_INFO, _menhir_box_file) _menhir_state
      (** State 187.
        Stack shape : OPEN GET_INFO.
        Start symbol: file. *)

    | MenhirState202 : ((('s, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DEFINE_SORT _menhir_cell0_SYMBOL _menhir_cell0_OPEN, _menhir_box_file) _menhir_state
      (** State 202.
        Stack shape : OPEN DEFINE_SORT SYMBOL OPEN.
        Start symbol: file. *)

    | MenhirState203 : (('s, 'r) _menhir_cell1_SYMBOL, 'r) _menhir_state
      (** State 203.
        Stack shape : SYMBOL.
        Start symbol: <undetermined>. *)

    | MenhirState206 : (((('s, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DEFINE_SORT _menhir_cell0_SYMBOL _menhir_cell0_OPEN, _menhir_box_file) _menhir_cell1_list_SYMBOL_ _menhir_cell0_CLOSE, _menhir_box_file) _menhir_state
      (** State 206.
        Stack shape : OPEN DEFINE_SORT SYMBOL OPEN list(SYMBOL) CLOSE.
        Start symbol: file. *)

    | MenhirState209 : ((('s, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DEFINE_FUN_REC, _menhir_box_file) _menhir_state
      (** State 209.
        Stack shape : OPEN DEFINE_FUN_REC.
        Start symbol: file. *)

    | MenhirState211 : (('s, 'r) _menhir_cell1_SYMBOL _menhir_cell0_OPEN, 'r) _menhir_state
      (** State 211.
        Stack shape : SYMBOL OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState212 : (('s, 'r) _menhir_cell1_sorted_var, 'r) _menhir_state
      (** State 212.
        Stack shape : sorted_var.
        Start symbol: <undetermined>. *)

    | MenhirState215 : ((('s, 'r) _menhir_cell1_SYMBOL _menhir_cell0_OPEN, 'r) _menhir_cell1_list_sorted_var_ _menhir_cell0_CLOSE, 'r) _menhir_state
      (** State 215.
        Stack shape : SYMBOL OPEN list(sorted_var) CLOSE.
        Start symbol: <undetermined>. *)

    | MenhirState216 : (((('s, 'r) _menhir_cell1_SYMBOL _menhir_cell0_OPEN, 'r) _menhir_cell1_list_sorted_var_ _menhir_cell0_CLOSE, 'r) _menhir_cell1_sort, 'r) _menhir_state
      (** State 216.
        Stack shape : SYMBOL OPEN list(sorted_var) CLOSE sort.
        Start symbol: <undetermined>. *)

    | MenhirState221 : ((('s, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DEFINE_FUNS_REC _menhir_cell0_OPEN, _menhir_box_file) _menhir_state
      (** State 221.
        Stack shape : OPEN DEFINE_FUNS_REC OPEN.
        Start symbol: file. *)

    | MenhirState224 : (('s, 'r) _menhir_cell1_OPEN _menhir_cell0_SYMBOL _menhir_cell0_OPEN, 'r) _menhir_state
      (** State 224.
        Stack shape : OPEN SYMBOL OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState226 : ((('s, 'r) _menhir_cell1_OPEN _menhir_cell0_SYMBOL _menhir_cell0_OPEN, 'r) _menhir_cell1_list_sorted_var_ _menhir_cell0_CLOSE, 'r) _menhir_state
      (** State 226.
        Stack shape : OPEN SYMBOL OPEN list(sorted_var) CLOSE.
        Start symbol: <undetermined>. *)

    | MenhirState231 : (((('s, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DEFINE_FUNS_REC _menhir_cell0_OPEN, _menhir_box_file) _menhir_cell1_nonempty_list_function_dec_ _menhir_cell0_CLOSE _menhir_cell0_OPEN, _menhir_box_file) _menhir_state
      (** State 231.
        Stack shape : OPEN DEFINE_FUNS_REC OPEN nonempty_list(function_dec) CLOSE OPEN.
        Start symbol: file. *)

    | MenhirState235 : (('s, 'r) _menhir_cell1_function_dec, 'r) _menhir_state
      (** State 235.
        Stack shape : function_dec.
        Start symbol: <undetermined>. *)

    | MenhirState237 : ((('s, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DEFINE_FUN, _menhir_box_file) _menhir_state
      (** State 237.
        Stack shape : OPEN DEFINE_FUN.
        Start symbol: file. *)

    | MenhirState246 : ((('s, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DECLARE_FUN _menhir_cell0_SYMBOL _menhir_cell0_OPEN, _menhir_box_file) _menhir_state
      (** State 246.
        Stack shape : OPEN DECLARE_FUN SYMBOL OPEN.
        Start symbol: file. *)

    | MenhirState247 : (('s, 'r) _menhir_cell1_sort, 'r) _menhir_state
      (** State 247.
        Stack shape : sort.
        Start symbol: <undetermined>. *)

    | MenhirState250 : (((('s, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DECLARE_FUN _menhir_cell0_SYMBOL _menhir_cell0_OPEN, _menhir_box_file) _menhir_cell1_list_sort_ _menhir_cell0_CLOSE, _menhir_box_file) _menhir_state
      (** State 250.
        Stack shape : OPEN DECLARE_FUN SYMBOL OPEN list(sort) CLOSE.
        Start symbol: file. *)

    | MenhirState254 : ((('s, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DECLARE_DATATYPES _menhir_cell0_OPEN, _menhir_box_file) _menhir_state
      (** State 254.
        Stack shape : OPEN DECLARE_DATATYPES OPEN.
        Start symbol: file. *)

    | MenhirState259 : (('s, 'r) _menhir_cell1_sort_dec, 'r) _menhir_state
      (** State 259.
        Stack shape : sort_dec.
        Start symbol: <undetermined>. *)

    | MenhirState263 : (((('s, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DECLARE_DATATYPES _menhir_cell0_OPEN, _menhir_box_file) _menhir_cell1_nonempty_list_sort_dec_ _menhir_cell0_CLOSE _menhir_cell0_OPEN, _menhir_box_file) _menhir_state
      (** State 263.
        Stack shape : OPEN DECLARE_DATATYPES OPEN nonempty_list(sort_dec) CLOSE OPEN.
        Start symbol: file. *)

    | MenhirState264 : (('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_state
      (** State 264.
        Stack shape : OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState266 : ((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_PAR _menhir_cell0_OPEN, 'r) _menhir_state
      (** State 266.
        Stack shape : OPEN PAR OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState270 : (((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_PAR _menhir_cell0_OPEN, 'r) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE _menhir_cell0_OPEN, 'r) _menhir_state
      (** State 270.
        Stack shape : OPEN PAR OPEN nonempty_list(datatype_symbol) CLOSE OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState272 : (('s, 'r) _menhir_cell1_OPEN _menhir_cell0_SYMBOL, 'r) _menhir_state
      (** State 272.
        Stack shape : OPEN SYMBOL.
        Start symbol: <undetermined>. *)

    | MenhirState274 : (('s, 'r) _menhir_cell1_OPEN _menhir_cell0_SYMBOL, 'r) _menhir_state
      (** State 274.
        Stack shape : OPEN SYMBOL.
        Start symbol: <undetermined>. *)

    | MenhirState277 : (('s, 'r) _menhir_cell1_selector_dec, 'r) _menhir_state
      (** State 277.
        Stack shape : selector_dec.
        Start symbol: <undetermined>. *)

    | MenhirState284 : (('s, 'r) _menhir_cell1_constructor_dec, 'r) _menhir_state
      (** State 284.
        Stack shape : constructor_dec.
        Start symbol: <undetermined>. *)

    | MenhirState286 : (('s, 'r) _menhir_cell1_datatype_symbol, 'r) _menhir_state
      (** State 286.
        Stack shape : datatype_symbol.
        Start symbol: <undetermined>. *)

    | MenhirState293 : (('s, 'r) _menhir_cell1_datatype_dec, 'r) _menhir_state
      (** State 293.
        Stack shape : datatype_dec.
        Start symbol: <undetermined>. *)

    | MenhirState296 : ((('s, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DECLARE_DATATYPE _menhir_cell0_SYMBOL, _menhir_box_file) _menhir_state
      (** State 296.
        Stack shape : OPEN DECLARE_DATATYPE SYMBOL.
        Start symbol: file. *)

    | MenhirState300 : ((('s, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DECLARE_CONST _menhir_cell0_SYMBOL, _menhir_box_file) _menhir_state
      (** State 300.
        Stack shape : OPEN DECLARE_CONST SYMBOL.
        Start symbol: file. *)

    | MenhirState304 : ((('s, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_CHECK_SAT_ASSUMING _menhir_cell0_OPEN, _menhir_box_file) _menhir_state
      (** State 304.
        Stack shape : OPEN CHECK_SAT_ASSUMING OPEN.
        Start symbol: file. *)

    | MenhirState307 : (('s, 'r) _menhir_cell1_OPEN _menhir_cell0_not_symbol, 'r) _menhir_state
      (** State 307.
        Stack shape : OPEN not_symbol.
        Start symbol: <undetermined>. *)

    | MenhirState312 : (('s, 'r) _menhir_cell1_prop_literal, 'r) _menhir_state
      (** State 312.
        Stack shape : prop_literal.
        Start symbol: <undetermined>. *)

    | MenhirState319 : ((('s, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_ASSERT, _menhir_box_file) _menhir_state
      (** State 319.
        Stack shape : OPEN ASSERT.
        Start symbol: file. *)

    | MenhirState322 : ((('s, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_extension_statement, _menhir_box_file) _menhir_state
      (** State 322.
        Stack shape : OPEN extension_statement.
        Start symbol: file. *)

    | MenhirState328 : (('s, _menhir_box_file) _menhir_cell1_command, _menhir_box_file) _menhir_state
      (** State 328.
        Stack shape : command.
        Start symbol: file. *)

    | MenhirState330 : ('s, _menhir_box_input) _menhir_state
      (** State 330.
        Stack shape : .
        Start symbol: input. *)

    | MenhirState331 : (('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_state
      (** State 331.
        Stack shape : OPEN.
        Start symbol: input. *)

    | MenhirState332 : ((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_SET_OPTION, _menhir_box_input) _menhir_state
      (** State 332.
        Stack shape : OPEN SET_OPTION.
        Start symbol: input. *)

    | MenhirState338 : ((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_SET_INFO, _menhir_box_input) _menhir_state
      (** State 338.
        Stack shape : OPEN SET_INFO.
        Start symbol: input. *)

    | MenhirState352 : ((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_GET_VALUE _menhir_cell0_OPEN, _menhir_box_input) _menhir_state
      (** State 352.
        Stack shape : OPEN GET_VALUE OPEN.
        Start symbol: input. *)

    | MenhirState367 : ((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_GET_INFO, _menhir_box_input) _menhir_state
      (** State 367.
        Stack shape : OPEN GET_INFO.
        Start symbol: input. *)

    | MenhirState381 : ((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DEFINE_SORT _menhir_cell0_SYMBOL _menhir_cell0_OPEN, _menhir_box_input) _menhir_state
      (** State 381.
        Stack shape : OPEN DEFINE_SORT SYMBOL OPEN.
        Start symbol: input. *)

    | MenhirState383 : (((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DEFINE_SORT _menhir_cell0_SYMBOL _menhir_cell0_OPEN, _menhir_box_input) _menhir_cell1_list_SYMBOL_ _menhir_cell0_CLOSE, _menhir_box_input) _menhir_state
      (** State 383.
        Stack shape : OPEN DEFINE_SORT SYMBOL OPEN list(SYMBOL) CLOSE.
        Start symbol: input. *)

    | MenhirState386 : ((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DEFINE_FUN_REC, _menhir_box_input) _menhir_state
      (** State 386.
        Stack shape : OPEN DEFINE_FUN_REC.
        Start symbol: input. *)

    | MenhirState390 : ((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DEFINE_FUNS_REC _menhir_cell0_OPEN, _menhir_box_input) _menhir_state
      (** State 390.
        Stack shape : OPEN DEFINE_FUNS_REC OPEN.
        Start symbol: input. *)

    | MenhirState393 : (((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DEFINE_FUNS_REC _menhir_cell0_OPEN, _menhir_box_input) _menhir_cell1_nonempty_list_function_dec_ _menhir_cell0_CLOSE _menhir_cell0_OPEN, _menhir_box_input) _menhir_state
      (** State 393.
        Stack shape : OPEN DEFINE_FUNS_REC OPEN nonempty_list(function_dec) CLOSE OPEN.
        Start symbol: input. *)

    | MenhirState397 : ((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DEFINE_FUN, _menhir_box_input) _menhir_state
      (** State 397.
        Stack shape : OPEN DEFINE_FUN.
        Start symbol: input. *)

    | MenhirState406 : ((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DECLARE_FUN _menhir_cell0_SYMBOL _menhir_cell0_OPEN, _menhir_box_input) _menhir_state
      (** State 406.
        Stack shape : OPEN DECLARE_FUN SYMBOL OPEN.
        Start symbol: input. *)

    | MenhirState408 : (((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DECLARE_FUN _menhir_cell0_SYMBOL _menhir_cell0_OPEN, _menhir_box_input) _menhir_cell1_list_sort_ _menhir_cell0_CLOSE, _menhir_box_input) _menhir_state
      (** State 408.
        Stack shape : OPEN DECLARE_FUN SYMBOL OPEN list(sort) CLOSE.
        Start symbol: input. *)

    | MenhirState412 : ((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DECLARE_DATATYPES _menhir_cell0_OPEN, _menhir_box_input) _menhir_state
      (** State 412.
        Stack shape : OPEN DECLARE_DATATYPES OPEN.
        Start symbol: input. *)

    | MenhirState415 : (((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DECLARE_DATATYPES _menhir_cell0_OPEN, _menhir_box_input) _menhir_cell1_nonempty_list_sort_dec_ _menhir_cell0_CLOSE _menhir_cell0_OPEN, _menhir_box_input) _menhir_state
      (** State 415.
        Stack shape : OPEN DECLARE_DATATYPES OPEN nonempty_list(sort_dec) CLOSE OPEN.
        Start symbol: input. *)

    | MenhirState420 : ((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DECLARE_DATATYPE _menhir_cell0_SYMBOL, _menhir_box_input) _menhir_state
      (** State 420.
        Stack shape : OPEN DECLARE_DATATYPE SYMBOL.
        Start symbol: input. *)

    | MenhirState424 : ((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DECLARE_CONST _menhir_cell0_SYMBOL, _menhir_box_input) _menhir_state
      (** State 424.
        Stack shape : OPEN DECLARE_CONST SYMBOL.
        Start symbol: input. *)

    | MenhirState428 : ((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_CHECK_SAT_ASSUMING _menhir_cell0_OPEN, _menhir_box_input) _menhir_state
      (** State 428.
        Stack shape : OPEN CHECK_SAT_ASSUMING OPEN.
        Start symbol: input. *)

    | MenhirState434 : ((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_ASSERT, _menhir_box_input) _menhir_state
      (** State 434.
        Stack shape : OPEN ASSERT.
        Start symbol: input. *)

    | MenhirState437 : ((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_extension_statement, _menhir_box_input) _menhir_state
      (** State 437.
        Stack shape : OPEN extension_statement.
        Start symbol: input. *)

    | MenhirState443 : ('s, _menhir_box_term) _menhir_state
      (** State 443.
        Stack shape : .
        Start symbol: term. *)

    | MenhirState446 : (('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_state
      (** State 446.
        Stack shape : OPEN.
        Start symbol: term. *)

    | MenhirState448 : ((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_UNDERSCORE _menhir_cell0_SYMBOL, _menhir_box_term) _menhir_state
      (** State 448.
        Stack shape : OPEN UNDERSCORE SYMBOL.
        Start symbol: term. *)

    | MenhirState451 : ((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_MATCH, _menhir_box_term) _menhir_state
      (** State 451.
        Stack shape : OPEN MATCH.
        Start symbol: term. *)

    | MenhirState453 : (((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_MATCH, _menhir_box_term) _menhir_cell1_term _menhir_cell0_OPEN, _menhir_box_term) _menhir_state
      (** State 453.
        Stack shape : OPEN MATCH term OPEN.
        Start symbol: term. *)

    | MenhirState458 : ((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_LET _menhir_cell0_OPEN, _menhir_box_term) _menhir_state
      (** State 458.
        Stack shape : OPEN LET OPEN.
        Start symbol: term. *)

    | MenhirState460 : (((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_LET _menhir_cell0_OPEN, _menhir_box_term) _menhir_cell1_nonempty_list_var_binding_ _menhir_cell0_CLOSE, _menhir_box_term) _menhir_state
      (** State 460.
        Stack shape : OPEN LET OPEN nonempty_list(var_binding) CLOSE.
        Start symbol: term. *)

    | MenhirState464 : ((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_FORALL _menhir_cell0_OPEN, _menhir_box_term) _menhir_state
      (** State 464.
        Stack shape : OPEN FORALL OPEN.
        Start symbol: term. *)

    | MenhirState466 : (((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_FORALL _menhir_cell0_OPEN, _menhir_box_term) _menhir_cell1_nonempty_list_sorted_var_ _menhir_cell0_CLOSE, _menhir_box_term) _menhir_state
      (** State 466.
        Stack shape : OPEN FORALL OPEN nonempty_list(sorted_var) CLOSE.
        Start symbol: term. *)

    | MenhirState470 : ((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_EXISTS _menhir_cell0_OPEN, _menhir_box_term) _menhir_state
      (** State 470.
        Stack shape : OPEN EXISTS OPEN.
        Start symbol: term. *)

    | MenhirState472 : (((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_EXISTS _menhir_cell0_OPEN, _menhir_box_term) _menhir_cell1_nonempty_list_sorted_var_ _menhir_cell0_CLOSE, _menhir_box_term) _menhir_state
      (** State 472.
        Stack shape : OPEN EXISTS OPEN nonempty_list(sorted_var) CLOSE.
        Start symbol: term. *)

    | MenhirState475 : ((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_ATTRIBUTE, _menhir_box_term) _menhir_state
      (** State 475.
        Stack shape : OPEN ATTRIBUTE.
        Start symbol: term. *)

    | MenhirState476 : (((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_ATTRIBUTE, _menhir_box_term) _menhir_cell1_term, _menhir_box_term) _menhir_state
      (** State 476.
        Stack shape : OPEN ATTRIBUTE term.
        Start symbol: term. *)

    | MenhirState479 : ((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_AS, _menhir_box_term) _menhir_state
      (** State 479.
        Stack shape : OPEN AS.
        Start symbol: term. *)

    | MenhirState480 : (((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_AS, _menhir_box_term) _menhir_cell1_identifier, _menhir_box_term) _menhir_state
      (** State 480.
        Stack shape : OPEN AS identifier.
        Start symbol: term. *)

    | MenhirState483 : ((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_qual_identifier, _menhir_box_term) _menhir_state
      (** State 483.
        Stack shape : OPEN qual_identifier.
        Start symbol: term. *)

  
  and ('s, 'r) _menhir_cell1_attribute = 
    | MenhirCell1_attribute of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_command = 
    | MenhirCell1_command of 's * ('s, 'r) _menhir_state * (S.t)
  
  and ('s, 'r) _menhir_cell1_constructor_dec = 
    | MenhirCell1_constructor_dec of 's * ('s, 'r) _menhir_state * (I.t * T.t list)
  
  and ('s, 'r) _menhir_cell1_datatype_dec = 
    | MenhirCell1_datatype_dec of 's * ('s, 'r) _menhir_state * (T.t list * (I.t * T.t list) list)
  
  and ('s, 'r) _menhir_cell1_datatype_symbol = 
    | MenhirCell1_datatype_symbol of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_extension_statement = 
    | MenhirCell1_extension_statement of 's * ('s, 'r) _menhir_state * (?loc:L.t -> T.t list -> S.t)
  
  and ('s, 'r) _menhir_cell1_function_dec = 
    | MenhirCell1_function_dec of 's * ('s, 'r) _menhir_state * (I.t * T.t list * T.t list * T.t)
  
  and ('s, 'r) _menhir_cell1_identifier = 
    | MenhirCell1_identifier of 's * ('s, 'r) _menhir_state * (I.namespace -> I.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_index = 
    | MenhirCell1_index of 's * ('s, 'r) _menhir_state * (string)
  
  and ('s, 'r) _menhir_cell1_list_SYMBOL_ = 
    | MenhirCell1_list_SYMBOL_ of 's * ('s, 'r) _menhir_state * (string list)
  
  and ('s, 'r) _menhir_cell1_list_sort_ = 
    | MenhirCell1_list_sort_ of 's * ('s, 'r) _menhir_state * (T.t list)
  
  and ('s, 'r) _menhir_cell1_list_sorted_var_ = 
    | MenhirCell1_list_sorted_var_ of 's * ('s, 'r) _menhir_state * (T.t list)
  
  and ('s, 'r) _menhir_cell1_match_case = 
    | MenhirCell1_match_case of 's * ('s, 'r) _menhir_state * (T.t * T.t)
  
  and ('s, 'r) _menhir_cell1_nonempty_list_datatype_symbol_ = 
    | MenhirCell1_nonempty_list_datatype_symbol_ of 's * ('s, 'r) _menhir_state * (T.t list)
  
  and ('s, 'r) _menhir_cell1_nonempty_list_function_dec_ = 
    | MenhirCell1_nonempty_list_function_dec_ of 's * ('s, 'r) _menhir_state * ((I.t * T.t list * T.t list * T.t) list)
  
  and ('s, 'r) _menhir_cell1_nonempty_list_sort_dec_ = 
    | MenhirCell1_nonempty_list_sort_dec_ of 's * ('s, 'r) _menhir_state * ((I.t * int) list)
  
  and ('s, 'r) _menhir_cell1_nonempty_list_sorted_var_ = 
    | MenhirCell1_nonempty_list_sorted_var_ of 's * ('s, 'r) _menhir_state * (T.t list)
  
  and ('s, 'r) _menhir_cell1_nonempty_list_var_binding_ = 
    | MenhirCell1_nonempty_list_var_binding_ of 's * ('s, 'r) _menhir_state * (T.t list)
  
  and 's _menhir_cell0_not_symbol = 
    | MenhirCell0_not_symbol of 's * (T.t)
  
  and ('s, 'r) _menhir_cell1_pattern = 
    | MenhirCell1_pattern of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_pattern_symbol = 
    | MenhirCell1_pattern_symbol of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_prop_literal = 
    | MenhirCell1_prop_literal of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_qual_identifier = 
    | MenhirCell1_qual_identifier of 's * ('s, 'r) _menhir_state * ([ `As of T.t * T.t * L.t | `NoAs of T.t ])
  
  and ('s, 'r) _menhir_cell1_s_expr = 
    | MenhirCell1_s_expr of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_selector_dec = 
    | MenhirCell1_selector_dec of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_sort = 
    | MenhirCell1_sort of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_sort_dec = 
    | MenhirCell1_sort_dec of 's * ('s, 'r) _menhir_state * (I.t * int)
  
  and ('s, 'r) _menhir_cell1_sorted_var = 
    | MenhirCell1_sorted_var of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_term = 
    | MenhirCell1_term of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_var_binding = 
    | MenhirCell1_var_binding of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_AS = 
    | MenhirCell1_AS of 's * ('s, 'r) _menhir_state * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_ASSERT = 
    | MenhirCell1_ASSERT of 's * ('s, 'r) _menhir_state * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_ATTRIBUTE = 
    | MenhirCell1_ATTRIBUTE of 's * ('s, 'r) _menhir_state * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_CHECK_SAT_ASSUMING = 
    | MenhirCell1_CHECK_SAT_ASSUMING of 's * ('s, 'r) _menhir_state * Lexing.position * Lexing.position
  
  and 's _menhir_cell0_CLOSE = 
    | MenhirCell0_CLOSE of 's * Lexing.position
  
  and ('s, 'r) _menhir_cell1_DECLARE_CONST = 
    | MenhirCell1_DECLARE_CONST of 's * ('s, 'r) _menhir_state * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_DECLARE_DATATYPE = 
    | MenhirCell1_DECLARE_DATATYPE of 's * ('s, 'r) _menhir_state * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_DECLARE_DATATYPES = 
    | MenhirCell1_DECLARE_DATATYPES of 's * ('s, 'r) _menhir_state * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_DECLARE_FUN = 
    | MenhirCell1_DECLARE_FUN of 's * ('s, 'r) _menhir_state * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_DEFINE_FUN = 
    | MenhirCell1_DEFINE_FUN of 's * ('s, 'r) _menhir_state * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_DEFINE_FUNS_REC = 
    | MenhirCell1_DEFINE_FUNS_REC of 's * ('s, 'r) _menhir_state * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_DEFINE_FUN_REC = 
    | MenhirCell1_DEFINE_FUN_REC of 's * ('s, 'r) _menhir_state * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_DEFINE_SORT = 
    | MenhirCell1_DEFINE_SORT of 's * ('s, 'r) _menhir_state * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_EXISTS = 
    | MenhirCell1_EXISTS of 's * ('s, 'r) _menhir_state * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_FORALL = 
    | MenhirCell1_FORALL of 's * ('s, 'r) _menhir_state * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_GET_INFO = 
    | MenhirCell1_GET_INFO of 's * ('s, 'r) _menhir_state * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_GET_VALUE = 
    | MenhirCell1_GET_VALUE of 's * ('s, 'r) _menhir_state * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_KEYWORD = 
    | MenhirCell1_KEYWORD of 's * ('s, 'r) _menhir_state * (
# 9 "src/languages/smtlib2/v2.6/script/tokens.mly"
       (string)
# 795 "src/languages/smtlib2/v2.6/script/parser.ml"
  ) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_LET = 
    | MenhirCell1_LET of 's * ('s, 'r) _menhir_state * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_MATCH = 
    | MenhirCell1_MATCH of 's * ('s, 'r) _menhir_state * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_OPEN = 
    | MenhirCell1_OPEN of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and 's _menhir_cell0_OPEN = 
    | MenhirCell0_OPEN of 's * Lexing.position
  
  and ('s, 'r) _menhir_cell1_PAR = 
    | MenhirCell1_PAR of 's * ('s, 'r) _menhir_state * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_SET_INFO = 
    | MenhirCell1_SET_INFO of 's * ('s, 'r) _menhir_state * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_SET_OPTION = 
    | MenhirCell1_SET_OPTION of 's * ('s, 'r) _menhir_state * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_SYMBOL = 
    | MenhirCell1_SYMBOL of 's * ('s, 'r) _menhir_state * (
# 9 "src/languages/smtlib2/v2.6/script/tokens.mly"
       (string)
# 823 "src/languages/smtlib2/v2.6/script/parser.ml"
  ) * Lexing.position * Lexing.position
  
  and 's _menhir_cell0_SYMBOL = 
    | MenhirCell0_SYMBOL of 's * (
# 9 "src/languages/smtlib2/v2.6/script/tokens.mly"
       (string)
# 830 "src/languages/smtlib2/v2.6/script/parser.ml"
  ) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_UNDERSCORE = 
    | MenhirCell1_UNDERSCORE of 's * ('s, 'r) _menhir_state * Lexing.position * Lexing.position
  
  and _menhir_box_term = 
    | MenhirBox_term of (T.t) [@@unboxed]
  
  and _menhir_box_input = 
    | MenhirBox_input of (S.t option) [@@unboxed]
  
  and _menhir_box_file = 
    | MenhirBox_file of (S.t list) [@@unboxed]
  
  let _menhir_action_003 =
    fun _endpos_a_ _endpos_s_ _startpos_s_ a s ->
      let _endpos = _endpos_a_ in
      let _startpos = _startpos_s_ in
      (
# 145 "src/languages/smtlib2/v2.6/script/parser.mly"
    (
      let t =
        let loc = L.mk_pos _startpos_s_ _endpos_s_ in
        T.const ~loc I.(mk attr s)
      in
      match a with
      | None -> t
      | Some t' ->
        let loc = L.mk_pos _startpos _endpos in
        T.apply ~loc t [t']
    )
# 862 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t))
  
  let _menhir_action_004 =
    fun v ->
      (
# 136 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( v )
# 870 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t))
  
  let _menhir_action_005 =
    fun _endpos_v_ _startpos_v_ v ->
      let _endpos = _endpos_v_ in
      let _startpos = _startpos_v_ in
      (
# 138 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.const ~loc I.(mk attr v) )
# 880 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t))
  
  let _menhir_action_006 =
    fun _endpos__3_ _startpos__1_ l ->
      let _endpos = _endpos__3_ in
      let _startpos = _startpos__1_ in
      (
# 140 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.sexpr ~loc l )
# 890 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t))
  
  let _menhir_action_007 =
    fun _endpos__4_ _startpos__1_ t ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 360 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.assert_ ~loc t )
# 900 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (S.t))
  
  let _menhir_action_008 =
    fun _endpos__3_ _startpos__1_ ->
      let _endpos = _endpos__3_ in
      let _startpos = _startpos__1_ in
      (
# 362 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.check_sat ~loc [] )
# 910 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (S.t))
  
  let _menhir_action_009 =
    fun _endpos__6_ _startpos__1_ l ->
      let _endpos = _endpos__6_ in
      let _startpos = _startpos__1_ in
      (
# 364 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.check_sat ~loc l )
# 920 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (S.t))
  
  let _menhir_action_010 =
    fun _endpos__5_ _startpos__1_ s ty ->
      let _endpos = _endpos__5_ in
      let _startpos = _startpos__1_ in
      (
# 366 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.fun_decl ~loc I.(mk term s) [] [] ty )
# 930 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (S.t))
  
  let _menhir_action_011 =
    fun _endpos__5_ _startpos__1_ d s ->
      let _endpos = _endpos__5_ in
      let _startpos = _startpos__1_ in
      (
# 368 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let vars, constructors = d in
      let loc = L.mk_pos _startpos _endpos in
      S.datatypes ~loc [I.(mk sort s), vars, constructors] )
# 942 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (S.t))
  
  let _menhir_action_012 =
    fun _endpos__8_ _endpos__9_ _startpos__1_ _startpos__3_ l1 l2 ->
      let _endpos = _endpos__9_ in
      let _startpos = _startpos__1_ in
      (
# 372 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let res =
        try
          List.map2 (fun (s, _) (vars, constructors) -> s, vars, constructors) l1 l2
        with Invalid_argument _ ->
          let loc = L.mk_pos _startpos__3_ _endpos__8_ in
          mismatched_lists ~loc
            (l1, "sort declaration", "sort declarations")
            (l2, "datatype definition", "datatype definitions")
      in
      let loc = L.mk_pos _startpos _endpos in
      S.datatypes ~loc res )
# 962 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (S.t))
  
  let _menhir_action_013 =
    fun _endpos__8_ _startpos__1_ args s ty ->
      let _endpos = _endpos__8_ in
      let _startpos = _startpos__1_ in
      (
# 384 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let id = I.(mk term s) in
      let loc = L.mk_pos _startpos _endpos in
      S.fun_decl ~loc id [] args ty )
# 974 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (S.t))
  
  let _menhir_action_014 =
    fun _endpos__5_ _startpos__1_ n s ->
      let _endpos = _endpos__5_ in
      let _startpos = _startpos__1_ in
      (
# 388 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let id = I.(mk sort s) in
      let loc = L.mk_pos _startpos _endpos in
      S.type_decl ~loc id (int_of_string n) )
# 986 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (S.t))
  
  let _menhir_action_015 =
    fun _endpos__4_ _startpos__1_ f ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 392 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let id, vars, args, ret, body = f in
      let loc = L.mk_pos _startpos _endpos in
      S.fun_def ~loc id vars args ret body )
# 998 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (S.t))
  
  let _menhir_action_016 =
    fun _endpos__4_ _startpos__1_ f ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 396 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let id, vars, args, ret, body = f in
      let loc = L.mk_pos _startpos _endpos in
      S.funs_def_rec ~loc [id, vars, args, ret, body] )
# 1010 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (S.t))
  
  let _menhir_action_017 =
    fun _endpos__8_ _endpos__9_ _startpos__1_ _startpos__3_ l1 l2 ->
      let _endpos = _endpos__9_ in
      let _startpos = _startpos__1_ in
      (
# 402 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let res =
        try List.map2 (fun (id, vars, args, ret) body -> id, vars, args, ret, body) l1 l2
        with Invalid_argument _ ->
          let loc = L.mk_pos _startpos__3_ _endpos__8_ in
          mismatched_lists ~loc
            (l1, "function declaration", "function declarations")
            (l2, "function body", "function bodies")
      in
      let loc = L.mk_pos _startpos _endpos in
      S.funs_def_rec ~loc res )
# 1029 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (S.t))
  
  let _menhir_action_018 =
    fun _endpos__8_ _startpos__1_ args s ty ->
      let _endpos = _endpos__8_ in
      let _startpos = _startpos__1_ in
      (
# 413 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let id = I.(mk sort s) in
      let l = List.map I.(mk sort) args in
      let loc = L.mk_pos _startpos _endpos in
      S.type_def ~loc id l ty )
# 1042 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (S.t))
  
  let _menhir_action_019 =
    fun _endpos__4_ _startpos__1_ s ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 418 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      S.echo ~loc s )
# 1053 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (S.t))
  
  let _menhir_action_020 =
    fun _endpos__3_ _startpos__1_ ->
      let _endpos = _endpos__3_ in
      let _startpos = _startpos__1_ in
      (
# 422 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.exit ~loc () )
# 1063 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (S.t))
  
  let _menhir_action_021 =
    fun _endpos__3_ _startpos__1_ ->
      let _endpos = _endpos__3_ in
      let _startpos = _startpos__1_ in
      (
# 425 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.get_assertions ~loc () )
# 1073 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (S.t))
  
  let _menhir_action_022 =
    fun _endpos__3_ _startpos__1_ ->
      let _endpos = _endpos__3_ in
      let _startpos = _startpos__1_ in
      (
# 427 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.get_assignment ~loc () )
# 1083 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (S.t))
  
  let _menhir_action_023 =
    fun _endpos__4_ _startpos__1_ i ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 429 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.get_info ~loc i )
# 1093 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (S.t))
  
  let _menhir_action_024 =
    fun _endpos__3_ _startpos__1_ ->
      let _endpos = _endpos__3_ in
      let _startpos = _startpos__1_ in
      (
# 431 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.get_model ~loc () )
# 1103 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (S.t))
  
  let _menhir_action_025 =
    fun _endpos__4_ _startpos__1_ k ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 433 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.get_option ~loc k )
# 1113 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (S.t))
  
  let _menhir_action_026 =
    fun _endpos__3_ _startpos__1_ ->
      let _endpos = _endpos__3_ in
      let _startpos = _startpos__1_ in
      (
# 435 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.get_proof ~loc () )
# 1123 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (S.t))
  
  let _menhir_action_027 =
    fun _endpos__3_ _startpos__1_ ->
      let _endpos = _endpos__3_ in
      let _startpos = _startpos__1_ in
      (
# 437 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.get_unsat_assumptions ~loc () )
# 1133 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (S.t))
  
  let _menhir_action_028 =
    fun _endpos__3_ _startpos__1_ ->
      let _endpos = _endpos__3_ in
      let _startpos = _startpos__1_ in
      (
# 439 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.get_unsat_core ~loc () )
# 1143 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (S.t))
  
  let _menhir_action_029 =
    fun _endpos__6_ _startpos__1_ l ->
      let _endpos = _endpos__6_ in
      let _startpos = _startpos__1_ in
      (
# 441 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.get_value ~loc l )
# 1153 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (S.t))
  
  let _menhir_action_030 =
    fun _endpos__4_ _startpos__1_ n ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 444 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.pop ~loc (int_of_string n) )
# 1163 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (S.t))
  
  let _menhir_action_031 =
    fun _endpos__4_ _startpos__1_ n ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 446 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.push ~loc (int_of_string n) )
# 1173 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (S.t))
  
  let _menhir_action_032 =
    fun _endpos__3_ _startpos__1_ ->
      let _endpos = _endpos__3_ in
      let _startpos = _startpos__1_ in
      (
# 448 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.reset ~loc () )
# 1183 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (S.t))
  
  let _menhir_action_033 =
    fun _endpos__3_ _startpos__1_ ->
      let _endpos = _endpos__3_ in
      let _startpos = _startpos__1_ in
      (
# 450 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.reset_assertions ~loc () )
# 1193 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (S.t))
  
  let _menhir_action_034 =
    fun _endpos__4_ _startpos__1_ c ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 453 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.set_info ~loc c )
# 1203 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (S.t))
  
  let _menhir_action_035 =
    fun _endpos__4_ _startpos__1_ s ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 455 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.set_logic ~loc s )
# 1213 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (S.t))
  
  let _menhir_action_036 =
    fun _endpos__4_ _startpos__1_ c ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 457 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.set_option ~loc c )
# 1223 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (S.t))
  
  let _menhir_action_037 =
    fun _endpos__4_ _startpos__1_ e l ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 460 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = Some (L.mk_pos _startpos _endpos) in
      e ?loc l )
# 1234 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (S.t))
  
  let _menhir_action_038 =
    fun a ->
      (
# 280 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( a )
# 1242 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t))
  
  let _menhir_action_039 =
    fun l s ->
      (
# 301 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( (I.mk I.term s), l )
# 1250 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (I.t * T.t list))
  
  let _menhir_action_040 =
    fun l ->
      (
# 312 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( [], l )
# 1258 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t list * (I.t * T.t list) list))
  
  let _menhir_action_041 =
    fun l vars ->
      (
# 314 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( vars, l )
# 1266 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t list * (I.t * T.t list) list))
  
  let _menhir_action_042 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 308 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.const ~loc I.(mk sort s) )
# 1276 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t))
  
  let _menhir_action_043 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 466 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( match E.statement s with
      | Some mk_ext -> mk_ext
      | None ->
        let loc = L.mk_pos _startpos _endpos in
        raise (L.Syntax_error (loc, `Advanced ("115",
          Format.dprintf "a command",
          Format.dprintf "the symbol '%s'" s,
          Format.dprintf "a command name")))
    )
# 1294 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (?loc:L.t -> T.t list -> S.t))
  
  let _menhir_action_044 =
    fun l ->
      (
# 479 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( l )
# 1302 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (S.t list))
  
  let _menhir_action_045 =
    fun args ret s ->
      (
# 319 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( I.(mk term s), [], args, ret )
# 1310 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (I.t * T.t list * T.t list * T.t))
  
  let _menhir_action_046 =
    fun args body ret s ->
      (
# 323 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( I.(mk term s), [], args, ret, body )
# 1318 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (I.t * T.t list * T.t list * T.t * T.t))
  
  let _menhir_action_047 =
    fun s ->
      (
# 118 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( fun ns -> I.mk ns s )
# 1326 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (I.namespace -> I.t))
  
  let _menhir_action_048 =
    fun l s ->
      (
# 120 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( fun ns -> I.indexed ns s l )
# 1334 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (I.namespace -> I.t))
  
  let _menhir_action_049 =
    fun s ->
      (
# 110 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( s )
# 1342 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_050 =
    fun s ->
      (
# 110 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( s )
# 1350 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_051 =
    fun s ->
      (
# 113 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( s )
# 1358 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_052 =
    fun s ->
      (
# 246 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( s )
# 1366 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_053 =
    fun () ->
      (
# 484 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( None )
# 1374 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (S.t option))
  
  let _menhir_action_054 =
    fun c ->
      (
# 486 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( Some c )
# 1382 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (S.t option))
  
  let _menhir_action_055 =
    fun () ->
      (
# 216 "<standard.mly>"
    ( [] )
# 1390 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string list))
  
  let _menhir_action_056 =
    fun x xs ->
      (
# 219 "<standard.mly>"
    ( x :: xs )
# 1398 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string list))
  
  let _menhir_action_057 =
    fun () ->
      (
# 216 "<standard.mly>"
    ( [] )
# 1406 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (S.t list))
  
  let _menhir_action_058 =
    fun x xs ->
      (
# 219 "<standard.mly>"
    ( x :: xs )
# 1414 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (S.t list))
  
  let _menhir_action_059 =
    fun () ->
      (
# 216 "<standard.mly>"
    ( [] )
# 1422 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t list))
  
  let _menhir_action_060 =
    fun x xs ->
      (
# 219 "<standard.mly>"
    ( x :: xs )
# 1430 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t list))
  
  let _menhir_action_061 =
    fun () ->
      (
# 216 "<standard.mly>"
    ( [] )
# 1438 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t list))
  
  let _menhir_action_062 =
    fun x xs ->
      (
# 219 "<standard.mly>"
    ( x :: xs )
# 1446 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t list))
  
  let _menhir_action_063 =
    fun () ->
      (
# 216 "<standard.mly>"
    ( [] )
# 1454 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t list))
  
  let _menhir_action_064 =
    fun x xs ->
      (
# 219 "<standard.mly>"
    ( x :: xs )
# 1462 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t list))
  
  let _menhir_action_065 =
    fun () ->
      (
# 216 "<standard.mly>"
    ( [] )
# 1470 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t list))
  
  let _menhir_action_066 =
    fun x xs ->
      (
# 219 "<standard.mly>"
    ( x :: xs )
# 1478 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t list))
  
  let _menhir_action_067 =
    fun () ->
      (
# 216 "<standard.mly>"
    ( [] )
# 1486 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t list))
  
  let _menhir_action_068 =
    fun x xs ->
      (
# 219 "<standard.mly>"
    ( x :: xs )
# 1494 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t list))
  
  let _menhir_action_069 =
    fun p t ->
      (
# 206 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( p, t )
# 1502 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t * T.t))
  
  let _menhir_action_070 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 1510 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t list))
  
  let _menhir_action_071 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 1518 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t list))
  
  let _menhir_action_072 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 1526 "src/languages/smtlib2/v2.6/script/parser.ml"
       : ((I.t * T.t list) list))
  
  let _menhir_action_073 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 1534 "src/languages/smtlib2/v2.6/script/parser.ml"
       : ((I.t * T.t list) list))
  
  let _menhir_action_074 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 1542 "src/languages/smtlib2/v2.6/script/parser.ml"
       : ((T.t list * (I.t * T.t list) list) list))
  
  let _menhir_action_075 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 1550 "src/languages/smtlib2/v2.6/script/parser.ml"
       : ((T.t list * (I.t * T.t list) list) list))
  
  let _menhir_action_076 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 1558 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t list))
  
  let _menhir_action_077 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 1566 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t list))
  
  let _menhir_action_078 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 1574 "src/languages/smtlib2/v2.6/script/parser.ml"
       : ((I.t * T.t list * T.t list * T.t) list))
  
  let _menhir_action_079 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 1582 "src/languages/smtlib2/v2.6/script/parser.ml"
       : ((I.t * T.t list * T.t list * T.t) list))
  
  let _menhir_action_080 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 1590 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string list))
  
  let _menhir_action_081 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 1598 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string list))
  
  let _menhir_action_082 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 1606 "src/languages/smtlib2/v2.6/script/parser.ml"
       : ((T.t * T.t) list))
  
  let _menhir_action_083 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 1614 "src/languages/smtlib2/v2.6/script/parser.ml"
       : ((T.t * T.t) list))
  
  let _menhir_action_084 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 1622 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t list))
  
  let _menhir_action_085 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 1630 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t list))
  
  let _menhir_action_086 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 1638 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t list))
  
  let _menhir_action_087 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 1646 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t list))
  
  let _menhir_action_088 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 1654 "src/languages/smtlib2/v2.6/script/parser.ml"
       : ((I.t * int) list))
  
  let _menhir_action_089 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 1662 "src/languages/smtlib2/v2.6/script/parser.ml"
       : ((I.t * int) list))
  
  let _menhir_action_090 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 1670 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t list))
  
  let _menhir_action_091 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 1678 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t list))
  
  let _menhir_action_092 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 1686 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t list))
  
  let _menhir_action_093 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 1694 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t list))
  
  let _menhir_action_094 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 1702 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t list))
  
  let _menhir_action_095 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 1710 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t list))
  
  let _menhir_action_096 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 337 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      match s with
      | "not" ->
        T.const ~loc I.(mk term s)
      | _ ->
        let msg = Format.dprintf "@[<v>@[<hov>%a@]@ Hint: @[<hov>%a@]@]"
          Format.pp_print_text "expected the 'not' symbol at that point."
          Format.pp_print_text
           "check-sat-assuming only accepts a list of terms \
            of the form 'p' or '(not p)', where p is a boolean literal."
        in
        raise (L.Syntax_error (loc, `Regular msg)) )
# 1731 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t))
  
  let _menhir_action_097 =
    fun () ->
      (
# 111 "<standard.mly>"
    ( None )
# 1739 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t option))
  
  let _menhir_action_098 =
    fun x ->
      (
# 114 "<standard.mly>"
    ( Some x )
# 1747 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t option))
  
  let _menhir_action_099 =
    fun c ->
      (
# 199 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( c )
# 1755 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t))
  
  let _menhir_action_100 =
    fun _endpos__4_ _startpos__1_ args f ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 201 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.apply ~loc f args )
# 1765 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t))
  
  let _menhir_action_101 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 194 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.const ~loc I.(mk term s) )
# 1775 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t))
  
  let _menhir_action_102 =
    fun s ->
      (
# 353 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( s )
# 1783 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t))
  
  let _menhir_action_103 =
    fun _endpos__4_ _startpos__1_ f s ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 355 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.apply ~loc f [s] )
# 1793 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t))
  
  let _menhir_action_104 =
    fun s ->
      (
# 328 "src/languages/smtlib2/v2.6/script/parser.mly"
                     ( s )
# 1801 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t))
  
  let _menhir_action_105 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 164 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in `NoAs (T.const ~loc (s I.term)) )
# 1811 "src/languages/smtlib2/v2.6/script/parser.ml"
       : ([ `As of T.t * T.t * L.t | `NoAs of T.t ]))
  
  let _menhir_action_106 =
    fun _endpos__5_ _endpos_s_ _startpos__1_ _startpos_s_ s ty ->
      let _endpos = _endpos__5_ in
      let _startpos = _startpos__1_ in
      (
# 166 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos_s_ _endpos_s_ in
      let as_loc = L.mk_pos _startpos _endpos in
      `As (T.const ~loc (s I.term), ty, as_loc) )
# 1823 "src/languages/smtlib2/v2.6/script/parser.ml"
       : ([ `As of T.t * T.t * L.t | `NoAs of T.t ]))
  
  let _menhir_action_107 =
    fun () ->
      (
# 54 "src/languages/smtlib2/v2.6/script/parser.mly"
               ( "_" )
# 1831 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_108 =
    fun () ->
      (
# 55 "src/languages/smtlib2/v2.6/script/parser.mly"
              ( "!" )
# 1839 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_109 =
    fun () ->
      (
# 56 "src/languages/smtlib2/v2.6/script/parser.mly"
       ( "as" )
# 1847 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_110 =
    fun () ->
      (
# 57 "src/languages/smtlib2/v2.6/script/parser.mly"
        ( "let" )
# 1855 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_111 =
    fun () ->
      (
# 58 "src/languages/smtlib2/v2.6/script/parser.mly"
           ( "exists" )
# 1863 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_112 =
    fun () ->
      (
# 59 "src/languages/smtlib2/v2.6/script/parser.mly"
           ( "forall" )
# 1871 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_113 =
    fun () ->
      (
# 60 "src/languages/smtlib2/v2.6/script/parser.mly"
          ( "match" )
# 1879 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_114 =
    fun () ->
      (
# 61 "src/languages/smtlib2/v2.6/script/parser.mly"
        ( "par" )
# 1887 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_115 =
    fun () ->
      (
# 62 "src/languages/smtlib2/v2.6/script/parser.mly"
           ( "assert" )
# 1895 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_116 =
    fun () ->
      (
# 63 "src/languages/smtlib2/v2.6/script/parser.mly"
              ( "check-sat" )
# 1903 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_117 =
    fun () ->
      (
# 64 "src/languages/smtlib2/v2.6/script/parser.mly"
                       ( "check-sat-assuming" )
# 1911 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_118 =
    fun () ->
      (
# 65 "src/languages/smtlib2/v2.6/script/parser.mly"
                  ( "declare-const" )
# 1919 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_119 =
    fun () ->
      (
# 66 "src/languages/smtlib2/v2.6/script/parser.mly"
                     ( "declare-datatype" )
# 1927 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_120 =
    fun () ->
      (
# 67 "src/languages/smtlib2/v2.6/script/parser.mly"
                      ( "declare-datatypes" )
# 1935 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_121 =
    fun () ->
      (
# 68 "src/languages/smtlib2/v2.6/script/parser.mly"
                ( "declare-fun" )
# 1943 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_122 =
    fun () ->
      (
# 69 "src/languages/smtlib2/v2.6/script/parser.mly"
                 ( "declare-sort" )
# 1951 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_123 =
    fun () ->
      (
# 70 "src/languages/smtlib2/v2.6/script/parser.mly"
               ( "define-fun" )
# 1959 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_124 =
    fun () ->
      (
# 71 "src/languages/smtlib2/v2.6/script/parser.mly"
                   ( "define-fun-rec" )
# 1967 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_125 =
    fun () ->
      (
# 72 "src/languages/smtlib2/v2.6/script/parser.mly"
                    ( "define-funs-rec" )
# 1975 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_126 =
    fun () ->
      (
# 73 "src/languages/smtlib2/v2.6/script/parser.mly"
                ( "define-sort" )
# 1983 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_127 =
    fun () ->
      (
# 74 "src/languages/smtlib2/v2.6/script/parser.mly"
         ( "echo" )
# 1991 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_128 =
    fun () ->
      (
# 75 "src/languages/smtlib2/v2.6/script/parser.mly"
         ( "exit" )
# 1999 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_129 =
    fun () ->
      (
# 76 "src/languages/smtlib2/v2.6/script/parser.mly"
                   ( "get-assertions" )
# 2007 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_130 =
    fun () ->
      (
# 77 "src/languages/smtlib2/v2.6/script/parser.mly"
                   ( "get-assignment" )
# 2015 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_131 =
    fun () ->
      (
# 78 "src/languages/smtlib2/v2.6/script/parser.mly"
             ( "get-info" )
# 2023 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_132 =
    fun () ->
      (
# 79 "src/languages/smtlib2/v2.6/script/parser.mly"
              ( "get-model" )
# 2031 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_133 =
    fun () ->
      (
# 80 "src/languages/smtlib2/v2.6/script/parser.mly"
               ( "get-option" )
# 2039 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_134 =
    fun () ->
      (
# 81 "src/languages/smtlib2/v2.6/script/parser.mly"
              ( "get-proof" )
# 2047 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_135 =
    fun () ->
      (
# 82 "src/languages/smtlib2/v2.6/script/parser.mly"
                          ( "get-unsat-assumptions" )
# 2055 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_136 =
    fun () ->
      (
# 83 "src/languages/smtlib2/v2.6/script/parser.mly"
                   ( "get-unsat-core" )
# 2063 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_137 =
    fun () ->
      (
# 84 "src/languages/smtlib2/v2.6/script/parser.mly"
              ( "get-value" )
# 2071 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_138 =
    fun () ->
      (
# 85 "src/languages/smtlib2/v2.6/script/parser.mly"
        ( "pop" )
# 2079 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_139 =
    fun () ->
      (
# 86 "src/languages/smtlib2/v2.6/script/parser.mly"
         ( "push" )
# 2087 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_140 =
    fun () ->
      (
# 87 "src/languages/smtlib2/v2.6/script/parser.mly"
          ( "reset" )
# 2095 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_141 =
    fun () ->
      (
# 88 "src/languages/smtlib2/v2.6/script/parser.mly"
                     ( "reset-assertions" )
# 2103 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_142 =
    fun () ->
      (
# 89 "src/languages/smtlib2/v2.6/script/parser.mly"
             ( "set-info" )
# 2111 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_143 =
    fun () ->
      (
# 90 "src/languages/smtlib2/v2.6/script/parser.mly"
              ( "set-logic" )
# 2119 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_144 =
    fun () ->
      (
# 91 "src/languages/smtlib2/v2.6/script/parser.mly"
               ( "set-option" )
# 2127 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (string))
  
  let _menhir_action_145 =
    fun c ->
      (
# 96 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( c )
# 2135 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t))
  
  let _menhir_action_146 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 98 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.const ~loc I.(mk term s) )
# 2145 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t))
  
  let _menhir_action_147 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 100 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.const ~loc I.(mk term s) )
# 2155 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t))
  
  let _menhir_action_148 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 102 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.const ~loc I.(mk term s) )
# 2165 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t))
  
  let _menhir_action_149 =
    fun _endpos__3_ _startpos__1_ l ->
      let _endpos = _endpos__3_ in
      let _startpos = _startpos__1_ in
      (
# 104 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.sexpr ~loc l )
# 2175 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t))
  
  let _menhir_action_150 =
    fun _endpos__4_ _startpos__1_ s ty ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 291 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let f =
      let loc = L.mk_pos _startpos _endpos in
      T.const ~loc (I.mk I.term s)
    in
    let loc = L.mk_pos _startpos _endpos in
    T.colon ~loc f ty )
# 2190 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t))
  
  let _menhir_action_151 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 125 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.const ~loc (s I.sort) )
# 2200 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t))
  
  let _menhir_action_152 =
    fun _endpos__4_ _endpos_f_ _startpos__1_ _startpos_f_ args f ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 127 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let c =
        let loc = L.mk_pos _startpos_f_ _endpos_f_ in
        T.const ~loc (f I.sort)
      in
      let loc = L.mk_pos _startpos _endpos in T.apply ~loc c args )
# 2214 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t))
  
  let _menhir_action_153 =
    fun n s ->
      (
# 285 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( I.(mk sort s), int_of_string n
      (* shouldn't raise because of the definition of numeral in lexer *) )
# 2223 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (I.t * int))
  
  let _menhir_action_154 =
    fun _endpos__4_ _endpos_s_ _startpos__1_ _startpos_s_ s ty ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 182 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let c =
        let loc = L.mk_pos _startpos_s_ _endpos_s_ in
        T.const ~loc I.(mk term s)
      in
      let loc = L.mk_pos _startpos _endpos in T.colon ~loc c ty )
# 2237 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t))
  
  let _menhir_action_155 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 35 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.int ~loc s )
# 2247 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t))
  
  let _menhir_action_156 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 37 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.real ~loc s )
# 2257 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t))
  
  let _menhir_action_157 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 39 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.hexa ~loc s )
# 2267 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t))
  
  let _menhir_action_158 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 41 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.binary ~loc s )
# 2277 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t))
  
  let _menhir_action_159 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 43 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.str ~loc s )
# 2287 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t))
  
  let _menhir_action_160 =
    fun c ->
      (
# 211 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( c )
# 2295 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t))
  
  let _menhir_action_161 =
    fun s ->
      (
# 213 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( match s with
      | `NoAs f -> f
      | `As (f, ty, loc) -> T.colon ~loc f ty )
# 2305 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t))
  
  let _menhir_action_162 =
    fun _endpos__4_ _startpos__1_ args s ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 217 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      match s with
      | `NoAs f -> T.apply ~loc f args
      | `As (f, ty, as_loc) -> T.colon ~loc:as_loc (T.apply ~loc f args) ty )
# 2318 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t))
  
  let _menhir_action_163 =
    fun _endpos__7_ _startpos__1_ l t ->
      let _endpos = _endpos__7_ in
      let _startpos = _startpos__1_ in
      (
# 222 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.letand ~loc l t )
# 2328 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t))
  
  let _menhir_action_164 =
    fun _endpos__7_ _startpos__1_ l t ->
      let _endpos = _endpos__7_ in
      let _startpos = _startpos__1_ in
      (
# 224 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.forall ~loc l t )
# 2338 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t))
  
  let _menhir_action_165 =
    fun _endpos__7_ _startpos__1_ l t ->
      let _endpos = _endpos__7_ in
      let _startpos = _startpos__1_ in
      (
# 226 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.exists ~loc l t )
# 2348 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t))
  
  let _menhir_action_166 =
    fun _endpos__7_ _startpos__1_ l t ->
      let _endpos = _endpos__7_ in
      let _startpos = _startpos__1_ in
      (
# 228 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.match_ ~loc t l )
# 2358 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t))
  
  let _menhir_action_167 =
    fun _endpos__5_ _startpos__1_ args f ->
      let _endpos = _endpos__5_ in
      let _startpos = _startpos__1_ in
      (
# 230 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.annot ~loc f args )
# 2368 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t))
  
  let _menhir_action_168 =
    fun _endpos__4_ _endpos_s_ _startpos__1_ _startpos_s_ s t ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 173 "src/languages/smtlib2/v2.6/script/parser.mly"
    ( let c =
        let loc = L.mk_pos _startpos_s_ _endpos_s_ in
        T.const ~loc I.(mk term s)
      in
      let loc = L.mk_pos _startpos _endpos in T.colon ~loc c t )
# 2382 "src/languages/smtlib2/v2.6/script/parser.ml"
       : (T.t))
  
  let _menhir_print_token : token -> string =
    fun _tok ->
      match _tok with
      | Tokens.AS ->
          "AS"
      | Tokens.ASSERT ->
          "ASSERT"
      | Tokens.ATTRIBUTE ->
          "ATTRIBUTE"
      | Tokens.BIN _ ->
          "BIN"
      | Tokens.CHECK_SAT ->
          "CHECK_SAT"
      | Tokens.CHECK_SAT_ASSUMING ->
          "CHECK_SAT_ASSUMING"
      | Tokens.CLOSE ->
          "CLOSE"
      | Tokens.DEC _ ->
          "DEC"
      | Tokens.DECLARE_CONST ->
          "DECLARE_CONST"
      | Tokens.DECLARE_DATATYPE ->
          "DECLARE_DATATYPE"
      | Tokens.DECLARE_DATATYPES ->
          "DECLARE_DATATYPES"
      | Tokens.DECLARE_FUN ->
          "DECLARE_FUN"
      | Tokens.DECLARE_SORT ->
          "DECLARE_SORT"
      | Tokens.DEFINE_FUN ->
          "DEFINE_FUN"
      | Tokens.DEFINE_FUNS_REC ->
          "DEFINE_FUNS_REC"
      | Tokens.DEFINE_FUN_REC ->
          "DEFINE_FUN_REC"
      | Tokens.DEFINE_SORT ->
          "DEFINE_SORT"
      | Tokens.ECHO ->
          "ECHO"
      | Tokens.EOF ->
          "EOF"
      | Tokens.EXISTS ->
          "EXISTS"
      | Tokens.EXIT ->
          "EXIT"
      | Tokens.FORALL ->
          "FORALL"
      | Tokens.GET_ASSERTIONS ->
          "GET_ASSERTIONS"
      | Tokens.GET_ASSIGNMENT ->
          "GET_ASSIGNMENT"
      | Tokens.GET_INFO ->
          "GET_INFO"
      | Tokens.GET_MODEL ->
          "GET_MODEL"
      | Tokens.GET_OPTION ->
          "GET_OPTION"
      | Tokens.GET_PROOF ->
          "GET_PROOF"
      | Tokens.GET_UNSAT_ASSUMPTIONS ->
          "GET_UNSAT_ASSUMPTIONS"
      | Tokens.GET_UNSAT_CORE ->
          "GET_UNSAT_CORE"
      | Tokens.GET_VALUE ->
          "GET_VALUE"
      | Tokens.HEX _ ->
          "HEX"
      | Tokens.KEYWORD _ ->
          "KEYWORD"
      | Tokens.LET ->
          "LET"
      | Tokens.MATCH ->
          "MATCH"
      | Tokens.NUM _ ->
          "NUM"
      | Tokens.OPEN ->
          "OPEN"
      | Tokens.PAR ->
          "PAR"
      | Tokens.POP ->
          "POP"
      | Tokens.PUSH ->
          "PUSH"
      | Tokens.RESET ->
          "RESET"
      | Tokens.RESET_ASSERTIONS ->
          "RESET_ASSERTIONS"
      | Tokens.SET_INFO ->
          "SET_INFO"
      | Tokens.SET_LOGIC ->
          "SET_LOGIC"
      | Tokens.SET_OPTION ->
          "SET_OPTION"
      | Tokens.STR _ ->
          "STR"
      | Tokens.SYMBOL _ ->
          "SYMBOL"
      | Tokens.UNDERSCORE ->
          "UNDERSCORE"
  
  let _menhir_fail : unit -> 'a =
    fun () ->
      Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
      assert false
  
  include struct
    
    [@@@ocaml.warning "-4-37"]
    
    let _menhir_run_490 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_term =
      fun _menhir_stack _v ->
        MenhirBox_term _v
    
    let _menhir_goto_input : type  ttv_stack. ttv_stack -> _ -> _menhir_box_input =
      fun _menhir_stack _v ->
        MenhirBox_input _v
    
    let _menhir_run_442 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_input =
      fun _menhir_stack _v ->
        let c = _v in
        let _v = _menhir_action_054 c in
        _menhir_goto_input _menhir_stack _v
    
    let _menhir_run_325 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_file =
      fun _menhir_stack _v ->
        let l = _v in
        let _v = _menhir_action_044 l in
        MenhirBox_file _v
    
    let rec _menhir_run_329 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_command -> _ -> _menhir_box_file =
      fun _menhir_stack _v ->
        let MenhirCell1_command (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_058 x xs in
        _menhir_goto_list_command_ _menhir_stack _v _menhir_s
    
    and _menhir_goto_list_command_ : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _v _menhir_s ->
        match _menhir_s with
        | MenhirState328 ->
            _menhir_run_329 _menhir_stack _v
        | MenhirState000 ->
            _menhir_run_325 _menhir_stack _v
        | _ ->
            _menhir_fail ()
    
    let rec _menhir_run_001 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState001
        | Tokens.SET_OPTION ->
            let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
            let _menhir_s = MenhirState001 in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell1_SET_OPTION (_menhir_stack, _menhir_s, _startpos, _endpos) in
            let _menhir_s = MenhirState003 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.KEYWORD _v ->
                _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 3)
        | Tokens.SET_LOGIC ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SYMBOL _v ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.CLOSE ->
                    let _endpos_4 = _menhir_lexbuf.Lexing.lex_curr_p in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    let (_startpos__1_, s, _endpos__4_) = (_startpos, _v, _endpos_4) in
                    let _v = _menhir_action_035 _endpos__4_ _startpos__1_ s in
                    _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
                | _ ->
                    _eRR 68)
            | _ ->
                _eRR 67)
        | Tokens.SET_INFO ->
            let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
            let _menhir_s = MenhirState001 in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell1_SET_INFO (_menhir_stack, _menhir_s, _startpos, _endpos) in
            let _menhir_s = MenhirState070 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.KEYWORD _v ->
                _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 70)
        | Tokens.RESET_ASSERTIONS ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.CLOSE ->
                let _endpos_7 = _menhir_lexbuf.Lexing.lex_curr_p in
                let _tok = _menhir_lexer _menhir_lexbuf in
                let (_startpos__1_, _endpos__3_) = (_startpos, _endpos_7) in
                let _v = _menhir_action_033 _endpos__3_ _startpos__1_ in
                _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
            | _ ->
                _eRR 73)
        | Tokens.RESET ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.CLOSE ->
                let _endpos_9 = _menhir_lexbuf.Lexing.lex_curr_p in
                let _tok = _menhir_lexer _menhir_lexbuf in
                let (_startpos__1_, _endpos__3_) = (_startpos, _endpos_9) in
                let _v = _menhir_action_032 _endpos__3_ _startpos__1_ in
                _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
            | _ ->
                _eRR 75)
        | Tokens.PUSH ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.NUM _v ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.CLOSE ->
                    let _endpos_13 = _menhir_lexbuf.Lexing.lex_curr_p in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    let (_startpos__1_, _endpos__4_, n) = (_startpos, _endpos_13, _v) in
                    let _v = _menhir_action_031 _endpos__4_ _startpos__1_ n in
                    _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
                | _ ->
                    _eRR 78)
            | _ ->
                _eRR 77)
        | Tokens.POP ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.NUM _v ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.CLOSE ->
                    let _endpos_17 = _menhir_lexbuf.Lexing.lex_curr_p in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    let (_startpos__1_, _endpos__4_, n) = (_startpos, _endpos_17, _v) in
                    let _v = _menhir_action_030 _endpos__4_ _startpos__1_ n in
                    _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
                | _ ->
                    _eRR 81)
            | _ ->
                _eRR 80)
        | Tokens.GET_VALUE ->
            let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
            let _menhir_s = MenhirState001 in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell1_GET_VALUE (_menhir_stack, _menhir_s, _startpos, _endpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
                let _menhir_s = MenhirState084 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SYMBOL _v ->
                    _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.STR _v ->
                    _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.OPEN ->
                    _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | Tokens.NUM _v ->
                    _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.HEX _v ->
                    _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.DEC _v ->
                    _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.BIN _v ->
                    _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | _ ->
                    _eRR 84)
            | _ ->
                _eRR 83)
        | Tokens.GET_UNSAT_CORE ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.CLOSE ->
                let _endpos_21 = _menhir_lexbuf.Lexing.lex_curr_p in
                let _tok = _menhir_lexer _menhir_lexbuf in
                let (_startpos__1_, _endpos__3_) = (_startpos, _endpos_21) in
                let _v = _menhir_action_028 _endpos__3_ _startpos__1_ in
                _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
            | _ ->
                _eRR 176)
        | Tokens.GET_UNSAT_ASSUMPTIONS ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.CLOSE ->
                let _endpos_23 = _menhir_lexbuf.Lexing.lex_curr_p in
                let _tok = _menhir_lexer _menhir_lexbuf in
                let (_startpos__1_, _endpos__3_) = (_startpos, _endpos_23) in
                let _v = _menhir_action_027 _endpos__3_ _startpos__1_ in
                _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
            | _ ->
                _eRR 178)
        | Tokens.GET_PROOF ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.CLOSE ->
                let _endpos_25 = _menhir_lexbuf.Lexing.lex_curr_p in
                let _tok = _menhir_lexer _menhir_lexbuf in
                let (_startpos__1_, _endpos__3_) = (_startpos, _endpos_25) in
                let _v = _menhir_action_026 _endpos__3_ _startpos__1_ in
                _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
            | _ ->
                _eRR 180)
        | Tokens.GET_OPTION ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.KEYWORD _v ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.CLOSE ->
                    let _endpos_29 = _menhir_lexbuf.Lexing.lex_curr_p in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    let (_startpos__1_, _endpos__4_, k) = (_startpos, _endpos_29, _v) in
                    let _v = _menhir_action_025 _endpos__4_ _startpos__1_ k in
                    _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
                | _ ->
                    _eRR 183)
            | _ ->
                _eRR 182)
        | Tokens.GET_MODEL ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.CLOSE ->
                let _endpos_31 = _menhir_lexbuf.Lexing.lex_curr_p in
                let _tok = _menhir_lexer _menhir_lexbuf in
                let (_startpos__1_, _endpos__3_) = (_startpos, _endpos_31) in
                let _v = _menhir_action_024 _endpos__3_ _startpos__1_ in
                _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
            | _ ->
                _eRR 185)
        | Tokens.GET_INFO ->
            let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
            let _menhir_s = MenhirState001 in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell1_GET_INFO (_menhir_stack, _menhir_s, _startpos, _endpos) in
            let _menhir_s = MenhirState187 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.KEYWORD _v ->
                _menhir_run_188 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 187)
        | Tokens.GET_ASSIGNMENT ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.CLOSE ->
                let _endpos_34 = _menhir_lexbuf.Lexing.lex_curr_p in
                let _tok = _menhir_lexer _menhir_lexbuf in
                let (_startpos__1_, _endpos__3_) = (_startpos, _endpos_34) in
                let _v = _menhir_action_022 _endpos__3_ _startpos__1_ in
                _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
            | _ ->
                _eRR 191)
        | Tokens.GET_ASSERTIONS ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.CLOSE ->
                let _endpos_36 = _menhir_lexbuf.Lexing.lex_curr_p in
                let _tok = _menhir_lexer _menhir_lexbuf in
                let (_startpos__1_, _endpos__3_) = (_startpos, _endpos_36) in
                let _v = _menhir_action_021 _endpos__3_ _startpos__1_ in
                _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
            | _ ->
                _eRR 193)
        | Tokens.EXIT ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.CLOSE ->
                let _endpos_38 = _menhir_lexbuf.Lexing.lex_curr_p in
                let _tok = _menhir_lexer _menhir_lexbuf in
                let (_startpos__1_, _endpos__3_) = (_startpos, _endpos_38) in
                let _v = _menhir_action_020 _endpos__3_ _startpos__1_ in
                _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
            | _ ->
                _eRR 195)
        | Tokens.ECHO ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.STR _v ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.CLOSE ->
                    let _endpos_42 = _menhir_lexbuf.Lexing.lex_curr_p in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    let (_startpos__1_, s, _endpos__4_) = (_startpos, _v, _endpos_42) in
                    let _v = _menhir_action_019 _endpos__4_ _startpos__1_ s in
                    _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
                | _ ->
                    _eRR 198)
            | _ ->
                _eRR 197)
        | Tokens.DEFINE_SORT ->
            let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
            let _startpos_43 = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell1_DEFINE_SORT (_menhir_stack, MenhirState001, _startpos_43, _endpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SYMBOL _v ->
                let _startpos_44 = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos_45 = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell0_SYMBOL (_menhir_stack, _v, _startpos_44, _endpos_45) in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.OPEN ->
                    let _startpos_46 = _menhir_lexbuf.Lexing.lex_start_p in
                    let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos_46) in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.SYMBOL _v_47 ->
                        _menhir_run_203 _menhir_stack _menhir_lexbuf _menhir_lexer _v_47 MenhirState202
                    | Tokens.CLOSE ->
                        let _v_48 = _menhir_action_055 () in
                        _menhir_run_205 _menhir_stack _menhir_lexbuf _menhir_lexer _v_48 MenhirState202
                    | _ ->
                        _eRR 202)
                | _ ->
                    _eRR 201)
            | _ ->
                _eRR 200)
        | Tokens.DEFINE_FUN_REC ->
            let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
            let _menhir_s = MenhirState001 in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell1_DEFINE_FUN_REC (_menhir_stack, _menhir_s, _startpos, _endpos) in
            let _menhir_s = MenhirState209 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SYMBOL _v ->
                _menhir_run_210 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 209)
        | Tokens.DEFINE_FUNS_REC ->
            let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
            let _menhir_s = MenhirState001 in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell1_DEFINE_FUNS_REC (_menhir_stack, _menhir_s, _startpos, _endpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
                let _menhir_s = MenhirState221 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.OPEN ->
                    _menhir_run_222 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | _ ->
                    _eRR 221)
            | _ ->
                _eRR 220)
        | Tokens.DEFINE_FUN ->
            let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
            let _menhir_s = MenhirState001 in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell1_DEFINE_FUN (_menhir_stack, _menhir_s, _startpos, _endpos) in
            let _menhir_s = MenhirState237 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SYMBOL _v ->
                _menhir_run_210 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 237)
        | Tokens.DECLARE_SORT ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SYMBOL _v ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.NUM _v_56 ->
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.CLOSE ->
                        let _endpos_59 = _menhir_lexbuf.Lexing.lex_curr_p in
                        let _tok = _menhir_lexer _menhir_lexbuf in
                        let (_startpos__1_, s, n, _endpos__5_) = (_startpos, _v, _v_56, _endpos_59) in
                        let _v = _menhir_action_014 _endpos__5_ _startpos__1_ n s in
                        _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
                    | _ ->
                        _eRR 242)
                | _ ->
                    _eRR 241)
            | _ ->
                _eRR 240)
        | Tokens.DECLARE_FUN ->
            let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
            let _startpos_60 = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell1_DECLARE_FUN (_menhir_stack, MenhirState001, _startpos_60, _endpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SYMBOL _v ->
                let _startpos_61 = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos_62 = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell0_SYMBOL (_menhir_stack, _v, _startpos_61, _endpos_62) in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.OPEN ->
                    let _startpos_63 = _menhir_lexbuf.Lexing.lex_start_p in
                    let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos_63) in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.SYMBOL _v_64 ->
                        _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v_64 MenhirState246
                    | Tokens.OPEN ->
                        _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState246
                    | Tokens.CLOSE ->
                        let _v_65 = _menhir_action_065 () in
                        _menhir_run_249 _menhir_stack _menhir_lexbuf _menhir_lexer _v_65 MenhirState246
                    | _ ->
                        _eRR 246)
                | _ ->
                    _eRR 245)
            | _ ->
                _eRR 244)
        | Tokens.DECLARE_DATATYPES ->
            let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
            let _menhir_s = MenhirState001 in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell1_DECLARE_DATATYPES (_menhir_stack, _menhir_s, _startpos, _endpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
                let _menhir_s = MenhirState254 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.OPEN ->
                    _menhir_run_255 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | _ ->
                    _eRR 254)
            | _ ->
                _eRR 253)
        | Tokens.DECLARE_DATATYPE ->
            let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
            let _menhir_s = MenhirState001 in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell1_DECLARE_DATATYPE (_menhir_stack, _menhir_s, _startpos, _endpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SYMBOL _v ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell0_SYMBOL (_menhir_stack, _v, _startpos, _endpos) in
                let _menhir_s = MenhirState296 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.OPEN ->
                    _menhir_run_264 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | _ ->
                    _eRR 296)
            | _ ->
                _eRR 295)
        | Tokens.DECLARE_CONST ->
            let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
            let _menhir_s = MenhirState001 in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell1_DECLARE_CONST (_menhir_stack, _menhir_s, _startpos, _endpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SYMBOL _v ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell0_SYMBOL (_menhir_stack, _v, _startpos, _endpos) in
                let _menhir_s = MenhirState300 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SYMBOL _v ->
                    _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.OPEN ->
                    _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | _ ->
                    _eRR 300)
            | _ ->
                _eRR 299)
        | Tokens.CHECK_SAT_ASSUMING ->
            let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
            let _startpos_75 = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell1_CHECK_SAT_ASSUMING (_menhir_stack, MenhirState001, _startpos_75, _endpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                let _startpos_76 = _menhir_lexbuf.Lexing.lex_start_p in
                let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos_76) in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SYMBOL _v ->
                    _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState304
                | Tokens.OPEN ->
                    _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState304
                | Tokens.CLOSE ->
                    let _v = _menhir_action_059 () in
                    _menhir_run_314 _menhir_stack _menhir_lexbuf _menhir_lexer _v
                | _ ->
                    _eRR 304)
            | _ ->
                _eRR 303)
        | Tokens.CHECK_SAT ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.CLOSE ->
                let _endpos_78 = _menhir_lexbuf.Lexing.lex_curr_p in
                let _tok = _menhir_lexer _menhir_lexbuf in
                let (_startpos__1_, _endpos__3_) = (_startpos, _endpos_78) in
                let _v = _menhir_action_008 _endpos__3_ _startpos__1_ in
                _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
            | _ ->
                _eRR 317)
        | Tokens.ASSERT ->
            let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
            let _menhir_s = MenhirState001 in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell1_ASSERT (_menhir_stack, _menhir_s, _startpos, _endpos) in
            let _menhir_s = MenhirState319 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SYMBOL _v ->
                _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.STR _v ->
                _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.OPEN ->
                _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NUM _v ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.HEX _v ->
                _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DEC _v ->
                _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.BIN _v ->
                _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 319)
        | _ ->
            _eRR 1
    
    and _menhir_run_002 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_043 _endpos_s_ _startpos_s_ s in
        _menhir_goto_extension_statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_extension_statement : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState331 ->
            _menhir_run_437 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState001 ->
            _menhir_run_322 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_437 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_extension_statement (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.UNDERSCORE ->
            _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.SYMBOL _v_0 ->
            _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState437
        | Tokens.STR _v_1 ->
            _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState437
        | Tokens.SET_OPTION ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.SET_LOGIC ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.SET_INFO ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.RESET_ASSERTIONS ->
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.RESET ->
            _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.PUSH ->
            _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.POP ->
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.PAR ->
            _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.OPEN ->
            _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.NUM _v_2 ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState437
        | Tokens.MATCH ->
            _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.LET ->
            _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.KEYWORD _v_3 ->
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState437
        | Tokens.HEX _v_4 ->
            _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState437
        | Tokens.GET_VALUE ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.GET_UNSAT_CORE ->
            _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.GET_UNSAT_ASSUMPTIONS ->
            _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.GET_PROOF ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.GET_OPTION ->
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.GET_MODEL ->
            _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.GET_INFO ->
            _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.GET_ASSIGNMENT ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.GET_ASSERTIONS ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.FORALL ->
            _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.EXIT ->
            _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.EXISTS ->
            _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.ECHO ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.DEFINE_SORT ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.DEFINE_FUN_REC ->
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.DEFINE_FUNS_REC ->
            _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.DEFINE_FUN ->
            _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.DECLARE_SORT ->
            _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.DECLARE_FUN ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.DECLARE_DATATYPES ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.DECLARE_DATATYPE ->
            _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.DECLARE_CONST ->
            _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.DEC _v_5 ->
            _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState437
        | Tokens.CHECK_SAT_ASSUMING ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.CHECK_SAT ->
            _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.BIN _v_6 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v_6 MenhirState437
        | Tokens.ATTRIBUTE ->
            _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.ASSERT ->
            _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.AS ->
            _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState437
        | Tokens.CLOSE ->
            let _v_7 = _menhir_action_061 () in
            _menhir_run_438 _menhir_stack _menhir_lexbuf _menhir_lexer _v_7 _tok
        | _ ->
            _eRR 437
    
    and _menhir_run_008 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_107 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_goto_reserved : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_147 _endpos_s_ _startpos_s_ s in
        _menhir_goto_s_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_s_expr : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_s_expr (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.UNDERSCORE ->
            _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.SYMBOL _v_0 ->
            _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState054
        | Tokens.STR _v_1 ->
            _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState054
        | Tokens.SET_OPTION ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.SET_LOGIC ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.SET_INFO ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.RESET_ASSERTIONS ->
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.RESET ->
            _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.PUSH ->
            _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.POP ->
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.PAR ->
            _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.OPEN ->
            _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.NUM _v_2 ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState054
        | Tokens.MATCH ->
            _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.LET ->
            _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.KEYWORD _v_3 ->
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState054
        | Tokens.HEX _v_4 ->
            _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState054
        | Tokens.GET_VALUE ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.GET_UNSAT_CORE ->
            _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.GET_UNSAT_ASSUMPTIONS ->
            _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.GET_PROOF ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.GET_OPTION ->
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.GET_MODEL ->
            _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.GET_INFO ->
            _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.GET_ASSIGNMENT ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.GET_ASSERTIONS ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.FORALL ->
            _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.EXIT ->
            _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.EXISTS ->
            _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.ECHO ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.DEFINE_SORT ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.DEFINE_FUN_REC ->
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.DEFINE_FUNS_REC ->
            _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.DEFINE_FUN ->
            _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.DECLARE_SORT ->
            _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.DECLARE_FUN ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.DECLARE_DATATYPES ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.DECLARE_DATATYPE ->
            _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.DECLARE_CONST ->
            _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.DEC _v_5 ->
            _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState054
        | Tokens.CHECK_SAT_ASSUMING ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.CHECK_SAT ->
            _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.BIN _v_6 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v_6 MenhirState054
        | Tokens.ATTRIBUTE ->
            _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.ASSERT ->
            _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.AS ->
            _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState054
        | Tokens.CLOSE ->
            let _v_7 = _menhir_action_061 () in
            _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v_7 _tok
        | _ ->
            _eRR 54
    
    and _menhir_run_009 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_146 _endpos_s_ _startpos_s_ s in
        _menhir_goto_s_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_006 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_159 _endpos_s_ _startpos_s_ s in
        _menhir_goto_spec_constant _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_s_ _v _menhir_s _tok
    
    and _menhir_goto_spec_constant : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState443 ->
            _menhir_run_491 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState483 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState475 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState472 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState466 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState460 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState451 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState434 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState393 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState352 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState319 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState231 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState216 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState084 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState168 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState169 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState162 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState159 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState153 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState141 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState135 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState109 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState121 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState004 ->
            _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState437 ->
            _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState322 ->
            _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState007 ->
            _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState054 ->
            _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState018 ->
            _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_491 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_term) _menhir_state -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let c = _v in
        let _v = _menhir_action_160 c in
        _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_term : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState443 ->
            _menhir_run_490 _menhir_stack _v
        | MenhirState475 ->
            _menhir_run_476 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState472 ->
            _menhir_run_473 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState466 ->
            _menhir_run_467 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState460 ->
            _menhir_run_461 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState451 ->
            _menhir_run_452 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState434 ->
            _menhir_run_435 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState319 ->
            _menhir_run_320 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState216 ->
            _menhir_run_217 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState483 ->
            _menhir_run_169 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState393 ->
            _menhir_run_169 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState352 ->
            _menhir_run_169 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState231 ->
            _menhir_run_169 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState084 ->
            _menhir_run_169 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState169 ->
            _menhir_run_169 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState168 ->
            _menhir_run_169 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState162 ->
            _menhir_run_163 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState159 ->
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState153 ->
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState141 ->
            _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState135 ->
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState121 ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState109 ->
            _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_476 : type  ttv_stack. (((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_ATTRIBUTE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_term) _menhir_state -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.KEYWORD _v_0 ->
            _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState476
        | _ ->
            _eRR 476
    
    and _menhir_run_004 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell1_KEYWORD (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            let _startpos_1 = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos_2 = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let (_endpos_v_, _startpos_v_, v) = (_endpos_2, _startpos_1, _v_0) in
            let _v = _menhir_action_005 _endpos_v_ _startpos_v_ v in
            _menhir_goto_attribute_value _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_v_ _v _tok
        | Tokens.STR _v_4 ->
            _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState004
        | Tokens.OPEN ->
            let _startpos_5 = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, MenhirState004, _startpos_5) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UNDERSCORE ->
                _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.SYMBOL _v_6 ->
                _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_6 MenhirState007
            | Tokens.STR _v_7 ->
                _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v_7 MenhirState007
            | Tokens.SET_OPTION ->
                _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.SET_LOGIC ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.SET_INFO ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.RESET_ASSERTIONS ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.RESET ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.PUSH ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.POP ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.PAR ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.OPEN ->
                _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.NUM _v_8 ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v_8 MenhirState007
            | Tokens.MATCH ->
                _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.LET ->
                _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.KEYWORD _v_9 ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _v_9 MenhirState007
            | Tokens.HEX _v_10 ->
                _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v_10 MenhirState007
            | Tokens.GET_VALUE ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.GET_UNSAT_CORE ->
                _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.GET_UNSAT_ASSUMPTIONS ->
                _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.GET_PROOF ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.GET_OPTION ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.GET_MODEL ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.GET_INFO ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.GET_ASSIGNMENT ->
                _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.GET_ASSERTIONS ->
                _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.FORALL ->
                _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.EXIT ->
                _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.EXISTS ->
                _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.ECHO ->
                _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.DEFINE_SORT ->
                _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.DEFINE_FUN_REC ->
                _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.DEFINE_FUNS_REC ->
                _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.DEFINE_FUN ->
                _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.DECLARE_SORT ->
                _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.DECLARE_FUN ->
                _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.DECLARE_DATATYPES ->
                _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.DECLARE_DATATYPE ->
                _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.DECLARE_CONST ->
                _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.DEC _v_11 ->
                _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v_11 MenhirState007
            | Tokens.CHECK_SAT_ASSUMING ->
                _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.CHECK_SAT ->
                _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.BIN _v_12 ->
                _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v_12 MenhirState007
            | Tokens.ATTRIBUTE ->
                _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.ASSERT ->
                _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.AS ->
                _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
            | Tokens.CLOSE ->
                let _v_13 = _menhir_action_061 () in
                _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v_13
            | _ ->
                _eRR 7)
        | Tokens.NUM _v_14 ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v_14 MenhirState004
        | Tokens.HEX _v_15 ->
            _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v_15 MenhirState004
        | Tokens.DEC _v_16 ->
            _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v_16 MenhirState004
        | Tokens.BIN _v_17 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v_17 MenhirState004
        | Tokens.CLOSE | Tokens.KEYWORD _ ->
            let _v = _menhir_action_097 () in
            _menhir_goto_option_attribute_value_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | _ ->
            _eRR 4
    
    and _menhir_goto_attribute_value : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_KEYWORD -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let (_endpos_x_, x) = (_endpos, _v) in
        let _v = _menhir_action_098 x in
        _menhir_goto_option_attribute_value_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _v _tok
    
    and _menhir_goto_option_attribute_value_ : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_KEYWORD -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_KEYWORD (_menhir_stack, _menhir_s, s, _startpos_s_, _endpos_s_) = _menhir_stack in
        let (_endpos_a_, a) = (_endpos, _v) in
        let _v = _menhir_action_003 _endpos_a_ _endpos_s_ _startpos_s_ a s in
        _menhir_goto_attribute _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_attribute : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState476 ->
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState166 ->
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState163 ->
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState338 ->
            _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState332 ->
            _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState070 ->
            _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState003 ->
            _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_166 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.KEYWORD _v_0 ->
            let _menhir_stack = MenhirCell1_attribute (_menhir_stack, _menhir_s, _v) in
            _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState166
        | Tokens.CLOSE ->
            let x = _v in
            let _v = _menhir_action_070 x in
            _menhir_goto_nonempty_list_attribute_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 166
    
    and _menhir_goto_nonempty_list_attribute_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState476 ->
            _menhir_run_477 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState166 ->
            _menhir_run_167 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState163 ->
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_477 : type  ttv_stack. (((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_ATTRIBUTE, _menhir_box_term) _menhir_cell1_term -> _ -> _ -> _ -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let MenhirCell1_term (_menhir_stack, _, f) = _menhir_stack in
        let MenhirCell1_ATTRIBUTE (_menhir_stack, _, _, _) = _menhir_stack in
        let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos__5_, args) = (_endpos, _v) in
        let _v = _menhir_action_167 _endpos__5_ _startpos__1_ args f in
        _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_167 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_attribute -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let MenhirCell1_attribute (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_071 x xs in
        _menhir_goto_nonempty_list_attribute_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_164 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_ATTRIBUTE, ttv_result) _menhir_cell1_term -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell1_term (_menhir_stack, _, f) = _menhir_stack in
        let MenhirCell1_ATTRIBUTE (_menhir_stack, _, _, _) = _menhir_stack in
        let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos__5_, args) = (_endpos, _v) in
        let _v = _menhir_action_167 _endpos__5_ _startpos__1_ args f in
        _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_066 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let a = _v in
        let _v = _menhir_action_038 a in
        _menhir_goto_command_option _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_command_option : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState338 ->
            _menhir_run_339 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState332 ->
            _menhir_run_333 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState070 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState003 ->
            _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_339 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_SET_INFO -> _ -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let MenhirCell1_SET_INFO (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__4_, c) = (_endpos, _v) in
            let _v = _menhir_action_034 _endpos__4_ _startpos__1_ c in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 339
    
    and _menhir_goto_command : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState330 ->
            _menhir_run_442 _menhir_stack _v
        | MenhirState328 ->
            _menhir_run_328 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState000 ->
            _menhir_run_328 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_328 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState328
        | Tokens.EOF ->
            let _v_0 = _menhir_action_057 () in
            _menhir_run_329 _menhir_stack _v_0
        | _ ->
            _eRR 328
    
    and _menhir_run_333 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_SET_OPTION -> _ -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let MenhirCell1_SET_OPTION (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__4_, c) = (_endpos, _v) in
            let _v = _menhir_action_036 _endpos__4_ _startpos__1_ c in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 333
    
    and _menhir_run_071 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_SET_INFO -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_SET_INFO (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__4_, c) = (_endpos, _v) in
            let _v = _menhir_action_034 _endpos__4_ _startpos__1_ c in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 71
    
    and _menhir_run_064 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_SET_OPTION -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_SET_OPTION (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__4_, c) = (_endpos, _v) in
            let _v = _menhir_action_036 _endpos__4_ _startpos__1_ c in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 64
    
    and _menhir_run_010 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_144 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_011 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_143 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_012 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_142 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_013 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_141 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_014 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_140 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_015 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_139 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_016 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_138 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_017 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_114 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_018 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UNDERSCORE ->
            _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.SYMBOL _v ->
            _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState018
        | Tokens.STR _v ->
            _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState018
        | Tokens.SET_OPTION ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.SET_LOGIC ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.SET_INFO ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.RESET_ASSERTIONS ->
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.RESET ->
            _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.PUSH ->
            _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.POP ->
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.PAR ->
            _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.OPEN ->
            _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.NUM _v ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState018
        | Tokens.MATCH ->
            _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.LET ->
            _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.KEYWORD _v ->
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState018
        | Tokens.HEX _v ->
            _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState018
        | Tokens.GET_VALUE ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.GET_UNSAT_CORE ->
            _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.GET_UNSAT_ASSUMPTIONS ->
            _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.GET_PROOF ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.GET_OPTION ->
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.GET_MODEL ->
            _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.GET_INFO ->
            _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.GET_ASSIGNMENT ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.GET_ASSERTIONS ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.FORALL ->
            _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.EXIT ->
            _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.EXISTS ->
            _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.ECHO ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.DEFINE_SORT ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.DEFINE_FUN_REC ->
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.DEFINE_FUNS_REC ->
            _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.DEFINE_FUN ->
            _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.DECLARE_SORT ->
            _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.DECLARE_FUN ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.DECLARE_DATATYPES ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.DECLARE_DATATYPE ->
            _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.DECLARE_CONST ->
            _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.DEC _v ->
            _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState018
        | Tokens.CHECK_SAT_ASSUMING ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.CHECK_SAT ->
            _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.BIN _v ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState018
        | Tokens.ATTRIBUTE ->
            _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.ASSERT ->
            _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.AS ->
            _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState018
        | Tokens.CLOSE ->
            let _v = _menhir_action_061 () in
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _eRR 18
    
    and _menhir_run_019 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_155 _endpos_s_ _startpos_s_ s in
        _menhir_goto_spec_constant _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_s_ _v _menhir_s _tok
    
    and _menhir_run_020 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_113 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_021 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_110 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_022 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_148 _endpos_s_ _startpos_s_ s in
        _menhir_goto_s_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_023 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_157 _endpos_s_ _startpos_s_ s in
        _menhir_goto_spec_constant _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_s_ _v _menhir_s _tok
    
    and _menhir_run_024 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_137 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_025 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_136 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_026 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_135 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_027 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_134 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_028 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_133 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_029 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_132 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_030 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_131 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_031 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_130 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_032 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_129 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_033 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_112 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_034 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_128 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_035 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_111 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_036 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_127 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_037 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_126 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_038 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_124 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_039 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_125 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_040 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_123 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_041 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_122 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_042 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_121 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_043 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_120 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_044 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_119 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_045 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_118 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_046 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_156 _endpos_s_ _startpos_s_ s in
        _menhir_goto_spec_constant _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_s_ _v _menhir_s _tok
    
    and _menhir_run_047 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_117 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_048 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_116 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_049 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_158 _endpos_s_ _startpos_s_ s in
        _menhir_goto_spec_constant _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_s_ _v _menhir_s _tok
    
    and _menhir_run_050 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_108 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_051 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_115 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_052 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_109 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_057 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_OPEN -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos__3_, l) = (_endpos, _v) in
        let _v = _menhir_action_149 _endpos__3_ _startpos__1_ l in
        _menhir_goto_s_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_059 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_KEYWORD, ttv_result) _menhir_cell1_OPEN -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell1_OPEN (_menhir_stack, _, _startpos__1_) = _menhir_stack in
        let (_endpos__3_, l) = (_endpos, _v) in
        let _v = _menhir_action_006 _endpos__3_ _startpos__1_ l in
        _menhir_goto_attribute_value _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _v _tok
    
    and _menhir_run_473 : type  ttv_stack. (((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_EXISTS _menhir_cell0_OPEN, _menhir_box_term) _menhir_cell1_nonempty_list_sorted_var_ _menhir_cell0_CLOSE -> _ -> _ -> _ -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_nonempty_list_sorted_var_ (_menhir_stack, _, l) = _menhir_stack in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_EXISTS (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__7_, t) = (_endpos, _v) in
            let _v = _menhir_action_165 _endpos__7_ _startpos__1_ l t in
            _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 473
    
    and _menhir_run_467 : type  ttv_stack. (((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_FORALL _menhir_cell0_OPEN, _menhir_box_term) _menhir_cell1_nonempty_list_sorted_var_ _menhir_cell0_CLOSE -> _ -> _ -> _ -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_nonempty_list_sorted_var_ (_menhir_stack, _, l) = _menhir_stack in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_FORALL (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__7_, t) = (_endpos, _v) in
            let _v = _menhir_action_164 _endpos__7_ _startpos__1_ l t in
            _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 467
    
    and _menhir_run_461 : type  ttv_stack. (((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_LET _menhir_cell0_OPEN, _menhir_box_term) _menhir_cell1_nonempty_list_var_binding_ _menhir_cell0_CLOSE -> _ -> _ -> _ -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_nonempty_list_var_binding_ (_menhir_stack, _, l) = _menhir_stack in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_LET (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__7_, t) = (_endpos, _v) in
            let _v = _menhir_action_163 _endpos__7_ _startpos__1_ l t in
            _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 461
    
    and _menhir_run_452 : type  ttv_stack. (((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_MATCH as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_term) _menhir_state -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState453 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 453)
        | _ ->
            _eRR 452
    
    and _menhir_run_112 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState112 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
            let _menhir_s = MenhirState114 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SYMBOL _v ->
                _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 114)
        | _ ->
            _eRR 112
    
    and _menhir_run_113 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_101 _endpos_s_ _startpos_s_ s in
        _menhir_goto_pattern_symbol _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_pattern_symbol : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState428 ->
            _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState304 ->
            _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState312 ->
            _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState307 ->
            _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState112 ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState116 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState115 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState114 ->
            _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_310 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let s = _v in
        let _v = _menhir_action_104 s in
        _menhir_goto_prop_symbol _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_prop_symbol : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState428 ->
            _menhir_run_311 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState312 ->
            _menhir_run_311 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState304 ->
            _menhir_run_311 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState307 ->
            _menhir_run_308 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_311 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let s = _v in
        let _v = _menhir_action_102 s in
        _menhir_goto_prop_literal _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_prop_literal : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_prop_literal (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState312
        | Tokens.OPEN ->
            _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState312
        | Tokens.CLOSE ->
            let _v_1 = _menhir_action_059 () in
            _menhir_run_313 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1
        | _ ->
            _eRR 312
    
    and _menhir_run_305 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            let _startpos_0 = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos_0, _v) in
            let _v = _menhir_action_096 _endpos_s_ _startpos_s_ s in
            let _menhir_stack = MenhirCell0_not_symbol (_menhir_stack, _v) in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SYMBOL _v_0 ->
                _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState307
            | _ ->
                _eRR 307)
        | _ ->
            _eRR 305
    
    and _menhir_run_313 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_prop_literal -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_prop_literal (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_060 x xs in
        _menhir_goto_list_prop_literal_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_goto_list_prop_literal_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState428 ->
            _menhir_run_429 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState304 ->
            _menhir_run_314 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState312 ->
            _menhir_run_313 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_429 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_CHECK_SAT_ASSUMING _menhir_cell0_OPEN -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_CHECK_SAT_ASSUMING (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (l, _endpos__6_) = (_v, _endpos_0) in
            let _v = _menhir_action_009 _endpos__6_ _startpos__1_ l in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 430
    
    and _menhir_run_314 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_CHECK_SAT_ASSUMING _menhir_cell0_OPEN -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_CHECK_SAT_ASSUMING (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (l, _endpos__6_) = (_v, _endpos_0) in
            let _v = _menhir_action_009 _endpos__6_ _startpos__1_ l in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 315
    
    and _menhir_run_308 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_OPEN _menhir_cell0_not_symbol -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_not_symbol (_menhir_stack, f) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (s, _endpos__4_) = (_v, _endpos) in
            let _v = _menhir_action_103 _endpos__4_ _startpos__1_ f s in
            _menhir_goto_prop_literal _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 308
    
    and _menhir_run_120 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let c = _v in
        let _v = _menhir_action_099 c in
        _menhir_goto_pattern _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_pattern : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_pattern (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState121
        | Tokens.STR _v_1 ->
            _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState121
        | Tokens.OPEN ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
        | Tokens.NUM _v_2 ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState121
        | Tokens.HEX _v_3 ->
            _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState121
        | Tokens.DEC _v_4 ->
            _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState121
        | Tokens.BIN _v_5 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState121
        | _ ->
            _eRR 121
    
    and _menhir_run_085 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_047 s in
        _menhir_goto_identifier _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_s_ _startpos_s_ _v _menhir_s _tok
    
    and _menhir_goto_identifier : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState443 ->
            _menhir_run_493 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState479 ->
            _menhir_run_480 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState446 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState483 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState475 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState472 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState466 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState460 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState451 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState434 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState393 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState352 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState319 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState231 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState216 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState084 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState086 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState168 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState169 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState162 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState159 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState153 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState141 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState135 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState109 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState121 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState480 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState424 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState406 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState408 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState383 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState300 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState274 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState246 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState250 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState247 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState226 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState215 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState206 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState147 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState099 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState101 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState102 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState100 ->
            _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState097 ->
            _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_493 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_term) _menhir_state -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_105 _endpos_s_ _startpos_s_ s in
        _menhir_goto_qual_identifier _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_qual_identifier : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState443 ->
            _menhir_run_492 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState446 ->
            _menhir_run_483 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState086 ->
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState483 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState475 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState472 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState466 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState460 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState451 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState434 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState393 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState352 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState319 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState231 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState216 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState084 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState168 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState169 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState162 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState159 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState153 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState141 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState135 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState109 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState121 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_492 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_term) _menhir_state -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let s = _v in
        let _v = _menhir_action_161 s in
        _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_483 : type  ttv_stack. ((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_term) _menhir_state -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_qual_identifier (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState483
        | Tokens.STR _v_1 ->
            _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState483
        | Tokens.OPEN ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState483
        | Tokens.NUM _v_2 ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState483
        | Tokens.HEX _v_3 ->
            _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState483
        | Tokens.DEC _v_4 ->
            _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState483
        | Tokens.BIN _v_5 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState483
        | _ ->
            _eRR 483
    
    and _menhir_run_086 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState086 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UNDERSCORE ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.SYMBOL _v ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell1_MATCH (_menhir_stack, _menhir_s, _startpos, _endpos) in
            let _menhir_s = MenhirState109 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SYMBOL _v ->
                _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.STR _v ->
                _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.OPEN ->
                _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NUM _v ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.HEX _v ->
                _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DEC _v ->
                _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.BIN _v ->
                _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 109)
        | Tokens.LET ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell1_LET (_menhir_stack, _menhir_s, _startpos, _endpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
                let _menhir_s = MenhirState133 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.OPEN ->
                    _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | _ ->
                    _eRR 133)
            | _ ->
                _eRR 132)
        | Tokens.FORALL ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell1_FORALL (_menhir_stack, _menhir_s, _startpos, _endpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
                let _menhir_s = MenhirState145 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.OPEN ->
                    _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | _ ->
                    _eRR 145)
            | _ ->
                _eRR 144)
        | Tokens.EXISTS ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell1_EXISTS (_menhir_stack, _menhir_s, _startpos, _endpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
                let _menhir_s = MenhirState157 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.OPEN ->
                    _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | _ ->
                    _eRR 157)
            | _ ->
                _eRR 156)
        | Tokens.ATTRIBUTE ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell1_ATTRIBUTE (_menhir_stack, _menhir_s, _startpos, _endpos) in
            let _menhir_s = MenhirState162 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SYMBOL _v ->
                _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.STR _v ->
                _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.OPEN ->
                _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NUM _v ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.HEX _v ->
                _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DEC _v ->
                _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.BIN _v ->
                _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 162)
        | Tokens.AS ->
            _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 86
    
    and _menhir_run_087 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell1_UNDERSCORE (_menhir_stack, _menhir_s, _startpos, _endpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell0_SYMBOL (_menhir_stack, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState088 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SYMBOL _v ->
                _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NUM _v ->
                _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.HEX _v ->
                _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 88)
        | _ ->
            _eRR 87
    
    and _menhir_run_089 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        let s = _v in
        let _v = _menhir_action_050 s in
        _menhir_goto_index _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_index : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            let _menhir_stack = MenhirCell1_index (_menhir_stack, _menhir_s, _v) in
            _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState094
        | Tokens.NUM _v_1 ->
            let _menhir_stack = MenhirCell1_index (_menhir_stack, _menhir_s, _v) in
            _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState094
        | Tokens.HEX _v_2 ->
            let _menhir_stack = MenhirCell1_index (_menhir_stack, _menhir_s, _v) in
            _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState094
        | Tokens.CLOSE ->
            let x = _v in
            let _v = _menhir_action_080 x in
            _menhir_goto_nonempty_list_index_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 94
    
    and _menhir_run_090 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        let s = _v in
        let _v = _menhir_action_049 s in
        _menhir_goto_index _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_091 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        let s = _v in
        let _v = _menhir_action_051 s in
        _menhir_goto_index _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_nonempty_list_index_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState448 ->
            _menhir_run_449 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState094 ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState088 ->
            _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_449 : type  ttv_stack. ((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_UNDERSCORE _menhir_cell0_SYMBOL -> _ -> _ -> _ -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let MenhirCell0_SYMBOL (_menhir_stack, s, _, _) = _menhir_stack in
        let MenhirCell1_UNDERSCORE (_menhir_stack, _, _, _) = _menhir_stack in
        let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (l, _endpos__5_) = (_v, _endpos) in
        let _v = _menhir_action_048 l s in
        _menhir_goto_identifier _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__5_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_095 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_index -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let MenhirCell1_index (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_081 x xs in
        _menhir_goto_nonempty_list_index_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_092 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_UNDERSCORE _menhir_cell0_SYMBOL -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell0_SYMBOL (_menhir_stack, s, _, _) = _menhir_stack in
        let MenhirCell1_UNDERSCORE (_menhir_stack, _, _, _) = _menhir_stack in
        let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (l, _endpos__5_) = (_v, _endpos) in
        let _v = _menhir_action_048 l s in
        _menhir_goto_identifier _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__5_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_096 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState096 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UNDERSCORE ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.AS ->
            _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 96
    
    and _menhir_run_097 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell1_AS (_menhir_stack, _menhir_s, _startpos, _endpos) in
        let _menhir_s = MenhirState097 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 97
    
    and _menhir_run_098 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState098 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UNDERSCORE ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 98
    
    and _menhir_run_134 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell0_SYMBOL (_menhir_stack, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState135 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SYMBOL _v ->
                _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.STR _v ->
                _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.OPEN ->
                _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NUM _v ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.HEX _v ->
                _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DEC _v ->
                _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.BIN _v ->
                _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 135)
        | _ ->
            _eRR 134
    
    and _menhir_run_146 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell0_SYMBOL (_menhir_stack, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState147 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SYMBOL _v ->
                _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.OPEN ->
                _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 147)
        | _ ->
            _eRR 146
    
    and _menhir_run_100 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState100 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UNDERSCORE ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.SYMBOL _v ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 100
    
    and _menhir_run_168 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_qual_identifier (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState168
        | Tokens.STR _v_1 ->
            _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState168
        | Tokens.OPEN ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState168
        | Tokens.NUM _v_2 ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState168
        | Tokens.HEX _v_3 ->
            _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState168
        | Tokens.DEC _v_4 ->
            _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState168
        | Tokens.BIN _v_5 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState168
        | _ ->
            _eRR 168
    
    and _menhir_run_125 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let s = _v in
        let _v = _menhir_action_161 s in
        _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_480 : type  ttv_stack. (((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_AS as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_term) _menhir_state -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_identifier (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState480
        | Tokens.OPEN ->
            _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState480
        | _ ->
            _eRR 480
    
    and _menhir_run_126 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_105 _endpos_s_ _startpos_s_ s in
        _menhir_goto_qual_identifier _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_104 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_151 _endpos_s_ _startpos_s_ s in
        _menhir_goto_sort _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_sort : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState480 ->
            _menhir_run_481 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState424 ->
            _menhir_run_425 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState408 ->
            _menhir_run_409 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState383 ->
            _menhir_run_384 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState300 ->
            _menhir_run_301 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState274 ->
            _menhir_run_275 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState250 ->
            _menhir_run_251 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState406 ->
            _menhir_run_247 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState247 ->
            _menhir_run_247 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState246 ->
            _menhir_run_247 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState226 ->
            _menhir_run_227 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState215 ->
            _menhir_run_216 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState206 ->
            _menhir_run_207 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState147 ->
            _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState099 ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState102 ->
            _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState101 ->
            _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_481 : type  ttv_stack. (((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_AS, _menhir_box_term) _menhir_cell1_identifier -> _ -> _ -> _ -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let MenhirCell1_identifier (_menhir_stack, _, s, _startpos_s_, _endpos_s_) = _menhir_stack in
            let MenhirCell1_AS (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__5_, ty) = (_endpos, _v) in
            let _v = _menhir_action_106 _endpos__5_ _endpos_s_ _startpos__1_ _startpos_s_ s ty in
            _menhir_goto_qual_identifier _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 481
    
    and _menhir_run_425 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DECLARE_CONST _menhir_cell0_SYMBOL -> _ -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let MenhirCell0_SYMBOL (_menhir_stack, s, _, _) = _menhir_stack in
            let MenhirCell1_DECLARE_CONST (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__5_, ty) = (_endpos, _v) in
            let _v = _menhir_action_010 _endpos__5_ _startpos__1_ s ty in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 425
    
    and _menhir_run_409 : type  ttv_stack. (((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DECLARE_FUN _menhir_cell0_SYMBOL _menhir_cell0_OPEN, _menhir_box_input) _menhir_cell1_list_sort_ _menhir_cell0_CLOSE -> _ -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_list_sort_ (_menhir_stack, _, args) = _menhir_stack in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell0_SYMBOL (_menhir_stack, s, _, _) = _menhir_stack in
            let MenhirCell1_DECLARE_FUN (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (ty, _endpos__8_) = (_v, _endpos) in
            let _v = _menhir_action_013 _endpos__8_ _startpos__1_ args s ty in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 409
    
    and _menhir_run_384 : type  ttv_stack. (((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DEFINE_SORT _menhir_cell0_SYMBOL _menhir_cell0_OPEN, _menhir_box_input) _menhir_cell1_list_SYMBOL_ _menhir_cell0_CLOSE -> _ -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_list_SYMBOL_ (_menhir_stack, _, args) = _menhir_stack in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell0_SYMBOL (_menhir_stack, s, _, _) = _menhir_stack in
            let MenhirCell1_DEFINE_SORT (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (ty, _endpos__8_) = (_v, _endpos) in
            let _v = _menhir_action_018 _endpos__8_ _startpos__1_ args s ty in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 384
    
    and _menhir_run_301 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DECLARE_CONST _menhir_cell0_SYMBOL -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_SYMBOL (_menhir_stack, s, _, _) = _menhir_stack in
            let MenhirCell1_DECLARE_CONST (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__5_, ty) = (_endpos, _v) in
            let _v = _menhir_action_010 _endpos__5_ _startpos__1_ s ty in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 301
    
    and _menhir_run_275 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_OPEN _menhir_cell0_SYMBOL -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_SYMBOL (_menhir_stack, s, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__4_, ty) = (_endpos, _v) in
            let _v = _menhir_action_150 _endpos__4_ _startpos__1_ s ty in
            let _menhir_stack = MenhirCell1_selector_dec (_menhir_stack, _menhir_s, _v) in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                _menhir_run_273 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState277
            | Tokens.CLOSE ->
                let _v_0 = _menhir_action_063 () in
                _menhir_run_278 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
            | _ ->
                _eRR 277)
        | _ ->
            _eRR 275
    
    and _menhir_run_273 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell0_SYMBOL (_menhir_stack, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState274 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SYMBOL _v ->
                _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.OPEN ->
                _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 274)
        | _ ->
            _eRR 273
    
    and _menhir_run_278 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_selector_dec -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_selector_dec (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_064 x xs in
        _menhir_goto_list_selector_dec_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_goto_list_selector_dec_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState272 ->
            _menhir_run_279 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState277 ->
            _menhir_run_278 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_279 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_OPEN _menhir_cell0_SYMBOL -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell0_SYMBOL (_menhir_stack, s, _, _) = _menhir_stack in
        let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _) = _menhir_stack in
        let l = _v in
        let _v = _menhir_action_039 l s in
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            let _menhir_stack = MenhirCell1_constructor_dec (_menhir_stack, _menhir_s, _v) in
            _menhir_run_271 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState284
        | Tokens.CLOSE ->
            let x = _v in
            let _v = _menhir_action_072 x in
            _menhir_goto_nonempty_list_constructor_dec_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 284
    
    and _menhir_run_271 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            let _startpos_0 = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell0_SYMBOL (_menhir_stack, _v, _startpos_0, _endpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                _menhir_run_273 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState272
            | Tokens.CLOSE ->
                let _v_1 = _menhir_action_063 () in
                _menhir_run_279 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1
            | _ ->
                _eRR 272)
        | _ ->
            _eRR 271
    
    and _menhir_goto_nonempty_list_constructor_dec_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState264 ->
            _menhir_run_288 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState284 ->
            _menhir_run_285 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState270 ->
            _menhir_run_281 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_288 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_OPEN -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _) = _menhir_stack in
        let l = _v in
        let _v = _menhir_action_040 l in
        _menhir_goto_datatype_dec _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_datatype_dec : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState420 ->
            _menhir_run_421 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState296 ->
            _menhir_run_297 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState415 ->
            _menhir_run_293 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState293 ->
            _menhir_run_293 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState263 ->
            _menhir_run_293 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_421 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DECLARE_DATATYPE _menhir_cell0_SYMBOL -> _ -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let MenhirCell0_SYMBOL (_menhir_stack, s, _, _) = _menhir_stack in
            let MenhirCell1_DECLARE_DATATYPE (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__5_, d) = (_endpos, _v) in
            let _v = _menhir_action_011 _endpos__5_ _startpos__1_ d s in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 421
    
    and _menhir_run_297 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DECLARE_DATATYPE _menhir_cell0_SYMBOL -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_SYMBOL (_menhir_stack, s, _, _) = _menhir_stack in
            let MenhirCell1_DECLARE_DATATYPE (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__5_, d) = (_endpos, _v) in
            let _v = _menhir_action_011 _endpos__5_ _startpos__1_ d s in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 297
    
    and _menhir_run_293 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            let _menhir_stack = MenhirCell1_datatype_dec (_menhir_stack, _menhir_s, _v) in
            _menhir_run_264 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState293
        | Tokens.CLOSE ->
            let x = _v in
            let _v = _menhir_action_074 x in
            _menhir_goto_nonempty_list_datatype_dec_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 293
    
    and _menhir_run_264 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState264 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.PAR ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell1_PAR (_menhir_stack, _menhir_s, _startpos, _endpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
                let _menhir_s = MenhirState266 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SYMBOL _v ->
                    _menhir_run_267 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | _ ->
                    _eRR 266)
            | _ ->
                _eRR 265)
        | Tokens.OPEN ->
            _menhir_run_271 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 264
    
    and _menhir_run_267 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_042 _endpos_s_ _startpos_s_ s in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            let _menhir_stack = MenhirCell1_datatype_symbol (_menhir_stack, _menhir_s, _v) in
            _menhir_run_267 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState286
        | Tokens.CLOSE ->
            let x = _v in
            let _v = _menhir_action_076 x in
            _menhir_goto_nonempty_list_datatype_symbol_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 286
    
    and _menhir_goto_nonempty_list_datatype_symbol_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState286 ->
            _menhir_run_287 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState266 ->
            _menhir_run_268 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_287 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_datatype_symbol -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_datatype_symbol (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_077 x xs in
        _menhir_goto_nonempty_list_datatype_symbol_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_268 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_PAR _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_nonempty_list_datatype_symbol_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState270 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                _menhir_run_271 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 270)
        | _ ->
            _eRR 269
    
    and _menhir_goto_nonempty_list_datatype_dec_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState415 ->
            _menhir_run_416 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState293 ->
            _menhir_run_294 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState263 ->
            _menhir_run_290 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_416 : type  ttv_stack. (((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DECLARE_DATATYPES _menhir_cell0_OPEN, _menhir_box_input) _menhir_cell1_nonempty_list_sort_dec_ _menhir_cell0_CLOSE _menhir_cell0_OPEN -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_nonempty_list_sort_dec_ (_menhir_stack, _, l1) = _menhir_stack in
            let MenhirCell0_OPEN (_menhir_stack, _startpos__3_) = _menhir_stack in
            let MenhirCell1_DECLARE_DATATYPES (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__8_, _endpos__9_, l2) = (_endpos, _endpos_0, _v) in
            let _v = _menhir_action_012 _endpos__8_ _endpos__9_ _startpos__1_ _startpos__3_ l1 l2 in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 417
    
    and _menhir_run_294 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_datatype_dec -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_datatype_dec (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_075 x xs in
        _menhir_goto_nonempty_list_datatype_dec_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_290 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DECLARE_DATATYPES _menhir_cell0_OPEN, _menhir_box_file) _menhir_cell1_nonempty_list_sort_dec_ _menhir_cell0_CLOSE _menhir_cell0_OPEN -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_nonempty_list_sort_dec_ (_menhir_stack, _, l1) = _menhir_stack in
            let MenhirCell0_OPEN (_menhir_stack, _startpos__3_) = _menhir_stack in
            let MenhirCell1_DECLARE_DATATYPES (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__8_, _endpos__9_, l2) = (_endpos, _endpos_0, _v) in
            let _v = _menhir_action_012 _endpos__8_ _endpos__9_ _startpos__1_ _startpos__3_ l1 l2 in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 291
    
    and _menhir_run_285 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_constructor_dec -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_constructor_dec (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_073 x xs in
        _menhir_goto_nonempty_list_constructor_dec_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_281 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_PAR _menhir_cell0_OPEN, ttv_result) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE _menhir_cell0_OPEN -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_nonempty_list_datatype_symbol_ (_menhir_stack, _, vars) = _menhir_stack in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_PAR (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _) = _menhir_stack in
            let l = _v in
            let _v = _menhir_action_041 l vars in
            _menhir_goto_datatype_dec _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 282
    
    and _menhir_run_251 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DECLARE_FUN _menhir_cell0_SYMBOL _menhir_cell0_OPEN, _menhir_box_file) _menhir_cell1_list_sort_ _menhir_cell0_CLOSE -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_list_sort_ (_menhir_stack, _, args) = _menhir_stack in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell0_SYMBOL (_menhir_stack, s, _, _) = _menhir_stack in
            let MenhirCell1_DECLARE_FUN (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (ty, _endpos__8_) = (_v, _endpos) in
            let _v = _menhir_action_013 _endpos__8_ _startpos__1_ args s ty in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 251
    
    and _menhir_run_247 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_sort (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState247
        | Tokens.OPEN ->
            _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState247
        | Tokens.CLOSE ->
            let _v_1 = _menhir_action_065 () in
            _menhir_run_248 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1
        | _ ->
            _eRR 247
    
    and _menhir_run_248 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_sort -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_sort (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_066 x xs in
        _menhir_goto_list_sort_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_goto_list_sort_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState406 ->
            _menhir_run_407 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState246 ->
            _menhir_run_249 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState247 ->
            _menhir_run_248 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_407 : type  ttv_stack. (((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DECLARE_FUN _menhir_cell0_SYMBOL _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_list_sort_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState408 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 408
    
    and _menhir_run_249 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DECLARE_FUN _menhir_cell0_SYMBOL _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_list_sort_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState250 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 250
    
    and _menhir_run_227 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN _menhir_cell0_SYMBOL _menhir_cell0_OPEN, ttv_result) _menhir_cell1_list_sorted_var_ _menhir_cell0_CLOSE -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_list_sorted_var_ (_menhir_stack, _, args) = _menhir_stack in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell0_SYMBOL (_menhir_stack, s, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _) = _menhir_stack in
            let ret = _v in
            let _v = _menhir_action_045 args ret s in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                let _menhir_stack = MenhirCell1_function_dec (_menhir_stack, _menhir_s, _v) in
                _menhir_run_222 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState235
            | Tokens.CLOSE ->
                let x = _v in
                let _v = _menhir_action_078 x in
                _menhir_goto_nonempty_list_function_dec_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 235)
        | _ ->
            _eRR 227
    
    and _menhir_run_222 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            let _startpos_0 = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell0_SYMBOL (_menhir_stack, _v, _startpos_0, _endpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                let _startpos_1 = _menhir_lexbuf.Lexing.lex_start_p in
                let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos_1) in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.OPEN ->
                    _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState224
                | Tokens.CLOSE ->
                    let _v_2 = _menhir_action_067 () in
                    _menhir_run_225 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState224
                | _ ->
                    _eRR 224)
            | _ ->
                _eRR 223)
        | _ ->
            _eRR 222
    
    and _menhir_run_225 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN _menhir_cell0_SYMBOL _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_list_sorted_var_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState226 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 226
    
    and _menhir_goto_nonempty_list_function_dec_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState390 ->
            _menhir_run_391 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState235 ->
            _menhir_run_236 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState221 ->
            _menhir_run_229 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_391 : type  ttv_stack. (((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DEFINE_FUNS_REC _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_nonempty_list_function_dec_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState393 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SYMBOL _v ->
                _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.STR _v ->
                _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.OPEN ->
                _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NUM _v ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.HEX _v ->
                _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DEC _v ->
                _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.BIN _v ->
                _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 393)
        | _ ->
            _eRR 392
    
    and _menhir_run_236 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_function_dec -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_function_dec (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_079 x xs in
        _menhir_goto_nonempty_list_function_dec_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_229 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DEFINE_FUNS_REC _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_nonempty_list_function_dec_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState231 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SYMBOL _v ->
                _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.STR _v ->
                _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.OPEN ->
                _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NUM _v ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.HEX _v ->
                _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DEC _v ->
                _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.BIN _v ->
                _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 231)
        | _ ->
            _eRR 230
    
    and _menhir_run_216 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_SYMBOL _menhir_cell0_OPEN, ttv_result) _menhir_cell1_list_sorted_var_ _menhir_cell0_CLOSE as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_sort (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState216
        | Tokens.STR _v_1 ->
            _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState216
        | Tokens.OPEN ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState216
        | Tokens.NUM _v_2 ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState216
        | Tokens.HEX _v_3 ->
            _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState216
        | Tokens.DEC _v_4 ->
            _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState216
        | Tokens.BIN _v_5 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState216
        | _ ->
            _eRR 216
    
    and _menhir_run_207 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DEFINE_SORT _menhir_cell0_SYMBOL _menhir_cell0_OPEN, _menhir_box_file) _menhir_cell1_list_SYMBOL_ _menhir_cell0_CLOSE -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_list_SYMBOL_ (_menhir_stack, _, args) = _menhir_stack in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell0_SYMBOL (_menhir_stack, s, _, _) = _menhir_stack in
            let MenhirCell1_DEFINE_SORT (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (ty, _endpos__8_) = (_v, _endpos) in
            let _v = _menhir_action_018 _endpos__8_ _startpos__1_ args s ty in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 207
    
    and _menhir_run_148 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_OPEN _menhir_cell0_SYMBOL -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_SYMBOL (_menhir_stack, s, _startpos_s_, _endpos_s_) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__4_, ty) = (_endpos, _v) in
            let _v = _menhir_action_154 _endpos__4_ _endpos_s_ _startpos__1_ _startpos_s_ s ty in
            _menhir_goto_sorted_var _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 148
    
    and _menhir_goto_sorted_var : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState224 ->
            _menhir_run_212 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState212 ->
            _menhir_run_212 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState211 ->
            _menhir_run_212 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState470 ->
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState464 ->
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState157 ->
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState150 ->
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState145 ->
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_212 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_sorted_var (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState212
        | Tokens.CLOSE ->
            let _v_0 = _menhir_action_067 () in
            _menhir_run_213 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
        | _ ->
            _eRR 212
    
    and _menhir_run_213 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_sorted_var -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_sorted_var (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_068 x xs in
        _menhir_goto_list_sorted_var_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_goto_list_sorted_var_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState224 ->
            _menhir_run_225 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState211 ->
            _menhir_run_214 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState212 ->
            _menhir_run_213 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_214 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_SYMBOL _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_list_sorted_var_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState215 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 215
    
    and _menhir_run_150 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            let _menhir_stack = MenhirCell1_sorted_var (_menhir_stack, _menhir_s, _v) in
            _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState150
        | Tokens.CLOSE ->
            let x = _v in
            let _v = _menhir_action_090 x in
            _menhir_goto_nonempty_list_sorted_var_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 150
    
    and _menhir_goto_nonempty_list_sorted_var_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState470 ->
            _menhir_run_471 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState464 ->
            _menhir_run_465 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState157 ->
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState145 ->
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState150 ->
            _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_471 : type  ttv_stack. (((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_EXISTS _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_term) _menhir_state -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_nonempty_list_sorted_var_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState472 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.STR _v ->
            _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.NUM _v ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEX _v ->
            _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DEC _v ->
            _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.BIN _v ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 472
    
    and _menhir_run_465 : type  ttv_stack. (((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_FORALL _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_term) _menhir_state -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_nonempty_list_sorted_var_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState466 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.STR _v ->
            _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.NUM _v ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEX _v ->
            _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DEC _v ->
            _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.BIN _v ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 466
    
    and _menhir_run_158 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_EXISTS _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_nonempty_list_sorted_var_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState159 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.STR _v ->
            _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.NUM _v ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEX _v ->
            _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DEC _v ->
            _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.BIN _v ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 159
    
    and _menhir_run_152 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_FORALL _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_nonempty_list_sorted_var_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState153 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.STR _v ->
            _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.NUM _v ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEX _v ->
            _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DEC _v ->
            _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.BIN _v ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 153
    
    and _menhir_run_151 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_sorted_var -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_sorted_var (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_091 x xs in
        _menhir_goto_nonempty_list_sorted_var_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_107 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_AS, ttv_result) _menhir_cell1_identifier -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_identifier (_menhir_stack, _, s, _startpos_s_, _endpos_s_) = _menhir_stack in
            let MenhirCell1_AS (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__5_, ty) = (_endpos, _v) in
            let _v = _menhir_action_106 _endpos__5_ _endpos_s_ _startpos__1_ _startpos_s_ s ty in
            _menhir_goto_qual_identifier _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 107
    
    and _menhir_run_102 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            let _menhir_stack = MenhirCell1_sort (_menhir_stack, _menhir_s, _v) in
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState102
        | Tokens.OPEN ->
            let _menhir_stack = MenhirCell1_sort (_menhir_stack, _menhir_s, _v) in
            _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState102
        | Tokens.CLOSE ->
            let x = _v in
            let _v = _menhir_action_086 x in
            _menhir_goto_nonempty_list_sort_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 102
    
    and _menhir_goto_nonempty_list_sort_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState101 ->
            _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState102 ->
            _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_105 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_identifier -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell1_identifier (_menhir_stack, _, f, _startpos_f_, _endpos_f_) = _menhir_stack in
        let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos__4_, args) = (_endpos, _v) in
        let _v = _menhir_action_152 _endpos__4_ _endpos_f_ _startpos__1_ _startpos_f_ args f in
        _menhir_goto_sort _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_103 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_sort -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_sort (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_087 x xs in
        _menhir_goto_nonempty_list_sort_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_101 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_identifier (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState101
        | Tokens.OPEN ->
            _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
        | _ ->
            _eRR 101
    
    and _menhir_run_099 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_AS as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_identifier (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState099
        | Tokens.OPEN ->
            _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState099
        | _ ->
            _eRR 99
    
    and _menhir_run_116 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_pattern_symbol as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            let _menhir_stack = MenhirCell1_pattern_symbol (_menhir_stack, _menhir_s, _v) in
            _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState116
        | Tokens.CLOSE ->
            let x = _v in
            let _v = _menhir_action_084 x in
            _menhir_goto_nonempty_list_pattern_symbol_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 116
    
    and _menhir_goto_nonempty_list_pattern_symbol_ : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_pattern_symbol as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState115 ->
            _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState116 ->
            _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_118 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_pattern_symbol -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell1_pattern_symbol (_menhir_stack, _, f) = _menhir_stack in
        let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos__4_, args) = (_endpos, _v) in
        let _v = _menhir_action_100 _endpos__4_ _startpos__1_ args f in
        _menhir_goto_pattern _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_117 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_pattern_symbol, ttv_result) _menhir_cell1_pattern_symbol -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_pattern_symbol (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_085 x xs in
        _menhir_goto_nonempty_list_pattern_symbol_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_115 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_pattern_symbol (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState115
        | _ ->
            _eRR 115
    
    and _menhir_run_435 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_ASSERT -> _ -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let MenhirCell1_ASSERT (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__4_, t) = (_endpos, _v) in
            let _v = _menhir_action_007 _endpos__4_ _startpos__1_ t in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 435
    
    and _menhir_run_320 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_ASSERT -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_ASSERT (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__4_, t) = (_endpos, _v) in
            let _v = _menhir_action_007 _endpos__4_ _startpos__1_ t in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 320
    
    and _menhir_run_217 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_SYMBOL _menhir_cell0_OPEN, ttv_result) _menhir_cell1_list_sorted_var_ _menhir_cell0_CLOSE, ttv_result) _menhir_cell1_sort -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let MenhirCell1_sort (_menhir_stack, _, ret) = _menhir_stack in
        let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_list_sorted_var_ (_menhir_stack, _, args) = _menhir_stack in
        let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_SYMBOL (_menhir_stack, _menhir_s, s, _, _) = _menhir_stack in
        let body = _v in
        let _v = _menhir_action_046 args body ret s in
        _menhir_goto_function_def _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_function_def : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState397 ->
            _menhir_run_398 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState386 ->
            _menhir_run_387 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState237 ->
            _menhir_run_238 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState209 ->
            _menhir_run_218 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_398 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DEFINE_FUN -> _ -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let MenhirCell1_DEFINE_FUN (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__4_, f) = (_endpos, _v) in
            let _v = _menhir_action_015 _endpos__4_ _startpos__1_ f in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 398
    
    and _menhir_run_387 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DEFINE_FUN_REC -> _ -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let MenhirCell1_DEFINE_FUN_REC (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__4_, f) = (_endpos, _v) in
            let _v = _menhir_action_016 _endpos__4_ _startpos__1_ f in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 387
    
    and _menhir_run_238 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DEFINE_FUN -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_DEFINE_FUN (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__4_, f) = (_endpos, _v) in
            let _v = _menhir_action_015 _endpos__4_ _startpos__1_ f in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 238
    
    and _menhir_run_218 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DEFINE_FUN_REC -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_DEFINE_FUN_REC (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__4_, f) = (_endpos, _v) in
            let _v = _menhir_action_016 _endpos__4_ _startpos__1_ f in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 218
    
    and _menhir_run_169 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState169
        | Tokens.STR _v_1 ->
            let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
            _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState169
        | Tokens.OPEN ->
            let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState169
        | Tokens.NUM _v_2 ->
            let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState169
        | Tokens.HEX _v_3 ->
            let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
            _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState169
        | Tokens.DEC _v_4 ->
            let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
            _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState169
        | Tokens.BIN _v_5 ->
            let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState169
        | Tokens.CLOSE ->
            let x = _v in
            let _v = _menhir_action_092 x in
            _menhir_goto_nonempty_list_term_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 169
    
    and _menhir_goto_nonempty_list_term_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState483 ->
            _menhir_run_484 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState393 ->
            _menhir_run_394 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState352 ->
            _menhir_run_353 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState231 ->
            _menhir_run_232 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState084 ->
            _menhir_run_173 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState168 ->
            _menhir_run_171 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState169 ->
            _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_484 : type  ttv_stack. ((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_qual_identifier -> _ -> _ -> _ -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let MenhirCell1_qual_identifier (_menhir_stack, _, s) = _menhir_stack in
        let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos__4_, args) = (_endpos, _v) in
        let _v = _menhir_action_162 _endpos__4_ _startpos__1_ args s in
        _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_394 : type  ttv_stack. (((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DEFINE_FUNS_REC _menhir_cell0_OPEN, _menhir_box_input) _menhir_cell1_nonempty_list_function_dec_ _menhir_cell0_CLOSE _menhir_cell0_OPEN -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_nonempty_list_function_dec_ (_menhir_stack, _, l1) = _menhir_stack in
            let MenhirCell0_OPEN (_menhir_stack, _startpos__3_) = _menhir_stack in
            let MenhirCell1_DEFINE_FUNS_REC (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__8_, _endpos__9_, l2) = (_endpos, _endpos_0, _v) in
            let _v = _menhir_action_017 _endpos__8_ _endpos__9_ _startpos__1_ _startpos__3_ l1 l2 in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 395
    
    and _menhir_run_353 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_GET_VALUE _menhir_cell0_OPEN -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_GET_VALUE (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (l, _endpos__6_) = (_v, _endpos_0) in
            let _v = _menhir_action_029 _endpos__6_ _startpos__1_ l in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 354
    
    and _menhir_run_232 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DEFINE_FUNS_REC _menhir_cell0_OPEN, _menhir_box_file) _menhir_cell1_nonempty_list_function_dec_ _menhir_cell0_CLOSE _menhir_cell0_OPEN -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_nonempty_list_function_dec_ (_menhir_stack, _, l1) = _menhir_stack in
            let MenhirCell0_OPEN (_menhir_stack, _startpos__3_) = _menhir_stack in
            let MenhirCell1_DEFINE_FUNS_REC (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__8_, _endpos__9_, l2) = (_endpos, _endpos_0, _v) in
            let _v = _menhir_action_017 _endpos__8_ _endpos__9_ _startpos__1_ _startpos__3_ l1 l2 in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 233
    
    and _menhir_run_173 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_GET_VALUE _menhir_cell0_OPEN -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_GET_VALUE (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (l, _endpos__6_) = (_v, _endpos_0) in
            let _v = _menhir_action_029 _endpos__6_ _startpos__1_ l in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 174
    
    and _menhir_run_171 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_qual_identifier -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell1_qual_identifier (_menhir_stack, _, s) = _menhir_stack in
        let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos__4_, args) = (_endpos, _v) in
        let _v = _menhir_action_162 _endpos__4_ _startpos__1_ args s in
        _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_170 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_term -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let MenhirCell1_term (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_093 x xs in
        _menhir_goto_nonempty_list_term_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_163 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_ATTRIBUTE as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.KEYWORD _v_0 ->
            _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState163
        | _ ->
            _eRR 163
    
    and _menhir_run_160 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_EXISTS _menhir_cell0_OPEN, ttv_result) _menhir_cell1_nonempty_list_sorted_var_ _menhir_cell0_CLOSE -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_nonempty_list_sorted_var_ (_menhir_stack, _, l) = _menhir_stack in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_EXISTS (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__7_, t) = (_endpos, _v) in
            let _v = _menhir_action_165 _endpos__7_ _startpos__1_ l t in
            _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 160
    
    and _menhir_run_154 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_FORALL _menhir_cell0_OPEN, ttv_result) _menhir_cell1_nonempty_list_sorted_var_ _menhir_cell0_CLOSE -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_nonempty_list_sorted_var_ (_menhir_stack, _, l) = _menhir_stack in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_FORALL (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__7_, t) = (_endpos, _v) in
            let _v = _menhir_action_164 _endpos__7_ _startpos__1_ l t in
            _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 154
    
    and _menhir_run_142 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_LET _menhir_cell0_OPEN, ttv_result) _menhir_cell1_nonempty_list_var_binding_ _menhir_cell0_CLOSE -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_nonempty_list_var_binding_ (_menhir_stack, _, l) = _menhir_stack in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_LET (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__7_, t) = (_endpos, _v) in
            let _v = _menhir_action_163 _endpos__7_ _startpos__1_ l t in
            _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 142
    
    and _menhir_run_136 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_OPEN _menhir_cell0_SYMBOL -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_SYMBOL (_menhir_stack, s, _startpos_s_, _endpos_s_) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__4_, t) = (_endpos, _v) in
            let _v = _menhir_action_168 _endpos__4_ _endpos_s_ _startpos__1_ _startpos_s_ s t in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                let _menhir_stack = MenhirCell1_var_binding (_menhir_stack, _menhir_s, _v) in
                _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState138
            | Tokens.CLOSE ->
                let x = _v in
                let _v = _menhir_action_094 x in
                _menhir_goto_nonempty_list_var_binding_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 138)
        | _ ->
            _eRR 136
    
    and _menhir_goto_nonempty_list_var_binding_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState458 ->
            _menhir_run_459 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState133 ->
            _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState138 ->
            _menhir_run_139 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_459 : type  ttv_stack. (((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_LET _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_term) _menhir_state -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_nonempty_list_var_binding_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState460 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.STR _v ->
            _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.NUM _v ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEX _v ->
            _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DEC _v ->
            _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.BIN _v ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 460
    
    and _menhir_run_140 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_LET _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_nonempty_list_var_binding_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState141 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.STR _v ->
            _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.NUM _v ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEX _v ->
            _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DEC _v ->
            _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.BIN _v ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 141
    
    and _menhir_run_139 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_var_binding -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_var_binding (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_095 x xs in
        _menhir_goto_nonempty_list_var_binding_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_122 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_pattern -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_pattern (_menhir_stack, _, p) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _) = _menhir_stack in
            let t = _v in
            let _v = _menhir_action_069 p t in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                let _menhir_stack = MenhirCell1_match_case (_menhir_stack, _menhir_s, _v) in
                _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState130
            | Tokens.CLOSE ->
                let x = _v in
                let _v = _menhir_action_082 x in
                _menhir_goto_nonempty_list_match_case_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 130)
        | _ ->
            _eRR 122
    
    and _menhir_goto_nonempty_list_match_case_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState453 ->
            _menhir_run_454 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState130 ->
            _menhir_run_131 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState111 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_454 : type  ttv_stack. (((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_MATCH, _menhir_box_term) _menhir_cell1_term _menhir_cell0_OPEN -> _ -> _ -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_term (_menhir_stack, _, t) = _menhir_stack in
            let MenhirCell1_MATCH (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (l, _endpos__7_) = (_v, _endpos_0) in
            let _v = _menhir_action_166 _endpos__7_ _startpos__1_ l t in
            _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 455
    
    and _menhir_run_131 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_match_case -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_match_case (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_083 x xs in
        _menhir_goto_nonempty_list_match_case_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_127 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_MATCH, ttv_result) _menhir_cell1_term _menhir_cell0_OPEN -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_term (_menhir_stack, _, t) = _menhir_stack in
            let MenhirCell1_MATCH (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (l, _endpos__7_) = (_v, _endpos_0) in
            let _v = _menhir_action_166 _endpos__7_ _startpos__1_ l t in
            _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 128
    
    and _menhir_run_110 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_MATCH as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState111 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 111)
        | _ ->
            _eRR 110
    
    and _menhir_run_124 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let c = _v in
        let _v = _menhir_action_160 c in
        _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_061 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_KEYWORD -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let (_endpos_v_, v) = (_endpos, _v) in
        let _v = _menhir_action_004 v in
        _menhir_goto_attribute_value _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_v_ _v _tok
    
    and _menhir_run_053 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let c = _v in
        let _v = _menhir_action_145 c in
        _menhir_goto_s_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_056 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_s_expr -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let MenhirCell1_s_expr (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_062 x xs in
        _menhir_goto_list_s_expr_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_list_s_expr_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState437 ->
            _menhir_run_438 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState322 ->
            _menhir_run_323 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState007 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState018 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState054 ->
            _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_438 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_extension_statement -> _ -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let MenhirCell1_extension_statement (_menhir_stack, _, e) = _menhir_stack in
        let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos__4_, l) = (_endpos, _v) in
        let _v = _menhir_action_037 _endpos__4_ _startpos__1_ e l in
        _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_323 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_extension_statement -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell1_extension_statement (_menhir_stack, _, e) = _menhir_stack in
        let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos__4_, l) = (_endpos, _v) in
        let _v = _menhir_action_037 _endpos__4_ _startpos__1_ e l in
        _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_322 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_extension_statement (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.UNDERSCORE ->
            _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.SYMBOL _v_0 ->
            _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState322
        | Tokens.STR _v_1 ->
            _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState322
        | Tokens.SET_OPTION ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.SET_LOGIC ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.SET_INFO ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.RESET_ASSERTIONS ->
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.RESET ->
            _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.PUSH ->
            _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.POP ->
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.PAR ->
            _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.OPEN ->
            _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.NUM _v_2 ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState322
        | Tokens.MATCH ->
            _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.LET ->
            _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.KEYWORD _v_3 ->
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState322
        | Tokens.HEX _v_4 ->
            _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState322
        | Tokens.GET_VALUE ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.GET_UNSAT_CORE ->
            _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.GET_UNSAT_ASSUMPTIONS ->
            _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.GET_PROOF ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.GET_OPTION ->
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.GET_MODEL ->
            _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.GET_INFO ->
            _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.GET_ASSIGNMENT ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.GET_ASSERTIONS ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.FORALL ->
            _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.EXIT ->
            _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.EXISTS ->
            _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.ECHO ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.DEFINE_SORT ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.DEFINE_FUN_REC ->
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.DEFINE_FUNS_REC ->
            _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.DEFINE_FUN ->
            _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.DECLARE_SORT ->
            _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.DECLARE_FUN ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.DECLARE_DATATYPES ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.DECLARE_DATATYPE ->
            _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.DECLARE_CONST ->
            _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.DEC _v_5 ->
            _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState322
        | Tokens.CHECK_SAT_ASSUMING ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.CHECK_SAT ->
            _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.BIN _v_6 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v_6 MenhirState322
        | Tokens.ATTRIBUTE ->
            _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.ASSERT ->
            _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.AS ->
            _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState322
        | Tokens.CLOSE ->
            let _v_7 = _menhir_action_061 () in
            _menhir_run_323 _menhir_stack _menhir_lexbuf _menhir_lexer _v_7
        | _ ->
            _eRR 322
    
    and _menhir_run_188 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_GET_INFO as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        let s = _v in
        let _v = _menhir_action_052 s in
        _menhir_goto_info_flag _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_info_flag : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_GET_INFO as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState367 ->
            _menhir_run_368 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState187 ->
            _menhir_run_189 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_368 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_GET_INFO -> _ -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let MenhirCell1_GET_INFO (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__4_, i) = (_endpos, _v) in
            let _v = _menhir_action_023 _endpos__4_ _startpos__1_ i in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 368
    
    and _menhir_run_189 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_GET_INFO -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_GET_INFO (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__4_, i) = (_endpos, _v) in
            let _v = _menhir_action_023 _endpos__4_ _startpos__1_ i in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 189
    
    and _menhir_run_203 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell1_SYMBOL (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            _menhir_run_203 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState203
        | Tokens.CLOSE ->
            let _v_1 = _menhir_action_055 () in
            _menhir_run_204 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1
        | _ ->
            _eRR 203
    
    and _menhir_run_204 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_SYMBOL -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_SYMBOL (_menhir_stack, _menhir_s, x, _, _) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_056 x xs in
        _menhir_goto_list_SYMBOL_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_goto_list_SYMBOL_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState381 ->
            _menhir_run_382 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState202 ->
            _menhir_run_205 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState203 ->
            _menhir_run_204 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_382 : type  ttv_stack. (((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DEFINE_SORT _menhir_cell0_SYMBOL _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_list_SYMBOL_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState383 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 383
    
    and _menhir_run_205 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DEFINE_SORT _menhir_cell0_SYMBOL _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_list_SYMBOL_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState206 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 206
    
    and _menhir_run_210 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell1_SYMBOL (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            let _startpos_0 = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos_0) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState211
            | Tokens.CLOSE ->
                let _v_1 = _menhir_action_067 () in
                _menhir_run_214 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState211
            | _ ->
                _eRR 211)
        | _ ->
            _eRR 210
    
    and _menhir_run_255 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.NUM _v_1 ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.CLOSE ->
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    let (s, n) = (_v, _v_1) in
                    let _v = _menhir_action_153 n s in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.OPEN ->
                        let _menhir_stack = MenhirCell1_sort_dec (_menhir_stack, _menhir_s, _v) in
                        _menhir_run_255 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState259
                    | Tokens.CLOSE ->
                        let x = _v in
                        let _v = _menhir_action_088 x in
                        _menhir_goto_nonempty_list_sort_dec_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                    | _ ->
                        _eRR 259)
                | _ ->
                    _eRR 257)
            | _ ->
                _eRR 256)
        | _ ->
            _eRR 255
    
    and _menhir_goto_nonempty_list_sort_dec_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState412 ->
            _menhir_run_413 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState254 ->
            _menhir_run_261 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState259 ->
            _menhir_run_260 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_413 : type  ttv_stack. (((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DECLARE_DATATYPES _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_nonempty_list_sort_dec_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState415 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                _menhir_run_264 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 415)
        | _ ->
            _eRR 414
    
    and _menhir_run_261 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DECLARE_DATATYPES _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_nonempty_list_sort_dec_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState263 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                _menhir_run_264 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 263)
        | _ ->
            _eRR 262
    
    and _menhir_run_260 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_sort_dec -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_sort_dec (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_089 x xs in
        _menhir_goto_nonempty_list_sort_dec_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    let _menhir_run_000 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
        | Tokens.EOF ->
            let _v = _menhir_action_057 () in
            _menhir_run_325 _menhir_stack _v
        | _ ->
            _eRR 0
    
    let _menhir_run_330 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SYMBOL _v ->
                let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, MenhirState330, _startpos) in
                _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState331
            | Tokens.SET_OPTION ->
                let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, MenhirState330, _startpos) in
                let _menhir_s = MenhirState331 in
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_SET_OPTION (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _menhir_s = MenhirState332 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.KEYWORD _v ->
                    _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | _ ->
                    _eRR 332)
            | Tokens.SET_LOGIC ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SYMBOL _v ->
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.CLOSE ->
                        let _endpos_4 = _menhir_lexbuf.Lexing.lex_curr_p in
                        let _v =
                          let (_startpos__1_, s, _endpos__4_) = (_startpos, _v, _endpos_4) in
                          _menhir_action_035 _endpos__4_ _startpos__1_ s
                        in
                        _menhir_run_442 _menhir_stack _v
                    | _ ->
                        _eRR 336)
                | _ ->
                    _eRR 335)
            | Tokens.SET_INFO ->
                let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, MenhirState330, _startpos) in
                let _menhir_s = MenhirState331 in
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_SET_INFO (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _menhir_s = MenhirState338 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.KEYWORD _v ->
                    _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | _ ->
                    _eRR 338)
            | Tokens.RESET_ASSERTIONS ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.CLOSE ->
                    let _endpos_7 = _menhir_lexbuf.Lexing.lex_curr_p in
                    let _v =
                      let (_startpos__1_, _endpos__3_) = (_startpos, _endpos_7) in
                      _menhir_action_033 _endpos__3_ _startpos__1_
                    in
                    _menhir_run_442 _menhir_stack _v
                | _ ->
                    _eRR 341)
            | Tokens.RESET ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.CLOSE ->
                    let _endpos_9 = _menhir_lexbuf.Lexing.lex_curr_p in
                    let _v =
                      let (_startpos__1_, _endpos__3_) = (_startpos, _endpos_9) in
                      _menhir_action_032 _endpos__3_ _startpos__1_
                    in
                    _menhir_run_442 _menhir_stack _v
                | _ ->
                    _eRR 343)
            | Tokens.PUSH ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.NUM _v ->
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.CLOSE ->
                        let _endpos_13 = _menhir_lexbuf.Lexing.lex_curr_p in
                        let _v =
                          let (_startpos__1_, _endpos__4_, n) = (_startpos, _endpos_13, _v) in
                          _menhir_action_031 _endpos__4_ _startpos__1_ n
                        in
                        _menhir_run_442 _menhir_stack _v
                    | _ ->
                        _eRR 346)
                | _ ->
                    _eRR 345)
            | Tokens.POP ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.NUM _v ->
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.CLOSE ->
                        let _endpos_17 = _menhir_lexbuf.Lexing.lex_curr_p in
                        let _v =
                          let (_startpos__1_, _endpos__4_, n) = (_startpos, _endpos_17, _v) in
                          _menhir_action_030 _endpos__4_ _startpos__1_ n
                        in
                        _menhir_run_442 _menhir_stack _v
                    | _ ->
                        _eRR 349)
                | _ ->
                    _eRR 348)
            | Tokens.GET_VALUE ->
                let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, MenhirState330, _startpos) in
                let _menhir_s = MenhirState331 in
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_GET_VALUE (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.OPEN ->
                    let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                    let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
                    let _menhir_s = MenhirState352 in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.SYMBOL _v ->
                        _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                    | Tokens.STR _v ->
                        _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                    | Tokens.OPEN ->
                        _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                    | Tokens.NUM _v ->
                        _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                    | Tokens.HEX _v ->
                        _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                    | Tokens.DEC _v ->
                        _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                    | Tokens.BIN _v ->
                        _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                    | _ ->
                        _eRR 352)
                | _ ->
                    _eRR 351)
            | Tokens.GET_UNSAT_CORE ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.CLOSE ->
                    let _endpos_21 = _menhir_lexbuf.Lexing.lex_curr_p in
                    let _v =
                      let (_startpos__1_, _endpos__3_) = (_startpos, _endpos_21) in
                      _menhir_action_028 _endpos__3_ _startpos__1_
                    in
                    _menhir_run_442 _menhir_stack _v
                | _ ->
                    _eRR 356)
            | Tokens.GET_UNSAT_ASSUMPTIONS ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.CLOSE ->
                    let _endpos_23 = _menhir_lexbuf.Lexing.lex_curr_p in
                    let _v =
                      let (_startpos__1_, _endpos__3_) = (_startpos, _endpos_23) in
                      _menhir_action_027 _endpos__3_ _startpos__1_
                    in
                    _menhir_run_442 _menhir_stack _v
                | _ ->
                    _eRR 358)
            | Tokens.GET_PROOF ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.CLOSE ->
                    let _endpos_25 = _menhir_lexbuf.Lexing.lex_curr_p in
                    let _v =
                      let (_startpos__1_, _endpos__3_) = (_startpos, _endpos_25) in
                      _menhir_action_026 _endpos__3_ _startpos__1_
                    in
                    _menhir_run_442 _menhir_stack _v
                | _ ->
                    _eRR 360)
            | Tokens.GET_OPTION ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.KEYWORD _v ->
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.CLOSE ->
                        let _endpos_29 = _menhir_lexbuf.Lexing.lex_curr_p in
                        let _v =
                          let (_startpos__1_, _endpos__4_, k) = (_startpos, _endpos_29, _v) in
                          _menhir_action_025 _endpos__4_ _startpos__1_ k
                        in
                        _menhir_run_442 _menhir_stack _v
                    | _ ->
                        _eRR 363)
                | _ ->
                    _eRR 362)
            | Tokens.GET_MODEL ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.CLOSE ->
                    let _endpos_31 = _menhir_lexbuf.Lexing.lex_curr_p in
                    let _v =
                      let (_startpos__1_, _endpos__3_) = (_startpos, _endpos_31) in
                      _menhir_action_024 _endpos__3_ _startpos__1_
                    in
                    _menhir_run_442 _menhir_stack _v
                | _ ->
                    _eRR 365)
            | Tokens.GET_INFO ->
                let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, MenhirState330, _startpos) in
                let _menhir_s = MenhirState331 in
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_GET_INFO (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _menhir_s = MenhirState367 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.KEYWORD _v ->
                    _menhir_run_188 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | _ ->
                    _eRR 367)
            | Tokens.GET_ASSIGNMENT ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.CLOSE ->
                    let _endpos_34 = _menhir_lexbuf.Lexing.lex_curr_p in
                    let _v =
                      let (_startpos__1_, _endpos__3_) = (_startpos, _endpos_34) in
                      _menhir_action_022 _endpos__3_ _startpos__1_
                    in
                    _menhir_run_442 _menhir_stack _v
                | _ ->
                    _eRR 370)
            | Tokens.GET_ASSERTIONS ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.CLOSE ->
                    let _endpos_36 = _menhir_lexbuf.Lexing.lex_curr_p in
                    let _v =
                      let (_startpos__1_, _endpos__3_) = (_startpos, _endpos_36) in
                      _menhir_action_021 _endpos__3_ _startpos__1_
                    in
                    _menhir_run_442 _menhir_stack _v
                | _ ->
                    _eRR 372)
            | Tokens.EXIT ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.CLOSE ->
                    let _endpos_38 = _menhir_lexbuf.Lexing.lex_curr_p in
                    let _v =
                      let (_startpos__1_, _endpos__3_) = (_startpos, _endpos_38) in
                      _menhir_action_020 _endpos__3_ _startpos__1_
                    in
                    _menhir_run_442 _menhir_stack _v
                | _ ->
                    _eRR 374)
            | Tokens.ECHO ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.STR _v ->
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.CLOSE ->
                        let _endpos_42 = _menhir_lexbuf.Lexing.lex_curr_p in
                        let _v =
                          let (_startpos__1_, s, _endpos__4_) = (_startpos, _v, _endpos_42) in
                          _menhir_action_019 _endpos__4_ _startpos__1_ s
                        in
                        _menhir_run_442 _menhir_stack _v
                    | _ ->
                        _eRR 377)
                | _ ->
                    _eRR 376)
            | Tokens.DEFINE_SORT ->
                let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, MenhirState330, _startpos) in
                let _startpos_43 = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_DEFINE_SORT (_menhir_stack, MenhirState331, _startpos_43, _endpos) in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SYMBOL _v ->
                    let _startpos_44 = _menhir_lexbuf.Lexing.lex_start_p in
                    let _endpos_45 = _menhir_lexbuf.Lexing.lex_curr_p in
                    let _menhir_stack = MenhirCell0_SYMBOL (_menhir_stack, _v, _startpos_44, _endpos_45) in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.OPEN ->
                        let _startpos_46 = _menhir_lexbuf.Lexing.lex_start_p in
                        let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos_46) in
                        let _tok = _menhir_lexer _menhir_lexbuf in
                        (match (_tok : MenhirBasics.token) with
                        | Tokens.SYMBOL _v_47 ->
                            _menhir_run_203 _menhir_stack _menhir_lexbuf _menhir_lexer _v_47 MenhirState381
                        | Tokens.CLOSE ->
                            let _v_48 = _menhir_action_055 () in
                            _menhir_run_382 _menhir_stack _menhir_lexbuf _menhir_lexer _v_48 MenhirState381
                        | _ ->
                            _eRR 381)
                    | _ ->
                        _eRR 380)
                | _ ->
                    _eRR 379)
            | Tokens.DEFINE_FUN_REC ->
                let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, MenhirState330, _startpos) in
                let _menhir_s = MenhirState331 in
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_DEFINE_FUN_REC (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _menhir_s = MenhirState386 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SYMBOL _v ->
                    _menhir_run_210 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | _ ->
                    _eRR 386)
            | Tokens.DEFINE_FUNS_REC ->
                let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, MenhirState330, _startpos) in
                let _menhir_s = MenhirState331 in
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_DEFINE_FUNS_REC (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.OPEN ->
                    let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                    let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
                    let _menhir_s = MenhirState390 in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.OPEN ->
                        _menhir_run_222 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                    | _ ->
                        _eRR 390)
                | _ ->
                    _eRR 389)
            | Tokens.DEFINE_FUN ->
                let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, MenhirState330, _startpos) in
                let _menhir_s = MenhirState331 in
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_DEFINE_FUN (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _menhir_s = MenhirState397 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SYMBOL _v ->
                    _menhir_run_210 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | _ ->
                    _eRR 397)
            | Tokens.DECLARE_SORT ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SYMBOL _v ->
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.NUM _v_56 ->
                        let _tok = _menhir_lexer _menhir_lexbuf in
                        (match (_tok : MenhirBasics.token) with
                        | Tokens.CLOSE ->
                            let _endpos_59 = _menhir_lexbuf.Lexing.lex_curr_p in
                            let _v =
                              let (_startpos__1_, s, n, _endpos__5_) = (_startpos, _v, _v_56, _endpos_59) in
                              _menhir_action_014 _endpos__5_ _startpos__1_ n s
                            in
                            _menhir_run_442 _menhir_stack _v
                        | _ ->
                            _eRR 402)
                    | _ ->
                        _eRR 401)
                | _ ->
                    _eRR 400)
            | Tokens.DECLARE_FUN ->
                let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, MenhirState330, _startpos) in
                let _startpos_60 = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_DECLARE_FUN (_menhir_stack, MenhirState331, _startpos_60, _endpos) in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SYMBOL _v ->
                    let _startpos_61 = _menhir_lexbuf.Lexing.lex_start_p in
                    let _endpos_62 = _menhir_lexbuf.Lexing.lex_curr_p in
                    let _menhir_stack = MenhirCell0_SYMBOL (_menhir_stack, _v, _startpos_61, _endpos_62) in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.OPEN ->
                        let _startpos_63 = _menhir_lexbuf.Lexing.lex_start_p in
                        let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos_63) in
                        let _tok = _menhir_lexer _menhir_lexbuf in
                        (match (_tok : MenhirBasics.token) with
                        | Tokens.SYMBOL _v_64 ->
                            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v_64 MenhirState406
                        | Tokens.OPEN ->
                            _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState406
                        | Tokens.CLOSE ->
                            let _v_65 = _menhir_action_065 () in
                            _menhir_run_407 _menhir_stack _menhir_lexbuf _menhir_lexer _v_65 MenhirState406
                        | _ ->
                            _eRR 406)
                    | _ ->
                        _eRR 405)
                | _ ->
                    _eRR 404)
            | Tokens.DECLARE_DATATYPES ->
                let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, MenhirState330, _startpos) in
                let _menhir_s = MenhirState331 in
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_DECLARE_DATATYPES (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.OPEN ->
                    let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                    let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
                    let _menhir_s = MenhirState412 in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.OPEN ->
                        _menhir_run_255 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                    | _ ->
                        _eRR 412)
                | _ ->
                    _eRR 411)
            | Tokens.DECLARE_DATATYPE ->
                let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, MenhirState330, _startpos) in
                let _menhir_s = MenhirState331 in
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_DECLARE_DATATYPE (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SYMBOL _v ->
                    let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                    let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                    let _menhir_stack = MenhirCell0_SYMBOL (_menhir_stack, _v, _startpos, _endpos) in
                    let _menhir_s = MenhirState420 in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.OPEN ->
                        _menhir_run_264 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                    | _ ->
                        _eRR 420)
                | _ ->
                    _eRR 419)
            | Tokens.DECLARE_CONST ->
                let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, MenhirState330, _startpos) in
                let _menhir_s = MenhirState331 in
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_DECLARE_CONST (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SYMBOL _v ->
                    let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                    let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                    let _menhir_stack = MenhirCell0_SYMBOL (_menhir_stack, _v, _startpos, _endpos) in
                    let _menhir_s = MenhirState424 in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.SYMBOL _v ->
                        _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                    | Tokens.OPEN ->
                        _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                    | _ ->
                        _eRR 424)
                | _ ->
                    _eRR 423)
            | Tokens.CHECK_SAT_ASSUMING ->
                let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, MenhirState330, _startpos) in
                let _startpos_75 = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_CHECK_SAT_ASSUMING (_menhir_stack, MenhirState331, _startpos_75, _endpos) in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.OPEN ->
                    let _startpos_76 = _menhir_lexbuf.Lexing.lex_start_p in
                    let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos_76) in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.SYMBOL _v ->
                        _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState428
                    | Tokens.OPEN ->
                        _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState428
                    | Tokens.CLOSE ->
                        let _v = _menhir_action_059 () in
                        _menhir_run_429 _menhir_stack _menhir_lexbuf _menhir_lexer _v
                    | _ ->
                        _eRR 428)
                | _ ->
                    _eRR 427)
            | Tokens.CHECK_SAT ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.CLOSE ->
                    let _endpos_78 = _menhir_lexbuf.Lexing.lex_curr_p in
                    let _v =
                      let (_startpos__1_, _endpos__3_) = (_startpos, _endpos_78) in
                      _menhir_action_008 _endpos__3_ _startpos__1_
                    in
                    _menhir_run_442 _menhir_stack _v
                | _ ->
                    _eRR 432)
            | Tokens.ASSERT ->
                let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, MenhirState330, _startpos) in
                let _menhir_s = MenhirState331 in
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_ASSERT (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _menhir_s = MenhirState434 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SYMBOL _v ->
                    _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.STR _v ->
                    _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.OPEN ->
                    _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | Tokens.NUM _v ->
                    _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.HEX _v ->
                    _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.DEC _v ->
                    _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.BIN _v ->
                    _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | _ ->
                    _eRR 434)
            | _ ->
                _eRR 331)
        | Tokens.EOF ->
            let _v = _menhir_action_053 () in
            _menhir_goto_input _menhir_stack _v
        | _ ->
            _eRR 330
    
    let _menhir_run_443 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _v =
              let s = _v in
              _menhir_action_047 s
            in
            _menhir_run_493 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v MenhirState443 _tok
        | Tokens.STR _v ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _v =
              let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
              _menhir_action_159 _endpos_s_ _startpos_s_ s
            in
            _menhir_run_491 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState443 _tok
        | Tokens.OPEN ->
            let _menhir_s = MenhirState443 in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
            let _menhir_s = MenhirState446 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UNDERSCORE ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_UNDERSCORE (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SYMBOL _v ->
                    let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                    let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                    let _menhir_stack = MenhirCell0_SYMBOL (_menhir_stack, _v, _startpos, _endpos) in
                    let _menhir_s = MenhirState448 in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.SYMBOL _v ->
                        _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                    | Tokens.NUM _v ->
                        _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                    | Tokens.HEX _v ->
                        _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                    | _ ->
                        _eRR 448)
                | _ ->
                    _eRR 447)
            | Tokens.SYMBOL _v ->
                _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.OPEN ->
                _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_MATCH (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _menhir_s = MenhirState451 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SYMBOL _v ->
                    _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.STR _v ->
                    _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.OPEN ->
                    _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | Tokens.NUM _v ->
                    _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.HEX _v ->
                    _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.DEC _v ->
                    _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.BIN _v ->
                    _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | _ ->
                    _eRR 451)
            | Tokens.LET ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_LET (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.OPEN ->
                    let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                    let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
                    let _menhir_s = MenhirState458 in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.OPEN ->
                        _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                    | _ ->
                        _eRR 458)
                | _ ->
                    _eRR 457)
            | Tokens.FORALL ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_FORALL (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.OPEN ->
                    let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                    let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
                    let _menhir_s = MenhirState464 in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.OPEN ->
                        _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                    | _ ->
                        _eRR 464)
                | _ ->
                    _eRR 463)
            | Tokens.EXISTS ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_EXISTS (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.OPEN ->
                    let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                    let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
                    let _menhir_s = MenhirState470 in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.OPEN ->
                        _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                    | _ ->
                        _eRR 470)
                | _ ->
                    _eRR 469)
            | Tokens.ATTRIBUTE ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_ATTRIBUTE (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _menhir_s = MenhirState475 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SYMBOL _v ->
                    _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.STR _v ->
                    _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.OPEN ->
                    _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | Tokens.NUM _v ->
                    _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.HEX _v ->
                    _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.DEC _v ->
                    _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.BIN _v ->
                    _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | _ ->
                    _eRR 475)
            | Tokens.AS ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_AS (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _menhir_s = MenhirState479 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SYMBOL _v ->
                    _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.OPEN ->
                    _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | _ ->
                    _eRR 479)
            | _ ->
                _eRR 446)
        | Tokens.NUM _v ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _v =
              let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
              _menhir_action_155 _endpos_s_ _startpos_s_ s
            in
            _menhir_run_491 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState443 _tok
        | Tokens.HEX _v ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _v =
              let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
              _menhir_action_157 _endpos_s_ _startpos_s_ s
            in
            _menhir_run_491 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState443 _tok
        | Tokens.DEC _v ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _v =
              let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
              _menhir_action_156 _endpos_s_ _startpos_s_ s
            in
            _menhir_run_491 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState443 _tok
        | Tokens.BIN _v ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _v =
              let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
              _menhir_action_158 _endpos_s_ _startpos_s_ s
            in
            _menhir_run_491 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState443 _tok
        | _ ->
            _eRR 443
    
  end
  
  let term =
    fun _menhir_lexer _menhir_lexbuf ->
      let _menhir_stack = () in
      let MenhirBox_term v = _menhir_run_443 _menhir_stack _menhir_lexbuf _menhir_lexer in
      v
  
  let input =
    fun _menhir_lexer _menhir_lexbuf ->
      let _menhir_stack = () in
      let MenhirBox_input v = _menhir_run_330 _menhir_stack _menhir_lexbuf _menhir_lexer in
      v
  
  let file =
    fun _menhir_lexer _menhir_lexbuf ->
      let _menhir_stack = () in
      let MenhirBox_file v = _menhir_run_000 _menhir_stack _menhir_lexbuf _menhir_lexer in
      v
  
# 488 "src/languages/smtlib2/v2.6/script/parser.mly"
  

# 7828 "src/languages/smtlib2/v2.6/script/parser.ml"
  
end
