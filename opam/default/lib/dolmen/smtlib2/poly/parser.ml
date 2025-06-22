
module Make

# 4 "src/languages/smtlib2/poly/parser.mly"
           (L : Dolmen_intf.Location.S)
# 7 "src/languages/smtlib2/poly/parser.ml"


# 5 "src/languages/smtlib2/poly/parser.mly"
           (I : Ast.Id)
# 12 "src/languages/smtlib2/poly/parser.ml"


# 6 "src/languages/smtlib2/poly/parser.mly"
           (T : Ast.Term with type location := L.t and type id := I.t)
# 17 "src/languages/smtlib2/poly/parser.ml"


# 7 "src/languages/smtlib2/poly/parser.mly"
           (S : Ast.Statement with type location := L.t and type id := I.t and type term := T.t)
# 22 "src/languages/smtlib2/poly/parser.ml"


# 8 "src/languages/smtlib2/poly/parser.mly"
           (E : Ast.Extension with type location := L.t and type term := T.t and type statement := S.t)
# 27 "src/languages/smtlib2/poly/parser.ml"

= struct
  
  module MenhirBasics = struct
    
    exception Error of int
    
    let _eRR =
      fun _s ->
        raise (Error _s)
    
    type token = Tokens.token
    
  end
  
  include MenhirBasics
  
# 14 "src/languages/smtlib2/poly/parser.mly"
  

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


