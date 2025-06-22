
module Make

# 4 "src/languages/smtlib2/v2.6/response/parser.mly"
           (L : Dolmen_intf.Location.S)
# 7 "src/languages/smtlib2/v2.6/response/parser.ml"


# 5 "src/languages/smtlib2/v2.6/response/parser.mly"
           (I : Ast.Id)
# 12 "src/languages/smtlib2/v2.6/response/parser.ml"


# 6 "src/languages/smtlib2/v2.6/response/parser.mly"
           (T : Ast.Term with type location := L.t and type id := I.t)
# 17 "src/languages/smtlib2/v2.6/response/parser.ml"


# 7 "src/languages/smtlib2/v2.6/response/parser.mly"
           (S : Ast.Statement with type location := L.t and type id := I.t and type term := T.t)
# 22 "src/languages/smtlib2/v2.6/response/parser.ml"

= struct
  
  module MenhirBasics = struct
    
    exception Error of int
    
    let _eRR =
      fun _s ->
        raise (Error _s)
    
    type token = Tokens.token
    
  end
  
  include MenhirBasics
  
# 13 "src/languages/smtlib2/v2.6/response/parser.mly"
  

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


# 56 "src/languages/smtlib2/v2.6/response/parser.ml"
  
  type ('s, 'r) _menhir_state = 
    | MenhirState000 : ('s, _menhir_box_file) _menhir_state
      (** State 000.
        Stack shape : .
        Start symbol: file. *)

    | MenhirState003 : (('s, _menhir_box_file) _menhir_cell1_SAT _menhir_cell0_OPEN, _menhir_box_file) _menhir_state
      (** State 003.
        Stack shape : SAT OPEN.
        Start symbol: file. *)

    | MenhirState005 : ((('s, _menhir_box_file) _menhir_cell1_SAT _menhir_cell0_OPEN, _menhir_box_file) _menhir_cell1_option_MODEL_, _menhir_box_file) _menhir_state
      (** State 005.
        Stack shape : SAT OPEN option(MODEL).
        Start symbol: file. *)

    | MenhirState007 : (('s, 'r) _menhir_cell1_OPEN _menhir_cell0_DEFINE_FUN_REC, 'r) _menhir_state
      (** State 007.
        Stack shape : OPEN DEFINE_FUN_REC.
        Start symbol: <undetermined>. *)

    | MenhirState009 : (('s, 'r) _menhir_cell1_SYMBOL _menhir_cell0_OPEN, 'r) _menhir_state
      (** State 009.
        Stack shape : SYMBOL OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState011 : (('s, 'r) _menhir_cell1_OPEN _menhir_cell0_SYMBOL, 'r) _menhir_state
      (** State 011.
        Stack shape : OPEN SYMBOL.
        Start symbol: <undetermined>. *)

    | MenhirState013 : (('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_state
      (** State 013.
        Stack shape : OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState015 : ((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_UNDERSCORE _menhir_cell0_SYMBOL, 'r) _menhir_state
      (** State 015.
        Stack shape : OPEN UNDERSCORE SYMBOL.
        Start symbol: <undetermined>. *)

    | MenhirState021 : (('s, 'r) _menhir_cell1_index, 'r) _menhir_state
      (** State 021.
        Stack shape : index.
        Start symbol: <undetermined>. *)

    | MenhirState023 : (('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_state
      (** State 023.
        Stack shape : OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState024 : ((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_identifier, 'r) _menhir_state
      (** State 024.
        Stack shape : OPEN identifier.
        Start symbol: <undetermined>. *)

    | MenhirState025 : (('s, 'r) _menhir_cell1_sort, 'r) _menhir_state
      (** State 025.
        Stack shape : sort.
        Start symbol: <undetermined>. *)

    | MenhirState032 : (('s, 'r) _menhir_cell1_sorted_var, 'r) _menhir_state
      (** State 032.
        Stack shape : sorted_var.
        Start symbol: <undetermined>. *)

    | MenhirState035 : ((('s, 'r) _menhir_cell1_SYMBOL _menhir_cell0_OPEN, 'r) _menhir_cell1_list_sorted_var_ _menhir_cell0_CLOSE, 'r) _menhir_state
      (** State 035.
        Stack shape : SYMBOL OPEN list(sorted_var) CLOSE.
        Start symbol: <undetermined>. *)

    | MenhirState036 : (((('s, 'r) _menhir_cell1_SYMBOL _menhir_cell0_OPEN, 'r) _menhir_cell1_list_sorted_var_ _menhir_cell0_CLOSE, 'r) _menhir_cell1_sort, 'r) _menhir_state
      (** State 036.
        Stack shape : SYMBOL OPEN list(sorted_var) CLOSE sort.
        Start symbol: <undetermined>. *)

    | MenhirState038 : (('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_state
      (** State 038.
        Stack shape : OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState039 : ((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_OPEN, 'r) _menhir_state
      (** State 039.
        Stack shape : OPEN OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState040 : ((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_AS, 'r) _menhir_state
      (** State 040.
        Stack shape : OPEN AS.
        Start symbol: <undetermined>. *)

    | MenhirState041 : (((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_AS, 'r) _menhir_cell1_identifier, 'r) _menhir_state
      (** State 041.
        Stack shape : OPEN AS identifier.
        Start symbol: <undetermined>. *)

    | MenhirState044 : ((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_MATCH, 'r) _menhir_state
      (** State 044.
        Stack shape : OPEN MATCH.
        Start symbol: <undetermined>. *)

    | MenhirState050 : (((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_MATCH, 'r) _menhir_cell1_term _menhir_cell0_OPEN, 'r) _menhir_state
      (** State 050.
        Stack shape : OPEN MATCH term OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState051 : (('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_state
      (** State 051.
        Stack shape : OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState053 : ((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_OPEN, 'r) _menhir_state
      (** State 053.
        Stack shape : OPEN OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState054 : (((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_pattern_symbol, 'r) _menhir_state
      (** State 054.
        Stack shape : OPEN OPEN pattern_symbol.
        Start symbol: <undetermined>. *)

    | MenhirState055 : ((('s, 'r) _menhir_cell1_pattern_symbol, 'r) _menhir_cell1_pattern_symbol, 'r) _menhir_state
      (** State 055.
        Stack shape : pattern_symbol pattern_symbol.
        Start symbol: <undetermined>. *)

    | MenhirState060 : ((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_pattern, 'r) _menhir_state
      (** State 060.
        Stack shape : OPEN pattern.
        Start symbol: <undetermined>. *)

    | MenhirState069 : (('s, 'r) _menhir_cell1_match_case, 'r) _menhir_state
      (** State 069.
        Stack shape : match_case.
        Start symbol: <undetermined>. *)

    | MenhirState072 : ((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_LET _menhir_cell0_OPEN, 'r) _menhir_state
      (** State 072.
        Stack shape : OPEN LET OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState074 : (('s, 'r) _menhir_cell1_OPEN _menhir_cell0_SYMBOL, 'r) _menhir_state
      (** State 074.
        Stack shape : OPEN SYMBOL.
        Start symbol: <undetermined>. *)

    | MenhirState077 : (('s, 'r) _menhir_cell1_var_binding, 'r) _menhir_state
      (** State 077.
        Stack shape : var_binding.
        Start symbol: <undetermined>. *)

    | MenhirState080 : (((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_LET _menhir_cell0_OPEN, 'r) _menhir_cell1_nonempty_list_var_binding_ _menhir_cell0_CLOSE, 'r) _menhir_state
      (** State 080.
        Stack shape : OPEN LET OPEN nonempty_list(var_binding) CLOSE.
        Start symbol: <undetermined>. *)

    | MenhirState084 : ((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_FORALL _menhir_cell0_OPEN, 'r) _menhir_state
      (** State 084.
        Stack shape : OPEN FORALL OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState085 : (('s, 'r) _menhir_cell1_sorted_var, 'r) _menhir_state
      (** State 085.
        Stack shape : sorted_var.
        Start symbol: <undetermined>. *)

    | MenhirState088 : (((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_FORALL _menhir_cell0_OPEN, 'r) _menhir_cell1_nonempty_list_sorted_var_ _menhir_cell0_CLOSE, 'r) _menhir_state
      (** State 088.
        Stack shape : OPEN FORALL OPEN nonempty_list(sorted_var) CLOSE.
        Start symbol: <undetermined>. *)

    | MenhirState092 : ((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_EXISTS _menhir_cell0_OPEN, 'r) _menhir_state
      (** State 092.
        Stack shape : OPEN EXISTS OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState094 : (((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_EXISTS _menhir_cell0_OPEN, 'r) _menhir_cell1_nonempty_list_sorted_var_ _menhir_cell0_CLOSE, 'r) _menhir_state
      (** State 094.
        Stack shape : OPEN EXISTS OPEN nonempty_list(sorted_var) CLOSE.
        Start symbol: <undetermined>. *)

    | MenhirState097 : ((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_ATTRIBUTE, 'r) _menhir_state
      (** State 097.
        Stack shape : OPEN ATTRIBUTE.
        Start symbol: <undetermined>. *)

    | MenhirState098 : (((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_ATTRIBUTE, 'r) _menhir_cell1_term, 'r) _menhir_state
      (** State 098.
        Stack shape : OPEN ATTRIBUTE term.
        Start symbol: <undetermined>. *)

    | MenhirState099 : (('s, 'r) _menhir_cell1_KEYWORD, 'r) _menhir_state
      (** State 099.
        Stack shape : KEYWORD.
        Start symbol: <undetermined>. *)

    | MenhirState101 : ((('s, 'r) _menhir_cell1_KEYWORD, 'r) _menhir_cell1_OPEN, 'r) _menhir_state
      (** State 101.
        Stack shape : KEYWORD OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState106 : (('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_state
      (** State 106.
        Stack shape : OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState119 : (('s, 'r) _menhir_cell1_s_expr, 'r) _menhir_state
      (** State 119.
        Stack shape : s_expr.
        Start symbol: <undetermined>. *)

    | MenhirState131 : (('s, 'r) _menhir_cell1_attribute, 'r) _menhir_state
      (** State 131.
        Stack shape : attribute.
        Start symbol: <undetermined>. *)

    | MenhirState133 : ((('s, 'r) _menhir_cell1_OPEN, 'r) _menhir_cell1_qual_identifier, 'r) _menhir_state
      (** State 133.
        Stack shape : OPEN qual_identifier.
        Start symbol: <undetermined>. *)

    | MenhirState134 : (('s, 'r) _menhir_cell1_term, 'r) _menhir_state
      (** State 134.
        Stack shape : term.
        Start symbol: <undetermined>. *)

    | MenhirState142 : (('s, 'r) _menhir_cell1_OPEN _menhir_cell0_DEFINE_FUNS_REC _menhir_cell0_OPEN, 'r) _menhir_state
      (** State 142.
        Stack shape : OPEN DEFINE_FUNS_REC OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState145 : (('s, 'r) _menhir_cell1_OPEN _menhir_cell0_SYMBOL _menhir_cell0_OPEN, 'r) _menhir_state
      (** State 145.
        Stack shape : OPEN SYMBOL OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState147 : ((('s, 'r) _menhir_cell1_OPEN _menhir_cell0_SYMBOL _menhir_cell0_OPEN, 'r) _menhir_cell1_list_sorted_var_ _menhir_cell0_CLOSE, 'r) _menhir_state
      (** State 147.
        Stack shape : OPEN SYMBOL OPEN list(sorted_var) CLOSE.
        Start symbol: <undetermined>. *)

    | MenhirState152 : ((('s, 'r) _menhir_cell1_OPEN _menhir_cell0_DEFINE_FUNS_REC _menhir_cell0_OPEN, 'r) _menhir_cell1_nonempty_list_function_dec_ _menhir_cell0_CLOSE _menhir_cell0_OPEN, 'r) _menhir_state
      (** State 152.
        Stack shape : OPEN DEFINE_FUNS_REC OPEN nonempty_list(function_dec) CLOSE OPEN.
        Start symbol: <undetermined>. *)

    | MenhirState156 : (('s, 'r) _menhir_cell1_function_dec, 'r) _menhir_state
      (** State 156.
        Stack shape : function_dec.
        Start symbol: <undetermined>. *)

    | MenhirState158 : (('s, 'r) _menhir_cell1_OPEN _menhir_cell0_DEFINE_FUN, 'r) _menhir_state
      (** State 158.
        Stack shape : OPEN DEFINE_FUN.
        Start symbol: <undetermined>. *)

    | MenhirState163 : (('s, 'r) _menhir_cell1_definition, 'r) _menhir_state
      (** State 163.
        Stack shape : definition.
        Start symbol: <undetermined>. *)

    | MenhirState168 : (('s, _menhir_box_file) _menhir_cell1_answer, _menhir_box_file) _menhir_state
      (** State 168.
        Stack shape : answer.
        Start symbol: file. *)

    | MenhirState170 : ('s, _menhir_box_input) _menhir_state
      (** State 170.
        Stack shape : .
        Start symbol: input. *)

    | MenhirState173 : (('s, _menhir_box_input) _menhir_cell1_SAT _menhir_cell0_OPEN, _menhir_box_input) _menhir_state
      (** State 173.
        Stack shape : SAT OPEN.
        Start symbol: input. *)

    | MenhirState174 : ((('s, _menhir_box_input) _menhir_cell1_SAT _menhir_cell0_OPEN, _menhir_box_input) _menhir_cell1_option_MODEL_, _menhir_box_input) _menhir_state
      (** State 174.
        Stack shape : SAT OPEN option(MODEL).
        Start symbol: input. *)

    | MenhirState180 : ('s, _menhir_box_term) _menhir_state
      (** State 180.
        Stack shape : .
        Start symbol: term. *)

    | MenhirState183 : (('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_state
      (** State 183.
        Stack shape : OPEN.
        Start symbol: term. *)

    | MenhirState185 : ((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_UNDERSCORE _menhir_cell0_SYMBOL, _menhir_box_term) _menhir_state
      (** State 185.
        Stack shape : OPEN UNDERSCORE SYMBOL.
        Start symbol: term. *)

    | MenhirState188 : ((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_MATCH, _menhir_box_term) _menhir_state
      (** State 188.
        Stack shape : OPEN MATCH.
        Start symbol: term. *)

    | MenhirState190 : (((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_MATCH, _menhir_box_term) _menhir_cell1_term _menhir_cell0_OPEN, _menhir_box_term) _menhir_state
      (** State 190.
        Stack shape : OPEN MATCH term OPEN.
        Start symbol: term. *)

    | MenhirState195 : ((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_LET _menhir_cell0_OPEN, _menhir_box_term) _menhir_state
      (** State 195.
        Stack shape : OPEN LET OPEN.
        Start symbol: term. *)

    | MenhirState197 : (((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_LET _menhir_cell0_OPEN, _menhir_box_term) _menhir_cell1_nonempty_list_var_binding_ _menhir_cell0_CLOSE, _menhir_box_term) _menhir_state
      (** State 197.
        Stack shape : OPEN LET OPEN nonempty_list(var_binding) CLOSE.
        Start symbol: term. *)

    | MenhirState201 : ((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_FORALL _menhir_cell0_OPEN, _menhir_box_term) _menhir_state
      (** State 201.
        Stack shape : OPEN FORALL OPEN.
        Start symbol: term. *)

    | MenhirState203 : (((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_FORALL _menhir_cell0_OPEN, _menhir_box_term) _menhir_cell1_nonempty_list_sorted_var_ _menhir_cell0_CLOSE, _menhir_box_term) _menhir_state
      (** State 203.
        Stack shape : OPEN FORALL OPEN nonempty_list(sorted_var) CLOSE.
        Start symbol: term. *)

    | MenhirState207 : ((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_EXISTS _menhir_cell0_OPEN, _menhir_box_term) _menhir_state
      (** State 207.
        Stack shape : OPEN EXISTS OPEN.
        Start symbol: term. *)

    | MenhirState209 : (((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_EXISTS _menhir_cell0_OPEN, _menhir_box_term) _menhir_cell1_nonempty_list_sorted_var_ _menhir_cell0_CLOSE, _menhir_box_term) _menhir_state
      (** State 209.
        Stack shape : OPEN EXISTS OPEN nonempty_list(sorted_var) CLOSE.
        Start symbol: term. *)

    | MenhirState212 : ((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_ATTRIBUTE, _menhir_box_term) _menhir_state
      (** State 212.
        Stack shape : OPEN ATTRIBUTE.
        Start symbol: term. *)

    | MenhirState213 : (((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_ATTRIBUTE, _menhir_box_term) _menhir_cell1_term, _menhir_box_term) _menhir_state
      (** State 213.
        Stack shape : OPEN ATTRIBUTE term.
        Start symbol: term. *)

    | MenhirState216 : ((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_AS, _menhir_box_term) _menhir_state
      (** State 216.
        Stack shape : OPEN AS.
        Start symbol: term. *)

    | MenhirState217 : (((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_AS, _menhir_box_term) _menhir_cell1_identifier, _menhir_box_term) _menhir_state
      (** State 217.
        Stack shape : OPEN AS identifier.
        Start symbol: term. *)

    | MenhirState220 : ((('s, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_qual_identifier, _menhir_box_term) _menhir_state
      (** State 220.
        Stack shape : OPEN qual_identifier.
        Start symbol: term. *)

  
  and ('s, 'r) _menhir_cell1_answer = 
    | MenhirCell1_answer of 's * ('s, 'r) _menhir_state * (S.t)
  
  and ('s, 'r) _menhir_cell1_attribute = 
    | MenhirCell1_attribute of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_definition = 
    | MenhirCell1_definition of 's * ('s, 'r) _menhir_state * (S.defs)
  
  and ('s, 'r) _menhir_cell1_function_dec = 
    | MenhirCell1_function_dec of 's * ('s, 'r) _menhir_state * (I.t * T.t list * T.t list * T.t)
  
  and ('s, 'r) _menhir_cell1_identifier = 
    | MenhirCell1_identifier of 's * ('s, 'r) _menhir_state * (I.namespace -> I.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_index = 
    | MenhirCell1_index of 's * ('s, 'r) _menhir_state * (string)
  
  and ('s, 'r) _menhir_cell1_list_sorted_var_ = 
    | MenhirCell1_list_sorted_var_ of 's * ('s, 'r) _menhir_state * (T.t list)
  
  and ('s, 'r) _menhir_cell1_match_case = 
    | MenhirCell1_match_case of 's * ('s, 'r) _menhir_state * (T.t * T.t)
  
  and ('s, 'r) _menhir_cell1_nonempty_list_function_dec_ = 
    | MenhirCell1_nonempty_list_function_dec_ of 's * ('s, 'r) _menhir_state * ((I.t * T.t list * T.t list * T.t) list)
  
  and ('s, 'r) _menhir_cell1_nonempty_list_sorted_var_ = 
    | MenhirCell1_nonempty_list_sorted_var_ of 's * ('s, 'r) _menhir_state * (T.t list)
  
  and ('s, 'r) _menhir_cell1_nonempty_list_var_binding_ = 
    | MenhirCell1_nonempty_list_var_binding_ of 's * ('s, 'r) _menhir_state * (T.t list)
  
  and ('s, 'r) _menhir_cell1_option_MODEL_ = 
    | MenhirCell1_option_MODEL_ of 's * ('s, 'r) _menhir_state * (unit option)
  
  and ('s, 'r) _menhir_cell1_pattern = 
    | MenhirCell1_pattern of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_pattern_symbol = 
    | MenhirCell1_pattern_symbol of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_qual_identifier = 
    | MenhirCell1_qual_identifier of 's * ('s, 'r) _menhir_state * ([ `As of T.t * T.t * L.t | `NoAs of T.t ])
  
  and ('s, 'r) _menhir_cell1_s_expr = 
    | MenhirCell1_s_expr of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_sort = 
    | MenhirCell1_sort of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_sorted_var = 
    | MenhirCell1_sorted_var of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_term = 
    | MenhirCell1_term of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_var_binding = 
    | MenhirCell1_var_binding of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_AS = 
    | MenhirCell1_AS of 's * ('s, 'r) _menhir_state * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_ATTRIBUTE = 
    | MenhirCell1_ATTRIBUTE of 's * ('s, 'r) _menhir_state * Lexing.position * Lexing.position
  
  and 's _menhir_cell0_CLOSE = 
    | MenhirCell0_CLOSE of 's * Lexing.position
  
  and 's _menhir_cell0_DEFINE_FUN = 
    | MenhirCell0_DEFINE_FUN of 's * Lexing.position * Lexing.position
  
  and 's _menhir_cell0_DEFINE_FUNS_REC = 
    | MenhirCell0_DEFINE_FUNS_REC of 's * Lexing.position * Lexing.position
  
  and 's _menhir_cell0_DEFINE_FUN_REC = 
    | MenhirCell0_DEFINE_FUN_REC of 's * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_EXISTS = 
    | MenhirCell1_EXISTS of 's * ('s, 'r) _menhir_state * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_FORALL = 
    | MenhirCell1_FORALL of 's * ('s, 'r) _menhir_state * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_KEYWORD = 
    | MenhirCell1_KEYWORD of 's * ('s, 'r) _menhir_state * (
# 9 "src/languages/smtlib2/v2.6/response/tokens.mly"
       (string)
# 508 "src/languages/smtlib2/v2.6/response/parser.ml"
  ) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_LET = 
    | MenhirCell1_LET of 's * ('s, 'r) _menhir_state * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_MATCH = 
    | MenhirCell1_MATCH of 's * ('s, 'r) _menhir_state * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_OPEN = 
    | MenhirCell1_OPEN of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and 's _menhir_cell0_OPEN = 
    | MenhirCell0_OPEN of 's * Lexing.position
  
  and ('s, 'r) _menhir_cell1_SAT = 
    | MenhirCell1_SAT of 's * ('s, 'r) _menhir_state * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_SYMBOL = 
    | MenhirCell1_SYMBOL of 's * ('s, 'r) _menhir_state * (
# 9 "src/languages/smtlib2/v2.6/response/tokens.mly"
       (string)
# 530 "src/languages/smtlib2/v2.6/response/parser.ml"
  ) * Lexing.position * Lexing.position
  
  and 's _menhir_cell0_SYMBOL = 
    | MenhirCell0_SYMBOL of 's * (
# 9 "src/languages/smtlib2/v2.6/response/tokens.mly"
       (string)
# 537 "src/languages/smtlib2/v2.6/response/parser.ml"
  ) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_UNDERSCORE = 
    | MenhirCell1_UNDERSCORE of 's * ('s, 'r) _menhir_state * Lexing.position * Lexing.position
  
  and _menhir_box_term = 
    | MenhirBox_term of (T.t) [@@unboxed]
  
  and _menhir_box_input = 
    | MenhirBox_input of (S.t option) [@@unboxed]
  
  and _menhir_box_file = 
    | MenhirBox_file of (S.t list) [@@unboxed]
  
  let _menhir_action_03 =
    fun _endpos__1_ _startpos__1_ ->
      let _endpos = _endpos__1_ in
      let _startpos = _startpos__1_ in
      (
# 240 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      S.unsat ~loc () )
# 560 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (S.t))
  
  let _menhir_action_04 =
    fun _endpos__5_ _startpos__1_ model ->
      let _endpos = _endpos__5_ in
      let _startpos = _startpos__1_ in
      (
# 243 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      S.sat ~loc (Some model) )
# 571 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (S.t))
  
  let _menhir_action_05 =
    fun _endpos_a_ _endpos_s_ _startpos_s_ a s ->
      let _endpos = _endpos_a_ in
      let _startpos = _startpos_s_ in
      (
# 118 "src/languages/smtlib2/v2.6/response/parser.mly"
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
# 591 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t))
  
  let _menhir_action_06 =
    fun v ->
      (
# 109 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( v )
# 599 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t))
  
  let _menhir_action_07 =
    fun _endpos_v_ _startpos_v_ v ->
      let _endpos = _endpos_v_ in
      let _startpos = _startpos_v_ in
      (
# 111 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.const ~loc I.(mk attr v) )
# 609 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t))
  
  let _menhir_action_08 =
    fun _endpos__3_ _startpos__1_ l ->
      let _endpos = _endpos__3_ in
      let _startpos = _startpos__1_ in
      (
# 113 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.sexpr ~loc l )
# 619 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t))
  
  let _menhir_action_09 =
    fun _endpos__4_ _startpos__1_ f ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 216 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( let id, vars, args, ret, body = f in
      let loc = L.mk_pos _startpos _endpos in
      S.fun_def ~loc id vars args ret body )
# 631 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (S.defs))
  
  let _menhir_action_10 =
    fun _endpos__4_ _startpos__1_ f ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 220 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( let id, vars, args, ret, body = f in
      let loc = L.mk_pos _startpos _endpos in
      S.funs_def_rec ~loc [id, vars, args, ret, body] )
# 643 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (S.defs))
  
  let _menhir_action_11 =
    fun _endpos__8_ _endpos__9_ _startpos__1_ _startpos__3_ l1 l2 ->
      let _endpos = _endpos__9_ in
      let _startpos = _startpos__1_ in
      (
# 226 "src/languages/smtlib2/v2.6/response/parser.mly"
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
# 662 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (S.defs))
  
  let _menhir_action_12 =
    fun l ->
      (
# 248 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( l )
# 670 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (S.t list))
  
  let _menhir_action_13 =
    fun args ret s ->
      (
# 208 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( I.(mk term s), [], args, ret )
# 678 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (I.t * T.t list * T.t list * T.t))
  
  let _menhir_action_14 =
    fun args body ret s ->
      (
# 212 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( I.(mk term s), [], args, ret, body )
# 686 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (I.t * T.t list * T.t list * T.t * T.t))
  
  let _menhir_action_15 =
    fun s ->
      (
# 91 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( fun ns -> I.mk ns s )
# 694 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (I.namespace -> I.t))
  
  let _menhir_action_16 =
    fun l s ->
      (
# 93 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( fun ns -> I.indexed ns s l )
# 702 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (I.namespace -> I.t))
  
  let _menhir_action_17 =
    fun s ->
      (
# 83 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( s )
# 710 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (string))
  
  let _menhir_action_18 =
    fun s ->
      (
# 83 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( s )
# 718 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (string))
  
  let _menhir_action_19 =
    fun s ->
      (
# 86 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( s )
# 726 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (string))
  
  let _menhir_action_20 =
    fun () ->
      (
# 253 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( None )
# 734 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (S.t option))
  
  let _menhir_action_21 =
    fun c ->
      (
# 255 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( Some c )
# 742 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (S.t option))
  
  let _menhir_action_22 =
    fun () ->
      (
# 216 "<standard.mly>"
    ( [] )
# 750 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (S.t list))
  
  let _menhir_action_23 =
    fun x xs ->
      (
# 219 "<standard.mly>"
    ( x :: xs )
# 758 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (S.t list))
  
  let _menhir_action_24 =
    fun () ->
      (
# 216 "<standard.mly>"
    ( [] )
# 766 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (S.defs list))
  
  let _menhir_action_25 =
    fun x xs ->
      (
# 219 "<standard.mly>"
    ( x :: xs )
# 774 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (S.defs list))
  
  let _menhir_action_26 =
    fun () ->
      (
# 216 "<standard.mly>"
    ( [] )
# 782 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t list))
  
  let _menhir_action_27 =
    fun x xs ->
      (
# 219 "<standard.mly>"
    ( x :: xs )
# 790 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t list))
  
  let _menhir_action_28 =
    fun () ->
      (
# 216 "<standard.mly>"
    ( [] )
# 798 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t list))
  
  let _menhir_action_29 =
    fun x xs ->
      (
# 219 "<standard.mly>"
    ( x :: xs )
# 806 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t list))
  
  let _menhir_action_30 =
    fun p t ->
      (
# 179 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( p, t )
# 814 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t * T.t))
  
  let _menhir_action_31 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 822 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t list))
  
  let _menhir_action_32 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 830 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t list))
  
  let _menhir_action_33 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 838 "src/languages/smtlib2/v2.6/response/parser.ml"
       : ((I.t * T.t list * T.t list * T.t) list))
  
  let _menhir_action_34 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 846 "src/languages/smtlib2/v2.6/response/parser.ml"
       : ((I.t * T.t list * T.t list * T.t) list))
  
  let _menhir_action_35 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 854 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (string list))
  
  let _menhir_action_36 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 862 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (string list))
  
  let _menhir_action_37 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 870 "src/languages/smtlib2/v2.6/response/parser.ml"
       : ((T.t * T.t) list))
  
  let _menhir_action_38 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 878 "src/languages/smtlib2/v2.6/response/parser.ml"
       : ((T.t * T.t) list))
  
  let _menhir_action_39 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 886 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t list))
  
  let _menhir_action_40 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 894 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t list))
  
  let _menhir_action_41 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 902 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t list))
  
  let _menhir_action_42 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 910 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t list))
  
  let _menhir_action_43 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 918 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t list))
  
  let _menhir_action_44 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 926 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t list))
  
  let _menhir_action_45 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 934 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t list))
  
  let _menhir_action_46 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 942 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t list))
  
  let _menhir_action_47 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 950 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t list))
  
  let _menhir_action_48 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 958 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t list))
  
  let _menhir_action_49 =
    fun () ->
      (
# 111 "<standard.mly>"
    ( None )
# 966 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (unit option))
  
  let _menhir_action_50 =
    fun x ->
      (
# 114 "<standard.mly>"
    ( Some x )
# 974 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (unit option))
  
  let _menhir_action_51 =
    fun () ->
      (
# 111 "<standard.mly>"
    ( None )
# 982 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t option))
  
  let _menhir_action_52 =
    fun x ->
      (
# 114 "<standard.mly>"
    ( Some x )
# 990 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t option))
  
  let _menhir_action_53 =
    fun c ->
      (
# 172 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( c )
# 998 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t))
  
  let _menhir_action_54 =
    fun _endpos__4_ _startpos__1_ args f ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 174 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.apply ~loc f args )
# 1008 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t))
  
  let _menhir_action_55 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 167 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.const ~loc I.(mk term s) )
# 1018 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t))
  
  let _menhir_action_56 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 137 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in `NoAs (T.const ~loc (s I.term)) )
# 1028 "src/languages/smtlib2/v2.6/response/parser.ml"
       : ([ `As of T.t * T.t * L.t | `NoAs of T.t ]))
  
  let _menhir_action_57 =
    fun _endpos__5_ _endpos_s_ _startpos__1_ _startpos_s_ s ty ->
      let _endpos = _endpos__5_ in
      let _startpos = _startpos__1_ in
      (
# 139 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( let loc = L.mk_pos _startpos_s_ _endpos_s_ in
      let as_loc = L.mk_pos _startpos _endpos in
      `As (T.const ~loc (s I.term), ty, as_loc) )
# 1040 "src/languages/smtlib2/v2.6/response/parser.ml"
       : ([ `As of T.t * T.t * L.t | `NoAs of T.t ]))
  
  let _menhir_action_58 =
    fun () ->
      (
# 52 "src/languages/smtlib2/v2.6/response/parser.mly"
               ( "_" )
# 1048 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (string))
  
  let _menhir_action_59 =
    fun () ->
      (
# 53 "src/languages/smtlib2/v2.6/response/parser.mly"
              ( "!" )
# 1056 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (string))
  
  let _menhir_action_60 =
    fun () ->
      (
# 54 "src/languages/smtlib2/v2.6/response/parser.mly"
       ( "as" )
# 1064 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (string))
  
  let _menhir_action_61 =
    fun () ->
      (
# 55 "src/languages/smtlib2/v2.6/response/parser.mly"
        ( "let" )
# 1072 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (string))
  
  let _menhir_action_62 =
    fun () ->
      (
# 56 "src/languages/smtlib2/v2.6/response/parser.mly"
           ( "exists" )
# 1080 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (string))
  
  let _menhir_action_63 =
    fun () ->
      (
# 57 "src/languages/smtlib2/v2.6/response/parser.mly"
           ( "forall" )
# 1088 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (string))
  
  let _menhir_action_64 =
    fun () ->
      (
# 58 "src/languages/smtlib2/v2.6/response/parser.mly"
          ( "match" )
# 1096 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (string))
  
  let _menhir_action_65 =
    fun () ->
      (
# 59 "src/languages/smtlib2/v2.6/response/parser.mly"
        ( "sat" )
# 1104 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (string))
  
  let _menhir_action_66 =
    fun () ->
      (
# 60 "src/languages/smtlib2/v2.6/response/parser.mly"
          ( "unsat" )
# 1112 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (string))
  
  let _menhir_action_67 =
    fun () ->
      (
# 61 "src/languages/smtlib2/v2.6/response/parser.mly"
          ( "model" )
# 1120 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (string))
  
  let _menhir_action_68 =
    fun () ->
      (
# 62 "src/languages/smtlib2/v2.6/response/parser.mly"
               ( "define-fun" )
# 1128 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (string))
  
  let _menhir_action_69 =
    fun () ->
      (
# 63 "src/languages/smtlib2/v2.6/response/parser.mly"
                   ( "define-fun-rec" )
# 1136 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (string))
  
  let _menhir_action_70 =
    fun () ->
      (
# 64 "src/languages/smtlib2/v2.6/response/parser.mly"
                    ( "define-funs-rec" )
# 1144 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (string))
  
  let _menhir_action_71 =
    fun c ->
      (
# 69 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( c )
# 1152 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t))
  
  let _menhir_action_72 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 71 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.const ~loc I.(mk term s) )
# 1162 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t))
  
  let _menhir_action_73 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 73 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.const ~loc I.(mk term s) )
# 1172 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t))
  
  let _menhir_action_74 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 75 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.const ~loc I.(mk term s) )
# 1182 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t))
  
  let _menhir_action_75 =
    fun _endpos__3_ _startpos__1_ l ->
      let _endpos = _endpos__3_ in
      let _startpos = _startpos__1_ in
      (
# 77 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.sexpr ~loc l )
# 1192 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t))
  
  let _menhir_action_76 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 98 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.const ~loc (s I.sort) )
# 1202 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t))
  
  let _menhir_action_77 =
    fun _endpos__4_ _endpos_f_ _startpos__1_ _startpos_f_ args f ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 100 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( let c =
        let loc = L.mk_pos _startpos_f_ _endpos_f_ in
        T.const ~loc (f I.sort)
      in
      let loc = L.mk_pos _startpos _endpos in T.apply ~loc c args )
# 1216 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t))
  
  let _menhir_action_78 =
    fun _endpos__4_ _endpos_s_ _startpos__1_ _startpos_s_ s ty ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 155 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( let c =
        let loc = L.mk_pos _startpos_s_ _endpos_s_ in
        T.const ~loc I.(mk term s)
      in
      let loc = L.mk_pos _startpos _endpos in T.colon ~loc c ty )
# 1230 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t))
  
  let _menhir_action_79 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 33 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.int ~loc s )
# 1240 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t))
  
  let _menhir_action_80 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 35 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.real ~loc s )
# 1250 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t))
  
  let _menhir_action_81 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 37 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.hexa ~loc s )
# 1260 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t))
  
  let _menhir_action_82 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 39 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.binary ~loc s )
# 1270 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t))
  
  let _menhir_action_83 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 41 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.str ~loc s )
# 1280 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t))
  
  let _menhir_action_84 =
    fun c ->
      (
# 184 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( c )
# 1288 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t))
  
  let _menhir_action_85 =
    fun s ->
      (
# 186 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( match s with
      | `NoAs f -> f
      | `As (f, ty, loc) -> T.colon ~loc f ty )
# 1298 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t))
  
  let _menhir_action_86 =
    fun _endpos__4_ _startpos__1_ args s ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 190 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      match s with
      | `NoAs f -> T.apply ~loc f args
      | `As (f, ty, as_loc) -> T.colon ~loc:as_loc (T.apply ~loc f args) ty )
# 1311 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t))
  
  let _menhir_action_87 =
    fun _endpos__7_ _startpos__1_ l t ->
      let _endpos = _endpos__7_ in
      let _startpos = _startpos__1_ in
      (
# 195 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.letand ~loc l t )
# 1321 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t))
  
  let _menhir_action_88 =
    fun _endpos__7_ _startpos__1_ l t ->
      let _endpos = _endpos__7_ in
      let _startpos = _startpos__1_ in
      (
# 197 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.forall ~loc l t )
# 1331 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t))
  
  let _menhir_action_89 =
    fun _endpos__7_ _startpos__1_ l t ->
      let _endpos = _endpos__7_ in
      let _startpos = _startpos__1_ in
      (
# 199 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.exists ~loc l t )
# 1341 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t))
  
  let _menhir_action_90 =
    fun _endpos__7_ _startpos__1_ l t ->
      let _endpos = _endpos__7_ in
      let _startpos = _startpos__1_ in
      (
# 201 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.match_ ~loc t l )
# 1351 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t))
  
  let _menhir_action_91 =
    fun _endpos__5_ _startpos__1_ args f ->
      let _endpos = _endpos__5_ in
      let _startpos = _startpos__1_ in
      (
# 203 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.annot ~loc f args )
# 1361 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t))
  
  let _menhir_action_92 =
    fun _endpos__4_ _endpos_s_ _startpos__1_ _startpos_s_ s t ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 146 "src/languages/smtlib2/v2.6/response/parser.mly"
    ( let c =
        let loc = L.mk_pos _startpos_s_ _endpos_s_ in
        T.const ~loc I.(mk term s)
      in
      let loc = L.mk_pos _startpos _endpos in T.colon ~loc c t )
# 1375 "src/languages/smtlib2/v2.6/response/parser.ml"
       : (T.t))
  
  let _menhir_print_token : token -> string =
    fun _tok ->
      match _tok with
      | Tokens.AS ->
          "AS"
      | Tokens.ATTRIBUTE ->
          "ATTRIBUTE"
      | Tokens.BIN _ ->
          "BIN"
      | Tokens.CLOSE ->
          "CLOSE"
      | Tokens.DEC _ ->
          "DEC"
      | Tokens.DEFINE_FUN ->
          "DEFINE_FUN"
      | Tokens.DEFINE_FUNS_REC ->
          "DEFINE_FUNS_REC"
      | Tokens.DEFINE_FUN_REC ->
          "DEFINE_FUN_REC"
      | Tokens.EOF ->
          "EOF"
      | Tokens.EXISTS ->
          "EXISTS"
      | Tokens.FORALL ->
          "FORALL"
      | Tokens.HEX _ ->
          "HEX"
      | Tokens.KEYWORD _ ->
          "KEYWORD"
      | Tokens.LET ->
          "LET"
      | Tokens.MATCH ->
          "MATCH"
      | Tokens.MODEL ->
          "MODEL"
      | Tokens.NUM _ ->
          "NUM"
      | Tokens.OPEN ->
          "OPEN"
      | Tokens.SAT ->
          "SAT"
      | Tokens.STR _ ->
          "STR"
      | Tokens.SYMBOL _ ->
          "SYMBOL"
      | Tokens.UNDERSCORE ->
          "UNDERSCORE"
      | Tokens.UNSAT ->
          "UNSAT"
  
  let _menhir_fail : unit -> 'a =
    fun () ->
      Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
      assert false
  
  include struct
    
    [@@@ocaml.warning "-4-37"]
    
    let _menhir_goto_input : type  ttv_stack. ttv_stack -> _ -> _menhir_box_input =
      fun _menhir_stack _v ->
        MenhirBox_input _v
    
    let _menhir_run_179 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_input =
      fun _menhir_stack _v ->
        let c = _v in
        let _v = _menhir_action_21 c in
        _menhir_goto_input _menhir_stack _v
    
    let _menhir_run_227 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_term =
      fun _menhir_stack _v ->
        MenhirBox_term _v
    
    let _menhir_run_165 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_file =
      fun _menhir_stack _v ->
        let l = _v in
        let _v = _menhir_action_12 l in
        MenhirBox_file _v
    
    let rec _menhir_run_169 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_answer -> _ -> _menhir_box_file =
      fun _menhir_stack _v ->
        let MenhirCell1_answer (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_23 x xs in
        _menhir_goto_list_answer_ _menhir_stack _v _menhir_s
    
    and _menhir_goto_list_answer_ : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _v _menhir_s ->
        match _menhir_s with
        | MenhirState168 ->
            _menhir_run_169 _menhir_stack _v
        | MenhirState000 ->
            _menhir_run_165 _menhir_stack _v
        | _ ->
            _menhir_fail ()
    
    let rec _menhir_run_001 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_03 _endpos__1_ _startpos__1_ in
        _menhir_goto_answer _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_answer : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState170 ->
            _menhir_run_179 _menhir_stack _v
        | MenhirState168 ->
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState000 ->
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_168 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_answer (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.UNSAT ->
            _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState168
        | Tokens.SAT ->
            _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState168
        | Tokens.EOF ->
            let _v_0 = _menhir_action_22 () in
            _menhir_run_169 _menhir_stack _v_0
        | _ ->
            _eRR 168
    
    and _menhir_run_002 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell1_SAT (_menhir_stack, _menhir_s, _startpos, _endpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            let _startpos_0 = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos_0) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.MODEL ->
                _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState003
            | Tokens.CLOSE | Tokens.OPEN ->
                let _v = _menhir_action_49 () in
                _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState003 _tok
            | _ ->
                _eRR 3)
        | _ ->
            _eRR 2
    
    and _menhir_run_004 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_SAT _menhir_cell0_OPEN as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        let x = () in
        let _v = _menhir_action_50 x in
        _menhir_goto_option_MODEL_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_option_MODEL_ : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_SAT _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState173 ->
            _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState003 ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_174 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_SAT _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_option_MODEL_ (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState174
        | Tokens.CLOSE ->
            let _v_0 = _menhir_action_24 () in
            _menhir_run_175 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
        | _ ->
            _eRR 174
    
    and _menhir_run_006 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.DEFINE_FUN_REC ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell0_DEFINE_FUN_REC (_menhir_stack, _startpos, _endpos) in
            let _menhir_s = MenhirState007 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SYMBOL _v ->
                _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 7)
        | Tokens.DEFINE_FUNS_REC ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell0_DEFINE_FUNS_REC (_menhir_stack, _startpos, _endpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
                let _menhir_s = MenhirState142 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.OPEN ->
                    _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | _ ->
                    _eRR 142)
            | _ ->
                _eRR 141)
        | Tokens.DEFINE_FUN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell0_DEFINE_FUN (_menhir_stack, _startpos, _endpos) in
            let _menhir_s = MenhirState158 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SYMBOL _v ->
                _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 158)
        | _ ->
            _eRR 6
    
    and _menhir_run_008 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
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
                _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState009
            | Tokens.CLOSE ->
                let _v_1 = _menhir_action_28 () in
                _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState009
            | _ ->
                _eRR 9)
        | _ ->
            _eRR 8
    
    and _menhir_run_010 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell0_SYMBOL (_menhir_stack, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState011 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SYMBOL _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.OPEN ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 11)
        | _ ->
            _eRR 10
    
    and _menhir_run_012 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_15 s in
        _menhir_goto_identifier _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_s_ _startpos_s_ _v _menhir_s _tok
    
    and _menhir_goto_identifier : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState180 ->
            _menhir_run_230 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState216 ->
            _menhir_run_217 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState183 ->
            _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState220 ->
            _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState212 ->
            _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState209 ->
            _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState203 ->
            _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState197 ->
            _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState188 ->
            _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState152 ->
            _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState036 ->
            _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState038 ->
            _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState133 ->
            _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState134 ->
            _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState097 ->
            _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState094 ->
            _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState088 ->
            _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState080 ->
            _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState074 ->
            _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState044 ->
            _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState060 ->
            _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState040 ->
            _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState217 ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState147 ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState035 ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState041 ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState011 ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState024 ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState025 ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState013 ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_230 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_term) _menhir_state -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_56 _endpos_s_ _startpos_s_ s in
        _menhir_goto_qual_identifier _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_qual_identifier : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState180 ->
            _menhir_run_229 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState183 ->
            _menhir_run_220 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState038 ->
            _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState220 ->
            _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState212 ->
            _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState209 ->
            _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState203 ->
            _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState197 ->
            _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState188 ->
            _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState152 ->
            _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState036 ->
            _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState133 ->
            _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState134 ->
            _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState097 ->
            _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState094 ->
            _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState088 ->
            _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState080 ->
            _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState074 ->
            _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState044 ->
            _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState060 ->
            _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_229 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_term) _menhir_state -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let s = _v in
        let _v = _menhir_action_85 s in
        _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_term : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState180 ->
            _menhir_run_227 _menhir_stack _v
        | MenhirState212 ->
            _menhir_run_213 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState209 ->
            _menhir_run_210 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState203 ->
            _menhir_run_204 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState197 ->
            _menhir_run_198 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState188 ->
            _menhir_run_189 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState036 ->
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState220 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState152 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState134 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState133 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState097 ->
            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState094 ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState088 ->
            _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState080 ->
            _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState074 ->
            _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState060 ->
            _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState044 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_213 : type  ttv_stack. (((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_ATTRIBUTE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_term) _menhir_state -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.KEYWORD _v_0 ->
            _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState213
        | _ ->
            _eRR 213
    
    and _menhir_run_099 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
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
            let _v = _menhir_action_07 _endpos_v_ _startpos_v_ v in
            _menhir_goto_attribute_value _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_v_ _v _tok
        | Tokens.STR _v_4 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState099
        | Tokens.OPEN ->
            let _startpos_5 = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, MenhirState099, _startpos_5) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UNSAT ->
                _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
            | Tokens.UNDERSCORE ->
                _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
            | Tokens.SYMBOL _v_6 ->
                _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _v_6 MenhirState101
            | Tokens.STR _v_7 ->
                _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v_7 MenhirState101
            | Tokens.SAT ->
                _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
            | Tokens.OPEN ->
                _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
            | Tokens.NUM _v_8 ->
                _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _v_8 MenhirState101
            | Tokens.MODEL ->
                _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
            | Tokens.MATCH ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
            | Tokens.LET ->
                _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
            | Tokens.KEYWORD _v_9 ->
                _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _v_9 MenhirState101
            | Tokens.HEX _v_10 ->
                _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v_10 MenhirState101
            | Tokens.FORALL ->
                _menhir_run_111 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
            | Tokens.EXISTS ->
                _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
            | Tokens.DEFINE_FUN_REC ->
                _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
            | Tokens.DEFINE_FUNS_REC ->
                _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
            | Tokens.DEFINE_FUN ->
                _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
            | Tokens.DEC _v_11 ->
                _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v_11 MenhirState101
            | Tokens.BIN _v_12 ->
                _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v_12 MenhirState101
            | Tokens.ATTRIBUTE ->
                _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
            | Tokens.AS ->
                _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState101
            | Tokens.CLOSE ->
                let _v_13 = _menhir_action_26 () in
                _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v_13
            | _ ->
                _eRR 101)
        | Tokens.NUM _v_14 ->
            _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _v_14 MenhirState099
        | Tokens.HEX _v_15 ->
            _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v_15 MenhirState099
        | Tokens.DEC _v_16 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v_16 MenhirState099
        | Tokens.BIN _v_17 ->
            _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v_17 MenhirState099
        | Tokens.CLOSE | Tokens.KEYWORD _ ->
            let _v = _menhir_action_51 () in
            _menhir_goto_option_attribute_value_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | _ ->
            _eRR 99
    
    and _menhir_goto_attribute_value : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_KEYWORD -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let (_endpos_x_, x) = (_endpos, _v) in
        let _v = _menhir_action_52 x in
        _menhir_goto_option_attribute_value_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _v _tok
    
    and _menhir_goto_option_attribute_value_ : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_KEYWORD -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_KEYWORD (_menhir_stack, _menhir_s, s, _startpos_s_, _endpos_s_) = _menhir_stack in
        let (_endpos_a_, a) = (_endpos, _v) in
        let _v = _menhir_action_05 _endpos_a_ _endpos_s_ _startpos_s_ a s in
        match (_tok : MenhirBasics.token) with
        | Tokens.KEYWORD _v_0 ->
            let _menhir_stack = MenhirCell1_attribute (_menhir_stack, _menhir_s, _v) in
            _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState131
        | Tokens.CLOSE ->
            let x = _v in
            let _v = _menhir_action_31 x in
            _menhir_goto_nonempty_list_attribute_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 131
    
    and _menhir_goto_nonempty_list_attribute_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState213 ->
            _menhir_run_214 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState131 ->
            _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState098 ->
            _menhir_run_129 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_214 : type  ttv_stack. (((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_ATTRIBUTE, _menhir_box_term) _menhir_cell1_term -> _ -> _ -> _ -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let MenhirCell1_term (_menhir_stack, _, f) = _menhir_stack in
        let MenhirCell1_ATTRIBUTE (_menhir_stack, _, _, _) = _menhir_stack in
        let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (args, _endpos__5_) = (_v, _endpos) in
        let _v = _menhir_action_91 _endpos__5_ _startpos__1_ args f in
        _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_132 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_attribute -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let MenhirCell1_attribute (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_32 x xs in
        _menhir_goto_nonempty_list_attribute_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_129 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_ATTRIBUTE, ttv_result) _menhir_cell1_term -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell1_term (_menhir_stack, _, f) = _menhir_stack in
        let MenhirCell1_ATTRIBUTE (_menhir_stack, _, _, _) = _menhir_stack in
        let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (args, _endpos__5_) = (_v, _endpos) in
        let _v = _menhir_action_91 _endpos__5_ _startpos__1_ args f in
        _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_037 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_83 _endpos_s_ _startpos_s_ s in
        _menhir_goto_spec_constant _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_s_ _v _menhir_s _tok
    
    and _menhir_goto_spec_constant : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState180 ->
            _menhir_run_228 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState099 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState101 ->
            _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState119 ->
            _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState106 ->
            _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState220 ->
            _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState212 ->
            _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState209 ->
            _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState203 ->
            _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState197 ->
            _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState188 ->
            _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState152 ->
            _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState036 ->
            _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState133 ->
            _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState134 ->
            _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState097 ->
            _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState094 ->
            _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState088 ->
            _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState080 ->
            _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState074 ->
            _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState044 ->
            _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState060 ->
            _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_228 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_term) _menhir_state -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let c = _v in
        let _v = _menhir_action_84 c in
        _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_126 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_KEYWORD -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let (_endpos_v_, v) = (_endpos, _v) in
        let _v = _menhir_action_06 v in
        _menhir_goto_attribute_value _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_v_ _v _tok
    
    and _menhir_run_118 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let c = _v in
        let _v = _menhir_action_71 c in
        _menhir_goto_s_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_s_expr : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_s_expr (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.UNSAT ->
            _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState119
        | Tokens.UNDERSCORE ->
            _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState119
        | Tokens.SYMBOL _v_0 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState119
        | Tokens.STR _v_1 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState119
        | Tokens.SAT ->
            _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState119
        | Tokens.OPEN ->
            _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState119
        | Tokens.NUM _v_2 ->
            _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState119
        | Tokens.MODEL ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState119
        | Tokens.MATCH ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState119
        | Tokens.LET ->
            _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState119
        | Tokens.KEYWORD _v_3 ->
            _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState119
        | Tokens.HEX _v_4 ->
            _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState119
        | Tokens.FORALL ->
            _menhir_run_111 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState119
        | Tokens.EXISTS ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState119
        | Tokens.DEFINE_FUN_REC ->
            _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState119
        | Tokens.DEFINE_FUNS_REC ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState119
        | Tokens.DEFINE_FUN ->
            _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState119
        | Tokens.DEC _v_5 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState119
        | Tokens.BIN _v_6 ->
            _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v_6 MenhirState119
        | Tokens.ATTRIBUTE ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState119
        | Tokens.AS ->
            _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState119
        | Tokens.CLOSE ->
            let _v_7 = _menhir_action_26 () in
            _menhir_run_121 _menhir_stack _menhir_lexbuf _menhir_lexer _v_7
        | _ ->
            _eRR 119
    
    and _menhir_run_102 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_66 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_goto_reserved : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_73 _endpos_s_ _startpos_s_ s in
        _menhir_goto_s_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_103 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_58 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_104 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_72 _endpos_s_ _startpos_s_ s in
        _menhir_goto_s_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_105 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_65 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_106 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UNSAT ->
            _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
        | Tokens.UNDERSCORE ->
            _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
        | Tokens.SYMBOL _v ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState106
        | Tokens.STR _v ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState106
        | Tokens.SAT ->
            _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
        | Tokens.OPEN ->
            _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
        | Tokens.NUM _v ->
            _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState106
        | Tokens.MODEL ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
        | Tokens.MATCH ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
        | Tokens.LET ->
            _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
        | Tokens.KEYWORD _v ->
            _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState106
        | Tokens.HEX _v ->
            _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState106
        | Tokens.FORALL ->
            _menhir_run_111 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
        | Tokens.EXISTS ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
        | Tokens.DEFINE_FUN_REC ->
            _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
        | Tokens.DEFINE_FUNS_REC ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
        | Tokens.DEFINE_FUN ->
            _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
        | Tokens.DEC _v ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState106
        | Tokens.BIN _v ->
            _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState106
        | Tokens.ATTRIBUTE ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
        | Tokens.AS ->
            _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState106
        | Tokens.CLOSE ->
            let _v = _menhir_action_26 () in
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _eRR 106
    
    and _menhir_run_045 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_79 _endpos_s_ _startpos_s_ s in
        _menhir_goto_spec_constant _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_s_ _v _menhir_s _tok
    
    and _menhir_run_107 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_67 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_108 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_64 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_109 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_61 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_110 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_74 _endpos_s_ _startpos_s_ s in
        _menhir_goto_s_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_046 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_81 _endpos_s_ _startpos_s_ s in
        _menhir_goto_spec_constant _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_s_ _v _menhir_s _tok
    
    and _menhir_run_111 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_63 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_112 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_62 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_113 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_69 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_114 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_70 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_115 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_68 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_047 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_80 _endpos_s_ _startpos_s_ s in
        _menhir_goto_spec_constant _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_s_ _v _menhir_s _tok
    
    and _menhir_run_048 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_82 _endpos_s_ _startpos_s_ s in
        _menhir_goto_spec_constant _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_s_ _v _menhir_s _tok
    
    and _menhir_run_116 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_59 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_117 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_60 () in
        _menhir_goto_reserved _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_122 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_OPEN -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (l, _endpos__3_) = (_v, _endpos) in
        let _v = _menhir_action_75 _endpos__3_ _startpos__1_ l in
        _menhir_goto_s_expr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_121 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_s_expr -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_s_expr (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_27 x xs in
        _menhir_goto_list_s_expr_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_goto_list_s_expr_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState101 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState106 ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState119 ->
            _menhir_run_121 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_124 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_KEYWORD, ttv_result) _menhir_cell1_OPEN -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell1_OPEN (_menhir_stack, _, _startpos__1_) = _menhir_stack in
        let (l, _endpos__3_) = (_v, _endpos) in
        let _v = _menhir_action_08 _endpos__3_ _startpos__1_ l in
        _menhir_goto_attribute_value _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _v _tok
    
    and _menhir_run_063 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let c = _v in
        let _v = _menhir_action_84 c in
        _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_210 : type  ttv_stack. (((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_EXISTS _menhir_cell0_OPEN, _menhir_box_term) _menhir_cell1_nonempty_list_sorted_var_ _menhir_cell0_CLOSE -> _ -> _ -> _ -> _ -> _menhir_box_term =
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
            let _v = _menhir_action_89 _endpos__7_ _startpos__1_ l t in
            _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 210
    
    and _menhir_run_204 : type  ttv_stack. (((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_FORALL _menhir_cell0_OPEN, _menhir_box_term) _menhir_cell1_nonempty_list_sorted_var_ _menhir_cell0_CLOSE -> _ -> _ -> _ -> _ -> _menhir_box_term =
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
            let _v = _menhir_action_88 _endpos__7_ _startpos__1_ l t in
            _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 204
    
    and _menhir_run_198 : type  ttv_stack. (((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_LET _menhir_cell0_OPEN, _menhir_box_term) _menhir_cell1_nonempty_list_var_binding_ _menhir_cell0_CLOSE -> _ -> _ -> _ -> _ -> _menhir_box_term =
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
            let _v = _menhir_action_87 _endpos__7_ _startpos__1_ l t in
            _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 198
    
    and _menhir_run_189 : type  ttv_stack. (((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_MATCH as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_term) _menhir_state -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState190 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 190)
        | _ ->
            _eRR 189
    
    and _menhir_run_051 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState051 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
            let _menhir_s = MenhirState053 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SYMBOL _v ->
                _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 53)
        | _ ->
            _eRR 51
    
    and _menhir_run_052 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_55 _endpos_s_ _startpos_s_ s in
        _menhir_goto_pattern_symbol _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_pattern_symbol : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState051 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState055 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState054 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState053 ->
            _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_059 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let c = _v in
        let _v = _menhir_action_53 c in
        _menhir_goto_pattern _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_pattern : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_pattern (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState060
        | Tokens.STR _v_1 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState060
        | Tokens.OPEN ->
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
        | Tokens.NUM _v_2 ->
            _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState060
        | Tokens.HEX _v_3 ->
            _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState060
        | Tokens.DEC _v_4 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState060
        | Tokens.BIN _v_5 ->
            _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState060
        | _ ->
            _eRR 60
    
    and _menhir_run_038 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState038 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UNDERSCORE ->
            _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.SYMBOL _v ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell1_MATCH (_menhir_stack, _menhir_s, _startpos, _endpos) in
            let _menhir_s = MenhirState044 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SYMBOL _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.STR _v ->
                _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.OPEN ->
                _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NUM _v ->
                _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.HEX _v ->
                _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DEC _v ->
                _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.BIN _v ->
                _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 44)
        | Tokens.LET ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell1_LET (_menhir_stack, _menhir_s, _startpos, _endpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
                let _menhir_s = MenhirState072 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.OPEN ->
                    _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | _ ->
                    _eRR 72)
            | _ ->
                _eRR 71)
        | Tokens.FORALL ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell1_FORALL (_menhir_stack, _menhir_s, _startpos, _endpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
                let _menhir_s = MenhirState084 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.OPEN ->
                    _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | _ ->
                    _eRR 84)
            | _ ->
                _eRR 83)
        | Tokens.EXISTS ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell1_EXISTS (_menhir_stack, _menhir_s, _startpos, _endpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
                let _menhir_s = MenhirState092 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.OPEN ->
                    _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | _ ->
                    _eRR 92)
            | _ ->
                _eRR 91)
        | Tokens.ATTRIBUTE ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell1_ATTRIBUTE (_menhir_stack, _menhir_s, _startpos, _endpos) in
            let _menhir_s = MenhirState097 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SYMBOL _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.STR _v ->
                _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.OPEN ->
                _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NUM _v ->
                _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.HEX _v ->
                _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DEC _v ->
                _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.BIN _v ->
                _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 97)
        | Tokens.AS ->
            _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 38
    
    and _menhir_run_014 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
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
            let _menhir_s = MenhirState015 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SYMBOL _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NUM _v ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.HEX _v ->
                _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 15)
        | _ ->
            _eRR 14
    
    and _menhir_run_016 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        let s = _v in
        let _v = _menhir_action_18 s in
        _menhir_goto_index _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_index : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            let _menhir_stack = MenhirCell1_index (_menhir_stack, _menhir_s, _v) in
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState021
        | Tokens.NUM _v_1 ->
            let _menhir_stack = MenhirCell1_index (_menhir_stack, _menhir_s, _v) in
            _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState021
        | Tokens.HEX _v_2 ->
            let _menhir_stack = MenhirCell1_index (_menhir_stack, _menhir_s, _v) in
            _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState021
        | Tokens.CLOSE ->
            let x = _v in
            let _v = _menhir_action_35 x in
            _menhir_goto_nonempty_list_index_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 21
    
    and _menhir_run_017 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        let s = _v in
        let _v = _menhir_action_17 s in
        _menhir_goto_index _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_018 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        let s = _v in
        let _v = _menhir_action_19 s in
        _menhir_goto_index _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_nonempty_list_index_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState185 ->
            _menhir_run_186 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState021 ->
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState015 ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_186 : type  ttv_stack. ((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_UNDERSCORE _menhir_cell0_SYMBOL -> _ -> _ -> _ -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let MenhirCell0_SYMBOL (_menhir_stack, s, _, _) = _menhir_stack in
        let MenhirCell1_UNDERSCORE (_menhir_stack, _, _, _) = _menhir_stack in
        let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (l, _endpos__5_) = (_v, _endpos) in
        let _v = _menhir_action_16 l s in
        _menhir_goto_identifier _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__5_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_022 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_index -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let MenhirCell1_index (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_36 x xs in
        _menhir_goto_nonempty_list_index_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_019 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_UNDERSCORE _menhir_cell0_SYMBOL -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell0_SYMBOL (_menhir_stack, s, _, _) = _menhir_stack in
        let MenhirCell1_UNDERSCORE (_menhir_stack, _, _, _) = _menhir_stack in
        let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (l, _endpos__5_) = (_v, _endpos) in
        let _v = _menhir_action_16 l s in
        _menhir_goto_identifier _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__5_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_039 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState039 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UNDERSCORE ->
            _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.AS ->
            _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 39
    
    and _menhir_run_040 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell1_AS (_menhir_stack, _menhir_s, _startpos, _endpos) in
        let _menhir_s = MenhirState040 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 40
    
    and _menhir_run_023 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState023 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UNDERSCORE ->
            _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 23
    
    and _menhir_run_073 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell0_SYMBOL (_menhir_stack, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState074 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SYMBOL _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.STR _v ->
                _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.OPEN ->
                _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NUM _v ->
                _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.HEX _v ->
                _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DEC _v ->
                _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.BIN _v ->
                _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 74)
        | _ ->
            _eRR 73
    
    and _menhir_run_055 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_pattern_symbol as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            let _menhir_stack = MenhirCell1_pattern_symbol (_menhir_stack, _menhir_s, _v) in
            _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState055
        | Tokens.CLOSE ->
            let x = _v in
            let _v = _menhir_action_39 x in
            _menhir_goto_nonempty_list_pattern_symbol_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 55
    
    and _menhir_goto_nonempty_list_pattern_symbol_ : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_pattern_symbol as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState054 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState055 ->
            _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_057 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_pattern_symbol -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell1_pattern_symbol (_menhir_stack, _, f) = _menhir_stack in
        let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos__4_, args) = (_endpos, _v) in
        let _v = _menhir_action_54 _endpos__4_ _startpos__1_ args f in
        _menhir_goto_pattern _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_056 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_pattern_symbol, ttv_result) _menhir_cell1_pattern_symbol -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_pattern_symbol (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_40 x xs in
        _menhir_goto_nonempty_list_pattern_symbol_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_054 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_pattern_symbol (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState054
        | _ ->
            _eRR 54
    
    and _menhir_run_138 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_SYMBOL _menhir_cell0_OPEN, ttv_result) _menhir_cell1_list_sorted_var_ _menhir_cell0_CLOSE, ttv_result) _menhir_cell1_sort -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let MenhirCell1_sort (_menhir_stack, _, ret) = _menhir_stack in
        let MenhirCell0_CLOSE (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_list_sorted_var_ (_menhir_stack, _, args) = _menhir_stack in
        let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_SYMBOL (_menhir_stack, _menhir_s, s, _, _) = _menhir_stack in
        let body = _v in
        let _v = _menhir_action_14 args body ret s in
        _menhir_goto_function_def _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_function_def : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState158 ->
            _menhir_run_159 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState007 ->
            _menhir_run_139 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_159 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_OPEN _menhir_cell0_DEFINE_FUN -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_DEFINE_FUN (_menhir_stack, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__4_, f) = (_endpos, _v) in
            let _v = _menhir_action_09 _endpos__4_ _startpos__1_ f in
            _menhir_goto_definition _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 159
    
    and _menhir_goto_definition : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_definition (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState163
        | Tokens.CLOSE ->
            let _v_0 = _menhir_action_24 () in
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
        | _ ->
            _eRR 163
    
    and _menhir_run_164 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_definition -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let MenhirCell1_definition (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_25 x xs in
        _menhir_goto_list_definition_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_list_definition_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState174 ->
            _menhir_run_175 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState163 ->
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState005 ->
            _menhir_run_161 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_175 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_SAT _menhir_cell0_OPEN, _menhir_box_input) _menhir_cell1_option_MODEL_ -> _ -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let MenhirCell1_option_MODEL_ (_menhir_stack, _, _) = _menhir_stack in
        let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_SAT (_menhir_stack, _menhir_s, _startpos__1_, _) = _menhir_stack in
        let (_endpos__5_, model) = (_endpos, _v) in
        let _v = _menhir_action_04 _endpos__5_ _startpos__1_ model in
        _menhir_goto_answer _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_161 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_SAT _menhir_cell0_OPEN, _menhir_box_file) _menhir_cell1_option_MODEL_ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell1_option_MODEL_ (_menhir_stack, _, _) = _menhir_stack in
        let MenhirCell0_OPEN (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_SAT (_menhir_stack, _menhir_s, _startpos__1_, _) = _menhir_stack in
        let (_endpos__5_, model) = (_endpos, _v) in
        let _v = _menhir_action_04 _endpos__5_ _startpos__1_ model in
        _menhir_goto_answer _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_139 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_OPEN _menhir_cell0_DEFINE_FUN_REC -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_DEFINE_FUN_REC (_menhir_stack, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__4_, f) = (_endpos, _v) in
            let _v = _menhir_action_10 _endpos__4_ _startpos__1_ f in
            _menhir_goto_definition _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 139
    
    and _menhir_run_134 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState134
        | Tokens.STR _v_1 ->
            let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState134
        | Tokens.OPEN ->
            let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
        | Tokens.NUM _v_2 ->
            let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
            _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState134
        | Tokens.HEX _v_3 ->
            let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
            _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState134
        | Tokens.DEC _v_4 ->
            let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState134
        | Tokens.BIN _v_5 ->
            let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
            _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState134
        | Tokens.CLOSE ->
            let x = _v in
            let _v = _menhir_action_45 x in
            _menhir_goto_nonempty_list_term_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 134
    
    and _menhir_goto_nonempty_list_term_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState220 ->
            _menhir_run_221 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState152 ->
            _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState133 ->
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState134 ->
            _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_221 : type  ttv_stack. ((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_qual_identifier -> _ -> _ -> _ -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let MenhirCell1_qual_identifier (_menhir_stack, _, s) = _menhir_stack in
        let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos__4_, args) = (_endpos, _v) in
        let _v = _menhir_action_86 _endpos__4_ _startpos__1_ args s in
        _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_153 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN _menhir_cell0_DEFINE_FUNS_REC _menhir_cell0_OPEN, ttv_result) _menhir_cell1_nonempty_list_function_dec_ _menhir_cell0_CLOSE _menhir_cell0_OPEN -> _ -> _ -> _ -> ttv_result =
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
            let MenhirCell0_DEFINE_FUNS_REC (_menhir_stack, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__9_, _endpos__8_, l2) = (_endpos_0, _endpos, _v) in
            let _v = _menhir_action_11 _endpos__8_ _endpos__9_ _startpos__1_ _startpos__3_ l1 l2 in
            _menhir_goto_definition _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 154
    
    and _menhir_run_136 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_qual_identifier -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell1_qual_identifier (_menhir_stack, _, s) = _menhir_stack in
        let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos__4_, args) = (_endpos, _v) in
        let _v = _menhir_action_86 _endpos__4_ _startpos__1_ args s in
        _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_135 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_term -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let MenhirCell1_term (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_46 x xs in
        _menhir_goto_nonempty_list_term_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_098 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_ATTRIBUTE as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.KEYWORD _v_0 ->
            _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState098
        | _ ->
            _eRR 98
    
    and _menhir_run_095 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_EXISTS _menhir_cell0_OPEN, ttv_result) _menhir_cell1_nonempty_list_sorted_var_ _menhir_cell0_CLOSE -> _ -> _ -> _ -> _ -> ttv_result =
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
            let _v = _menhir_action_89 _endpos__7_ _startpos__1_ l t in
            _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 95
    
    and _menhir_run_089 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_FORALL _menhir_cell0_OPEN, ttv_result) _menhir_cell1_nonempty_list_sorted_var_ _menhir_cell0_CLOSE -> _ -> _ -> _ -> _ -> ttv_result =
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
            let _v = _menhir_action_88 _endpos__7_ _startpos__1_ l t in
            _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 89
    
    and _menhir_run_081 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_LET _menhir_cell0_OPEN, ttv_result) _menhir_cell1_nonempty_list_var_binding_ _menhir_cell0_CLOSE -> _ -> _ -> _ -> _ -> ttv_result =
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
            let _v = _menhir_action_87 _endpos__7_ _startpos__1_ l t in
            _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 81
    
    and _menhir_run_075 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_OPEN _menhir_cell0_SYMBOL -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_SYMBOL (_menhir_stack, s, _startpos_s_, _endpos_s_) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__4_, t) = (_endpos, _v) in
            let _v = _menhir_action_92 _endpos__4_ _endpos_s_ _startpos__1_ _startpos_s_ s t in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                let _menhir_stack = MenhirCell1_var_binding (_menhir_stack, _menhir_s, _v) in
                _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState077
            | Tokens.CLOSE ->
                let x = _v in
                let _v = _menhir_action_47 x in
                _menhir_goto_nonempty_list_var_binding_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 77)
        | _ ->
            _eRR 75
    
    and _menhir_goto_nonempty_list_var_binding_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState195 ->
            _menhir_run_196 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState072 ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState077 ->
            _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_196 : type  ttv_stack. (((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_LET _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_term) _menhir_state -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_nonempty_list_var_binding_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState197 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.STR _v ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.NUM _v ->
            _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEX _v ->
            _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DEC _v ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.BIN _v ->
            _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 197
    
    and _menhir_run_079 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_LET _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_nonempty_list_var_binding_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState080 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.STR _v ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.NUM _v ->
            _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEX _v ->
            _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DEC _v ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.BIN _v ->
            _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 80
    
    and _menhir_run_078 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_var_binding -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_var_binding (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_48 x xs in
        _menhir_goto_nonempty_list_var_binding_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_061 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_pattern -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_pattern (_menhir_stack, _, p) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _) = _menhir_stack in
            let t = _v in
            let _v = _menhir_action_30 p t in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                let _menhir_stack = MenhirCell1_match_case (_menhir_stack, _menhir_s, _v) in
                _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
            | Tokens.CLOSE ->
                let x = _v in
                let _v = _menhir_action_37 x in
                _menhir_goto_nonempty_list_match_case_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 69)
        | _ ->
            _eRR 61
    
    and _menhir_goto_nonempty_list_match_case_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState190 ->
            _menhir_run_191 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState069 ->
            _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState050 ->
            _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_191 : type  ttv_stack. (((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_MATCH, _menhir_box_term) _menhir_cell1_term _menhir_cell0_OPEN -> _ -> _ -> _ -> _menhir_box_term =
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
            let _v = _menhir_action_90 _endpos__7_ _startpos__1_ l t in
            _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 192
    
    and _menhir_run_070 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_match_case -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_match_case (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_38 x xs in
        _menhir_goto_nonempty_list_match_case_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_066 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_MATCH, ttv_result) _menhir_cell1_term _menhir_cell0_OPEN -> _ -> _ -> _ -> ttv_result =
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
            let _v = _menhir_action_90 _endpos__7_ _startpos__1_ l t in
            _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 67
    
    and _menhir_run_049 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_MATCH as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState050 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 50)
        | _ ->
            _eRR 49
    
    and _menhir_run_220 : type  ttv_stack. ((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_term) _menhir_state -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_qual_identifier (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState220
        | Tokens.STR _v_1 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState220
        | Tokens.OPEN ->
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState220
        | Tokens.NUM _v_2 ->
            _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState220
        | Tokens.HEX _v_3 ->
            _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState220
        | Tokens.DEC _v_4 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState220
        | Tokens.BIN _v_5 ->
            _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState220
        | _ ->
            _eRR 220
    
    and _menhir_run_133 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_qual_identifier (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState133
        | Tokens.STR _v_1 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState133
        | Tokens.OPEN ->
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
        | Tokens.NUM _v_2 ->
            _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState133
        | Tokens.HEX _v_3 ->
            _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState133
        | Tokens.DEC _v_4 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState133
        | Tokens.BIN _v_5 ->
            _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState133
        | _ ->
            _eRR 133
    
    and _menhir_run_064 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let s = _v in
        let _v = _menhir_action_85 s in
        _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_217 : type  ttv_stack. (((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_AS as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_term) _menhir_state -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_identifier (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState217
        | Tokens.OPEN ->
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState217
        | _ ->
            _eRR 217
    
    and _menhir_run_013 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState013 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UNDERSCORE ->
            _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.SYMBOL _v ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 13
    
    and _menhir_run_065 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_56 _endpos_s_ _startpos_s_ s in
        _menhir_goto_qual_identifier _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_041 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_AS as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_identifier (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState041
        | Tokens.OPEN ->
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState041
        | _ ->
            _eRR 41
    
    and _menhir_run_027 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_76 _endpos_s_ _startpos_s_ s in
        _menhir_goto_sort _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_sort : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState217 ->
            _menhir_run_218 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState147 ->
            _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState041 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState035 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState011 ->
            _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState025 ->
            _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState024 ->
            _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_218 : type  ttv_stack. (((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_AS, _menhir_box_term) _menhir_cell1_identifier -> _ -> _ -> _ -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let MenhirCell1_identifier (_menhir_stack, _, s, _startpos_s_, _endpos_s_) = _menhir_stack in
            let MenhirCell1_AS (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__5_, ty) = (_endpos, _v) in
            let _v = _menhir_action_57 _endpos__5_ _endpos_s_ _startpos__1_ _startpos_s_ s ty in
            _menhir_goto_qual_identifier _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 218
    
    and _menhir_run_148 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN _menhir_cell0_SYMBOL _menhir_cell0_OPEN, ttv_result) _menhir_cell1_list_sorted_var_ _menhir_cell0_CLOSE -> _ -> _ -> _ -> _ -> ttv_result =
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
            let _v = _menhir_action_13 args ret s in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                let _menhir_stack = MenhirCell1_function_dec (_menhir_stack, _menhir_s, _v) in
                _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState156
            | Tokens.CLOSE ->
                let x = _v in
                let _v = _menhir_action_33 x in
                _menhir_goto_nonempty_list_function_dec_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 156)
        | _ ->
            _eRR 148
    
    and _menhir_run_143 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
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
                    _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState145
                | Tokens.CLOSE ->
                    let _v_2 = _menhir_action_28 () in
                    _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState145
                | _ ->
                    _eRR 145)
            | _ ->
                _eRR 144)
        | _ ->
            _eRR 143
    
    and _menhir_run_146 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN _menhir_cell0_SYMBOL _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_list_sorted_var_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState147 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 147
    
    and _menhir_goto_nonempty_list_function_dec_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState156 ->
            _menhir_run_157 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState142 ->
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_157 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_function_dec -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_function_dec (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_34 x xs in
        _menhir_goto_nonempty_list_function_dec_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_150 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN _menhir_cell0_DEFINE_FUNS_REC _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_nonempty_list_function_dec_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState152 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SYMBOL _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.STR _v ->
                _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.OPEN ->
                _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NUM _v ->
                _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.HEX _v ->
                _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DEC _v ->
                _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.BIN _v ->
                _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 152)
        | _ ->
            _eRR 151
    
    and _menhir_run_042 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_AS, ttv_result) _menhir_cell1_identifier -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_identifier (_menhir_stack, _, s, _startpos_s_, _endpos_s_) = _menhir_stack in
            let MenhirCell1_AS (_menhir_stack, _, _, _) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__5_, ty) = (_endpos, _v) in
            let _v = _menhir_action_57 _endpos__5_ _endpos_s_ _startpos__1_ _startpos_s_ s ty in
            _menhir_goto_qual_identifier _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 42
    
    and _menhir_run_036 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_SYMBOL _menhir_cell0_OPEN, ttv_result) _menhir_cell1_list_sorted_var_ _menhir_cell0_CLOSE as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_sort (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState036
        | Tokens.STR _v_1 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState036
        | Tokens.OPEN ->
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState036
        | Tokens.NUM _v_2 ->
            _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState036
        | Tokens.HEX _v_3 ->
            _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState036
        | Tokens.DEC _v_4 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState036
        | Tokens.BIN _v_5 ->
            _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState036
        | _ ->
            _eRR 36
    
    and _menhir_run_030 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_OPEN _menhir_cell0_SYMBOL -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.CLOSE ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_SYMBOL (_menhir_stack, s, _startpos_s_, _endpos_s_) = _menhir_stack in
            let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__4_, ty) = (_endpos, _v) in
            let _v = _menhir_action_78 _endpos__4_ _endpos_s_ _startpos__1_ _startpos_s_ s ty in
            _menhir_goto_sorted_var _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 30
    
    and _menhir_goto_sorted_var : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState207 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState201 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState092 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState085 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState084 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState145 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState032 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState009 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_085 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            let _menhir_stack = MenhirCell1_sorted_var (_menhir_stack, _menhir_s, _v) in
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState085
        | Tokens.CLOSE ->
            let x = _v in
            let _v = _menhir_action_43 x in
            _menhir_goto_nonempty_list_sorted_var_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 85
    
    and _menhir_goto_nonempty_list_sorted_var_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState207 ->
            _menhir_run_208 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState201 ->
            _menhir_run_202 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState092 ->
            _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState084 ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState085 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_208 : type  ttv_stack. (((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_EXISTS _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_term) _menhir_state -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_nonempty_list_sorted_var_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState209 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.STR _v ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.NUM _v ->
            _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEX _v ->
            _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DEC _v ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.BIN _v ->
            _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 209
    
    and _menhir_run_202 : type  ttv_stack. (((ttv_stack, _menhir_box_term) _menhir_cell1_OPEN, _menhir_box_term) _menhir_cell1_FORALL _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_term) _menhir_state -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_nonempty_list_sorted_var_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState203 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.STR _v ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.NUM _v ->
            _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEX _v ->
            _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DEC _v ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.BIN _v ->
            _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 203
    
    and _menhir_run_093 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_EXISTS _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_nonempty_list_sorted_var_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState094 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.STR _v ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.NUM _v ->
            _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEX _v ->
            _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DEC _v ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.BIN _v ->
            _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 94
    
    and _menhir_run_087 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_FORALL _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_nonempty_list_sorted_var_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState088 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.STR _v ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.NUM _v ->
            _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEX _v ->
            _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DEC _v ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.BIN _v ->
            _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 88
    
    and _menhir_run_086 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_sorted_var -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_sorted_var (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_44 x xs in
        _menhir_goto_nonempty_list_sorted_var_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_032 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_sorted_var (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState032
        | Tokens.CLOSE ->
            let _v_0 = _menhir_action_28 () in
            _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
        | _ ->
            _eRR 32
    
    and _menhir_run_033 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_sorted_var -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_sorted_var (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_29 x xs in
        _menhir_goto_list_sorted_var_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_goto_list_sorted_var_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState145 ->
            _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState009 ->
            _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState032 ->
            _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_034 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_SYMBOL _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_list_sorted_var_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_CLOSE (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState035 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.OPEN ->
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 35
    
    and _menhir_run_025 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            let _menhir_stack = MenhirCell1_sort (_menhir_stack, _menhir_s, _v) in
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState025
        | Tokens.OPEN ->
            let _menhir_stack = MenhirCell1_sort (_menhir_stack, _menhir_s, _v) in
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState025
        | Tokens.CLOSE ->
            let x = _v in
            let _v = _menhir_action_41 x in
            _menhir_goto_nonempty_list_sort_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 25
    
    and _menhir_goto_nonempty_list_sort_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState024 ->
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState025 ->
            _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_028 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN, ttv_result) _menhir_cell1_identifier -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell1_identifier (_menhir_stack, _, f, _startpos_f_, _endpos_f_) = _menhir_stack in
        let MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos__4_, args) = (_endpos, _v) in
        let _v = _menhir_action_77 _endpos__4_ _endpos_f_ _startpos__1_ _startpos_f_ args f in
        _menhir_goto_sort _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_026 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_sort -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_sort (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_42 x xs in
        _menhir_goto_nonempty_list_sort_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_024 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_OPEN as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_identifier (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v_0 ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState024
        | Tokens.OPEN ->
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState024
        | _ ->
            _eRR 24
    
    and _menhir_run_005 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_SAT _menhir_cell0_OPEN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_option_MODEL_ (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.OPEN ->
            _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState005
        | Tokens.CLOSE ->
            let _v_0 = _menhir_action_24 () in
            _menhir_run_161 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
        | _ ->
            _eRR 5
    
    let _menhir_run_000 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UNSAT ->
            _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
        | Tokens.SAT ->
            _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
        | Tokens.EOF ->
            let _v = _menhir_action_22 () in
            _menhir_run_165 _menhir_stack _v
        | _ ->
            _eRR 0
    
    let _menhir_run_170 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UNSAT ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _v =
              let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
              _menhir_action_03 _endpos__1_ _startpos__1_
            in
            _menhir_run_179 _menhir_stack _v
        | Tokens.SAT ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell1_SAT (_menhir_stack, MenhirState170, _startpos, _endpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.OPEN ->
                let _startpos_0 = _menhir_lexbuf.Lexing.lex_start_p in
                let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos_0) in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.MODEL ->
                    _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState173
                | Tokens.CLOSE | Tokens.OPEN ->
                    let _v = _menhir_action_49 () in
                    _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState173 _tok
                | _ ->
                    _eRR 173)
            | _ ->
                _eRR 172)
        | Tokens.EOF ->
            let _v = _menhir_action_20 () in
            _menhir_goto_input _menhir_stack _v
        | _ ->
            _eRR 170
    
    let _menhir_run_180 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_term =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.SYMBOL _v ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _v =
              let s = _v in
              _menhir_action_15 s
            in
            _menhir_run_230 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v MenhirState180 _tok
        | Tokens.STR _v ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _v =
              let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
              _menhir_action_83 _endpos_s_ _startpos_s_ s
            in
            _menhir_run_228 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState180 _tok
        | Tokens.OPEN ->
            let _menhir_s = MenhirState180 in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell1_OPEN (_menhir_stack, _menhir_s, _startpos) in
            let _menhir_s = MenhirState183 in
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
                    let _menhir_s = MenhirState185 in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.SYMBOL _v ->
                        _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                    | Tokens.NUM _v ->
                        _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                    | Tokens.HEX _v ->
                        _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                    | _ ->
                        _eRR 185)
                | _ ->
                    _eRR 184)
            | Tokens.SYMBOL _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.OPEN ->
                _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_MATCH (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _menhir_s = MenhirState188 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SYMBOL _v ->
                    _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.STR _v ->
                    _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.OPEN ->
                    _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | Tokens.NUM _v ->
                    _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.HEX _v ->
                    _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.DEC _v ->
                    _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.BIN _v ->
                    _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | _ ->
                    _eRR 188)
            | Tokens.LET ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_LET (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.OPEN ->
                    let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                    let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
                    let _menhir_s = MenhirState195 in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.OPEN ->
                        _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                    | _ ->
                        _eRR 195)
                | _ ->
                    _eRR 194)
            | Tokens.FORALL ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_FORALL (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.OPEN ->
                    let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                    let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
                    let _menhir_s = MenhirState201 in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.OPEN ->
                        _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                    | _ ->
                        _eRR 201)
                | _ ->
                    _eRR 200)
            | Tokens.EXISTS ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_EXISTS (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.OPEN ->
                    let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                    let _menhir_stack = MenhirCell0_OPEN (_menhir_stack, _startpos) in
                    let _menhir_s = MenhirState207 in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.OPEN ->
                        _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                    | _ ->
                        _eRR 207)
                | _ ->
                    _eRR 206)
            | Tokens.ATTRIBUTE ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_ATTRIBUTE (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _menhir_s = MenhirState212 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SYMBOL _v ->
                    _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.STR _v ->
                    _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.OPEN ->
                    _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | Tokens.NUM _v ->
                    _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.HEX _v ->
                    _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.DEC _v ->
                    _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.BIN _v ->
                    _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | _ ->
                    _eRR 212)
            | Tokens.AS ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell1_AS (_menhir_stack, _menhir_s, _startpos, _endpos) in
                let _menhir_s = MenhirState216 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SYMBOL _v ->
                    _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.OPEN ->
                    _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | _ ->
                    _eRR 216)
            | _ ->
                _eRR 183)
        | Tokens.NUM _v ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _v =
              let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
              _menhir_action_79 _endpos_s_ _startpos_s_ s
            in
            _menhir_run_228 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState180 _tok
        | Tokens.HEX _v ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _v =
              let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
              _menhir_action_81 _endpos_s_ _startpos_s_ s
            in
            _menhir_run_228 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState180 _tok
        | Tokens.DEC _v ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _v =
              let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
              _menhir_action_80 _endpos_s_ _startpos_s_ s
            in
            _menhir_run_228 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState180 _tok
        | Tokens.BIN _v ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _v =
              let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
              _menhir_action_82 _endpos_s_ _startpos_s_ s
            in
            _menhir_run_228 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState180 _tok
        | _ ->
            _eRR 180
    
  end
  
  let term =
    fun _menhir_lexer _menhir_lexbuf ->
      let _menhir_stack = () in
      let MenhirBox_term v = _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer in
      v
  
  let input =
    fun _menhir_lexer _menhir_lexbuf ->
      let _menhir_stack = () in
      let MenhirBox_input v = _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer in
      v
  
  let file =
    fun _menhir_lexer _menhir_lexbuf ->
      let _menhir_stack = () in
      let MenhirBox_file v = _menhir_run_000 _menhir_stack _menhir_lexbuf _menhir_lexer in
      v
  
# 257 "src/languages/smtlib2/v2.6/response/parser.mly"
  

# 4150 "src/languages/smtlib2/v2.6/response/parser.ml"
  
end
