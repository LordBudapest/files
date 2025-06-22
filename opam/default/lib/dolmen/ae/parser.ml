
module Make

# 4 "src/languages/ae/parser.mly"
           (L : Dolmen_intf.Location.S)
# 7 "src/languages/ae/parser.ml"


# 5 "src/languages/ae/parser.mly"
           (I : Ast.Id)
# 12 "src/languages/ae/parser.ml"


# 6 "src/languages/ae/parser.mly"
           (T : Ast.Term
  with type location := L.t and type id := I.t)
# 18 "src/languages/ae/parser.ml"


# 8 "src/languages/ae/parser.mly"
           (S : Ast.Statement
  with type location := L.t  and type id := I.t and type term := T.t)
# 24 "src/languages/ae/parser.ml"

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
    | MenhirState000 : ('s, _menhir_box_file) _menhir_state
      (** State 000.
        Stack shape : .
        Start symbol: file. *)

    | MenhirState001 : (('s, _menhir_box_file) _menhir_cell1_TYPE, _menhir_box_file) _menhir_state
      (** State 001.
        Stack shape : TYPE.
        Start symbol: file. *)

    | MenhirState004 : (('s, _menhir_box_file) _menhir_cell1_LEFTPAR, _menhir_box_file) _menhir_state
      (** State 004.
        Stack shape : LEFTPAR.
        Start symbol: file. *)

    | MenhirState006 : (('s, _menhir_box_file) _menhir_cell1_type_var, _menhir_box_file) _menhir_state
      (** State 006.
        Stack shape : type_var.
        Start symbol: file. *)

    | MenhirState010 : ((('s, _menhir_box_file) _menhir_cell1_TYPE, _menhir_box_file) _menhir_cell1_type_vars, _menhir_box_file) _menhir_state
      (** State 010.
        Stack shape : TYPE type_vars.
        Start symbol: file. *)

    | MenhirState013 : (((('s, _menhir_box_file) _menhir_cell1_TYPE, _menhir_box_file) _menhir_cell1_type_vars, _menhir_box_file) _menhir_cell1_raw_ident, _menhir_box_file) _menhir_state
      (** State 013.
        Stack shape : TYPE type_vars raw_ident.
        Start symbol: file. *)

    | MenhirState014 : ((((('s, _menhir_box_file) _menhir_cell1_TYPE, _menhir_box_file) _menhir_cell1_type_vars, _menhir_box_file) _menhir_cell1_raw_ident, _menhir_box_file) _menhir_cell1_LEFTBR, _menhir_box_file) _menhir_state
      (** State 014.
        Stack shape : TYPE type_vars raw_ident LEFTBR.
        Start symbol: file. *)

    | MenhirState018 : (('s, _menhir_box_file) _menhir_cell1_record_label_with_type _menhir_cell0_PV, _menhir_box_file) _menhir_state
      (** State 018.
        Stack shape : record_label_with_type PV.
        Start symbol: file. *)

    | MenhirState021 : (('s, _menhir_box_file) _menhir_cell1_raw_ident, _menhir_box_file) _menhir_state
      (** State 021.
        Stack shape : raw_ident.
        Start symbol: file. *)

    | MenhirState024 : (('s, _menhir_box_file) _menhir_cell1_LEFTPAR, _menhir_box_file) _menhir_state
      (** State 024.
        Stack shape : LEFTPAR.
        Start symbol: file. *)

    | MenhirState034 : ((('s, _menhir_box_file) _menhir_cell1_LEFTPAR, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_primitive_type_ _menhir_cell0_RIGHTPAR, _menhir_box_file) _menhir_state
      (** State 034.
        Stack shape : LEFTPAR separated_nonempty_list(COMMA,primitive_type) RIGHTPAR.
        Start symbol: file. *)

    | MenhirState037 : (('s, _menhir_box_file) _menhir_cell1_primitive_type, _menhir_box_file) _menhir_state
      (** State 037.
        Stack shape : primitive_type.
        Start symbol: file. *)

    | MenhirState038 : ((('s, _menhir_box_file) _menhir_cell1_primitive_type, _menhir_box_file) _menhir_cell1_COMMA, _menhir_box_file) _menhir_state
      (** State 038.
        Stack shape : primitive_type COMMA.
        Start symbol: file. *)

    | MenhirState041 : ((('s, _menhir_box_file) _menhir_cell1_raw_ident, _menhir_box_file) _menhir_cell1_primitive_type, _menhir_box_file) _menhir_state
      (** State 041.
        Stack shape : raw_ident primitive_type.
        Start symbol: file. *)

    | MenhirState046 : (('s, _menhir_box_file) _menhir_cell1_raw_ident _menhir_cell0_LEFTBR, _menhir_box_file) _menhir_state
      (** State 046.
        Stack shape : raw_ident LEFTBR.
        Start symbol: file. *)

    | MenhirState051 : (('s, _menhir_box_file) _menhir_cell1_ident, _menhir_box_file) _menhir_state
      (** State 051.
        Stack shape : ident.
        Start symbol: file. *)

    | MenhirState052 : ((('s, _menhir_box_file) _menhir_cell1_ident, _menhir_box_file) _menhir_cell1_primitive_type, _menhir_box_file) _menhir_state
      (** State 052.
        Stack shape : ident primitive_type.
        Start symbol: file. *)

    | MenhirState054 : (('s, _menhir_box_file) _menhir_cell1_algebraic_label_with_type _menhir_cell0_PV, _menhir_box_file) _menhir_state
      (** State 054.
        Stack shape : algebraic_label_with_type PV.
        Start symbol: file. *)

    | MenhirState058 : (('s, _menhir_box_file) _menhir_cell1_algebraic_constructor, _menhir_box_file) _menhir_state
      (** State 058.
        Stack shape : algebraic_constructor.
        Start symbol: file. *)

    | MenhirState063 : (('s, _menhir_box_file) _menhir_cell1_algebraic_typedef, _menhir_box_file) _menhir_state
      (** State 063.
        Stack shape : algebraic_typedef.
        Start symbol: file. *)

    | MenhirState064 : ((('s, _menhir_box_file) _menhir_cell1_algebraic_typedef, _menhir_box_file) _menhir_cell1_type_vars, _menhir_box_file) _menhir_state
      (** State 064.
        Stack shape : algebraic_typedef type_vars.
        Start symbol: file. *)

    | MenhirState066 : (((('s, _menhir_box_file) _menhir_cell1_algebraic_typedef, _menhir_box_file) _menhir_cell1_type_vars, _menhir_box_file) _menhir_cell1_raw_ident, _menhir_box_file) _menhir_state
      (** State 066.
        Stack shape : algebraic_typedef type_vars raw_ident.
        Start symbol: file. *)

    | MenhirState068 : (('s, _menhir_box_file) _menhir_cell1_THEORY, _menhir_box_file) _menhir_state
      (** State 068.
        Stack shape : THEORY.
        Start symbol: file. *)

    | MenhirState071 : ((('s, _menhir_box_file) _menhir_cell1_THEORY, _menhir_box_file) _menhir_cell1_decl_ident, _menhir_box_file) _menhir_state
      (** State 071.
        Stack shape : THEORY decl_ident.
        Start symbol: file. *)

    | MenhirState073 : (((('s, _menhir_box_file) _menhir_cell1_THEORY, _menhir_box_file) _menhir_cell1_decl_ident, _menhir_box_file) _menhir_cell1_decl_ident, _menhir_box_file) _menhir_state
      (** State 073.
        Stack shape : THEORY decl_ident decl_ident.
        Start symbol: file. *)

    | MenhirState074 : (('s, _menhir_box_file) _menhir_cell1_CASESPLIT, _menhir_box_file) _menhir_state
      (** State 074.
        Stack shape : CASESPLIT.
        Start symbol: file. *)

    | MenhirState076 : ((('s, _menhir_box_file) _menhir_cell1_CASESPLIT, _menhir_box_file) _menhir_cell1_decl_ident, _menhir_box_file) _menhir_state
      (** State 076.
        Stack shape : CASESPLIT decl_ident.
        Start symbol: file. *)

    | MenhirState080 : (('s, _menhir_box_file) _menhir_cell1_STRING, _menhir_box_file) _menhir_state
      (** State 080.
        Stack shape : STRING.
        Start symbol: file. *)

    | MenhirState081 : (('s, _menhir_box_file) _menhir_cell1_NOT, _menhir_box_file) _menhir_state
      (** State 081.
        Stack shape : NOT.
        Start symbol: file. *)

    | MenhirState082 : (('s, _menhir_box_file) _menhir_cell1_MINUS, _menhir_box_file) _menhir_state
      (** State 082.
        Stack shape : MINUS.
        Start symbol: file. *)

    | MenhirState083 : (('s, _menhir_box_file) _menhir_cell1_MATCH, _menhir_box_file) _menhir_state
      (** State 083.
        Stack shape : MATCH.
        Start symbol: file. *)

    | MenhirState084 : (('s, _menhir_box_file) _menhir_cell1_LET, _menhir_box_file) _menhir_state
      (** State 084.
        Stack shape : LET.
        Start symbol: file. *)

    | MenhirState086 : ((('s, _menhir_box_file) _menhir_cell1_LET, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_let_binder_, _menhir_box_file) _menhir_state
      (** State 086.
        Stack shape : LET separated_nonempty_list(COMMA,let_binder).
        Start symbol: file. *)

    | MenhirState092 : (('s, _menhir_box_file) _menhir_cell1_LEFTPAR, _menhir_box_file) _menhir_state
      (** State 092.
        Stack shape : LEFTPAR.
        Start symbol: file. *)

    | MenhirState093 : (('s, _menhir_box_file) _menhir_cell1_LEFTBR, _menhir_box_file) _menhir_state
      (** State 093.
        Stack shape : LEFTBR.
        Start symbol: file. *)

    | MenhirState099 : ((('s, _menhir_box_file) _menhir_cell1_LEFTBR, _menhir_box_file) _menhir_cell1_simple_expr, _menhir_box_file) _menhir_state
      (** State 099.
        Stack shape : LEFTBR simple_expr.
        Start symbol: file. *)

    | MenhirState103 : (('s, _menhir_box_file) _menhir_cell1_label_expr _menhir_cell0_PV, _menhir_box_file) _menhir_state
      (** State 103.
        Stack shape : label_expr PV.
        Start symbol: file. *)

    | MenhirState106 : (('s, _menhir_box_file) _menhir_cell1_ident, _menhir_box_file) _menhir_state
      (** State 106.
        Stack shape : ident.
        Start symbol: file. *)

    | MenhirState107 : (('s, _menhir_box_file) _menhir_cell1_IF, _menhir_box_file) _menhir_state
      (** State 107.
        Stack shape : IF.
        Start symbol: file. *)

    | MenhirState108 : (('s, _menhir_box_file) _menhir_cell1_FORALL, _menhir_box_file) _menhir_state
      (** State 108.
        Stack shape : FORALL.
        Start symbol: file. *)

    | MenhirState112 : (('s, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_named_ident_, _menhir_box_file) _menhir_state
      (** State 112.
        Stack shape : separated_nonempty_list(COMMA,named_ident).
        Start symbol: file. *)

    | MenhirState113 : ((('s, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_named_ident_, _menhir_box_file) _menhir_cell1_primitive_type, _menhir_box_file) _menhir_state
      (** State 113.
        Stack shape : separated_nonempty_list(COMMA,named_ident) primitive_type.
        Start symbol: file. *)

    | MenhirState114 : ((('s, _menhir_box_file) _menhir_cell1_FORALL, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_multi_logic_binder_, _menhir_box_file) _menhir_state
      (** State 114.
        Stack shape : FORALL separated_nonempty_list(COMMA,multi_logic_binder).
        Start symbol: file. *)

    | MenhirState115 : ((('s, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_multi_logic_binder_, _menhir_box_file) _menhir_cell1_LEFTSQ, _menhir_box_file) _menhir_state
      (** State 115.
        Stack shape : separated_nonempty_list(COMMA,multi_logic_binder) LEFTSQ.
        Start symbol: file. *)

    | MenhirState116 : (('s, _menhir_box_file) _menhir_cell1_EXISTS, _menhir_box_file) _menhir_state
      (** State 116.
        Stack shape : EXISTS.
        Start symbol: file. *)

    | MenhirState117 : ((('s, _menhir_box_file) _menhir_cell1_EXISTS, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_multi_logic_binder_, _menhir_box_file) _menhir_state
      (** State 117.
        Stack shape : EXISTS separated_nonempty_list(COMMA,multi_logic_binder).
        Start symbol: file. *)

    | MenhirState118 : (((('s, _menhir_box_file) _menhir_cell1_EXISTS, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_multi_logic_binder_, _menhir_box_file) _menhir_cell1_triggers, _menhir_box_file) _menhir_state
      (** State 118.
        Stack shape : EXISTS separated_nonempty_list(COMMA,multi_logic_binder) triggers.
        Start symbol: file. *)

    | MenhirState119 : (((('s, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_multi_logic_binder_, _menhir_box_file) _menhir_cell1_triggers, _menhir_box_file) _menhir_cell1_LEFTBR, _menhir_box_file) _menhir_state
      (** State 119.
        Stack shape : separated_nonempty_list(COMMA,multi_logic_binder) triggers LEFTBR.
        Start symbol: file. *)

    | MenhirState121 : (('s, _menhir_box_file) _menhir_cell1_DISTINCT _menhir_cell0_LEFTPAR, _menhir_box_file) _menhir_state
      (** State 121.
        Stack shape : DISTINCT LEFTPAR.
        Start symbol: file. *)

    | MenhirState122 : (('s, _menhir_box_file) _menhir_cell1_CUT, _menhir_box_file) _menhir_state
      (** State 122.
        Stack shape : CUT.
        Start symbol: file. *)

    | MenhirState123 : (('s, _menhir_box_file) _menhir_cell1_CHECK, _menhir_box_file) _menhir_state
      (** State 123.
        Stack shape : CHECK.
        Start symbol: file. *)

    | MenhirState125 : (('s, _menhir_box_file) _menhir_cell1_simple_expr, _menhir_box_file) _menhir_state
      (** State 125.
        Stack shape : simple_expr.
        Start symbol: file. *)

    | MenhirState128 : (('s, _menhir_box_file) _menhir_cell1_simple_expr _menhir_cell0_QM, _menhir_box_file) _menhir_state
      (** State 128.
        Stack shape : simple_expr QM.
        Start symbol: file. *)

    | MenhirState130 : (('s, _menhir_box_file) _menhir_cell1_simple_expr _menhir_cell0_LEFTSQ, _menhir_box_file) _menhir_state
      (** State 130.
        Stack shape : simple_expr LEFTSQ.
        Start symbol: file. *)

    | MenhirState134 : (('s, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_state
      (** State 134.
        Stack shape : lexpr.
        Start symbol: file. *)

    | MenhirState136 : (('s, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_state
      (** State 136.
        Stack shape : lexpr.
        Start symbol: file. *)

    | MenhirState145 : (('s, _menhir_box_file) _menhir_cell1_ident _menhir_cell0_LEFTPAR, _menhir_box_file) _menhir_state
      (** State 145.
        Stack shape : ident LEFTPAR.
        Start symbol: file. *)

    | MenhirState150 : (('s, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_state
      (** State 150.
        Stack shape : lexpr.
        Start symbol: file. *)

    | MenhirState152 : (('s, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_state
      (** State 152.
        Stack shape : lexpr.
        Start symbol: file. *)

    | MenhirState154 : (('s, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_state
      (** State 154.
        Stack shape : lexpr.
        Start symbol: file. *)

    | MenhirState156 : (('s, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_state
      (** State 156.
        Stack shape : lexpr.
        Start symbol: file. *)

    | MenhirState158 : (('s, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_state
      (** State 158.
        Stack shape : lexpr.
        Start symbol: file. *)

    | MenhirState160 : (('s, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_state
      (** State 160.
        Stack shape : lexpr.
        Start symbol: file. *)

    | MenhirState162 : (('s, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_state
      (** State 162.
        Stack shape : lexpr.
        Start symbol: file. *)

    | MenhirState164 : (('s, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_state
      (** State 164.
        Stack shape : lexpr.
        Start symbol: file. *)

    | MenhirState166 : (('s, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_state
      (** State 166.
        Stack shape : lexpr.
        Start symbol: file. *)

    | MenhirState168 : (('s, _menhir_box_file) _menhir_cell1_lexpr _menhir_cell0_MINUS, _menhir_box_file) _menhir_state
      (** State 168.
        Stack shape : lexpr MINUS.
        Start symbol: file. *)

    | MenhirState170 : (('s, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_state
      (** State 170.
        Stack shape : lexpr.
        Start symbol: file. *)

    | MenhirState172 : (('s, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_state
      (** State 172.
        Stack shape : lexpr.
        Start symbol: file. *)

    | MenhirState174 : (('s, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_state
      (** State 174.
        Stack shape : lexpr.
        Start symbol: file. *)

    | MenhirState176 : (('s, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_state
      (** State 176.
        Stack shape : lexpr.
        Start symbol: file. *)

    | MenhirState178 : (('s, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_state
      (** State 178.
        Stack shape : lexpr.
        Start symbol: file. *)

    | MenhirState180 : (('s, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_state
      (** State 180.
        Stack shape : lexpr.
        Start symbol: file. *)

    | MenhirState182 : (('s, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_state
      (** State 182.
        Stack shape : lexpr.
        Start symbol: file. *)

    | MenhirState184 : (('s, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_state
      (** State 184.
        Stack shape : lexpr.
        Start symbol: file. *)

    | MenhirState187 : (('s, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_state
      (** State 187.
        Stack shape : lexpr.
        Start symbol: file. *)

    | MenhirState190 : (('s, _menhir_box_file) _menhir_cell1_array_assignment, _menhir_box_file) _menhir_state
      (** State 190.
        Stack shape : array_assignment.
        Start symbol: file. *)

    | MenhirState193 : (('s, _menhir_box_file) _menhir_cell1_simple_expr, _menhir_box_file) _menhir_state
      (** State 193.
        Stack shape : simple_expr.
        Start symbol: file. *)

    | MenhirState195 : (('s, _menhir_box_file) _menhir_cell1_simple_expr, _menhir_box_file) _menhir_state
      (** State 195.
        Stack shape : simple_expr.
        Start symbol: file. *)

    | MenhirState196 : ((('s, _menhir_box_file) _menhir_cell1_simple_expr, _menhir_box_file) _menhir_cell1_primitive_type, _menhir_box_file) _menhir_state
      (** State 196.
        Stack shape : simple_expr primitive_type.
        Start symbol: file. *)

    | MenhirState202 : (('s, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_state
      (** State 202.
        Stack shape : lexpr.
        Start symbol: file. *)

    | MenhirState208 : ((((('s, _menhir_box_file) _menhir_cell1_EXISTS, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_multi_logic_binder_, _menhir_box_file) _menhir_cell1_triggers, _menhir_box_file) _menhir_cell1_filters, _menhir_box_file) _menhir_state
      (** State 208.
        Stack shape : EXISTS separated_nonempty_list(COMMA,multi_logic_binder) triggers filters.
        Start symbol: file. *)

    | MenhirState212 : (('s, _menhir_box_file) _menhir_cell1_named_ident, _menhir_box_file) _menhir_state
      (** State 212.
        Stack shape : named_ident.
        Start symbol: file. *)

    | MenhirState215 : (('s, _menhir_box_file) _menhir_cell1_multi_logic_binder, _menhir_box_file) _menhir_state
      (** State 215.
        Stack shape : multi_logic_binder.
        Start symbol: file. *)

    | MenhirState218 : (('s, _menhir_box_file) _menhir_cell1_trigger, _menhir_box_file) _menhir_state
      (** State 218.
        Stack shape : trigger.
        Start symbol: file. *)

    | MenhirState222 : (('s, _menhir_box_file) _menhir_cell1_raw_ident, _menhir_box_file) _menhir_state
      (** State 222.
        Stack shape : raw_ident.
        Start symbol: file. *)

    | MenhirState225 : (('s, _menhir_box_file) _menhir_cell1_lexpr_or_dom, _menhir_box_file) _menhir_state
      (** State 225.
        Stack shape : lexpr_or_dom.
        Start symbol: file. *)

    | MenhirState228 : (('s, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_state
      (** State 228.
        Stack shape : lexpr.
        Start symbol: file. *)

    | MenhirState231 : ((('s, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_cell1_sq, _menhir_box_file) _menhir_state
      (** State 231.
        Stack shape : lexpr sq.
        Start symbol: file. *)

    | MenhirState243 : (((('s, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_cell1_sq, _menhir_box_file) _menhir_cell1_bound, _menhir_box_file) _menhir_state
      (** State 243.
        Stack shape : lexpr sq bound.
        Start symbol: file. *)

    | MenhirState244 : ((((('s, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_cell1_sq, _menhir_box_file) _menhir_cell1_bound, _menhir_box_file) _menhir_cell1_bound, _menhir_box_file) _menhir_state
      (** State 244.
        Stack shape : lexpr sq bound bound.
        Start symbol: file. *)

    | MenhirState248 : (((('s, _menhir_box_file) _menhir_cell1_FORALL, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_multi_logic_binder_, _menhir_box_file) _menhir_cell1_triggers, _menhir_box_file) _menhir_state
      (** State 248.
        Stack shape : FORALL separated_nonempty_list(COMMA,multi_logic_binder) triggers.
        Start symbol: file. *)

    | MenhirState250 : ((((('s, _menhir_box_file) _menhir_cell1_FORALL, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_multi_logic_binder_, _menhir_box_file) _menhir_cell1_triggers, _menhir_box_file) _menhir_cell1_filters, _menhir_box_file) _menhir_state
      (** State 250.
        Stack shape : FORALL separated_nonempty_list(COMMA,multi_logic_binder) triggers filters.
        Start symbol: file. *)

    | MenhirState253 : ((('s, _menhir_box_file) _menhir_cell1_IF, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_state
      (** State 253.
        Stack shape : IF lexpr.
        Start symbol: file. *)

    | MenhirState255 : (((('s, _menhir_box_file) _menhir_cell1_IF, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_state
      (** State 255.
        Stack shape : IF lexpr lexpr.
        Start symbol: file. *)

    | MenhirState265 : (('s, _menhir_box_file) _menhir_cell1_let_binder, _menhir_box_file) _menhir_state
      (** State 265.
        Stack shape : let_binder.
        Start symbol: file. *)

    | MenhirState268 : (('s, _menhir_box_file) _menhir_cell1_ident, _menhir_box_file) _menhir_state
      (** State 268.
        Stack shape : ident.
        Start symbol: file. *)

    | MenhirState271 : ((('s, _menhir_box_file) _menhir_cell1_MATCH, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_state
      (** State 271.
        Stack shape : MATCH lexpr.
        Start symbol: file. *)

    | MenhirState272 : (((('s, _menhir_box_file) _menhir_cell1_MATCH, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_cell1_BAR, _menhir_box_file) _menhir_state
      (** State 272.
        Stack shape : MATCH lexpr BAR.
        Start symbol: file. *)

    | MenhirState274 : (('s, _menhir_box_file) _menhir_cell1_simple_pattern, _menhir_box_file) _menhir_state
      (** State 274.
        Stack shape : simple_pattern.
        Start symbol: file. *)

    | MenhirState278 : (('s, _menhir_box_file) _menhir_cell1_ident _menhir_cell0_LEFTPAR, _menhir_box_file) _menhir_state
      (** State 278.
        Stack shape : ident LEFTPAR.
        Start symbol: file. *)

    | MenhirState282 : (('s, _menhir_box_file) _menhir_cell1_ident, _menhir_box_file) _menhir_state
      (** State 282.
        Stack shape : ident.
        Start symbol: file. *)

    | MenhirState286 : (((('s, _menhir_box_file) _menhir_cell1_MATCH, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_cell1_match_cases, _menhir_box_file) _menhir_state
      (** State 286.
        Stack shape : MATCH lexpr match_cases.
        Start symbol: file. *)

    | MenhirState293 : (('s, _menhir_box_file) _menhir_cell1_AXIOM, _menhir_box_file) _menhir_state
      (** State 293.
        Stack shape : AXIOM.
        Start symbol: file. *)

    | MenhirState295 : ((('s, _menhir_box_file) _menhir_cell1_AXIOM, _menhir_box_file) _menhir_cell1_decl_ident, _menhir_box_file) _menhir_state
      (** State 295.
        Stack shape : AXIOM decl_ident.
        Start symbol: file. *)

    | MenhirState297 : (('s, _menhir_box_file) _menhir_cell1_theory_elt, _menhir_box_file) _menhir_state
      (** State 297.
        Stack shape : theory_elt.
        Start symbol: file. *)

    | MenhirState301 : (('s, _menhir_box_file) _menhir_cell1_REWRITING, _menhir_box_file) _menhir_state
      (** State 301.
        Stack shape : REWRITING.
        Start symbol: file. *)

    | MenhirState303 : ((('s, _menhir_box_file) _menhir_cell1_REWRITING, _menhir_box_file) _menhir_cell1_decl_ident, _menhir_box_file) _menhir_state
      (** State 303.
        Stack shape : REWRITING decl_ident.
        Start symbol: file. *)

    | MenhirState306 : (('s, _menhir_box_file) _menhir_cell1_lexpr _menhir_cell0_PV, _menhir_box_file) _menhir_state
      (** State 306.
        Stack shape : lexpr PV.
        Start symbol: file. *)

    | MenhirState308 : (('s, _menhir_box_file) _menhir_cell1_PRED, _menhir_box_file) _menhir_state
      (** State 308.
        Stack shape : PRED.
        Start symbol: file. *)

    | MenhirState310 : ((('s, _menhir_box_file) _menhir_cell1_PRED, _menhir_box_file) _menhir_cell1_raw_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file) _menhir_state
      (** State 310.
        Stack shape : PRED raw_named_ident LEFTPAR.
        Start symbol: file. *)

    | MenhirState314 : (((('s, _menhir_box_file) _menhir_cell1_PRED, _menhir_box_file) _menhir_cell1_raw_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file) _menhir_cell1_loption_separated_nonempty_list_COMMA_logic_binder__ _menhir_cell0_RIGHTPAR, _menhir_box_file) _menhir_state
      (** State 314.
        Stack shape : PRED raw_named_ident LEFTPAR loption(separated_nonempty_list(COMMA,logic_binder)) RIGHTPAR.
        Start symbol: file. *)

    | MenhirState316 : ((((('s, _menhir_box_file) _menhir_cell1_PRED, _menhir_box_file) _menhir_cell1_raw_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file) _menhir_cell1_loption_separated_nonempty_list_COMMA_logic_binder__ _menhir_cell0_RIGHTPAR, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_state
      (** State 316.
        Stack shape : PRED raw_named_ident LEFTPAR loption(separated_nonempty_list(COMMA,logic_binder)) RIGHTPAR lexpr.
        Start symbol: file. *)

    | MenhirState317 : (('s, _menhir_box_file) _menhir_cell1_FUNC, _menhir_box_file) _menhir_state
      (** State 317.
        Stack shape : FUNC.
        Start symbol: file. *)

    | MenhirState319 : ((('s, _menhir_box_file) _menhir_cell1_FUNC, _menhir_box_file) _menhir_cell1_raw_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file) _menhir_state
      (** State 319.
        Stack shape : FUNC raw_named_ident LEFTPAR.
        Start symbol: file. *)

    | MenhirState322 : (((('s, _menhir_box_file) _menhir_cell1_FUNC, _menhir_box_file) _menhir_cell1_raw_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file) _menhir_cell1_loption_separated_nonempty_list_COMMA_logic_binder__ _menhir_cell0_RIGHTPAR, _menhir_box_file) _menhir_state
      (** State 322.
        Stack shape : FUNC raw_named_ident LEFTPAR loption(separated_nonempty_list(COMMA,logic_binder)) RIGHTPAR.
        Start symbol: file. *)

    | MenhirState323 : ((((('s, _menhir_box_file) _menhir_cell1_FUNC, _menhir_box_file) _menhir_cell1_raw_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file) _menhir_cell1_loption_separated_nonempty_list_COMMA_logic_binder__ _menhir_cell0_RIGHTPAR, _menhir_box_file) _menhir_cell1_primitive_type, _menhir_box_file) _menhir_state
      (** State 323.
        Stack shape : FUNC raw_named_ident LEFTPAR loption(separated_nonempty_list(COMMA,logic_binder)) RIGHTPAR primitive_type.
        Start symbol: file. *)

    | MenhirState324 : (((((('s, _menhir_box_file) _menhir_cell1_FUNC, _menhir_box_file) _menhir_cell1_raw_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file) _menhir_cell1_loption_separated_nonempty_list_COMMA_logic_binder__ _menhir_cell0_RIGHTPAR, _menhir_box_file) _menhir_cell1_primitive_type, _menhir_box_file) _menhir_cell1_EQUAL, _menhir_box_file) _menhir_state
      (** State 324.
        Stack shape : FUNC raw_named_ident LEFTPAR loption(separated_nonempty_list(COMMA,logic_binder)) RIGHTPAR primitive_type EQUAL.
        Start symbol: file. *)

    | MenhirState326 : ((((((('s, _menhir_box_file) _menhir_cell1_FUNC, _menhir_box_file) _menhir_cell1_raw_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file) _menhir_cell1_loption_separated_nonempty_list_COMMA_logic_binder__ _menhir_cell0_RIGHTPAR, _menhir_box_file) _menhir_cell1_primitive_type, _menhir_box_file) _menhir_cell1_EQUAL, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_state
      (** State 326.
        Stack shape : FUNC raw_named_ident LEFTPAR loption(separated_nonempty_list(COMMA,logic_binder)) RIGHTPAR primitive_type EQUAL lexpr.
        Start symbol: file. *)

    | MenhirState329 : (('s, _menhir_box_file) _menhir_cell1_logic_binder, _menhir_box_file) _menhir_state
      (** State 329.
        Stack shape : logic_binder.
        Start symbol: file. *)

    | MenhirState332 : (('s, _menhir_box_file) _menhir_cell1_ident, _menhir_box_file) _menhir_state
      (** State 332.
        Stack shape : ident.
        Start symbol: file. *)

    | MenhirState333 : ((('s, _menhir_box_file) _menhir_cell1_ident, _menhir_box_file) _menhir_cell1_primitive_type, _menhir_box_file) _menhir_state
      (** State 333.
        Stack shape : ident primitive_type.
        Start symbol: file. *)

    | MenhirState335 : ((('s, _menhir_box_file) _menhir_cell1_PRED, _menhir_box_file) _menhir_cell1_raw_named_ident, _menhir_box_file) _menhir_state
      (** State 335.
        Stack shape : PRED raw_named_ident.
        Start symbol: file. *)

    | MenhirState337 : (((('s, _menhir_box_file) _menhir_cell1_PRED, _menhir_box_file) _menhir_cell1_raw_named_ident, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_state
      (** State 337.
        Stack shape : PRED raw_named_ident lexpr.
        Start symbol: file. *)

    | MenhirState341 : (('s, _menhir_box_file) _menhir_cell1_LOGIC _menhir_cell0_ac_modifier, _menhir_box_file) _menhir_state
      (** State 341.
        Stack shape : LOGIC ac_modifier.
        Start symbol: file. *)

    | MenhirState343 : ((('s, _menhir_box_file) _menhir_cell1_LOGIC _menhir_cell0_ac_modifier, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_raw_named_ident_, _menhir_box_file) _menhir_state
      (** State 343.
        Stack shape : LOGIC ac_modifier separated_nonempty_list(COMMA,raw_named_ident).
        Start symbol: file. *)

    | MenhirState347 : (((('s, _menhir_box_file) _menhir_cell1_LOGIC _menhir_cell0_ac_modifier, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_raw_named_ident_, _menhir_box_file) _menhir_cell1_primitive_type, _menhir_box_file) _menhir_state
      (** State 347.
        Stack shape : LOGIC ac_modifier separated_nonempty_list(COMMA,raw_named_ident) primitive_type.
        Start symbol: file. *)

    | MenhirState349 : (((('s, _menhir_box_file) _menhir_cell1_LOGIC _menhir_cell0_ac_modifier, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_raw_named_ident_, _menhir_box_file) _menhir_cell1_loption_separated_nonempty_list_COMMA_primitive_type__, _menhir_box_file) _menhir_state
      (** State 349.
        Stack shape : LOGIC ac_modifier separated_nonempty_list(COMMA,raw_named_ident) loption(separated_nonempty_list(COMMA,primitive_type)).
        Start symbol: file. *)

    | MenhirState351 : ((((('s, _menhir_box_file) _menhir_cell1_LOGIC _menhir_cell0_ac_modifier, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_raw_named_ident_, _menhir_box_file) _menhir_cell1_loption_separated_nonempty_list_COMMA_primitive_type__, _menhir_box_file) _menhir_cell1_primitive_type, _menhir_box_file) _menhir_state
      (** State 351.
        Stack shape : LOGIC ac_modifier separated_nonempty_list(COMMA,raw_named_ident) loption(separated_nonempty_list(COMMA,primitive_type)) primitive_type.
        Start symbol: file. *)

    | MenhirState354 : (('s, _menhir_box_file) _menhir_cell1_raw_named_ident, _menhir_box_file) _menhir_state
      (** State 354.
        Stack shape : raw_named_ident.
        Start symbol: file. *)

    | MenhirState356 : (('s, _menhir_box_file) _menhir_cell1_GOAL, _menhir_box_file) _menhir_state
      (** State 356.
        Stack shape : GOAL.
        Start symbol: file. *)

    | MenhirState358 : ((('s, _menhir_box_file) _menhir_cell1_GOAL, _menhir_box_file) _menhir_cell1_decl_ident, _menhir_box_file) _menhir_state
      (** State 358.
        Stack shape : GOAL decl_ident.
        Start symbol: file. *)

    | MenhirState360 : (('s, _menhir_box_file) _menhir_cell1_CHECK_SAT, _menhir_box_file) _menhir_state
      (** State 360.
        Stack shape : CHECK_SAT.
        Start symbol: file. *)

    | MenhirState362 : ((('s, _menhir_box_file) _menhir_cell1_CHECK_SAT, _menhir_box_file) _menhir_cell1_decl_ident, _menhir_box_file) _menhir_state
      (** State 362.
        Stack shape : CHECK_SAT decl_ident.
        Start symbol: file. *)

    | MenhirState364 : (('s, _menhir_box_file) _menhir_cell1_AXIOM, _menhir_box_file) _menhir_state
      (** State 364.
        Stack shape : AXIOM.
        Start symbol: file. *)

    | MenhirState366 : ((('s, _menhir_box_file) _menhir_cell1_AXIOM, _menhir_box_file) _menhir_cell1_decl_ident, _menhir_box_file) _menhir_state
      (** State 366.
        Stack shape : AXIOM decl_ident.
        Start symbol: file. *)

    | MenhirState372 : (('s, _menhir_box_file) _menhir_cell1_decl, _menhir_box_file) _menhir_state
      (** State 372.
        Stack shape : decl.
        Start symbol: file. *)

  
  and 's _menhir_cell0_ac_modifier = 
    | MenhirCell0_ac_modifier of 's * (bool)
  
  and ('s, 'r) _menhir_cell1_algebraic_constructor = 
    | MenhirCell1_algebraic_constructor of 's * ('s, 'r) _menhir_state * (I.t * T.t list) * Lexing.position
  
  and ('s, 'r) _menhir_cell1_algebraic_label_with_type = 
    | MenhirCell1_algebraic_label_with_type of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_algebraic_typedef = 
    | MenhirCell1_algebraic_typedef of 's * ('s, 'r) _menhir_state * (S.t) * Lexing.position
  
  and ('s, 'r) _menhir_cell1_array_assignment = 
    | MenhirCell1_array_assignment of 's * ('s, 'r) _menhir_state * (T.t * T.t)
  
  and ('s, 'r) _menhir_cell1_bound = 
    | MenhirCell1_bound of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_decl = 
    | MenhirCell1_decl of 's * ('s, 'r) _menhir_state * (S.t)
  
  and ('s, 'r) _menhir_cell1_decl_ident = 
    | MenhirCell1_decl_ident of 's * ('s, 'r) _menhir_state * (I.t)
  
  and ('s, 'r) _menhir_cell1_filters = 
    | MenhirCell1_filters of 's * ('s, 'r) _menhir_state * (T.t list)
  
  and ('s, 'r) _menhir_cell1_ident = 
    | MenhirCell1_ident of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_label_expr = 
    | MenhirCell1_label_expr of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_let_binder = 
    | MenhirCell1_let_binder of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_lexpr = 
    | MenhirCell1_lexpr of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_lexpr_or_dom = 
    | MenhirCell1_lexpr_or_dom of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_logic_binder = 
    | MenhirCell1_logic_binder of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_loption_separated_nonempty_list_COMMA_logic_binder__ = 
    | MenhirCell1_loption_separated_nonempty_list_COMMA_logic_binder__ of 's * ('s, 'r) _menhir_state * (T.t list)
  
  and ('s, 'r) _menhir_cell1_loption_separated_nonempty_list_COMMA_primitive_type__ = 
    | MenhirCell1_loption_separated_nonempty_list_COMMA_primitive_type__ of 's * ('s, 'r) _menhir_state * (T.t list) * Lexing.position
  
  and ('s, 'r) _menhir_cell1_match_cases = 
    | MenhirCell1_match_cases of 's * ('s, 'r) _menhir_state * ((T.t * T.t) list)
  
  and ('s, 'r) _menhir_cell1_multi_logic_binder = 
    | MenhirCell1_multi_logic_binder of 's * ('s, 'r) _menhir_state * (T.t list)
  
  and ('s, 'r) _menhir_cell1_named_ident = 
    | MenhirCell1_named_ident of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position
  
  and ('s, 'r) _menhir_cell1_primitive_type = 
    | MenhirCell1_primitive_type of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_raw_ident = 
    | MenhirCell1_raw_ident of 's * ('s, 'r) _menhir_state * (I.namespace -> I.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_raw_named_ident = 
    | MenhirCell1_raw_named_ident of 's * ('s, 'r) _menhir_state * (I.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_record_label_with_type = 
    | MenhirCell1_record_label_with_type of 's * ('s, 'r) _menhir_state * (I.t * T.t)
  
  and ('s, 'r) _menhir_cell1_separated_nonempty_list_COMMA_let_binder_ = 
    | MenhirCell1_separated_nonempty_list_COMMA_let_binder_ of 's * ('s, 'r) _menhir_state * (T.t list)
  
  and ('s, 'r) _menhir_cell1_separated_nonempty_list_COMMA_multi_logic_binder_ = 
    | MenhirCell1_separated_nonempty_list_COMMA_multi_logic_binder_ of 's * ('s, 'r) _menhir_state * (T.t list list)
  
  and ('s, 'r) _menhir_cell1_separated_nonempty_list_COMMA_named_ident_ = 
    | MenhirCell1_separated_nonempty_list_COMMA_named_ident_ of 's * ('s, 'r) _menhir_state * (T.t list) * Lexing.position
  
  and ('s, 'r) _menhir_cell1_separated_nonempty_list_COMMA_primitive_type_ = 
    | MenhirCell1_separated_nonempty_list_COMMA_primitive_type_ of 's * ('s, 'r) _menhir_state * (T.t list) * Lexing.position
  
  and ('s, 'r) _menhir_cell1_separated_nonempty_list_COMMA_raw_named_ident_ = 
    | MenhirCell1_separated_nonempty_list_COMMA_raw_named_ident_ of 's * ('s, 'r) _menhir_state * (I.t list)
  
  and ('s, 'r) _menhir_cell1_simple_expr = 
    | MenhirCell1_simple_expr of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_simple_pattern = 
    | MenhirCell1_simple_pattern of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_sq = 
    | MenhirCell1_sq of 's * ('s, 'r) _menhir_state * (bool) * Lexing.position
  
  and ('s, 'r) _menhir_cell1_theory_elt = 
    | MenhirCell1_theory_elt of 's * ('s, 'r) _menhir_state * (S.t)
  
  and ('s, 'r) _menhir_cell1_trigger = 
    | MenhirCell1_trigger of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_triggers = 
    | MenhirCell1_triggers of 's * ('s, 'r) _menhir_state * (T.t list)
  
  and ('s, 'r) _menhir_cell1_type_var = 
    | MenhirCell1_type_var of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_type_vars = 
    | MenhirCell1_type_vars of 's * ('s, 'r) _menhir_state * (T.t list) * Lexing.position
  
  and ('s, 'r) _menhir_cell1_AXIOM = 
    | MenhirCell1_AXIOM of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_BAR = 
    | MenhirCell1_BAR of 's * ('s, 'r) _menhir_state
  
  and ('s, 'r) _menhir_cell1_CASESPLIT = 
    | MenhirCell1_CASESPLIT of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_CHECK = 
    | MenhirCell1_CHECK of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_CHECK_SAT = 
    | MenhirCell1_CHECK_SAT of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_COMMA = 
    | MenhirCell1_COMMA of 's * ('s, 'r) _menhir_state
  
  and ('s, 'r) _menhir_cell1_CUT = 
    | MenhirCell1_CUT of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_DISTINCT = 
    | MenhirCell1_DISTINCT of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_EQUAL = 
    | MenhirCell1_EQUAL of 's * ('s, 'r) _menhir_state
  
  and ('s, 'r) _menhir_cell1_EXISTS = 
    | MenhirCell1_EXISTS of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_FORALL = 
    | MenhirCell1_FORALL of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_FUNC = 
    | MenhirCell1_FUNC of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_GOAL = 
    | MenhirCell1_GOAL of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_IF = 
    | MenhirCell1_IF of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_LEFTBR = 
    | MenhirCell1_LEFTBR of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and 's _menhir_cell0_LEFTBR = 
    | MenhirCell0_LEFTBR of 's * Lexing.position
  
  and ('s, 'r) _menhir_cell1_LEFTPAR = 
    | MenhirCell1_LEFTPAR of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and 's _menhir_cell0_LEFTPAR = 
    | MenhirCell0_LEFTPAR of 's * Lexing.position
  
  and ('s, 'r) _menhir_cell1_LEFTSQ = 
    | MenhirCell1_LEFTSQ of 's * ('s, 'r) _menhir_state * Lexing.position * Lexing.position
  
  and 's _menhir_cell0_LEFTSQ = 
    | MenhirCell0_LEFTSQ of 's * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_LET = 
    | MenhirCell1_LET of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_LOGIC = 
    | MenhirCell1_LOGIC of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_MATCH = 
    | MenhirCell1_MATCH of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_MINUS = 
    | MenhirCell1_MINUS of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and 's _menhir_cell0_MINUS = 
    | MenhirCell0_MINUS of 's * Lexing.position
  
  and ('s, 'r) _menhir_cell1_NOT = 
    | MenhirCell1_NOT of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_PRED = 
    | MenhirCell1_PRED of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and 's _menhir_cell0_PV = 
    | MenhirCell0_PV of 's * Lexing.position
  
  and 's _menhir_cell0_QM = 
    | MenhirCell0_QM of 's * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_REWRITING = 
    | MenhirCell1_REWRITING of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and 's _menhir_cell0_RIGHTPAR = 
    | MenhirCell0_RIGHTPAR of 's * Lexing.position
  
  and ('s, 'r) _menhir_cell1_STRING = 
    | MenhirCell1_STRING of 's * ('s, 'r) _menhir_state * (
# 11 "src/languages/ae/tokens.mly"
       (string)
# 937 "src/languages/ae/parser.ml"
  ) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_THEORY = 
    | MenhirCell1_THEORY of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_TYPE = 
    | MenhirCell1_TYPE of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and _menhir_box_input = 
    | MenhirBox_input of (S.t option) [@@unboxed]
  
  and _menhir_box_file = 
    | MenhirBox_file of (S.t list) [@@unboxed]
  
  let _menhir_action_002 =
    fun () ->
      (
# 499 "src/languages/ae/parser.mly"
    ( false )
# 957 "src/languages/ae/parser.ml"
       : (bool))
  
  let _menhir_action_003 =
    fun () ->
      (
# 501 "src/languages/ae/parser.mly"
    ( true )
# 965 "src/languages/ae/parser.ml"
       : (bool))
  
  let _menhir_action_004 =
    fun () ->
      (
# 481 "src/languages/ae/parser.mly"
    ( [] )
# 973 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_005 =
    fun l ->
      (
# 483 "src/languages/ae/parser.mly"
    ( l )
# 981 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_006 =
    fun c l ->
      (
# 487 "src/languages/ae/parser.mly"
    ( c I.term, l )
# 989 "src/languages/ae/parser.ml"
       : (I.t * T.t list))
  
  let _menhir_action_007 =
    fun _endpos_ty_ _startpos_id_ id ty ->
      let _endpos = _endpos_ty_ in
      let _startpos = _startpos_id_ in
      (
# 477 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.colon ~loc id ty )
# 1000 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_008 =
    fun _endpos_l_ _startpos_vars_ c l vars ->
      let _endpos = _endpos_l_ in
      let _startpos = _startpos_vars_ in
      (
# 491 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      S.algebraic_type ~loc (c I.sort) vars l )
# 1011 "src/languages/ae/parser.ml"
       : (S.t))
  
  let _menhir_action_009 =
    fun e1 e2 ->
      (
# 392 "src/languages/ae/parser.mly"
    ( (e1, e2) )
# 1019 "src/languages/ae/parser.ml"
       : (T.t * T.t))
  
  let _menhir_action_010 =
    fun _endpos__1_ _startpos__1_ ->
      let _endpos = _endpos__1_ in
      let _startpos = _startpos__1_ in
      (
# 427 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      let v = I.mk I.term "?" in
      T.const ~loc v )
# 1031 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_011 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 432 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.const ~loc (I.mk I.term s) )
# 1042 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_012 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 432 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.const ~loc (I.mk I.term s) )
# 1053 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_013 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 435 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.int ~loc s )
# 1064 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_014 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 438 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.real ~loc s )
# 1075 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_015 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 441 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.hexa ~loc s )
# 1086 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_016 =
    fun _endpos_s_ _startpos__1_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos__1_ in
      (
# 444 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.int ~loc ("-" ^ s) )
# 1097 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_017 =
    fun _endpos_s_ _startpos__1_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos__1_ in
      (
# 447 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.real ~loc ("-" ^ s) )
# 1108 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_018 =
    fun _endpos_s_ _startpos__1_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos__1_ in
      (
# 450 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.hexa ~loc ("-" ^ s) )
# 1119 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_019 =
    fun _endpos__7_ _startpos__1_ ext id l ->
      let _endpos = _endpos__7_ in
      let _startpos = _startpos__1_ in
      (
# 543 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      S.theory ~loc id ext l )
# 1130 "src/languages/ae/parser.ml"
       : (S.t))
  
  let _menhir_action_020 =
    fun _endpos_id_ _startpos__1_ id vars ->
      let _endpos = _endpos_id_ in
      let _startpos = _startpos__1_ in
      (
# 547 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      S.abstract_type ~loc (id I.sort) vars )
# 1141 "src/languages/ae/parser.ml"
       : (S.t))
  
  let _menhir_action_021 =
    fun _endpos_l_ _startpos__1_ l ->
      let _endpos = _endpos_l_ in
      let _startpos = _startpos__1_ in
      (
# 551 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      S.rec_types ~loc l )
# 1152 "src/languages/ae/parser.ml"
       : (S.t))
  
  let _menhir_action_022 =
    fun _endpos_r_ _startpos__1_ id r vars ->
      let _endpos = _endpos_r_ in
      let _startpos = _startpos__1_ in
      (
# 555 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      S.record_type ~loc (id I.sort) vars r )
# 1163 "src/languages/ae/parser.ml"
       : (S.t))
  
  let _menhir_action_023 =
    fun _endpos_ty_ _startpos__1_ ac args ty ->
      let _endpos = _endpos_ty_ in
      let _startpos = _startpos__1_ in
      (
# 559 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      S.logic ~loc ~ac args ty )
# 1174 "src/languages/ae/parser.ml"
       : (S.t))
  
  let _menhir_action_024 =
    fun _endpos_l_ _startpos_l_ l ->
      let _endpos = _endpos_l_ in
      let _startpos = _startpos_l_ in
      (
# 563 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      S.defs ~loc l )
# 1185 "src/languages/ae/parser.ml"
       : (S.t))
  
  let _menhir_action_025 =
    fun _endpos_body_ _startpos__1_ body name ->
      let _endpos = _endpos_body_ in
      let _startpos = _startpos__1_ in
      (
# 567 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      S.axiom ~loc name body )
# 1196 "src/languages/ae/parser.ml"
       : (S.t))
  
  let _menhir_action_026 =
    fun _endpos_l_ _startpos__1_ l name ->
      let _endpos = _endpos_l_ in
      let _startpos = _startpos__1_ in
      (
# 571 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      S.rewriting ~loc name l )
# 1207 "src/languages/ae/parser.ml"
       : (S.t))
  
  let _menhir_action_027 =
    fun _endpos_body_ _startpos__1_ body name ->
      let _endpos = _endpos_body_ in
      let _startpos = _startpos__1_ in
      (
# 575 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      S.prove_goal ~loc name body )
# 1218 "src/languages/ae/parser.ml"
       : (S.t))
  
  let _menhir_action_028 =
    fun _endpos_body_ _startpos__1_ body name ->
      let _endpos = _endpos_body_ in
      let _startpos = _startpos__1_ in
      (
# 579 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      S.prove_sat ~loc ~name [body] )
# 1229 "src/languages/ae/parser.ml"
       : (S.t))
  
  let _menhir_action_029 =
    fun id ->
      (
# 37 "src/languages/ae/parser.mly"
    ( id I.decl )
# 1237 "src/languages/ae/parser.ml"
       : (I.t))
  
  let _menhir_action_030 =
    fun l ->
      (
# 17 "src/languages/ae/parser.mly"
                ( l )
# 1245 "src/languages/ae/parser.ml"
       : (S.t list))
  
  let _menhir_action_031 =
    fun () ->
      (
# 400 "src/languages/ae/parser.mly"
    ( [] )
# 1253 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_032 =
    fun l ->
      (
# 402 "src/languages/ae/parser.mly"
   ( l )
# 1261 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_033 =
    fun _endpos_id_ _startpos_id_ id ->
      let _endpos = _endpos_id_ in
      let _startpos = _startpos_id_ in
      (
# 41 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.const ~loc (id I.term) )
# 1272 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_034 =
    fun () ->
      (
# 24 "src/languages/ae/parser.mly"
        ( assert false )
# 1280 "src/languages/ae/parser.ml"
       : (S.t option))
  
  let _menhir_action_035 =
    fun _endpos_e_ _startpos_id_ e id ->
      let _endpos = _endpos_e_ in
      let _startpos = _startpos_id_ in
      (
# 461 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.eq ~loc id e )
# 1291 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_036 =
    fun _endpos_b_ _startpos_a_ a b ->
      let _endpos = _endpos_b_ in
      let _startpos = _startpos_a_ in
      (
# 311 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.eq ~loc a b )
# 1302 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_037 =
    fun e ->
      (
# 153 "src/languages/ae/parser.mly"
    ( e )
# 1310 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_038 =
    fun _endpos_p_ _startpos__1_ p ->
      let _endpos = _endpos_p_ in
      let _startpos = _startpos__1_ in
      (
# 158 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.not_ ~loc p )
# 1321 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_039 =
    fun _endpos_x_ _startpos__1_ x ->
      let _endpos = _endpos_x_ in
      let _startpos = _startpos__1_ in
      (
# 161 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.uminus ~loc x )
# 1332 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_040 =
    fun _endpos_b_ _startpos_a_ a b ->
      let _endpos = _endpos_b_ in
      let _startpos = _startpos_a_ in
      (
# 168 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.add ~loc a b )
# 1343 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_041 =
    fun _endpos_b_ _startpos_a_ a b ->
      let _endpos = _endpos_b_ in
      let _startpos = _startpos_a_ in
      (
# 171 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.sub ~loc a b )
# 1354 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_042 =
    fun _endpos_b_ _startpos_a_ a b ->
      let _endpos = _endpos_b_ in
      let _startpos = _startpos_a_ in
      (
# 174 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.mult ~loc a b )
# 1365 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_043 =
    fun _endpos_b_ _startpos_a_ a b ->
      let _endpos = _endpos_b_ in
      let _startpos = _startpos_a_ in
      (
# 177 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.div ~loc a b )
# 1376 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_044 =
    fun _endpos_b_ _startpos_a_ a b ->
      let _endpos = _endpos_b_ in
      let _startpos = _startpos_a_ in
      (
# 180 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.mod_ ~loc a b )
# 1387 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_045 =
    fun _endpos_b_ _startpos_a_ a b ->
      let _endpos = _endpos_b_ in
      let _startpos = _startpos_a_ in
      (
# 183 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.int_pow ~loc a b )
# 1398 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_046 =
    fun _endpos_b_ _startpos_a_ a b ->
      let _endpos = _endpos_b_ in
      let _startpos = _startpos_a_ in
      (
# 186 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.real_pow ~loc a b )
# 1409 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_047 =
    fun _endpos_q_ _startpos_p_ p q ->
      let _endpos = _endpos_q_ in
      let _startpos = _startpos_p_ in
      (
# 190 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.and_ ~loc [p; q] )
# 1420 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_048 =
    fun _endpos_q_ _startpos_p_ p q ->
      let _endpos = _endpos_q_ in
      let _startpos = _startpos_p_ in
      (
# 193 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
    T.or_ ~loc [p; q] )
# 1431 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_049 =
    fun _endpos_q_ _startpos_p_ p q ->
      let _endpos = _endpos_q_ in
      let _startpos = _startpos_p_ in
      (
# 196 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.xor ~loc p q )
# 1442 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_050 =
    fun _endpos_q_ _startpos_p_ p q ->
      let _endpos = _endpos_q_ in
      let _startpos = _startpos_p_ in
      (
# 199 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.equiv ~loc p q )
# 1453 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_051 =
    fun _endpos_q_ _startpos_p_ p q ->
      let _endpos = _endpos_q_ in
      let _startpos = _startpos_p_ in
      (
# 202 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.imply ~loc p q )
# 1464 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_052 =
    fun _endpos_b_ _startpos_a_ a b ->
      let _endpos = _endpos_b_ in
      let _startpos = _startpos_a_ in
      (
# 206 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.lt ~loc a b )
# 1475 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_053 =
    fun _endpos_b_ _startpos_a_ a b ->
      let _endpos = _endpos_b_ in
      let _startpos = _startpos_a_ in
      (
# 209 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.leq ~loc a b )
# 1486 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_054 =
    fun _endpos_b_ _startpos_a_ a b ->
      let _endpos = _endpos_b_ in
      let _startpos = _startpos_a_ in
      (
# 212 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.gt ~loc a b )
# 1497 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_055 =
    fun _endpos_b_ _startpos_a_ a b ->
      let _endpos = _endpos_b_ in
      let _startpos = _startpos_a_ in
      (
# 215 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.geq ~loc a b )
# 1508 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_056 =
    fun _endpos_b_ _startpos_a_ a b ->
      let _endpos = _endpos_b_ in
      let _startpos = _startpos_a_ in
      (
# 219 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.eq ~loc a b )
# 1519 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_057 =
    fun _endpos_b_ _startpos_a_ a b ->
      let _endpos = _endpos_b_ in
      let _startpos = _startpos_a_ in
      (
# 222 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.neq ~loc [a; b] )
# 1530 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_058 =
    fun _endpos__5_ _startpos__1_ c ->
      let _endpos = _endpos__5_ in
      let _startpos = _startpos__1_ in
      (
# 229 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.bitv ~loc c )
# 1541 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_059 =
    fun _endpos__7_ _startpos_e_ e i j ->
      let _endpos = _endpos__7_ in
      let _startpos = _startpos_e_ in
      (
# 232 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      let i, j =
        match int_of_string i, int_of_string j with
        | i, j -> i, j
        | exception Invalid_argument _ -> assert false
      in
      T.bitv_extract ~loc e i j )
# 1557 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_060 =
    fun _endpos_f_ _startpos_e_ e f ->
      let _endpos = _endpos_f_ in
      let _startpos = _startpos_e_ in
      (
# 240 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.bitv_concat ~loc e f )
# 1568 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_061 =
    fun _endpos__4_ _startpos__1_ l ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 247 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.neq ~loc l )
# 1579 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_062 =
    fun _endpos_else_t_ _startpos__1_ cond else_t then_t ->
      let _endpos = _endpos_else_t_ in
      let _startpos = _startpos__1_ in
      (
# 251 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.ite ~loc cond then_t else_t )
# 1590 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_063 =
    fun _endpos_body_ _startpos__1_ body filters triggers vars ->
      let _endpos = _endpos_body_ in
      let _startpos = _startpos__1_ in
      (
# 256 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      let body = T.triggers ~loc body triggers in
      let body = T.filters ~loc body filters in
      T.forall ~loc (List.flatten vars) body )
# 1603 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_064 =
    fun _endpos_body_ _startpos__1_ body filters triggers vars ->
      let _endpos = _endpos_body_ in
      let _startpos = _startpos__1_ in
      (
# 262 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      let body = T.triggers ~loc body triggers in
      let body = T.filters ~loc body filters in
      T.exists ~loc (List.flatten vars) body )
# 1616 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_065 =
    fun _endpos_e_ _startpos_name_ e name ->
      let _endpos = _endpos_e_ in
      let _startpos = _startpos_name_ in
      (
# 268 "src/languages/ae/parser.mly"
   ( let loc = L.mk_pos _startpos _endpos in
     let id = I.mk I.track name in
     T.tracked ~loc id e )
# 1628 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_066 =
    fun _endpos_body_ _startpos__1_ body l ->
      let _endpos = _endpos_body_ in
      let _startpos = _startpos__1_ in
      (
# 273 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.letin ~loc l body )
# 1639 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_067 =
    fun _endpos_e_ _startpos__1_ e ->
      let _endpos = _endpos_e_ in
      let _startpos = _startpos__1_ in
      (
# 277 "src/languages/ae/parser.mly"
   ( let loc = L.mk_pos _startpos _endpos in
     T.check ~loc e )
# 1650 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_068 =
    fun _endpos_e_ _startpos__1_ e ->
      let _endpos = _endpos_e_ in
      let _startpos = _startpos__1_ in
      (
# 281 "src/languages/ae/parser.mly"
   ( let loc = L.mk_pos _startpos _endpos in
     T.cut ~loc e )
# 1661 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_069 =
    fun _endpos__5_ _startpos__1_ cases e ->
      let _endpos = _endpos__5_ in
      let _startpos = _startpos__1_ in
      (
# 288 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.match_ ~loc e (List.rev cases) )
# 1672 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_070 =
    fun e ->
      (
# 411 "src/languages/ae/parser.mly"
    ( e )
# 1680 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_071 =
    fun _endpos_rs_ _startpos_e_ e lb ls rb rs ->
      let _endpos = _endpos_rs_ in
      let _startpos = _startpos_e_ in
      (
# 413 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.in_interval ~loc e (lb, not ls) (rb, rs) )
# 1691 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_072 =
    fun _endpos_e_ _startpos_id_ e id ->
      let _endpos = _endpos_e_ in
      let _startpos = _startpos_id_ in
      (
# 416 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.maps_to ~loc (id I.term) e )
# 1702 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_073 =
    fun () ->
      (
# 216 "<standard.mly>"
    ( [] )
# 1710 "src/languages/ae/parser.ml"
       : (S.t list))
  
  let _menhir_action_074 =
    fun x xs ->
      (
# 219 "<standard.mly>"
    ( x :: xs )
# 1718 "src/languages/ae/parser.ml"
       : (S.t list))
  
  let _menhir_action_075 =
    fun () ->
      (
# 216 "<standard.mly>"
    ( [] )
# 1726 "src/languages/ae/parser.ml"
       : (S.t list))
  
  let _menhir_action_076 =
    fun x xs ->
      (
# 219 "<standard.mly>"
    ( x :: xs )
# 1734 "src/languages/ae/parser.ml"
       : (S.t list))
  
  let _menhir_action_077 =
    fun e1 e2 ->
      (
# 455 "src/languages/ae/parser.mly"
    ( [e1; e2] )
# 1742 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_078 =
    fun e l ->
      (
# 457 "src/languages/ae/parser.mly"
    ( e :: l )
# 1750 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_079 =
    fun _endpos_ty_ _startpos_v_ ty v ->
      let _endpos = _endpos_ty_ in
      let _startpos = _startpos_v_ in
      (
# 66 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.colon ~loc v ty )
# 1761 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_080 =
    fun ty ->
      (
# 143 "src/languages/ae/parser.mly"
    ( ty )
# 1769 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_081 =
    fun _endpos_ret_ _startpos_xs_ ret xs ->
      let l = 
# 241 "<standard.mly>"
    ( xs )
# 1777 "src/languages/ae/parser.ml"
       in
      let _startpos_l_ = _startpos_xs_ in
      let _endpos = _endpos_ret_ in
      let _startpos = _startpos_l_ in
      (
# 145 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      List.fold_right (T.arrow ~loc) l ret )
# 1786 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_082 =
    fun () ->
      (
# 145 "<standard.mly>"
    ( [] )
# 1794 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_083 =
    fun x ->
      (
# 148 "<standard.mly>"
    ( x )
# 1802 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_084 =
    fun () ->
      (
# 145 "<standard.mly>"
    ( [] )
# 1810 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_085 =
    fun x ->
      (
# 148 "<standard.mly>"
    ( x )
# 1818 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_086 =
    fun () ->
      (
# 145 "<standard.mly>"
    ( [] )
# 1826 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_087 =
    fun x ->
      (
# 148 "<standard.mly>"
    ( x )
# 1834 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_088 =
    fun e p ->
      (
# 293 "src/languages/ae/parser.mly"
    ( p, e )
# 1842 "src/languages/ae/parser.ml"
       : (T.t * T.t))
  
  let _menhir_action_089 =
    fun c ->
      (
# 298 "src/languages/ae/parser.mly"
    ( [c] )
# 1850 "src/languages/ae/parser.ml"
       : ((T.t * T.t) list))
  
  let _menhir_action_090 =
    fun c ->
      (
# 298 "src/languages/ae/parser.mly"
    ( [c] )
# 1858 "src/languages/ae/parser.ml"
       : ((T.t * T.t) list))
  
  let _menhir_action_091 =
    fun c l ->
      (
# 300 "src/languages/ae/parser.mly"
    ( c :: l )
# 1866 "src/languages/ae/parser.ml"
       : ((T.t * T.t) list))
  
  let _menhir_action_092 =
    fun _endpos_ty_ _startpos_vars_ ty vars ->
      let _endpos = _endpos_ty_ in
      let _startpos = _startpos_vars_ in
      (
# 71 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      List.map (fun x -> T.colon ~loc x ty) vars )
# 1877 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_093 =
    fun _endpos_id_ _startpos_id_ id ->
      let _endpos = _endpos_id_ in
      let _startpos = _startpos_id_ in
      (
# 53 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.const ~loc id )
# 1888 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_094 =
    fun _endpos__1_ _startpos__1_ ->
      let _endpos = _endpos__1_ in
      let _startpos = _startpos__1_ in
      (
# 96 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.bool ~loc () )
# 1899 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_095 =
    fun _endpos__1_ _startpos__1_ ->
      let _endpos = _endpos__1_ in
      let _startpos = _startpos__1_ in
      (
# 99 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.ty_unit ~loc () )
# 1910 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_096 =
    fun _endpos__1_ _startpos__1_ ->
      let _endpos = _endpos__1_ in
      let _startpos = _startpos__1_ in
      (
# 102 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.ty_int ~loc () )
# 1921 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_097 =
    fun _endpos__1_ _startpos__1_ ->
      let _endpos = _endpos__1_ in
      let _startpos = _startpos__1_ in
      (
# 105 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.ty_real ~loc () )
# 1932 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_098 =
    fun _endpos__4_ _startpos__1_ sz ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 109 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      let n =
        (* The lexer should guarantee that the length of a bitv is
         * a syntactically correct integer. *)
        match int_of_string sz with
        | i -> i
        | exception Invalid_argument _ -> assert false
      in
      T.ty_bitv ~loc n )
# 1950 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_099 =
    fun _endpos_c_ _startpos_c_ c ->
      let _endpos = _endpos_c_ in
      let _startpos = _startpos_c_ in
      (
# 120 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.apply ~loc c [] )
# 1961 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_100 =
    fun v ->
      (
# 124 "src/languages/ae/parser.mly"
    ( v )
# 1969 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_101 =
    fun _endpos_c_ _startpos_arg_ arg c ->
      let _endpos = _endpos_c_ in
      let _startpos = _startpos_arg_ in
      (
# 127 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.apply ~loc c [arg] )
# 1980 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_102 =
    fun _endpos_c_ _startpos__1_ args c ->
      let _endpos = _endpos_c_ in
      let _startpos = _startpos__1_ in
      (
# 131 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.apply ~loc c args )
# 1991 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_103 =
    fun ty ->
      (
# 136 "src/languages/ae/parser.mly"
    ( ty )
# 1999 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_104 =
    fun _endpos__1_ _startpos__1_ ->
      let _endpos = _endpos__1_ in
      let _startpos = _startpos__1_ in
      (
# 138 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.prop ~loc () )
# 2010 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_105 =
    fun id ->
      (
# 33 "src/languages/ae/parser.mly"
    ( (fun ns -> I.mk ns id) )
# 2018 "src/languages/ae/parser.ml"
       : (I.namespace -> I.t))
  
  let _menhir_action_106 =
    fun id ->
      (
# 46 "src/languages/ae/parser.mly"
    ( I.mk I.term id )
# 2026 "src/languages/ae/parser.ml"
       : (I.t))
  
  let _menhir_action_107 =
    fun id str ->
      (
# 48 "src/languages/ae/parser.mly"
    ( let track = I.mk I.track str in
      I.tracked ~track I.term id )
# 2035 "src/languages/ae/parser.ml"
       : (I.t))
  
  let _menhir_action_108 =
    fun id ty ->
      (
# 469 "src/languages/ae/parser.mly"
    ( id I.term, ty )
# 2043 "src/languages/ae/parser.ml"
       : (I.t * T.t))
  
  let _menhir_action_109 =
    fun l ->
      (
# 473 "src/languages/ae/parser.mly"
    ( l )
# 2051 "src/languages/ae/parser.ml"
       : ((I.t * T.t) list))
  
  let _menhir_action_110 =
    fun e ->
      (
# 515 "src/languages/ae/parser.mly"
    ( [e] )
# 2059 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_111 =
    fun e ->
      (
# 515 "src/languages/ae/parser.mly"
    ( [e] )
# 2067 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_112 =
    fun e l ->
      (
# 517 "src/languages/ae/parser.mly"
    ( e :: l )
# 2075 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_113 =
    fun x ->
      (
# 250 "<standard.mly>"
    ( [ x ] )
# 2083 "src/languages/ae/parser.ml"
       : (S.t list))
  
  let _menhir_action_114 =
    fun x xs ->
      (
# 253 "<standard.mly>"
    ( x :: xs )
# 2091 "src/languages/ae/parser.ml"
       : (S.t list))
  
  let _menhir_action_115 =
    fun _endpos_body_ _startpos__1_ body f ret_ty xs ->
      let x =
        let s =
          let args = 
# 241 "<standard.mly>"
    ( xs )
# 2101 "src/languages/ae/parser.ml"
           in
          let _endpos = _endpos_body_ in
          let _startpos = _startpos__1_ in
          
# 523 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      S.fun_def ~loc f [] args ret_ty body )
# 2109 "src/languages/ae/parser.ml"
          
        in
        
# 539 "src/languages/ae/parser.mly"
    ( s )
# 2115 "src/languages/ae/parser.ml"
        
      in
      (
# 250 "<standard.mly>"
    ( [ x ] )
# 2121 "src/languages/ae/parser.ml"
       : (S.t list))
  
  let _menhir_action_116 =
    fun _endpos_body_ _startpos__1_ body p ->
      let x =
        let s =
          let _endpos = _endpos_body_ in
          let _startpos = _startpos__1_ in
          
# 528 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      S.pred_def ~loc p [] [] body )
# 2134 "src/languages/ae/parser.ml"
          
        in
        
# 539 "src/languages/ae/parser.mly"
    ( s )
# 2140 "src/languages/ae/parser.ml"
        
      in
      (
# 250 "<standard.mly>"
    ( [ x ] )
# 2146 "src/languages/ae/parser.ml"
       : (S.t list))
  
  let _menhir_action_117 =
    fun _endpos_body_ _startpos__1_ body p xs ->
      let x =
        let s =
          let args = 
# 241 "<standard.mly>"
    ( xs )
# 2156 "src/languages/ae/parser.ml"
           in
          let _endpos = _endpos_body_ in
          let _startpos = _startpos__1_ in
          
# 533 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      S.pred_def ~loc p [] args body )
# 2164 "src/languages/ae/parser.ml"
          
        in
        
# 539 "src/languages/ae/parser.mly"
    ( s )
# 2170 "src/languages/ae/parser.ml"
        
      in
      (
# 250 "<standard.mly>"
    ( [ x ] )
# 2176 "src/languages/ae/parser.ml"
       : (S.t list))
  
  let _menhir_action_118 =
    fun _endpos_body_ _startpos__1_ body f ret_ty xs xs_inlined1 ->
      let x =
        let xs = xs_inlined1 in
        let s =
          let args = 
# 241 "<standard.mly>"
    ( xs )
# 2187 "src/languages/ae/parser.ml"
           in
          let _endpos = _endpos_body_ in
          let _startpos = _startpos__1_ in
          
# 523 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      S.fun_def ~loc f [] args ret_ty body )
# 2195 "src/languages/ae/parser.ml"
          
        in
        
# 539 "src/languages/ae/parser.mly"
    ( s )
# 2201 "src/languages/ae/parser.ml"
        
      in
      (
# 253 "<standard.mly>"
    ( x :: xs )
# 2207 "src/languages/ae/parser.ml"
       : (S.t list))
  
  let _menhir_action_119 =
    fun _endpos_body_ _startpos__1_ body p xs ->
      let x =
        let s =
          let _endpos = _endpos_body_ in
          let _startpos = _startpos__1_ in
          
# 528 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      S.pred_def ~loc p [] [] body )
# 2220 "src/languages/ae/parser.ml"
          
        in
        
# 539 "src/languages/ae/parser.mly"
    ( s )
# 2226 "src/languages/ae/parser.ml"
        
      in
      (
# 253 "<standard.mly>"
    ( x :: xs )
# 2232 "src/languages/ae/parser.ml"
       : (S.t list))
  
  let _menhir_action_120 =
    fun _endpos_body_ _startpos__1_ body p xs xs_inlined1 ->
      let x =
        let xs = xs_inlined1 in
        let s =
          let args = 
# 241 "<standard.mly>"
    ( xs )
# 2243 "src/languages/ae/parser.ml"
           in
          let _endpos = _endpos_body_ in
          let _startpos = _startpos__1_ in
          
# 533 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      S.pred_def ~loc p [] args body )
# 2251 "src/languages/ae/parser.ml"
          
        in
        
# 539 "src/languages/ae/parser.mly"
    ( s )
# 2257 "src/languages/ae/parser.ml"
        
      in
      (
# 253 "<standard.mly>"
    ( x :: xs )
# 2263 "src/languages/ae/parser.ml"
       : (S.t list))
  
  let _menhir_action_121 =
    fun x ->
      (
# 250 "<standard.mly>"
    ( [ x ] )
# 2271 "src/languages/ae/parser.ml"
       : ((I.t * T.t list) list))
  
  let _menhir_action_122 =
    fun x xs ->
      (
# 253 "<standard.mly>"
    ( x :: xs )
# 2279 "src/languages/ae/parser.ml"
       : ((I.t * T.t list) list))
  
  let _menhir_action_123 =
    fun x ->
      (
# 250 "<standard.mly>"
    ( [ x ] )
# 2287 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_124 =
    fun x xs ->
      (
# 253 "<standard.mly>"
    ( x :: xs )
# 2295 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_125 =
    fun x ->
      (
# 250 "<standard.mly>"
    ( [ x ] )
# 2303 "src/languages/ae/parser.ml"
       : ((T.t * T.t) list))
  
  let _menhir_action_126 =
    fun x xs ->
      (
# 253 "<standard.mly>"
    ( x :: xs )
# 2311 "src/languages/ae/parser.ml"
       : ((T.t * T.t) list))
  
  let _menhir_action_127 =
    fun x ->
      (
# 250 "<standard.mly>"
    ( [ x ] )
# 2319 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_128 =
    fun x xs ->
      (
# 253 "<standard.mly>"
    ( x :: xs )
# 2327 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_129 =
    fun x ->
      (
# 250 "<standard.mly>"
    ( [ x ] )
# 2335 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_130 =
    fun x xs ->
      (
# 253 "<standard.mly>"
    ( x :: xs )
# 2343 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_131 =
    fun x ->
      (
# 250 "<standard.mly>"
    ( [ x ] )
# 2351 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_132 =
    fun x xs ->
      (
# 253 "<standard.mly>"
    ( x :: xs )
# 2359 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_133 =
    fun x ->
      (
# 250 "<standard.mly>"
    ( [ x ] )
# 2367 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_134 =
    fun x xs ->
      (
# 253 "<standard.mly>"
    ( x :: xs )
# 2375 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_135 =
    fun x ->
      (
# 250 "<standard.mly>"
    ( [ x ] )
# 2383 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_136 =
    fun x xs ->
      (
# 253 "<standard.mly>"
    ( x :: xs )
# 2391 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_137 =
    fun x ->
      (
# 250 "<standard.mly>"
    ( [ x ] )
# 2399 "src/languages/ae/parser.ml"
       : (T.t list list))
  
  let _menhir_action_138 =
    fun x xs ->
      (
# 253 "<standard.mly>"
    ( x :: xs )
# 2407 "src/languages/ae/parser.ml"
       : (T.t list list))
  
  let _menhir_action_139 =
    fun x ->
      (
# 250 "<standard.mly>"
    ( [ x ] )
# 2415 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_140 =
    fun x xs ->
      (
# 253 "<standard.mly>"
    ( x :: xs )
# 2423 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_141 =
    fun x ->
      (
# 250 "<standard.mly>"
    ( [ x ] )
# 2431 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_142 =
    fun x xs ->
      (
# 253 "<standard.mly>"
    ( x :: xs )
# 2439 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_143 =
    fun x ->
      (
# 250 "<standard.mly>"
    ( [ x ] )
# 2447 "src/languages/ae/parser.ml"
       : (I.t list))
  
  let _menhir_action_144 =
    fun x xs ->
      (
# 253 "<standard.mly>"
    ( x :: xs )
# 2455 "src/languages/ae/parser.ml"
       : (I.t list))
  
  let _menhir_action_145 =
    fun x ->
      (
# 250 "<standard.mly>"
    ( [ x ] )
# 2463 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_146 =
    fun x xs ->
      (
# 253 "<standard.mly>"
    ( x :: xs )
# 2471 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_147 =
    fun x ->
      (
# 250 "<standard.mly>"
    ( [ x ] )
# 2479 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_148 =
    fun x xs ->
      (
# 253 "<standard.mly>"
    ( x :: xs )
# 2487 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_149 =
    fun x ->
      (
# 250 "<standard.mly>"
    ( [ x ] )
# 2495 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_150 =
    fun x xs ->
      (
# 253 "<standard.mly>"
    ( x :: xs )
# 2503 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_151 =
    fun x ->
      (
# 250 "<standard.mly>"
    ( [ x ] )
# 2511 "src/languages/ae/parser.ml"
       : ((I.t * T.t) list))
  
  let _menhir_action_152 =
    fun x xs ->
      (
# 253 "<standard.mly>"
    ( x :: xs )
# 2519 "src/languages/ae/parser.ml"
       : ((I.t * T.t) list))
  
  let _menhir_action_153 =
    fun t ->
      (
# 316 "src/languages/ae/parser.mly"
    ( t )
# 2527 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_154 =
    fun e ->
      (
# 318 "src/languages/ae/parser.mly"
    ( e )
# 2535 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_155 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 321 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.int ~loc s )
# 2546 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_156 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 324 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.real ~loc s )
# 2557 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_157 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 327 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.hexa ~loc s )
# 2568 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_158 =
    fun _endpos__1_ _startpos__1_ ->
      let _endpos = _endpos__1_ in
      let _startpos = _startpos__1_ in
      (
# 331 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.true_ ~loc () )
# 2579 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_159 =
    fun _endpos__1_ _startpos__1_ ->
      let _endpos = _endpos__1_ in
      let _startpos = _startpos__1_ in
      (
# 334 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.false_ ~loc () )
# 2590 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_160 =
    fun _endpos__1_ _startpos__1_ ->
      let _endpos = _endpos__1_ in
      let _startpos = _startpos__1_ in
      (
# 337 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.void ~loc () )
# 2601 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_161 =
    fun _endpos__3_ _startpos__1_ l ->
      let _endpos = _endpos__3_ in
      let _startpos = _startpos__1_ in
      (
# 344 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.record ~loc l )
# 2612 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_162 =
    fun _endpos__5_ _startpos__1_ l s ->
      let _endpos = _endpos__5_ in
      let _startpos = _startpos__1_ in
      (
# 347 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.record_with ~loc s l )
# 2623 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_163 =
    fun _endpos_label_ _startpos_s_ label s ->
      let _endpos = _endpos_label_ in
      let _startpos = _startpos_s_ in
      (
# 350 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.record_access ~loc s (label I.term) )
# 2634 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_164 =
    fun _endpos__4_ _startpos_f_ f xs ->
      let args = 
# 241 "<standard.mly>"
    ( xs )
# 2642 "src/languages/ae/parser.ml"
       in
      let _endpos = _endpos__4_ in
      let _startpos = _startpos_f_ in
      (
# 357 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.apply ~loc f args )
# 2650 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_165 =
    fun _endpos__4_ _startpos_s_ e s ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos_s_ in
      (
# 364 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.array_get ~loc s e )
# 2661 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_166 =
    fun _endpos__4_ _startpos_s_ l s ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos_s_ in
      (
# 368 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      List.fold_left (fun acc (idx, value) ->
        T.array_set ~loc acc idx value
      ) s l )
# 2674 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_167 =
    fun _endpos_ty_ _startpos_s_ s ty ->
      let _endpos = _endpos_ty_ in
      let _startpos = _startpos_s_ in
      (
# 375 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.colon ~loc s ty )
# 2685 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_168 =
    fun _endpos_id_ _startpos_s_ id s ->
      let _endpos = _endpos_id_ in
      let _startpos = _startpos_s_ in
      (
# 379 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.adt_check ~loc s (id I.term) )
# 2696 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_169 =
    fun _endpos_c_ _startpos_s_ c s ->
      let _endpos = _endpos_c_ in
      let _startpos = _startpos_s_ in
      (
# 383 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.adt_check ~loc s (I.mk I.term c) )
# 2707 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_170 =
    fun _endpos_label_ _startpos_s_ label s ->
      let _endpos = _endpos_label_ in
      let _startpos = _startpos_s_ in
      (
# 387 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.adt_project ~loc s (label I.term) )
# 2718 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_171 =
    fun t ->
      (
# 304 "src/languages/ae/parser.mly"
    ( t )
# 2726 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_172 =
    fun _endpos__4_ _startpos_f_ args f ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos_f_ in
      (
# 306 "src/languages/ae/parser.mly"
   ( let loc = L.mk_pos _startpos _endpos in
     T.apply ~loc f args )
# 2737 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_173 =
    fun () ->
      (
# 421 "src/languages/ae/parser.mly"
    ( true )
# 2745 "src/languages/ae/parser.ml"
       : (bool))
  
  let _menhir_action_174 =
    fun () ->
      (
# 423 "src/languages/ae/parser.mly"
    ( false )
# 2753 "src/languages/ae/parser.ml"
       : (bool))
  
  let _menhir_action_175 =
    fun _endpos_body_ _startpos__1_ body name ->
      let _endpos = _endpos_body_ in
      let _startpos = _startpos__1_ in
      (
# 505 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      S.axiom ~loc name body )
# 2764 "src/languages/ae/parser.ml"
       : (S.t))
  
  let _menhir_action_176 =
    fun _endpos_body_ _startpos__1_ body name ->
      let _endpos = _endpos_body_ in
      let _startpos = _startpos__1_ in
      (
# 509 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      S.case_split ~loc name body )
# 2775 "src/languages/ae/parser.ml"
       : (S.t))
  
  let _menhir_action_177 =
    fun _endpos_l_ _startpos_l_ l ->
      let _endpos = _endpos_l_ in
      let _startpos = _startpos_l_ in
      (
# 406 "src/languages/ae/parser.mly"
   ( let loc = L.mk_pos _startpos _endpos in
     T.trigger ~loc l )
# 2786 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_178 =
    fun () ->
      (
# 395 "src/languages/ae/parser.mly"
    ( [] )
# 2794 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_179 =
    fun l ->
      (
# 397 "src/languages/ae/parser.mly"
    ( l )
# 2802 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_180 =
    fun _endpos_id_ _startpos_id_ id ->
      let _endpos = _endpos_id_ in
      let _startpos = _startpos_id_ in
      (
# 58 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.const ~loc (id I.sort) )
# 2813 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_181 =
    fun _endpos_id_ _startpos__1_ id ->
      let _endpos = _endpos_id_ in
      let _startpos = _startpos__1_ in
      (
# 79 "src/languages/ae/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      let v = I.mk I.var ("'" ^ id) in
      T.const ~loc v )
# 2825 "src/languages/ae/parser.ml"
       : (T.t))
  
  let _menhir_action_182 =
    fun () ->
      (
# 84 "src/languages/ae/parser.mly"
    ( [] )
# 2833 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_183 =
    fun v ->
      (
# 86 "src/languages/ae/parser.mly"
    ( [v] )
# 2841 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_action_184 =
    fun l ->
      (
# 88 "src/languages/ae/parser.mly"
    ( l )
# 2849 "src/languages/ae/parser.ml"
       : (T.t list))
  
  let _menhir_print_token : token -> string =
    fun _tok ->
      match _tok with
      | Tokens.AC ->
          "AC"
      | Tokens.AND ->
          "AND"
      | Tokens.AT ->
          "AT"
      | Tokens.AXIOM ->
          "AXIOM"
      | Tokens.BAR ->
          "BAR"
      | Tokens.BITV ->
          "BITV"
      | Tokens.BOOL ->
          "BOOL"
      | Tokens.CASESPLIT ->
          "CASESPLIT"
      | Tokens.CHECK ->
          "CHECK"
      | Tokens.CHECK_SAT ->
          "CHECK_SAT"
      | Tokens.COLON ->
          "COLON"
      | Tokens.COMMA ->
          "COMMA"
      | Tokens.CUT ->
          "CUT"
      | Tokens.DECIMAL _ ->
          "DECIMAL"
      | Tokens.DISTINCT ->
          "DISTINCT"
      | Tokens.DOT ->
          "DOT"
      | Tokens.ELSE ->
          "ELSE"
      | Tokens.END ->
          "END"
      | Tokens.EOF ->
          "EOF"
      | Tokens.EQUAL ->
          "EQUAL"
      | Tokens.EXISTS ->
          "EXISTS"
      | Tokens.EXTENDS ->
          "EXTENDS"
      | Tokens.FALSE ->
          "FALSE"
      | Tokens.FORALL ->
          "FORALL"
      | Tokens.FUNC ->
          "FUNC"
      | Tokens.GE ->
          "GE"
      | Tokens.GOAL ->
          "GOAL"
      | Tokens.GT ->
          "GT"
      | Tokens.HAT ->
          "HAT"
      | Tokens.HEXADECIMAL _ ->
          "HEXADECIMAL"
      | Tokens.ID _ ->
          "ID"
      | Tokens.IF ->
          "IF"
      | Tokens.IN ->
          "IN"
      | Tokens.INT ->
          "INT"
      | Tokens.INTEGER _ ->
          "INTEGER"
      | Tokens.LE ->
          "LE"
      | Tokens.LEFTARROW ->
          "LEFTARROW"
      | Tokens.LEFTBR ->
          "LEFTBR"
      | Tokens.LEFTPAR ->
          "LEFTPAR"
      | Tokens.LEFTSQ ->
          "LEFTSQ"
      | Tokens.LET ->
          "LET"
      | Tokens.LOGIC ->
          "LOGIC"
      | Tokens.LRARROW ->
          "LRARROW"
      | Tokens.LT ->
          "LT"
      | Tokens.MAPS_TO ->
          "MAPS_TO"
      | Tokens.MATCH ->
          "MATCH"
      | Tokens.MINUS ->
          "MINUS"
      | Tokens.NOT ->
          "NOT"
      | Tokens.NOTEQ ->
          "NOTEQ"
      | Tokens.OF ->
          "OF"
      | Tokens.OR ->
          "OR"
      | Tokens.PERCENT ->
          "PERCENT"
      | Tokens.PLUS ->
          "PLUS"
      | Tokens.POW ->
          "POW"
      | Tokens.POWDOT ->
          "POWDOT"
      | Tokens.PRED ->
          "PRED"
      | Tokens.PROP ->
          "PROP"
      | Tokens.PV ->
          "PV"
      | Tokens.QM ->
          "QM"
      | Tokens.QM_ID _ ->
          "QM_ID"
      | Tokens.QUOTE ->
          "QUOTE"
      | Tokens.REAL ->
          "REAL"
      | Tokens.REWRITING ->
          "REWRITING"
      | Tokens.RIGHTARROW ->
          "RIGHTARROW"
      | Tokens.RIGHTBR ->
          "RIGHTBR"
      | Tokens.RIGHTPAR ->
          "RIGHTPAR"
      | Tokens.RIGHTSQ ->
          "RIGHTSQ"
      | Tokens.SHARP ->
          "SHARP"
      | Tokens.SLASH ->
          "SLASH"
      | Tokens.STRING _ ->
          "STRING"
      | Tokens.THEN ->
          "THEN"
      | Tokens.THEORY ->
          "THEORY"
      | Tokens.TIMES ->
          "TIMES"
      | Tokens.TRUE ->
          "TRUE"
      | Tokens.TYPE ->
          "TYPE"
      | Tokens.UNIT ->
          "UNIT"
      | Tokens.VOID ->
          "VOID"
      | Tokens.WITH ->
          "WITH"
      | Tokens.XOR ->
          "XOR"
  
  let _menhir_fail : unit -> 'a =
    fun () ->
      Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
      assert false
  
  include struct
    
    [@@@ocaml.warning "-4-37"]
    
    let _menhir_run_369 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_file =
      fun _menhir_stack _v ->
        let l = _v in
        let _v = _menhir_action_030 l in
        MenhirBox_file _v
    
    let rec _menhir_run_373 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_decl -> _ -> _menhir_box_file =
      fun _menhir_stack _v ->
        let MenhirCell1_decl (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_074 x xs in
        _menhir_goto_list_decl_ _menhir_stack _v _menhir_s
    
    and _menhir_goto_list_decl_ : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _v _menhir_s ->
        match _menhir_s with
        | MenhirState372 ->
            _menhir_run_373 _menhir_stack _v
        | MenhirState000 ->
            _menhir_run_369 _menhir_stack _v
        | _ ->
            _menhir_fail ()
    
    let rec _menhir_run_001 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell1_TYPE (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.QUOTE ->
            _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState001
        | Tokens.LEFTPAR ->
            _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState001
        | Tokens.ID _ ->
            let _v = _menhir_action_182 () in
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v MenhirState001 _tok
        | _ ->
            _eRR 1
    
    and _menhir_run_002 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.ID _v ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let (_endpos_id_, id, _startpos__1_) = (_endpos, _v, _startpos) in
            let _v = _menhir_action_181 _endpos_id_ _startpos__1_ id in
            _menhir_goto_type_var _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_id_ _startpos__1_ _v _menhir_s _tok
        | _ ->
            _eRR 2
    
    and _menhir_goto_type_var : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState063 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState001 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState349 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState343 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState332 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState322 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState195 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState112 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState051 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState021 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState038 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState024 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState006 ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState004 ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_060 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
        let (_startpos_v_, v) = (_startpos, _v) in
        let _v = _menhir_action_183 v in
        _menhir_goto_type_vars _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_v_ _v _menhir_s _tok
    
    and _menhir_goto_type_vars : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState063 ->
            _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState001 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_064 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_algebraic_typedef as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_type_vars (_menhir_stack, _menhir_s, _v, _startpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.ID _v_0 ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState064
        | _ ->
            _eRR 64
    
    and _menhir_run_011 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_id_, _startpos_id_, id) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_105 id in
        _menhir_goto_raw_ident _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_id_ _startpos_id_ _v _menhir_s _tok
    
    and _menhir_goto_raw_ident : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState115 ->
            _menhir_run_221 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState225 ->
            _menhir_run_221 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState218 ->
            _menhir_run_221 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState193 ->
            _menhir_run_194 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState128 ->
            _menhir_run_129 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState125 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState364 ->
            _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState360 ->
            _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState356 ->
            _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState301 ->
            _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState293 ->
            _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState074 ->
            _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState071 ->
            _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState068 ->
            _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState064 ->
            _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState366 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState362 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState358 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState337 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState335 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState316 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState329 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState326 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState324 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState319 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState314 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState310 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState306 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState303 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState295 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState076 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState080 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState081 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState082 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState286 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState271 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState282 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState278 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState272 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState274 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState083 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState268 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState265 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState084 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState086 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState092 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState093 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState106 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState255 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState253 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState107 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState250 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState222 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState208 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState119 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState202 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState121 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState122 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState123 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState190 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState187 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState184 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState182 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState180 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState178 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState176 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState174 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState172 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState170 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState168 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState166 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState164 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState162 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState160 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState158 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState156 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState154 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState152 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState150 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState145 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState136 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState134 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState130 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState103 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState099 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState054 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState046 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState066 ->
            _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState058 ->
            _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState013 ->
            _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState351 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState349 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState347 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState343 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState333 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState332 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState323 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState322 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState196 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState195 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState113 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState112 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState052 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState051 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState041 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState021 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState037 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState038 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState024 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState034 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState014 ->
            _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState018 ->
            _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState010 ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_221 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.MAPS_TO ->
            let _menhir_stack = MenhirCell1_raw_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState222 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.VOID ->
                _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.TRUE ->
                _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.STRING _v ->
                _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MINUS ->
                _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET ->
                _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTSQ ->
                _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTPAR ->
                _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTBR ->
                _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.IF ->
                _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.HEXADECIMAL _v ->
                _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FALSE ->
                _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DISTINCT ->
                _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DECIMAL _v ->
                _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.CUT ->
                _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.CHECK ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 222)
        | Tokens.AND | Tokens.AT | Tokens.BAR | Tokens.COLON | Tokens.COMMA | Tokens.DOT | Tokens.EQUAL | Tokens.GE | Tokens.GT | Tokens.HAT | Tokens.IN | Tokens.LE | Tokens.LEFTPAR | Tokens.LEFTSQ | Tokens.LRARROW | Tokens.LT | Tokens.MINUS | Tokens.NOTEQ | Tokens.OR | Tokens.PERCENT | Tokens.PLUS | Tokens.POW | Tokens.POWDOT | Tokens.QM | Tokens.QM_ID _ | Tokens.RIGHTARROW | Tokens.RIGHTSQ | Tokens.SHARP | Tokens.SLASH | Tokens.TIMES | Tokens.XOR ->
            let (_endpos_id_, _startpos_id_, id) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_033 _endpos_id_ _startpos_id_ id in
            _menhir_goto_ident _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_id_ _startpos_id_ _v _menhir_s _tok
        | _ ->
            _eRR 221
    
    and _menhir_run_077 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_160 _endpos__1_ _startpos__1_ in
        _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_goto_simple_expr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState366 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState362 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState358 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState337 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState335 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState316 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState326 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState324 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState314 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState306 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState303 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState295 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState076 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState080 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState081 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState082 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState274 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState083 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState268 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState086 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState092 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState106 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState255 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState253 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState107 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState250 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState115 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState225 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState222 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState218 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState208 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState119 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState202 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState121 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState122 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState190 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState187 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState184 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState182 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState180 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState178 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState176 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState174 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState172 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState170 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState168 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState166 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState164 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState162 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState160 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState158 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState156 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState154 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState152 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState150 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState145 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState136 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState134 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState130 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState123 ->
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState093 ->
            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_124 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.SHARP ->
            let _menhir_stack = MenhirCell1_simple_expr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.QM_ID _v_0 ->
            let _menhir_stack = MenhirCell1_simple_expr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
        | Tokens.QM ->
            let _menhir_stack = MenhirCell1_simple_expr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LEFTSQ ->
            let _menhir_stack = MenhirCell1_simple_expr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_130 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.DOT ->
            let _menhir_stack = MenhirCell1_simple_expr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_193 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.COLON ->
            let _menhir_stack = MenhirCell1_simple_expr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_195 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND | Tokens.AT | Tokens.AXIOM | Tokens.BAR | Tokens.CASESPLIT | Tokens.CHECK_SAT | Tokens.COMMA | Tokens.ELSE | Tokens.END | Tokens.EOF | Tokens.EQUAL | Tokens.FUNC | Tokens.GE | Tokens.GOAL | Tokens.GT | Tokens.HAT | Tokens.IN | Tokens.LE | Tokens.LEFTARROW | Tokens.LOGIC | Tokens.LRARROW | Tokens.LT | Tokens.MINUS | Tokens.NOTEQ | Tokens.OR | Tokens.PERCENT | Tokens.PLUS | Tokens.POW | Tokens.POWDOT | Tokens.PRED | Tokens.PV | Tokens.REWRITING | Tokens.RIGHTARROW | Tokens.RIGHTBR | Tokens.RIGHTPAR | Tokens.RIGHTSQ | Tokens.SLASH | Tokens.THEN | Tokens.THEORY | Tokens.TIMES | Tokens.TYPE | Tokens.WITH | Tokens.XOR ->
            let (_endpos_e_, _startpos_e_, e) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_037 e in
            _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_e_ _v _menhir_s _tok
        | _ ->
            _eRR 124
    
    and _menhir_run_125 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_simple_expr -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _menhir_s = MenhirState125 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 125
    
    and _menhir_run_127 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_simple_expr -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell1_simple_expr (_menhir_stack, _menhir_s, s, _startpos_s_, _) = _menhir_stack in
        let (_endpos_c_, c) = (_endpos, _v) in
        let _v = _menhir_action_169 _endpos_c_ _startpos_s_ c s in
        _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_s_ _v _menhir_s _tok
    
    and _menhir_run_128 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_simple_expr -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_QM (_menhir_stack, _startpos, _endpos) in
        let _menhir_s = MenhirState128 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 128
    
    and _menhir_run_130 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_simple_expr -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_LEFTSQ (_menhir_stack, _startpos, _endpos) in
        let _menhir_s = MenhirState130 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.VOID ->
            _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.TRUE ->
            _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.STRING _v ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MINUS ->
            _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET ->
            _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTSQ ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTBR ->
            _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.IF ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEXADECIMAL _v ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FORALL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FALSE ->
            _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DISTINCT ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DECIMAL _v ->
            _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.CUT ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.CHECK ->
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 130
    
    and _menhir_run_078 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_158 _endpos__1_ _startpos__1_ in
        _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_079 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell1_STRING (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.COLON ->
            let _menhir_s = MenhirState080 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.VOID ->
                _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.TRUE ->
                _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.STRING _v ->
                _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MINUS ->
                _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET ->
                _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTSQ ->
                _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTPAR ->
                _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTBR ->
                _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.IF ->
                _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.HEXADECIMAL _v ->
                _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FALSE ->
                _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DISTINCT ->
                _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DECIMAL _v ->
                _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.CUT ->
                _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.CHECK ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 80)
        | _ ->
            _eRR 79
    
    and _menhir_run_081 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_NOT (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState081 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.VOID ->
            _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.TRUE ->
            _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.STRING _v ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MINUS ->
            _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET ->
            _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTSQ ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTBR ->
            _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.IF ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEXADECIMAL _v ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FORALL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FALSE ->
            _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DISTINCT ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DECIMAL _v ->
            _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.CUT ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.CHECK ->
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 81
    
    and _menhir_run_082 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState082 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.VOID ->
            _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.TRUE ->
            _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.STRING _v ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MINUS ->
            _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET ->
            _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTSQ ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTBR ->
            _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.IF ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEXADECIMAL _v ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FORALL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FALSE ->
            _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DISTINCT ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DECIMAL _v ->
            _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.CUT ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.CHECK ->
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 82
    
    and _menhir_run_083 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_MATCH (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState083 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.VOID ->
            _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.TRUE ->
            _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.STRING _v ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MINUS ->
            _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET ->
            _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTSQ ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTBR ->
            _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.IF ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEXADECIMAL _v ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FORALL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FALSE ->
            _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DISTINCT ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DECIMAL _v ->
            _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.CUT ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.CHECK ->
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 83
    
    and _menhir_run_084 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_LET (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState084 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 84
    
    and _menhir_run_087 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.BAR ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.INTEGER _v ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.BAR ->
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.RIGHTSQ ->
                        let _endpos_2 = _menhir_lexbuf.Lexing.lex_curr_p in
                        let _tok = _menhir_lexer _menhir_lexbuf in
                        let (_startpos__1_, c, _endpos__5_) = (_startpos, _v, _endpos_2) in
                        let _v = _menhir_action_058 _endpos__5_ _startpos__1_ c in
                        _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__5_ _startpos__1_ _v _menhir_s _tok
                    | _ ->
                        _eRR 90)
                | _ ->
                    _eRR 89)
            | _ ->
                _eRR 88)
        | _ ->
            _eRR 87
    
    and _menhir_goto_lexpr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState366 ->
            _menhir_run_367 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState362 ->
            _menhir_run_363 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState358 ->
            _menhir_run_359 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState335 ->
            _menhir_run_336 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState324 ->
            _menhir_run_325 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState314 ->
            _menhir_run_315 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState306 ->
            _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState303 ->
            _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState295 ->
            _menhir_run_296 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState076 ->
            _menhir_run_292 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState080 ->
            _menhir_run_291 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState081 ->
            _menhir_run_290 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState082 ->
            _menhir_run_289 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState274 ->
            _menhir_run_275 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState083 ->
            _menhir_run_270 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState268 ->
            _menhir_run_269 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState086 ->
            _menhir_run_263 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState092 ->
            _menhir_run_261 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState106 ->
            _menhir_run_257 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState255 ->
            _menhir_run_256 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState253 ->
            _menhir_run_254 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState107 ->
            _menhir_run_252 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState250 ->
            _menhir_run_251 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState115 ->
            _menhir_run_227 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState218 ->
            _menhir_run_227 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState225 ->
            _menhir_run_227 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState222 ->
            _menhir_run_223 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState208 ->
            _menhir_run_209 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState202 ->
            _menhir_run_204 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState121 ->
            _menhir_run_201 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState122 ->
            _menhir_run_198 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState123 ->
            _menhir_run_197 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState190 ->
            _menhir_run_192 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState187 ->
            _menhir_run_188 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState182 ->
            _menhir_run_183 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState337 ->
            _menhir_run_181 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState316 ->
            _menhir_run_181 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState326 ->
            _menhir_run_181 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState180 ->
            _menhir_run_181 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState178 ->
            _menhir_run_179 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState176 ->
            _menhir_run_177 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState174 ->
            _menhir_run_175 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState172 ->
            _menhir_run_173 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState170 ->
            _menhir_run_171 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState168 ->
            _menhir_run_169 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState166 ->
            _menhir_run_167 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState164 ->
            _menhir_run_165 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState162 ->
            _menhir_run_163 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState160 ->
            _menhir_run_161 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState158 ->
            _menhir_run_159 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState156 ->
            _menhir_run_157 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState154 ->
            _menhir_run_155 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState152 ->
            _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState150 ->
            _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState119 ->
            _menhir_run_149 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState184 ->
            _menhir_run_149 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState145 ->
            _menhir_run_149 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState136 ->
            _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState134 ->
            _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState130 ->
            _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_367 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_AXIOM, _menhir_box_file) _menhir_cell1_decl_ident as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.TIMES ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.RIGHTARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.OR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.NOTEQ ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LRARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_182 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_172 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.EQUAL ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AXIOM | Tokens.CHECK_SAT | Tokens.EOF | Tokens.FUNC | Tokens.GOAL | Tokens.LOGIC | Tokens.PRED | Tokens.REWRITING | Tokens.THEORY | Tokens.TYPE ->
            let MenhirCell1_decl_ident (_menhir_stack, _, name) = _menhir_stack in
            let MenhirCell1_AXIOM (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos_body_, body) = (_endpos, _v) in
            let _v = _menhir_action_025 _endpos_body_ _startpos__1_ body name in
            _menhir_goto_decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 367
    
    and _menhir_run_134 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_lexpr -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _menhir_s = MenhirState134 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.VOID ->
            _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.TRUE ->
            _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.STRING _v ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MINUS ->
            _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET ->
            _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTSQ ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTBR ->
            _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.IF ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEXADECIMAL _v ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FORALL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FALSE ->
            _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DISTINCT ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DECIMAL _v ->
            _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.CUT ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.CHECK ->
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 134
    
    and _menhir_run_092 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_LEFTPAR (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState092 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.VOID ->
            _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.TRUE ->
            _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.STRING _v ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MINUS ->
            _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET ->
            _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTSQ ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTBR ->
            _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.IF ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEXADECIMAL _v ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FORALL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FALSE ->
            _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DISTINCT ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DECIMAL _v ->
            _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.CUT ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.CHECK ->
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 92
    
    and _menhir_run_093 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_LEFTBR (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState093 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.VOID ->
            _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.TRUE ->
            _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTBR ->
            _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEXADECIMAL _v ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FALSE ->
            _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DECIMAL _v ->
            _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 93
    
    and _menhir_run_094 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_155 _endpos_s_ _startpos_s_ s in
        _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_s_ _startpos_s_ _v _menhir_s _tok
    
    and _menhir_run_095 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_157 _endpos_s_ _startpos_s_ s in
        _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_s_ _startpos_s_ _v _menhir_s _tok
    
    and _menhir_run_096 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_159 _endpos__1_ _startpos__1_ in
        _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_097 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_156 _endpos_s_ _startpos_s_ s in
        _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_s_ _startpos_s_ _v _menhir_s _tok
    
    and _menhir_run_107 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState107 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.VOID ->
            _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.TRUE ->
            _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.STRING _v ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MINUS ->
            _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET ->
            _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTSQ ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTBR ->
            _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.IF ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEXADECIMAL _v ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FORALL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FALSE ->
            _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DISTINCT ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DECIMAL _v ->
            _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.CUT ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.CHECK ->
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 107
    
    and _menhir_run_108 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_FORALL (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState108 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.ID _v ->
            _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 108
    
    and _menhir_run_109 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.STRING _v_0 ->
            let _endpos_2 = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let (_startpos_id_, id, _endpos_str_, str) = (_startpos, _v, _endpos_2, _v_0) in
            let _v = _menhir_action_107 id str in
            _menhir_goto_raw_named_ident _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_str_ _startpos_id_ _v _menhir_s _tok
        | Tokens.COLON | Tokens.COMMA | Tokens.EQUAL | Tokens.LEFTPAR ->
            let (_endpos_id_, _startpos_id_, id) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_106 id in
            _menhir_goto_raw_named_ident _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_id_ _startpos_id_ _v _menhir_s _tok
        | _ ->
            _eRR 109
    
    and _menhir_goto_raw_named_ident : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState354 ->
            _menhir_run_353 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState341 ->
            _menhir_run_353 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState317 ->
            _menhir_run_318 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState308 ->
            _menhir_run_309 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState108 ->
            _menhir_run_210 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState215 ->
            _menhir_run_210 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState212 ->
            _menhir_run_210 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState116 ->
            _menhir_run_210 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_353 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _menhir_stack = MenhirCell1_raw_named_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState354 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.ID _v ->
                _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 354)
        | Tokens.COLON ->
            let x = _v in
            let _v = _menhir_action_143 x in
            _menhir_goto_separated_nonempty_list_COMMA_raw_named_ident_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 353
    
    and _menhir_goto_separated_nonempty_list_COMMA_raw_named_ident_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState354 ->
            _menhir_run_355 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState341 ->
            _menhir_run_342 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_355 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_raw_named_ident -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_raw_named_ident (_menhir_stack, _menhir_s, x, _, _) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_144 x xs in
        _menhir_goto_separated_nonempty_list_COMMA_raw_named_ident_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_342 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LOGIC _menhir_cell0_ac_modifier as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_separated_nonempty_list_COMMA_raw_named_ident_ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_s = MenhirState343 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UNIT ->
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.REAL ->
            _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.QUOTE ->
            _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.PROP ->
            _menhir_run_344 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INT ->
            _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.BOOL ->
            _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.BITV ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.RIGHTARROW ->
            let _v = _menhir_action_086 () in
            _menhir_goto_loption_separated_nonempty_list_COMMA_primitive_type__ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | _ ->
            _eRR 343
    
    and _menhir_run_022 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_095 _endpos__1_ _startpos__1_ in
        _menhir_goto_primitive_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_goto_primitive_type : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState349 ->
            _menhir_run_351 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState343 ->
            _menhir_run_347 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState332 ->
            _menhir_run_333 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState322 ->
            _menhir_run_323 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState195 ->
            _menhir_run_196 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState112 ->
            _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState051 ->
            _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState021 ->
            _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState038 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState024 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_351 : type  ttv_stack. ((((ttv_stack, _menhir_box_file) _menhir_cell1_LOGIC _menhir_cell0_ac_modifier, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_raw_named_ident_, _menhir_box_file) _menhir_cell1_loption_separated_nonempty_list_COMMA_primitive_type__ as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.ID _v_0 ->
            let _menhir_stack = MenhirCell1_primitive_type (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState351
        | Tokens.AXIOM | Tokens.CHECK_SAT | Tokens.EOF | Tokens.FUNC | Tokens.GOAL | Tokens.LOGIC | Tokens.PRED | Tokens.REWRITING | Tokens.THEORY | Tokens.TYPE ->
            let (_endpos_ty_, ty) = (_endpos, _v) in
            let _v = _menhir_action_103 ty in
            _menhir_goto_primitive_type_or_prop _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_ty_ _v _menhir_s _tok
        | _ ->
            _eRR 351
    
    and _menhir_goto_primitive_type_or_prop : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState349 ->
            _menhir_run_350 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState343 ->
            _menhir_run_346 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_350 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_LOGIC _menhir_cell0_ac_modifier, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_raw_named_ident_, _menhir_box_file) _menhir_cell1_loption_separated_nonempty_list_COMMA_primitive_type__ -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_loption_separated_nonempty_list_COMMA_primitive_type__ (_menhir_stack, _, xs, _startpos_xs_) = _menhir_stack in
        let (_endpos_ret_, ret) = (_endpos, _v) in
        let _v = _menhir_action_081 _endpos_ret_ _startpos_xs_ ret xs in
        _menhir_goto_logic_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_ret_ _v _tok
    
    and _menhir_goto_logic_type : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LOGIC _menhir_cell0_ac_modifier, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_raw_named_ident_ -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_separated_nonempty_list_COMMA_raw_named_ident_ (_menhir_stack, _, args) = _menhir_stack in
        let MenhirCell0_ac_modifier (_menhir_stack, ac) = _menhir_stack in
        let MenhirCell1_LOGIC (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos_ty_, ty) = (_endpos, _v) in
        let _v = _menhir_action_023 _endpos_ty_ _startpos__1_ ac args ty in
        _menhir_goto_decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_decl : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_decl (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.TYPE ->
            _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState372
        | Tokens.THEORY ->
            _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState372
        | Tokens.REWRITING ->
            _menhir_run_301 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState372
        | Tokens.PRED ->
            _menhir_run_308 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState372
        | Tokens.LOGIC ->
            _menhir_run_339 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState372
        | Tokens.GOAL ->
            _menhir_run_356 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState372
        | Tokens.FUNC ->
            _menhir_run_317 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState372
        | Tokens.CHECK_SAT ->
            _menhir_run_360 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState372
        | Tokens.AXIOM ->
            _menhir_run_364 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState372
        | Tokens.EOF ->
            let _v_0 = _menhir_action_073 () in
            _menhir_run_373 _menhir_stack _v_0
        | _ ->
            _eRR 372
    
    and _menhir_run_068 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_THEORY (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState068 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 68
    
    and _menhir_run_301 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_REWRITING (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState301 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 301
    
    and _menhir_run_308 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_PRED (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState308 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.ID _v ->
            _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 308
    
    and _menhir_run_339 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_LOGIC (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.AC ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            let _v = _menhir_action_003 () in
            _menhir_goto_ac_modifier _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | Tokens.ID _ ->
            let _v = _menhir_action_002 () in
            _menhir_goto_ac_modifier _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _eRR 339
    
    and _menhir_goto_ac_modifier : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_LOGIC -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let _menhir_stack = MenhirCell0_ac_modifier (_menhir_stack, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.ID _v_0 ->
            _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState341
        | _ ->
            _eRR 341
    
    and _menhir_run_356 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_GOAL (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState356 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 356
    
    and _menhir_run_317 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_FUNC (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState317 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.ID _v ->
            _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 317
    
    and _menhir_run_360 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_CHECK_SAT (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState360 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 360
    
    and _menhir_run_364 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_AXIOM (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState364 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 364
    
    and _menhir_run_346 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LOGIC _menhir_cell0_ac_modifier, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_raw_named_ident_ -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let (_endpos_ty_, ty) = (_endpos, _v) in
        let _v = _menhir_action_080 ty in
        _menhir_goto_logic_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_ty_ _v _tok
    
    and _menhir_run_347 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_LOGIC _menhir_cell0_ac_modifier, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_raw_named_ident_ as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.ID _v_0 ->
            let _menhir_stack = MenhirCell1_primitive_type (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState347
        | Tokens.COMMA ->
            let _menhir_stack = MenhirCell1_primitive_type (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState347
        | Tokens.AXIOM | Tokens.CHECK_SAT | Tokens.EOF | Tokens.FUNC | Tokens.GOAL | Tokens.LOGIC | Tokens.PRED | Tokens.REWRITING | Tokens.THEORY | Tokens.TYPE ->
            let (_endpos_ty_, ty) = (_endpos, _v) in
            let _v = _menhir_action_103 ty in
            _menhir_goto_primitive_type_or_prop _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_ty_ _v _menhir_s _tok
        | Tokens.RIGHTARROW ->
            let (_startpos_x_, x) = (_startpos, _v) in
            let _v = _menhir_action_141 x in
            _menhir_goto_separated_nonempty_list_COMMA_primitive_type_ _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_x_ _v _menhir_s _tok
        | _ ->
            _eRR 347
    
    and _menhir_run_038 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_primitive_type as 'stack) -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _menhir_stack = MenhirCell1_COMMA (_menhir_stack, _menhir_s) in
        let _menhir_s = MenhirState038 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UNIT ->
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.REAL ->
            _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.QUOTE ->
            _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INT ->
            _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.BOOL ->
            _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.BITV ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 38
    
    and _menhir_run_023 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_097 _endpos__1_ _startpos__1_ in
        _menhir_goto_primitive_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_024 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_LEFTPAR (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState024 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UNIT ->
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.REAL ->
            _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.QUOTE ->
            _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INT ->
            _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.BOOL ->
            _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.BITV ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 24
    
    and _menhir_run_025 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_096 _endpos__1_ _startpos__1_ in
        _menhir_goto_primitive_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_026 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_094 _endpos__1_ _startpos__1_ in
        _menhir_goto_primitive_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_027 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFTSQ ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.INTEGER _v ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.RIGHTSQ ->
                    let _endpos_3 = _menhir_lexbuf.Lexing.lex_curr_p in
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    let (_startpos__1_, _endpos__4_, sz) = (_startpos, _endpos_3, _v) in
                    let _v = _menhir_action_098 _endpos__4_ _startpos__1_ sz in
                    _menhir_goto_primitive_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__4_ _startpos__1_ _v _menhir_s _tok
                | _ ->
                    _eRR 29)
            | _ ->
                _eRR 28)
        | _ ->
            _eRR 27
    
    and _menhir_goto_separated_nonempty_list_COMMA_primitive_type_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState343 ->
            _menhir_run_345 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState038 ->
            _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState024 ->
            _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_345 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_LOGIC _menhir_cell0_ac_modifier, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_raw_named_ident_ as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
        let (_startpos_x_, x) = (_startpos, _v) in
        let _v = _menhir_action_087 x in
        _menhir_goto_loption_separated_nonempty_list_COMMA_primitive_type__ _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_x_ _v _menhir_s _tok
    
    and _menhir_goto_loption_separated_nonempty_list_COMMA_primitive_type__ : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_LOGIC _menhir_cell0_ac_modifier, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_raw_named_ident_ as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_loption_separated_nonempty_list_COMMA_primitive_type__ (_menhir_stack, _menhir_s, _v, _startpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHTARROW ->
            let _menhir_s = MenhirState349 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UNIT ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.REAL ->
                _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.QUOTE ->
                _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.PROP ->
                _menhir_run_344 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTPAR ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INT ->
                _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.BOOL ->
                _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.BITV ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 349)
        | _ ->
            _eRR 348
    
    and _menhir_run_344 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_104 _endpos__1_ _startpos__1_ in
        _menhir_goto_primitive_type_or_prop _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _v _menhir_s _tok
    
    and _menhir_run_039 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_primitive_type, _menhir_box_file) _menhir_cell1_COMMA -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let MenhirCell1_COMMA (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_primitive_type (_menhir_stack, _menhir_s, x, _startpos_x_, _) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_142 x xs in
        _menhir_goto_separated_nonempty_list_COMMA_primitive_type_ _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_x_ _v _menhir_s _tok
    
    and _menhir_run_033 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LEFTPAR as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_separated_nonempty_list_COMMA_primitive_type_ (_menhir_stack, _menhir_s, _v, _startpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHTPAR ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell0_RIGHTPAR (_menhir_stack, _endpos) in
            let _menhir_s = MenhirState034 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 34)
        | _ ->
            _eRR 33
    
    and _menhir_run_333 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_ident as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.ID _v_0 ->
            let _menhir_stack = MenhirCell1_primitive_type (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState333
        | Tokens.COMMA | Tokens.RIGHTPAR ->
            let MenhirCell1_ident (_menhir_stack, _menhir_s, v, _startpos_v_, _) = _menhir_stack in
            let (_endpos_ty_, ty) = (_endpos, _v) in
            let _v = _menhir_action_079 _endpos_ty_ _startpos_v_ ty v in
            (match (_tok : MenhirBasics.token) with
            | Tokens.COMMA ->
                let _menhir_stack = MenhirCell1_logic_binder (_menhir_stack, _menhir_s, _v) in
                let _menhir_s = MenhirState329 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.ID _v ->
                    _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | _ ->
                    _eRR 329)
            | Tokens.RIGHTPAR ->
                let x = _v in
                let _v = _menhir_action_135 x in
                _menhir_goto_separated_nonempty_list_COMMA_logic_binder_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _menhir_fail ())
        | _ ->
            _eRR 333
    
    and _menhir_goto_separated_nonempty_list_COMMA_logic_binder_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState329 ->
            _menhir_run_330 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState319 ->
            _menhir_run_311 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState310 ->
            _menhir_run_311 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_330 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_logic_binder -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_logic_binder (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_136 x xs in
        _menhir_goto_separated_nonempty_list_COMMA_logic_binder_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_311 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_raw_named_ident _menhir_cell0_LEFTPAR as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let x = _v in
        let _v = _menhir_action_085 x in
        _menhir_goto_loption_separated_nonempty_list_COMMA_logic_binder__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_goto_loption_separated_nonempty_list_COMMA_logic_binder__ : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_raw_named_ident _menhir_cell0_LEFTPAR as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState319 ->
            _menhir_run_320 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState310 ->
            _menhir_run_312 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_320 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_FUNC, _menhir_box_file) _menhir_cell1_raw_named_ident _menhir_cell0_LEFTPAR as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_loption_separated_nonempty_list_COMMA_logic_binder__ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_RIGHTPAR (_menhir_stack, _endpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.COLON ->
            let _menhir_s = MenhirState322 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UNIT ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.REAL ->
                _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.QUOTE ->
                _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTPAR ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INT ->
                _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.BOOL ->
                _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.BITV ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 322)
        | _ ->
            _eRR 321
    
    and _menhir_run_312 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_PRED, _menhir_box_file) _menhir_cell1_raw_named_ident _menhir_cell0_LEFTPAR as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_loption_separated_nonempty_list_COMMA_logic_binder__ (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_RIGHTPAR (_menhir_stack, _endpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.EQUAL ->
            let _menhir_s = MenhirState314 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.VOID ->
                _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.TRUE ->
                _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.STRING _v ->
                _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MINUS ->
                _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET ->
                _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTSQ ->
                _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTPAR ->
                _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTBR ->
                _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.IF ->
                _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.HEXADECIMAL _v ->
                _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FALSE ->
                _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DISTINCT ->
                _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DECIMAL _v ->
                _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.CUT ->
                _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.CHECK ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 314)
        | _ ->
            _eRR 313
    
    and _menhir_run_116 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_EXISTS (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState116 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.ID _v ->
            _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 116
    
    and _menhir_run_120 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_DISTINCT (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFTPAR ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_LEFTPAR (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState121 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.VOID ->
                _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.TRUE ->
                _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.STRING _v ->
                _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MINUS ->
                _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET ->
                _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTSQ ->
                _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTPAR ->
                _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTBR ->
                _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.IF ->
                _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.HEXADECIMAL _v ->
                _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FALSE ->
                _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DISTINCT ->
                _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DECIMAL _v ->
                _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.CUT ->
                _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.CHECK ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 121)
        | _ ->
            _eRR 120
    
    and _menhir_run_122 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_CUT (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState122 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.VOID ->
            _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.TRUE ->
            _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.STRING _v ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MINUS ->
            _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET ->
            _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTSQ ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTBR ->
            _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.IF ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEXADECIMAL _v ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FORALL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FALSE ->
            _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DISTINCT ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DECIMAL _v ->
            _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.CUT ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.CHECK ->
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 122
    
    and _menhir_run_123 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_CHECK (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState123 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.VOID ->
            _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.TRUE ->
            _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.STRING _v ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MINUS ->
            _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET ->
            _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTSQ ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTBR ->
            _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.IF ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEXADECIMAL _v ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FORALL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FALSE ->
            _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DISTINCT ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DECIMAL _v ->
            _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.CUT ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.CHECK ->
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 123
    
    and _menhir_run_323 : type  ttv_stack. ((((ttv_stack, _menhir_box_file) _menhir_cell1_FUNC, _menhir_box_file) _menhir_cell1_raw_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file) _menhir_cell1_loption_separated_nonempty_list_COMMA_logic_binder__ _menhir_cell0_RIGHTPAR as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_primitive_type (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.ID _v_0 ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState323
        | Tokens.EQUAL ->
            let _menhir_stack = MenhirCell1_EQUAL (_menhir_stack, MenhirState323) in
            let _menhir_s = MenhirState324 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.VOID ->
                _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.TRUE ->
                _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.STRING _v ->
                _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MINUS ->
                _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET ->
                _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTSQ ->
                _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTPAR ->
                _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTBR ->
                _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.IF ->
                _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.HEXADECIMAL _v ->
                _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FALSE ->
                _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DISTINCT ->
                _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DECIMAL _v ->
                _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.CUT ->
                _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.CHECK ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 324)
        | _ ->
            _eRR 323
    
    and _menhir_run_196 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_simple_expr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.ID _v_0 ->
            let _menhir_stack = MenhirCell1_primitive_type (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState196
        | Tokens.AND | Tokens.AT | Tokens.AXIOM | Tokens.BAR | Tokens.CASESPLIT | Tokens.CHECK_SAT | Tokens.COLON | Tokens.COMMA | Tokens.DOT | Tokens.ELSE | Tokens.END | Tokens.EOF | Tokens.EQUAL | Tokens.FUNC | Tokens.GE | Tokens.GOAL | Tokens.GT | Tokens.HAT | Tokens.IN | Tokens.LE | Tokens.LEFTARROW | Tokens.LEFTSQ | Tokens.LOGIC | Tokens.LRARROW | Tokens.LT | Tokens.MINUS | Tokens.NOTEQ | Tokens.OR | Tokens.PERCENT | Tokens.PLUS | Tokens.POW | Tokens.POWDOT | Tokens.PRED | Tokens.PV | Tokens.QM | Tokens.QM_ID _ | Tokens.REWRITING | Tokens.RIGHTARROW | Tokens.RIGHTBR | Tokens.RIGHTPAR | Tokens.RIGHTSQ | Tokens.SHARP | Tokens.SLASH | Tokens.THEN | Tokens.THEORY | Tokens.TIMES | Tokens.TYPE | Tokens.WITH | Tokens.XOR ->
            let MenhirCell1_simple_expr (_menhir_stack, _menhir_s, s, _startpos_s_, _) = _menhir_stack in
            let (_endpos_ty_, ty) = (_endpos, _v) in
            let _v = _menhir_action_167 _endpos_ty_ _startpos_s_ s ty in
            _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_ty_ _startpos_s_ _v _menhir_s _tok
        | _ ->
            _eRR 196
    
    and _menhir_run_113 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_named_ident_ as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.ID _v_0 ->
            let _menhir_stack = MenhirCell1_primitive_type (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState113
        | Tokens.COMMA | Tokens.DOT | Tokens.LEFTBR | Tokens.LEFTSQ ->
            let MenhirCell1_separated_nonempty_list_COMMA_named_ident_ (_menhir_stack, _menhir_s, vars, _startpos_vars_) = _menhir_stack in
            let (_endpos_ty_, ty) = (_endpos, _v) in
            let _v = _menhir_action_092 _endpos_ty_ _startpos_vars_ ty vars in
            (match (_tok : MenhirBasics.token) with
            | Tokens.COMMA ->
                let _menhir_stack = MenhirCell1_multi_logic_binder (_menhir_stack, _menhir_s, _v) in
                let _menhir_s = MenhirState215 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.ID _v ->
                    _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | _ ->
                    _eRR 215)
            | Tokens.DOT | Tokens.LEFTBR | Tokens.LEFTSQ ->
                let x = _v in
                let _v = _menhir_action_137 x in
                _menhir_goto_separated_nonempty_list_COMMA_multi_logic_binder_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
            | _ ->
                _menhir_fail ())
        | _ ->
            _eRR 113
    
    and _menhir_goto_separated_nonempty_list_COMMA_multi_logic_binder_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState215 ->
            _menhir_run_216 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState116 ->
            _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState108 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_216 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_multi_logic_binder -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let MenhirCell1_multi_logic_binder (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_138 x xs in
        _menhir_goto_separated_nonempty_list_COMMA_multi_logic_binder_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_117 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_EXISTS as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_separated_nonempty_list_COMMA_multi_logic_binder_ (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFTSQ ->
            _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState117
        | Tokens.DOT | Tokens.LEFTBR ->
            let _v_0 = _menhir_action_178 () in
            _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState117 _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_115 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_multi_logic_binder_ as 'stack) -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell1_LEFTSQ (_menhir_stack, _menhir_s, _startpos, _endpos) in
        let _menhir_s = MenhirState115 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.VOID ->
            _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.TRUE ->
            _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.STRING _v ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MINUS ->
            _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET ->
            _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTSQ ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTBR ->
            _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.IF ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEXADECIMAL _v ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FORALL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FALSE ->
            _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DISTINCT ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DECIMAL _v ->
            _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.CUT ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.CHECK ->
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 115
    
    and _menhir_run_118 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_EXISTS, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_multi_logic_binder_ as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_triggers (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFTBR ->
            _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState118
        | Tokens.DOT ->
            let _v_0 = _menhir_action_031 () in
            _menhir_run_207 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState118 _tok
        | _ ->
            _eRR 118
    
    and _menhir_run_119 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_multi_logic_binder_, _menhir_box_file) _menhir_cell1_triggers as 'stack) -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_LEFTBR (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState119 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.VOID ->
            _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.TRUE ->
            _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.STRING _v ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MINUS ->
            _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET ->
            _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTSQ ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTBR ->
            _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.IF ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEXADECIMAL _v ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FORALL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FALSE ->
            _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DISTINCT ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DECIMAL _v ->
            _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.CUT ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.CHECK ->
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 119
    
    and _menhir_run_207 : type  ttv_stack. ((((ttv_stack, _menhir_box_file) _menhir_cell1_EXISTS, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_multi_logic_binder_, _menhir_box_file) _menhir_cell1_triggers as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_filters (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.DOT ->
            let _menhir_s = MenhirState208 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.VOID ->
                _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.TRUE ->
                _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.STRING _v ->
                _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MINUS ->
                _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET ->
                _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTSQ ->
                _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTPAR ->
                _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTBR ->
                _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.IF ->
                _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.HEXADECIMAL _v ->
                _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FALSE ->
                _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DISTINCT ->
                _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DECIMAL _v ->
                _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.CUT ->
                _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.CHECK ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 208)
        | _ ->
            _eRR 207
    
    and _menhir_run_114 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_FORALL as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_separated_nonempty_list_COMMA_multi_logic_binder_ (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFTSQ ->
            _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState114
        | Tokens.DOT | Tokens.LEFTBR ->
            let _v_0 = _menhir_action_178 () in
            _menhir_run_248 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState114 _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_248 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_FORALL, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_multi_logic_binder_ as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_triggers (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFTBR ->
            _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState248
        | Tokens.DOT ->
            let _v_0 = _menhir_action_031 () in
            _menhir_run_249 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState248 _tok
        | _ ->
            _eRR 248
    
    and _menhir_run_249 : type  ttv_stack. ((((ttv_stack, _menhir_box_file) _menhir_cell1_FORALL, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_multi_logic_binder_, _menhir_box_file) _menhir_cell1_triggers as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_filters (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.DOT ->
            let _menhir_s = MenhirState250 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.VOID ->
                _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.TRUE ->
                _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.STRING _v ->
                _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MINUS ->
                _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET ->
                _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTSQ ->
                _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTPAR ->
                _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTBR ->
                _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.IF ->
                _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.HEXADECIMAL _v ->
                _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FALSE ->
                _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DISTINCT ->
                _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DECIMAL _v ->
                _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.CUT ->
                _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.CHECK ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 250)
        | _ ->
            _eRR 249
    
    and _menhir_run_052 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_ident as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.ID _v_0 ->
            let _menhir_stack = MenhirCell1_primitive_type (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState052
        | Tokens.PV | Tokens.RIGHTBR ->
            let MenhirCell1_ident (_menhir_stack, _menhir_s, id, _startpos_id_, _) = _menhir_stack in
            let (_endpos_ty_, ty) = (_endpos, _v) in
            let _v = _menhir_action_007 _endpos_ty_ _startpos_id_ id ty in
            (match (_tok : MenhirBasics.token) with
            | Tokens.PV ->
                let _menhir_stack = MenhirCell1_algebraic_label_with_type (_menhir_stack, _menhir_s, _v) in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell0_PV (_menhir_stack, _endpos) in
                let _menhir_s = MenhirState054 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.ID _v ->
                    _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | _ ->
                    _eRR 54)
            | Tokens.RIGHTBR ->
                let x = _v in
                let _v = _menhir_action_147 x in
                _menhir_goto_separated_nonempty_list_PV_algebraic_label_with_type_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _menhir_fail ())
        | _ ->
            _eRR 52
    
    and _menhir_goto_separated_nonempty_list_PV_algebraic_label_with_type_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState054 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState046 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_055 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_algebraic_label_with_type _menhir_cell0_PV -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell0_PV (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_algebraic_label_with_type (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_148 x xs in
        _menhir_goto_separated_nonempty_list_PV_algebraic_label_with_type_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_047 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_raw_ident _menhir_cell0_LEFTBR -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell0_LEFTBR (_menhir_stack, _) = _menhir_stack in
        let (l, _endpos__4_) = (_v, _endpos) in
        let _v = _menhir_action_005 l in
        _menhir_goto_algebraic_args _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__4_ _v _tok
    
    and _menhir_goto_algebraic_args : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_raw_ident -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_raw_ident (_menhir_stack, _menhir_s, c, _, _) = _menhir_stack in
        let (_endpos_l_, l) = (_endpos, _v) in
        let _v = _menhir_action_006 c l in
        let _endpos = _endpos_l_ in
        match (_tok : MenhirBasics.token) with
        | Tokens.BAR ->
            let _menhir_stack = MenhirCell1_algebraic_constructor (_menhir_stack, _menhir_s, _v, _endpos) in
            let _menhir_s = MenhirState058 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 58)
        | Tokens.AND | Tokens.AXIOM | Tokens.CHECK_SAT | Tokens.EOF | Tokens.FUNC | Tokens.GOAL | Tokens.LOGIC | Tokens.PRED | Tokens.REWRITING | Tokens.THEORY | Tokens.TYPE ->
            let (_endpos_x_, x) = (_endpos, _v) in
            let _v = _menhir_action_121 x in
            _menhir_goto_separated_nonempty_list_BAR_algebraic_constructor_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _v _menhir_s _tok
        | _ ->
            _eRR 57
    
    and _menhir_goto_separated_nonempty_list_BAR_algebraic_constructor_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState058 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState066 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState013 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_059 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_algebraic_constructor -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_algebraic_constructor (_menhir_stack, _menhir_s, x, _) = _menhir_stack in
        let (_endpos_xs_, xs) = (_endpos, _v) in
        let _v = _menhir_action_122 x xs in
        _menhir_goto_separated_nonempty_list_BAR_algebraic_constructor_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_xs_ _v _menhir_s _tok
    
    and _menhir_run_042 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_type_vars, _menhir_box_file) _menhir_cell1_raw_ident -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_raw_ident (_menhir_stack, _, c, _, _) = _menhir_stack in
        let MenhirCell1_type_vars (_menhir_stack, _menhir_s, vars, _startpos_vars_) = _menhir_stack in
        let (_endpos_l_, l) = (_endpos, _v) in
        let _v = _menhir_action_008 _endpos_l_ _startpos_vars_ c l vars in
        let _endpos = _endpos_l_ in
        match (_tok : MenhirBasics.token) with
        | Tokens.AND ->
            let _menhir_stack = MenhirCell1_algebraic_typedef (_menhir_stack, _menhir_s, _v, _endpos) in
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.QUOTE ->
                _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState063
            | Tokens.LEFTPAR ->
                _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState063
            | Tokens.ID _ ->
                let _v_1 = _menhir_action_182 () in
                _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_0 _v_1 MenhirState063 _tok
            | _ ->
                _eRR 63)
        | Tokens.AXIOM | Tokens.CHECK_SAT | Tokens.EOF | Tokens.FUNC | Tokens.GOAL | Tokens.LOGIC | Tokens.PRED | Tokens.REWRITING | Tokens.THEORY | Tokens.TYPE ->
            let (_endpos_x_, x) = (_endpos, _v) in
            let _v = _menhir_action_113 x in
            _menhir_goto_separated_nonempty_list_AND_algebraic_typedef_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_004 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_LEFTPAR (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState004 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.QUOTE ->
            _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 4
    
    and _menhir_goto_separated_nonempty_list_AND_algebraic_typedef_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState063 ->
            _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState001 ->
            _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_067 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_algebraic_typedef -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_algebraic_typedef (_menhir_stack, _menhir_s, x, _) = _menhir_stack in
        let (_endpos_xs_, xs) = (_endpos, _v) in
        let _v = _menhir_action_114 x xs in
        _menhir_goto_separated_nonempty_list_AND_algebraic_typedef_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_xs_ _v _menhir_s _tok
    
    and _menhir_run_061 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_TYPE -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_TYPE (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos_l_, l) = (_endpos, _v) in
        let _v = _menhir_action_021 _endpos_l_ _startpos__1_ l in
        _menhir_goto_decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_041 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_raw_ident as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.ID _v_0 ->
            let _menhir_stack = MenhirCell1_primitive_type (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState041
        | Tokens.PV | Tokens.RIGHTBR ->
            let MenhirCell1_raw_ident (_menhir_stack, _menhir_s, id, _, _) = _menhir_stack in
            let ty = _v in
            let _v = _menhir_action_108 id ty in
            (match (_tok : MenhirBasics.token) with
            | Tokens.PV ->
                let _menhir_stack = MenhirCell1_record_label_with_type (_menhir_stack, _menhir_s, _v) in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell0_PV (_menhir_stack, _endpos) in
                let _menhir_s = MenhirState018 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.ID _v ->
                    _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | _ ->
                    _eRR 18)
            | Tokens.RIGHTBR ->
                let x = _v in
                let _v = _menhir_action_151 x in
                _menhir_goto_separated_nonempty_list_PV_record_label_with_type_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _menhir_fail ())
        | _ ->
            _eRR 41
    
    and _menhir_goto_separated_nonempty_list_PV_record_label_with_type_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState018 ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState014 ->
            _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_019 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_record_label_with_type _menhir_cell0_PV -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell0_PV (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_record_label_with_type (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_152 x xs in
        _menhir_goto_separated_nonempty_list_PV_record_label_with_type_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_015 : type  ttv_stack. ((((ttv_stack, _menhir_box_file) _menhir_cell1_TYPE, _menhir_box_file) _menhir_cell1_type_vars, _menhir_box_file) _menhir_cell1_raw_ident, _menhir_box_file) _menhir_cell1_LEFTBR -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell1_LEFTBR (_menhir_stack, _, _) = _menhir_stack in
        let (l, _endpos__3_) = (_v, _endpos) in
        let _v = _menhir_action_109 l in
        let _endpos = _endpos__3_ in
        let MenhirCell1_raw_ident (_menhir_stack, _, id, _, _) = _menhir_stack in
        let MenhirCell1_type_vars (_menhir_stack, _, vars, _) = _menhir_stack in
        let MenhirCell1_TYPE (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos_r_, r) = (_endpos, _v) in
        let _v = _menhir_action_022 _endpos_r_ _startpos__1_ id r vars in
        _menhir_goto_decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_037 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.ID _v_0 ->
            let _menhir_stack = MenhirCell1_primitive_type (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState037
        | Tokens.COMMA ->
            let _menhir_stack = MenhirCell1_primitive_type (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState037
        | Tokens.RIGHTARROW | Tokens.RIGHTPAR ->
            let (_startpos_x_, x) = (_startpos, _v) in
            let _v = _menhir_action_141 x in
            _menhir_goto_separated_nonempty_list_COMMA_primitive_type_ _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_x_ _v _menhir_s _tok
        | _ ->
            _eRR 37
    
    and _menhir_run_318 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_FUNC as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_raw_named_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFTPAR ->
            let _startpos_0 = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_LEFTPAR (_menhir_stack, _startpos_0) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.ID _v_1 ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState319
            | Tokens.RIGHTPAR ->
                let _v_2 = _menhir_action_084 () in
                _menhir_run_320 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState319
            | _ ->
                _eRR 319)
        | _ ->
            _eRR 318
    
    and _menhir_run_309 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_PRED as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_raw_named_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFTPAR ->
            let _startpos_0 = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_LEFTPAR (_menhir_stack, _startpos_0) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.ID _v_1 ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState310
            | Tokens.RIGHTPAR ->
                let _v_2 = _menhir_action_084 () in
                _menhir_run_312 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState310
            | _ ->
                _eRR 310)
        | Tokens.EQUAL ->
            let _menhir_s = MenhirState335 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.VOID ->
                _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.TRUE ->
                _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.STRING _v ->
                _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MINUS ->
                _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET ->
                _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTSQ ->
                _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTPAR ->
                _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTBR ->
                _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.IF ->
                _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.HEXADECIMAL _v ->
                _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FALSE ->
                _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DISTINCT ->
                _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DECIMAL _v ->
                _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.CUT ->
                _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.CHECK ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 335)
        | _ ->
            _eRR 309
    
    and _menhir_run_210 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_id_, _startpos_id_, id) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_093 _endpos_id_ _startpos_id_ id in
        let _startpos = _startpos_id_ in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _menhir_stack = MenhirCell1_named_ident (_menhir_stack, _menhir_s, _v, _startpos) in
            let _menhir_s = MenhirState212 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.ID _v ->
                _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 212)
        | Tokens.COLON ->
            let (_startpos_x_, x) = (_startpos, _v) in
            let _v = _menhir_action_139 x in
            _menhir_goto_separated_nonempty_list_COMMA_named_ident_ _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_x_ _v _menhir_s
        | _ ->
            _eRR 211
    
    and _menhir_goto_separated_nonempty_list_COMMA_named_ident_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s ->
        match _menhir_s with
        | MenhirState212 ->
            _menhir_run_213 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState215 ->
            _menhir_run_111 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s
        | MenhirState116 ->
            _menhir_run_111 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s
        | MenhirState108 ->
            _menhir_run_111 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_213 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_named_ident -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_named_ident (_menhir_stack, _menhir_s, x, _startpos_x_) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_140 x xs in
        _menhir_goto_separated_nonempty_list_COMMA_named_ident_ _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_x_ _v _menhir_s
    
    and _menhir_run_111 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s ->
        let _menhir_stack = MenhirCell1_separated_nonempty_list_COMMA_named_ident_ (_menhir_stack, _menhir_s, _v, _startpos) in
        let _menhir_s = MenhirState112 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UNIT ->
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.REAL ->
            _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.QUOTE ->
            _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INT ->
            _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.BOOL ->
            _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.BITV ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 112
    
    and _menhir_run_136 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_lexpr -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _menhir_s = MenhirState136 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.VOID ->
            _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.TRUE ->
            _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.STRING _v ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MINUS ->
            _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET ->
            _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTSQ ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTBR ->
            _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.IF ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEXADECIMAL _v ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FORALL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FALSE ->
            _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DISTINCT ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DECIMAL _v ->
            _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.CUT ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.CHECK ->
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 136
    
    and _menhir_run_150 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_lexpr -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _menhir_s = MenhirState150 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.VOID ->
            _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.TRUE ->
            _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.STRING _v ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MINUS ->
            _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET ->
            _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTSQ ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTBR ->
            _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.IF ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEXADECIMAL _v ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FORALL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FALSE ->
            _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DISTINCT ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DECIMAL _v ->
            _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.CUT ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.CHECK ->
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 150
    
    and _menhir_run_152 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_lexpr -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _menhir_s = MenhirState152 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.VOID ->
            _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.TRUE ->
            _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.STRING _v ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MINUS ->
            _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET ->
            _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTSQ ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTBR ->
            _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.IF ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEXADECIMAL _v ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FORALL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FALSE ->
            _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DISTINCT ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DECIMAL _v ->
            _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.CUT ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.CHECK ->
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 152
    
    and _menhir_run_154 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_lexpr -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _menhir_s = MenhirState154 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.VOID ->
            _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.TRUE ->
            _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.STRING _v ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MINUS ->
            _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET ->
            _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTSQ ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTBR ->
            _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.IF ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEXADECIMAL _v ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FORALL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FALSE ->
            _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DISTINCT ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DECIMAL _v ->
            _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.CUT ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.CHECK ->
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 154
    
    and _menhir_run_156 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_lexpr -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _menhir_s = MenhirState156 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.VOID ->
            _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.TRUE ->
            _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.STRING _v ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MINUS ->
            _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET ->
            _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTSQ ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTBR ->
            _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.IF ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEXADECIMAL _v ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FORALL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FALSE ->
            _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DISTINCT ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DECIMAL _v ->
            _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.CUT ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.CHECK ->
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 156
    
    and _menhir_run_158 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_lexpr -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _menhir_s = MenhirState158 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.VOID ->
            _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.TRUE ->
            _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.STRING _v ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MINUS ->
            _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET ->
            _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTSQ ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTBR ->
            _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.IF ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEXADECIMAL _v ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FORALL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FALSE ->
            _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DISTINCT ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DECIMAL _v ->
            _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.CUT ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.CHECK ->
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 158
    
    and _menhir_run_160 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_lexpr -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _menhir_s = MenhirState160 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.VOID ->
            _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.TRUE ->
            _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.STRING _v ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MINUS ->
            _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET ->
            _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTSQ ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTBR ->
            _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.IF ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEXADECIMAL _v ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FORALL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FALSE ->
            _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DISTINCT ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DECIMAL _v ->
            _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.CUT ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.CHECK ->
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 160
    
    and _menhir_run_164 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_lexpr -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _menhir_s = MenhirState164 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.VOID ->
            _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.TRUE ->
            _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.STRING _v ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MINUS ->
            _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET ->
            _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTSQ ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTBR ->
            _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.IF ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEXADECIMAL _v ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FORALL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FALSE ->
            _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DISTINCT ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DECIMAL _v ->
            _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.CUT ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.CHECK ->
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 164
    
    and _menhir_run_166 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_lexpr -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _menhir_s = MenhirState166 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.VOID ->
            _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.TRUE ->
            _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.STRING _v ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MINUS ->
            _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET ->
            _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTSQ ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTBR ->
            _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.IF ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEXADECIMAL _v ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FORALL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FALSE ->
            _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DISTINCT ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DECIMAL _v ->
            _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.CUT ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.CHECK ->
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 166
    
    and _menhir_run_168 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_lexpr -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell0_MINUS (_menhir_stack, _startpos) in
        let _menhir_s = MenhirState168 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.VOID ->
            _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.TRUE ->
            _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.STRING _v ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MINUS ->
            _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET ->
            _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTSQ ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTBR ->
            _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.IF ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEXADECIMAL _v ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FORALL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FALSE ->
            _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DISTINCT ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DECIMAL _v ->
            _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.CUT ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.CHECK ->
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 168
    
    and _menhir_run_170 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_lexpr -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _menhir_s = MenhirState170 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.VOID ->
            _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.TRUE ->
            _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.STRING _v ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MINUS ->
            _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET ->
            _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTSQ ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTBR ->
            _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.IF ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEXADECIMAL _v ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FORALL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FALSE ->
            _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DISTINCT ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DECIMAL _v ->
            _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.CUT ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.CHECK ->
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 170
    
    and _menhir_run_182 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_lexpr -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _menhir_s = MenhirState182 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.VOID ->
            _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.TRUE ->
            _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.STRING _v ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MINUS ->
            _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET ->
            _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTSQ ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTBR ->
            _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.IF ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEXADECIMAL _v ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FORALL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FALSE ->
            _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DISTINCT ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DECIMAL _v ->
            _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.CUT ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.CHECK ->
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 182
    
    and _menhir_run_172 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_lexpr -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _menhir_s = MenhirState172 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.VOID ->
            _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.TRUE ->
            _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.STRING _v ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MINUS ->
            _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET ->
            _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTSQ ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTBR ->
            _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.IF ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEXADECIMAL _v ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FORALL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FALSE ->
            _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DISTINCT ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DECIMAL _v ->
            _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.CUT ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.CHECK ->
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 172
    
    and _menhir_run_138 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_lexpr -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFTBR ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.INTEGER _v ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.COMMA ->
                    let _tok = _menhir_lexer _menhir_lexbuf in
                    (match (_tok : MenhirBasics.token) with
                    | Tokens.INTEGER _v_1 ->
                        let _tok = _menhir_lexer _menhir_lexbuf in
                        (match (_tok : MenhirBasics.token) with
                        | Tokens.RIGHTBR ->
                            let _endpos_4 = _menhir_lexbuf.Lexing.lex_curr_p in
                            let _tok = _menhir_lexer _menhir_lexbuf in
                            let MenhirCell1_lexpr (_menhir_stack, _menhir_s, e, _startpos_e_, _) = _menhir_stack in
                            let (_endpos__7_, j, i) = (_endpos_4, _v_1, _v) in
                            let _v = _menhir_action_059 _endpos__7_ _startpos_e_ e i j in
                            _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__7_ _startpos_e_ _v _menhir_s _tok
                        | _ ->
                            _eRR 142)
                    | _ ->
                        _eRR 141)
                | _ ->
                    _eRR 140)
            | _ ->
                _eRR 139)
        | _ ->
            _eRR 138
    
    and _menhir_run_174 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_lexpr -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _menhir_s = MenhirState174 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.VOID ->
            _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.TRUE ->
            _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.STRING _v ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MINUS ->
            _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET ->
            _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTSQ ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTBR ->
            _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.IF ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEXADECIMAL _v ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FORALL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FALSE ->
            _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DISTINCT ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DECIMAL _v ->
            _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.CUT ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.CHECK ->
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 174
    
    and _menhir_run_176 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_lexpr -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _menhir_s = MenhirState176 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.VOID ->
            _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.TRUE ->
            _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.STRING _v ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MINUS ->
            _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET ->
            _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTSQ ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTBR ->
            _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.IF ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEXADECIMAL _v ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FORALL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FALSE ->
            _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DISTINCT ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DECIMAL _v ->
            _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.CUT ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.CHECK ->
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 176
    
    and _menhir_run_178 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_lexpr -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _menhir_s = MenhirState178 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.VOID ->
            _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.TRUE ->
            _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.STRING _v ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MINUS ->
            _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET ->
            _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTSQ ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTBR ->
            _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.IF ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEXADECIMAL _v ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FORALL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FALSE ->
            _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DISTINCT ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DECIMAL _v ->
            _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.CUT ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.CHECK ->
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 178
    
    and _menhir_run_162 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_lexpr -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _menhir_s = MenhirState162 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.VOID ->
            _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.TRUE ->
            _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.STRING _v ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MINUS ->
            _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET ->
            _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTSQ ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTBR ->
            _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.IF ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEXADECIMAL _v ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FORALL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FALSE ->
            _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DISTINCT ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DECIMAL _v ->
            _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.CUT ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.CHECK ->
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 162
    
    and _menhir_run_180 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_lexpr -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _menhir_s = MenhirState180 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.VOID ->
            _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.TRUE ->
            _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.STRING _v ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MINUS ->
            _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET ->
            _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTSQ ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTBR ->
            _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.IF ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEXADECIMAL _v ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FORALL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FALSE ->
            _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DISTINCT ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DECIMAL _v ->
            _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.CUT ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.CHECK ->
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 180
    
    and _menhir_run_363 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_CHECK_SAT, _menhir_box_file) _menhir_cell1_decl_ident as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.TIMES ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.RIGHTARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.OR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.NOTEQ ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LRARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_182 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_172 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.EQUAL ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AXIOM | Tokens.CHECK_SAT | Tokens.EOF | Tokens.FUNC | Tokens.GOAL | Tokens.LOGIC | Tokens.PRED | Tokens.REWRITING | Tokens.THEORY | Tokens.TYPE ->
            let MenhirCell1_decl_ident (_menhir_stack, _, name) = _menhir_stack in
            let MenhirCell1_CHECK_SAT (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos_body_, body) = (_endpos, _v) in
            let _v = _menhir_action_028 _endpos_body_ _startpos__1_ body name in
            _menhir_goto_decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 363
    
    and _menhir_run_359 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_GOAL, _menhir_box_file) _menhir_cell1_decl_ident as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.TIMES ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.RIGHTARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.OR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.NOTEQ ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LRARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_182 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_172 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.EQUAL ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AXIOM | Tokens.CHECK_SAT | Tokens.EOF | Tokens.FUNC | Tokens.GOAL | Tokens.LOGIC | Tokens.PRED | Tokens.REWRITING | Tokens.THEORY | Tokens.TYPE ->
            let MenhirCell1_decl_ident (_menhir_stack, _, name) = _menhir_stack in
            let MenhirCell1_GOAL (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos_body_, body) = (_endpos, _v) in
            let _v = _menhir_action_027 _endpos_body_ _startpos__1_ body name in
            _menhir_goto_decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 359
    
    and _menhir_run_336 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_PRED, _menhir_box_file) _menhir_cell1_raw_named_ident as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.TIMES ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.RIGHTARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.OR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.NOTEQ ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LRARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_182 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_172 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.EQUAL ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState337 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.VOID ->
                _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.TRUE ->
                _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.STRING _v ->
                _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.PRED ->
                _menhir_run_308 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT ->
                _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MINUS ->
                _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET ->
                _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTSQ ->
                _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTPAR ->
                _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTBR ->
                _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.IF ->
                _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.HEXADECIMAL _v ->
                _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FUNC ->
                _menhir_run_317 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FALSE ->
                _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DISTINCT ->
                _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DECIMAL _v ->
                _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.CUT ->
                _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.CHECK ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 337)
        | Tokens.AXIOM | Tokens.CHECK_SAT | Tokens.EOF | Tokens.FUNC | Tokens.GOAL | Tokens.LOGIC | Tokens.PRED | Tokens.REWRITING | Tokens.THEORY | Tokens.TYPE ->
            let MenhirCell1_raw_named_ident (_menhir_stack, _, p, _, _) = _menhir_stack in
            let MenhirCell1_PRED (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos_body_, body) = (_endpos, _v) in
            let _v = _menhir_action_116 _endpos_body_ _startpos__1_ body p in
            _menhir_goto_separated_nonempty_list_AND_function_or_predicate_def_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_body_ _startpos__1_ _v _menhir_s _tok
        | _ ->
            _eRR 336
    
    and _menhir_goto_separated_nonempty_list_AND_function_or_predicate_def_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState372 ->
            _menhir_run_368 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState000 ->
            _menhir_run_368 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState337 ->
            _menhir_run_338 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState316 ->
            _menhir_run_334 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState326 ->
            _menhir_run_327 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_368 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_l_, _startpos_l_, l) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_024 _endpos_l_ _startpos_l_ l in
        _menhir_goto_decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_338 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_PRED, _menhir_box_file) _menhir_cell1_raw_named_ident, _menhir_box_file) _menhir_cell1_lexpr -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_lexpr (_menhir_stack, _, body, _, _endpos_body_) = _menhir_stack in
        let MenhirCell1_raw_named_ident (_menhir_stack, _, p, _, _) = _menhir_stack in
        let MenhirCell1_PRED (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos_xs_, xs) = (_endpos, _v) in
        let _v = _menhir_action_119 _endpos_body_ _startpos__1_ body p xs in
        _menhir_goto_separated_nonempty_list_AND_function_or_predicate_def_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_xs_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_334 : type  ttv_stack. ((((ttv_stack, _menhir_box_file) _menhir_cell1_PRED, _menhir_box_file) _menhir_cell1_raw_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file) _menhir_cell1_loption_separated_nonempty_list_COMMA_logic_binder__ _menhir_cell0_RIGHTPAR, _menhir_box_file) _menhir_cell1_lexpr -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_lexpr (_menhir_stack, _, body, _, _endpos_body_) = _menhir_stack in
        let MenhirCell0_RIGHTPAR (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_loption_separated_nonempty_list_COMMA_logic_binder__ (_menhir_stack, _, xs_inlined1) = _menhir_stack in
        let MenhirCell0_LEFTPAR (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_raw_named_ident (_menhir_stack, _, p, _, _) = _menhir_stack in
        let MenhirCell1_PRED (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos_xs_, xs) = (_endpos, _v) in
        let _v = _menhir_action_120 _endpos_body_ _startpos__1_ body p xs xs_inlined1 in
        _menhir_goto_separated_nonempty_list_AND_function_or_predicate_def_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_xs_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_327 : type  ttv_stack. ((((((ttv_stack, _menhir_box_file) _menhir_cell1_FUNC, _menhir_box_file) _menhir_cell1_raw_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file) _menhir_cell1_loption_separated_nonempty_list_COMMA_logic_binder__ _menhir_cell0_RIGHTPAR, _menhir_box_file) _menhir_cell1_primitive_type, _menhir_box_file) _menhir_cell1_EQUAL, _menhir_box_file) _menhir_cell1_lexpr -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_lexpr (_menhir_stack, _, body, _, _endpos_body_) = _menhir_stack in
        let MenhirCell1_EQUAL (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_primitive_type (_menhir_stack, _, ret_ty, _, _) = _menhir_stack in
        let MenhirCell0_RIGHTPAR (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_loption_separated_nonempty_list_COMMA_logic_binder__ (_menhir_stack, _, xs_inlined1) = _menhir_stack in
        let MenhirCell0_LEFTPAR (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_raw_named_ident (_menhir_stack, _, f, _, _) = _menhir_stack in
        let MenhirCell1_FUNC (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos_xs_, xs) = (_endpos, _v) in
        let _v = _menhir_action_118 _endpos_body_ _startpos__1_ body f ret_ty xs xs_inlined1 in
        _menhir_goto_separated_nonempty_list_AND_function_or_predicate_def_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_xs_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_325 : type  ttv_stack. ((((((ttv_stack, _menhir_box_file) _menhir_cell1_FUNC, _menhir_box_file) _menhir_cell1_raw_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file) _menhir_cell1_loption_separated_nonempty_list_COMMA_logic_binder__ _menhir_cell0_RIGHTPAR, _menhir_box_file) _menhir_cell1_primitive_type, _menhir_box_file) _menhir_cell1_EQUAL as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.TIMES ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.RIGHTARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.OR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.NOTEQ ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LRARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_182 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_172 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.EQUAL ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState326 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.VOID ->
                _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.TRUE ->
                _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.STRING _v ->
                _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.PRED ->
                _menhir_run_308 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT ->
                _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MINUS ->
                _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET ->
                _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTSQ ->
                _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTPAR ->
                _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTBR ->
                _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.IF ->
                _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.HEXADECIMAL _v ->
                _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FUNC ->
                _menhir_run_317 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FALSE ->
                _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DISTINCT ->
                _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DECIMAL _v ->
                _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.CUT ->
                _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.CHECK ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 326)
        | Tokens.AXIOM | Tokens.CHECK_SAT | Tokens.EOF | Tokens.FUNC | Tokens.GOAL | Tokens.LOGIC | Tokens.PRED | Tokens.REWRITING | Tokens.THEORY | Tokens.TYPE ->
            let MenhirCell1_EQUAL (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_primitive_type (_menhir_stack, _, ret_ty, _, _) = _menhir_stack in
            let MenhirCell0_RIGHTPAR (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_loption_separated_nonempty_list_COMMA_logic_binder__ (_menhir_stack, _, xs) = _menhir_stack in
            let MenhirCell0_LEFTPAR (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_raw_named_ident (_menhir_stack, _, f, _, _) = _menhir_stack in
            let MenhirCell1_FUNC (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos_body_, body) = (_endpos, _v) in
            let _v = _menhir_action_115 _endpos_body_ _startpos__1_ body f ret_ty xs in
            _menhir_goto_separated_nonempty_list_AND_function_or_predicate_def_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_body_ _startpos__1_ _v _menhir_s _tok
        | _ ->
            _eRR 325
    
    and _menhir_run_315 : type  ttv_stack. ((((ttv_stack, _menhir_box_file) _menhir_cell1_PRED, _menhir_box_file) _menhir_cell1_raw_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file) _menhir_cell1_loption_separated_nonempty_list_COMMA_logic_binder__ _menhir_cell0_RIGHTPAR as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.TIMES ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.RIGHTARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.OR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.NOTEQ ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LRARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_182 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_172 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.EQUAL ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState316 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.VOID ->
                _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.TRUE ->
                _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.STRING _v ->
                _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.PRED ->
                _menhir_run_308 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT ->
                _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MINUS ->
                _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET ->
                _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTSQ ->
                _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTPAR ->
                _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTBR ->
                _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.IF ->
                _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.HEXADECIMAL _v ->
                _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FUNC ->
                _menhir_run_317 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FALSE ->
                _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DISTINCT ->
                _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DECIMAL _v ->
                _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.CUT ->
                _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.CHECK ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 316)
        | Tokens.AXIOM | Tokens.CHECK_SAT | Tokens.EOF | Tokens.FUNC | Tokens.GOAL | Tokens.LOGIC | Tokens.PRED | Tokens.REWRITING | Tokens.THEORY | Tokens.TYPE ->
            let MenhirCell0_RIGHTPAR (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_loption_separated_nonempty_list_COMMA_logic_binder__ (_menhir_stack, _, xs) = _menhir_stack in
            let MenhirCell0_LEFTPAR (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_raw_named_ident (_menhir_stack, _, p, _, _) = _menhir_stack in
            let MenhirCell1_PRED (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos_body_, body) = (_endpos, _v) in
            let _v = _menhir_action_117 _endpos_body_ _startpos__1_ body p xs in
            _menhir_goto_separated_nonempty_list_AND_function_or_predicate_def_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_body_ _startpos__1_ _v _menhir_s _tok
        | _ ->
            _eRR 315
    
    and _menhir_run_305 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.TIMES ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.RIGHTARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PV ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.VOID ->
                let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
                let _menhir_stack = MenhirCell0_PV (_menhir_stack, _endpos_0) in
                _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState306
            | Tokens.TRUE ->
                let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
                let _menhir_stack = MenhirCell0_PV (_menhir_stack, _endpos_0) in
                _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState306
            | Tokens.STRING _v_1 ->
                let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
                let _menhir_stack = MenhirCell0_PV (_menhir_stack, _endpos_0) in
                _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState306
            | Tokens.NOT ->
                let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
                let _menhir_stack = MenhirCell0_PV (_menhir_stack, _endpos_0) in
                _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState306
            | Tokens.MINUS ->
                let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
                let _menhir_stack = MenhirCell0_PV (_menhir_stack, _endpos_0) in
                _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState306
            | Tokens.MATCH ->
                let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
                let _menhir_stack = MenhirCell0_PV (_menhir_stack, _endpos_0) in
                _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState306
            | Tokens.LET ->
                let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
                let _menhir_stack = MenhirCell0_PV (_menhir_stack, _endpos_0) in
                _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState306
            | Tokens.LEFTSQ ->
                let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
                let _menhir_stack = MenhirCell0_PV (_menhir_stack, _endpos_0) in
                _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState306
            | Tokens.LEFTPAR ->
                let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
                let _menhir_stack = MenhirCell0_PV (_menhir_stack, _endpos_0) in
                _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState306
            | Tokens.LEFTBR ->
                let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
                let _menhir_stack = MenhirCell0_PV (_menhir_stack, _endpos_0) in
                _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState306
            | Tokens.INTEGER _v_2 ->
                let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
                let _menhir_stack = MenhirCell0_PV (_menhir_stack, _endpos_0) in
                _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState306
            | Tokens.IF ->
                let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
                let _menhir_stack = MenhirCell0_PV (_menhir_stack, _endpos_0) in
                _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState306
            | Tokens.ID _v_3 ->
                let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
                let _menhir_stack = MenhirCell0_PV (_menhir_stack, _endpos_0) in
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState306
            | Tokens.HEXADECIMAL _v_4 ->
                let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
                let _menhir_stack = MenhirCell0_PV (_menhir_stack, _endpos_0) in
                _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState306
            | Tokens.FORALL ->
                let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
                let _menhir_stack = MenhirCell0_PV (_menhir_stack, _endpos_0) in
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState306
            | Tokens.FALSE ->
                let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
                let _menhir_stack = MenhirCell0_PV (_menhir_stack, _endpos_0) in
                _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState306
            | Tokens.EXISTS ->
                let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
                let _menhir_stack = MenhirCell0_PV (_menhir_stack, _endpos_0) in
                _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState306
            | Tokens.DISTINCT ->
                let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
                let _menhir_stack = MenhirCell0_PV (_menhir_stack, _endpos_0) in
                _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState306
            | Tokens.DECIMAL _v_5 ->
                let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
                let _menhir_stack = MenhirCell0_PV (_menhir_stack, _endpos_0) in
                _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState306
            | Tokens.CUT ->
                let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
                let _menhir_stack = MenhirCell0_PV (_menhir_stack, _endpos_0) in
                _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState306
            | Tokens.CHECK ->
                let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
                let _menhir_stack = MenhirCell0_PV (_menhir_stack, _endpos_0) in
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState306
            | Tokens.AXIOM | Tokens.CHECK_SAT | Tokens.EOF | Tokens.FUNC | Tokens.GOAL | Tokens.LOGIC | Tokens.PRED | Tokens.REWRITING | Tokens.THEORY | Tokens.TYPE ->
                let (_endpos__2_, e) = (_endpos_0, _v) in
                let _v = _menhir_action_111 e in
                _menhir_goto_rewriting_list _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__2_ _v _menhir_s _tok
            | _ ->
                _eRR 306)
        | Tokens.POWDOT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.OR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.NOTEQ ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LRARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_182 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_172 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.EQUAL ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AXIOM | Tokens.CHECK_SAT | Tokens.EOF | Tokens.FUNC | Tokens.GOAL | Tokens.LOGIC | Tokens.PRED | Tokens.REWRITING | Tokens.THEORY | Tokens.TYPE ->
            let (_endpos_e_, e) = (_endpos, _v) in
            let _v = _menhir_action_110 e in
            _menhir_goto_rewriting_list _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _v _menhir_s _tok
        | _ ->
            _eRR 305
    
    and _menhir_goto_rewriting_list : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState306 ->
            _menhir_run_307 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState303 ->
            _menhir_run_304 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_307 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_lexpr _menhir_cell0_PV -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell0_PV (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_lexpr (_menhir_stack, _menhir_s, e, _, _) = _menhir_stack in
        let (_endpos_l_, l) = (_endpos, _v) in
        let _v = _menhir_action_112 e l in
        _menhir_goto_rewriting_list _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_l_ _v _menhir_s _tok
    
    and _menhir_run_304 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_REWRITING, _menhir_box_file) _menhir_cell1_decl_ident -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_decl_ident (_menhir_stack, _, name) = _menhir_stack in
        let MenhirCell1_REWRITING (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos_l_, l) = (_endpos, _v) in
        let _v = _menhir_action_026 _endpos_l_ _startpos__1_ l name in
        _menhir_goto_decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_296 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_AXIOM, _menhir_box_file) _menhir_cell1_decl_ident as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.TIMES ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.RIGHTARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.OR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.NOTEQ ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LRARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_182 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_172 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.EQUAL ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AXIOM | Tokens.CASESPLIT | Tokens.END ->
            let MenhirCell1_decl_ident (_menhir_stack, _, name) = _menhir_stack in
            let MenhirCell1_AXIOM (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos_body_, body) = (_endpos, _v) in
            let _v = _menhir_action_175 _endpos_body_ _startpos__1_ body name in
            _menhir_goto_theory_elt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 296
    
    and _menhir_goto_theory_elt : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_theory_elt (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.CASESPLIT ->
            _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState297
        | Tokens.AXIOM ->
            _menhir_run_293 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState297
        | Tokens.END ->
            let _v_0 = _menhir_action_075 () in
            _menhir_run_298 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_074 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_CASESPLIT (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState074 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 74
    
    and _menhir_run_293 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_AXIOM (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState293 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 293
    
    and _menhir_run_298 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_theory_elt -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_theory_elt (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_076 x xs in
        _menhir_goto_list_theory_elt_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_goto_list_theory_elt_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState073 ->
            _menhir_run_299 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState297 ->
            _menhir_run_298 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_299 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_THEORY, _menhir_box_file) _menhir_cell1_decl_ident, _menhir_box_file) _menhir_cell1_decl_ident -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell1_decl_ident (_menhir_stack, _, ext) = _menhir_stack in
        let MenhirCell1_decl_ident (_menhir_stack, _, id) = _menhir_stack in
        let MenhirCell1_THEORY (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (l, _endpos__7_) = (_v, _endpos) in
        let _v = _menhir_action_019 _endpos__7_ _startpos__1_ ext id l in
        _menhir_goto_decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_292 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_CASESPLIT, _menhir_box_file) _menhir_cell1_decl_ident as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.TIMES ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.RIGHTARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.OR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.NOTEQ ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LRARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_182 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_172 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.EQUAL ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AXIOM | Tokens.CASESPLIT | Tokens.END ->
            let MenhirCell1_decl_ident (_menhir_stack, _, name) = _menhir_stack in
            let MenhirCell1_CASESPLIT (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos_body_, body) = (_endpos, _v) in
            let _v = _menhir_action_176 _endpos_body_ _startpos__1_ body name in
            _menhir_goto_theory_elt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 292
    
    and _menhir_run_291 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_STRING -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_STRING (_menhir_stack, _menhir_s, name, _startpos_name_, _) = _menhir_stack in
        let (_endpos_e_, e) = (_endpos, _v) in
        let _v = _menhir_action_065 _endpos_e_ _startpos_name_ e name in
        _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_name_ _v _menhir_s _tok
    
    and _menhir_run_290 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_NOT -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_NOT (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos_p_, p) = (_endpos, _v) in
        let _v = _menhir_action_038 _endpos_p_ _startpos__1_ p in
        _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_p_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_289 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_MINUS -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_MINUS (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos_x_, x) = (_endpos, _v) in
        let _v = _menhir_action_039 _endpos_x_ _startpos__1_ x in
        _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_275 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_simple_pattern as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.TIMES ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.RIGHTARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.OR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.NOTEQ ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LRARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_182 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_172 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.EQUAL ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.BAR | Tokens.END ->
            let MenhirCell1_simple_pattern (_menhir_stack, _menhir_s, p) = _menhir_stack in
            let e = _v in
            let _v = _menhir_action_088 e p in
            _menhir_goto_match_case _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 275
    
    and _menhir_goto_match_case : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState271 ->
            _menhir_run_288 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState286 ->
            _menhir_run_287 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState272 ->
            _menhir_run_276 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_288 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_MATCH, _menhir_box_file) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let c = _v in
        let _v = _menhir_action_089 c in
        _menhir_goto_match_cases _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_match_cases : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_MATCH, _menhir_box_file) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.END ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_lexpr (_menhir_stack, _, e, _, _) = _menhir_stack in
            let MenhirCell1_MATCH (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__5_, cases) = (_endpos, _v) in
            let _v = _menhir_action_069 _endpos__5_ _startpos__1_ cases e in
            _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__5_ _startpos__1_ _v _menhir_s _tok
        | Tokens.BAR ->
            let _menhir_stack = MenhirCell1_match_cases (_menhir_stack, _menhir_s, _v) in
            let _menhir_s = MenhirState286 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 286)
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_287 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_MATCH, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_cell1_match_cases -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let MenhirCell1_match_cases (_menhir_stack, _menhir_s, l) = _menhir_stack in
        let c = _v in
        let _v = _menhir_action_091 c l in
        _menhir_goto_match_cases _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_276 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_MATCH, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_cell1_BAR -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let MenhirCell1_BAR (_menhir_stack, _menhir_s) = _menhir_stack in
        let c = _v in
        let _v = _menhir_action_090 c in
        _menhir_goto_match_cases _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_270 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_MATCH as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.WITH ->
            let _menhir_s = MenhirState271 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.BAR ->
                let _menhir_stack = MenhirCell1_BAR (_menhir_stack, _menhir_s) in
                let _menhir_s = MenhirState272 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.ID _v ->
                    _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | _ ->
                    _eRR 272)
            | _ ->
                _eRR 271)
        | Tokens.TIMES ->
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.RIGHTARROW ->
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.OR ->
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.NOTEQ ->
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LT ->
            _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LRARROW ->
            _menhir_run_182 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LE ->
            _menhir_run_172 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GT ->
            _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GE ->
            _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.EQUAL ->
            _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND ->
            _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer
        | _ ->
            _eRR 270
    
    and _menhir_run_269 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_ident as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.TIMES ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.RIGHTARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.OR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.NOTEQ ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LRARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_182 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_172 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.EQUAL ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.COMMA | Tokens.IN ->
            let MenhirCell1_ident (_menhir_stack, _menhir_s, a, _startpos_a_, _) = _menhir_stack in
            let (_endpos_b_, b) = (_endpos, _v) in
            let _v = _menhir_action_036 _endpos_b_ _startpos_a_ a b in
            (match (_tok : MenhirBasics.token) with
            | Tokens.COMMA ->
                let _menhir_stack = MenhirCell1_let_binder (_menhir_stack, _menhir_s, _v) in
                let _menhir_s = MenhirState265 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.ID _v ->
                    _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | _ ->
                    _eRR 265)
            | Tokens.IN ->
                let x = _v in
                let _v = _menhir_action_129 x in
                _menhir_goto_separated_nonempty_list_COMMA_let_binder_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _menhir_fail ())
        | _ ->
            _eRR 269
    
    and _menhir_goto_separated_nonempty_list_COMMA_let_binder_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState265 ->
            _menhir_run_266 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState084 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_266 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_let_binder -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_let_binder (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_130 x xs in
        _menhir_goto_separated_nonempty_list_COMMA_let_binder_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_085 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LET as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_separated_nonempty_list_COMMA_let_binder_ (_menhir_stack, _menhir_s, _v) in
        let _menhir_s = MenhirState086 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.VOID ->
            _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.TRUE ->
            _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.STRING _v ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MINUS ->
            _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET ->
            _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTSQ ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTBR ->
            _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.IF ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEXADECIMAL _v ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FORALL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FALSE ->
            _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DISTINCT ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DECIMAL _v ->
            _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.CUT ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.CHECK ->
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 86
    
    and _menhir_run_263 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_LET, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_let_binder_ as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.TIMES ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.RIGHTARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.OR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.NOTEQ ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LRARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_182 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_172 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.EQUAL ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AXIOM | Tokens.BAR | Tokens.CASESPLIT | Tokens.CHECK_SAT | Tokens.COMMA | Tokens.ELSE | Tokens.END | Tokens.EOF | Tokens.FUNC | Tokens.GOAL | Tokens.IN | Tokens.LEFTARROW | Tokens.LOGIC | Tokens.PRED | Tokens.PV | Tokens.REWRITING | Tokens.RIGHTBR | Tokens.RIGHTPAR | Tokens.RIGHTSQ | Tokens.THEN | Tokens.THEORY | Tokens.TYPE | Tokens.WITH ->
            let MenhirCell1_separated_nonempty_list_COMMA_let_binder_ (_menhir_stack, _, l) = _menhir_stack in
            let MenhirCell1_LET (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos_body_, body) = (_endpos, _v) in
            let _v = _menhir_action_066 _endpos_body_ _startpos__1_ body l in
            _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_body_ _startpos__1_ _v _menhir_s _tok
        | _ ->
            _eRR 263
    
    and _menhir_run_261 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LEFTPAR as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.TIMES ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.RIGHTPAR ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_LEFTPAR (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (e, _endpos__3_) = (_v, _endpos_0) in
            let _v = _menhir_action_154 e in
            _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
        | Tokens.RIGHTARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.OR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.NOTEQ ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LRARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_182 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_172 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.EQUAL ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer
        | _ ->
            _eRR 261
    
    and _menhir_run_257 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_ident as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.TIMES ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.RIGHTARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.OR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.NOTEQ ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LRARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_182 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_172 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.EQUAL ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PV | Tokens.RIGHTBR ->
            let MenhirCell1_ident (_menhir_stack, _menhir_s, id, _startpos_id_, _) = _menhir_stack in
            let (_endpos_e_, e) = (_endpos, _v) in
            let _v = _menhir_action_035 _endpos_e_ _startpos_id_ e id in
            (match (_tok : MenhirBasics.token) with
            | Tokens.PV ->
                let _menhir_stack = MenhirCell1_label_expr (_menhir_stack, _menhir_s, _v) in
                let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
                let _menhir_stack = MenhirCell0_PV (_menhir_stack, _endpos) in
                let _menhir_s = MenhirState103 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.ID _v ->
                    _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | _ ->
                    _eRR 103)
            | Tokens.RIGHTBR ->
                let x = _v in
                let _v = _menhir_action_149 x in
                _menhir_goto_separated_nonempty_list_PV_label_expr_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _menhir_fail ())
        | _ ->
            _eRR 257
    
    and _menhir_goto_separated_nonempty_list_PV_label_expr_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState093 ->
            _menhir_run_258 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState103 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState099 ->
            _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_258 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_LEFTBR -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell1_LEFTBR (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (l, _endpos__3_) = (_v, _endpos) in
        let _v = _menhir_action_161 _endpos__3_ _startpos__1_ l in
        _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_104 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_label_expr _menhir_cell0_PV -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell0_PV (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_label_expr (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_150 x xs in
        _menhir_goto_separated_nonempty_list_PV_label_expr_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_100 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LEFTBR, _menhir_box_file) _menhir_cell1_simple_expr -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell1_simple_expr (_menhir_stack, _, s, _, _) = _menhir_stack in
        let MenhirCell1_LEFTBR (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (l, _endpos__5_) = (_v, _endpos) in
        let _v = _menhir_action_162 _endpos__5_ _startpos__1_ l s in
        _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__5_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_256 : type  ttv_stack. ((((ttv_stack, _menhir_box_file) _menhir_cell1_IF, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.TIMES ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.NOTEQ ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_172 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.EQUAL ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND | Tokens.AXIOM | Tokens.BAR | Tokens.CASESPLIT | Tokens.CHECK_SAT | Tokens.COMMA | Tokens.ELSE | Tokens.END | Tokens.EOF | Tokens.FUNC | Tokens.GOAL | Tokens.IN | Tokens.LEFTARROW | Tokens.LOGIC | Tokens.LRARROW | Tokens.OR | Tokens.PRED | Tokens.PV | Tokens.REWRITING | Tokens.RIGHTARROW | Tokens.RIGHTBR | Tokens.RIGHTPAR | Tokens.RIGHTSQ | Tokens.THEN | Tokens.THEORY | Tokens.TYPE | Tokens.WITH | Tokens.XOR ->
            let MenhirCell1_lexpr (_menhir_stack, _, then_t, _, _) = _menhir_stack in
            let MenhirCell1_lexpr (_menhir_stack, _, cond, _, _) = _menhir_stack in
            let MenhirCell1_IF (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos_else_t_, else_t) = (_endpos, _v) in
            let _v = _menhir_action_062 _endpos_else_t_ _startpos__1_ cond else_t then_t in
            _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_else_t_ _startpos__1_ _v _menhir_s _tok
        | _ ->
            _eRR 256
    
    and _menhir_run_254 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_IF, _menhir_box_file) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.TIMES ->
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.RIGHTARROW ->
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.OR ->
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.NOTEQ ->
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LT ->
            _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LRARROW ->
            _menhir_run_182 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LE ->
            _menhir_run_172 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GT ->
            _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GE ->
            _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.EQUAL ->
            _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.ELSE ->
            let _menhir_s = MenhirState255 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.VOID ->
                _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.TRUE ->
                _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.STRING _v ->
                _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MINUS ->
                _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET ->
                _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTSQ ->
                _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTPAR ->
                _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTBR ->
                _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.IF ->
                _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.HEXADECIMAL _v ->
                _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FALSE ->
                _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DISTINCT ->
                _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DECIMAL _v ->
                _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.CUT ->
                _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.CHECK ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 255)
        | Tokens.AT ->
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND ->
            _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer
        | _ ->
            _eRR 254
    
    and _menhir_run_252 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.TIMES ->
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.THEN ->
            let _menhir_s = MenhirState253 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.VOID ->
                _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.TRUE ->
                _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.STRING _v ->
                _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MINUS ->
                _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET ->
                _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTSQ ->
                _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTPAR ->
                _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTBR ->
                _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.IF ->
                _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.HEXADECIMAL _v ->
                _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FALSE ->
                _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DISTINCT ->
                _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DECIMAL _v ->
                _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.CUT ->
                _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.CHECK ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 253)
        | Tokens.SLASH ->
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.RIGHTARROW ->
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.OR ->
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.NOTEQ ->
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LT ->
            _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LRARROW ->
            _menhir_run_182 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LE ->
            _menhir_run_172 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GT ->
            _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GE ->
            _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.EQUAL ->
            _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND ->
            _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer
        | _ ->
            _eRR 252
    
    and _menhir_run_251 : type  ttv_stack. (((((ttv_stack, _menhir_box_file) _menhir_cell1_FORALL, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_multi_logic_binder_, _menhir_box_file) _menhir_cell1_triggers, _menhir_box_file) _menhir_cell1_filters as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.TIMES ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.RIGHTARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.OR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.NOTEQ ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LRARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_182 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_172 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.EQUAL ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AXIOM | Tokens.BAR | Tokens.CASESPLIT | Tokens.CHECK_SAT | Tokens.COMMA | Tokens.ELSE | Tokens.END | Tokens.EOF | Tokens.FUNC | Tokens.GOAL | Tokens.IN | Tokens.LEFTARROW | Tokens.LOGIC | Tokens.PRED | Tokens.PV | Tokens.REWRITING | Tokens.RIGHTBR | Tokens.RIGHTPAR | Tokens.RIGHTSQ | Tokens.THEN | Tokens.THEORY | Tokens.TYPE | Tokens.WITH ->
            let MenhirCell1_filters (_menhir_stack, _, filters) = _menhir_stack in
            let MenhirCell1_triggers (_menhir_stack, _, triggers) = _menhir_stack in
            let MenhirCell1_separated_nonempty_list_COMMA_multi_logic_binder_ (_menhir_stack, _, vars) = _menhir_stack in
            let MenhirCell1_FORALL (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos_body_, body) = (_endpos, _v) in
            let _v = _menhir_action_063 _endpos_body_ _startpos__1_ body filters triggers vars in
            _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_body_ _startpos__1_ _v _menhir_s _tok
        | _ ->
            _eRR 251
    
    and _menhir_run_227 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.TIMES ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.RIGHTARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.OR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.NOTEQ ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LRARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_182 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_172 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.IN ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState228 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.RIGHTSQ ->
                _menhir_run_229 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTSQ ->
                _menhir_run_230 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 228)
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.EQUAL ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.BAR | Tokens.COMMA | Tokens.RIGHTSQ ->
            let (_endpos_e_, _startpos_e_, e) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_070 e in
            _menhir_goto_lexpr_or_dom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_e_ _v _menhir_s _tok
        | _ ->
            _eRR 227
    
    and _menhir_run_229 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let _endpos__1_ = _endpos in
        let _v = _menhir_action_174 () in
        _menhir_goto_sq _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _v _menhir_s _tok
    
    and _menhir_goto_sq : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState244 ->
            _menhir_run_245 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState228 ->
            _menhir_run_231 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_245 : type  ttv_stack. ((((ttv_stack, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_cell1_sq, _menhir_box_file) _menhir_cell1_bound, _menhir_box_file) _menhir_cell1_bound -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_bound (_menhir_stack, _, rb) = _menhir_stack in
        let MenhirCell1_bound (_menhir_stack, _, lb) = _menhir_stack in
        let MenhirCell1_sq (_menhir_stack, _, ls, _) = _menhir_stack in
        let MenhirCell1_lexpr (_menhir_stack, _menhir_s, e, _startpos_e_, _) = _menhir_stack in
        let (_endpos_rs_, rs) = (_endpos, _v) in
        let _v = _menhir_action_071 _endpos_rs_ _startpos_e_ e lb ls rb rs in
        _menhir_goto_lexpr_or_dom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_rs_ _startpos_e_ _v _menhir_s _tok
    
    and _menhir_goto_lexpr_or_dom : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _menhir_stack = MenhirCell1_lexpr_or_dom (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState225 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.VOID ->
                _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.TRUE ->
                _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.STRING _v ->
                _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MINUS ->
                _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET ->
                _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTSQ ->
                _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTPAR ->
                _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTBR ->
                _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.IF ->
                _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.HEXADECIMAL _v ->
                _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FALSE ->
                _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DISTINCT ->
                _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DECIMAL _v ->
                _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.CUT ->
                _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.CHECK ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 225)
        | Tokens.BAR | Tokens.RIGHTSQ ->
            let (_endpos_x_, _startpos_x_, x) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_133 x in
            _menhir_goto_separated_nonempty_list_COMMA_lexpr_or_dom_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _startpos_x_ _v _menhir_s _tok
        | _ ->
            _eRR 224
    
    and _menhir_goto_separated_nonempty_list_COMMA_lexpr_or_dom_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState225 ->
            _menhir_run_226 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState115 ->
            _menhir_run_219 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState218 ->
            _menhir_run_219 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_226 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_lexpr_or_dom -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_lexpr_or_dom (_menhir_stack, _menhir_s, x, _startpos_x_, _) = _menhir_stack in
        let (_endpos_xs_, xs) = (_endpos, _v) in
        let _v = _menhir_action_134 x xs in
        _menhir_goto_separated_nonempty_list_COMMA_lexpr_or_dom_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_xs_ _startpos_x_ _v _menhir_s _tok
    
    and _menhir_run_219 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_l_, _startpos_l_, l) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_177 _endpos_l_ _startpos_l_ l in
        match (_tok : MenhirBasics.token) with
        | Tokens.BAR ->
            let _menhir_stack = MenhirCell1_trigger (_menhir_stack, _menhir_s, _v) in
            let _menhir_s = MenhirState218 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.VOID ->
                _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.TRUE ->
                _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.STRING _v ->
                _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MINUS ->
                _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET ->
                _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTSQ ->
                _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTPAR ->
                _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTBR ->
                _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.IF ->
                _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.HEXADECIMAL _v ->
                _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FALSE ->
                _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DISTINCT ->
                _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DECIMAL _v ->
                _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.CUT ->
                _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.CHECK ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 218)
        | Tokens.RIGHTSQ ->
            let x = _v in
            let _v = _menhir_action_123 x in
            _menhir_goto_separated_nonempty_list_BAR_trigger_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _menhir_fail ()
    
    and _menhir_goto_separated_nonempty_list_BAR_trigger_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState115 ->
            _menhir_run_246 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState218 ->
            _menhir_run_220 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_246 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_multi_logic_binder_, _menhir_box_file) _menhir_cell1_LEFTSQ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell1_LEFTSQ (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
        let l = _v in
        let _v = _menhir_action_179 l in
        _menhir_goto_triggers _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_triggers : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_multi_logic_binder_ as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState114 ->
            _menhir_run_248 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState117 ->
            _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_220 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_trigger -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_trigger (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_124 x xs in
        _menhir_goto_separated_nonempty_list_BAR_trigger_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_231 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_sq (_menhir_stack, _menhir_s, _v, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.QM_ID _v_0 ->
            _menhir_run_232 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState231
        | Tokens.QM ->
            _menhir_run_233 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState231
        | Tokens.MINUS ->
            _menhir_run_234 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState231
        | Tokens.INTEGER _v_1 ->
            _menhir_run_238 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState231
        | Tokens.ID _v_2 ->
            _menhir_run_239 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState231
        | Tokens.HEXADECIMAL _v_3 ->
            _menhir_run_240 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState231
        | Tokens.DECIMAL _v_4 ->
            _menhir_run_241 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState231
        | _ ->
            _eRR 231
    
    and _menhir_run_232 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_012 _endpos_s_ _startpos_s_ s in
        _menhir_goto_bound _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_bound : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState243 ->
            _menhir_run_244 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState231 ->
            _menhir_run_242 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_244 : type  ttv_stack. ((((ttv_stack, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_cell1_sq, _menhir_box_file) _menhir_cell1_bound as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_bound (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHTSQ ->
            _menhir_run_229 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState244
        | Tokens.LEFTSQ ->
            _menhir_run_230 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState244
        | _ ->
            _eRR 244
    
    and _menhir_run_230 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let _endpos__1_ = _endpos in
        let _v = _menhir_action_173 () in
        _menhir_goto_sq _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _v _menhir_s _tok
    
    and _menhir_run_242 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_lexpr, _menhir_box_file) _menhir_cell1_sq as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_bound (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _menhir_s = MenhirState243 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.QM_ID _v ->
                _menhir_run_232 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.QM ->
                _menhir_run_233 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MINUS ->
                _menhir_run_234 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_238 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.ID _v ->
                _menhir_run_239 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.HEXADECIMAL _v ->
                _menhir_run_240 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DECIMAL _v ->
                _menhir_run_241 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 243)
        | _ ->
            _eRR 242
    
    and _menhir_run_233 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_010 _endpos__1_ _startpos__1_ in
        _menhir_goto_bound _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_234 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.INTEGER _v ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let (_startpos__1_, _endpos_s_, s) = (_startpos, _endpos, _v) in
            let _v = _menhir_action_016 _endpos_s_ _startpos__1_ s in
            _menhir_goto_bound _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | Tokens.HEXADECIMAL _v ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let (_startpos__1_, _endpos_s_, s) = (_startpos, _endpos, _v) in
            let _v = _menhir_action_018 _endpos_s_ _startpos__1_ s in
            _menhir_goto_bound _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | Tokens.DECIMAL _v ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let (_startpos__1_, _endpos_s_, s) = (_startpos, _endpos, _v) in
            let _v = _menhir_action_017 _endpos_s_ _startpos__1_ s in
            _menhir_goto_bound _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 234
    
    and _menhir_run_238 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_013 _endpos_s_ _startpos_s_ s in
        _menhir_goto_bound _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_239 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_011 _endpos_s_ _startpos_s_ s in
        _menhir_goto_bound _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_240 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_015 _endpos_s_ _startpos_s_ s in
        _menhir_goto_bound _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_241 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_014 _endpos_s_ _startpos_s_ s in
        _menhir_goto_bound _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_223 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_raw_ident as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.TIMES ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.RIGHTARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.OR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.NOTEQ ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LRARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_182 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_172 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.EQUAL ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.BAR | Tokens.COMMA | Tokens.RIGHTSQ ->
            let MenhirCell1_raw_ident (_menhir_stack, _menhir_s, id, _startpos_id_, _) = _menhir_stack in
            let (_endpos_e_, e) = (_endpos, _v) in
            let _v = _menhir_action_072 _endpos_e_ _startpos_id_ e id in
            _menhir_goto_lexpr_or_dom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_id_ _v _menhir_s _tok
        | _ ->
            _eRR 223
    
    and _menhir_run_209 : type  ttv_stack. (((((ttv_stack, _menhir_box_file) _menhir_cell1_EXISTS, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_multi_logic_binder_, _menhir_box_file) _menhir_cell1_triggers, _menhir_box_file) _menhir_cell1_filters as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.TIMES ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.RIGHTARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.OR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.NOTEQ ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LRARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_182 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_172 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.EQUAL ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AXIOM | Tokens.BAR | Tokens.CASESPLIT | Tokens.CHECK_SAT | Tokens.COMMA | Tokens.ELSE | Tokens.END | Tokens.EOF | Tokens.FUNC | Tokens.GOAL | Tokens.IN | Tokens.LEFTARROW | Tokens.LOGIC | Tokens.PRED | Tokens.PV | Tokens.REWRITING | Tokens.RIGHTBR | Tokens.RIGHTPAR | Tokens.RIGHTSQ | Tokens.THEN | Tokens.THEORY | Tokens.TYPE | Tokens.WITH ->
            let MenhirCell1_filters (_menhir_stack, _, filters) = _menhir_stack in
            let MenhirCell1_triggers (_menhir_stack, _, triggers) = _menhir_stack in
            let MenhirCell1_separated_nonempty_list_COMMA_multi_logic_binder_ (_menhir_stack, _, vars) = _menhir_stack in
            let MenhirCell1_EXISTS (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos_body_, body) = (_endpos, _v) in
            let _v = _menhir_action_064 _endpos_body_ _startpos__1_ body filters triggers vars in
            _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_body_ _startpos__1_ _v _menhir_s _tok
        | _ ->
            _eRR 209
    
    and _menhir_run_204 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.TIMES ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.RIGHTARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.OR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.NOTEQ ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LRARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_182 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_172 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.EQUAL ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.COMMA ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_202 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.RIGHTPAR ->
            let MenhirCell1_lexpr (_menhir_stack, _menhir_s, e1, _, _) = _menhir_stack in
            let e2 = _v in
            let _v = _menhir_action_077 e1 e2 in
            _menhir_goto_list2_lexpr_sep_comma _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 204
    
    and _menhir_run_202 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_lexpr -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _menhir_s = MenhirState202 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.VOID ->
            _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.TRUE ->
            _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.STRING _v ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MINUS ->
            _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET ->
            _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTSQ ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTBR ->
            _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.IF ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEXADECIMAL _v ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FORALL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FALSE ->
            _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DISTINCT ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DECIMAL _v ->
            _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.CUT ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.CHECK ->
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 202
    
    and _menhir_goto_list2_lexpr_sep_comma : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState202 ->
            _menhir_run_203 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState121 ->
            _menhir_run_199 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_203 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_lexpr -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_lexpr (_menhir_stack, _menhir_s, e, _, _) = _menhir_stack in
        let l = _v in
        let _v = _menhir_action_078 e l in
        _menhir_goto_list2_lexpr_sep_comma _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_199 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_DISTINCT _menhir_cell0_LEFTPAR -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell0_LEFTPAR (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_DISTINCT (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (l, _endpos__4_) = (_v, _endpos) in
        let _v = _menhir_action_061 _endpos__4_ _startpos__1_ l in
        _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__4_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_201 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_DISTINCT _menhir_cell0_LEFTPAR as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.TIMES ->
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.RIGHTARROW ->
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.OR ->
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.NOTEQ ->
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LT ->
            _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LRARROW ->
            _menhir_run_182 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LE ->
            _menhir_run_172 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GT ->
            _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GE ->
            _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.EQUAL ->
            _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.COMMA ->
            _menhir_run_202 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND ->
            _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer
        | _ ->
            _eRR 201
    
    and _menhir_run_198 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_CUT -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_CUT (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos_e_, e) = (_endpos, _v) in
        let _v = _menhir_action_068 _endpos_e_ _startpos__1_ e in
        _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_197 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_CHECK -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_CHECK (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos_e_, e) = (_endpos, _v) in
        let _v = _menhir_action_067 _endpos_e_ _startpos__1_ e in
        _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_192 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_array_assignment as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.TIMES ->
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.RIGHTARROW ->
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.OR ->
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.NOTEQ ->
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LT ->
            _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LRARROW ->
            _menhir_run_182 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LEFTARROW ->
            _menhir_run_187 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LE ->
            _menhir_run_172 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GT ->
            _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GE ->
            _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.EQUAL ->
            _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND ->
            _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer
        | _ ->
            _eRR 192
    
    and _menhir_run_187 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_lexpr -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _menhir_s = MenhirState187 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.VOID ->
            _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.TRUE ->
            _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.STRING _v ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MINUS ->
            _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET ->
            _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTSQ ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTBR ->
            _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.IF ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEXADECIMAL _v ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FORALL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FALSE ->
            _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DISTINCT ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DECIMAL _v ->
            _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.CUT ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.CHECK ->
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 187
    
    and _menhir_run_188 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.TIMES ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.RIGHTARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.OR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.NOTEQ ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LRARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_182 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_172 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.EQUAL ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.COMMA | Tokens.RIGHTSQ ->
            let MenhirCell1_lexpr (_menhir_stack, _menhir_s, e1, _, _) = _menhir_stack in
            let e2 = _v in
            let _v = _menhir_action_009 e1 e2 in
            (match (_tok : MenhirBasics.token) with
            | Tokens.COMMA ->
                let _menhir_stack = MenhirCell1_array_assignment (_menhir_stack, _menhir_s, _v) in
                let _menhir_s = MenhirState190 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.VOID ->
                    _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | Tokens.TRUE ->
                    _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | Tokens.STRING _v ->
                    _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.NOT ->
                    _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | Tokens.MINUS ->
                    _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | Tokens.MATCH ->
                    _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | Tokens.LET ->
                    _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | Tokens.LEFTSQ ->
                    _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | Tokens.LEFTPAR ->
                    _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | Tokens.LEFTBR ->
                    _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | Tokens.INTEGER _v ->
                    _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.IF ->
                    _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | Tokens.ID _v ->
                    _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.HEXADECIMAL _v ->
                    _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.FORALL ->
                    _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | Tokens.FALSE ->
                    _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | Tokens.EXISTS ->
                    _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | Tokens.DISTINCT ->
                    _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | Tokens.DECIMAL _v ->
                    _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.CUT ->
                    _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | Tokens.CHECK ->
                    _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | _ ->
                    _eRR 190)
            | Tokens.RIGHTSQ ->
                let x = _v in
                let _v = _menhir_action_125 x in
                _menhir_goto_separated_nonempty_list_COMMA_array_assignment_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _menhir_fail ())
        | _ ->
            _eRR 188
    
    and _menhir_goto_separated_nonempty_list_COMMA_array_assignment_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState190 ->
            _menhir_run_191 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState130 ->
            _menhir_run_131 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_191 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_array_assignment -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_array_assignment (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_126 x xs in
        _menhir_goto_separated_nonempty_list_COMMA_array_assignment_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_131 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_simple_expr _menhir_cell0_LEFTSQ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell0_LEFTSQ (_menhir_stack, _, _) = _menhir_stack in
        let MenhirCell1_simple_expr (_menhir_stack, _menhir_s, s, _startpos_s_, _) = _menhir_stack in
        let (l, _endpos__4_) = (_v, _endpos) in
        let _v = _menhir_action_166 _endpos__4_ _startpos_s_ l s in
        _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__4_ _startpos_s_ _v _menhir_s _tok
    
    and _menhir_run_183 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.TIMES ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.RIGHTARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.OR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.NOTEQ ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LRARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_182 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_172 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.EQUAL ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AXIOM | Tokens.BAR | Tokens.CASESPLIT | Tokens.CHECK_SAT | Tokens.COMMA | Tokens.ELSE | Tokens.END | Tokens.EOF | Tokens.FUNC | Tokens.GOAL | Tokens.IN | Tokens.LEFTARROW | Tokens.LOGIC | Tokens.PRED | Tokens.PV | Tokens.REWRITING | Tokens.RIGHTBR | Tokens.RIGHTPAR | Tokens.RIGHTSQ | Tokens.THEN | Tokens.THEORY | Tokens.TYPE | Tokens.WITH ->
            let MenhirCell1_lexpr (_menhir_stack, _menhir_s, p, _startpos_p_, _) = _menhir_stack in
            let (_endpos_q_, q) = (_endpos, _v) in
            let _v = _menhir_action_050 _endpos_q_ _startpos_p_ p q in
            _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_q_ _startpos_p_ _v _menhir_s _tok
        | _ ->
            _eRR 183
    
    and _menhir_run_181 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.TIMES ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.NOTEQ ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_172 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.EQUAL ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AXIOM | Tokens.BAR | Tokens.CASESPLIT | Tokens.CHECK_SAT | Tokens.COMMA | Tokens.ELSE | Tokens.END | Tokens.EOF | Tokens.FUNC | Tokens.GOAL | Tokens.IN | Tokens.LEFTARROW | Tokens.LOGIC | Tokens.LRARROW | Tokens.OR | Tokens.PRED | Tokens.PV | Tokens.REWRITING | Tokens.RIGHTARROW | Tokens.RIGHTBR | Tokens.RIGHTPAR | Tokens.RIGHTSQ | Tokens.THEN | Tokens.THEORY | Tokens.TYPE | Tokens.WITH | Tokens.XOR ->
            let MenhirCell1_lexpr (_menhir_stack, _menhir_s, p, _startpos_p_, _) = _menhir_stack in
            let (_endpos_q_, q) = (_endpos, _v) in
            let _v = _menhir_action_047 _endpos_q_ _startpos_p_ p q in
            _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_q_ _startpos_p_ _v _menhir_s _tok
        | _ ->
            _eRR 181
    
    and _menhir_run_179 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.TIMES ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND | Tokens.AXIOM | Tokens.BAR | Tokens.CASESPLIT | Tokens.CHECK_SAT | Tokens.COMMA | Tokens.ELSE | Tokens.END | Tokens.EOF | Tokens.EQUAL | Tokens.FUNC | Tokens.GE | Tokens.GOAL | Tokens.GT | Tokens.IN | Tokens.LE | Tokens.LEFTARROW | Tokens.LOGIC | Tokens.LRARROW | Tokens.LT | Tokens.NOTEQ | Tokens.OR | Tokens.PRED | Tokens.PV | Tokens.REWRITING | Tokens.RIGHTARROW | Tokens.RIGHTBR | Tokens.RIGHTPAR | Tokens.RIGHTSQ | Tokens.THEN | Tokens.THEORY | Tokens.TYPE | Tokens.WITH | Tokens.XOR ->
            let MenhirCell1_lexpr (_menhir_stack, _menhir_s, a, _startpos_a_, _) = _menhir_stack in
            let (_endpos_b_, b) = (_endpos, _v) in
            let _v = _menhir_action_056 _endpos_b_ _startpos_a_ a b in
            _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_a_ _v _menhir_s _tok
        | _ ->
            _eRR 179
    
    and _menhir_run_177 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.TIMES ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND | Tokens.AXIOM | Tokens.BAR | Tokens.CASESPLIT | Tokens.CHECK_SAT | Tokens.COMMA | Tokens.ELSE | Tokens.END | Tokens.EOF | Tokens.EQUAL | Tokens.FUNC | Tokens.GE | Tokens.GOAL | Tokens.GT | Tokens.IN | Tokens.LE | Tokens.LEFTARROW | Tokens.LOGIC | Tokens.LRARROW | Tokens.LT | Tokens.NOTEQ | Tokens.OR | Tokens.PRED | Tokens.PV | Tokens.REWRITING | Tokens.RIGHTARROW | Tokens.RIGHTBR | Tokens.RIGHTPAR | Tokens.RIGHTSQ | Tokens.THEN | Tokens.THEORY | Tokens.TYPE | Tokens.WITH | Tokens.XOR ->
            let MenhirCell1_lexpr (_menhir_stack, _menhir_s, a, _startpos_a_, _) = _menhir_stack in
            let (_endpos_b_, b) = (_endpos, _v) in
            let _v = _menhir_action_055 _endpos_b_ _startpos_a_ a b in
            _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_a_ _v _menhir_s _tok
        | _ ->
            _eRR 177
    
    and _menhir_run_175 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.TIMES ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND | Tokens.AXIOM | Tokens.BAR | Tokens.CASESPLIT | Tokens.CHECK_SAT | Tokens.COMMA | Tokens.ELSE | Tokens.END | Tokens.EOF | Tokens.EQUAL | Tokens.FUNC | Tokens.GE | Tokens.GOAL | Tokens.GT | Tokens.IN | Tokens.LE | Tokens.LEFTARROW | Tokens.LOGIC | Tokens.LRARROW | Tokens.LT | Tokens.NOTEQ | Tokens.OR | Tokens.PRED | Tokens.PV | Tokens.REWRITING | Tokens.RIGHTARROW | Tokens.RIGHTBR | Tokens.RIGHTPAR | Tokens.RIGHTSQ | Tokens.THEN | Tokens.THEORY | Tokens.TYPE | Tokens.WITH | Tokens.XOR ->
            let MenhirCell1_lexpr (_menhir_stack, _menhir_s, a, _startpos_a_, _) = _menhir_stack in
            let (_endpos_b_, b) = (_endpos, _v) in
            let _v = _menhir_action_054 _endpos_b_ _startpos_a_ a b in
            _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_a_ _v _menhir_s _tok
        | _ ->
            _eRR 175
    
    and _menhir_run_173 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.TIMES ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND | Tokens.AXIOM | Tokens.BAR | Tokens.CASESPLIT | Tokens.CHECK_SAT | Tokens.COMMA | Tokens.ELSE | Tokens.END | Tokens.EOF | Tokens.EQUAL | Tokens.FUNC | Tokens.GE | Tokens.GOAL | Tokens.GT | Tokens.IN | Tokens.LE | Tokens.LEFTARROW | Tokens.LOGIC | Tokens.LRARROW | Tokens.LT | Tokens.NOTEQ | Tokens.OR | Tokens.PRED | Tokens.PV | Tokens.REWRITING | Tokens.RIGHTARROW | Tokens.RIGHTBR | Tokens.RIGHTPAR | Tokens.RIGHTSQ | Tokens.THEN | Tokens.THEORY | Tokens.TYPE | Tokens.WITH | Tokens.XOR ->
            let MenhirCell1_lexpr (_menhir_stack, _menhir_s, a, _startpos_a_, _) = _menhir_stack in
            let (_endpos_b_, b) = (_endpos, _v) in
            let _v = _menhir_action_053 _endpos_b_ _startpos_a_ a b in
            _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_a_ _v _menhir_s _tok
        | _ ->
            _eRR 173
    
    and _menhir_run_171 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.TIMES ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND | Tokens.AXIOM | Tokens.BAR | Tokens.CASESPLIT | Tokens.CHECK_SAT | Tokens.COMMA | Tokens.ELSE | Tokens.END | Tokens.EOF | Tokens.EQUAL | Tokens.FUNC | Tokens.GE | Tokens.GOAL | Tokens.GT | Tokens.IN | Tokens.LE | Tokens.LEFTARROW | Tokens.LOGIC | Tokens.LRARROW | Tokens.LT | Tokens.NOTEQ | Tokens.OR | Tokens.PRED | Tokens.PV | Tokens.REWRITING | Tokens.RIGHTARROW | Tokens.RIGHTBR | Tokens.RIGHTPAR | Tokens.RIGHTSQ | Tokens.THEN | Tokens.THEORY | Tokens.TYPE | Tokens.WITH | Tokens.XOR ->
            let MenhirCell1_lexpr (_menhir_stack, _menhir_s, a, _startpos_a_, _) = _menhir_stack in
            let (_endpos_b_, b) = (_endpos, _v) in
            let _v = _menhir_action_052 _endpos_b_ _startpos_a_ a b in
            _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_a_ _v _menhir_s _tok
        | _ ->
            _eRR 171
    
    and _menhir_run_169 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_lexpr _menhir_cell0_MINUS as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.TIMES ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND | Tokens.AXIOM | Tokens.BAR | Tokens.CASESPLIT | Tokens.CHECK_SAT | Tokens.COMMA | Tokens.ELSE | Tokens.END | Tokens.EOF | Tokens.EQUAL | Tokens.FUNC | Tokens.GE | Tokens.GOAL | Tokens.GT | Tokens.IN | Tokens.LE | Tokens.LEFTARROW | Tokens.LOGIC | Tokens.LRARROW | Tokens.LT | Tokens.MINUS | Tokens.NOTEQ | Tokens.OR | Tokens.PLUS | Tokens.PRED | Tokens.PV | Tokens.REWRITING | Tokens.RIGHTARROW | Tokens.RIGHTBR | Tokens.RIGHTPAR | Tokens.RIGHTSQ | Tokens.THEN | Tokens.THEORY | Tokens.TYPE | Tokens.WITH | Tokens.XOR ->
            let MenhirCell0_MINUS (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_lexpr (_menhir_stack, _menhir_s, a, _startpos_a_, _) = _menhir_stack in
            let (_endpos_b_, b) = (_endpos, _v) in
            let _v = _menhir_action_041 _endpos_b_ _startpos_a_ a b in
            _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_a_ _v _menhir_s _tok
        | _ ->
            _eRR 169
    
    and _menhir_run_167 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.TIMES ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND | Tokens.AXIOM | Tokens.BAR | Tokens.CASESPLIT | Tokens.CHECK_SAT | Tokens.COMMA | Tokens.ELSE | Tokens.END | Tokens.EOF | Tokens.EQUAL | Tokens.FUNC | Tokens.GE | Tokens.GOAL | Tokens.GT | Tokens.IN | Tokens.LE | Tokens.LEFTARROW | Tokens.LOGIC | Tokens.LRARROW | Tokens.LT | Tokens.NOTEQ | Tokens.OR | Tokens.PRED | Tokens.PV | Tokens.REWRITING | Tokens.RIGHTARROW | Tokens.RIGHTBR | Tokens.RIGHTPAR | Tokens.RIGHTSQ | Tokens.THEN | Tokens.THEORY | Tokens.TYPE | Tokens.WITH | Tokens.XOR ->
            let MenhirCell1_lexpr (_menhir_stack, _menhir_s, a, _startpos_a_, _) = _menhir_stack in
            let (_endpos_b_, b) = (_endpos, _v) in
            let _v = _menhir_action_057 _endpos_b_ _startpos_a_ a b in
            _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_a_ _v _menhir_s _tok
        | _ ->
            _eRR 167
    
    and _menhir_run_165 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.TIMES ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.OR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.NOTEQ ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_172 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.EQUAL ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AXIOM | Tokens.BAR | Tokens.CASESPLIT | Tokens.CHECK_SAT | Tokens.COMMA | Tokens.ELSE | Tokens.END | Tokens.EOF | Tokens.FUNC | Tokens.GOAL | Tokens.IN | Tokens.LEFTARROW | Tokens.LOGIC | Tokens.LRARROW | Tokens.PRED | Tokens.PV | Tokens.REWRITING | Tokens.RIGHTARROW | Tokens.RIGHTBR | Tokens.RIGHTPAR | Tokens.RIGHTSQ | Tokens.THEN | Tokens.THEORY | Tokens.TYPE | Tokens.WITH | Tokens.XOR ->
            let MenhirCell1_lexpr (_menhir_stack, _menhir_s, p, _startpos_p_, _) = _menhir_stack in
            let (_endpos_q_, q) = (_endpos, _v) in
            let _v = _menhir_action_048 _endpos_q_ _startpos_p_ p q in
            _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_q_ _startpos_p_ _v _menhir_s _tok
        | _ ->
            _eRR 165
    
    and _menhir_run_163 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND | Tokens.AT | Tokens.AXIOM | Tokens.BAR | Tokens.CASESPLIT | Tokens.CHECK_SAT | Tokens.COMMA | Tokens.ELSE | Tokens.END | Tokens.EOF | Tokens.EQUAL | Tokens.FUNC | Tokens.GE | Tokens.GOAL | Tokens.GT | Tokens.IN | Tokens.LE | Tokens.LEFTARROW | Tokens.LOGIC | Tokens.LRARROW | Tokens.LT | Tokens.MINUS | Tokens.NOTEQ | Tokens.OR | Tokens.PERCENT | Tokens.PLUS | Tokens.POW | Tokens.POWDOT | Tokens.PRED | Tokens.PV | Tokens.REWRITING | Tokens.RIGHTARROW | Tokens.RIGHTBR | Tokens.RIGHTPAR | Tokens.RIGHTSQ | Tokens.SLASH | Tokens.THEN | Tokens.THEORY | Tokens.TIMES | Tokens.TYPE | Tokens.WITH | Tokens.XOR ->
            let MenhirCell1_lexpr (_menhir_stack, _menhir_s, e, _startpos_e_, _) = _menhir_stack in
            let (_endpos_f_, f) = (_endpos, _v) in
            let _v = _menhir_action_060 _endpos_f_ _startpos_e_ e f in
            _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _startpos_e_ _v _menhir_s _tok
        | _ ->
            _eRR 163
    
    and _menhir_run_161 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND | Tokens.AT | Tokens.AXIOM | Tokens.BAR | Tokens.CASESPLIT | Tokens.CHECK_SAT | Tokens.COMMA | Tokens.ELSE | Tokens.END | Tokens.EOF | Tokens.EQUAL | Tokens.FUNC | Tokens.GE | Tokens.GOAL | Tokens.GT | Tokens.IN | Tokens.LE | Tokens.LEFTARROW | Tokens.LOGIC | Tokens.LRARROW | Tokens.LT | Tokens.MINUS | Tokens.NOTEQ | Tokens.OR | Tokens.PERCENT | Tokens.PLUS | Tokens.POW | Tokens.POWDOT | Tokens.PRED | Tokens.PV | Tokens.REWRITING | Tokens.RIGHTARROW | Tokens.RIGHTBR | Tokens.RIGHTPAR | Tokens.RIGHTSQ | Tokens.SLASH | Tokens.THEN | Tokens.THEORY | Tokens.TIMES | Tokens.TYPE | Tokens.WITH | Tokens.XOR ->
            let MenhirCell1_lexpr (_menhir_stack, _menhir_s, a, _startpos_a_, _) = _menhir_stack in
            let (_endpos_b_, b) = (_endpos, _v) in
            let _v = _menhir_action_044 _endpos_b_ _startpos_a_ a b in
            _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_a_ _v _menhir_s _tok
        | _ ->
            _eRR 161
    
    and _menhir_run_159 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.TIMES ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND | Tokens.AXIOM | Tokens.BAR | Tokens.CASESPLIT | Tokens.CHECK_SAT | Tokens.COMMA | Tokens.ELSE | Tokens.END | Tokens.EOF | Tokens.EQUAL | Tokens.FUNC | Tokens.GE | Tokens.GOAL | Tokens.GT | Tokens.IN | Tokens.LE | Tokens.LEFTARROW | Tokens.LOGIC | Tokens.LRARROW | Tokens.LT | Tokens.MINUS | Tokens.NOTEQ | Tokens.OR | Tokens.PLUS | Tokens.PRED | Tokens.PV | Tokens.REWRITING | Tokens.RIGHTARROW | Tokens.RIGHTBR | Tokens.RIGHTPAR | Tokens.RIGHTSQ | Tokens.THEN | Tokens.THEORY | Tokens.TYPE | Tokens.WITH | Tokens.XOR ->
            let MenhirCell1_lexpr (_menhir_stack, _menhir_s, a, _startpos_a_, _) = _menhir_stack in
            let (_endpos_b_, b) = (_endpos, _v) in
            let _v = _menhir_action_040 _endpos_b_ _startpos_a_ a b in
            _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_a_ _v _menhir_s _tok
        | _ ->
            _eRR 159
    
    and _menhir_run_157 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND | Tokens.AT | Tokens.AXIOM | Tokens.BAR | Tokens.CASESPLIT | Tokens.CHECK_SAT | Tokens.COMMA | Tokens.ELSE | Tokens.END | Tokens.EOF | Tokens.EQUAL | Tokens.FUNC | Tokens.GE | Tokens.GOAL | Tokens.GT | Tokens.IN | Tokens.LE | Tokens.LEFTARROW | Tokens.LOGIC | Tokens.LRARROW | Tokens.LT | Tokens.MINUS | Tokens.NOTEQ | Tokens.OR | Tokens.PERCENT | Tokens.PLUS | Tokens.POW | Tokens.POWDOT | Tokens.PRED | Tokens.PV | Tokens.REWRITING | Tokens.RIGHTARROW | Tokens.RIGHTBR | Tokens.RIGHTPAR | Tokens.RIGHTSQ | Tokens.SLASH | Tokens.THEN | Tokens.THEORY | Tokens.TIMES | Tokens.TYPE | Tokens.WITH | Tokens.XOR ->
            let MenhirCell1_lexpr (_menhir_stack, _menhir_s, a, _startpos_a_, _) = _menhir_stack in
            let (_endpos_b_, b) = (_endpos, _v) in
            let _v = _menhir_action_045 _endpos_b_ _startpos_a_ a b in
            _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_a_ _v _menhir_s _tok
        | _ ->
            _eRR 157
    
    and _menhir_run_155 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND | Tokens.AT | Tokens.AXIOM | Tokens.BAR | Tokens.CASESPLIT | Tokens.CHECK_SAT | Tokens.COMMA | Tokens.ELSE | Tokens.END | Tokens.EOF | Tokens.EQUAL | Tokens.FUNC | Tokens.GE | Tokens.GOAL | Tokens.GT | Tokens.IN | Tokens.LE | Tokens.LEFTARROW | Tokens.LOGIC | Tokens.LRARROW | Tokens.LT | Tokens.MINUS | Tokens.NOTEQ | Tokens.OR | Tokens.PERCENT | Tokens.PLUS | Tokens.POW | Tokens.POWDOT | Tokens.PRED | Tokens.PV | Tokens.REWRITING | Tokens.RIGHTARROW | Tokens.RIGHTBR | Tokens.RIGHTPAR | Tokens.RIGHTSQ | Tokens.SLASH | Tokens.THEN | Tokens.THEORY | Tokens.TIMES | Tokens.TYPE | Tokens.WITH | Tokens.XOR ->
            let MenhirCell1_lexpr (_menhir_stack, _menhir_s, a, _startpos_a_, _) = _menhir_stack in
            let (_endpos_b_, b) = (_endpos, _v) in
            let _v = _menhir_action_046 _endpos_b_ _startpos_a_ a b in
            _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_a_ _v _menhir_s _tok
        | _ ->
            _eRR 155
    
    and _menhir_run_153 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.TIMES ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.RIGHTARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.OR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.NOTEQ ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LRARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_182 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_172 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.EQUAL ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AXIOM | Tokens.BAR | Tokens.CASESPLIT | Tokens.CHECK_SAT | Tokens.COMMA | Tokens.ELSE | Tokens.END | Tokens.EOF | Tokens.FUNC | Tokens.GOAL | Tokens.IN | Tokens.LEFTARROW | Tokens.LOGIC | Tokens.PRED | Tokens.PV | Tokens.REWRITING | Tokens.RIGHTBR | Tokens.RIGHTPAR | Tokens.RIGHTSQ | Tokens.THEN | Tokens.THEORY | Tokens.TYPE | Tokens.WITH ->
            let MenhirCell1_lexpr (_menhir_stack, _menhir_s, p, _startpos_p_, _) = _menhir_stack in
            let (_endpos_q_, q) = (_endpos, _v) in
            let _v = _menhir_action_051 _endpos_q_ _startpos_p_ p q in
            _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_q_ _startpos_p_ _v _menhir_s _tok
        | _ ->
            _eRR 153
    
    and _menhir_run_151 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND | Tokens.AT | Tokens.AXIOM | Tokens.BAR | Tokens.CASESPLIT | Tokens.CHECK_SAT | Tokens.COMMA | Tokens.ELSE | Tokens.END | Tokens.EOF | Tokens.EQUAL | Tokens.FUNC | Tokens.GE | Tokens.GOAL | Tokens.GT | Tokens.IN | Tokens.LE | Tokens.LEFTARROW | Tokens.LOGIC | Tokens.LRARROW | Tokens.LT | Tokens.MINUS | Tokens.NOTEQ | Tokens.OR | Tokens.PERCENT | Tokens.PLUS | Tokens.POW | Tokens.POWDOT | Tokens.PRED | Tokens.PV | Tokens.REWRITING | Tokens.RIGHTARROW | Tokens.RIGHTBR | Tokens.RIGHTPAR | Tokens.RIGHTSQ | Tokens.SLASH | Tokens.THEN | Tokens.THEORY | Tokens.TIMES | Tokens.TYPE | Tokens.WITH | Tokens.XOR ->
            let MenhirCell1_lexpr (_menhir_stack, _menhir_s, a, _startpos_a_, _) = _menhir_stack in
            let (_endpos_b_, b) = (_endpos, _v) in
            let _v = _menhir_action_043 _endpos_b_ _startpos_a_ a b in
            _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_a_ _v _menhir_s _tok
        | _ ->
            _eRR 151
    
    and _menhir_run_149 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.TIMES ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.RIGHTARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.OR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.NOTEQ ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LRARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_182 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_172 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.EQUAL ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.COMMA ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState184 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.VOID ->
                _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.TRUE ->
                _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.STRING _v ->
                _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MINUS ->
                _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET ->
                _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTSQ ->
                _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTPAR ->
                _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTBR ->
                _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.IF ->
                _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.HEXADECIMAL _v ->
                _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FALSE ->
                _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DISTINCT ->
                _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DECIMAL _v ->
                _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.CUT ->
                _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.CHECK ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 184)
        | Tokens.AT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.RIGHTBR | Tokens.RIGHTPAR ->
            let x = _v in
            let _v = _menhir_action_131 x in
            _menhir_goto_separated_nonempty_list_COMMA_lexpr_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 149
    
    and _menhir_goto_separated_nonempty_list_COMMA_lexpr_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState119 ->
            _menhir_run_205 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState184 ->
            _menhir_run_185 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState145 ->
            _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_205 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_multi_logic_binder_, _menhir_box_file) _menhir_cell1_triggers, _menhir_box_file) _menhir_cell1_LEFTBR -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHTBR ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_LEFTBR (_menhir_stack, _menhir_s, _) = _menhir_stack in
            let l = _v in
            let _v = _menhir_action_032 l in
            _menhir_goto_filters _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 205
    
    and _menhir_goto_filters : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_multi_logic_binder_, _menhir_box_file) _menhir_cell1_triggers as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState248 ->
            _menhir_run_249 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState118 ->
            _menhir_run_207 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_185 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_lexpr -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let MenhirCell1_lexpr (_menhir_stack, _menhir_s, x, _, _) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_132 x xs in
        _menhir_goto_separated_nonempty_list_COMMA_lexpr_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_146 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_ident _menhir_cell0_LEFTPAR -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let x = _v in
        let _v = _menhir_action_083 x in
        _menhir_goto_loption_separated_nonempty_list_COMMA_lexpr__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
    
    and _menhir_goto_loption_separated_nonempty_list_COMMA_lexpr__ : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_ident _menhir_cell0_LEFTPAR -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHTPAR ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_LEFTPAR (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_ident (_menhir_stack, _menhir_s, f, _startpos_f_, _) = _menhir_stack in
            let (xs, _endpos__4_) = (_v, _endpos) in
            let _v = _menhir_action_164 _endpos__4_ _startpos_f_ f xs in
            _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__4_ _startpos_f_ _v _menhir_s _tok
        | _ ->
            _eRR 147
    
    and _menhir_run_137 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND | Tokens.AT | Tokens.AXIOM | Tokens.BAR | Tokens.CASESPLIT | Tokens.CHECK_SAT | Tokens.COMMA | Tokens.ELSE | Tokens.END | Tokens.EOF | Tokens.EQUAL | Tokens.FUNC | Tokens.GE | Tokens.GOAL | Tokens.GT | Tokens.IN | Tokens.LE | Tokens.LEFTARROW | Tokens.LOGIC | Tokens.LRARROW | Tokens.LT | Tokens.MINUS | Tokens.NOTEQ | Tokens.OR | Tokens.PERCENT | Tokens.PLUS | Tokens.POW | Tokens.POWDOT | Tokens.PRED | Tokens.PV | Tokens.REWRITING | Tokens.RIGHTARROW | Tokens.RIGHTBR | Tokens.RIGHTPAR | Tokens.RIGHTSQ | Tokens.SLASH | Tokens.THEN | Tokens.THEORY | Tokens.TIMES | Tokens.TYPE | Tokens.WITH | Tokens.XOR ->
            let MenhirCell1_lexpr (_menhir_stack, _menhir_s, a, _startpos_a_, _) = _menhir_stack in
            let (_endpos_b_, b) = (_endpos, _v) in
            let _v = _menhir_action_042 _endpos_b_ _startpos_a_ a b in
            _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_a_ _v _menhir_s _tok
        | _ ->
            _eRR 137
    
    and _menhir_run_135 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.TIMES ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.RIGHTARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.OR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.NOTEQ ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LRARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_182 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_172 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.EQUAL ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AXIOM | Tokens.BAR | Tokens.CASESPLIT | Tokens.CHECK_SAT | Tokens.COMMA | Tokens.ELSE | Tokens.END | Tokens.EOF | Tokens.FUNC | Tokens.GOAL | Tokens.IN | Tokens.LEFTARROW | Tokens.LOGIC | Tokens.PRED | Tokens.PV | Tokens.REWRITING | Tokens.RIGHTBR | Tokens.RIGHTPAR | Tokens.RIGHTSQ | Tokens.THEN | Tokens.THEORY | Tokens.TYPE | Tokens.WITH ->
            let MenhirCell1_lexpr (_menhir_stack, _menhir_s, p, _startpos_p_, _) = _menhir_stack in
            let (_endpos_q_, q) = (_endpos, _v) in
            let _v = _menhir_action_049 _endpos_q_ _startpos_p_ p q in
            _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_q_ _startpos_p_ _v _menhir_s _tok
        | _ ->
            _eRR 135
    
    and _menhir_run_133 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_simple_expr _menhir_cell0_LEFTSQ as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.TIMES ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.SLASH ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.RIGHTSQ ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_LEFTSQ (_menhir_stack, _, _) = _menhir_stack in
            let MenhirCell1_simple_expr (_menhir_stack, _menhir_s, s, _startpos_s_, _) = _menhir_stack in
            let (e, _endpos__4_) = (_v, _endpos_0) in
            let _v = _menhir_action_165 _endpos__4_ _startpos_s_ e s in
            _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__4_ _startpos_s_ _v _menhir_s _tok
        | Tokens.RIGHTARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POWDOT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.POW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PLUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.PERCENT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.OR ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.NOTEQ ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.MINUS ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LRARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_182 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LEFTARROW ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_187 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_172 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.HAT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.GE ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.EQUAL ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AT ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND ->
            let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer
        | _ ->
            _eRR 133
    
    and _menhir_run_193 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_simple_expr -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _menhir_s = MenhirState193 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 193
    
    and _menhir_run_195 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_simple_expr -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _menhir_s = MenhirState195 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UNIT ->
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.REAL ->
            _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.QUOTE ->
            _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INT ->
            _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.BOOL ->
            _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.BITV ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 195
    
    and _menhir_run_098 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LEFTBR as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_simple_expr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.WITH ->
            let _menhir_s = MenhirState099 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 99)
        | Tokens.SHARP ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.QM_ID _v_1 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1
        | Tokens.QM ->
            _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.LEFTSQ ->
            _menhir_run_130 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.DOT ->
            _menhir_run_193 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.COLON ->
            _menhir_run_195 _menhir_stack _menhir_lexbuf _menhir_lexer
        | _ ->
            _eRR 98
    
    and _menhir_goto_ident : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState310 ->
            _menhir_run_331 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState319 ->
            _menhir_run_331 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState329 ->
            _menhir_run_331 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState282 ->
            _menhir_run_281 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState278 ->
            _menhir_run_281 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState271 ->
            _menhir_run_277 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState286 ->
            _menhir_run_277 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState272 ->
            _menhir_run_277 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState084 ->
            _menhir_run_267 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState265 ->
            _menhir_run_267 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState093 ->
            _menhir_run_260 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState366 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState362 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState358 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState335 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState337 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState314 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState316 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState324 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState326 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState303 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState306 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState295 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState076 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState080 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState081 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState082 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState083 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState274 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState268 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState086 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState092 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState106 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState107 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState253 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState255 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState250 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState115 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState218 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState225 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState222 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState208 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState119 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState121 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState202 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState122 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState123 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState190 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState130 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState187 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState134 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState145 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState184 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState152 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState182 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState164 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState180 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState178 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState176 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState174 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState172 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState170 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState166 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState168 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState158 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState162 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState160 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState156 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState154 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState150 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState136 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState099 ->
            _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState103 ->
            _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState054 ->
            _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState046 ->
            _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_331 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COLON ->
            let _menhir_s = MenhirState332 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UNIT ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.REAL ->
                _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.QUOTE ->
                _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTPAR ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INT ->
                _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.BOOL ->
                _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.BITV ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 332)
        | _ ->
            _eRR 331
    
    and _menhir_run_281 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _menhir_stack = MenhirCell1_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState282 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 282)
        | Tokens.RIGHTPAR ->
            let x = _v in
            let _v = _menhir_action_127 x in
            _menhir_goto_separated_nonempty_list_COMMA_ident_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 281
    
    and _menhir_goto_separated_nonempty_list_COMMA_ident_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState282 ->
            _menhir_run_283 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState278 ->
            _menhir_run_279 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_283 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_ident -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_ident (_menhir_stack, _menhir_s, x, _, _) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_128 x xs in
        _menhir_goto_separated_nonempty_list_COMMA_ident_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_279 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_ident _menhir_cell0_LEFTPAR -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell0_LEFTPAR (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_ident (_menhir_stack, _menhir_s, f, _startpos_f_, _) = _menhir_stack in
        let (args, _endpos__4_) = (_v, _endpos) in
        let _v = _menhir_action_172 _endpos__4_ _startpos_f_ args f in
        _menhir_goto_simple_pattern _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_simple_pattern : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_simple_pattern (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHTARROW ->
            let _menhir_s = MenhirState274 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.VOID ->
                _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.TRUE ->
                _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.STRING _v ->
                _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MINUS ->
                _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET ->
                _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTSQ ->
                _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTPAR ->
                _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTBR ->
                _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.IF ->
                _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.HEXADECIMAL _v ->
                _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FALSE ->
                _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DISTINCT ->
                _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DECIMAL _v ->
                _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.CUT ->
                _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.CHECK ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 274)
        | _ ->
            _eRR 273
    
    and _menhir_run_277 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFTPAR ->
            let _menhir_stack = MenhirCell1_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_LEFTPAR (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState278 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 278)
        | Tokens.RIGHTARROW ->
            let t = _v in
            let _v = _menhir_action_171 t in
            _menhir_goto_simple_pattern _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 277
    
    and _menhir_run_267 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.EQUAL ->
            let _menhir_s = MenhirState268 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.VOID ->
                _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.TRUE ->
                _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.STRING _v ->
                _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MINUS ->
                _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET ->
                _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTSQ ->
                _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTPAR ->
                _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTBR ->
                _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.IF ->
                _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.HEXADECIMAL _v ->
                _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FALSE ->
                _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DISTINCT ->
                _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DECIMAL _v ->
                _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.CUT ->
                _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.CHECK ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 268)
        | _ ->
            _eRR 267
    
    and _menhir_run_260 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LEFTBR as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFTPAR ->
            let _menhir_stack = MenhirCell1_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.EQUAL ->
            let _menhir_stack = MenhirCell1_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.COLON | Tokens.DOT | Tokens.LEFTSQ | Tokens.QM | Tokens.QM_ID _ | Tokens.SHARP | Tokens.WITH ->
            let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_153 t in
            _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _startpos_t_ _v _menhir_s _tok
        | _ ->
            _eRR 260
    
    and _menhir_run_145 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_ident -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell0_LEFTPAR (_menhir_stack, _startpos) in
        let _menhir_s = MenhirState145 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.VOID ->
            _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.TRUE ->
            _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.STRING _v ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MINUS ->
            _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET ->
            _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTSQ ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTBR ->
            _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.IF ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEXADECIMAL _v ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FORALL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FALSE ->
            _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DISTINCT ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DECIMAL _v ->
            _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.CUT ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.CHECK ->
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.RIGHTPAR ->
            let _v = _menhir_action_082 () in
            _menhir_goto_loption_separated_nonempty_list_COMMA_lexpr__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _eRR 145
    
    and _menhir_run_106 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_ident -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _menhir_s = MenhirState106 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.VOID ->
            _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.TRUE ->
            _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.STRING _v ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MINUS ->
            _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET ->
            _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTSQ ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTPAR ->
            _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFTBR ->
            _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.IF ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ID _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.HEXADECIMAL _v ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FORALL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FALSE ->
            _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DISTINCT ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DECIMAL _v ->
            _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.CUT ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.CHECK ->
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 106
    
    and _menhir_run_144 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFTPAR ->
            let _menhir_stack = MenhirCell1_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND | Tokens.AT | Tokens.AXIOM | Tokens.BAR | Tokens.CASESPLIT | Tokens.CHECK_SAT | Tokens.COLON | Tokens.COMMA | Tokens.DOT | Tokens.ELSE | Tokens.END | Tokens.EOF | Tokens.EQUAL | Tokens.FUNC | Tokens.GE | Tokens.GOAL | Tokens.GT | Tokens.HAT | Tokens.IN | Tokens.LE | Tokens.LEFTARROW | Tokens.LEFTSQ | Tokens.LOGIC | Tokens.LRARROW | Tokens.LT | Tokens.MINUS | Tokens.NOTEQ | Tokens.OR | Tokens.PERCENT | Tokens.PLUS | Tokens.POW | Tokens.POWDOT | Tokens.PRED | Tokens.PV | Tokens.QM | Tokens.QM_ID _ | Tokens.REWRITING | Tokens.RIGHTARROW | Tokens.RIGHTBR | Tokens.RIGHTPAR | Tokens.RIGHTSQ | Tokens.SHARP | Tokens.SLASH | Tokens.THEN | Tokens.THEORY | Tokens.TIMES | Tokens.TYPE | Tokens.WITH | Tokens.XOR ->
            let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_153 t in
            _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _startpos_t_ _v _menhir_s _tok
        | _ ->
            _eRR 144
    
    and _menhir_run_105 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.EQUAL ->
            _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer
        | _ ->
            _eRR 105
    
    and _menhir_run_050 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COLON ->
            let _menhir_s = MenhirState051 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UNIT ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.REAL ->
                _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.QUOTE ->
                _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTPAR ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INT ->
                _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.BOOL ->
                _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.BITV ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 51)
        | _ ->
            _eRR 50
    
    and _menhir_run_194 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_simple_expr -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_simple_expr (_menhir_stack, _menhir_s, s, _startpos_s_, _) = _menhir_stack in
        let (_endpos_label_, label) = (_endpos, _v) in
        let _v = _menhir_action_163 _endpos_label_ _startpos_s_ label s in
        _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_label_ _startpos_s_ _v _menhir_s _tok
    
    and _menhir_run_129 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_simple_expr _menhir_cell0_QM -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell0_QM (_menhir_stack, _, _) = _menhir_stack in
        let MenhirCell1_simple_expr (_menhir_stack, _menhir_s, s, _startpos_s_, _) = _menhir_stack in
        let (_endpos_id_, id) = (_endpos, _v) in
        let _v = _menhir_action_168 _endpos_id_ _startpos_s_ id s in
        _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_id_ _startpos_s_ _v _menhir_s _tok
    
    and _menhir_run_126 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_simple_expr -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_simple_expr (_menhir_stack, _menhir_s, s, _startpos_s_, _) = _menhir_stack in
        let (_endpos_label_, label) = (_endpos, _v) in
        let _v = _menhir_action_170 _endpos_label_ _startpos_s_ label s in
        _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_label_ _startpos_s_ _v _menhir_s _tok
    
    and _menhir_run_069 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let id = _v in
        let _v = _menhir_action_029 id in
        _menhir_goto_decl_ident _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_decl_ident : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState364 ->
            _menhir_run_365 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState360 ->
            _menhir_run_361 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState356 ->
            _menhir_run_357 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState301 ->
            _menhir_run_302 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState293 ->
            _menhir_run_294 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState074 ->
            _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState071 ->
            _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState068 ->
            _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_365 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_AXIOM as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_decl_ident (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COLON ->
            let _menhir_s = MenhirState366 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.VOID ->
                _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.TRUE ->
                _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.STRING _v ->
                _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MINUS ->
                _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET ->
                _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTSQ ->
                _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTPAR ->
                _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTBR ->
                _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.IF ->
                _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.HEXADECIMAL _v ->
                _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FALSE ->
                _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DISTINCT ->
                _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DECIMAL _v ->
                _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.CUT ->
                _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.CHECK ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 366)
        | _ ->
            _eRR 365
    
    and _menhir_run_361 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_CHECK_SAT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_decl_ident (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COLON ->
            let _menhir_s = MenhirState362 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.VOID ->
                _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.TRUE ->
                _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.STRING _v ->
                _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MINUS ->
                _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET ->
                _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTSQ ->
                _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTPAR ->
                _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTBR ->
                _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.IF ->
                _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.HEXADECIMAL _v ->
                _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FALSE ->
                _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DISTINCT ->
                _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DECIMAL _v ->
                _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.CUT ->
                _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.CHECK ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 362)
        | _ ->
            _eRR 361
    
    and _menhir_run_357 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_GOAL as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_decl_ident (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COLON ->
            let _menhir_s = MenhirState358 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.VOID ->
                _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.TRUE ->
                _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.STRING _v ->
                _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MINUS ->
                _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET ->
                _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTSQ ->
                _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTPAR ->
                _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTBR ->
                _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.IF ->
                _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.HEXADECIMAL _v ->
                _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FALSE ->
                _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DISTINCT ->
                _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DECIMAL _v ->
                _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.CUT ->
                _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.CHECK ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 358)
        | _ ->
            _eRR 357
    
    and _menhir_run_302 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_REWRITING as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_decl_ident (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COLON ->
            let _menhir_s = MenhirState303 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.VOID ->
                _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.TRUE ->
                _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.STRING _v ->
                _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MINUS ->
                _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET ->
                _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTSQ ->
                _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTPAR ->
                _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTBR ->
                _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.IF ->
                _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.HEXADECIMAL _v ->
                _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FALSE ->
                _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DISTINCT ->
                _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DECIMAL _v ->
                _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.CUT ->
                _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.CHECK ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 303)
        | _ ->
            _eRR 302
    
    and _menhir_run_294 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_AXIOM as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_decl_ident (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COLON ->
            let _menhir_s = MenhirState295 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.VOID ->
                _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.TRUE ->
                _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.STRING _v ->
                _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MINUS ->
                _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET ->
                _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTSQ ->
                _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTPAR ->
                _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTBR ->
                _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.IF ->
                _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.HEXADECIMAL _v ->
                _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FALSE ->
                _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DISTINCT ->
                _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DECIMAL _v ->
                _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.CUT ->
                _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.CHECK ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 295)
        | _ ->
            _eRR 294
    
    and _menhir_run_075 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_CASESPLIT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_decl_ident (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COLON ->
            let _menhir_s = MenhirState076 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.VOID ->
                _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.TRUE ->
                _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.STRING _v ->
                _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MINUS ->
                _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET ->
                _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTSQ ->
                _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTPAR ->
                _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTBR ->
                _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.IF ->
                _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.HEXADECIMAL _v ->
                _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FALSE ->
                _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DISTINCT ->
                _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DECIMAL _v ->
                _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.CUT ->
                _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.CHECK ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 76)
        | _ ->
            _eRR 75
    
    and _menhir_run_072 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_THEORY, _menhir_box_file) _menhir_cell1_decl_ident as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_decl_ident (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.EQUAL ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.CASESPLIT ->
                _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState073
            | Tokens.AXIOM ->
                _menhir_run_293 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState073
            | Tokens.END ->
                let _v_0 = _menhir_action_075 () in
                _menhir_run_299 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
            | _ ->
                _eRR 73)
        | _ ->
            _eRR 72
    
    and _menhir_run_070 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_THEORY as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_decl_ident (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.EXTENDS ->
            let _menhir_s = MenhirState071 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 71)
        | _ ->
            _eRR 70
    
    and _menhir_run_065 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_algebraic_typedef, _menhir_box_file) _menhir_cell1_type_vars as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_raw_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.EQUAL ->
            let _menhir_s = MenhirState066 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 66)
        | _ ->
            _eRR 65
    
    and _menhir_run_049 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_id_, _startpos_id_, id) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_033 _endpos_id_ _startpos_id_ id in
        _menhir_goto_ident _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_id_ _startpos_id_ _v _menhir_s _tok
    
    and _menhir_run_044 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_raw_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.OF ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.LEFTBR ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _menhir_stack = MenhirCell0_LEFTBR (_menhir_stack, _startpos) in
                let _menhir_s = MenhirState046 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.ID _v ->
                    _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | _ ->
                    _eRR 46)
            | _ ->
                _eRR 45)
        | Tokens.AND | Tokens.AXIOM | Tokens.BAR | Tokens.CHECK_SAT | Tokens.EOF | Tokens.FUNC | Tokens.GOAL | Tokens.LOGIC | Tokens.PRED | Tokens.REWRITING | Tokens.THEORY | Tokens.TYPE ->
            let _v = _menhir_action_004 () in
            _menhir_goto_algebraic_args _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | _ ->
            _eRR 44
    
    and _menhir_run_036 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_id_, _startpos_id_, id) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_180 _endpos_id_ _startpos_id_ id in
        _menhir_goto_ty_ident _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_id_ _startpos_id_ _v _menhir_s _tok
    
    and _menhir_goto_ty_ident : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState351 ->
            _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState347 ->
            _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState333 ->
            _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState323 ->
            _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState196 ->
            _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState113 ->
            _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState052 ->
            _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState041 ->
            _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState037 ->
            _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState034 ->
            _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState349 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState343 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState332 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState322 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState195 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState112 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState051 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState021 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState038 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState024 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_040 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_primitive_type -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_primitive_type (_menhir_stack, _menhir_s, arg, _startpos_arg_, _) = _menhir_stack in
        let (_endpos_c_, c) = (_endpos, _v) in
        let _v = _menhir_action_101 _endpos_c_ _startpos_arg_ arg c in
        _menhir_goto_primitive_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_arg_ _v _menhir_s _tok
    
    and _menhir_run_035 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LEFTPAR, _menhir_box_file) _menhir_cell1_separated_nonempty_list_COMMA_primitive_type_ _menhir_cell0_RIGHTPAR -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell0_RIGHTPAR (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_separated_nonempty_list_COMMA_primitive_type_ (_menhir_stack, _, args, _) = _menhir_stack in
        let MenhirCell1_LEFTPAR (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos_c_, c) = (_endpos, _v) in
        let _v = _menhir_action_102 _endpos_c_ _startpos__1_ args c in
        _menhir_goto_primitive_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_032 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_099 _endpos_c_ _startpos_c_ c in
        _menhir_goto_primitive_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v _menhir_s _tok
    
    and _menhir_run_020 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_raw_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COLON ->
            let _menhir_s = MenhirState021 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UNIT ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.REAL ->
                _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.QUOTE ->
                _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFTPAR ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INT ->
                _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.BOOL ->
                _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.BITV ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 21)
        | _ ->
            _eRR 20
    
    and _menhir_run_012 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_TYPE, _menhir_box_file) _menhir_cell1_type_vars as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.EQUAL ->
            let _menhir_stack = MenhirCell1_raw_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState013 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.LEFTBR ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _menhir_stack = MenhirCell1_LEFTBR (_menhir_stack, _menhir_s, _startpos) in
                let _menhir_s = MenhirState014 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.ID _v ->
                    _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | _ ->
                    _eRR 14)
            | Tokens.ID _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 13)
        | Tokens.AXIOM | Tokens.CHECK_SAT | Tokens.EOF | Tokens.FUNC | Tokens.GOAL | Tokens.LOGIC | Tokens.PRED | Tokens.REWRITING | Tokens.THEORY | Tokens.TYPE ->
            let MenhirCell1_type_vars (_menhir_stack, _, vars, _) = _menhir_stack in
            let MenhirCell1_TYPE (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos_id_, id) = (_endpos, _v) in
            let _v = _menhir_action_020 _endpos_id_ _startpos__1_ id vars in
            _menhir_goto_decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 12
    
    and _menhir_run_010 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_TYPE as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_type_vars (_menhir_stack, _menhir_s, _v, _startpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.ID _v_0 ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState010
        | _ ->
            _eRR 10
    
    and _menhir_run_031 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_v_, _startpos_v_, v) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_100 v in
        _menhir_goto_primitive_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_v_ _startpos_v_ _v _menhir_s _tok
    
    and _menhir_run_005 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _menhir_stack = MenhirCell1_type_var (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState006 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.QUOTE ->
                _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 6)
        | Tokens.RIGHTPAR ->
            let x = _v in
            let _v = _menhir_action_145 x in
            _menhir_goto_separated_nonempty_list_COMMA_type_var_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 5
    
    and _menhir_goto_separated_nonempty_list_COMMA_type_var_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState004 ->
            _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState006 ->
            _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_008 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_LEFTPAR -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell1_LEFTPAR (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let l = _v in
        let _v = _menhir_action_184 l in
        _menhir_goto_type_vars _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_007 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_type_var -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_type_var (_menhir_stack, _menhir_s, x, _, _) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_146 x xs in
        _menhir_goto_separated_nonempty_list_COMMA_type_var_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    let _menhir_run_000 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.TYPE ->
            _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
        | Tokens.THEORY ->
            _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
        | Tokens.REWRITING ->
            _menhir_run_301 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
        | Tokens.PRED ->
            _menhir_run_308 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
        | Tokens.LOGIC ->
            _menhir_run_339 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
        | Tokens.GOAL ->
            _menhir_run_356 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
        | Tokens.FUNC ->
            _menhir_run_317 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
        | Tokens.CHECK_SAT ->
            _menhir_run_360 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
        | Tokens.AXIOM ->
            _menhir_run_364 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
        | Tokens.EOF ->
            let _v = _menhir_action_073 () in
            _menhir_run_369 _menhir_stack _v
        | _ ->
            _eRR 0
    
    let _menhir_run_374 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.EOF ->
            let _v = _menhir_action_034 () in
            MenhirBox_input _v
        | _ ->
            _eRR 374
    
  end
  
  let input =
    fun _menhir_lexer _menhir_lexbuf ->
      let _menhir_stack = () in
      let MenhirBox_input v = _menhir_run_374 _menhir_stack _menhir_lexbuf _menhir_lexer in
      v
  
  let file =
    fun _menhir_lexer _menhir_lexbuf ->
      let _menhir_stack = () in
      let MenhirBox_file v = _menhir_run_000 _menhir_stack _menhir_lexbuf _menhir_lexer in
      v
  
end