# 61 "src/languages/smtlib2/poly/parser.ml"
  
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

    | MenhirState213 : ((('s, 'r) _menhir_cell1_SYMBOL _menhir_cell0_OPEN, 'r) _menhir_cell1_PAR _menhir_cell0_OPEN, 'r) _menhir_state
      (** State 213.
        Stack shape : SYMBOL OPEN PAR OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState217 : (((('s, 'r) _menhir_cell1_SYMBOL _menhir_cell0_OPEN, 'r) _menhir_cell1_PAR _menhir_cell0_OPEN, 'r) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE _menhir_cell0_OPEN, 'r) _menhir_state
      (** State 217.
        Stack shape : SYMBOL OPEN PAR OPEN nonempty_list(datatype_symbol) CLOSE OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState218 : (('s, 'r) _menhir_cell1_sorted_var, 'r) _menhir_state
      (** State 218.
        Stack shape : sorted_var.
        Start symbol: <undetermined>. *)

    | MenhirState221 : ((((('s, 'r) _menhir_cell1_SYMBOL _menhir_cell0_OPEN, 'r) _menhir_cell1_PAR _menhir_cell0_OPEN, 'r) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE _menhir_cell0_OPEN, 'r) _menhir_cell1_list_sorted_var_ _menhir_cell0_CLOSE, 'r) _menhir_state
      (** State 221.
        Stack shape : SYMBOL OPEN PAR OPEN nonempty_list(datatype_symbol) CLOSE OPEN list(sorted_var) CLOSE.
        Start symbol: <undetermined>. *)

    | MenhirState222 : (((((('s, 'r) _menhir_cell1_SYMBOL _menhir_cell0_OPEN, 'r) _menhir_cell1_PAR _menhir_cell0_OPEN, 'r) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE _menhir_cell0_OPEN, 'r) _menhir_cell1_list_sorted_var_ _menhir_cell0_CLOSE, 'r) _menhir_cell1_sort, 'r) _menhir_state
      (** State 222.
        Stack shape : SYMBOL OPEN PAR OPEN nonempty_list(datatype_symbol) CLOSE OPEN list(sorted_var) CLOSE sort.
        Start symbol: <undetermined>. *)

    | MenhirState223 : ((((((('s, 'r) _menhir_cell1_SYMBOL _menhir_cell0_OPEN, 'r) _menhir_cell1_PAR _menhir_cell0_OPEN, 'r) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE _menhir_cell0_OPEN, 'r) _menhir_cell1_list_sorted_var_ _menhir_cell0_CLOSE, 'r) _menhir_cell1_sort, 'r) _menhir_cell1_CLOSE, 'r) _menhir_state
      (** State 223.
        Stack shape : SYMBOL OPEN PAR OPEN nonempty_list(datatype_symbol) CLOSE OPEN list(sorted_var) CLOSE sort CLOSE.
        Start symbol: <undetermined>. *)

    | MenhirState227 : (('s, 'r) _menhir_cell1_datatype_symbol, 'r) _menhir_state
      (** State 227.
        Stack shape : datatype_symbol.
        Start symbol: <undetermined>. *)

    | MenhirState230 : ((('s, 'r) _menhir_cell1_SYMBOL _menhir_cell0_OPEN, 'r) _menhir_cell1_list_sorted_var_ _menhir_cell0_CLOSE, 'r) _menhir_state
      (** State 230.
        Stack shape : SYMBOL OPEN list(sorted_var) CLOSE.
        Start symbol: <undetermined>. *)

    | MenhirState231 : (((('s, 'r) _menhir_cell1_SYMBOL _menhir_cell0_OPEN, 'r) _menhir_cell1_list_sorted_var_ _menhir_cell0_CLOSE, 'r) _menhir_cell1_sort, 'r) _menhir_state
      (** State 231.
        Stack shape : SYMBOL OPEN list(sorted_var) CLOSE sort.
        Start symbol: <undetermined>. *)

    | MenhirState235 : (('s, 'r) _menhir_cell1_OPEN _menhir_cell0_PAR _menhir_cell0_OPEN, 'r) _menhir_state
      (** State 235.
        Stack shape : OPEN PAR OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState239 : ((('s, 'r) _menhir_cell1_OPEN _menhir_cell0_PAR _menhir_cell0_OPEN, 'r) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE _menhir_cell0_SYMBOL _menhir_cell0_OPEN, 'r) _menhir_state
      (** State 239.
        Stack shape : OPEN PAR OPEN nonempty_list(datatype_symbol) CLOSE SYMBOL OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState241 : (((('s, 'r) _menhir_cell1_OPEN _menhir_cell0_PAR _menhir_cell0_OPEN, 'r) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE _menhir_cell0_SYMBOL _menhir_cell0_OPEN, 'r) _menhir_cell1_list_sorted_var_ _menhir_cell0_CLOSE, 'r) _menhir_state
      (** State 241.
        Stack shape : OPEN PAR OPEN nonempty_list(datatype_symbol) CLOSE SYMBOL OPEN list(sorted_var) CLOSE.
        Start symbol: <undetermined>. *)

    | MenhirState242 : ((((('s, 'r) _menhir_cell1_OPEN _menhir_cell0_PAR _menhir_cell0_OPEN, 'r) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE _menhir_cell0_SYMBOL _menhir_cell0_OPEN, 'r) _menhir_cell1_list_sorted_var_ _menhir_cell0_CLOSE, 'r) _menhir_cell1_sort, 'r) _menhir_state
      (** State 242.
        Stack shape : OPEN PAR OPEN nonempty_list(datatype_symbol) CLOSE SYMBOL OPEN list(sorted_var) CLOSE sort.
        Start symbol: <undetermined>. *)

    | MenhirState248 : ((('s, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DEFINE_FUNS_REC _menhir_cell0_OPEN, _menhir_box_file) _menhir_state
      (** State 248.
        Stack shape : OPEN DEFINE_FUNS_REC OPEN.
        Start symbol: file. *)

    | MenhirState251 : (('s, 'r) _menhir_cell1_OPEN _menhir_cell0_SYMBOL _menhir_cell0_OPEN, 'r) _menhir_state
      (** State 251.
        Stack shape : OPEN SYMBOL OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState253 : ((('s, 'r) _menhir_cell1_OPEN _menhir_cell0_SYMBOL _menhir_cell0_OPEN, 'r) _menhir_cell1_PAR _menhir_cell0_OPEN, 'r) _menhir_state
      (** State 253.
        Stack shape : OPEN SYMBOL OPEN PAR OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState256 : (((('s, 'r) _menhir_cell1_OPEN _menhir_cell0_SYMBOL _menhir_cell0_OPEN, 'r) _menhir_cell1_PAR _menhir_cell0_OPEN, 'r) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE _menhir_cell0_OPEN, 'r) _menhir_state
      (** State 256.
        Stack shape : OPEN SYMBOL OPEN PAR OPEN nonempty_list(datatype_symbol) CLOSE OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState258 : ((((('s, 'r) _menhir_cell1_OPEN _menhir_cell0_SYMBOL _menhir_cell0_OPEN, 'r) _menhir_cell1_PAR _menhir_cell0_OPEN, 'r) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE _menhir_cell0_OPEN, 'r) _menhir_cell1_list_sorted_var_ _menhir_cell0_CLOSE, 'r) _menhir_state
      (** State 258.
        Stack shape : OPEN SYMBOL OPEN PAR OPEN nonempty_list(datatype_symbol) CLOSE OPEN list(sorted_var) CLOSE.
        Start symbol: <undetermined>. *)

    | MenhirState262 : ((('s, 'r) _menhir_cell1_OPEN _menhir_cell0_SYMBOL _menhir_cell0_OPEN, 'r) _menhir_cell1_list_sorted_var_ _menhir_cell0_CLOSE, 'r) _menhir_state
      (** State 262.
        Stack shape : OPEN SYMBOL OPEN list(sorted_var) CLOSE.
        Start symbol: <undetermined>. *)

    | MenhirState266 : (('s, 'r) _menhir_cell1_OPEN _menhir_cell0_OPEN _menhir_cell0_PAR _menhir_cell0_OPEN, 'r) _menhir_state
      (** State 266.
        Stack shape : OPEN OPEN PAR OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState270 : ((('s, 'r) _menhir_cell1_OPEN _menhir_cell0_OPEN _menhir_cell0_PAR _menhir_cell0_OPEN, 'r) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE _menhir_cell0_SYMBOL _menhir_cell0_OPEN, 'r) _menhir_state
      (** State 270.
        Stack shape : OPEN OPEN PAR OPEN nonempty_list(datatype_symbol) CLOSE SYMBOL OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState272 : (((('s, 'r) _menhir_cell1_OPEN _menhir_cell0_OPEN _menhir_cell0_PAR _menhir_cell0_OPEN, 'r) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE _menhir_cell0_SYMBOL _menhir_cell0_OPEN, 'r) _menhir_cell1_list_sorted_var_ _menhir_cell0_CLOSE, 'r) _menhir_state
      (** State 272.
        Stack shape : OPEN OPEN PAR OPEN nonempty_list(datatype_symbol) CLOSE SYMBOL OPEN list(sorted_var) CLOSE.
        Start symbol: <undetermined>. *)

    | MenhirState276 : (('s, 'r) _menhir_cell1_OPEN _menhir_cell0_function_dec_sorted_var_ _menhir_cell0_CLOSE, 'r) _menhir_state
      (** State 276.
        Stack shape : OPEN function_dec(sorted_var) CLOSE.
        Start symbol: <undetermined>. *)

    | MenhirState280 : (((('s, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DEFINE_FUNS_REC _menhir_cell0_OPEN, _menhir_box_file) _menhir_cell1_nonempty_list___anonymous_0_ _menhir_cell0_CLOSE _menhir_cell0_OPEN, _menhir_box_file) _menhir_state
      (** State 280.
        Stack shape : OPEN DEFINE_FUNS_REC OPEN nonempty_list(__anonymous_0) CLOSE OPEN.
        Start symbol: file. *)

    | MenhirState284 : ((('s, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DEFINE_FUN, _menhir_box_file) _menhir_state
      (** State 284.
        Stack shape : OPEN DEFINE_FUN.
        Start symbol: file. *)

    | MenhirState291 : ((('s, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DECLARE_FUN, _menhir_box_file) _menhir_state
      (** State 291.
        Stack shape : OPEN DECLARE_FUN.
        Start symbol: file. *)

    | MenhirState293 : (((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_DECLARE_FUN, 'r) _menhir_cell1_SYMBOL _menhir_cell0_OPEN, 'r) _menhir_state
      (** State 293.
        Stack shape : OPEN DECLARE_FUN SYMBOL OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState295 : ((((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_DECLARE_FUN, 'r) _menhir_cell1_SYMBOL _menhir_cell0_OPEN, 'r) _menhir_cell1_PAR _menhir_cell0_OPEN, 'r) _menhir_state
      (** State 295.
        Stack shape : OPEN DECLARE_FUN SYMBOL OPEN PAR OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState298 : (((((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_DECLARE_FUN, 'r) _menhir_cell1_SYMBOL _menhir_cell0_OPEN, 'r) _menhir_cell1_PAR _menhir_cell0_OPEN, 'r) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE _menhir_cell0_OPEN, 'r) _menhir_state
      (** State 298.
        Stack shape : OPEN DECLARE_FUN SYMBOL OPEN PAR OPEN nonempty_list(datatype_symbol) CLOSE OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState299 : (('s, 'r) _menhir_cell1_sort, 'r) _menhir_state
      (** State 299.
        Stack shape : sort.
        Start symbol: <undetermined>. *)

    | MenhirState302 : ((((((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_DECLARE_FUN, 'r) _menhir_cell1_SYMBOL _menhir_cell0_OPEN, 'r) _menhir_cell1_PAR _menhir_cell0_OPEN, 'r) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE _menhir_cell0_OPEN, 'r) _menhir_cell1_list_sort_ _menhir_cell0_CLOSE, 'r) _menhir_state
      (** State 302.
        Stack shape : OPEN DECLARE_FUN SYMBOL OPEN PAR OPEN nonempty_list(datatype_symbol) CLOSE OPEN list(sort) CLOSE.
        Start symbol: <undetermined>. *)

    | MenhirState306 : ((((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_DECLARE_FUN, 'r) _menhir_cell1_SYMBOL _menhir_cell0_OPEN, 'r) _menhir_cell1_list_sort_ _menhir_cell0_CLOSE, 'r) _menhir_state
      (** State 306.
        Stack shape : OPEN DECLARE_FUN SYMBOL OPEN list(sort) CLOSE.
        Start symbol: <undetermined>. *)

    | MenhirState310 : (((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_DECLARE_FUN, 'r) _menhir_cell1_OPEN _menhir_cell0_PAR _menhir_cell0_OPEN, 'r) _menhir_state
      (** State 310.
        Stack shape : OPEN DECLARE_FUN OPEN PAR OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState314 : ((((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_DECLARE_FUN, 'r) _menhir_cell1_OPEN _menhir_cell0_PAR _menhir_cell0_OPEN, 'r) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE _menhir_cell0_SYMBOL _menhir_cell0_OPEN, 'r) _menhir_state
      (** State 314.
        Stack shape : OPEN DECLARE_FUN OPEN PAR OPEN nonempty_list(datatype_symbol) CLOSE SYMBOL OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState316 : (((((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_DECLARE_FUN, 'r) _menhir_cell1_OPEN _menhir_cell0_PAR _menhir_cell0_OPEN, 'r) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE _menhir_cell0_SYMBOL _menhir_cell0_OPEN, 'r) _menhir_cell1_list_sort_ _menhir_cell0_CLOSE, 'r) _menhir_state
      (** State 316.
        Stack shape : OPEN DECLARE_FUN OPEN PAR OPEN nonempty_list(datatype_symbol) CLOSE SYMBOL OPEN list(sort) CLOSE.
        Start symbol: <undetermined>. *)

    | MenhirState322 : ((('s, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DECLARE_DATATYPES _menhir_cell0_OPEN, _menhir_box_file) _menhir_state
      (** State 322.
        Stack shape : OPEN DECLARE_DATATYPES OPEN.
        Start symbol: file. *)

    | MenhirState327 : (('s, 'r) _menhir_cell1_sort_dec, 'r) _menhir_state
      (** State 327.
        Stack shape : sort_dec.
        Start symbol: <undetermined>. *)

    | MenhirState331 : (((('s, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DECLARE_DATATYPES _menhir_cell0_OPEN, _menhir_box_file) _menhir_cell1_nonempty_list_sort_dec_ _menhir_cell0_CLOSE _menhir_cell0_OPEN, _menhir_box_file) _menhir_state
      (** State 331.
        Stack shape : OPEN DECLARE_DATATYPES OPEN nonempty_list(sort_dec) CLOSE OPEN.
        Start symbol: file. *)

    | MenhirState332 : (('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_state
      (** State 332.
        Stack shape : OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState334 : ((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_PAR _menhir_cell0_OPEN, 'r) _menhir_state
      (** State 334.
        Stack shape : OPEN PAR OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState337 : (((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_PAR _menhir_cell0_OPEN, 'r) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE _menhir_cell0_OPEN, 'r) _menhir_state
      (** State 337.
        Stack shape : OPEN PAR OPEN nonempty_list(datatype_symbol) CLOSE OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState339 : (('s, 'r) _menhir_cell1_OPEN _menhir_cell0_SYMBOL, 'r) _menhir_state
      (** State 339.
        Stack shape : OPEN SYMBOL.
        Start symbol: <undetermined>. *)

    | MenhirState341 : (('s, 'r) _menhir_cell1_OPEN _menhir_cell0_SYMBOL, 'r) _menhir_state
      (** State 341.
        Stack shape : OPEN SYMBOL.
        Start symbol: <undetermined>. *)

    | MenhirState344 : (('s, 'r) _menhir_cell1_selector_dec, 'r) _menhir_state
      (** State 344.
        Stack shape : selector_dec.
        Start symbol: <undetermined>. *)

    | MenhirState351 : (('s, 'r) _menhir_cell1_constructor_dec, 'r) _menhir_state
      (** State 351.
        Stack shape : constructor_dec.
        Start symbol: <undetermined>. *)

    | MenhirState358 : (('s, 'r) _menhir_cell1_datatype_dec, 'r) _menhir_state
      (** State 358.
        Stack shape : datatype_dec.
        Start symbol: <undetermined>. *)

    | MenhirState361 : ((('s, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DECLARE_DATATYPE _menhir_cell0_SYMBOL, _menhir_box_file) _menhir_state
      (** State 361.
        Stack shape : OPEN DECLARE_DATATYPE SYMBOL.
        Start symbol: file. *)

    | MenhirState365 : ((('s, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DECLARE_CONST _menhir_cell0_SYMBOL, _menhir_box_file) _menhir_state
      (** State 365.
        Stack shape : OPEN DECLARE_CONST SYMBOL.
        Start symbol: file. *)

    | MenhirState366 : (((('s, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DECLARE_CONST _menhir_cell0_SYMBOL, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_state
      (** State 366.
        Stack shape : OPEN DECLARE_CONST SYMBOL OPEN.
        Start symbol: file. *)

    | MenhirState368 : ((((('s, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DECLARE_CONST _menhir_cell0_SYMBOL, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_PAR _menhir_cell0_OPEN, _menhir_box_file) _menhir_state
      (** State 368.
        Stack shape : OPEN DECLARE_CONST SYMBOL OPEN PAR OPEN.
        Start symbol: file. *)

    | MenhirState370 : (((((('s, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DECLARE_CONST _menhir_cell0_SYMBOL, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_PAR _menhir_cell0_OPEN, _menhir_box_file) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE, _menhir_box_file) _menhir_state
      (** State 370.
        Stack shape : OPEN DECLARE_CONST SYMBOL OPEN PAR OPEN nonempty_list(datatype_symbol) CLOSE.
        Start symbol: file. *)

    | MenhirState377 : ((('s, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_CHECK_SAT_ASSUMING _menhir_cell0_OPEN, _menhir_box_file) _menhir_state
      (** State 377.
        Stack shape : OPEN CHECK_SAT_ASSUMING OPEN.
        Start symbol: file. *)

    | MenhirState380 : (('s, 'r) _menhir_cell1_OPEN _menhir_cell0_not_symbol, 'r) _menhir_state
      (** State 380.
        Stack shape : OPEN not_symbol.
        Start symbol: <undetermined>. *)

    | MenhirState385 : (('s, 'r) _menhir_cell1_prop_literal, 'r) _menhir_state
      (** State 385.
        Stack shape : prop_literal.
        Start symbol: <undetermined>. *)

    | MenhirState392 : ((('s, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_ASSERT, _menhir_box_file) _menhir_state
      (** State 392.
        Stack shape : OPEN ASSERT.
        Start symbol: file. *)

    | MenhirState393 : (((('s, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_ASSERT, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_state
      (** State 393.
        Stack shape : OPEN ASSERT OPEN.
        Start symbol: file. *)

    | MenhirState395 : ((((('s, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_ASSERT, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_PAR _menhir_cell0_OPEN, _menhir_box_file) _menhir_state
      (** State 395.
        Stack shape : OPEN ASSERT OPEN PAR OPEN.
        Start symbol: file. *)

    | MenhirState397 : (((((('s, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_ASSERT, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_PAR _menhir_cell0_OPEN, _menhir_box_file) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE, _menhir_box_file) _menhir_state
      (** State 397.
        Stack shape : OPEN ASSERT OPEN PAR OPEN nonempty_list(datatype_symbol) CLOSE.
        Start symbol: file. *)

    | MenhirState403 : ((('s, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_extension_statement, _menhir_box_file) _menhir_state
      (** State 403.
        Stack shape : OPEN extension_statement.
        Start symbol: file. *)

    | MenhirState409 : (('s, _menhir_box_file) _menhir_cell1_command, _menhir_box_file) _menhir_state
      (** State 409.
        Stack shape : command.
        Start symbol: file. *)

    | MenhirState411 : ('s, _menhir_box_input) _menhir_state
      (** State 411.
        Stack shape : .
        Start symbol: input. *)

    | MenhirState412 : (('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_state
      (** State 412.
        Stack shape : OPEN.
        Start symbol: input. *)

    | MenhirState413 : ((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_SET_OPTION, _menhir_box_input) _menhir_state
      (** State 413.
        Stack shape : OPEN SET_OPTION.
        Start symbol: input. *)

    | MenhirState419 : ((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_SET_INFO, _menhir_box_input) _menhir_state
      (** State 419.
        Stack shape : OPEN SET_INFO.
        Start symbol: input. *)

    | MenhirState433 : ((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_GET_VALUE _menhir_cell0_OPEN, _menhir_box_input) _menhir_state
      (** State 433.
        Stack shape : OPEN GET_VALUE OPEN.
        Start symbol: input. *)

    | MenhirState448 : ((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_GET_INFO, _menhir_box_input) _menhir_state
      (** State 448.
        Stack shape : OPEN GET_INFO.
        Start symbol: input. *)

    | MenhirState462 : ((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DEFINE_SORT _menhir_cell0_SYMBOL _menhir_cell0_OPEN, _menhir_box_input) _menhir_state
      (** State 462.
        Stack shape : OPEN DEFINE_SORT SYMBOL OPEN.
        Start symbol: input. *)

    | MenhirState464 : (((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DEFINE_SORT _menhir_cell0_SYMBOL _menhir_cell0_OPEN, _menhir_box_input) _menhir_cell1_list_SYMBOL_ _menhir_cell0_CLOSE, _menhir_box_input) _menhir_state
      (** State 464.
        Stack shape : OPEN DEFINE_SORT SYMBOL OPEN list(SYMBOL) CLOSE.
        Start symbol: input. *)

    | MenhirState467 : ((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DEFINE_FUN_REC, _menhir_box_input) _menhir_state
      (** State 467.
        Stack shape : OPEN DEFINE_FUN_REC.
        Start symbol: input. *)

    | MenhirState471 : ((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DEFINE_FUNS_REC _menhir_cell0_OPEN, _menhir_box_input) _menhir_state
      (** State 471.
        Stack shape : OPEN DEFINE_FUNS_REC OPEN.
        Start symbol: input. *)

    | MenhirState474 : (((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DEFINE_FUNS_REC _menhir_cell0_OPEN, _menhir_box_input) _menhir_cell1_nonempty_list___anonymous_0_ _menhir_cell0_CLOSE _menhir_cell0_OPEN, _menhir_box_input) _menhir_state
      (** State 474.
        Stack shape : OPEN DEFINE_FUNS_REC OPEN nonempty_list(__anonymous_0) CLOSE OPEN.
        Start symbol: input. *)

    | MenhirState478 : ((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DEFINE_FUN, _menhir_box_input) _menhir_state
      (** State 478.
        Stack shape : OPEN DEFINE_FUN.
        Start symbol: input. *)

    | MenhirState485 : ((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DECLARE_FUN, _menhir_box_input) _menhir_state
      (** State 485.
        Stack shape : OPEN DECLARE_FUN.
        Start symbol: input. *)

    | MenhirState489 : ((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DECLARE_DATATYPES _menhir_cell0_OPEN, _menhir_box_input) _menhir_state
      (** State 489.
        Stack shape : OPEN DECLARE_DATATYPES OPEN.
        Start symbol: input. *)

    | MenhirState492 : (((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DECLARE_DATATYPES _menhir_cell0_OPEN, _menhir_box_input) _menhir_cell1_nonempty_list_sort_dec_ _menhir_cell0_CLOSE _menhir_cell0_OPEN, _menhir_box_input) _menhir_state
      (** State 492.
        Stack shape : OPEN DECLARE_DATATYPES OPEN nonempty_list(sort_dec) CLOSE OPEN.
        Start symbol: input. *)

    | MenhirState497 : ((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DECLARE_DATATYPE _menhir_cell0_SYMBOL, _menhir_box_input) _menhir_state
      (** State 497.
        Stack shape : OPEN DECLARE_DATATYPE SYMBOL.
        Start symbol: input. *)

    | MenhirState501 : ((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DECLARE_CONST _menhir_cell0_SYMBOL, _menhir_box_input) _menhir_state
      (** State 501.
        Stack shape : OPEN DECLARE_CONST SYMBOL.
        Start symbol: input. *)

    | MenhirState502 : (((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DECLARE_CONST _menhir_cell0_SYMBOL, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_state
      (** State 502.
        Stack shape : OPEN DECLARE_CONST SYMBOL OPEN.
        Start symbol: input. *)

    | MenhirState504 : ((((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DECLARE_CONST _menhir_cell0_SYMBOL, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_PAR _menhir_cell0_OPEN, _menhir_box_input) _menhir_state
      (** State 504.
        Stack shape : OPEN DECLARE_CONST SYMBOL OPEN PAR OPEN.
        Start symbol: input. *)

    | MenhirState506 : (((((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DECLARE_CONST _menhir_cell0_SYMBOL, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_PAR _menhir_cell0_OPEN, _menhir_box_input) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE, _menhir_box_input) _menhir_state
      (** State 506.
        Stack shape : OPEN DECLARE_CONST SYMBOL OPEN PAR OPEN nonempty_list(datatype_symbol) CLOSE.
        Start symbol: input. *)

    | MenhirState513 : ((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_CHECK_SAT_ASSUMING _menhir_cell0_OPEN, _menhir_box_input) _menhir_state
      (** State 513.
        Stack shape : OPEN CHECK_SAT_ASSUMING OPEN.
        Start symbol: input. *)

    | MenhirState519 : ((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_ASSERT, _menhir_box_input) _menhir_state
      (** State 519.
        Stack shape : OPEN ASSERT.
        Start symbol: input. *)

    | MenhirState520 : (((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_ASSERT, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_state
      (** State 520.
        Stack shape : OPEN ASSERT OPEN.
        Start symbol: input. *)

    | MenhirState522 : ((((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_ASSERT, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_PAR _menhir_cell0_OPEN, _menhir_box_input) _menhir_state
      (** State 522.
        Stack shape : OPEN ASSERT OPEN PAR OPEN.
        Start symbol: input. *)

    | MenhirState524 : (((((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_ASSERT, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_PAR _menhir_cell0_OPEN, _menhir_box_input) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE, _menhir_box_input) _menhir_state
      (** State 524.
        Stack shape : OPEN ASSERT OPEN PAR OPEN nonempty_list(datatype_symbol) CLOSE.
        Start symbol: input. *)

    | MenhirState530 : ((('s, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_extension_statement, _menhir_box_input) _menhir_state
      (** State 530.
        Stack shape : OPEN extension_statement.
        Start symbol: input. *)

    | MenhirState536 : ('s, _menhir_box_term) _menhir_state
      (** State 536.
        Stack shape : .
        Start symbol: term. *)

    | MenhirState539 : (('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_state
      (** State 539.
        Stack shape : OPEN.
        Start symbol: term. *)

    | MenhirState541 : ((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_UNDERSCORE _menhir_cell0_SYMBOL, _menhir_box_term) _menhir_state
      (** State 541.
        Stack shape : OPEN UNDERSCORE SYMBOL.
        Start symbol: term. *)

    | MenhirState544 : ((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_MATCH, _menhir_box_term) _menhir_state
      (** State 544.
        Stack shape : OPEN MATCH.
        Start symbol: term. *)

    | MenhirState546 : (((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_MATCH, _menhir_box_term) _menhir_cell1_term _menhir_cell0_OPEN, _menhir_box_term) _menhir_state
      (** State 546.
        Stack shape : OPEN MATCH term OPEN.
        Start symbol: term. *)

    | MenhirState551 : ((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_LET _menhir_cell0_OPEN, _menhir_box_term) _menhir_state
      (** State 551.
        Stack shape : OPEN LET OPEN.
        Start symbol: term. *)

    | MenhirState553 : (((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_LET _menhir_cell0_OPEN, _menhir_box_term) _menhir_cell1_nonempty_list_var_binding_ _menhir_cell0_CLOSE, _menhir_box_term) _menhir_state
      (** State 553.
        Stack shape : OPEN LET OPEN nonempty_list(var_binding) CLOSE.
        Start symbol: term. *)

    | MenhirState557 : ((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_FORALL _menhir_cell0_OPEN, _menhir_box_term) _menhir_state
      (** State 557.
        Stack shape : OPEN FORALL OPEN.
        Start symbol: term. *)

    | MenhirState559 : (((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_FORALL _menhir_cell0_OPEN, _menhir_box_term) _menhir_cell1_nonempty_list_sorted_var_ _menhir_cell0_CLOSE, _menhir_box_term) _menhir_state
      (** State 559.
        Stack shape : OPEN FORALL OPEN nonempty_list(sorted_var) CLOSE.
        Start symbol: term. *)

    | MenhirState563 : ((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_EXISTS _menhir_cell0_OPEN, _menhir_box_term) _menhir_state
      (** State 563.
        Stack shape : OPEN EXISTS OPEN.
        Start symbol: term. *)

    | MenhirState565 : (((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_EXISTS _menhir_cell0_OPEN, _menhir_box_term) _menhir_cell1_nonempty_list_sorted_var_ _menhir_cell0_CLOSE, _menhir_box_term) _menhir_state
      (** State 565.
        Stack shape : OPEN EXISTS OPEN nonempty_list(sorted_var) CLOSE.
        Start symbol: term. *)

    | MenhirState568 : ((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_ATTRIBUTE, _menhir_box_term) _menhir_state
      (** State 568.
        Stack shape : OPEN ATTRIBUTE.
        Start symbol: term. *)

    | MenhirState569 : (((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_ATTRIBUTE, _menhir_box_term) _menhir_cell1_term, _menhir_box_term) _menhir_state
      (** State 569.
        Stack shape : OPEN ATTRIBUTE term.
        Start symbol: term. *)

    | MenhirState572 : ((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_AS, _menhir_box_term) _menhir_state
      (** State 572.
        Stack shape : OPEN AS.
        Start symbol: term. *)

    | MenhirState573 : (((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_AS, _menhir_box_term) _menhir_cell1_identifier, _menhir_box_term) _menhir_state
      (** State 573.
        Stack shape : OPEN AS identifier.
        Start symbol: term. *)

    | MenhirState576 : ((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_qual_identifier, _menhir_box_term) _menhir_state
      (** State 576.
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
  
  and 's _menhir_cell0_function_dec_sorted_var_ = 
    | MenhirCell0_function_dec_sorted_var_ of 's * (I.t * T.t list * T.t list * T.t)
  
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
  
  and ('s, 'r) _menhir_cell1_nonempty_list___anonymous_0_ = 
    | MenhirCell1_nonempty_list___anonymous_0_ of 's * ('s, 'r) _menhir_state * ((I.t * T.t list * T.t list * T.t) list)
  
  and ('s, 'r) _menhir_cell1_nonempty_list_datatype_symbol_ = 
    | MenhirCell1_nonempty_list_datatype_symbol_ of 's * ('s, 'r) _menhir_state * (T.t list)
  
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
  
  and ('s, 'r) _menhir_cell1_CLOSE = 
    | MenhirCell1_CLOSE of 's * ('s, 'r) _menhir_state * Lexing.position
  
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
# 9 "src/languages/smtlib2/poly/tokens.mly"
       (string)
# 963 "src/languages/smtlib2/poly/parser.ml"
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
  
  and 's _menhir_cell0_PAR = 
    | MenhirCell0_PAR of 's * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_SET_INFO = 
    | MenhirCell1_SET_INFO of 's * ('s, 'r) _menhir_state * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_SET_OPTION = 
    | MenhirCell1_SET_OPTION of 's * ('s, 'r) _menhir_state * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_SYMBOL = 
    | MenhirCell1_SYMBOL of 's * ('s, 'r) _menhir_state * (
# 9 "src/languages/smtlib2/poly/tokens.mly"
       (string)
# 994 "src/languages/smtlib2/poly/parser.ml"
  ) * Lexing.position * Lexing.position
  
  and 's _menhir_cell0_SYMBOL = 
    | MenhirCell0_SYMBOL of 's * (
# 9 "src/languages/smtlib2/poly/tokens.mly"
       (string)
# 1001 "src/languages/smtlib2/poly/parser.ml"
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
# 144 "src/languages/smtlib2/poly/parser.mly"
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
# 1033 "src/languages/smtlib2/poly/parser.ml"
       : (T.t))
  
  let _menhir_action_004 =
    fun v ->
      (
# 135 "src/languages/smtlib2/poly/parser.mly"
    ( v )
# 1041 "src/languages/smtlib2/poly/parser.ml"
       : (T.t))
  
  let _menhir_action_005 =
    fun _endpos_v_ _startpos_v_ v ->
      let _endpos = _endpos_v_ in
      let _startpos = _startpos_v_ in
      (
# 137 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.const ~loc I.(mk attr v) )
# 1051 "src/languages/smtlib2/poly/parser.ml"
       : (T.t))
  
  let _menhir_action_006 =
    fun _endpos__3_ _startpos__1_ l ->
      let _endpos = _endpos__3_ in
      let _startpos = _startpos__1_ in
      (
# 139 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.sexpr ~loc l )
# 1061 "src/languages/smtlib2/poly/parser.ml"
       : (T.t))
  
  let _menhir_action_007 =
    fun _endpos__4_ _startpos__1_ t ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 372 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.assert_ ~loc t )
# 1071 "src/languages/smtlib2/poly/parser.ml"
       : (S.t))
  
  let _menhir_action_008 =
    fun _endpos__10_ _startpos__1_ t vars ->
      let _endpos = _endpos__10_ in
      let _startpos = _startpos__1_ in
      (
# 374 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      S.assert_ ~loc (T.par ~loc vars t) )
# 1082 "src/languages/smtlib2/poly/parser.ml"
       : (S.t))
  
  let _menhir_action_009 =
    fun _endpos__3_ _startpos__1_ ->
      let _endpos = _endpos__3_ in
      let _startpos = _startpos__1_ in
      (
# 377 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.check_sat ~loc [] )
# 1092 "src/languages/smtlib2/poly/parser.ml"
       : (S.t))
  
  let _menhir_action_010 =
    fun _endpos__6_ _startpos__1_ l ->
      let _endpos = _endpos__6_ in
      let _startpos = _startpos__1_ in
      (
# 379 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.check_sat ~loc l )
# 1102 "src/languages/smtlib2/poly/parser.ml"
       : (S.t))
  
  let _menhir_action_011 =
    fun _endpos__5_ _startpos__1_ s ty ->
      let _endpos = _endpos__5_ in
      let _startpos = _startpos__1_ in
      (
# 381 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.fun_decl ~loc I.(mk term s) [] [] ty )
# 1112 "src/languages/smtlib2/poly/parser.ml"
       : (S.t))
  
  let _menhir_action_012 =
    fun _endpos__11_ _startpos__1_ s ty vars ->
      let _endpos = _endpos__11_ in
      let _startpos = _startpos__1_ in
      (
# 383 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.fun_decl ~loc I.(mk term s) vars [] ty )
# 1122 "src/languages/smtlib2/poly/parser.ml"
       : (S.t))
  
  let _menhir_action_013 =
    fun _endpos__5_ _startpos__1_ d s ->
      let _endpos = _endpos__5_ in
      let _startpos = _startpos__1_ in
      (
# 385 "src/languages/smtlib2/poly/parser.mly"
    ( let vars, constructors = d in
      let loc = L.mk_pos _startpos _endpos in
      S.datatypes ~loc [I.(mk sort s), vars, constructors] )
# 1134 "src/languages/smtlib2/poly/parser.ml"
       : (S.t))
  
  let _menhir_action_014 =
    fun _endpos__8_ _endpos__9_ _startpos__1_ _startpos__3_ l1 l2 ->
      let _endpos = _endpos__9_ in
      let _startpos = _startpos__1_ in
      (
# 389 "src/languages/smtlib2/poly/parser.mly"
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
# 1154 "src/languages/smtlib2/poly/parser.ml"
       : (S.t))
  
  let _menhir_action_015 =
    fun _endpos__4_ _startpos__1_ dec ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 401 "src/languages/smtlib2/poly/parser.mly"
    ( let id, vars, args, ret = dec in
      let loc = L.mk_pos _startpos _endpos in
      S.fun_decl ~loc id vars args ret )
# 1166 "src/languages/smtlib2/poly/parser.ml"
       : (S.t))
  
  let _menhir_action_016 =
    fun _endpos__5_ _startpos__1_ n s ->
      let _endpos = _endpos__5_ in
      let _startpos = _startpos__1_ in
      (
# 405 "src/languages/smtlib2/poly/parser.mly"
    ( let id = I.(mk sort s) in
      let loc = L.mk_pos _startpos _endpos in
      S.type_decl ~loc id (int_of_string n) )
# 1178 "src/languages/smtlib2/poly/parser.ml"
       : (S.t))
  
  let _menhir_action_017 =
    fun _endpos__4_ _startpos__1_ f ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 409 "src/languages/smtlib2/poly/parser.mly"
    ( let id, vars, args, ret, body = f in
      let loc = L.mk_pos _startpos _endpos in
      S.fun_def ~loc id vars args ret body )
# 1190 "src/languages/smtlib2/poly/parser.ml"
       : (S.t))
  
  let _menhir_action_018 =
    fun _endpos__4_ _startpos__1_ f ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 413 "src/languages/smtlib2/poly/parser.mly"
    ( let id, vars, args, ret, body = f in
      let loc = L.mk_pos _startpos _endpos in
      S.funs_def_rec ~loc [id, vars, args, ret, body] )
# 1202 "src/languages/smtlib2/poly/parser.ml"
       : (S.t))
  
  let _menhir_action_019 =
    fun _endpos__8_ _endpos__9_ _startpos__1_ _startpos__3_ l1 l2 ->
      let _endpos = _endpos__9_ in
      let _startpos = _startpos__1_ in
      (
# 419 "src/languages/smtlib2/poly/parser.mly"
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
# 1221 "src/languages/smtlib2/poly/parser.ml"
       : (S.t))
  
  let _menhir_action_020 =
    fun _endpos__8_ _startpos__1_ args s ty ->
      let _endpos = _endpos__8_ in
      let _startpos = _startpos__1_ in
      (
# 430 "src/languages/smtlib2/poly/parser.mly"
    ( let id = I.(mk sort s) in
      let l = List.map I.(mk sort) args in
      let loc = L.mk_pos _startpos _endpos in
      S.type_def ~loc id l ty )
# 1234 "src/languages/smtlib2/poly/parser.ml"
       : (S.t))
  
  let _menhir_action_021 =
    fun _endpos__4_ _startpos__1_ s ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 435 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      S.echo ~loc s )
# 1245 "src/languages/smtlib2/poly/parser.ml"
       : (S.t))
  
  let _menhir_action_022 =
    fun _endpos__3_ _startpos__1_ ->
      let _endpos = _endpos__3_ in
      let _startpos = _startpos__1_ in
      (
# 439 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.exit ~loc () )
# 1255 "src/languages/smtlib2/poly/parser.ml"
       : (S.t))
  
  let _menhir_action_023 =
    fun _endpos__3_ _startpos__1_ ->
      let _endpos = _endpos__3_ in
      let _startpos = _startpos__1_ in
      (
# 442 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.get_assertions ~loc () )
# 1265 "src/languages/smtlib2/poly/parser.ml"
       : (S.t))
  
  let _menhir_action_024 =
    fun _endpos__3_ _startpos__1_ ->
      let _endpos = _endpos__3_ in
      let _startpos = _startpos__1_ in
      (
# 444 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.get_assignment ~loc () )
# 1275 "src/languages/smtlib2/poly/parser.ml"
       : (S.t))
  
  let _menhir_action_025 =
    fun _endpos__4_ _startpos__1_ i ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 446 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.get_info ~loc i )
# 1285 "src/languages/smtlib2/poly/parser.ml"
       : (S.t))
  
  let _menhir_action_026 =
    fun _endpos__3_ _startpos__1_ ->
      let _endpos = _endpos__3_ in
      let _startpos = _startpos__1_ in
      (
# 448 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.get_model ~loc () )
# 1295 "src/languages/smtlib2/poly/parser.ml"
       : (S.t))
  
  let _menhir_action_027 =
    fun _endpos__4_ _startpos__1_ k ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 450 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.get_option ~loc k )
# 1305 "src/languages/smtlib2/poly/parser.ml"
       : (S.t))
  
  let _menhir_action_028 =
    fun _endpos__3_ _startpos__1_ ->
      let _endpos = _endpos__3_ in
      let _startpos = _startpos__1_ in
      (
# 452 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.get_proof ~loc () )
# 1315 "src/languages/smtlib2/poly/parser.ml"
       : (S.t))
  
  let _menhir_action_029 =
    fun _endpos__3_ _startpos__1_ ->
      let _endpos = _endpos__3_ in
      let _startpos = _startpos__1_ in
      (
# 454 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.get_unsat_assumptions ~loc () )
# 1325 "src/languages/smtlib2/poly/parser.ml"
       : (S.t))
  
  let _menhir_action_030 =
    fun _endpos__3_ _startpos__1_ ->
      let _endpos = _endpos__3_ in
      let _startpos = _startpos__1_ in
      (
# 456 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.get_unsat_core ~loc () )
# 1335 "src/languages/smtlib2/poly/parser.ml"
       : (S.t))
  
  let _menhir_action_031 =
    fun _endpos__6_ _startpos__1_ l ->
      let _endpos = _endpos__6_ in
      let _startpos = _startpos__1_ in
      (
# 458 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.get_value ~loc l )
# 1345 "src/languages/smtlib2/poly/parser.ml"
       : (S.t))
  
  let _menhir_action_032 =
    fun _endpos__4_ _startpos__1_ n ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 461 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.pop ~loc (int_of_string n) )
# 1355 "src/languages/smtlib2/poly/parser.ml"
       : (S.t))
  
  let _menhir_action_033 =
    fun _endpos__4_ _startpos__1_ n ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 463 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.push ~loc (int_of_string n) )
# 1365 "src/languages/smtlib2/poly/parser.ml"
       : (S.t))
  
  let _menhir_action_034 =
    fun _endpos__3_ _startpos__1_ ->
      let _endpos = _endpos__3_ in
      let _startpos = _startpos__1_ in
      (
# 465 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.reset ~loc () )
# 1375 "src/languages/smtlib2/poly/parser.ml"
       : (S.t))
  
  let _menhir_action_035 =
    fun _endpos__3_ _startpos__1_ ->
      let _endpos = _endpos__3_ in
      let _startpos = _startpos__1_ in
      (
# 467 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.reset_assertions ~loc () )
# 1385 "src/languages/smtlib2/poly/parser.ml"
       : (S.t))
  
  let _menhir_action_036 =
    fun _endpos__4_ _startpos__1_ c ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 470 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.set_info ~loc c )
# 1395 "src/languages/smtlib2/poly/parser.ml"
       : (S.t))
  
  let _menhir_action_037 =
    fun _endpos__4_ _startpos__1_ s ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 472 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.set_logic ~loc s )
# 1405 "src/languages/smtlib2/poly/parser.ml"
       : (S.t))
  
  let _menhir_action_038 =
    fun _endpos__4_ _startpos__1_ c ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 474 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.set_option ~loc c )
# 1415 "src/languages/smtlib2/poly/parser.ml"
       : (S.t))
  
  let _menhir_action_039 =
    fun _endpos__4_ _startpos__1_ e l ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 477 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = Some (L.mk_pos _startpos _endpos) in
      e ?loc l )
# 1426 "src/languages/smtlib2/poly/parser.ml"
       : (S.t))
  
  let _menhir_action_040 =
    fun a ->
      (
# 279 "src/languages/smtlib2/poly/parser.mly"
    ( a )
# 1434 "src/languages/smtlib2/poly/parser.ml"
       : (T.t))
  
  let _menhir_action_041 =
    fun l s ->
      (
# 300 "src/languages/smtlib2/poly/parser.mly"
    ( (I.mk I.term s), l )
# 1442 "src/languages/smtlib2/poly/parser.ml"
       : (I.t * T.t list))
  
  let _menhir_action_042 =
    fun l ->
      (
# 311 "src/languages/smtlib2/poly/parser.mly"
    ( [], l )
# 1450 "src/languages/smtlib2/poly/parser.ml"
       : (T.t list * (I.t * T.t list) list))
  
  let _menhir_action_043 =
    fun l vars ->
      (
# 313 "src/languages/smtlib2/poly/parser.mly"
    ( vars, l )
# 1458 "src/languages/smtlib2/poly/parser.ml"
       : (T.t list * (I.t * T.t list) list))
  
  let _menhir_action_044 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 307 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.const ~loc I.(mk sort s) )
# 1468 "src/languages/smtlib2/poly/parser.ml"
       : (T.t))
  
  let _menhir_action_045 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 483 "src/languages/smtlib2/poly/parser.mly"
    ( match E.statement s with
      | Some mk_ext -> mk_ext
      | None ->
        let loc = L.mk_pos _startpos _endpos in
        raise (L.Syntax_error (loc, `Advanced ("115",
          Format.dprintf "a command",
          Format.dprintf "the symbol '%s'" s,
          Format.dprintf "a command name")))
    )
# 1486 "src/languages/smtlib2/poly/parser.ml"
       : (?loc:L.t -> T.t list -> S.t))
  
  let _menhir_action_046 =
    fun l ->
      (
# 496 "src/languages/smtlib2/poly/parser.mly"
    ( l )
# 1494 "src/languages/smtlib2/poly/parser.ml"
       : (S.t list))
  
  let _menhir_action_047 =
    fun args ret s ->
      (
# 318 "src/languages/smtlib2/poly/parser.mly"
    ( I.(mk term s), [], args, ret )
# 1502 "src/languages/smtlib2/poly/parser.ml"
       : (I.t * T.t list * T.t list * T.t))
  
  let _menhir_action_048 =
    fun args ret s vars ->
      (
# 323 "src/languages/smtlib2/poly/parser.mly"
    ( I.(mk term s), vars, args, ret )
# 1510 "src/languages/smtlib2/poly/parser.ml"
       : (I.t * T.t list * T.t list * T.t))
  
  let _menhir_action_049 =
    fun args ret s vars ->
      (
# 323 "src/languages/smtlib2/poly/parser.mly"
    ( I.(mk term s), vars, args, ret )
# 1518 "src/languages/smtlib2/poly/parser.ml"
       : (I.t * T.t list * T.t list * T.t))
  
  let _menhir_action_050 =
    fun args ret s ->
      (
# 318 "src/languages/smtlib2/poly/parser.mly"
    ( I.(mk term s), [], args, ret )
# 1526 "src/languages/smtlib2/poly/parser.ml"
       : (I.t * T.t list * T.t list * T.t))
  
  let _menhir_action_051 =
    fun args ret s vars ->
      (
# 323 "src/languages/smtlib2/poly/parser.mly"
    ( I.(mk term s), vars, args, ret )
# 1534 "src/languages/smtlib2/poly/parser.ml"
       : (I.t * T.t list * T.t list * T.t))
  
  let _menhir_action_052 =
    fun args ret s vars ->
      (
# 323 "src/languages/smtlib2/poly/parser.mly"
    ( I.(mk term s), vars, args, ret )
# 1542 "src/languages/smtlib2/poly/parser.ml"
       : (I.t * T.t list * T.t list * T.t))
  
  let _menhir_action_053 =
    fun args body ret s ->
      (
# 327 "src/languages/smtlib2/poly/parser.mly"
    ( I.(mk term s), [], args, ret, body )
# 1550 "src/languages/smtlib2/poly/parser.ml"
       : (I.t * T.t list * T.t list * T.t * T.t))
  
  let _menhir_action_054 =
    fun args body ret s vars ->
      (
# 334 "src/languages/smtlib2/poly/parser.mly"
    ( I.(mk term s), vars, args, ret, body )
# 1558 "src/languages/smtlib2/poly/parser.ml"
       : (I.t * T.t list * T.t list * T.t * T.t))
  
  let _menhir_action_055 =
    fun args body ret s vars ->
      (
# 334 "src/languages/smtlib2/poly/parser.mly"
    ( I.(mk term s), vars, args, ret, body )
# 1566 "src/languages/smtlib2/poly/parser.ml"
       : (I.t * T.t list * T.t list * T.t * T.t))
  
  let _menhir_action_056 =
    fun args body ret s vars ->
      (
# 334 "src/languages/smtlib2/poly/parser.mly"
    ( I.(mk term s), vars, args, ret, body )
# 1574 "src/languages/smtlib2/poly/parser.ml"
       : (I.t * T.t list * T.t list * T.t * T.t))
  
  let _menhir_action_057 =
    fun s ->
      (
# 117 "src/languages/smtlib2/poly/parser.mly"
    ( fun ns -> I.mk ns s )
# 1582 "src/languages/smtlib2/poly/parser.ml"
       : (I.namespace -> I.t))
  
  let _menhir_action_058 =
    fun l s ->
      (
# 119 "src/languages/smtlib2/poly/parser.mly"
    ( fun ns -> I.indexed ns s l )
# 1590 "src/languages/smtlib2/poly/parser.ml"
       : (I.namespace -> I.t))
  
  let _menhir_action_059 =
    fun s ->
      (
# 109 "src/languages/smtlib2/poly/parser.mly"
    ( s )
# 1598 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_060 =
    fun s ->
      (
# 109 "src/languages/smtlib2/poly/parser.mly"
    ( s )
# 1606 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_061 =
    fun s ->
      (
# 112 "src/languages/smtlib2/poly/parser.mly"
    ( s )
# 1614 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_062 =
    fun s ->
      (
# 245 "src/languages/smtlib2/poly/parser.mly"
    ( s )
# 1622 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_063 =
    fun () ->
      (
# 501 "src/languages/smtlib2/poly/parser.mly"
    ( None )
# 1630 "src/languages/smtlib2/poly/parser.ml"
       : (S.t option))
  
  let _menhir_action_064 =
    fun c ->
      (
# 503 "src/languages/smtlib2/poly/parser.mly"
    ( Some c )
# 1638 "src/languages/smtlib2/poly/parser.ml"
       : (S.t option))
  
  let _menhir_action_065 =
    fun () ->
      (
# 216 "<standard.mly>"
    ( [] )
# 1646 "src/languages/smtlib2/poly/parser.ml"
       : (string list))
  
  let _menhir_action_066 =
    fun x xs ->
      (
# 219 "<standard.mly>"
    ( x :: xs )
# 1654 "src/languages/smtlib2/poly/parser.ml"
       : (string list))
  
  let _menhir_action_067 =
    fun () ->
      (
# 216 "<standard.mly>"
    ( [] )
# 1662 "src/languages/smtlib2/poly/parser.ml"
       : (S.t list))
  
  let _menhir_action_068 =
    fun x xs ->
      (
# 219 "<standard.mly>"
    ( x :: xs )
# 1670 "src/languages/smtlib2/poly/parser.ml"
       : (S.t list))
  
  let _menhir_action_069 =
    fun () ->
      (
# 216 "<standard.mly>"
    ( [] )
# 1678 "src/languages/smtlib2/poly/parser.ml"
       : (T.t list))
  
  let _menhir_action_070 =
    fun x xs ->
      (
# 219 "<standard.mly>"
    ( x :: xs )
# 1686 "src/languages/smtlib2/poly/parser.ml"
       : (T.t list))
  
  let _menhir_action_071 =
    fun () ->
      (
# 216 "<standard.mly>"
    ( [] )
# 1694 "src/languages/smtlib2/poly/parser.ml"
       : (T.t list))
  
  let _menhir_action_072 =
    fun x xs ->
      (
# 219 "<standard.mly>"
    ( x :: xs )
# 1702 "src/languages/smtlib2/poly/parser.ml"
       : (T.t list))
  
  let _menhir_action_073 =
    fun () ->
      (
# 216 "<standard.mly>"
    ( [] )
# 1710 "src/languages/smtlib2/poly/parser.ml"
       : (T.t list))
  
  let _menhir_action_074 =
    fun x xs ->
      (
# 219 "<standard.mly>"
    ( x :: xs )
# 1718 "src/languages/smtlib2/poly/parser.ml"
       : (T.t list))
  
  let _menhir_action_075 =
    fun () ->
      (
# 216 "<standard.mly>"
    ( [] )
# 1726 "src/languages/smtlib2/poly/parser.ml"
       : (T.t list))
  
  let _menhir_action_076 =
    fun x xs ->
      (
# 219 "<standard.mly>"
    ( x :: xs )
# 1734 "src/languages/smtlib2/poly/parser.ml"
       : (T.t list))
  
  let _menhir_action_077 =
    fun () ->
      (
# 216 "<standard.mly>"
    ( [] )
# 1742 "src/languages/smtlib2/poly/parser.ml"
       : (T.t list))
  
  let _menhir_action_078 =
    fun x xs ->
      (
# 219 "<standard.mly>"
    ( x :: xs )
# 1750 "src/languages/smtlib2/poly/parser.ml"
       : (T.t list))
  
  let _menhir_action_079 =
    fun p t ->
      (
# 205 "src/languages/smtlib2/poly/parser.mly"
    ( p, t )
# 1758 "src/languages/smtlib2/poly/parser.ml"
       : (T.t * T.t))
  
  let _menhir_action_080 =
    fun dec ->
      let x = 
# 418 "src/languages/smtlib2/poly/parser.mly"
                                                                                       ( dec )
# 1766 "src/languages/smtlib2/poly/parser.ml"
       in
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 1771 "src/languages/smtlib2/poly/parser.ml"
       : ((I.t * T.t list * T.t list * T.t) list))
  
  let _menhir_action_081 =
    fun dec xs ->
      let x = 
# 418 "src/languages/smtlib2/poly/parser.mly"
                                                                                       ( dec )
# 1779 "src/languages/smtlib2/poly/parser.ml"
       in
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 1784 "src/languages/smtlib2/poly/parser.ml"
       : ((I.t * T.t list * T.t list * T.t) list))
  
  let _menhir_action_082 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 1792 "src/languages/smtlib2/poly/parser.ml"
       : (T.t list))
  
  let _menhir_action_083 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 1800 "src/languages/smtlib2/poly/parser.ml"
       : (T.t list))
  
  let _menhir_action_084 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 1808 "src/languages/smtlib2/poly/parser.ml"
       : ((I.t * T.t list) list))
  
  let _menhir_action_085 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 1816 "src/languages/smtlib2/poly/parser.ml"
       : ((I.t * T.t list) list))
  
  let _menhir_action_086 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 1824 "src/languages/smtlib2/poly/parser.ml"
       : ((T.t list * (I.t * T.t list) list) list))
  
  let _menhir_action_087 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 1832 "src/languages/smtlib2/poly/parser.ml"
       : ((T.t list * (I.t * T.t list) list) list))
  
  let _menhir_action_088 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 1840 "src/languages/smtlib2/poly/parser.ml"
       : (T.t list))
  
  let _menhir_action_089 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 1848 "src/languages/smtlib2/poly/parser.ml"
       : (T.t list))
  
  let _menhir_action_090 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 1856 "src/languages/smtlib2/poly/parser.ml"
       : (string list))
  
  let _menhir_action_091 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 1864 "src/languages/smtlib2/poly/parser.ml"
       : (string list))
  
  let _menhir_action_092 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 1872 "src/languages/smtlib2/poly/parser.ml"
       : ((T.t * T.t) list))
  
  let _menhir_action_093 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 1880 "src/languages/smtlib2/poly/parser.ml"
       : ((T.t * T.t) list))
  
  let _menhir_action_094 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 1888 "src/languages/smtlib2/poly/parser.ml"
       : (T.t list))
  
  let _menhir_action_095 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 1896 "src/languages/smtlib2/poly/parser.ml"
       : (T.t list))
  
  let _menhir_action_096 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 1904 "src/languages/smtlib2/poly/parser.ml"
       : (T.t list))
  
  let _menhir_action_097 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 1912 "src/languages/smtlib2/poly/parser.ml"
       : (T.t list))
  
  let _menhir_action_098 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 1920 "src/languages/smtlib2/poly/parser.ml"
       : ((I.t * int) list))
  
  let _menhir_action_099 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 1928 "src/languages/smtlib2/poly/parser.ml"
       : ((I.t * int) list))
  
  let _menhir_action_100 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 1936 "src/languages/smtlib2/poly/parser.ml"
       : (T.t list))
  
  let _menhir_action_101 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 1944 "src/languages/smtlib2/poly/parser.ml"
       : (T.t list))
  
  let _menhir_action_102 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 1952 "src/languages/smtlib2/poly/parser.ml"
       : (T.t list))
  
  let _menhir_action_103 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 1960 "src/languages/smtlib2/poly/parser.ml"
       : (T.t list))
  
  let _menhir_action_104 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 1968 "src/languages/smtlib2/poly/parser.ml"
       : (T.t list))
  
  let _menhir_action_105 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 1976 "src/languages/smtlib2/poly/parser.ml"
       : (T.t list))
  
  let _menhir_action_106 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 349 "src/languages/smtlib2/poly/parser.mly"
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
# 1997 "src/languages/smtlib2/poly/parser.ml"
       : (T.t))
  
  let _menhir_action_107 =
    fun () ->
      (
# 111 "<standard.mly>"
    ( None )
# 2005 "src/languages/smtlib2/poly/parser.ml"
       : (T.t option))
  
  let _menhir_action_108 =
    fun x ->
      (
# 114 "<standard.mly>"
    ( Some x )
# 2013 "src/languages/smtlib2/poly/parser.ml"
       : (T.t option))
  
  let _menhir_action_109 =
    fun c ->
      (
# 198 "src/languages/smtlib2/poly/parser.mly"
    ( c )
# 2021 "src/languages/smtlib2/poly/parser.ml"
       : (T.t))
  
  let _menhir_action_110 =
    fun _endpos__4_ _startpos__1_ args f ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 200 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.apply ~loc f args )
# 2031 "src/languages/smtlib2/poly/parser.ml"
       : (T.t))
  
  let _menhir_action_111 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 193 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.const ~loc I.(mk term s) )
# 2041 "src/languages/smtlib2/poly/parser.ml"
       : (T.t))
  
  let _menhir_action_112 =
    fun s ->
      (
# 365 "src/languages/smtlib2/poly/parser.mly"
    ( s )
# 2049 "src/languages/smtlib2/poly/parser.ml"
       : (T.t))
  
  let _menhir_action_113 =
    fun _endpos__4_ _startpos__1_ f s ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 367 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.apply ~loc f [s] )
# 2059 "src/languages/smtlib2/poly/parser.ml"
       : (T.t))
  
  let _menhir_action_114 =
    fun s ->
      (
# 340 "src/languages/smtlib2/poly/parser.mly"
                     ( s )
# 2067 "src/languages/smtlib2/poly/parser.ml"
       : (T.t))
  
  let _menhir_action_115 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 163 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in `NoAs (T.const ~loc (s I.term)) )
# 2077 "src/languages/smtlib2/poly/parser.ml"
       : ([ `As of T.t * T.t * L.t | `NoAs of T.t ]))
  
  let _menhir_action_116 =
    fun _endpos__5_ _endpos_s_ _startpos__1_ _startpos_s_ s ty ->
      let _endpos = _endpos__5_ in
      let _startpos = _startpos__1_ in
      (
# 165 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos_s_ _endpos_s_ in
      let as_loc = L.mk_pos _startpos _endpos in
      `As (T.const ~loc (s I.term), ty, as_loc) )
# 2089 "src/languages/smtlib2/poly/parser.ml"
       : ([ `As of T.t * T.t * L.t | `NoAs of T.t ]))
  
  let _menhir_action_117 =
    fun () ->
      (
# 53 "src/languages/smtlib2/poly/parser.mly"
               ( "_" )
# 2097 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_118 =
    fun () ->
      (
# 54 "src/languages/smtlib2/poly/parser.mly"
              ( "!" )
# 2105 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_119 =
    fun () ->
      (
# 55 "src/languages/smtlib2/poly/parser.mly"
       ( "as" )
# 2113 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_120 =
    fun () ->
      (
# 56 "src/languages/smtlib2/poly/parser.mly"
        ( "let" )
# 2121 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_121 =
    fun () ->
      (
# 57 "src/languages/smtlib2/poly/parser.mly"
           ( "exists" )
# 2129 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_122 =
    fun () ->
      (
# 58 "src/languages/smtlib2/poly/parser.mly"
           ( "forall" )
# 2137 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_123 =
    fun () ->
      (
# 59 "src/languages/smtlib2/poly/parser.mly"
          ( "match" )
# 2145 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_124 =
    fun () ->
      (
# 60 "src/languages/smtlib2/poly/parser.mly"
        ( "par" )
# 2153 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_125 =
    fun () ->
      (
# 61 "src/languages/smtlib2/poly/parser.mly"
           ( "assert" )
# 2161 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_126 =
    fun () ->
      (
# 62 "src/languages/smtlib2/poly/parser.mly"
              ( "check-sat" )
# 2169 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_127 =
    fun () ->
      (
# 63 "src/languages/smtlib2/poly/parser.mly"
                       ( "check-sat-assuming" )
# 2177 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_128 =
    fun () ->
      (
# 64 "src/languages/smtlib2/poly/parser.mly"
                  ( "declare-const" )
# 2185 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_129 =
    fun () ->
      (
# 65 "src/languages/smtlib2/poly/parser.mly"
                     ( "declare-datatype" )
# 2193 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_130 =
    fun () ->
      (
# 66 "src/languages/smtlib2/poly/parser.mly"
                      ( "declare-datatypes" )
# 2201 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_131 =
    fun () ->
      (
# 67 "src/languages/smtlib2/poly/parser.mly"
                ( "declare-fun" )
# 2209 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_132 =
    fun () ->
      (
# 68 "src/languages/smtlib2/poly/parser.mly"
                 ( "declare-sort" )
# 2217 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_133 =
    fun () ->
      (
# 69 "src/languages/smtlib2/poly/parser.mly"
               ( "define-fun" )
# 2225 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_134 =
    fun () ->
      (
# 70 "src/languages/smtlib2/poly/parser.mly"
                   ( "define-fun-rec" )
# 2233 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_135 =
    fun () ->
      (
# 71 "src/languages/smtlib2/poly/parser.mly"
                    ( "define-funs-rec" )
# 2241 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_136 =
    fun () ->
      (
# 72 "src/languages/smtlib2/poly/parser.mly"
                ( "define-sort" )
# 2249 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_137 =
    fun () ->
      (
# 73 "src/languages/smtlib2/poly/parser.mly"
         ( "echo" )
# 2257 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_138 =
    fun () ->
      (
# 74 "src/languages/smtlib2/poly/parser.mly"
         ( "exit" )
# 2265 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_139 =
    fun () ->
      (
# 75 "src/languages/smtlib2/poly/parser.mly"
                   ( "get-assertions" )
# 2273 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_140 =
    fun () ->
      (
# 76 "src/languages/smtlib2/poly/parser.mly"
                   ( "get-assignment" )
# 2281 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_141 =
    fun () ->
      (
# 77 "src/languages/smtlib2/poly/parser.mly"
             ( "get-info" )
# 2289 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_142 =
    fun () ->
      (
# 78 "src/languages/smtlib2/poly/parser.mly"
              ( "get-model" )
# 2297 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_143 =
    fun () ->
      (
# 79 "src/languages/smtlib2/poly/parser.mly"
               ( "get-option" )
# 2305 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_144 =
    fun () ->
      (
# 80 "src/languages/smtlib2/poly/parser.mly"
              ( "get-proof" )
# 2313 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_145 =
    fun () ->
      (
# 81 "src/languages/smtlib2/poly/parser.mly"
                          ( "get-unsat-assumptions" )
# 2321 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_146 =
    fun () ->
      (
# 82 "src/languages/smtlib2/poly/parser.mly"
                   ( "get-unsat-core" )
# 2329 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_147 =
    fun () ->
      (
# 83 "src/languages/smtlib2/poly/parser.mly"
              ( "get-value" )
# 2337 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_148 =
    fun () ->
      (
# 84 "src/languages/smtlib2/poly/parser.mly"
        ( "pop" )
# 2345 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_149 =
    fun () ->
      (
# 85 "src/languages/smtlib2/poly/parser.mly"
         ( "push" )
# 2353 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_150 =
    fun () ->
      (
# 86 "src/languages/smtlib2/poly/parser.mly"
          ( "reset" )
# 2361 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_151 =
    fun () ->
      (
# 87 "src/languages/smtlib2/poly/parser.mly"
                     ( "reset-assertions" )
# 2369 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_152 =
    fun () ->
      (
# 88 "src/languages/smtlib2/poly/parser.mly"
             ( "set-info" )
# 2377 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_153 =
    fun () ->
      (
# 89 "src/languages/smtlib2/poly/parser.mly"
              ( "set-logic" )
# 2385 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_154 =
    fun () ->
      (
# 90 "src/languages/smtlib2/poly/parser.mly"
               ( "set-option" )
# 2393 "src/languages/smtlib2/poly/parser.ml"
       : (string))
  
  let _menhir_action_155 =
    fun c ->
      (
# 95 "src/languages/smtlib2/poly/parser.mly"
    ( c )
# 2401 "src/languages/smtlib2/poly/parser.ml"
       : (T.t))
  
  let _menhir_action_156 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 97 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.const ~loc I.(mk term s) )
# 2411 "src/languages/smtlib2/poly/parser.ml"
       : (T.t))
  
  let _menhir_action_157 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 99 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.const ~loc I.(mk term s) )
# 2421 "src/languages/smtlib2/poly/parser.ml"
       : (T.t))
  
  let _menhir_action_158 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 101 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.const ~loc I.(mk term s) )
# 2431 "src/languages/smtlib2/poly/parser.ml"
       : (T.t))
  
  let _menhir_action_159 =
    fun _endpos__3_ _startpos__1_ l ->
      let _endpos = _endpos__3_ in
      let _startpos = _startpos__1_ in
      (
# 103 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.sexpr ~loc l )
# 2441 "src/languages/smtlib2/poly/parser.ml"
       : (T.t))
  
  let _menhir_action_160 =
    fun _endpos__4_ _startpos__1_ s ty ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 290 "src/languages/smtlib2/poly/parser.mly"
    ( let f =
      let loc = L.mk_pos _startpos _endpos in
      T.const ~loc (I.mk I.term s)
    in
    let loc = L.mk_pos _startpos _endpos in
    T.colon ~loc f ty )
# 2456 "src/languages/smtlib2/poly/parser.ml"
       : (T.t))
  
  let _menhir_action_161 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 124 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.const ~loc (s I.sort) )
# 2466 "src/languages/smtlib2/poly/parser.ml"
       : (T.t))
  
  let _menhir_action_162 =
    fun _endpos__4_ _endpos_f_ _startpos__1_ _startpos_f_ args f ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 126 "src/languages/smtlib2/poly/parser.mly"
    ( let c =
        let loc = L.mk_pos _startpos_f_ _endpos_f_ in
        T.const ~loc (f I.sort)
      in
      let loc = L.mk_pos _startpos _endpos in T.apply ~loc c args )
# 2480 "src/languages/smtlib2/poly/parser.ml"
       : (T.t))
  
  let _menhir_action_163 =
    fun n s ->
      (
# 284 "src/languages/smtlib2/poly/parser.mly"
    ( I.(mk sort s), int_of_string n
      (* shouldn't raise because of the definition of numeral in lexer *) )
# 2489 "src/languages/smtlib2/poly/parser.ml"
       : (I.t * int))
  
  let _menhir_action_164 =
    fun _endpos__4_ _endpos_s_ _startpos__1_ _startpos_s_ s ty ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 181 "src/languages/smtlib2/poly/parser.mly"
    ( let c =
        let loc = L.mk_pos _startpos_s_ _endpos_s_ in
        T.const ~loc I.(mk term s)
      in
      let loc = L.mk_pos _startpos _endpos in T.colon ~loc c ty )
# 2503 "src/languages/smtlib2/poly/parser.ml"
       : (T.t))
  
  let _menhir_action_165 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 34 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.int ~loc s )
# 2513 "src/languages/smtlib2/poly/parser.ml"
       : (T.t))
  
  let _menhir_action_166 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 36 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.real ~loc s )
# 2523 "src/languages/smtlib2/poly/parser.ml"
       : (T.t))
  
  let _menhir_action_167 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 38 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.hexa ~loc s )
# 2533 "src/languages/smtlib2/poly/parser.ml"
       : (T.t))
  
  let _menhir_action_168 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 40 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.binary ~loc s )
# 2543 "src/languages/smtlib2/poly/parser.ml"
       : (T.t))
  
  let _menhir_action_169 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 42 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.str ~loc s )
# 2553 "src/languages/smtlib2/poly/parser.ml"
       : (T.t))
  
  let _menhir_action_170 =
    fun c ->
      (
# 210 "src/languages/smtlib2/poly/parser.mly"
    ( c )
# 2561 "src/languages/smtlib2/poly/parser.ml"
       : (T.t))
  
  let _menhir_action_171 =
    fun s ->
      (
# 212 "src/languages/smtlib2/poly/parser.mly"
    ( match s with
      | `NoAs f -> f
      | `As (f, ty, loc) -> T.colon ~loc f ty )
# 2571 "src/languages/smtlib2/poly/parser.ml"
       : (T.t))
  
  let _menhir_action_172 =
    fun _endpos__4_ _startpos__1_ args s ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 216 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      match s with
      | `NoAs f -> T.apply ~loc f args
      | `As (f, ty, as_loc) -> T.colon ~loc:as_loc (T.apply ~loc f args) ty )
# 2584 "src/languages/smtlib2/poly/parser.ml"
       : (T.t))
  
  let _menhir_action_173 =
    fun _endpos__7_ _startpos__1_ l t ->
      let _endpos = _endpos__7_ in
      let _startpos = _startpos__1_ in
      (
# 221 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.letand ~loc l t )
# 2594 "src/languages/smtlib2/poly/parser.ml"
       : (T.t))
  
  let _menhir_action_174 =
    fun _endpos__7_ _startpos__1_ l t ->
      let _endpos = _endpos__7_ in
      let _startpos = _startpos__1_ in
      (
# 223 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.forall ~loc l t )
# 2604 "src/languages/smtlib2/poly/parser.ml"
       : (T.t))
  
  let _menhir_action_175 =
    fun _endpos__7_ _startpos__1_ l t ->
      let _endpos = _endpos__7_ in
      let _startpos = _startpos__1_ in
      (
# 225 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.exists ~loc l t )
# 2614 "src/languages/smtlib2/poly/parser.ml"
       : (T.t))
  
  let _menhir_action_176 =
    fun _endpos__7_ _startpos__1_ l t ->
      let _endpos = _endpos__7_ in
      let _startpos = _startpos__1_ in
      (
# 227 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.match_ ~loc t l )
# 2624 "src/languages/smtlib2/poly/parser.ml"
       : (T.t))
  
  let _menhir_action_177 =
    fun _endpos__5_ _startpos__1_ args f ->
      let _endpos = _endpos__5_ in
      let _startpos = _startpos__1_ in
      (
# 229 "src/languages/smtlib2/poly/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.annot ~loc f args )
# 2634 "src/languages/smtlib2/poly/parser.ml"
       : (T.t))
  
  let _menhir_action_178 =
    fun _endpos__4_ _endpos_s_ _startpos__1_ _startpos_s_ s t ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 172 "src/languages/smtlib2/poly/parser.mly"
    ( let c =
        let loc = L.mk_pos _startpos_s_ _endpos_s_ in
        T.const ~loc I.(mk term s)
      in
      let loc = L.mk_pos _startpos _endpos in T.colon ~loc c t )
# 2648 "src/languages/smtlib2/poly/parser.ml"
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
    
    let _menhir_run_583 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_term =
      fun _menhir_stack _v ->
        MenhirBox_term _v
    
    let _menhir_goto_input : type  ttv_stack. ttv_stack -> _ -> _menhir_box_input =
      fun _menhir_stack _v ->
        MenhirBox_input _v
    
    let _menhir_run_535 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_input =
      fun _menhir_stack _v ->
        let c = _v in
        let _v = _menhir_action_064 c in
        _menhir_goto_input _menhir_stack _v
    
    let _menhir_run_406 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_file =
      fun _menhir_stack _v ->
        let l = _v in
        let _v = _menhir_action_046 l in
        MenhirBox_file _v
    
    let rec _menhir_run_410 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_command -> _ -> _menhir_box_file =
      fun _menhir_stack _v ->
        let MenhirCell1_command (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_068 x xs in
        _menhir_goto_list_command_ _menhir_stack _v _menhir_s
    
    and _menhir_goto_list_command_ : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _v _menhir_s ->
        match _menhir_s with
        | MenhirState409 ->
            _menhir_run_410 _menhir_stack _v
        | MenhirState000 ->
            _menhir_run_406 _menhir_stack _v
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
                    let _v = _menhir_action_037 _endpos__4_ _startpos__1_ s in
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
                let _v = _menhir_action_035 _endpos__3_ _startpos__1_ in
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
                let _v = _menhir_action_034 _endpos__3_ _startpos__1_ in
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
                    let _v = _menhir_action_033 _endpos__4_ _startpos__1_ n in
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
                    let _v = _menhir_action_032 _endpos__4_ _startpos__1_ n in
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
                let _v = _menhir_action_030 _endpos__3_ _startpos__1_ in
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
                let _v = _menhir_action_029 _endpos__3_ _startpos__1_ in
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
                let _v = _menhir_action_028 _endpos__3_ _startpos__1_ in
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
                    let _v = _menhir_action_027 _endpos__4_ _startpos__1_ k in
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
                let _v = _menhir_action_026 _endpos__3_ _startpos__1_ in
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
                let _v = _menhir_action_024 _endpos__3_ _startpos__1_ in
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
                let _v = _menhir_action_023 _endpos__3_ _startpos__1_ in
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
                let _v = _menhir_action_022 _endpos__3_ _startpos__1_ in
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
                    let _v = _menhir_action_021 _endpos__4_ _startpos__1_ s in
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
                        let _v_48 = _menhir_action_065 () in
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
            | Tokens.OPEN ->
                _menhir_run_233 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
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
                let _menhir_s = MenhirState248 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.OPEN ->
                    _menhir_run_249 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | _ ->
                    _eRR 248)
            | _ ->
                _eRR 247)
        | Tokens.DEFINE_FUN ->
            let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
            let _menhir_s = MenhirState001 in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell1_DEFINE_FUN (_menhir_stack, _menhir_s, _startpos, _endpos) in
            let _menhir_s = MenhirState284 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SYMBOL _v ->
                _menhir_run_210 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.OPEN ->
                _menhir_run_233 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 284)
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
                        let _v = _menhir_action_016 _endpos__5_ _startpos__1_ n s in
                        _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
                    | _ ->
                        _eRR 289)
                | _ ->
                    _eRR 288)
            | _ ->
                _eRR 287)
        | Tokens.DECLARE_FUN ->
            let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
            let _menhir_s = MenhirState001 in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell1_DECLARE_FUN (_menhir_stack, _menhir_s, _startpos, _endpos) in
            let _menhir_s = MenhirState291 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SYMBOL _v ->
                _menhir_run_292 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.OPEN ->
                _menhir_run_308 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 291)
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
                let _menhir_s = MenhirState322 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.OPEN ->
                    _menhir_run_323 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | _ ->
                    _eRR 322)
            | _ ->
                _eRR 321)
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
                let _menhir_s = MenhirState361 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.OPEN ->
                    _menhir_run_332 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | _ ->
                    _eRR 361)
            | _ ->
                _eRR 360)
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
                let _menhir_s = MenhirState365 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SYMBOL _v ->
                    _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.OPEN ->
                    let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                    let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
                    let _menhir_s = MenhirState366 in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.UNDERSCORE ->
                        _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                    | Tokens.SYMBOL _v ->
                        _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                    | Tokens.PAR ->
                        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                        let _menhir_stack = MenhirCell1_PAR (_menhir_stack, _menhir_s, _startpos, _endpos) in
                        let _tok = _menhir_lexer _menhir_lexbuf in
                        (match (_tok : MenhirBasics.token) with
                        | Tokens.OPEN ->
                            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                            let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
                            let _menhir_s = MenhirState368 in
                            let _tok = _menhir_lexer _menhir_lexbuf in
                            (match (_tok : MenhirBasics.token) with
                            | Tokens.SYMBOL _v ->
                                _menhir_run_214 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                            | _ ->
                                _eRR 368)
                        | _ ->
                            _eRR 367)
                    | Tokens.OPEN ->
                        _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                    | _ ->
                        _eRR 366)
                | _ ->
                    _eRR 365)
            | _ ->
                _eRR 364)
        | Tokens.CHECK_SAT_ASSUMING ->
            let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
            let _startpos_76 = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell1_CHECK_SAT_ASSUMING (_menhir_stack, MenhirState001, _startpos_76, _endpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                let _startpos_77 = _menhir_lexbuf.Lexing.lex_start_p in
                let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos_77) in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SYMBOL _v ->
                    _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState377
                | Tokens.OPEN ->
                    _menhir_run_378 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState377
                | Tokens.CLOSE ->
                    let _v = _menhir_action_069 () in
                    _menhir_run_387 _menhir_stack _menhir_lexbuf _menhir_lexer _v
                | _ ->
                    _eRR 377)
            | _ ->
                _eRR 376)
        | Tokens.CHECK_SAT ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.CLOSE ->
                let _endpos_79 = _menhir_lexbuf.Lexing.lex_curr_p in
                let _tok = _menhir_lexer _menhir_lexbuf in
                let (_startpos__1_, _endpos__3_) = (_startpos, _endpos_79) in
                let _v = _menhir_action_009 _endpos__3_ _startpos__1_ in
                _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
            | _ ->
                _eRR 390)
        | Tokens.ASSERT ->
            let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
            let _menhir_s = MenhirState001 in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell1_ASSERT (_menhir_stack, _menhir_s, _startpos, _endpos) in
            let _menhir_s = MenhirState392 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SYMBOL _v ->
                _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.STR _v ->
                _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.OPEN ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
                let _menhir_s = MenhirState393 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.UNDERSCORE ->
                    _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | Tokens.SYMBOL _v ->
                    _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.PAR ->
                    let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                    let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                    let _menhir_stack = MenhirCell1_PAR (_menhir_stack, _menhir_s, _startpos, _endpos) in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.OPEN ->
                        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                        let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
                        let _menhir_s = MenhirState395 in
                        let _tok = _menhir_lexer _menhir_lexbuf in
                        (match (_tok : MenhirBasics.token) with
                        | Tokens.SYMBOL _v ->
                            _menhir_run_214 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                        | _ ->
                            _eRR 395)
                    | _ ->
                        _eRR 394)
                | Tokens.OPEN ->
                    _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | Tokens.MATCH ->
                    _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | Tokens.LET ->
                    _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | Tokens.FORALL ->
                    _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | Tokens.EXISTS ->
                    _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | Tokens.ATTRIBUTE ->
                    _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | Tokens.AS ->
                    _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | _ ->
                    _eRR 393)
            | Tokens.NUM _v ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.HEX _v ->
                _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DEC _v ->
                _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.BIN _v ->
                _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 392)
        | _ ->
            _eRR 1
    
    and _menhir_run_002 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_045 _endpos_s_ _startpos_s_ s in
        _menhir_goto_extension_statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_extension_statement : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState412 ->
            _menhir_run_530 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState001 ->
            _menhir_run_403 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_530 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_extension_statement (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.UNDERSCORE ->
            _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.SYMBOL _v_0 ->
            _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState530
        | Tokens.STR _v_1 ->
            _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState530
        | Tokens.SET_OPTION ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.SET_LOGIC ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.SET_INFO ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.RESET_ASSERTIONS ->
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.RESET ->
            _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.PUSH ->
            _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.POP ->
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.PAR ->
            _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.OPEN ->
            _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.NUM _v_2 ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState530
        | Tokens.MATCH ->
            _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.LET ->
            _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.KEYWORD _v_3 ->
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState530
        | Tokens.HEX _v_4 ->
            _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState530
        | Tokens.GET_VALUE ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.GET_UNSAT_CORE ->
            _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.GET_UNSAT_ASSUMPTIONS ->
            _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.GET_PROOF ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.GET_OPTION ->
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.GET_MODEL ->
            _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.GET_INFO ->
            _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.GET_ASSIGNMENT ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.GET_ASSERTIONS ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.FORALL ->
            _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.EXIT ->
            _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.EXISTS ->
            _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.ECHO ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.DEFINE_SORT ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.DEFINE_FUN_REC ->
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.DEFINE_FUNS_REC ->
            _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.DEFINE_FUN ->
            _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.DECLARE_SORT ->
            _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.DECLARE_FUN ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.DECLARE_DATATYPES ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.DECLARE_DATATYPE ->
            _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.DECLARE_CONST ->
            _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.DEC _v_5 ->
            _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState530
        | Tokens.CHECK_SAT_ASSUMING ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.CHECK_SAT ->
            _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.BIN _v_6 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v_6 MenhirState530
        | Tokens.ATTRIBUTE ->
            _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.ASSERT ->
            _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.AS ->
            _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState530
        | Tokens.CLOSE ->
            let _v_7 = _menhir_action_071 () in
            _menhir_run_531 _menhir_stack _menhir_lexbuf _menhir_lexer _v_7 _tok
        | _ ->
            _eRR 530
    
    and _menhir_run_008 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_117 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_goto_reserved : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_157 _endpos_s_ _startpos_s_ s in
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
            let _v_7 = _menhir_action_071 () in
            _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v_7 _tok
        | _ ->
            _eRR 54
    
    and _menhir_run_009 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_156 _endpos_s_ _startpos_s_ s in
        _menhir_goto_s_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_006 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_169 _endpos_s_ _startpos_s_ s in
        _menhir_goto_spec_constant _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_s_ _v _menhir_s _tok
    
    and _menhir_goto_spec_constant : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState536 ->
            _menhir_run_584 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState576 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState568 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState565 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState559 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState553 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState544 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState519 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState524 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState474 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState433 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState392 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState397 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState280 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState242 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState231 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState222 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState223 ->
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
        | MenhirState530 ->
            _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState403 ->
            _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState007 ->
            _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState054 ->
            _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState018 ->
            _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_584 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_term) _menhir_state -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let c = _v in
        let _v = _menhir_action_170 c in
        _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_term : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState536 ->
            _menhir_run_583 _menhir_stack _v
        | MenhirState568 ->
            _menhir_run_569 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState565 ->
            _menhir_run_566 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState559 ->
            _menhir_run_560 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState553 ->
            _menhir_run_554 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState544 ->
            _menhir_run_545 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState519 ->
            _menhir_run_528 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState524 ->
            _menhir_run_525 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState392 ->
            _menhir_run_401 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState397 ->
            _menhir_run_398 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState242 ->
            _menhir_run_243 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState231 ->
            _menhir_run_232 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState222 ->
            _menhir_run_225 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState223 ->
            _menhir_run_224 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState576 ->
            _menhir_run_169 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState474 ->
            _menhir_run_169 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState433 ->
            _menhir_run_169 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState280 ->
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
    
    and _menhir_run_569 : type  ttv_stack. (((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_ATTRIBUTE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_term) _menhir_state -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.KEYWORD _v_0 ->
            _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState569
        | _ ->
            _eRR 569
    
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
                let _v_13 = _menhir_action_071 () in
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
            let _v = _menhir_action_107 () in
            _menhir_goto_option_attribute_value_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | _ ->
            _eRR 4
    
    and _menhir_goto_attribute_value : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_KEYWORD -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let (_endpos_x_, x) = (_endpos, _v) in
        let _v = _menhir_action_108 x in
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
        | MenhirState569 ->
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState166 ->
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState163 ->
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState419 ->
            _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState413 ->
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
            let _v = _menhir_action_082 x in
            _menhir_goto_nonempty_list_attribute_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 166
    
    and _menhir_goto_nonempty_list_attribute_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState569 ->
            _menhir_run_570 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState166 ->
            _menhir_run_167 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState163 ->
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_570 : type  ttv_stack. (((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_ATTRIBUTE, _menhir_box_term) _menhir_cell1_term -> _ -> _ -> _ -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let MenhirCell1_term (_menhir_stack, _, f) = _menhir_stack in
        let MenhirCell1_ATTRIBUTE (_menhir_stack, _, _, _) = _menhir_stack in
        let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos__5_, args) = (_endpos, _v) in
        let _v = _menhir_action_177 _endpos__5_ _startpos__1_ args f in
        _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_167 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_attribute -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let MenhirCell1_attribute (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_083 x xs in
        _menhir_goto_nonempty_list_attribute_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_164 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_ATTRIBUTE, ttv_result) _menhir_cell1_term -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell1_term (_menhir_stack, _, f) = _menhir_stack in
        let MenhirCell1_ATTRIBUTE (_menhir_stack, _, _, _) = _menhir_stack in
        let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos__5_, args) = (_endpos, _v) in
        let _v = _menhir_action_177 _endpos__5_ _startpos__1_ args f in
        _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_066 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let a = _v in
        let _v = _menhir_action_040 a in
        _menhir_goto_command_option _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_command_option : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState419 ->
            _menhir_run_420 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState413 ->
            _menhir_run_414 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState070 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState003 ->
            _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_420 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_SET_INFO -> _ -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let MenhirCell1_SET_INFO (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__4_, c) = (_endpos, _v) in
            let _v = _menhir_action_036 _endpos__4_ _startpos__1_ c in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 420
    
    and _menhir_goto_command : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState411 ->
            _menhir_run_535 _menhir_stack _v
        | MenhirState409 ->
            _menhir_run_409 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState000 ->
            _menhir_run_409 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_409 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState409
        | Tokens.EOF ->
            let _v_0 = _menhir_action_067 () in
            _menhir_run_410 _menhir_stack _v_0
        | _ ->
            _eRR 409
    
    and _menhir_run_414 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_SET_OPTION -> _ -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let MenhirCell1_SET_OPTION (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__4_, c) = (_endpos, _v) in
            let _v = _menhir_action_038 _endpos__4_ _startpos__1_ c in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 414
    
    and _menhir_run_071 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_SET_INFO -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_SET_INFO (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__4_, c) = (_endpos, _v) in
            let _v = _menhir_action_036 _endpos__4_ _startpos__1_ c in
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
            let _v = _menhir_action_038 _endpos__4_ _startpos__1_ c in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 64
    
    and _menhir_run_010 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_154 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_011 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_153 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_012 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_152 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_013 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_151 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_014 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_150 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_015 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_149 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_016 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_148 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_017 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_124 () in
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
            let _v = _menhir_action_071 () in
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _eRR 18
    
    and _menhir_run_019 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_165 _endpos_s_ _startpos_s_ s in
        _menhir_goto_spec_constant _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_s_ _v _menhir_s _tok
    
    and _menhir_run_020 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_123 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_021 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_120 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_022 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_158 _endpos_s_ _startpos_s_ s in
        _menhir_goto_s_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_023 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_167 _endpos_s_ _startpos_s_ s in
        _menhir_goto_spec_constant _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_s_ _v _menhir_s _tok
    
    and _menhir_run_024 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_147 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_025 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_146 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_026 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_145 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_027 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_144 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_028 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_143 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_029 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_142 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_030 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_141 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_031 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_140 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_032 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_139 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_033 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_122 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_034 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_138 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_035 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_121 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_036 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_137 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_037 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_136 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_038 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_134 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_039 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_135 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_040 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_133 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_041 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_132 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_042 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_131 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_043 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_130 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_044 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_129 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_045 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_128 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_046 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_166 _endpos_s_ _startpos_s_ s in
        _menhir_goto_spec_constant _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_s_ _v _menhir_s _tok
    
    and _menhir_run_047 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_127 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_048 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_126 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_049 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_168 _endpos_s_ _startpos_s_ s in
        _menhir_goto_spec_constant _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_s_ _v _menhir_s _tok
    
    and _menhir_run_050 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_118 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_051 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_125 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_052 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_119 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_057 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_OPEN -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos__3_, l) = (_endpos, _v) in
        let _v = _menhir_action_159 _endpos__3_ _startpos__1_ l in
        _menhir_goto_s_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_059 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_KEYWORD, ttv_result) _menhir_cell1_OPEN -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell1_OPEN (_menhir_stack, _, _startpos__1_) = _menhir_stack in
        let (_endpos__3_, l) = (_endpos, _v) in
        let _v = _menhir_action_006 _endpos__3_ _startpos__1_ l in
        _menhir_goto_attribute_value _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _v _tok
    
    and _menhir_run_566 : type  ttv_stack. (((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_EXISTS _menhir_cell0_OPEN, _menhir_box_term) _menhir_cell1_nonempty_list_sorted_var_ _menhir_cell0_CLOSE -> _ -> _ -> _ -> _ -> _menhir_box_term =
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
            let _v = _menhir_action_175 _endpos__7_ _startpos__1_ l t in
            _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 566
    
    and _menhir_run_560 : type  ttv_stack. (((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_FORALL _menhir_cell0_OPEN, _menhir_box_term) _menhir_cell1_nonempty_list_sorted_var_ _menhir_cell0_CLOSE -> _ -> _ -> _ -> _ -> _menhir_box_term =
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
            let _v = _menhir_action_174 _endpos__7_ _startpos__1_ l t in
            _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 560
    
    and _menhir_run_554 : type  ttv_stack. (((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_LET _menhir_cell0_OPEN, _menhir_box_term) _menhir_cell1_nonempty_list_var_binding_ _menhir_cell0_CLOSE -> _ -> _ -> _ -> _ -> _menhir_box_term =
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
            let _v = _menhir_action_173 _endpos__7_ _startpos__1_ l t in
            _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 554
    
    and _menhir_run_545 : type  ttv_stack. (((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_MATCH as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_term) _menhir_state -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState546 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 546)
        | _ ->
            _eRR 545
    
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
        let _v = _menhir_action_111 _endpos_s_ _startpos_s_ s in
        _menhir_goto_pattern_symbol _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_pattern_symbol : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState513 ->
            _menhir_run_383 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState377 ->
            _menhir_run_383 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState385 ->
            _menhir_run_383 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState380 ->
            _menhir_run_383 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
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
    
    and _menhir_run_383 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let s = _v in
        let _v = _menhir_action_114 s in
        _menhir_goto_prop_symbol _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_prop_symbol : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState513 ->
            _menhir_run_384 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState385 ->
            _menhir_run_384 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState377 ->
            _menhir_run_384 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState380 ->
            _menhir_run_381 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_384 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let s = _v in
        let _v = _menhir_action_112 s in
        _menhir_goto_prop_literal _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_prop_literal : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_prop_literal (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState385
        | Tokens.OPEN ->
            _menhir_run_378 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState385
        | Tokens.CLOSE ->
            let _v_1 = _menhir_action_069 () in
            _menhir_run_386 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1
        | _ ->
            _eRR 385
    
    and _menhir_run_378 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
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
            let _v = _menhir_action_106 _endpos_s_ _startpos_s_ s in
            let _menhir_stack = MenhirCell0_not_symbol (_menhir_stack, _v) in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SYMBOL _v_0 ->
                _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState380
            | _ ->
                _eRR 380)
        | _ ->
            _eRR 378
    
    and _menhir_run_386 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_prop_literal -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_prop_literal (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_070 x xs in
        _menhir_goto_list_prop_literal_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_goto_list_prop_literal_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState513 ->
            _menhir_run_514 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState377 ->
            _menhir_run_387 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState385 ->
            _menhir_run_386 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_514 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_CHECK_SAT_ASSUMING _menhir_cell0_OPEN -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_CHECK_SAT_ASSUMING (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (l, _endpos__6_) = (_v, _endpos_0) in
            let _v = _menhir_action_010 _endpos__6_ _startpos__1_ l in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 515
    
    and _menhir_run_387 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_CHECK_SAT_ASSUMING _menhir_cell0_OPEN -> _ -> _ -> _ -> _menhir_box_file =
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
            let _v = _menhir_action_010 _endpos__6_ _startpos__1_ l in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 388
    
    and _menhir_run_381 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_OPEN _menhir_cell0_not_symbol -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_not_symbol (_menhir_stack, f) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (s, _endpos__4_) = (_v, _endpos) in
            let _v = _menhir_action_113 _endpos__4_ _startpos__1_ f s in
            _menhir_goto_prop_literal _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 381
    
    and _menhir_run_120 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let c = _v in
        let _v = _menhir_action_109 c in
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
        let _v = _menhir_action_057 s in
        _menhir_goto_identifier _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_s_ _startpos_s_ _v _menhir_s _tok
    
    and _menhir_goto_identifier : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState536 ->
            _menhir_run_586 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState572 ->
            _menhir_run_573 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState539 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState576 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState568 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState565 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState559 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState553 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState544 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState519 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState520 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState524 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState474 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState433 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState392 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState393 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState397 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState280 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState242 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState231 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState222 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState223 ->
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
        | MenhirState573 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState501 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState506 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState464 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState365 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState370 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState341 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState314 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState316 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState293 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState306 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState298 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState302 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState299 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState272 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState262 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState258 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState241 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState230 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState221 ->
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
        | MenhirState502 ->
            _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState366 ->
            _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState100 ->
            _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState097 ->
            _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_586 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_term) _menhir_state -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_115 _endpos_s_ _startpos_s_ s in
        _menhir_goto_qual_identifier _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_qual_identifier : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState536 ->
            _menhir_run_585 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState539 ->
            _menhir_run_576 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState520 ->
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState393 ->
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState086 ->
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState576 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState568 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState565 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState559 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState553 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState544 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState519 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState524 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState474 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState433 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState392 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState397 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState280 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState242 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState231 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState222 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState223 ->
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
    
    and _menhir_run_585 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_term) _menhir_state -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let s = _v in
        let _v = _menhir_action_171 s in
        _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_576 : type  ttv_stack. ((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_term) _menhir_state -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_qual_identifier (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState576
        | Tokens.STR _v_1 ->
            _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState576
        | Tokens.OPEN ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState576
        | Tokens.NUM _v_2 ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState576
        | Tokens.HEX _v_3 ->
            _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState576
        | Tokens.DEC _v_4 ->
            _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState576
        | Tokens.BIN _v_5 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState576
        | _ ->
            _eRR 576
    
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
            _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET ->
            _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FORALL ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ATTRIBUTE ->
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
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
        let _v = _menhir_action_060 s in
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
            let _v = _menhir_action_090 x in
            _menhir_goto_nonempty_list_index_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 94
    
    and _menhir_run_090 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        let s = _v in
        let _v = _menhir_action_059 s in
        _menhir_goto_index _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_091 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        let s = _v in
        let _v = _menhir_action_061 s in
        _menhir_goto_index _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_nonempty_list_index_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState541 ->
            _menhir_run_542 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState094 ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState088 ->
            _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_542 : type  ttv_stack. ((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_UNDERSCORE _menhir_cell0_SYMBOL -> _ -> _ -> _ -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let MenhirCell0_SYMBOL (_menhir_stack, s, _, _) = _menhir_stack in
        let MenhirCell1_UNDERSCORE (_menhir_stack, _, _, _) = _menhir_stack in
        let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (l, _endpos__5_) = (_v, _endpos) in
        let _v = _menhir_action_058 l s in
        _menhir_goto_identifier _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__5_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_095 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_index -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let MenhirCell1_index (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_091 x xs in
        _menhir_goto_nonempty_list_index_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_092 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_UNDERSCORE _menhir_cell0_SYMBOL -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell0_SYMBOL (_menhir_stack, s, _, _) = _menhir_stack in
        let MenhirCell1_UNDERSCORE (_menhir_stack, _, _, _) = _menhir_stack in
        let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (l, _endpos__5_) = (_v, _endpos) in
        let _v = _menhir_action_058 l s in
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
    
    and _menhir_run_109 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell1_MATCH (_menhir_stack, _menhir_s, _startpos, _endpos) in
        let _menhir_s = MenhirState109 in
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
            _eRR 109
    
    and _menhir_run_132 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell1_LET (_menhir_stack, _menhir_s, _startpos, _endpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
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
            _eRR 132
    
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
    
    and _menhir_run_144 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell1_FORALL (_menhir_stack, _menhir_s, _startpos, _endpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
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
            _eRR 144
    
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
    
    and _menhir_run_156 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell1_EXISTS (_menhir_stack, _menhir_s, _startpos, _endpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
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
            _eRR 156
    
    and _menhir_run_162 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell1_ATTRIBUTE (_menhir_stack, _menhir_s, _startpos, _endpos) in
        let _menhir_s = MenhirState162 in
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
            _eRR 162
    
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
        let _v = _menhir_action_171 s in
        _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_573 : type  ttv_stack. (((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_AS as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_term) _menhir_state -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_identifier (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState573
        | Tokens.OPEN ->
            _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState573
        | _ ->
            _eRR 573
    
    and _menhir_run_126 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_115 _endpos_s_ _startpos_s_ s in
        _menhir_goto_qual_identifier _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_104 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_161 _endpos_s_ _startpos_s_ s in
        _menhir_goto_sort _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_sort : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState573 ->
            _menhir_run_574 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState501 ->
            _menhir_run_510 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState506 ->
            _menhir_run_507 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState464 ->
            _menhir_run_465 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState365 ->
            _menhir_run_374 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState370 ->
            _menhir_run_371 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState341 ->
            _menhir_run_342 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState316 ->
            _menhir_run_317 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState306 ->
            _menhir_run_307 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState302 ->
            _menhir_run_303 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState314 ->
            _menhir_run_299 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState293 ->
            _menhir_run_299 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState299 ->
            _menhir_run_299 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState298 ->
            _menhir_run_299 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState272 ->
            _menhir_run_273 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState262 ->
            _menhir_run_263 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState258 ->
            _menhir_run_259 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState241 ->
            _menhir_run_242 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState230 ->
            _menhir_run_231 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState221 ->
            _menhir_run_222 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
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
    
    and _menhir_run_574 : type  ttv_stack. (((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_AS, _menhir_box_term) _menhir_cell1_identifier -> _ -> _ -> _ -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let MenhirCell1_identifier (_menhir_stack, _, s, _startpos_s_, _endpos_s_) = _menhir_stack in
            let MenhirCell1_AS (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__5_, ty) = (_endpos, _v) in
            let _v = _menhir_action_116 _endpos__5_ _endpos_s_ _startpos__1_ _startpos_s_ s ty in
            _menhir_goto_qual_identifier _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 574
    
    and _menhir_run_510 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DECLARE_CONST _menhir_cell0_SYMBOL -> _ -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let MenhirCell0_SYMBOL (_menhir_stack, s, _, _) = _menhir_stack in
            let MenhirCell1_DECLARE_CONST (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__5_, ty) = (_endpos, _v) in
            let _v = _menhir_action_011 _endpos__5_ _startpos__1_ s ty in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 510
    
    and _menhir_run_507 : type  ttv_stack. (((((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DECLARE_CONST _menhir_cell0_SYMBOL, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_PAR _menhir_cell0_OPEN, _menhir_box_input) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE -> _ -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.CLOSE ->
                let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
                let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_nonempty_list_datatype_symbol_ (_menhir_stack, _, vars) = _menhir_stack in
                let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_PAR (_menhir_stack, _, _, _) = _menhir_stack in
                let MenhirCell1_OPEN (_menhir_stack, _, _) = _menhir_stack in
                let MenhirCell0_SYMBOL (_menhir_stack, s, _, _) = _menhir_stack in
                let MenhirCell1_DECLARE_CONST (_menhir_stack, _, _, _) = _menhir_stack in
                let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
                let (_endpos__11_, ty) = (_endpos_0, _v) in
                let _v = _menhir_action_012 _endpos__11_ _startpos__1_ s ty vars in
                _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
            | _ ->
                _eRR 508)
        | _ ->
            _eRR 507
    
    and _menhir_run_465 : type  ttv_stack. (((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DEFINE_SORT _menhir_cell0_SYMBOL _menhir_cell0_OPEN, _menhir_box_input) _menhir_cell1_list_SYMBOL_ _menhir_cell0_CLOSE -> _ -> _ -> _ -> _ -> _menhir_box_input =
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
            let _v = _menhir_action_020 _endpos__8_ _startpos__1_ args s ty in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 465
    
    and _menhir_run_374 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DECLARE_CONST _menhir_cell0_SYMBOL -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_SYMBOL (_menhir_stack, s, _, _) = _menhir_stack in
            let MenhirCell1_DECLARE_CONST (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__5_, ty) = (_endpos, _v) in
            let _v = _menhir_action_011 _endpos__5_ _startpos__1_ s ty in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 374
    
    and _menhir_run_371 : type  ttv_stack. (((((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DECLARE_CONST _menhir_cell0_SYMBOL, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_PAR _menhir_cell0_OPEN, _menhir_box_file) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.CLOSE ->
                let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
                let _tok = _menhir_lexer _menhir_lexbuf in
                let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_nonempty_list_datatype_symbol_ (_menhir_stack, _, vars) = _menhir_stack in
                let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_PAR (_menhir_stack, _, _, _) = _menhir_stack in
                let MenhirCell1_OPEN (_menhir_stack, _, _) = _menhir_stack in
                let MenhirCell0_SYMBOL (_menhir_stack, s, _, _) = _menhir_stack in
                let MenhirCell1_DECLARE_CONST (_menhir_stack, _, _, _) = _menhir_stack in
                let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
                let (_endpos__11_, ty) = (_endpos_0, _v) in
                let _v = _menhir_action_012 _endpos__11_ _startpos__1_ s ty vars in
                _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
            | _ ->
                _eRR 372)
        | _ ->
            _eRR 371
    
    and _menhir_run_342 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_OPEN _menhir_cell0_SYMBOL -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_SYMBOL (_menhir_stack, s, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__4_, ty) = (_endpos, _v) in
            let _v = _menhir_action_160 _endpos__4_ _startpos__1_ s ty in
            let _menhir_stack = MenhirCell1_selector_dec (_menhir_stack, _menhir_s, _v) in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                _menhir_run_340 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState344
            | Tokens.CLOSE ->
                let _v_0 = _menhir_action_073 () in
                _menhir_run_345 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
            | _ ->
                _eRR 344)
        | _ ->
            _eRR 342
    
    and _menhir_run_340 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell0_SYMBOL (_menhir_stack, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState341 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SYMBOL _v ->
                _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.OPEN ->
                _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 341)
        | _ ->
            _eRR 340
    
    and _menhir_run_345 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_selector_dec -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_selector_dec (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_074 x xs in
        _menhir_goto_list_selector_dec_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_goto_list_selector_dec_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState339 ->
            _menhir_run_346 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState344 ->
            _menhir_run_345 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_346 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_OPEN _menhir_cell0_SYMBOL -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell0_SYMBOL (_menhir_stack, s, _, _) = _menhir_stack in
        let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _) = _menhir_stack in
        let l = _v in
        let _v = _menhir_action_041 l s in
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            let _menhir_stack = MenhirCell1_constructor_dec (_menhir_stack, _menhir_s, _v) in
            _menhir_run_338 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState351
        | Tokens.CLOSE ->
            let x = _v in
            let _v = _menhir_action_084 x in
            _menhir_goto_nonempty_list_constructor_dec_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 351
    
    and _menhir_run_338 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
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
                _menhir_run_340 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState339
            | Tokens.CLOSE ->
                let _v_1 = _menhir_action_073 () in
                _menhir_run_346 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1
            | _ ->
                _eRR 339)
        | _ ->
            _eRR 338
    
    and _menhir_goto_nonempty_list_constructor_dec_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState332 ->
            _menhir_run_353 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState351 ->
            _menhir_run_352 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState337 ->
            _menhir_run_348 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_353 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_OPEN -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _) = _menhir_stack in
        let l = _v in
        let _v = _menhir_action_042 l in
        _menhir_goto_datatype_dec _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_datatype_dec : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState497 ->
            _menhir_run_498 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState361 ->
            _menhir_run_362 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState492 ->
            _menhir_run_358 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState358 ->
            _menhir_run_358 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState331 ->
            _menhir_run_358 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_498 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DECLARE_DATATYPE _menhir_cell0_SYMBOL -> _ -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let MenhirCell0_SYMBOL (_menhir_stack, s, _, _) = _menhir_stack in
            let MenhirCell1_DECLARE_DATATYPE (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__5_, d) = (_endpos, _v) in
            let _v = _menhir_action_013 _endpos__5_ _startpos__1_ d s in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 498
    
    and _menhir_run_362 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DECLARE_DATATYPE _menhir_cell0_SYMBOL -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_SYMBOL (_menhir_stack, s, _, _) = _menhir_stack in
            let MenhirCell1_DECLARE_DATATYPE (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__5_, d) = (_endpos, _v) in
            let _v = _menhir_action_013 _endpos__5_ _startpos__1_ d s in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 362
    
    and _menhir_run_358 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            let _menhir_stack = MenhirCell1_datatype_dec (_menhir_stack, _menhir_s, _v) in
            _menhir_run_332 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState358
        | Tokens.CLOSE ->
            let x = _v in
            let _v = _menhir_action_086 x in
            _menhir_goto_nonempty_list_datatype_dec_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 358
    
    and _menhir_run_332 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState332 in
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
                let _menhir_s = MenhirState334 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SYMBOL _v ->
                    _menhir_run_214 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | _ ->
                    _eRR 334)
            | _ ->
                _eRR 333)
        | Tokens.OPEN ->
            _menhir_run_338 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 332
    
    and _menhir_run_214 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_044 _endpos_s_ _startpos_s_ s in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            let _menhir_stack = MenhirCell1_datatype_symbol (_menhir_stack, _menhir_s, _v) in
            _menhir_run_214 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState227
        | Tokens.CLOSE ->
            let x = _v in
            let _v = _menhir_action_088 x in
            _menhir_goto_nonempty_list_datatype_symbol_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 227
    
    and _menhir_goto_nonempty_list_datatype_symbol_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState522 ->
            _menhir_run_523 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState504 ->
            _menhir_run_505 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState395 ->
            _menhir_run_396 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState368 ->
            _menhir_run_369 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState334 ->
            _menhir_run_335 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState310 ->
            _menhir_run_311 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState295 ->
            _menhir_run_296 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState266 ->
            _menhir_run_267 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState253 ->
            _menhir_run_254 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState235 ->
            _menhir_run_236 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState227 ->
            _menhir_run_228 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState213 ->
            _menhir_run_215 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_523 : type  ttv_stack. (((((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_ASSERT, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_PAR _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_nonempty_list_datatype_symbol_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState524 in
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
            _eRR 524
    
    and _menhir_run_505 : type  ttv_stack. (((((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DECLARE_CONST _menhir_cell0_SYMBOL, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_PAR _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_nonempty_list_datatype_symbol_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState506 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 506
    
    and _menhir_run_396 : type  ttv_stack. (((((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_ASSERT, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_PAR _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_nonempty_list_datatype_symbol_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState397 in
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
            _eRR 397
    
    and _menhir_run_369 : type  ttv_stack. (((((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DECLARE_CONST _menhir_cell0_SYMBOL, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_PAR _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_nonempty_list_datatype_symbol_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState370 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 370
    
    and _menhir_run_335 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_PAR _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_nonempty_list_datatype_symbol_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState337 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                _menhir_run_338 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 337)
        | _ ->
            _eRR 336
    
    and _menhir_run_311 : type  ttv_stack ttv_result. ((((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_DECLARE_FUN, ttv_result) _menhir_cell1_OPEN _menhir_cell0_PAR _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_nonempty_list_datatype_symbol_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos_1 = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell0_SYMBOL (_menhir_stack, _v_0, _startpos, _endpos_1) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                let _startpos_2 = _menhir_lexbuf.Lexing.lex_start_p in
                let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos_2) in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SYMBOL _v_3 ->
                    _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState314
                | Tokens.OPEN ->
                    _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState314
                | Tokens.CLOSE ->
                    let _v_4 = _menhir_action_075 () in
                    _menhir_run_315 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState314
                | _ ->
                    _eRR 314)
            | _ ->
                _eRR 313)
        | _ ->
            _eRR 312
    
    and _menhir_run_315 : type  ttv_stack ttv_result. (((((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_DECLARE_FUN, ttv_result) _menhir_cell1_OPEN _menhir_cell0_PAR _menhir_cell0_OPEN, ttv_result) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE _menhir_cell0_SYMBOL _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_list_sort_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState316 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 316
    
    and _menhir_run_296 : type  ttv_stack ttv_result. (((((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_DECLARE_FUN, ttv_result) _menhir_cell1_SYMBOL _menhir_cell0_OPEN, ttv_result) _menhir_cell1_PAR _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_nonempty_list_datatype_symbol_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SYMBOL _v_0 ->
                _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState298
            | Tokens.OPEN ->
                _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState298
            | Tokens.CLOSE ->
                let _v_1 = _menhir_action_075 () in
                _menhir_run_301 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState298
            | _ ->
                _eRR 298)
        | _ ->
            _eRR 297
    
    and _menhir_run_301 : type  ttv_stack ttv_result. ((((((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_DECLARE_FUN, ttv_result) _menhir_cell1_SYMBOL _menhir_cell0_OPEN, ttv_result) _menhir_cell1_PAR _menhir_cell0_OPEN, ttv_result) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_list_sort_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState302 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 302
    
    and _menhir_run_267 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN _menhir_cell0_OPEN _menhir_cell0_PAR _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_nonempty_list_datatype_symbol_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos_1 = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell0_SYMBOL (_menhir_stack, _v_0, _startpos, _endpos_1) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                let _startpos_2 = _menhir_lexbuf.Lexing.lex_start_p in
                let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos_2) in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.OPEN ->
                    _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState270
                | Tokens.CLOSE ->
                    let _v_3 = _menhir_action_077 () in
                    _menhir_run_271 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState270
                | _ ->
                    _eRR 270)
            | _ ->
                _eRR 269)
        | _ ->
            _eRR 268
    
    and _menhir_run_271 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN _menhir_cell0_OPEN _menhir_cell0_PAR _menhir_cell0_OPEN, ttv_result) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE _menhir_cell0_SYMBOL _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_list_sorted_var_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState272 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 272
    
    and _menhir_run_254 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN _menhir_cell0_SYMBOL _menhir_cell0_OPEN, ttv_result) _menhir_cell1_PAR _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_nonempty_list_datatype_symbol_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState256
            | Tokens.CLOSE ->
                let _v_0 = _menhir_action_077 () in
                _menhir_run_257 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState256
            | _ ->
                _eRR 256)
        | _ ->
            _eRR 255
    
    and _menhir_run_257 : type  ttv_stack ttv_result. ((((ttv_stack, ttv_result) _menhir_cell1_OPEN _menhir_cell0_SYMBOL _menhir_cell0_OPEN, ttv_result) _menhir_cell1_PAR _menhir_cell0_OPEN, ttv_result) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_list_sorted_var_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState258 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 258
    
    and _menhir_run_236 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN _menhir_cell0_PAR _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_nonempty_list_datatype_symbol_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos_1 = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell0_SYMBOL (_menhir_stack, _v_0, _startpos, _endpos_1) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                let _startpos_2 = _menhir_lexbuf.Lexing.lex_start_p in
                let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos_2) in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.OPEN ->
                    _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState239
                | Tokens.CLOSE ->
                    let _v_3 = _menhir_action_077 () in
                    _menhir_run_240 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState239
                | _ ->
                    _eRR 239)
            | _ ->
                _eRR 238)
        | _ ->
            _eRR 237
    
    and _menhir_run_240 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN _menhir_cell0_PAR _menhir_cell0_OPEN, ttv_result) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE _menhir_cell0_SYMBOL _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_list_sorted_var_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState241 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 241
    
    and _menhir_run_228 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_datatype_symbol -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_datatype_symbol (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_089 x xs in
        _menhir_goto_nonempty_list_datatype_symbol_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_215 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_SYMBOL _menhir_cell0_OPEN, ttv_result) _menhir_cell1_PAR _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_nonempty_list_datatype_symbol_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState217
            | Tokens.CLOSE ->
                let _v_0 = _menhir_action_077 () in
                _menhir_run_220 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState217
            | _ ->
                _eRR 217)
        | _ ->
            _eRR 216
    
    and _menhir_run_220 : type  ttv_stack ttv_result. ((((ttv_stack, ttv_result) _menhir_cell1_SYMBOL _menhir_cell0_OPEN, ttv_result) _menhir_cell1_PAR _menhir_cell0_OPEN, ttv_result) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_list_sorted_var_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState221 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 221
    
    and _menhir_goto_nonempty_list_datatype_dec_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState492 ->
            _menhir_run_493 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState358 ->
            _menhir_run_359 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState331 ->
            _menhir_run_355 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_493 : type  ttv_stack. (((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DECLARE_DATATYPES _menhir_cell0_OPEN, _menhir_box_input) _menhir_cell1_nonempty_list_sort_dec_ _menhir_cell0_CLOSE _menhir_cell0_OPEN -> _ -> _ -> _ -> _menhir_box_input =
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
            let (_endpos__9_, _endpos__8_, l2) = (_endpos_0, _endpos, _v) in
            let _v = _menhir_action_014 _endpos__8_ _endpos__9_ _startpos__1_ _startpos__3_ l1 l2 in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 494
    
    and _menhir_run_359 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_datatype_dec -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_datatype_dec (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_087 x xs in
        _menhir_goto_nonempty_list_datatype_dec_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_355 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DECLARE_DATATYPES _menhir_cell0_OPEN, _menhir_box_file) _menhir_cell1_nonempty_list_sort_dec_ _menhir_cell0_CLOSE _menhir_cell0_OPEN -> _ -> _ -> _ -> _menhir_box_file =
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
            let (_endpos__9_, _endpos__8_, l2) = (_endpos_0, _endpos, _v) in
            let _v = _menhir_action_014 _endpos__8_ _endpos__9_ _startpos__1_ _startpos__3_ l1 l2 in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 356
    
    and _menhir_run_352 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_constructor_dec -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_constructor_dec (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_085 x xs in
        _menhir_goto_nonempty_list_constructor_dec_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_348 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_PAR _menhir_cell0_OPEN, ttv_result) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE _menhir_cell0_OPEN -> _ -> _ -> _ -> ttv_result =
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
            let _v = _menhir_action_043 l vars in
            _menhir_goto_datatype_dec _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 349
    
    and _menhir_run_317 : type  ttv_stack ttv_result. (((((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_DECLARE_FUN, ttv_result) _menhir_cell1_OPEN _menhir_cell0_PAR _menhir_cell0_OPEN, ttv_result) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE _menhir_cell0_SYMBOL _menhir_cell0_OPEN, ttv_result) _menhir_cell1_list_sort_ _menhir_cell0_CLOSE -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_list_sort_ (_menhir_stack, _, args) = _menhir_stack in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell0_SYMBOL (_menhir_stack, s, _, _) = _menhir_stack in
            let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_nonempty_list_datatype_symbol_ (_menhir_stack, _, vars) = _menhir_stack in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell0_PAR (_menhir_stack, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _) = _menhir_stack in
            let ret = _v in
            let _v = _menhir_action_049 args ret s vars in
            _menhir_goto_function_dec_sort_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 317
    
    and _menhir_goto_function_dec_sort_ : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_DECLARE_FUN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState485 ->
            _menhir_run_486 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState291 ->
            _menhir_run_319 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_486 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DECLARE_FUN -> _ -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let MenhirCell1_DECLARE_FUN (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__4_, dec) = (_endpos, _v) in
            let _v = _menhir_action_015 _endpos__4_ _startpos__1_ dec in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 486
    
    and _menhir_run_319 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DECLARE_FUN -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_DECLARE_FUN (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__4_, dec) = (_endpos, _v) in
            let _v = _menhir_action_015 _endpos__4_ _startpos__1_ dec in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 319
    
    and _menhir_run_307 : type  ttv_stack ttv_result. ((((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_DECLARE_FUN, ttv_result) _menhir_cell1_SYMBOL _menhir_cell0_OPEN, ttv_result) _menhir_cell1_list_sort_ _menhir_cell0_CLOSE -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_list_sort_ (_menhir_stack, _, args) = _menhir_stack in
        let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_SYMBOL (_menhir_stack, _menhir_s, s, _, _) = _menhir_stack in
        let ret = _v in
        let _v = _menhir_action_047 args ret s in
        _menhir_goto_function_dec_sort_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_303 : type  ttv_stack ttv_result. ((((((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_DECLARE_FUN, ttv_result) _menhir_cell1_SYMBOL _menhir_cell0_OPEN, ttv_result) _menhir_cell1_PAR _menhir_cell0_OPEN, ttv_result) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE _menhir_cell0_OPEN, ttv_result) _menhir_cell1_list_sort_ _menhir_cell0_CLOSE -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_list_sort_ (_menhir_stack, _, args) = _menhir_stack in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_nonempty_list_datatype_symbol_ (_menhir_stack, _, vars) = _menhir_stack in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_PAR (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_SYMBOL (_menhir_stack, _menhir_s, s, _, _) = _menhir_stack in
            let ret = _v in
            let _v = _menhir_action_048 args ret s vars in
            _menhir_goto_function_dec_sort_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 303
    
    and _menhir_run_299 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_sort (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState299
        | Tokens.OPEN ->
            _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState299
        | Tokens.CLOSE ->
            let _v_1 = _menhir_action_075 () in
            _menhir_run_300 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1
        | _ ->
            _eRR 299
    
    and _menhir_run_300 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_sort -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_sort (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_076 x xs in
        _menhir_goto_list_sort_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_goto_list_sort_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState314 ->
            _menhir_run_315 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState293 ->
            _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState298 ->
            _menhir_run_301 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState299 ->
            _menhir_run_300 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_305 : type  ttv_stack ttv_result. ((((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_DECLARE_FUN, ttv_result) _menhir_cell1_SYMBOL _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_list_sort_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState306 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 306
    
    and _menhir_run_273 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN _menhir_cell0_OPEN _menhir_cell0_PAR _menhir_cell0_OPEN, ttv_result) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE _menhir_cell0_SYMBOL _menhir_cell0_OPEN, ttv_result) _menhir_cell1_list_sorted_var_ _menhir_cell0_CLOSE -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_list_sorted_var_ (_menhir_stack, _, args) = _menhir_stack in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell0_SYMBOL (_menhir_stack, s, _, _) = _menhir_stack in
            let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_nonempty_list_datatype_symbol_ (_menhir_stack, _, vars) = _menhir_stack in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell0_PAR (_menhir_stack, _, _) = _menhir_stack in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let ret = _v in
            let _v = _menhir_action_052 args ret s vars in
            _menhir_goto_function_dec_sorted_var_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _eRR 273
    
    and _menhir_goto_function_dec_sorted_var_ : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_OPEN -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                let _menhir_stack = MenhirCell0_function_dec_sorted_var_ (_menhir_stack, _v) in
                let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
                _menhir_run_249 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState276
            | Tokens.CLOSE ->
                let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _) = _menhir_stack in
                let dec = _v in
                let _v = _menhir_action_080 dec in
                _menhir_goto_nonempty_list___anonymous_0_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 276)
        | _ ->
            _eRR 275
    
    and _menhir_run_249 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
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
                | Tokens.PAR ->
                    let _menhir_s = MenhirState251 in
                    let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                    let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                    let _menhir_stack = MenhirCell1_PAR (_menhir_stack, _menhir_s, _startpos, _endpos) in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.OPEN ->
                        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                        let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
                        let _menhir_s = MenhirState253 in
                        let _tok = _menhir_lexer _menhir_lexbuf in
                        (match (_tok : MenhirBasics.token) with
                        | Tokens.SYMBOL _v ->
                            _menhir_run_214 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                        | _ ->
                            _eRR 253)
                    | _ ->
                        _eRR 252)
                | Tokens.OPEN ->
                    _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState251
                | Tokens.CLOSE ->
                    let _v_6 = _menhir_action_077 () in
                    _menhir_run_261 _menhir_stack _menhir_lexbuf _menhir_lexer _v_6 MenhirState251
                | _ ->
                    _eRR 251)
            | _ ->
                _eRR 250)
        | Tokens.OPEN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.PAR ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell0_PAR (_menhir_stack, _startpos, _endpos) in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.OPEN ->
                    let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                    let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
                    let _menhir_s = MenhirState266 in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.SYMBOL _v ->
                        _menhir_run_214 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                    | _ ->
                        _eRR 266)
                | _ ->
                    _eRR 265)
            | _ ->
                _eRR 264)
        | _ ->
            _eRR 249
    
    and _menhir_run_261 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN _menhir_cell0_SYMBOL _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_list_sorted_var_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState262 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 262
    
    and _menhir_goto_nonempty_list___anonymous_0_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState471 ->
            _menhir_run_472 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState248 ->
            _menhir_run_278 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState276 ->
            _menhir_run_277 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_472 : type  ttv_stack. (((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DEFINE_FUNS_REC _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_nonempty_list___anonymous_0_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState474 in
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
                _eRR 474)
        | _ ->
            _eRR 473
    
    and _menhir_run_278 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DEFINE_FUNS_REC _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_nonempty_list___anonymous_0_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState280 in
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
                _eRR 280)
        | _ ->
            _eRR 279
    
    and _menhir_run_277 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_OPEN _menhir_cell0_function_dec_sorted_var_ _menhir_cell0_CLOSE -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
        let MenhirCell0_function_dec_sorted_var_ (_menhir_stack, dec) = _menhir_stack in
        let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_081 dec xs in
        _menhir_goto_nonempty_list___anonymous_0_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_263 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN _menhir_cell0_SYMBOL _menhir_cell0_OPEN, ttv_result) _menhir_cell1_list_sorted_var_ _menhir_cell0_CLOSE -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_list_sorted_var_ (_menhir_stack, _, args) = _menhir_stack in
        let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
        let MenhirCell0_SYMBOL (_menhir_stack, s, _, _) = _menhir_stack in
        let ret = _v in
        let _v = _menhir_action_050 args ret s in
        _menhir_goto_function_dec_sorted_var_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
    
    and _menhir_run_259 : type  ttv_stack ttv_result. ((((ttv_stack, ttv_result) _menhir_cell1_OPEN _menhir_cell0_SYMBOL _menhir_cell0_OPEN, ttv_result) _menhir_cell1_PAR _menhir_cell0_OPEN, ttv_result) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE _menhir_cell0_OPEN, ttv_result) _menhir_cell1_list_sorted_var_ _menhir_cell0_CLOSE -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_list_sorted_var_ (_menhir_stack, _, args) = _menhir_stack in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_nonempty_list_datatype_symbol_ (_menhir_stack, _, vars) = _menhir_stack in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_PAR (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell0_SYMBOL (_menhir_stack, s, _, _) = _menhir_stack in
            let ret = _v in
            let _v = _menhir_action_051 args ret s vars in
            _menhir_goto_function_dec_sorted_var_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _eRR 259
    
    and _menhir_run_242 : type  ttv_stack ttv_result. ((((ttv_stack, ttv_result) _menhir_cell1_OPEN _menhir_cell0_PAR _menhir_cell0_OPEN, ttv_result) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE _menhir_cell0_SYMBOL _menhir_cell0_OPEN, ttv_result) _menhir_cell1_list_sorted_var_ _menhir_cell0_CLOSE as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_sort (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState242
        | Tokens.STR _v_1 ->
            _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState242
        | Tokens.OPEN ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState242
        | Tokens.NUM _v_2 ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState242
        | Tokens.HEX _v_3 ->
            _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState242
        | Tokens.DEC _v_4 ->
            _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState242
        | Tokens.BIN _v_5 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState242
        | _ ->
            _eRR 242
    
    and _menhir_run_231 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_SYMBOL _menhir_cell0_OPEN, ttv_result) _menhir_cell1_list_sorted_var_ _menhir_cell0_CLOSE as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_sort (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState231
        | Tokens.STR _v_1 ->
            _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState231
        | Tokens.OPEN ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState231
        | Tokens.NUM _v_2 ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState231
        | Tokens.HEX _v_3 ->
            _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState231
        | Tokens.DEC _v_4 ->
            _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState231
        | Tokens.BIN _v_5 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState231
        | _ ->
            _eRR 231
    
    and _menhir_run_222 : type  ttv_stack ttv_result. (((((ttv_stack, ttv_result) _menhir_cell1_SYMBOL _menhir_cell0_OPEN, ttv_result) _menhir_cell1_PAR _menhir_cell0_OPEN, ttv_result) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE _menhir_cell0_OPEN, ttv_result) _menhir_cell1_list_sorted_var_ _menhir_cell0_CLOSE as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_sort (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState222
        | Tokens.STR _v_1 ->
            _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState222
        | Tokens.OPEN ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState222
        | Tokens.NUM _v_2 ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState222
        | Tokens.HEX _v_3 ->
            _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState222
        | Tokens.DEC _v_4 ->
            _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState222
        | Tokens.CLOSE ->
            let _menhir_s = MenhirState222 in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell1_CLOSE (_menhir_stack, _menhir_s, _endpos) in
            let _menhir_s = MenhirState223 in
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
                _eRR 223)
        | Tokens.BIN _v_11 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v_11 MenhirState222
        | _ ->
            _eRR 222
    
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
            let _v = _menhir_action_020 _endpos__8_ _startpos__1_ args s ty in
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
            let _v = _menhir_action_164 _endpos__4_ _endpos_s_ _startpos__1_ _startpos_s_ s ty in
            _menhir_goto_sorted_var _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 148
    
    and _menhir_goto_sorted_var : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState270 ->
            _menhir_run_218 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState251 ->
            _menhir_run_218 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState256 ->
            _menhir_run_218 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState239 ->
            _menhir_run_218 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState211 ->
            _menhir_run_218 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState218 ->
            _menhir_run_218 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState217 ->
            _menhir_run_218 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState563 ->
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState557 ->
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState157 ->
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState150 ->
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState145 ->
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_218 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_sorted_var (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState218
        | Tokens.CLOSE ->
            let _v_0 = _menhir_action_077 () in
            _menhir_run_219 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
        | _ ->
            _eRR 218
    
    and _menhir_run_219 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_sorted_var -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_sorted_var (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_078 x xs in
        _menhir_goto_list_sorted_var_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_goto_list_sorted_var_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState270 ->
            _menhir_run_271 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState251 ->
            _menhir_run_261 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState256 ->
            _menhir_run_257 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState239 ->
            _menhir_run_240 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState211 ->
            _menhir_run_229 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState217 ->
            _menhir_run_220 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState218 ->
            _menhir_run_219 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_229 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_SYMBOL _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_list_sorted_var_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState230 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 230
    
    and _menhir_run_150 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            let _menhir_stack = MenhirCell1_sorted_var (_menhir_stack, _menhir_s, _v) in
            _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState150
        | Tokens.CLOSE ->
            let x = _v in
            let _v = _menhir_action_100 x in
            _menhir_goto_nonempty_list_sorted_var_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 150
    
    and _menhir_goto_nonempty_list_sorted_var_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState563 ->
            _menhir_run_564 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState557 ->
            _menhir_run_558 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState157 ->
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState145 ->
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState150 ->
            _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_564 : type  ttv_stack. (((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_EXISTS _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_term) _menhir_state -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_nonempty_list_sorted_var_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState565 in
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
            _eRR 565
    
    and _menhir_run_558 : type  ttv_stack. (((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_FORALL _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_term) _menhir_state -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_nonempty_list_sorted_var_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState559 in
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
            _eRR 559
    
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
        let _v = _menhir_action_101 x xs in
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
            let _v = _menhir_action_116 _endpos__5_ _endpos_s_ _startpos__1_ _startpos_s_ s ty in
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
            let _v = _menhir_action_096 x in
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
        let _v = _menhir_action_162 _endpos__4_ _endpos_f_ _startpos__1_ _startpos_f_ args f in
        _menhir_goto_sort _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_103 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_sort -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_sort (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_097 x xs in
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
            let _v = _menhir_action_094 x in
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
        let _v = _menhir_action_110 _endpos__4_ _startpos__1_ args f in
        _menhir_goto_pattern _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_117 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_pattern_symbol, ttv_result) _menhir_cell1_pattern_symbol -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_pattern_symbol (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_095 x xs in
        _menhir_goto_nonempty_list_pattern_symbol_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_115 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_pattern_symbol (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState115
        | _ ->
            _eRR 115
    
    and _menhir_run_528 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_ASSERT -> _ -> _ -> _ -> _ -> _menhir_box_input =
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
            _eRR 528
    
    and _menhir_run_525 : type  ttv_stack. (((((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_ASSERT, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_PAR _menhir_cell0_OPEN, _menhir_box_input) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE -> _ -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.CLOSE ->
                let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
                let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_nonempty_list_datatype_symbol_ (_menhir_stack, _, vars) = _menhir_stack in
                let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_PAR (_menhir_stack, _, _, _) = _menhir_stack in
                let MenhirCell1_OPEN (_menhir_stack, _, _) = _menhir_stack in
                let MenhirCell1_ASSERT (_menhir_stack, _, _, _) = _menhir_stack in
                let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
                let (t, _endpos__10_) = (_v, _endpos_0) in
                let _v = _menhir_action_008 _endpos__10_ _startpos__1_ t vars in
                _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
            | _ ->
                _eRR 526)
        | _ ->
            _eRR 525
    
    and _menhir_run_401 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_ASSERT -> _ -> _ -> _ -> _ -> _menhir_box_file =
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
            _eRR 401
    
    and _menhir_run_398 : type  ttv_stack. (((((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_ASSERT, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_PAR _menhir_cell0_OPEN, _menhir_box_file) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.CLOSE ->
                let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
                let _tok = _menhir_lexer _menhir_lexbuf in
                let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_nonempty_list_datatype_symbol_ (_menhir_stack, _, vars) = _menhir_stack in
                let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_PAR (_menhir_stack, _, _, _) = _menhir_stack in
                let MenhirCell1_OPEN (_menhir_stack, _, _) = _menhir_stack in
                let MenhirCell1_ASSERT (_menhir_stack, _, _, _) = _menhir_stack in
                let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
                let (t, _endpos__10_) = (_v, _endpos_0) in
                let _v = _menhir_action_008 _endpos__10_ _startpos__1_ t vars in
                _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
            | _ ->
                _eRR 399)
        | _ ->
            _eRR 398
    
    and _menhir_run_243 : type  ttv_stack ttv_result. ((((ttv_stack, ttv_result) _menhir_cell1_OPEN _menhir_cell0_PAR _menhir_cell0_OPEN, ttv_result) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE _menhir_cell0_SYMBOL _menhir_cell0_OPEN, ttv_result) _menhir_cell1_list_sorted_var_ _menhir_cell0_CLOSE, ttv_result) _menhir_cell1_sort -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_sort (_menhir_stack, _, ret) = _menhir_stack in
            let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_list_sorted_var_ (_menhir_stack, _, args) = _menhir_stack in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell0_SYMBOL (_menhir_stack, s, _, _) = _menhir_stack in
            let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_nonempty_list_datatype_symbol_ (_menhir_stack, _, vars) = _menhir_stack in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell0_PAR (_menhir_stack, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _) = _menhir_stack in
            let body = _v in
            let _v = _menhir_action_055 args body ret s vars in
            _menhir_goto_function_def _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 243
    
    and _menhir_goto_function_def : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState478 ->
            _menhir_run_479 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState467 ->
            _menhir_run_468 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState284 ->
            _menhir_run_285 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState209 ->
            _menhir_run_245 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_479 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DEFINE_FUN -> _ -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let MenhirCell1_DEFINE_FUN (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__4_, f) = (_endpos, _v) in
            let _v = _menhir_action_017 _endpos__4_ _startpos__1_ f in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 479
    
    and _menhir_run_468 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DEFINE_FUN_REC -> _ -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let MenhirCell1_DEFINE_FUN_REC (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__4_, f) = (_endpos, _v) in
            let _v = _menhir_action_018 _endpos__4_ _startpos__1_ f in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 468
    
    and _menhir_run_285 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DEFINE_FUN -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_DEFINE_FUN (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__4_, f) = (_endpos, _v) in
            let _v = _menhir_action_017 _endpos__4_ _startpos__1_ f in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 285
    
    and _menhir_run_245 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DEFINE_FUN_REC -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_DEFINE_FUN_REC (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__4_, f) = (_endpos, _v) in
            let _v = _menhir_action_018 _endpos__4_ _startpos__1_ f in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 245
    
    and _menhir_run_232 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_SYMBOL _menhir_cell0_OPEN, ttv_result) _menhir_cell1_list_sorted_var_ _menhir_cell0_CLOSE, ttv_result) _menhir_cell1_sort -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let MenhirCell1_sort (_menhir_stack, _, ret) = _menhir_stack in
        let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_list_sorted_var_ (_menhir_stack, _, args) = _menhir_stack in
        let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_SYMBOL (_menhir_stack, _menhir_s, s, _, _) = _menhir_stack in
        let body = _v in
        let _v = _menhir_action_053 args body ret s in
        _menhir_goto_function_def _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_225 : type  ttv_stack ttv_result. (((((ttv_stack, ttv_result) _menhir_cell1_SYMBOL _menhir_cell0_OPEN, ttv_result) _menhir_cell1_PAR _menhir_cell0_OPEN, ttv_result) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE _menhir_cell0_OPEN, ttv_result) _menhir_cell1_list_sorted_var_ _menhir_cell0_CLOSE, ttv_result) _menhir_cell1_sort -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_sort (_menhir_stack, _, ret) = _menhir_stack in
            let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_list_sorted_var_ (_menhir_stack, _, args) = _menhir_stack in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_nonempty_list_datatype_symbol_ (_menhir_stack, _, vars) = _menhir_stack in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_PAR (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_SYMBOL (_menhir_stack, _menhir_s, s, _, _) = _menhir_stack in
            let body = _v in
            let _v = _menhir_action_054 args body ret s vars in
            _menhir_goto_function_def _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 225
    
    and _menhir_run_224 : type  ttv_stack ttv_result. ((((((ttv_stack, ttv_result) _menhir_cell1_SYMBOL _menhir_cell0_OPEN, ttv_result) _menhir_cell1_PAR _menhir_cell0_OPEN, ttv_result) _menhir_cell1_nonempty_list_datatype_symbol_ _menhir_cell0_CLOSE _menhir_cell0_OPEN, ttv_result) _menhir_cell1_list_sorted_var_ _menhir_cell0_CLOSE, ttv_result) _menhir_cell1_sort, ttv_result) _menhir_cell1_CLOSE -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let MenhirCell1_CLOSE (_menhir_stack, _, _) = _menhir_stack in
        let MenhirCell1_sort (_menhir_stack, _, ret) = _menhir_stack in
        let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_list_sorted_var_ (_menhir_stack, _, args) = _menhir_stack in
        let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
        let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_nonempty_list_datatype_symbol_ (_menhir_stack, _, vars) = _menhir_stack in
        let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_PAR (_menhir_stack, _, _, _) = _menhir_stack in
        let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_SYMBOL (_menhir_stack, _menhir_s, s, _, _) = _menhir_stack in
        let body = _v in
        let _v = _menhir_action_056 args body ret s vars in
        _menhir_goto_function_def _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
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
            let _v = _menhir_action_102 x in
            _menhir_goto_nonempty_list_term_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 169
    
    and _menhir_goto_nonempty_list_term_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState576 ->
            _menhir_run_577 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState474 ->
            _menhir_run_475 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState433 ->
            _menhir_run_434 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState280 ->
            _menhir_run_281 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState084 ->
            _menhir_run_173 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState168 ->
            _menhir_run_171 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState169 ->
            _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_577 : type  ttv_stack. ((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_qual_identifier -> _ -> _ -> _ -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let MenhirCell1_qual_identifier (_menhir_stack, _, s) = _menhir_stack in
        let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos__4_, args) = (_endpos, _v) in
        let _v = _menhir_action_172 _endpos__4_ _startpos__1_ args s in
        _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_475 : type  ttv_stack. (((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DEFINE_FUNS_REC _menhir_cell0_OPEN, _menhir_box_input) _menhir_cell1_nonempty_list___anonymous_0_ _menhir_cell0_CLOSE _menhir_cell0_OPEN -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_nonempty_list___anonymous_0_ (_menhir_stack, _, l1) = _menhir_stack in
            let MenhirCell0_OPEN (_menhir_stack, _startpos__3_) = _menhir_stack in
            let MenhirCell1_DEFINE_FUNS_REC (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__9_, _endpos__8_, l2) = (_endpos_0, _endpos, _v) in
            let _v = _menhir_action_019 _endpos__8_ _endpos__9_ _startpos__1_ _startpos__3_ l1 l2 in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 476
    
    and _menhir_run_434 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_GET_VALUE _menhir_cell0_OPEN -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_GET_VALUE (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (l, _endpos__6_) = (_v, _endpos_0) in
            let _v = _menhir_action_031 _endpos__6_ _startpos__1_ l in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 435
    
    and _menhir_run_281 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DEFINE_FUNS_REC _menhir_cell0_OPEN, _menhir_box_file) _menhir_cell1_nonempty_list___anonymous_0_ _menhir_cell0_CLOSE _menhir_cell0_OPEN -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_nonempty_list___anonymous_0_ (_menhir_stack, _, l1) = _menhir_stack in
            let MenhirCell0_OPEN (_menhir_stack, _startpos__3_) = _menhir_stack in
            let MenhirCell1_DEFINE_FUNS_REC (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__9_, _endpos__8_, l2) = (_endpos_0, _endpos, _v) in
            let _v = _menhir_action_019 _endpos__8_ _endpos__9_ _startpos__1_ _startpos__3_ l1 l2 in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 282
    
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
            let _v = _menhir_action_031 _endpos__6_ _startpos__1_ l in
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
        let _v = _menhir_action_172 _endpos__4_ _startpos__1_ args s in
        _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_170 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_term -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let MenhirCell1_term (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_103 x xs in
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
            let _v = _menhir_action_175 _endpos__7_ _startpos__1_ l t in
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
            let _v = _menhir_action_174 _endpos__7_ _startpos__1_ l t in
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
            let _v = _menhir_action_173 _endpos__7_ _startpos__1_ l t in
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
            let _v = _menhir_action_178 _endpos__4_ _endpos_s_ _startpos__1_ _startpos_s_ s t in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                let _menhir_stack = MenhirCell1_var_binding (_menhir_stack, _menhir_s, _v) in
                _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState138
            | Tokens.CLOSE ->
                let x = _v in
                let _v = _menhir_action_104 x in
                _menhir_goto_nonempty_list_var_binding_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 138)
        | _ ->
            _eRR 136
    
    and _menhir_goto_nonempty_list_var_binding_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState551 ->
            _menhir_run_552 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState133 ->
            _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState138 ->
            _menhir_run_139 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_552 : type  ttv_stack. (((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_LET _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_term) _menhir_state -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_nonempty_list_var_binding_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState553 in
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
            _eRR 553
    
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
        let _v = _menhir_action_105 x xs in
        _menhir_goto_nonempty_list_var_binding_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_122 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_pattern -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_pattern (_menhir_stack, _, p) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _) = _menhir_stack in
            let t = _v in
            let _v = _menhir_action_079 p t in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                let _menhir_stack = MenhirCell1_match_case (_menhir_stack, _menhir_s, _v) in
                _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState130
            | Tokens.CLOSE ->
                let x = _v in
                let _v = _menhir_action_092 x in
                _menhir_goto_nonempty_list_match_case_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 130)
        | _ ->
            _eRR 122
    
    and _menhir_goto_nonempty_list_match_case_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState546 ->
            _menhir_run_547 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState130 ->
            _menhir_run_131 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState111 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_547 : type  ttv_stack. (((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_MATCH, _menhir_box_term) _menhir_cell1_term _menhir_cell0_OPEN -> _ -> _ -> _ -> _menhir_box_term =
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
            let _v = _menhir_action_176 _endpos__7_ _startpos__1_ l t in
            _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 548
    
    and _menhir_run_131 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_match_case -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_match_case (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_093 x xs in
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
            let _v = _menhir_action_176 _endpos__7_ _startpos__1_ l t in
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
        let _v = _menhir_action_170 c in
        _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_061 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_KEYWORD -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let (_endpos_v_, v) = (_endpos, _v) in
        let _v = _menhir_action_004 v in
        _menhir_goto_attribute_value _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_v_ _v _tok
    
    and _menhir_run_053 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let c = _v in
        let _v = _menhir_action_155 c in
        _menhir_goto_s_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_056 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_s_expr -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let MenhirCell1_s_expr (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_072 x xs in
        _menhir_goto_list_s_expr_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_list_s_expr_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState530 ->
            _menhir_run_531 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState403 ->
            _menhir_run_404 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState007 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState018 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState054 ->
            _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_531 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_extension_statement -> _ -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let MenhirCell1_extension_statement (_menhir_stack, _, e) = _menhir_stack in
        let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos__4_, l) = (_endpos, _v) in
        let _v = _menhir_action_039 _endpos__4_ _startpos__1_ e l in
        _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_404 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_extension_statement -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell1_extension_statement (_menhir_stack, _, e) = _menhir_stack in
        let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos__4_, l) = (_endpos, _v) in
        let _v = _menhir_action_039 _endpos__4_ _startpos__1_ e l in
        _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_403 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_extension_statement (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.UNDERSCORE ->
            _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.SYMBOL _v_0 ->
            _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState403
        | Tokens.STR _v_1 ->
            _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState403
        | Tokens.SET_OPTION ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.SET_LOGIC ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.SET_INFO ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.RESET_ASSERTIONS ->
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.RESET ->
            _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.PUSH ->
            _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.POP ->
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.PAR ->
            _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.OPEN ->
            _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.NUM _v_2 ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState403
        | Tokens.MATCH ->
            _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.LET ->
            _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.KEYWORD _v_3 ->
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState403
        | Tokens.HEX _v_4 ->
            _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState403
        | Tokens.GET_VALUE ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.GET_UNSAT_CORE ->
            _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.GET_UNSAT_ASSUMPTIONS ->
            _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.GET_PROOF ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.GET_OPTION ->
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.GET_MODEL ->
            _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.GET_INFO ->
            _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.GET_ASSIGNMENT ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.GET_ASSERTIONS ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.FORALL ->
            _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.EXIT ->
            _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.EXISTS ->
            _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.ECHO ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.DEFINE_SORT ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.DEFINE_FUN_REC ->
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.DEFINE_FUNS_REC ->
            _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.DEFINE_FUN ->
            _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.DECLARE_SORT ->
            _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.DECLARE_FUN ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.DECLARE_DATATYPES ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.DECLARE_DATATYPE ->
            _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.DECLARE_CONST ->
            _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.DEC _v_5 ->
            _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState403
        | Tokens.CHECK_SAT_ASSUMING ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.CHECK_SAT ->
            _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.BIN _v_6 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v_6 MenhirState403
        | Tokens.ATTRIBUTE ->
            _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.ASSERT ->
            _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.AS ->
            _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState403
        | Tokens.CLOSE ->
            let _v_7 = _menhir_action_071 () in
            _menhir_run_404 _menhir_stack _menhir_lexbuf _menhir_lexer _v_7
        | _ ->
            _eRR 403
    
    and _menhir_run_188 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_GET_INFO as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        let s = _v in
        let _v = _menhir_action_062 s in
        _menhir_goto_info_flag _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_info_flag : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_GET_INFO as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState448 ->
            _menhir_run_449 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState187 ->
            _menhir_run_189 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_449 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_GET_INFO -> _ -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let MenhirCell1_GET_INFO (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__4_, i) = (_endpos, _v) in
            let _v = _menhir_action_025 _endpos__4_ _startpos__1_ i in
            _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 449
    
    and _menhir_run_189 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_GET_INFO -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_GET_INFO (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__4_, i) = (_endpos, _v) in
            let _v = _menhir_action_025 _endpos__4_ _startpos__1_ i in
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
            let _v_1 = _menhir_action_065 () in
            _menhir_run_204 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1
        | _ ->
            _eRR 203
    
    and _menhir_run_204 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_SYMBOL -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_SYMBOL (_menhir_stack, _menhir_s, x, _, _) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_066 x xs in
        _menhir_goto_list_SYMBOL_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_goto_list_SYMBOL_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState462 ->
            _menhir_run_463 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState202 ->
            _menhir_run_205 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState203 ->
            _menhir_run_204 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_463 : type  ttv_stack. (((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DEFINE_SORT _menhir_cell0_SYMBOL _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_list_SYMBOL_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState464 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 464
    
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
            | Tokens.PAR ->
                let _menhir_s = MenhirState211 in
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_PAR (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.OPEN ->
                    let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                    let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
                    let _menhir_s = MenhirState213 in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.SYMBOL _v ->
                        _menhir_run_214 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                    | _ ->
                        _eRR 213)
                | _ ->
                    _eRR 212)
            | Tokens.OPEN ->
                _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState211
            | Tokens.CLOSE ->
                let _v_5 = _menhir_action_077 () in
                _menhir_run_229 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState211
            | _ ->
                _eRR 211)
        | _ ->
            _eRR 210
    
    and _menhir_run_233 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.PAR ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell0_PAR (_menhir_stack, _startpos, _endpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
                let _menhir_s = MenhirState235 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SYMBOL _v ->
                    _menhir_run_214 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | _ ->
                    _eRR 235)
            | _ ->
                _eRR 234)
        | _ ->
            _eRR 233
    
    and _menhir_run_292 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_DECLARE_FUN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
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
            | Tokens.SYMBOL _v_1 ->
                _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState293
            | Tokens.PAR ->
                let _menhir_s = MenhirState293 in
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_PAR (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.OPEN ->
                    let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                    let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
                    let _menhir_s = MenhirState295 in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.SYMBOL _v ->
                        _menhir_run_214 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                    | _ ->
                        _eRR 295)
                | _ ->
                    _eRR 294)
            | Tokens.OPEN ->
                _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState293
            | Tokens.CLOSE ->
                let _v_6 = _menhir_action_075 () in
                _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer _v_6 MenhirState293
            | _ ->
                _eRR 293)
        | _ ->
            _eRR 292
    
    and _menhir_run_308 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_DECLARE_FUN as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.PAR ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell0_PAR (_menhir_stack, _startpos, _endpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
                let _menhir_s = MenhirState310 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SYMBOL _v ->
                    _menhir_run_214 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | _ ->
                    _eRR 310)
            | _ ->
                _eRR 309)
        | _ ->
            _eRR 308
    
    and _menhir_run_323 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
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
                    let _v = _menhir_action_163 n s in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.OPEN ->
                        let _menhir_stack = MenhirCell1_sort_dec (_menhir_stack, _menhir_s, _v) in
                        _menhir_run_323 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState327
                    | Tokens.CLOSE ->
                        let x = _v in
                        let _v = _menhir_action_098 x in
                        _menhir_goto_nonempty_list_sort_dec_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                    | _ ->
                        _eRR 327)
                | _ ->
                    _eRR 325)
            | _ ->
                _eRR 324)
        | _ ->
            _eRR 323
    
    and _menhir_goto_nonempty_list_sort_dec_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState489 ->
            _menhir_run_490 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState322 ->
            _menhir_run_329 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState327 ->
            _menhir_run_328 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_490 : type  ttv_stack. (((ttv_stack, _menhir_box_input) _menhir_cell1_OPEN, _menhir_box_input) _menhir_cell1_DECLARE_DATATYPES _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_nonempty_list_sort_dec_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState492 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                _menhir_run_332 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 492)
        | _ ->
            _eRR 491
    
    and _menhir_run_329 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_OPEN, _menhir_box_file) _menhir_cell1_DECLARE_DATATYPES _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_nonempty_list_sort_dec_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState331 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                _menhir_run_332 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 331)
        | _ ->
            _eRR 330
    
    and _menhir_run_328 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_sort_dec -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_sort_dec (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_099 x xs in
        _menhir_goto_nonempty_list_sort_dec_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    let _menhir_run_000 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
        | Tokens.EOF ->
            let _v = _menhir_action_067 () in
            _menhir_run_406 _menhir_stack _v
        | _ ->
            _eRR 0
    
    let _menhir_run_411 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SYMBOL _v ->
                let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, MenhirState411, _startpos) in
                _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState412
            | Tokens.SET_OPTION ->
                let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, MenhirState411, _startpos) in
                let _menhir_s = MenhirState412 in
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_SET_OPTION (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _menhir_s = MenhirState413 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.KEYWORD _v ->
                    _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | _ ->
                    _eRR 413)
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
                          _menhir_action_037 _endpos__4_ _startpos__1_ s
                        in
                        _menhir_run_535 _menhir_stack _v
                    | _ ->
                        _eRR 417)
                | _ ->
                    _eRR 416)
            | Tokens.SET_INFO ->
                let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, MenhirState411, _startpos) in
                let _menhir_s = MenhirState412 in
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_SET_INFO (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _menhir_s = MenhirState419 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.KEYWORD _v ->
                    _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | _ ->
                    _eRR 419)
            | Tokens.RESET_ASSERTIONS ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.CLOSE ->
                    let _endpos_7 = _menhir_lexbuf.Lexing.lex_curr_p in
                    let _v =
                      let (_startpos__1_, _endpos__3_) = (_startpos, _endpos_7) in
                      _menhir_action_035 _endpos__3_ _startpos__1_
                    in
                    _menhir_run_535 _menhir_stack _v
                | _ ->
                    _eRR 422)
            | Tokens.RESET ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.CLOSE ->
                    let _endpos_9 = _menhir_lexbuf.Lexing.lex_curr_p in
                    let _v =
                      let (_startpos__1_, _endpos__3_) = (_startpos, _endpos_9) in
                      _menhir_action_034 _endpos__3_ _startpos__1_
                    in
                    _menhir_run_535 _menhir_stack _v
                | _ ->
                    _eRR 424)
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
                          _menhir_action_033 _endpos__4_ _startpos__1_ n
                        in
                        _menhir_run_535 _menhir_stack _v
                    | _ ->
                        _eRR 427)
                | _ ->
                    _eRR 426)
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
                          _menhir_action_032 _endpos__4_ _startpos__1_ n
                        in
                        _menhir_run_535 _menhir_stack _v
                    | _ ->
                        _eRR 430)
                | _ ->
                    _eRR 429)
            | Tokens.GET_VALUE ->
                let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, MenhirState411, _startpos) in
                let _menhir_s = MenhirState412 in
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_GET_VALUE (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.OPEN ->
                    let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                    let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
                    let _menhir_s = MenhirState433 in
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
                        _eRR 433)
                | _ ->
                    _eRR 432)
            | Tokens.GET_UNSAT_CORE ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.CLOSE ->
                    let _endpos_21 = _menhir_lexbuf.Lexing.lex_curr_p in
                    let _v =
                      let (_startpos__1_, _endpos__3_) = (_startpos, _endpos_21) in
                      _menhir_action_030 _endpos__3_ _startpos__1_
                    in
                    _menhir_run_535 _menhir_stack _v
                | _ ->
                    _eRR 437)
            | Tokens.GET_UNSAT_ASSUMPTIONS ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.CLOSE ->
                    let _endpos_23 = _menhir_lexbuf.Lexing.lex_curr_p in
                    let _v =
                      let (_startpos__1_, _endpos__3_) = (_startpos, _endpos_23) in
                      _menhir_action_029 _endpos__3_ _startpos__1_
                    in
                    _menhir_run_535 _menhir_stack _v
                | _ ->
                    _eRR 439)
            | Tokens.GET_PROOF ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.CLOSE ->
                    let _endpos_25 = _menhir_lexbuf.Lexing.lex_curr_p in
                    let _v =
                      let (_startpos__1_, _endpos__3_) = (_startpos, _endpos_25) in
                      _menhir_action_028 _endpos__3_ _startpos__1_
                    in
                    _menhir_run_535 _menhir_stack _v
                | _ ->
                    _eRR 441)
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
                          _menhir_action_027 _endpos__4_ _startpos__1_ k
                        in
                        _menhir_run_535 _menhir_stack _v
                    | _ ->
                        _eRR 444)
                | _ ->
                    _eRR 443)
            | Tokens.GET_MODEL ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.CLOSE ->
                    let _endpos_31 = _menhir_lexbuf.Lexing.lex_curr_p in
                    let _v =
                      let (_startpos__1_, _endpos__3_) = (_startpos, _endpos_31) in
                      _menhir_action_026 _endpos__3_ _startpos__1_
                    in
                    _menhir_run_535 _menhir_stack _v
                | _ ->
                    _eRR 446)
            | Tokens.GET_INFO ->
                let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, MenhirState411, _startpos) in
                let _menhir_s = MenhirState412 in
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_GET_INFO (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _menhir_s = MenhirState448 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.KEYWORD _v ->
                    _menhir_run_188 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | _ ->
                    _eRR 448)
            | Tokens.GET_ASSIGNMENT ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.CLOSE ->
                    let _endpos_34 = _menhir_lexbuf.Lexing.lex_curr_p in
                    let _v =
                      let (_startpos__1_, _endpos__3_) = (_startpos, _endpos_34) in
                      _menhir_action_024 _endpos__3_ _startpos__1_
                    in
                    _menhir_run_535 _menhir_stack _v
                | _ ->
                    _eRR 451)
            | Tokens.GET_ASSERTIONS ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.CLOSE ->
                    let _endpos_36 = _menhir_lexbuf.Lexing.lex_curr_p in
                    let _v =
                      let (_startpos__1_, _endpos__3_) = (_startpos, _endpos_36) in
                      _menhir_action_023 _endpos__3_ _startpos__1_
                    in
                    _menhir_run_535 _menhir_stack _v
                | _ ->
                    _eRR 453)
            | Tokens.EXIT ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.CLOSE ->
                    let _endpos_38 = _menhir_lexbuf.Lexing.lex_curr_p in
                    let _v =
                      let (_startpos__1_, _endpos__3_) = (_startpos, _endpos_38) in
                      _menhir_action_022 _endpos__3_ _startpos__1_
                    in
                    _menhir_run_535 _menhir_stack _v
                | _ ->
                    _eRR 455)
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
                          _menhir_action_021 _endpos__4_ _startpos__1_ s
                        in
                        _menhir_run_535 _menhir_stack _v
                    | _ ->
                        _eRR 458)
                | _ ->
                    _eRR 457)
            | Tokens.DEFINE_SORT ->
                let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, MenhirState411, _startpos) in
                let _startpos_43 = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_DEFINE_SORT (_menhir_stack, MenhirState412, _startpos_43, _endpos) in
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
                            _menhir_run_203 _menhir_stack _menhir_lexbuf _menhir_lexer _v_47 MenhirState462
                        | Tokens.CLOSE ->
                            let _v_48 = _menhir_action_065 () in
                            _menhir_run_463 _menhir_stack _menhir_lexbuf _menhir_lexer _v_48 MenhirState462
                        | _ ->
                            _eRR 462)
                    | _ ->
                        _eRR 461)
                | _ ->
                    _eRR 460)
            | Tokens.DEFINE_FUN_REC ->
                let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, MenhirState411, _startpos) in
                let _menhir_s = MenhirState412 in
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_DEFINE_FUN_REC (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _menhir_s = MenhirState467 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SYMBOL _v ->
                    _menhir_run_210 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.OPEN ->
                    _menhir_run_233 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | _ ->
                    _eRR 467)
            | Tokens.DEFINE_FUNS_REC ->
                let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, MenhirState411, _startpos) in
                let _menhir_s = MenhirState412 in
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_DEFINE_FUNS_REC (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.OPEN ->
                    let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                    let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
                    let _menhir_s = MenhirState471 in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.OPEN ->
                        _menhir_run_249 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                    | _ ->
                        _eRR 471)
                | _ ->
                    _eRR 470)
            | Tokens.DEFINE_FUN ->
                let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, MenhirState411, _startpos) in
                let _menhir_s = MenhirState412 in
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_DEFINE_FUN (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _menhir_s = MenhirState478 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SYMBOL _v ->
                    _menhir_run_210 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.OPEN ->
                    _menhir_run_233 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | _ ->
                    _eRR 478)
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
                              _menhir_action_016 _endpos__5_ _startpos__1_ n s
                            in
                            _menhir_run_535 _menhir_stack _v
                        | _ ->
                            _eRR 483)
                    | _ ->
                        _eRR 482)
                | _ ->
                    _eRR 481)
            | Tokens.DECLARE_FUN ->
                let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, MenhirState411, _startpos) in
                let _menhir_s = MenhirState412 in
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_DECLARE_FUN (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _menhir_s = MenhirState485 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SYMBOL _v ->
                    _menhir_run_292 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.OPEN ->
                    _menhir_run_308 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | _ ->
                    _eRR 485)
            | Tokens.DECLARE_DATATYPES ->
                let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, MenhirState411, _startpos) in
                let _menhir_s = MenhirState412 in
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_DECLARE_DATATYPES (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.OPEN ->
                    let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                    let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
                    let _menhir_s = MenhirState489 in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.OPEN ->
                        _menhir_run_323 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                    | _ ->
                        _eRR 489)
                | _ ->
                    _eRR 488)
            | Tokens.DECLARE_DATATYPE ->
                let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, MenhirState411, _startpos) in
                let _menhir_s = MenhirState412 in
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_DECLARE_DATATYPE (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SYMBOL _v ->
                    let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                    let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                    let _menhir_stack = MenhirCell0_SYMBOL (_menhir_stack, _v, _startpos, _endpos) in
                    let _menhir_s = MenhirState497 in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.OPEN ->
                        _menhir_run_332 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                    | _ ->
                        _eRR 497)
                | _ ->
                    _eRR 496)
            | Tokens.DECLARE_CONST ->
                let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, MenhirState411, _startpos) in
                let _menhir_s = MenhirState412 in
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_DECLARE_CONST (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SYMBOL _v ->
                    let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                    let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                    let _menhir_stack = MenhirCell0_SYMBOL (_menhir_stack, _v, _startpos, _endpos) in
                    let _menhir_s = MenhirState501 in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.SYMBOL _v ->
                        _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                    | Tokens.OPEN ->
                        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                        let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
                        let _menhir_s = MenhirState502 in
                        let _tok = _menhir_lexer _menhir_lexbuf in
                        (match (_tok : MenhirBasics.token) with
                        | Tokens.UNDERSCORE ->
                            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                        | Tokens.SYMBOL _v ->
                            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                        | Tokens.PAR ->
                            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                            let _menhir_stack = MenhirCell1_PAR (_menhir_stack, _menhir_s, _startpos, _endpos) in
                            let _tok = _menhir_lexer _menhir_lexbuf in
                            (match (_tok : MenhirBasics.token) with
                            | Tokens.OPEN ->
                                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                                let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
                                let _menhir_s = MenhirState504 in
                                let _tok = _menhir_lexer _menhir_lexbuf in
                                (match (_tok : MenhirBasics.token) with
                                | Tokens.SYMBOL _v ->
                                    _menhir_run_214 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                                | _ ->
                                    _eRR 504)
                            | _ ->
                                _eRR 503)
                        | Tokens.OPEN ->
                            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                        | _ ->
                            _eRR 502)
                    | _ ->
                        _eRR 501)
                | _ ->
                    _eRR 500)
            | Tokens.CHECK_SAT_ASSUMING ->
                let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, MenhirState411, _startpos) in
                let _startpos_76 = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_CHECK_SAT_ASSUMING (_menhir_stack, MenhirState412, _startpos_76, _endpos) in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.OPEN ->
                    let _startpos_77 = _menhir_lexbuf.Lexing.lex_start_p in
                    let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos_77) in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.SYMBOL _v ->
                        _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState513
                    | Tokens.OPEN ->
                        _menhir_run_378 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState513
                    | Tokens.CLOSE ->
                        let _v = _menhir_action_069 () in
                        _menhir_run_514 _menhir_stack _menhir_lexbuf _menhir_lexer _v
                    | _ ->
                        _eRR 513)
                | _ ->
                    _eRR 512)
            | Tokens.CHECK_SAT ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.CLOSE ->
                    let _endpos_79 = _menhir_lexbuf.Lexing.lex_curr_p in
                    let _v =
                      let (_startpos__1_, _endpos__3_) = (_startpos, _endpos_79) in
                      _menhir_action_009 _endpos__3_ _startpos__1_
                    in
                    _menhir_run_535 _menhir_stack _v
                | _ ->
                    _eRR 517)
            | Tokens.ASSERT ->
                let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, MenhirState411, _startpos) in
                let _menhir_s = MenhirState412 in
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_ASSERT (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _menhir_s = MenhirState519 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SYMBOL _v ->
                    _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.STR _v ->
                    _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.OPEN ->
                    let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                    let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
                    let _menhir_s = MenhirState520 in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.UNDERSCORE ->
                        _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                    | Tokens.SYMBOL _v ->
                        _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                    | Tokens.PAR ->
                        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                        let _menhir_stack = MenhirCell1_PAR (_menhir_stack, _menhir_s, _startpos, _endpos) in
                        let _tok = _menhir_lexer _menhir_lexbuf in
                        (match (_tok : MenhirBasics.token) with
                        | Tokens.OPEN ->
                            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                            let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
                            let _menhir_s = MenhirState522 in
                            let _tok = _menhir_lexer _menhir_lexbuf in
                            (match (_tok : MenhirBasics.token) with
                            | Tokens.SYMBOL _v ->
                                _menhir_run_214 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                            | _ ->
                                _eRR 522)
                        | _ ->
                            _eRR 521)
                    | Tokens.OPEN ->
                        _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                    | Tokens.MATCH ->
                        _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                    | Tokens.LET ->
                        _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                    | Tokens.FORALL ->
                        _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                    | Tokens.EXISTS ->
                        _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                    | Tokens.ATTRIBUTE ->
                        _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                    | Tokens.AS ->
                        _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                    | _ ->
                        _eRR 520)
                | Tokens.NUM _v ->
                    _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.HEX _v ->
                    _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.DEC _v ->
                    _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.BIN _v ->
                    _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | _ ->
                    _eRR 519)
            | _ ->
                _eRR 412)
        | Tokens.EOF ->
            let _v = _menhir_action_063 () in
            _menhir_goto_input _menhir_stack _v
        | _ ->
            _eRR 411
    
    let _menhir_run_536 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _v =
              let s = _v in
              _menhir_action_057 s
            in
            _menhir_run_586 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v MenhirState536 _tok
        | Tokens.STR _v ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _v =
              let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
              _menhir_action_169 _endpos_s_ _startpos_s_ s
            in
            _menhir_run_584 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState536 _tok
        | Tokens.OPEN ->
            let _menhir_s = MenhirState536 in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
            let _menhir_s = MenhirState539 in
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
                    let _menhir_s = MenhirState541 in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.SYMBOL _v ->
                        _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                    | Tokens.NUM _v ->
                        _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                    | Tokens.HEX _v ->
                        _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                    | _ ->
                        _eRR 541)
                | _ ->
                    _eRR 540)
            | Tokens.SYMBOL _v ->
                _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.OPEN ->
                _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_MATCH (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _menhir_s = MenhirState544 in
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
                    _eRR 544)
            | Tokens.LET ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_LET (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.OPEN ->
                    let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                    let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
                    let _menhir_s = MenhirState551 in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.OPEN ->
                        _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                    | _ ->
                        _eRR 551)
                | _ ->
                    _eRR 550)
            | Tokens.FORALL ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_FORALL (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.OPEN ->
                    let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                    let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
                    let _menhir_s = MenhirState557 in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.OPEN ->
                        _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                    | _ ->
                        _eRR 557)
                | _ ->
                    _eRR 556)
            | Tokens.EXISTS ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_EXISTS (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.OPEN ->
                    let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                    let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
                    let _menhir_s = MenhirState563 in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.OPEN ->
                        _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                    | _ ->
                        _eRR 563)
                | _ ->
                    _eRR 562)
            | Tokens.ATTRIBUTE ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_ATTRIBUTE (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _menhir_s = MenhirState568 in
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
                    _eRR 568)
            | Tokens.AS ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_AS (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _menhir_s = MenhirState572 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SYMBOL _v ->
                    _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.OPEN ->
                    _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | _ ->
                    _eRR 572)
            | _ ->
                _eRR 539)
        | Tokens.NUM _v ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _v =
              let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
              _menhir_action_165 _endpos_s_ _startpos_s_ s
            in
            _menhir_run_584 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState536 _tok
        | Tokens.HEX _v ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _v =
              let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
              _menhir_action_167 _endpos_s_ _startpos_s_ s
            in
            _menhir_run_584 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState536 _tok
        | Tokens.DEC _v ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _v =
              let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
              _menhir_action_166 _endpos_s_ _startpos_s_ s
            in
            _menhir_run_584 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState536 _tok
        | Tokens.BIN _v ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _v =
              let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
              _menhir_action_168 _endpos_s_ _startpos_s_ s
            in
            _menhir_run_584 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState536 _tok
        | _ ->
            _eRR 536
    
  end
  
  let term =
    fun _menhir_lexer _menhir_lexbuf ->
      let _menhir_stack = () in
      let MenhirBox_term v = _menhir_run_536 _menhir_stack _menhir_lexbuf _menhir_lexer in
      v
  
  let input =
    fun _menhir_lexer _menhir_lexbuf ->
      let _menhir_stack = () in
      let MenhirBox_input v = _menhir_run_411 _menhir_stack _menhir_lexbuf _menhir_lexer in
      v
  
  let file =
    fun _menhir_lexer _menhir_lexbuf ->
      let _menhir_stack = () in
      let MenhirBox_file v = _menhir_run_000 _menhir_stack _menhir_lexbuf _menhir_lexer in
      v
  
# 505 "src/languages/smtlib2/poly/parser.mly"
  

# 9151 "src/languages/smtlib2/poly/parser.ml"
  
end
