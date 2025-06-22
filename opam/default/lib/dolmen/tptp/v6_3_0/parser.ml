
module Make

# 4 "src/languages/tptp/v6.3.0/parser.mly"
           (L : Dolmen_intf.Location.S)
# 7 "src/languages/tptp/v6.3.0/parser.ml"


# 5 "src/languages/tptp/v6.3.0/parser.mly"
           (I : Ast.Id)
# 12 "src/languages/tptp/v6.3.0/parser.ml"


# 6 "src/languages/tptp/v6.3.0/parser.mly"
           (T : Ast.Term
  with type location := L.t and type id := I.t)
# 18 "src/languages/tptp/v6.3.0/parser.ml"


# 8 "src/languages/tptp/v6.3.0/parser.mly"
           (S : Ast.Statement
  with type location := L.t  and type id := I.t and type term := T.t)
# 24 "src/languages/tptp/v6.3.0/parser.ml"

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

    | MenhirState002 : (('s, _menhir_box_file) _menhir_cell1_TPI _menhir_cell0_LEFT_PAREN, _menhir_box_file) _menhir_state
      (** State 002.
        Stack shape : TPI LEFT_PAREN.
        Start symbol: file. *)

    | MenhirState007 : ((('s, _menhir_box_file) _menhir_cell1_TPI _menhir_cell0_LEFT_PAREN, _menhir_box_file) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_file) _menhir_state
      (** State 007.
        Stack shape : TPI LEFT_PAREN name COMMA.
        Start symbol: file. *)

    | MenhirState010 : (((('s, _menhir_box_file) _menhir_cell1_TPI _menhir_cell0_LEFT_PAREN, _menhir_box_file) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_file) _menhir_cell1_formula_role _menhir_cell0_COMMA, _menhir_box_file) _menhir_state
      (** State 010.
        Stack shape : TPI LEFT_PAREN name COMMA formula_role COMMA.
        Start symbol: file. *)

    | MenhirState018 : (('s, 'r) _menhir_cell1_LET_TT _menhir_cell0_LEFT_PAREN, 'r) _menhir_state
      (** State 018.
        Stack shape : LET_TT LEFT_PAREN.
        Start symbol: <undetermined>. *)

    | MenhirState020 : (('s, 'r) _menhir_cell1_LET_FT _menhir_cell0_LEFT_PAREN, 'r) _menhir_state
      (** State 020.
        Stack shape : LET_FT LEFT_PAREN.
        Start symbol: <undetermined>. *)

    | MenhirState021 : (('s, 'r) _menhir_cell1_LEFT_PAREN, 'r) _menhir_state
      (** State 021.
        Stack shape : LEFT_PAREN.
        Start symbol: <undetermined>. *)

    | MenhirState023 : (('s, 'r) _menhir_cell1_ITE_T _menhir_cell0_LEFT_PAREN, 'r) _menhir_state
      (** State 023.
        Stack shape : ITE_T LEFT_PAREN.
        Start symbol: <undetermined>. *)

    | MenhirState025 : (('s, 'r) _menhir_cell1_LET_TF _menhir_cell0_LEFT_PAREN, 'r) _menhir_state
      (** State 025.
        Stack shape : LET_TF LEFT_PAREN.
        Start symbol: <undetermined>. *)

    | MenhirState026 : (('s, 'r) _menhir_cell1_LEFT_PAREN, 'r) _menhir_state
      (** State 026.
        Stack shape : LEFT_PAREN.
        Start symbol: <undetermined>. *)

    | MenhirState033 : (('s, 'r) _menhir_cell1_tptp_functor _menhir_cell0_LEFT_PAREN, 'r) _menhir_state
      (** State 033.
        Stack shape : tptp_functor LEFT_PAREN.
        Start symbol: <undetermined>. *)

    | MenhirState035 : (('s, 'r) _menhir_cell1_term _menhir_cell0_COMMA, 'r) _menhir_state
      (** State 035.
        Stack shape : term COMMA.
        Start symbol: <undetermined>. *)

    | MenhirState038 : (('s, 'r) _menhir_cell1_system_functor _menhir_cell0_LEFT_PAREN, 'r) _menhir_state
      (** State 038.
        Stack shape : system_functor LEFT_PAREN.
        Start symbol: <undetermined>. *)

    | MenhirState051 : (('s, 'r) _menhir_cell1_defined_functor _menhir_cell0_LEFT_PAREN, 'r) _menhir_state
      (** State 051.
        Stack shape : defined_functor LEFT_PAREN.
        Start symbol: <undetermined>. *)

    | MenhirState070 : (('s, 'r) _menhir_cell1_term _menhir_cell0_EQUAL, 'r) _menhir_state
      (** State 070.
        Stack shape : term EQUAL.
        Start symbol: <undetermined>. *)

    | MenhirState073 : (('s, 'r) _menhir_cell1_FORALL _menhir_cell0_LEFT_BRACKET, 'r) _menhir_state
      (** State 073.
        Stack shape : FORALL LEFT_BRACKET.
        Start symbol: <undetermined>. *)

    | MenhirState075 : (('s, 'r) _menhir_cell1_variable, 'r) _menhir_state
      (** State 075.
        Stack shape : variable.
        Start symbol: <undetermined>. *)

    | MenhirState080 : (('s, 'r) _menhir_cell1_atomic_word _menhir_cell0_LEFT_PAREN, 'r) _menhir_state
      (** State 080.
        Stack shape : atomic_word LEFT_PAREN.
        Start symbol: <undetermined>. *)

    | MenhirState084 : (('s, 'r) _menhir_cell1_tff_atomic_type _menhir_cell0_COMMA, 'r) _menhir_state
      (** State 084.
        Stack shape : tff_atomic_type COMMA.
        Start symbol: <undetermined>. *)

    | MenhirState089 : ((('s, 'r) _menhir_cell1_FORALL _menhir_cell0_LEFT_BRACKET, 'r) _menhir_cell1_tff_variable_list _menhir_cell0_RIGHT_BRACKET, 'r) _menhir_state
      (** State 089.
        Stack shape : FORALL LEFT_BRACKET tff_variable_list RIGHT_BRACKET.
        Start symbol: <undetermined>. *)

    | MenhirState093 : (('s, 'r) _menhir_cell1_tff_variable _menhir_cell0_COMMA, 'r) _menhir_state
      (** State 093.
        Stack shape : tff_variable COMMA.
        Start symbol: <undetermined>. *)

    | MenhirState097 : ((('s, 'r) _menhir_cell1_LET_TF _menhir_cell0_LEFT_PAREN, 'r) _menhir_cell1_tff_let_term_defn _menhir_cell0_COMMA, 'r) _menhir_state
      (** State 097.
        Stack shape : LET_TF LEFT_PAREN tff_let_term_defn COMMA.
        Start symbol: <undetermined>. *)

    | MenhirState099 : (('s, 'r) _menhir_cell1_LET_FF _menhir_cell0_LEFT_PAREN, 'r) _menhir_state
      (** State 099.
        Stack shape : LET_FF LEFT_PAREN.
        Start symbol: <undetermined>. *)

    | MenhirState101 : (('s, 'r) _menhir_cell1_FORALL _menhir_cell0_LEFT_BRACKET, 'r) _menhir_state
      (** State 101.
        Stack shape : FORALL LEFT_BRACKET.
        Start symbol: <undetermined>. *)

    | MenhirState104 : ((('s, 'r) _menhir_cell1_FORALL _menhir_cell0_LEFT_BRACKET, 'r) _menhir_cell1_tff_variable_list _menhir_cell0_RIGHT_BRACKET, 'r) _menhir_state
      (** State 104.
        Stack shape : FORALL LEFT_BRACKET tff_variable_list RIGHT_BRACKET.
        Start symbol: <undetermined>. *)

    | MenhirState107 : (('s, 'r) _menhir_cell1_term, 'r) _menhir_state
      (** State 107.
        Stack shape : term.
        Start symbol: <undetermined>. *)

    | MenhirState110 : ((('s, 'r) _menhir_cell1_term, 'r) _menhir_cell1_defined_infix_pred, 'r) _menhir_state
      (** State 110.
        Stack shape : term defined_infix_pred.
        Start symbol: <undetermined>. *)

    | MenhirState121 : (('s, 'r) _menhir_cell1_atomic_formula _menhir_cell0_EQUIV, 'r) _menhir_state
      (** State 121.
        Stack shape : atomic_formula EQUIV.
        Start symbol: <undetermined>. *)

    | MenhirState122 : (('s, 'r) _menhir_cell1_LEFT_PAREN, 'r) _menhir_state
      (** State 122.
        Stack shape : LEFT_PAREN.
        Start symbol: <undetermined>. *)

    | MenhirState124 : (('s, 'r) _menhir_cell1_ITE_F _menhir_cell0_LEFT_PAREN, 'r) _menhir_state
      (** State 124.
        Stack shape : ITE_F LEFT_PAREN.
        Start symbol: <undetermined>. *)

    | MenhirState128 : (('s, 'r) _menhir_cell1_unary_connective, 'r) _menhir_state
      (** State 128.
        Stack shape : unary_connective.
        Start symbol: <undetermined>. *)

    | MenhirState134 : (('s, 'r) _menhir_cell1_term, 'r) _menhir_state
      (** State 134.
        Stack shape : term.
        Start symbol: <undetermined>. *)

    | MenhirState136 : ((('s, 'r) _menhir_cell1_term, 'r) _menhir_cell1_infix_inequality, 'r) _menhir_state
      (** State 136.
        Stack shape : term infix_inequality.
        Start symbol: <undetermined>. *)

    | MenhirState139 : (('s, 'r) _menhir_cell1_fol_quantifier _menhir_cell0_LEFT_BRACKET, 'r) _menhir_state
      (** State 139.
        Stack shape : fol_quantifier LEFT_BRACKET.
        Start symbol: <undetermined>. *)

    | MenhirState142 : ((('s, 'r) _menhir_cell1_fol_quantifier _menhir_cell0_LEFT_BRACKET, 'r) _menhir_cell1_tff_variable_list _menhir_cell0_RIGHT_BRACKET, 'r) _menhir_state
      (** State 142.
        Stack shape : fol_quantifier LEFT_BRACKET tff_variable_list RIGHT_BRACKET.
        Start symbol: <undetermined>. *)

    | MenhirState146 : (('s, 'r) _menhir_cell1_tff_unitary_formula, 'r) _menhir_state
      (** State 146.
        Stack shape : tff_unitary_formula.
        Start symbol: <undetermined>. *)

    | MenhirState148 : ((('s, 'r) _menhir_cell1_tff_unitary_formula, 'r) _menhir_cell1_VLINE, 'r) _menhir_state
      (** State 148.
        Stack shape : tff_unitary_formula VLINE.
        Start symbol: <undetermined>. *)

    | MenhirState155 : ((('s, 'r) _menhir_cell1_tff_unitary_formula, 'r) _menhir_cell1_AND, 'r) _menhir_state
      (** State 155.
        Stack shape : tff_unitary_formula AND.
        Start symbol: <undetermined>. *)

    | MenhirState157 : ((('s, 'r) _menhir_cell1_tff_unitary_formula, 'r) _menhir_cell1_binary_connective, 'r) _menhir_state
      (** State 157.
        Stack shape : tff_unitary_formula binary_connective.
        Start symbol: <undetermined>. *)

    | MenhirState160 : (('s, 'r) _menhir_cell1_tff_or_formula _menhir_cell0_VLINE, 'r) _menhir_state
      (** State 160.
        Stack shape : tff_or_formula VLINE.
        Start symbol: <undetermined>. *)

    | MenhirState163 : ((('s, 'r) _menhir_cell1_ITE_F _menhir_cell0_LEFT_PAREN, 'r) _menhir_cell1_tff_logic_formula _menhir_cell0_COMMA, 'r) _menhir_state
      (** State 163.
        Stack shape : ITE_F LEFT_PAREN tff_logic_formula COMMA.
        Start symbol: <undetermined>. *)

    | MenhirState165 : (((('s, 'r) _menhir_cell1_ITE_F _menhir_cell0_LEFT_PAREN, 'r) _menhir_cell1_tff_logic_formula _menhir_cell0_COMMA, 'r) _menhir_cell1_tff_logic_formula _menhir_cell0_COMMA, 'r) _menhir_state
      (** State 165.
        Stack shape : ITE_F LEFT_PAREN tff_logic_formula COMMA tff_logic_formula COMMA.
        Start symbol: <undetermined>. *)

    | MenhirState172 : (('s, 'r) _menhir_cell1_tff_and_formula _menhir_cell0_AND, 'r) _menhir_state
      (** State 172.
        Stack shape : tff_and_formula AND.
        Start symbol: <undetermined>. *)

    | MenhirState178 : ((('s, 'r) _menhir_cell1_LET_FF _menhir_cell0_LEFT_PAREN, 'r) _menhir_cell1_tff_let_formula_defn _menhir_cell0_COMMA, 'r) _menhir_state
      (** State 178.
        Stack shape : LET_FF LEFT_PAREN tff_let_formula_defn COMMA.
        Start symbol: <undetermined>. *)

    | MenhirState179 : (('s, 'r) _menhir_cell1_LEFT_PAREN, 'r) _menhir_state
      (** State 179.
        Stack shape : LEFT_PAREN.
        Start symbol: <undetermined>. *)

    | MenhirState180 : (('s, 'r) _menhir_cell1_LEFT_BRACKET, 'r) _menhir_state
      (** State 180.
        Stack shape : LEFT_BRACKET.
        Start symbol: <undetermined>. *)

    | MenhirState185 : (('s, 'r) _menhir_cell1_tff_logic_formula _menhir_cell0_COMMA, 'r) _menhir_state
      (** State 185.
        Stack shape : tff_logic_formula COMMA.
        Start symbol: <undetermined>. *)

    | MenhirState189 : (('s, 'r) _menhir_cell1_tff_untyped_atom, 'r) _menhir_state
      (** State 189.
        Stack shape : tff_untyped_atom.
        Start symbol: <undetermined>. *)

    | MenhirState190 : (('s, 'r) _menhir_cell1_LEFT_PAREN, 'r) _menhir_state
      (** State 190.
        Stack shape : LEFT_PAREN.
        Start symbol: <undetermined>. *)

    | MenhirState192 : (('s, 'r) _menhir_cell1_FORALL_TY _menhir_cell0_LEFT_BRACKET, 'r) _menhir_state
      (** State 192.
        Stack shape : FORALL_TY LEFT_BRACKET.
        Start symbol: <undetermined>. *)

    | MenhirState195 : ((('s, 'r) _menhir_cell1_FORALL_TY _menhir_cell0_LEFT_BRACKET, 'r) _menhir_cell1_tff_variable_list _menhir_cell0_RIGHT_BRACKET, 'r) _menhir_state
      (** State 195.
        Stack shape : FORALL_TY LEFT_BRACKET tff_variable_list RIGHT_BRACKET.
        Start symbol: <undetermined>. *)

    | MenhirState196 : (((('s, 'r) _menhir_cell1_FORALL_TY _menhir_cell0_LEFT_BRACKET, 'r) _menhir_cell1_tff_variable_list _menhir_cell0_RIGHT_BRACKET, 'r) _menhir_cell1_LEFT_PAREN, 'r) _menhir_state
      (** State 196.
        Stack shape : FORALL_TY LEFT_BRACKET tff_variable_list RIGHT_BRACKET LEFT_PAREN.
        Start symbol: <undetermined>. *)

    | MenhirState197 : ((('s, 'r) _menhir_cell1_LEFT_PAREN, 'r) _menhir_cell1_LEFT_PAREN, 'r) _menhir_state
      (** State 197.
        Stack shape : LEFT_PAREN LEFT_PAREN.
        Start symbol: <undetermined>. *)

    | MenhirState199 : ((('s, 'r) _menhir_cell1_LEFT_PAREN, 'r) _menhir_cell1_tff_xprod_type, 'r) _menhir_state
      (** State 199.
        Stack shape : LEFT_PAREN tff_xprod_type.
        Start symbol: <undetermined>. *)

    | MenhirState203 : ((('s, 'r) _menhir_cell1_LEFT_PAREN, 'r) _menhir_cell1_tff_unitary_type, 'r) _menhir_state
      (** State 203.
        Stack shape : LEFT_PAREN tff_unitary_type.
        Start symbol: <undetermined>. *)

    | MenhirState207 : (('s, 'r) _menhir_cell1_tff_unitary_type, 'r) _menhir_state
      (** State 207.
        Stack shape : tff_unitary_type.
        Start symbol: <undetermined>. *)

    | MenhirState223 : (('s, 'r) _menhir_cell1_tff_tuple, 'r) _menhir_state
      (** State 223.
        Stack shape : tff_tuple.
        Start symbol: <undetermined>. *)

    | MenhirState236 : ((('s, 'r) _menhir_cell1_ITE_T _menhir_cell0_LEFT_PAREN, 'r) _menhir_cell1_tff_logic_formula _menhir_cell0_COMMA, 'r) _menhir_state
      (** State 236.
        Stack shape : ITE_T LEFT_PAREN tff_logic_formula COMMA.
        Start symbol: <undetermined>. *)

    | MenhirState238 : (((('s, 'r) _menhir_cell1_ITE_T _menhir_cell0_LEFT_PAREN, 'r) _menhir_cell1_tff_logic_formula _menhir_cell0_COMMA, 'r) _menhir_cell1_term _menhir_cell0_COMMA, 'r) _menhir_state
      (** State 238.
        Stack shape : ITE_T LEFT_PAREN tff_logic_formula COMMA term COMMA.
        Start symbol: <undetermined>. *)

    | MenhirState244 : ((('s, 'r) _menhir_cell1_LET_FT _menhir_cell0_LEFT_PAREN, 'r) _menhir_cell1_tff_let_formula_defn _menhir_cell0_COMMA, 'r) _menhir_state
      (** State 244.
        Stack shape : LET_FT LEFT_PAREN tff_let_formula_defn COMMA.
        Start symbol: <undetermined>. *)

    | MenhirState248 : ((('s, 'r) _menhir_cell1_LET_TT _menhir_cell0_LEFT_PAREN, 'r) _menhir_cell1_tff_let_term_defn _menhir_cell0_COMMA, 'r) _menhir_state
      (** State 248.
        Stack shape : LET_TT LEFT_PAREN tff_let_term_defn COMMA.
        Start symbol: <undetermined>. *)

    | MenhirState251 : (('s, 'r) _menhir_cell1_LEFT_PAREN, 'r) _menhir_state
      (** State 251.
        Stack shape : LEFT_PAREN.
        Start symbol: <undetermined>. *)

    | MenhirState252 : (('s, 'r) _menhir_cell1_LEFT_BRACKET, 'r) _menhir_state
      (** State 252.
        Stack shape : LEFT_BRACKET.
        Start symbol: <undetermined>. *)

    | MenhirState254 : (('s, 'r) _menhir_cell1_LEFT_PAREN, 'r) _menhir_state
      (** State 254.
        Stack shape : LEFT_PAREN.
        Start symbol: <undetermined>. *)

    | MenhirState255 : (('s, 'r) _menhir_cell1_unary_connective, 'r) _menhir_state
      (** State 255.
        Stack shape : unary_connective.
        Start symbol: <undetermined>. *)

    | MenhirState257 : (('s, 'r) _menhir_cell1_fol_quantifier _menhir_cell0_LEFT_BRACKET, 'r) _menhir_state
      (** State 257.
        Stack shape : fol_quantifier LEFT_BRACKET.
        Start symbol: <undetermined>. *)

    | MenhirState259 : (('s, 'r) _menhir_cell1_variable _menhir_cell0_COMMA, 'r) _menhir_state
      (** State 259.
        Stack shape : variable COMMA.
        Start symbol: <undetermined>. *)

    | MenhirState263 : ((('s, 'r) _menhir_cell1_fol_quantifier _menhir_cell0_LEFT_BRACKET, 'r) _menhir_cell1_fof_variable_list _menhir_cell0_RIGHT_BRACKET, 'r) _menhir_state
      (** State 263.
        Stack shape : fol_quantifier LEFT_BRACKET fof_variable_list RIGHT_BRACKET.
        Start symbol: <undetermined>. *)

    | MenhirState270 : (('s, 'r) _menhir_cell1_fof_unitary_formula, 'r) _menhir_state
      (** State 270.
        Stack shape : fof_unitary_formula.
        Start symbol: <undetermined>. *)

    | MenhirState271 : ((('s, 'r) _menhir_cell1_fof_unitary_formula, 'r) _menhir_cell1_VLINE, 'r) _menhir_state
      (** State 271.
        Stack shape : fof_unitary_formula VLINE.
        Start symbol: <undetermined>. *)

    | MenhirState273 : ((('s, 'r) _menhir_cell1_fof_unitary_formula, 'r) _menhir_cell1_AND, 'r) _menhir_state
      (** State 273.
        Stack shape : fof_unitary_formula AND.
        Start symbol: <undetermined>. *)

    | MenhirState275 : ((('s, 'r) _menhir_cell1_fof_unitary_formula, 'r) _menhir_cell1_binary_connective, 'r) _menhir_state
      (** State 275.
        Stack shape : fof_unitary_formula binary_connective.
        Start symbol: <undetermined>. *)

    | MenhirState278 : (('s, 'r) _menhir_cell1_fof_or_formula _menhir_cell0_VLINE, 'r) _menhir_state
      (** State 278.
        Stack shape : fof_or_formula VLINE.
        Start symbol: <undetermined>. *)

    | MenhirState286 : (('s, 'r) _menhir_cell1_fof_and_formula _menhir_cell0_AND, 'r) _menhir_state
      (** State 286.
        Stack shape : fof_and_formula AND.
        Start symbol: <undetermined>. *)

    | MenhirState291 : (('s, 'r) _menhir_cell1_fof_logic_formula _menhir_cell0_COMMA, 'r) _menhir_state
      (** State 291.
        Stack shape : fof_logic_formula COMMA.
        Start symbol: <undetermined>. *)

    | MenhirState294 : (('s, 'r) _menhir_cell1_fof_tuple, 'r) _menhir_state
      (** State 294.
        Stack shape : fof_tuple.
        Start symbol: <undetermined>. *)

    | MenhirState298 : ((((('s, _menhir_box_file) _menhir_cell1_TPI _menhir_cell0_LEFT_PAREN, _menhir_box_file) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_file) _menhir_cell1_formula_role _menhir_cell0_COMMA, _menhir_box_file) _menhir_cell1_tpi_formula, _menhir_box_file) _menhir_state
      (** State 298.
        Stack shape : TPI LEFT_PAREN name COMMA formula_role COMMA tpi_formula.
        Start symbol: file. *)

    | MenhirState299 : (('s, 'r) _menhir_cell1_COMMA, 'r) _menhir_state
      (** State 299.
        Stack shape : COMMA.
        Start symbol: <undetermined>. *)

    | MenhirState300 : (('s, 'r) _menhir_cell1_LEFT_BRACKET, 'r) _menhir_state
      (** State 300.
        Stack shape : LEFT_BRACKET.
        Start symbol: <undetermined>. *)

    | MenhirState303 : (('s, 'r) _menhir_cell1_DOLLAR_THF _menhir_cell0_LEFT_PAREN, 'r) _menhir_state
      (** State 303.
        Stack shape : DOLLAR_THF LEFT_PAREN.
        Start symbol: <undetermined>. *)

    | MenhirState308 : (('s, 'r) _menhir_cell1_LET_TF _menhir_cell0_LEFT_PAREN, 'r) _menhir_state
      (** State 308.
        Stack shape : LET_TF LEFT_PAREN.
        Start symbol: <undetermined>. *)

    | MenhirState315 : (('s, 'r) _menhir_cell1_thf_quantifier _menhir_cell0_LEFT_BRACKET, 'r) _menhir_state
      (** State 315.
        Stack shape : thf_quantifier LEFT_BRACKET.
        Start symbol: <undetermined>. *)

    | MenhirState317 : (('s, 'r) _menhir_cell1_variable, 'r) _menhir_state
      (** State 317.
        Stack shape : variable.
        Start symbol: <undetermined>. *)

    | MenhirState319 : (('s, 'r) _menhir_cell1_LET_FF _menhir_cell0_LEFT_PAREN, 'r) _menhir_state
      (** State 319.
        Stack shape : LET_FF LEFT_PAREN.
        Start symbol: <undetermined>. *)

    | MenhirState322 : ((('s, 'r) _menhir_cell1_LET_FF _menhir_cell0_LEFT_PAREN, 'r) _menhir_cell1_thf_let_formula_defn _menhir_cell0_COMMA, 'r) _menhir_state
      (** State 322.
        Stack shape : LET_FF LEFT_PAREN thf_let_formula_defn COMMA.
        Start symbol: <undetermined>. *)

    | MenhirState323 : (('s, 'r) _menhir_cell1_LEFT_PAREN, 'r) _menhir_state
      (** State 323.
        Stack shape : LEFT_PAREN.
        Start symbol: <undetermined>. *)

    | MenhirState324 : (('s, 'r) _menhir_cell1_LEFT_BRACKET, 'r) _menhir_state
      (** State 324.
        Stack shape : LEFT_BRACKET.
        Start symbol: <undetermined>. *)

    | MenhirState326 : (('s, 'r) _menhir_cell1_LEFT_PAREN, 'r) _menhir_state
      (** State 326.
        Stack shape : LEFT_PAREN.
        Start symbol: <undetermined>. *)

    | MenhirState328 : (('s, 'r) _menhir_cell1_ITE_F _menhir_cell0_LEFT_PAREN, 'r) _menhir_state
      (** State 328.
        Stack shape : ITE_F LEFT_PAREN.
        Start symbol: <undetermined>. *)

    | MenhirState332 : (('s, 'r) _menhir_cell1_thf_xprod_type, 'r) _menhir_state
      (** State 332.
        Stack shape : thf_xprod_type.
        Start symbol: <undetermined>. *)

    | MenhirState333 : (('s, 'r) _menhir_cell1_LEFT_PAREN, 'r) _menhir_state
      (** State 333.
        Stack shape : LEFT_PAREN.
        Start symbol: <undetermined>. *)

    | MenhirState335 : (('s, 'r) _menhir_cell1_thf_unitary_type, 'r) _menhir_state
      (** State 335.
        Stack shape : thf_unitary_type.
        Start symbol: <undetermined>. *)

    | MenhirState340 : (('s, 'r) _menhir_cell1_thf_unary_connective _menhir_cell0_LEFT_PAREN, 'r) _menhir_state
      (** State 340.
        Stack shape : thf_unary_connective LEFT_PAREN.
        Start symbol: <undetermined>. *)

    | MenhirState341 : (('s, 'r) _menhir_cell1_thf_unitary_formula, 'r) _menhir_state
      (** State 341.
        Stack shape : thf_unitary_formula.
        Start symbol: <undetermined>. *)

    | MenhirState342 : ((('s, 'r) _menhir_cell1_thf_unitary_formula, 'r) _menhir_cell1_VLINE, 'r) _menhir_state
      (** State 342.
        Stack shape : thf_unitary_formula VLINE.
        Start symbol: <undetermined>. *)

    | MenhirState356 : ((('s, 'r) _menhir_cell1_thf_unitary_formula, 'r) _menhir_cell1_APPLY, 'r) _menhir_state
      (** State 356.
        Stack shape : thf_unitary_formula APPLY.
        Start symbol: <undetermined>. *)

    | MenhirState358 : ((('s, 'r) _menhir_cell1_thf_unitary_formula, 'r) _menhir_cell1_AND, 'r) _menhir_state
      (** State 358.
        Stack shape : thf_unitary_formula AND.
        Start symbol: <undetermined>. *)

    | MenhirState360 : ((('s, 'r) _menhir_cell1_thf_unitary_formula, 'r) _menhir_cell1_thf_pair_connective, 'r) _menhir_state
      (** State 360.
        Stack shape : thf_unitary_formula thf_pair_connective.
        Start symbol: <undetermined>. *)

    | MenhirState363 : (('s, 'r) _menhir_cell1_thf_union_type, 'r) _menhir_state
      (** State 363.
        Stack shape : thf_union_type.
        Start symbol: <undetermined>. *)

    | MenhirState366 : (('s, 'r) _menhir_cell1_thf_typeable_formula, 'r) _menhir_state
      (** State 366.
        Stack shape : thf_typeable_formula.
        Start symbol: <undetermined>. *)

    | MenhirState371 : (('s, 'r) _menhir_cell1_thf_or_formula _menhir_cell0_VLINE, 'r) _menhir_state
      (** State 371.
        Stack shape : thf_or_formula VLINE.
        Start symbol: <undetermined>. *)

    | MenhirState381 : (('s, 'r) _menhir_cell1_thf_apply_formula, 'r) _menhir_state
      (** State 381.
        Stack shape : thf_apply_formula.
        Start symbol: <undetermined>. *)

    | MenhirState384 : (('s, 'r) _menhir_cell1_thf_and_formula _menhir_cell0_AND, 'r) _menhir_state
      (** State 384.
        Stack shape : thf_and_formula AND.
        Start symbol: <undetermined>. *)

    | MenhirState389 : (('s, 'r) _menhir_cell1_constant _menhir_cell0_subtype_sign, 'r) _menhir_state
      (** State 389.
        Stack shape : constant subtype_sign.
        Start symbol: <undetermined>. *)

    | MenhirState394 : (('s, 'r) _menhir_cell1_thf_unitary_type, 'r) _menhir_state
      (** State 394.
        Stack shape : thf_unitary_type.
        Start symbol: <undetermined>. *)

    | MenhirState396 : (('s, 'r) _menhir_cell1_thf_unitary_type, 'r) _menhir_state
      (** State 396.
        Stack shape : thf_unitary_type.
        Start symbol: <undetermined>. *)

    | MenhirState403 : ((('s, 'r) _menhir_cell1_ITE_F _menhir_cell0_LEFT_PAREN, 'r) _menhir_cell1_thf_logic_formula _menhir_cell0_COMMA, 'r) _menhir_state
      (** State 403.
        Stack shape : ITE_F LEFT_PAREN thf_logic_formula COMMA.
        Start symbol: <undetermined>. *)

    | MenhirState405 : (((('s, 'r) _menhir_cell1_ITE_F _menhir_cell0_LEFT_PAREN, 'r) _menhir_cell1_thf_logic_formula _menhir_cell0_COMMA, 'r) _menhir_cell1_thf_logic_formula _menhir_cell0_COMMA, 'r) _menhir_state
      (** State 405.
        Stack shape : ITE_F LEFT_PAREN thf_logic_formula COMMA thf_logic_formula COMMA.
        Start symbol: <undetermined>. *)

    | MenhirState413 : (('s, 'r) _menhir_cell1_thf_logic_formula _menhir_cell0_COMMA, 'r) _menhir_state
      (** State 413.
        Stack shape : thf_logic_formula COMMA.
        Start symbol: <undetermined>. *)

    | MenhirState416 : (('s, 'r) _menhir_cell1_thf_tuple, 'r) _menhir_state
      (** State 416.
        Stack shape : thf_tuple.
        Start symbol: <undetermined>. *)

    | MenhirState427 : ((('s, 'r) _menhir_cell1_thf_quantifier _menhir_cell0_LEFT_BRACKET, 'r) _menhir_cell1_thf_variable_list _menhir_cell0_RIGHT_BRACKET, 'r) _menhir_state
      (** State 427.
        Stack shape : thf_quantifier LEFT_BRACKET thf_variable_list RIGHT_BRACKET.
        Start symbol: <undetermined>. *)

    | MenhirState430 : (('s, 'r) _menhir_cell1_thf_variable _menhir_cell0_COMMA, 'r) _menhir_state
      (** State 430.
        Stack shape : thf_variable COMMA.
        Start symbol: <undetermined>. *)

    | MenhirState435 : ((('s, 'r) _menhir_cell1_LET_TF _menhir_cell0_LEFT_PAREN, 'r) _menhir_cell1_thf_let_term_defn _menhir_cell0_COMMA, 'r) _menhir_state
      (** State 435.
        Stack shape : LET_TF LEFT_PAREN thf_let_term_defn COMMA.
        Start symbol: <undetermined>. *)

    | MenhirState441 : (('s, 'r) _menhir_cell1_DOLLAR_TFF _menhir_cell0_LEFT_PAREN, 'r) _menhir_state
      (** State 441.
        Stack shape : DOLLAR_TFF LEFT_PAREN.
        Start symbol: <undetermined>. *)

    | MenhirState445 : (('s, 'r) _menhir_cell1_DOLLAR_FOT _menhir_cell0_LEFT_PAREN, 'r) _menhir_state
      (** State 445.
        Stack shape : DOLLAR_FOT LEFT_PAREN.
        Start symbol: <undetermined>. *)

    | MenhirState449 : (('s, 'r) _menhir_cell1_DOLLAR_FOF _menhir_cell0_LEFT_PAREN, 'r) _menhir_state
      (** State 449.
        Stack shape : DOLLAR_FOF LEFT_PAREN.
        Start symbol: <undetermined>. *)

    | MenhirState455 : (('s, 'r) _menhir_cell1_DOLLAR_CNF _menhir_cell0_LEFT_PAREN, 'r) _menhir_state
      (** State 455.
        Stack shape : DOLLAR_CNF LEFT_PAREN.
        Start symbol: <undetermined>. *)

    | MenhirState456 : (('s, 'r) _menhir_cell1_LEFT_PAREN, 'r) _menhir_state
      (** State 456.
        Stack shape : LEFT_PAREN.
        Start symbol: <undetermined>. *)

    | MenhirState457 : (('s, 'r) _menhir_cell1_unary_negation, 'r) _menhir_state
      (** State 457.
        Stack shape : unary_negation.
        Start symbol: <undetermined>. *)

    | MenhirState462 : (('s, 'r) _menhir_cell1_disjunction _menhir_cell0_VLINE, 'r) _menhir_state
      (** State 462.
        Stack shape : disjunction VLINE.
        Start symbol: <undetermined>. *)

    | MenhirState474 : (('s, 'r) _menhir_cell1_general_term _menhir_cell0_COMMA, 'r) _menhir_state
      (** State 474.
        Stack shape : general_term COMMA.
        Start symbol: <undetermined>. *)

    | MenhirState479 : (('s, 'r) _menhir_cell1_general_data, 'r) _menhir_state
      (** State 479.
        Stack shape : general_data.
        Start symbol: <undetermined>. *)

    | MenhirState484 : (('s, 'r) _menhir_cell1_atomic_word _menhir_cell0_LEFT_PAREN, 'r) _menhir_state
      (** State 484.
        Stack shape : atomic_word LEFT_PAREN.
        Start symbol: <undetermined>. *)

    | MenhirState488 : ((('s, 'r) _menhir_cell1_COMMA, 'r) _menhir_cell1_source _menhir_cell0_COMMA, 'r) _menhir_state
      (** State 488.
        Stack shape : COMMA source COMMA.
        Start symbol: <undetermined>. *)

    | MenhirState498 : (('s, _menhir_box_file) _menhir_cell1_THF _menhir_cell0_LEFT_PAREN, _menhir_box_file) _menhir_state
      (** State 498.
        Stack shape : THF LEFT_PAREN.
        Start symbol: file. *)

    | MenhirState500 : ((('s, _menhir_box_file) _menhir_cell1_THF _menhir_cell0_LEFT_PAREN, _menhir_box_file) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_file) _menhir_state
      (** State 500.
        Stack shape : THF LEFT_PAREN name COMMA.
        Start symbol: file. *)

    | MenhirState502 : (((('s, _menhir_box_file) _menhir_cell1_THF _menhir_cell0_LEFT_PAREN, _menhir_box_file) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_file) _menhir_cell1_formula_role _menhir_cell0_COMMA, _menhir_box_file) _menhir_state
      (** State 502.
        Stack shape : THF LEFT_PAREN name COMMA formula_role COMMA.
        Start symbol: file. *)

    | MenhirState503 : ((((('s, _menhir_box_file) _menhir_cell1_THF _menhir_cell0_LEFT_PAREN, _menhir_box_file) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_file) _menhir_cell1_formula_role _menhir_cell0_COMMA, _menhir_box_file) _menhir_cell1_thf_formula, _menhir_box_file) _menhir_state
      (** State 503.
        Stack shape : THF LEFT_PAREN name COMMA formula_role COMMA thf_formula.
        Start symbol: file. *)

    | MenhirState508 : (('s, _menhir_box_file) _menhir_cell1_TFF _menhir_cell0_LEFT_PAREN, _menhir_box_file) _menhir_state
      (** State 508.
        Stack shape : TFF LEFT_PAREN.
        Start symbol: file. *)

    | MenhirState510 : ((('s, _menhir_box_file) _menhir_cell1_TFF _menhir_cell0_LEFT_PAREN, _menhir_box_file) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_file) _menhir_state
      (** State 510.
        Stack shape : TFF LEFT_PAREN name COMMA.
        Start symbol: file. *)

    | MenhirState512 : (((('s, _menhir_box_file) _menhir_cell1_TFF _menhir_cell0_LEFT_PAREN, _menhir_box_file) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_file) _menhir_cell1_formula_role _menhir_cell0_COMMA, _menhir_box_file) _menhir_state
      (** State 512.
        Stack shape : TFF LEFT_PAREN name COMMA formula_role COMMA.
        Start symbol: file. *)

    | MenhirState513 : ((((('s, _menhir_box_file) _menhir_cell1_TFF _menhir_cell0_LEFT_PAREN, _menhir_box_file) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_file) _menhir_cell1_formula_role _menhir_cell0_COMMA, _menhir_box_file) _menhir_cell1_tff_formula, _menhir_box_file) _menhir_state
      (** State 513.
        Stack shape : TFF LEFT_PAREN name COMMA formula_role COMMA tff_formula.
        Start symbol: file. *)

    | MenhirState518 : (('s, _menhir_box_file) _menhir_cell1_INCLUDE _menhir_cell0_LEFT_PAREN, _menhir_box_file) _menhir_state
      (** State 518.
        Stack shape : INCLUDE LEFT_PAREN.
        Start symbol: file. *)

    | MenhirState520 : ((('s, _menhir_box_file) _menhir_cell1_INCLUDE _menhir_cell0_LEFT_PAREN, _menhir_box_file) _menhir_cell1_file_name, _menhir_box_file) _menhir_state
      (** State 520.
        Stack shape : INCLUDE LEFT_PAREN file_name.
        Start symbol: file. *)

    | MenhirState522 : (((('s, 'r) _menhir_cell1_INCLUDE _menhir_cell0_LEFT_PAREN, 'r) _menhir_cell1_file_name, 'r) _menhir_cell1_COMMA _menhir_cell0_LEFT_BRACKET, 'r) _menhir_state
      (** State 522.
        Stack shape : INCLUDE LEFT_PAREN file_name COMMA LEFT_BRACKET.
        Start symbol: <undetermined>. *)

    | MenhirState526 : (('s, 'r) _menhir_cell1_name _menhir_cell0_COMMA, 'r) _menhir_state
      (** State 526.
        Stack shape : name COMMA.
        Start symbol: <undetermined>. *)

    | MenhirState532 : (('s, _menhir_box_file) _menhir_cell1_FOF _menhir_cell0_LEFT_PAREN, _menhir_box_file) _menhir_state
      (** State 532.
        Stack shape : FOF LEFT_PAREN.
        Start symbol: file. *)

    | MenhirState534 : ((('s, _menhir_box_file) _menhir_cell1_FOF _menhir_cell0_LEFT_PAREN, _menhir_box_file) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_file) _menhir_state
      (** State 534.
        Stack shape : FOF LEFT_PAREN name COMMA.
        Start symbol: file. *)

    | MenhirState536 : (((('s, _menhir_box_file) _menhir_cell1_FOF _menhir_cell0_LEFT_PAREN, _menhir_box_file) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_file) _menhir_cell1_formula_role _menhir_cell0_COMMA, _menhir_box_file) _menhir_state
      (** State 536.
        Stack shape : FOF LEFT_PAREN name COMMA formula_role COMMA.
        Start symbol: file. *)

    | MenhirState537 : ((((('s, _menhir_box_file) _menhir_cell1_FOF _menhir_cell0_LEFT_PAREN, _menhir_box_file) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_file) _menhir_cell1_formula_role _menhir_cell0_COMMA, _menhir_box_file) _menhir_cell1_fof_formula, _menhir_box_file) _menhir_state
      (** State 537.
        Stack shape : FOF LEFT_PAREN name COMMA formula_role COMMA fof_formula.
        Start symbol: file. *)

    | MenhirState542 : (('s, _menhir_box_file) _menhir_cell1_CNF _menhir_cell0_LEFT_PAREN, _menhir_box_file) _menhir_state
      (** State 542.
        Stack shape : CNF LEFT_PAREN.
        Start symbol: file. *)

    | MenhirState544 : ((('s, _menhir_box_file) _menhir_cell1_CNF _menhir_cell0_LEFT_PAREN, _menhir_box_file) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_file) _menhir_state
      (** State 544.
        Stack shape : CNF LEFT_PAREN name COMMA.
        Start symbol: file. *)

    | MenhirState546 : (((('s, _menhir_box_file) _menhir_cell1_CNF _menhir_cell0_LEFT_PAREN, _menhir_box_file) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_file) _menhir_cell1_formula_role _menhir_cell0_COMMA, _menhir_box_file) _menhir_state
      (** State 546.
        Stack shape : CNF LEFT_PAREN name COMMA formula_role COMMA.
        Start symbol: file. *)

    | MenhirState547 : ((((('s, _menhir_box_file) _menhir_cell1_CNF _menhir_cell0_LEFT_PAREN, _menhir_box_file) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_file) _menhir_cell1_formula_role _menhir_cell0_COMMA, _menhir_box_file) _menhir_cell1_cnf_formula, _menhir_box_file) _menhir_state
      (** State 547.
        Stack shape : CNF LEFT_PAREN name COMMA formula_role COMMA cnf_formula.
        Start symbol: file. *)

    | MenhirState551 : (('s, _menhir_box_file) _menhir_cell1_tptp_input, _menhir_box_file) _menhir_state
      (** State 551.
        Stack shape : tptp_input.
        Start symbol: file. *)

    | MenhirState563 : ('s, _menhir_box_input) _menhir_state
      (** State 563.
        Stack shape : .
        Start symbol: input. *)

    | MenhirState565 : (('s, _menhir_box_input) _menhir_cell1_TPI _menhir_cell0_LEFT_PAREN, _menhir_box_input) _menhir_state
      (** State 565.
        Stack shape : TPI LEFT_PAREN.
        Start symbol: input. *)

    | MenhirState567 : ((('s, _menhir_box_input) _menhir_cell1_TPI _menhir_cell0_LEFT_PAREN, _menhir_box_input) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_input) _menhir_state
      (** State 567.
        Stack shape : TPI LEFT_PAREN name COMMA.
        Start symbol: input. *)

    | MenhirState569 : (((('s, _menhir_box_input) _menhir_cell1_TPI _menhir_cell0_LEFT_PAREN, _menhir_box_input) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_input) _menhir_cell1_formula_role _menhir_cell0_COMMA, _menhir_box_input) _menhir_state
      (** State 569.
        Stack shape : TPI LEFT_PAREN name COMMA formula_role COMMA.
        Start symbol: input. *)

    | MenhirState570 : ((((('s, _menhir_box_input) _menhir_cell1_TPI _menhir_cell0_LEFT_PAREN, _menhir_box_input) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_input) _menhir_cell1_formula_role _menhir_cell0_COMMA, _menhir_box_input) _menhir_cell1_tpi_formula, _menhir_box_input) _menhir_state
      (** State 570.
        Stack shape : TPI LEFT_PAREN name COMMA formula_role COMMA tpi_formula.
        Start symbol: input. *)

    | MenhirState575 : (('s, _menhir_box_input) _menhir_cell1_THF _menhir_cell0_LEFT_PAREN, _menhir_box_input) _menhir_state
      (** State 575.
        Stack shape : THF LEFT_PAREN.
        Start symbol: input. *)

    | MenhirState577 : ((('s, _menhir_box_input) _menhir_cell1_THF _menhir_cell0_LEFT_PAREN, _menhir_box_input) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_input) _menhir_state
      (** State 577.
        Stack shape : THF LEFT_PAREN name COMMA.
        Start symbol: input. *)

    | MenhirState579 : (((('s, _menhir_box_input) _menhir_cell1_THF _menhir_cell0_LEFT_PAREN, _menhir_box_input) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_input) _menhir_cell1_formula_role _menhir_cell0_COMMA, _menhir_box_input) _menhir_state
      (** State 579.
        Stack shape : THF LEFT_PAREN name COMMA formula_role COMMA.
        Start symbol: input. *)

    | MenhirState580 : ((((('s, _menhir_box_input) _menhir_cell1_THF _menhir_cell0_LEFT_PAREN, _menhir_box_input) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_input) _menhir_cell1_formula_role _menhir_cell0_COMMA, _menhir_box_input) _menhir_cell1_thf_formula, _menhir_box_input) _menhir_state
      (** State 580.
        Stack shape : THF LEFT_PAREN name COMMA formula_role COMMA thf_formula.
        Start symbol: input. *)

    | MenhirState585 : (('s, _menhir_box_input) _menhir_cell1_TFF _menhir_cell0_LEFT_PAREN, _menhir_box_input) _menhir_state
      (** State 585.
        Stack shape : TFF LEFT_PAREN.
        Start symbol: input. *)

    | MenhirState587 : ((('s, _menhir_box_input) _menhir_cell1_TFF _menhir_cell0_LEFT_PAREN, _menhir_box_input) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_input) _menhir_state
      (** State 587.
        Stack shape : TFF LEFT_PAREN name COMMA.
        Start symbol: input. *)

    | MenhirState589 : (((('s, _menhir_box_input) _menhir_cell1_TFF _menhir_cell0_LEFT_PAREN, _menhir_box_input) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_input) _menhir_cell1_formula_role _menhir_cell0_COMMA, _menhir_box_input) _menhir_state
      (** State 589.
        Stack shape : TFF LEFT_PAREN name COMMA formula_role COMMA.
        Start symbol: input. *)

    | MenhirState590 : ((((('s, _menhir_box_input) _menhir_cell1_TFF _menhir_cell0_LEFT_PAREN, _menhir_box_input) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_input) _menhir_cell1_formula_role _menhir_cell0_COMMA, _menhir_box_input) _menhir_cell1_tff_formula, _menhir_box_input) _menhir_state
      (** State 590.
        Stack shape : TFF LEFT_PAREN name COMMA formula_role COMMA tff_formula.
        Start symbol: input. *)

    | MenhirState595 : (('s, _menhir_box_input) _menhir_cell1_INCLUDE _menhir_cell0_LEFT_PAREN, _menhir_box_input) _menhir_state
      (** State 595.
        Stack shape : INCLUDE LEFT_PAREN.
        Start symbol: input. *)

    | MenhirState596 : ((('s, _menhir_box_input) _menhir_cell1_INCLUDE _menhir_cell0_LEFT_PAREN, _menhir_box_input) _menhir_cell1_file_name, _menhir_box_input) _menhir_state
      (** State 596.
        Stack shape : INCLUDE LEFT_PAREN file_name.
        Start symbol: input. *)

    | MenhirState601 : (('s, _menhir_box_input) _menhir_cell1_FOF _menhir_cell0_LEFT_PAREN, _menhir_box_input) _menhir_state
      (** State 601.
        Stack shape : FOF LEFT_PAREN.
        Start symbol: input. *)

    | MenhirState603 : ((('s, _menhir_box_input) _menhir_cell1_FOF _menhir_cell0_LEFT_PAREN, _menhir_box_input) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_input) _menhir_state
      (** State 603.
        Stack shape : FOF LEFT_PAREN name COMMA.
        Start symbol: input. *)

    | MenhirState605 : (((('s, _menhir_box_input) _menhir_cell1_FOF _menhir_cell0_LEFT_PAREN, _menhir_box_input) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_input) _menhir_cell1_formula_role _menhir_cell0_COMMA, _menhir_box_input) _menhir_state
      (** State 605.
        Stack shape : FOF LEFT_PAREN name COMMA formula_role COMMA.
        Start symbol: input. *)

    | MenhirState606 : ((((('s, _menhir_box_input) _menhir_cell1_FOF _menhir_cell0_LEFT_PAREN, _menhir_box_input) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_input) _menhir_cell1_formula_role _menhir_cell0_COMMA, _menhir_box_input) _menhir_cell1_fof_formula, _menhir_box_input) _menhir_state
      (** State 606.
        Stack shape : FOF LEFT_PAREN name COMMA formula_role COMMA fof_formula.
        Start symbol: input. *)

    | MenhirState612 : (('s, _menhir_box_input) _menhir_cell1_CNF _menhir_cell0_LEFT_PAREN, _menhir_box_input) _menhir_state
      (** State 612.
        Stack shape : CNF LEFT_PAREN.
        Start symbol: input. *)

    | MenhirState614 : ((('s, _menhir_box_input) _menhir_cell1_CNF _menhir_cell0_LEFT_PAREN, _menhir_box_input) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_input) _menhir_state
      (** State 614.
        Stack shape : CNF LEFT_PAREN name COMMA.
        Start symbol: input. *)

    | MenhirState616 : (((('s, _menhir_box_input) _menhir_cell1_CNF _menhir_cell0_LEFT_PAREN, _menhir_box_input) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_input) _menhir_cell1_formula_role _menhir_cell0_COMMA, _menhir_box_input) _menhir_state
      (** State 616.
        Stack shape : CNF LEFT_PAREN name COMMA formula_role COMMA.
        Start symbol: input. *)

    | MenhirState617 : ((((('s, _menhir_box_input) _menhir_cell1_CNF _menhir_cell0_LEFT_PAREN, _menhir_box_input) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_input) _menhir_cell1_formula_role _menhir_cell0_COMMA, _menhir_box_input) _menhir_cell1_cnf_formula, _menhir_box_input) _menhir_state
      (** State 617.
        Stack shape : CNF LEFT_PAREN name COMMA formula_role COMMA cnf_formula.
        Start symbol: input. *)

  
  and ('s, 'r) _menhir_cell1_atomic_formula = 
    | MenhirCell1_atomic_formula of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_atomic_word = 
    | MenhirCell1_atomic_word of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_binary_connective = 
    | MenhirCell1_binary_connective of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_cnf_formula = 
    | MenhirCell1_cnf_formula of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_constant = 
    | MenhirCell1_constant of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_defined_functor = 
    | MenhirCell1_defined_functor of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_defined_infix_pred = 
    | MenhirCell1_defined_infix_pred of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_disjunction = 
    | MenhirCell1_disjunction of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position
  
  and ('s, 'r) _menhir_cell1_file_name = 
    | MenhirCell1_file_name of 's * ('s, 'r) _menhir_state * (string)
  
  and ('s, 'r) _menhir_cell1_fof_and_formula = 
    | MenhirCell1_fof_and_formula of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position
  
  and ('s, 'r) _menhir_cell1_fof_formula = 
    | MenhirCell1_fof_formula of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_fof_logic_formula = 
    | MenhirCell1_fof_logic_formula of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_fof_or_formula = 
    | MenhirCell1_fof_or_formula of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position
  
  and ('s, 'r) _menhir_cell1_fof_tuple = 
    | MenhirCell1_fof_tuple of 's * ('s, 'r) _menhir_state * (T.t list) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_fof_unitary_formula = 
    | MenhirCell1_fof_unitary_formula of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_fof_variable_list = 
    | MenhirCell1_fof_variable_list of 's * ('s, 'r) _menhir_state * (T.t list)
  
  and ('s, 'r) _menhir_cell1_fol_quantifier = 
    | MenhirCell1_fol_quantifier of 's * ('s, 'r) _menhir_state * (?loc:L.t -> T.t list -> T.t -> T.t) * Lexing.position
  
  and ('s, 'r) _menhir_cell1_formula_role = 
    | MenhirCell1_formula_role of 's * ('s, 'r) _menhir_state * (string)
  
  and ('s, 'r) _menhir_cell1_general_data = 
    | MenhirCell1_general_data of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_general_term = 
    | MenhirCell1_general_term of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position
  
  and ('s, 'r) _menhir_cell1_infix_inequality = 
    | MenhirCell1_infix_inequality of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_name = 
    | MenhirCell1_name of 's * ('s, 'r) _menhir_state * (I.t)
  
  and ('s, 'r) _menhir_cell1_source = 
    | MenhirCell1_source of 's * ('s, 'r) _menhir_state * (T.t)
  
  and 's _menhir_cell0_subtype_sign = 
    | MenhirCell0_subtype_sign of 's * (unit)
  
  and ('s, 'r) _menhir_cell1_system_functor = 
    | MenhirCell1_system_functor of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_term = 
    | MenhirCell1_term of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_tff_and_formula = 
    | MenhirCell1_tff_and_formula of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position
  
  and ('s, 'r) _menhir_cell1_tff_atomic_type = 
    | MenhirCell1_tff_atomic_type of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_tff_formula = 
    | MenhirCell1_tff_formula of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_tff_let_formula_defn = 
    | MenhirCell1_tff_let_formula_defn of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position
  
  and ('s, 'r) _menhir_cell1_tff_let_term_defn = 
    | MenhirCell1_tff_let_term_defn of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position
  
  and ('s, 'r) _menhir_cell1_tff_logic_formula = 
    | MenhirCell1_tff_logic_formula of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_tff_or_formula = 
    | MenhirCell1_tff_or_formula of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position
  
  and ('s, 'r) _menhir_cell1_tff_tuple = 
    | MenhirCell1_tff_tuple of 's * ('s, 'r) _menhir_state * (T.t list) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_tff_unitary_formula = 
    | MenhirCell1_tff_unitary_formula of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_tff_unitary_type = 
    | MenhirCell1_tff_unitary_type of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position
  
  and ('s, 'r) _menhir_cell1_tff_untyped_atom = 
    | MenhirCell1_tff_untyped_atom of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position
  
  and ('s, 'r) _menhir_cell1_tff_variable = 
    | MenhirCell1_tff_variable of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_tff_variable_list = 
    | MenhirCell1_tff_variable_list of 's * ('s, 'r) _menhir_state * (T.t list)
  
  and ('s, 'r) _menhir_cell1_tff_xprod_type = 
    | MenhirCell1_tff_xprod_type of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position
  
  and ('s, 'r) _menhir_cell1_thf_and_formula = 
    | MenhirCell1_thf_and_formula of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_thf_apply_formula = 
    | MenhirCell1_thf_apply_formula of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_thf_formula = 
    | MenhirCell1_thf_formula of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_thf_let_formula_defn = 
    | MenhirCell1_thf_let_formula_defn of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_thf_let_term_defn = 
    | MenhirCell1_thf_let_term_defn of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_thf_logic_formula = 
    | MenhirCell1_thf_logic_formula of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position
  
  and ('s, 'r) _menhir_cell1_thf_or_formula = 
    | MenhirCell1_thf_or_formula of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_thf_pair_connective = 
    | MenhirCell1_thf_pair_connective of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_thf_quantifier = 
    | MenhirCell1_thf_quantifier of 's * ('s, 'r) _menhir_state * (?loc:L.t -> T.t list -> T.t -> T.t) * Lexing.position
  
  and ('s, 'r) _menhir_cell1_thf_tuple = 
    | MenhirCell1_thf_tuple of 's * ('s, 'r) _menhir_state * (T.t list) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_thf_typeable_formula = 
    | MenhirCell1_thf_typeable_formula of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position
  
  and ('s, 'r) _menhir_cell1_thf_unary_connective = 
    | MenhirCell1_thf_unary_connective of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_thf_union_type = 
    | MenhirCell1_thf_union_type of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_thf_unitary_formula = 
    | MenhirCell1_thf_unitary_formula of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_thf_unitary_type = 
    | MenhirCell1_thf_unitary_type of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_thf_variable = 
    | MenhirCell1_thf_variable of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_thf_variable_list = 
    | MenhirCell1_thf_variable_list of 's * ('s, 'r) _menhir_state * (T.t list)
  
  and ('s, 'r) _menhir_cell1_thf_xprod_type = 
    | MenhirCell1_thf_xprod_type of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_tpi_formula = 
    | MenhirCell1_tpi_formula of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_tptp_functor = 
    | MenhirCell1_tptp_functor of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_tptp_input = 
    | MenhirCell1_tptp_input of 's * ('s, 'r) _menhir_state * (S.t)
  
  and ('s, 'r) _menhir_cell1_unary_connective = 
    | MenhirCell1_unary_connective of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_unary_negation = 
    | MenhirCell1_unary_negation of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_variable = 
    | MenhirCell1_variable of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_AND = 
    | MenhirCell1_AND of 's * ('s, 'r) _menhir_state * Lexing.position * Lexing.position
  
  and 's _menhir_cell0_AND = 
    | MenhirCell0_AND of 's * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_APPLY = 
    | MenhirCell1_APPLY of 's * ('s, 'r) _menhir_state
  
  and ('s, 'r) _menhir_cell1_CNF = 
    | MenhirCell1_CNF of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_COMMA = 
    | MenhirCell1_COMMA of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and 's _menhir_cell0_COMMA = 
    | MenhirCell0_COMMA of 's * Lexing.position
  
  and ('s, 'r) _menhir_cell1_DOLLAR_CNF = 
    | MenhirCell1_DOLLAR_CNF of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_DOLLAR_FOF = 
    | MenhirCell1_DOLLAR_FOF of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_DOLLAR_FOT = 
    | MenhirCell1_DOLLAR_FOT of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_DOLLAR_TFF = 
    | MenhirCell1_DOLLAR_TFF of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_DOLLAR_THF = 
    | MenhirCell1_DOLLAR_THF of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and 's _menhir_cell0_EQUAL = 
    | MenhirCell0_EQUAL of 's * Lexing.position * Lexing.position
  
  and 's _menhir_cell0_EQUIV = 
    | MenhirCell0_EQUIV of 's * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_FOF = 
    | MenhirCell1_FOF of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_FORALL = 
    | MenhirCell1_FORALL of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_FORALL_TY = 
    | MenhirCell1_FORALL_TY of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_INCLUDE = 
    | MenhirCell1_INCLUDE of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_ITE_F = 
    | MenhirCell1_ITE_F of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_ITE_T = 
    | MenhirCell1_ITE_T of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_LEFT_BRACKET = 
    | MenhirCell1_LEFT_BRACKET of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and 's _menhir_cell0_LEFT_BRACKET = 
    | MenhirCell0_LEFT_BRACKET of 's * Lexing.position
  
  and ('s, 'r) _menhir_cell1_LEFT_PAREN = 
    | MenhirCell1_LEFT_PAREN of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and 's _menhir_cell0_LEFT_PAREN = 
    | MenhirCell0_LEFT_PAREN of 's * Lexing.position
  
  and ('s, 'r) _menhir_cell1_LET_FF = 
    | MenhirCell1_LET_FF of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_LET_FT = 
    | MenhirCell1_LET_FT of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_LET_TF = 
    | MenhirCell1_LET_TF of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_LET_TT = 
    | MenhirCell1_LET_TT of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and 's _menhir_cell0_RIGHT_BRACKET = 
    | MenhirCell0_RIGHT_BRACKET of 's * Lexing.position
  
  and ('s, 'r) _menhir_cell1_TFF = 
    | MenhirCell1_TFF of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_THF = 
    | MenhirCell1_THF of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_TPI = 
    | MenhirCell1_TPI of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_VLINE = 
    | MenhirCell1_VLINE of 's * ('s, 'r) _menhir_state * Lexing.position * Lexing.position
  
  and 's _menhir_cell0_VLINE = 
    | MenhirCell0_VLINE of 's * Lexing.position * Lexing.position
  
  and _menhir_box_input = 
    | MenhirBox_input of (S.t option) [@@unboxed]
  
  and _menhir_box_file = 
    | MenhirBox_file of (S.t list) [@@unboxed]
  
  let _menhir_action_002 =
    fun f ->
      (
# 42 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 1186 "src/languages/tptp/v6.3.0/parser.ml"
       : (S.t))
  
  let _menhir_action_003 =
    fun f ->
      (
# 42 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 1194 "src/languages/tptp/v6.3.0/parser.ml"
       : (S.t))
  
  let _menhir_action_004 =
    fun f ->
      (
# 42 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 1202 "src/languages/tptp/v6.3.0/parser.ml"
       : (S.t))
  
  let _menhir_action_005 =
    fun f ->
      (
# 42 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 1210 "src/languages/tptp/v6.3.0/parser.ml"
       : (S.t))
  
  let _menhir_action_006 =
    fun f ->
      (
# 42 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 1218 "src/languages/tptp/v6.3.0/parser.ml"
       : (S.t))
  
  let _menhir_action_007 =
    fun _endpos_i_ _startpos__1_ i s ->
      let _endpos = _endpos_i_ in
      let _startpos = _startpos__1_ in
      (
# 71 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in Some (S.annot ~loc s i) )
# 1228 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t option))
  
  let _menhir_action_008 =
    fun () ->
      (
# 72 "src/languages/tptp/v6.3.0/parser.mly"
    ( None )
# 1236 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t option))
  
  let _menhir_action_009 =
    fun t ->
      (
# 727 "src/languages/tptp/v6.3.0/parser.mly"
    ( [ t ] )
# 1244 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t list))
  
  let _menhir_action_010 =
    fun l t ->
      (
# 729 "src/languages/tptp/v6.3.0/parser.mly"
    ( t :: l )
# 1252 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t list))
  
  let _menhir_action_011 =
    fun _endpos__1_ _startpos__1_ ->
      let _endpos = _endpos__1_ in
      let _startpos = _startpos__1_ in
      (
# 592 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.or_t ~loc () )
# 1262 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_012 =
    fun _endpos__1_ _startpos__1_ ->
      let _endpos = _endpos__1_ in
      let _startpos = _startpos__1_ in
      (
# 594 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.and_t ~loc () )
# 1272 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_013 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 838 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.const ~loc (I.mk I.term s) )
# 1283 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_014 =
    fun f ->
      (
# 614 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 1291 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_015 =
    fun f ->
      (
# 614 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 1299 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_016 =
    fun f ->
      (
# 614 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 1307 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_017 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 843 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.const ~loc (I.mk I.term s) )
# 1318 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_018 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 833 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.const ~loc (I.mk I.term s) )
# 1329 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_019 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 833 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.const ~loc (I.mk I.term s) )
# 1340 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_020 =
    fun _endpos__1_ _startpos__1_ ->
      let _endpos = _endpos__1_ in
      let _startpos = _startpos__1_ in
      (
# 578 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.equiv_t ~loc () )
# 1350 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_021 =
    fun _endpos__1_ _startpos__1_ ->
      let _endpos = _endpos__1_ in
      let _startpos = _startpos__1_ in
      (
# 580 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.implies_t ~loc () )
# 1360 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_022 =
    fun _endpos__1_ _startpos__1_ ->
      let _endpos = _endpos__1_ in
      let _startpos = _startpos__1_ in
      (
# 582 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.implied_t ~loc () )
# 1370 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_023 =
    fun _endpos__1_ _startpos__1_ ->
      let _endpos = _endpos__1_ in
      let _startpos = _startpos__1_ in
      (
# 584 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.xor_t ~loc () )
# 1380 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_024 =
    fun _endpos__1_ _startpos__1_ ->
      let _endpos = _endpos__1_ in
      let _startpos = _startpos__1_ in
      (
# 586 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.nor_t ~loc () )
# 1390 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_025 =
    fun _endpos__1_ _startpos__1_ ->
      let _endpos = _endpos__1_ in
      let _startpos = _startpos__1_ in
      (
# 588 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.nand_t ~loc () )
# 1400 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_026 =
    fun _endpos__10_ _startpos__1_ annot f r s ->
      let _endpos = _endpos__10_ in
      let _startpos = _startpos__1_ in
      (
# 67 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.cnf ~loc ?annot s r f )
# 1410 "src/languages/tptp/v6.3.0/parser.ml"
       : (S.t))
  
  let _menhir_action_027 =
    fun f ->
      (
# 504 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 1418 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_028 =
    fun f ->
      (
# 504 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 1426 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_029 =
    fun _endpos__8_ _startpos__1_ cond if_else if_then ->
      let _endpos = _endpos__8_ in
      let _startpos = _startpos__1_ in
      (
# 733 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.ite ~loc cond if_then if_else )
# 1436 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_030 =
    fun c ->
      (
# 672 "src/languages/tptp/v6.3.0/parser.mly"
    ( c )
# 1444 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_031 =
    fun a ->
      (
# 686 "src/languages/tptp/v6.3.0/parser.mly"
    ( a )
# 1452 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_032 =
    fun a ->
      (
# 686 "src/languages/tptp/v6.3.0/parser.mly"
    ( a )
# 1460 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_033 =
    fun f ->
      (
# 623 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 1468 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_034 =
    fun f ->
      (
# 623 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 1476 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_035 =
    fun t ->
      (
# 690 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 1484 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_036 =
    fun c ->
      (
# 700 "src/languages/tptp/v6.3.0/parser.mly"
    ( c )
# 1492 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_037 =
    fun f ->
      (
# 704 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 1500 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_038 =
    fun _endpos_u_ _startpos_t_ c t u ->
      let _endpos = _endpos_u_ in
      let _startpos = _startpos_t_ in
      (
# 631 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.apply ~loc c [t; u] )
# 1510 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_039 =
    fun t ->
      (
# 635 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 1518 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_040 =
    fun f ->
      (
# 627 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 1526 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_041 =
    fun c ->
      (
# 694 "src/languages/tptp/v6.3.0/parser.mly"
    ( c )
# 1534 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_042 =
    fun _endpos__4_ _startpos_f_ f l ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos_f_ in
      (
# 696 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.apply ~loc f l )
# 1544 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_043 =
    fun t ->
      (
# 681 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 1552 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_044 =
    fun t ->
      (
# 681 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 1560 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_045 =
    fun t ->
      (
# 606 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 1568 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_046 =
    fun x ->
      (
# 508 "src/languages/tptp/v6.3.0/parser.mly"
    ( x )
# 1576 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_047 =
    fun _endpos__2_ _endpos_x_ _startpos__2_ _startpos_f_ f x ->
      let _endpos = _endpos_x_ in
      let _startpos = _startpos_f_ in
      (
# 510 "src/languages/tptp/v6.3.0/parser.mly"
    ( let op = let loc = L.mk_pos _startpos__2_ _endpos__2_ in T.or_t ~loc () in
      let loc = L.mk_pos _startpos _endpos in T.apply ~loc op [f; x] )
# 1587 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_048 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 860 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.distinct ~loc (I.mk I.term s) )
# 1598 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_049 =
    fun l ->
      (
# 21 "src/languages/tptp/v6.3.0/parser.mly"
                      ( l )
# 1606 "src/languages/tptp/v6.3.0/parser.ml"
       : (S.t list))
  
  let _menhir_action_050 =
    fun s ->
      (
# 854 "src/languages/tptp/v6.3.0/parser.mly"
    ( let n = String.length s in String.sub s 1 (n - 2) )
# 1614 "src/languages/tptp/v6.3.0/parser.ml"
       : (string))
  
  let _menhir_action_051 =
    fun _endpos__2_ _endpos_g_ _startpos__2_ _startpos_f_ f g ->
      let _endpos = _endpos_g_ in
      let _startpos = _startpos_f_ in
      (
# 458 "src/languages/tptp/v6.3.0/parser.mly"
    ( let op = let loc = L.mk_pos _startpos__2_ _endpos__2_ in T.and_t ~loc () in
      let loc = L.mk_pos _startpos _endpos in T.apply ~loc op [f; g] )
# 1625 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_052 =
    fun _endpos__2_ _endpos_g_ _startpos__2_ _startpos_f_ f g ->
      let _endpos = _endpos_g_ in
      let _startpos = _startpos_f_ in
      (
# 458 "src/languages/tptp/v6.3.0/parser.mly"
    ( let op = let loc = L.mk_pos _startpos__2_ _endpos__2_ in T.and_t ~loc () in
      let loc = L.mk_pos _startpos _endpos in T.apply ~loc op [f; g] )
# 1636 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_053 =
    fun _endpos__10_ _startpos__1_ annot f r s ->
      let _endpos = _endpos__10_ in
      let _startpos = _startpos__1_ in
      (
# 62 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.fof ~loc ?annot s r f )
# 1646 "src/languages/tptp/v6.3.0/parser.ml"
       : (S.t))
  
  let _menhir_action_054 =
    fun f ->
      (
# 447 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 1654 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_055 =
    fun f ->
      (
# 447 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 1662 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_056 =
    fun f ->
      (
# 438 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 1670 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_057 =
    fun f ->
      (
# 438 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 1678 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_058 =
    fun _endpos_g_ _startpos_f_ c f g ->
      let _endpos = _endpos_g_ in
      let _startpos = _startpos_f_ in
      (
# 442 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.apply ~loc c [f; g] )
# 1688 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_059 =
    fun f ->
      (
# 428 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 1696 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_060 =
    fun f ->
      (
# 428 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 1704 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_061 =
    fun f ->
      (
# 433 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 1712 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_062 =
    fun f ->
      (
# 433 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 1720 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_063 =
    fun _endpos__2_ _endpos_g_ _startpos__2_ _startpos_f_ f g ->
      let _endpos = _endpos_g_ in
      let _startpos = _startpos_f_ in
      (
# 452 "src/languages/tptp/v6.3.0/parser.mly"
    ( let op = let loc = L.mk_pos _startpos__2_ _endpos__2_ in T.or_t ~loc () in
      let loc = L.mk_pos _startpos _endpos in T.apply ~loc op [f; g] )
# 1731 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_064 =
    fun _endpos__2_ _endpos_g_ _startpos__2_ _startpos_f_ f g ->
      let _endpos = _endpos_g_ in
      let _startpos = _startpos_f_ in
      (
# 452 "src/languages/tptp/v6.3.0/parser.mly"
    ( let op = let loc = L.mk_pos _startpos__2_ _endpos__2_ in T.or_t ~loc () in
      let loc = L.mk_pos _startpos _endpos in T.apply ~loc op [f; g] )
# 1742 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_065 =
    fun _endpos_f_ _startpos_q_ f l q ->
      let _endpos = _endpos_f_ in
      let _startpos = _startpos_q_ in
      (
# 470 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = Some (L.mk_pos _startpos _endpos) in q ?loc l f )
# 1752 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_066 =
    fun _endpos_goal_ _startpos_hyp_ goal hyp ->
      let _endpos = _endpos_goal_ in
      let _startpos = _startpos_hyp_ in
      (
# 486 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.sequent ~loc hyp goal )
# 1762 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_067 =
    fun t ->
      (
# 488 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 1770 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_068 =
    fun () ->
      (
# 492 "src/languages/tptp/v6.3.0/parser.mly"
    ( [] )
# 1778 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t list))
  
  let _menhir_action_069 =
    fun l ->
      (
# 494 "src/languages/tptp/v6.3.0/parser.mly"
    ( l )
# 1786 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t list))
  
  let _menhir_action_070 =
    fun f ->
      (
# 498 "src/languages/tptp/v6.3.0/parser.mly"
    ( [ f ] )
# 1794 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t list))
  
  let _menhir_action_071 =
    fun f l ->
      (
# 500 "src/languages/tptp/v6.3.0/parser.mly"
    ( f :: l )
# 1802 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t list))
  
  let _menhir_action_072 =
    fun _endpos_f_ _startpos_c_ c f ->
      let _endpos = _endpos_f_ in
      let _startpos = _startpos_c_ in
      (
# 480 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.apply ~loc c [f] )
# 1812 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_073 =
    fun f ->
      (
# 482 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 1820 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_074 =
    fun f ->
      (
# 466 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 1828 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_075 =
    fun f ->
      (
# 466 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 1836 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_076 =
    fun f ->
      (
# 466 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 1844 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_077 =
    fun f ->
      (
# 466 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 1852 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_078 =
    fun v ->
      (
# 474 "src/languages/tptp/v6.3.0/parser.mly"
    ( [ v ] )
# 1860 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t list))
  
  let _menhir_action_079 =
    fun l v ->
      (
# 476 "src/languages/tptp/v6.3.0/parser.mly"
    ( v :: l )
# 1868 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t list))
  
  let _menhir_action_080 =
    fun _endpos_u_ _startpos_t_ f t u ->
      let _endpos = _endpos_u_ in
      let _startpos = _startpos_t_ in
      (
# 532 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.apply ~loc f [t; u] )
# 1878 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_081 =
    fun () ->
      (
# 572 "src/languages/tptp/v6.3.0/parser.mly"
    ( T.forall )
# 1886 "src/languages/tptp/v6.3.0/parser.ml"
       : (?loc:L.t -> T.t list -> T.t -> T.t))
  
  let _menhir_action_082 =
    fun () ->
      (
# 574 "src/languages/tptp/v6.3.0/parser.mly"
    ( T.exists )
# 1894 "src/languages/tptp/v6.3.0/parser.ml"
       : (?loc:L.t -> T.t list -> T.t -> T.t))
  
  let _menhir_action_083 =
    fun f ->
      (
# 802 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 1902 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_084 =
    fun f ->
      (
# 802 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 1910 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_085 =
    fun f ->
      (
# 802 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 1918 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_086 =
    fun f ->
      (
# 802 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 1926 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_087 =
    fun f ->
      (
# 802 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 1934 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_088 =
    fun s ->
      (
# 78 "src/languages/tptp/v6.3.0/parser.mly"
                 ( s )
# 1942 "src/languages/tptp/v6.3.0/parser.ml"
       : (string))
  
  let _menhir_action_089 =
    fun l ->
      (
# 765 "src/languages/tptp/v6.3.0/parser.mly"
    ( l )
# 1950 "src/languages/tptp/v6.3.0/parser.ml"
       : (I.t list))
  
  let _menhir_action_090 =
    fun () ->
      (
# 766 "src/languages/tptp/v6.3.0/parser.mly"
    ( [] )
# 1958 "src/languages/tptp/v6.3.0/parser.ml"
       : (I.t list))
  
  let _menhir_action_091 =
    fun t ->
      (
# 662 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 1966 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_092 =
    fun t ->
      (
# 662 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 1974 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_093 =
    fun t ->
      (
# 662 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 1982 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_094 =
    fun d ->
      (
# 790 "src/languages/tptp/v6.3.0/parser.mly"
    ( d )
# 1990 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_095 =
    fun d ->
      (
# 790 "src/languages/tptp/v6.3.0/parser.mly"
    ( d )
# 1998 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_096 =
    fun d ->
      (
# 790 "src/languages/tptp/v6.3.0/parser.mly"
    ( d )
# 2006 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_097 =
    fun d ->
      (
# 790 "src/languages/tptp/v6.3.0/parser.mly"
    ( d )
# 2014 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_098 =
    fun d ->
      (
# 790 "src/languages/tptp/v6.3.0/parser.mly"
    ( d )
# 2022 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_099 =
    fun d ->
      (
# 790 "src/languages/tptp/v6.3.0/parser.mly"
    ( d )
# 2030 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_100 =
    fun _endpos__4_ _startpos_f_ f l ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos_f_ in
      (
# 794 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.apply ~loc f l )
# 2040 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_101 =
    fun () ->
      (
# 806 "src/languages/tptp/v6.3.0/parser.mly"
    ( [] )
# 2048 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t list))
  
  let _menhir_action_102 =
    fun l ->
      (
# 808 "src/languages/tptp/v6.3.0/parser.mly"
    ( l )
# 2056 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t list))
  
  let _menhir_action_103 =
    fun d ->
      (
# 776 "src/languages/tptp/v6.3.0/parser.mly"
    ( d )
# 2064 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_104 =
    fun _endpos_l_ _startpos_l_ l ->
      let _endpos = _endpos_l_ in
      let _startpos = _startpos_l_ in
      (
# 778 "src/languages/tptp/v6.3.0/parser.mly"
    ( let f = let loc = L.mk_pos _startpos _endpos in T.data_t ~loc () in
      let loc = L.mk_pos _startpos _endpos in T.apply ~loc f l )
# 2075 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_105 =
    fun _endpos_t_ _startpos_d_ d t ->
      let _endpos = _endpos_t_ in
      let _startpos = _startpos_d_ in
      (
# 781 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.colon ~loc d t )
# 2085 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_106 =
    fun t ->
      (
# 812 "src/languages/tptp/v6.3.0/parser.mly"
    ( [ t ] )
# 2093 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t list))
  
  let _menhir_action_107 =
    fun l t ->
      (
# 814 "src/languages/tptp/v6.3.0/parser.mly"
    ( t :: l )
# 2101 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t list))
  
  let _menhir_action_108 =
    fun _endpos__1_ _startpos__1_ ->
      let _endpos = _endpos__1_ in
      let _startpos = _startpos__1_ in
      (
# 639 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.eq_t ~loc () )
# 2111 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_109 =
    fun _endpos__1_ _startpos__1_ ->
      let _endpos = _endpos__1_ in
      let _startpos = _startpos__1_ in
      (
# 643 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.neq_t ~loc () )
# 2121 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_110 =
    fun i ->
      (
# 25 "src/languages/tptp/v6.3.0/parser.mly"
    ( Some i )
# 2129 "src/languages/tptp/v6.3.0/parser.ml"
       : (S.t option))
  
  let _menhir_action_111 =
    fun () ->
      (
# 27 "src/languages/tptp/v6.3.0/parser.mly"
    ( None )
# 2137 "src/languages/tptp/v6.3.0/parser.ml"
       : (S.t option))
  
  let _menhir_action_112 =
    fun _endpos_n_ _startpos_n_ n ->
      let _endpos = _endpos_n_ in
      let _startpos = _startpos_n_ in
      (
# 865 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.int ~loc n )
# 2147 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_113 =
    fun _endpos__6_ _startpos__1_ l t ->
      let _endpos = _endpos__6_ in
      let _startpos = _startpos__1_ in
      (
# 738 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.letin ~loc [l] t )
# 2157 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_114 =
    fun _endpos__6_ _startpos__1_ l t ->
      let _endpos = _endpos__6_ in
      let _startpos = _startpos__1_ in
      (
# 738 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.letin ~loc [l] t )
# 2167 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_115 =
    fun () ->
      (
# 216 "<standard.mly>"
    ( [] )
# 2175 "src/languages/tptp/v6.3.0/parser.ml"
       : (S.t list))
  
  let _menhir_action_116 =
    fun x xs ->
      (
# 219 "<standard.mly>"
    ( x :: xs )
# 2183 "src/languages/tptp/v6.3.0/parser.ml"
       : (S.t list))
  
  let _menhir_action_117 =
    fun f ->
      (
# 515 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 2191 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_118 =
    fun _endpos_f_ _startpos_c_ c f ->
      let _endpos = _endpos_f_ in
      let _startpos = _startpos_c_ in
      (
# 517 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.apply ~loc c [f] )
# 2201 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_119 =
    fun f ->
      (
# 519 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 2209 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_120 =
    fun s ->
      (
# 828 "src/languages/tptp/v6.3.0/parser.mly"
    ( I.mk I.decl s )
# 2217 "src/languages/tptp/v6.3.0/parser.ml"
       : (I.t))
  
  let _menhir_action_121 =
    fun s ->
      (
# 828 "src/languages/tptp/v6.3.0/parser.mly"
    ( I.mk I.decl s )
# 2225 "src/languages/tptp/v6.3.0/parser.ml"
       : (I.t))
  
  let _menhir_action_122 =
    fun s ->
      (
# 828 "src/languages/tptp/v6.3.0/parser.mly"
    ( I.mk I.decl s )
# 2233 "src/languages/tptp/v6.3.0/parser.ml"
       : (I.t))
  
  let _menhir_action_123 =
    fun n ->
      (
# 770 "src/languages/tptp/v6.3.0/parser.mly"
    ( [ n ] )
# 2241 "src/languages/tptp/v6.3.0/parser.ml"
       : (I.t list))
  
  let _menhir_action_124 =
    fun l n ->
      (
# 772 "src/languages/tptp/v6.3.0/parser.mly"
    ( n :: l )
# 2249 "src/languages/tptp/v6.3.0/parser.ml"
       : (I.t list))
  
  let _menhir_action_125 =
    fun n ->
      (
# 850 "src/languages/tptp/v6.3.0/parser.mly"
    ( n )
# 2257 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_126 =
    fun n ->
      (
# 850 "src/languages/tptp/v6.3.0/parser.mly"
    ( n )
# 2265 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_127 =
    fun n ->
      (
# 850 "src/languages/tptp/v6.3.0/parser.mly"
    ( n )
# 2273 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_128 =
    fun i ->
      (
# 749 "src/languages/tptp/v6.3.0/parser.mly"
    ( i )
# 2281 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t list))
  
  let _menhir_action_129 =
    fun () ->
      (
# 750 "src/languages/tptp/v6.3.0/parser.mly"
    ( [] )
# 2289 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t list))
  
  let _menhir_action_130 =
    fun t ->
      (
# 618 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 2297 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_131 =
    fun c ->
      (
# 666 "src/languages/tptp/v6.3.0/parser.mly"
    ( c )
# 2305 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_132 =
    fun _endpos__4_ _startpos_f_ f l ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos_f_ in
      (
# 668 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.apply ~loc f l )
# 2315 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_133 =
    fun _endpos_n_ _startpos_n_ n ->
      let _endpos = _endpos_n_ in
      let _startpos = _startpos_n_ in
      (
# 869 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.rat ~loc n )
# 2325 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_134 =
    fun _endpos_n_ _startpos_n_ n ->
      let _endpos = _endpos_n_ in
      let _startpos = _startpos_n_ in
      (
# 873 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.real ~loc n )
# 2335 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_135 =
    fun t ->
      (
# 745 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 2343 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_136 =
    fun () ->
      (
# 568 "src/languages/tptp/v6.3.0/parser.mly"
              ( () )
# 2351 "src/languages/tptp/v6.3.0/parser.ml"
       : (unit))
  
  let _menhir_action_137 =
    fun t ->
      (
# 647 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 2359 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_138 =
    fun f ->
      (
# 714 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 2367 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_139 =
    fun f ->
      (
# 718 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 2375 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_140 =
    fun c ->
      (
# 708 "src/languages/tptp/v6.3.0/parser.mly"
    ( c )
# 2383 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_141 =
    fun _endpos__4_ _startpos_f_ f l ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos_f_ in
      (
# 710 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.apply ~loc f l )
# 2393 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_142 =
    fun t ->
      (
# 656 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 2401 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_143 =
    fun t ->
      (
# 656 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 2409 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_144 =
    fun t ->
      (
# 656 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 2417 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_145 =
    fun t ->
      (
# 656 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 2425 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_146 =
    fun _endpos__2_ _endpos_g_ _startpos__2_ _startpos_f_ f g ->
      let _endpos = _endpos_g_ in
      let _startpos = _startpos_f_ in
      (
# 276 "src/languages/tptp/v6.3.0/parser.mly"
    ( let op = let loc = L.mk_pos _startpos__2_ _endpos__2_ in T.and_t ~loc () in
      let loc = L.mk_pos _startpos _endpos in T.apply ~loc op [f; g] )
# 2436 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_147 =
    fun _endpos__2_ _endpos_g_ _startpos__2_ _startpos_f_ f g ->
      let _endpos = _endpos_g_ in
      let _startpos = _startpos_f_ in
      (
# 276 "src/languages/tptp/v6.3.0/parser.mly"
    ( let op = let loc = L.mk_pos _startpos__2_ _endpos__2_ in T.and_t ~loc () in
      let loc = L.mk_pos _startpos _endpos in T.apply ~loc op [f; g] )
# 2447 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_148 =
    fun _endpos__10_ _startpos__1_ annot f r s ->
      let _endpos = _endpos__10_ in
      let _startpos = _startpos__1_ in
      (
# 57 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.tff ~loc ?annot s r f )
# 2457 "src/languages/tptp/v6.3.0/parser.ml"
       : (S.t))
  
  let _menhir_action_149 =
    fun t ->
      (
# 403 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 2465 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_150 =
    fun t ->
      (
# 403 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 2473 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_151 =
    fun t ->
      (
# 403 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 2481 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_152 =
    fun _endpos__4_ _startpos_f_ f l ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos_f_ in
      (
# 405 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.apply ~loc f l )
# 2491 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_153 =
    fun f ->
      (
# 265 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 2499 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_154 =
    fun f ->
      (
# 265 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 2507 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_155 =
    fun f ->
      (
# 256 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 2515 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_156 =
    fun f ->
      (
# 256 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 2523 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_157 =
    fun _endpos_g_ _startpos_f_ c f g ->
      let _endpos = _endpos_g_ in
      let _startpos = _startpos_f_ in
      (
# 260 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.apply ~loc c [f; g] )
# 2533 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_158 =
    fun _endpos__8_ _startpos__1_ cond if_else if_then ->
      let _endpos = _endpos__8_ in
      let _startpos = _startpos__1_ in
      (
# 316 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.ite ~loc cond if_then if_else )
# 2543 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_159 =
    fun f ->
      (
# 246 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 2551 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_160 =
    fun f ->
      (
# 246 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 2559 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_161 =
    fun f ->
      (
# 246 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 2567 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_162 =
    fun _endpos__6_ _startpos__1_ f l ->
      let _endpos = _endpos__6_ in
      let _startpos = _startpos__1_ in
      (
# 321 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.letin ~loc [l] f )
# 2577 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_163 =
    fun _endpos__6_ _startpos__1_ f l ->
      let _endpos = _endpos__6_ in
      let _startpos = _startpos__1_ in
      (
# 321 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.letin ~loc [l] f )
# 2587 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_164 =
    fun _endpos__2_ _endpos_u_ _startpos__2_ _startpos_t_ t u ->
      let _endpos = _endpos_u_ in
      let _startpos = _startpos_t_ in
      (
# 344 "src/languages/tptp/v6.3.0/parser.mly"
    ( let f = let loc = L.mk_pos _startpos__2_ _endpos__2_ in T.equiv_t ~loc () in
      let loc = L.mk_pos _startpos _endpos in T.apply ~loc f [t; u] )
# 2598 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_165 =
    fun t ->
      (
# 347 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 2606 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_166 =
    fun _endpos_t_ _startpos__1_ l t ->
      let _endpos = _endpos_t_ in
      let _startpos = _startpos__1_ in
      (
# 338 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.forall ~loc l t )
# 2616 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_167 =
    fun t ->
      (
# 340 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 2624 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_168 =
    fun _endpos__2_ _endpos_u_ _startpos__2_ _startpos_t_ t u ->
      let _endpos = _endpos_u_ in
      let _startpos = _startpos_t_ in
      (
# 331 "src/languages/tptp/v6.3.0/parser.mly"
    ( let f = let loc = L.mk_pos _startpos__2_ _endpos__2_ in T.eq_t ~loc () in
      let loc = L.mk_pos _startpos _endpos in T.apply ~loc f [t; u] )
# 2635 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_169 =
    fun t ->
      (
# 334 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 2643 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_170 =
    fun _endpos_t_ _startpos__1_ l t ->
      let _endpos = _endpos_t_ in
      let _startpos = _startpos__1_ in
      (
# 325 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.forall ~loc l t )
# 2653 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_171 =
    fun t ->
      (
# 327 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 2661 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_172 =
    fun f ->
      (
# 251 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 2669 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_173 =
    fun f ->
      (
# 251 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 2677 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_174 =
    fun _endpos_ret_ _startpos_arg_ arg ret ->
      let _endpos = _endpos_ret_ in
      let _startpos = _startpos_arg_ in
      (
# 415 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.arrow ~loc arg ret )
# 2687 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_175 =
    fun t ->
      (
# 392 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 2695 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_176 =
    fun t ->
      (
# 392 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 2703 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_177 =
    fun _endpos__2_ _endpos_g_ _startpos__2_ _startpos_f_ f g ->
      let _endpos = _endpos_g_ in
      let _startpos = _startpos_f_ in
      (
# 270 "src/languages/tptp/v6.3.0/parser.mly"
    ( let op = let loc = L.mk_pos _startpos__2_ _endpos__2_ in T.or_t ~loc () in
      let loc = L.mk_pos _startpos _endpos in T.apply ~loc op [f; g] )
# 2714 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_178 =
    fun _endpos__2_ _endpos_g_ _startpos__2_ _startpos_f_ f g ->
      let _endpos = _endpos_g_ in
      let _startpos = _startpos_f_ in
      (
# 270 "src/languages/tptp/v6.3.0/parser.mly"
    ( let op = let loc = L.mk_pos _startpos__2_ _endpos__2_ in T.or_t ~loc () in
      let loc = L.mk_pos _startpos _endpos in T.apply ~loc op [f; g] )
# 2725 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_179 =
    fun _endpos_f_ _startpos_q_ f l q ->
      let _endpos = _endpos_f_ in
      let _startpos = _startpos_q_ in
      (
# 290 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = Some (L.mk_pos _startpos _endpos) in q ?loc l f )
# 2735 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_180 =
    fun _endpos_t_ _startpos__1_ l t ->
      let _endpos = _endpos_t_ in
      let _startpos = _startpos__1_ in
      (
# 387 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.pi ~loc l t )
# 2745 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_181 =
    fun _endpos_goal_ _startpos_hyp_ goal hyp ->
      let _endpos = _endpos_goal_ in
      let _startpos = _startpos_hyp_ in
      (
# 351 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.sequent ~loc hyp goal )
# 2755 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_182 =
    fun t ->
      (
# 353 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 2763 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_183 =
    fun t ->
      (
# 383 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 2771 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_184 =
    fun t ->
      (
# 383 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 2779 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_185 =
    fun t ->
      (
# 383 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 2787 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_186 =
    fun t ->
      (
# 383 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 2795 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_187 =
    fun () ->
      (
# 357 "src/languages/tptp/v6.3.0/parser.mly"
    ( [] )
# 2803 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t list))
  
  let _menhir_action_188 =
    fun l ->
      (
# 359 "src/languages/tptp/v6.3.0/parser.mly"
    ( l )
# 2811 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t list))
  
  let _menhir_action_189 =
    fun f ->
      (
# 363 "src/languages/tptp/v6.3.0/parser.mly"
    ( [ f ] )
# 2819 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t list))
  
  let _menhir_action_190 =
    fun f l ->
      (
# 365 "src/languages/tptp/v6.3.0/parser.mly"
    ( f :: l )
# 2827 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t list))
  
  let _menhir_action_191 =
    fun t ->
      (
# 409 "src/languages/tptp/v6.3.0/parser.mly"
    ( [ t ] )
# 2835 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t list))
  
  let _menhir_action_192 =
    fun l t ->
      (
# 411 "src/languages/tptp/v6.3.0/parser.mly"
    ( t :: l )
# 2843 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t list))
  
  let _menhir_action_193 =
    fun _endpos_ty_ _startpos_t_ t ty ->
      let _endpos = _endpos_ty_ in
      let _startpos = _startpos_t_ in
      (
# 369 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.colon ~loc t ty )
# 2853 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_194 =
    fun t ->
      (
# 371 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 2861 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_195 =
    fun _endpos_ty_ _startpos_v_ ty v ->
      let _endpos = _endpos_ty_ in
      let _startpos = _startpos_v_ in
      (
# 305 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.colon ~loc v ty )
# 2871 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_196 =
    fun _endpos_f_ _startpos_u_ f u ->
      let _endpos = _endpos_f_ in
      let _startpos = _startpos_u_ in
      (
# 309 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.apply ~loc u [f] )
# 2881 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_197 =
    fun f ->
      (
# 311 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 2889 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_198 =
    fun f ->
      (
# 286 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 2897 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_199 =
    fun f ->
      (
# 286 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 2905 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_200 =
    fun f ->
      (
# 286 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 2913 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_201 =
    fun f ->
      (
# 286 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 2921 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_202 =
    fun f ->
      (
# 286 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 2929 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_203 =
    fun f ->
      (
# 286 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 2937 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_204 =
    fun t ->
      (
# 397 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 2945 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_205 =
    fun t ->
      (
# 397 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 2953 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_206 =
    fun f ->
      (
# 376 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 2961 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_207 =
    fun f ->
      (
# 376 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 2969 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_208 =
    fun v ->
      (
# 301 "src/languages/tptp/v6.3.0/parser.mly"
    ( v )
# 2977 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_209 =
    fun v ->
      (
# 301 "src/languages/tptp/v6.3.0/parser.mly"
    ( v )
# 2985 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_210 =
    fun v ->
      (
# 294 "src/languages/tptp/v6.3.0/parser.mly"
    ( [ v ] )
# 2993 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t list))
  
  let _menhir_action_211 =
    fun l v ->
      (
# 296 "src/languages/tptp/v6.3.0/parser.mly"
    ( v :: l )
# 3001 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t list))
  
  let _menhir_action_212 =
    fun _endpos_u_ _startpos_t_ t u ->
      let _endpos = _endpos_u_ in
      let _startpos = _startpos_t_ in
      (
# 420 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.product ~loc t u )
# 3011 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_213 =
    fun _endpos_u_ _startpos_t_ t u ->
      let _endpos = _endpos_u_ in
      let _startpos = _startpos_t_ in
      (
# 420 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.product ~loc t u )
# 3021 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_214 =
    fun _endpos__2_ _endpos_g_ _startpos__2_ _startpos_f_ f g ->
      let _endpos = _endpos_g_ in
      let _startpos = _startpos_f_ in
      (
# 120 "src/languages/tptp/v6.3.0/parser.mly"
    ( let op = let loc = L.mk_pos _startpos__2_ _endpos__2_ in T.and_t ~loc () in
      let loc = L.mk_pos _startpos _endpos in T.apply ~loc op [f; g] )
# 3032 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_215 =
    fun _endpos__2_ _endpos_g_ _startpos__2_ _startpos_f_ f g ->
      let _endpos = _endpos_g_ in
      let _startpos = _startpos_f_ in
      (
# 120 "src/languages/tptp/v6.3.0/parser.mly"
    ( let op = let loc = L.mk_pos _startpos__2_ _endpos__2_ in T.and_t ~loc () in
      let loc = L.mk_pos _startpos _endpos in T.apply ~loc op [f; g] )
# 3043 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_216 =
    fun _endpos__10_ _startpos__1_ annot f r s ->
      let _endpos = _endpos__10_ in
      let _startpos = _startpos__1_ in
      (
# 52 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.thf ~loc ?annot s r f )
# 3053 "src/languages/tptp/v6.3.0/parser.ml"
       : (S.t))
  
  let _menhir_action_217 =
    fun _endpos_g_ _startpos_f_ f g ->
      let _endpos = _endpos_g_ in
      let _startpos = _startpos_f_ in
      (
# 126 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.apply ~loc f [g] )
# 3063 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_218 =
    fun _endpos_g_ _startpos_f_ f g ->
      let _endpos = _endpos_g_ in
      let _startpos = _startpos_f_ in
      (
# 126 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.apply ~loc f [g] )
# 3073 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_219 =
    fun t ->
      (
# 163 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 3081 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_220 =
    fun t ->
      (
# 163 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 3089 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_221 =
    fun f ->
      (
# 99 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 3097 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_222 =
    fun f ->
      (
# 99 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 3105 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_223 =
    fun f ->
      (
# 99 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 3113 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_224 =
    fun _endpos_g_ _startpos_f_ c f g ->
      let _endpos = _endpos_g_ in
      let _startpos = _startpos_f_ in
      (
# 103 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.apply ~loc c [f; g] )
# 3123 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_225 =
    fun f ->
      (
# 109 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 3131 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_226 =
    fun f ->
      (
# 109 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 3139 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_227 =
    fun f ->
      (
# 109 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 3147 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_228 =
    fun t ->
      (
# 204 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 3155 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_229 =
    fun t ->
      (
# 204 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 3163 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_230 =
    fun t ->
      (
# 204 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 3171 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_231 =
    fun _endpos__8_ _startpos__1_ cond if_else if_then ->
      let _endpos = _endpos__8_ in
      let _startpos = _startpos__1_ in
      (
# 168 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.ite ~loc cond if_then if_else )
# 3181 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_232 =
    fun t ->
      (
# 528 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 3189 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_233 =
    fun t ->
      (
# 528 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 3197 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_234 =
    fun t ->
      (
# 528 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 3205 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_235 =
    fun f ->
      (
# 86 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 3213 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_236 =
    fun f ->
      (
# 86 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 3221 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_237 =
    fun _endpos__6_ _startpos__1_ f l ->
      let _endpos = _endpos__6_ in
      let _startpos = _startpos__1_ in
      (
# 173 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.letin ~loc [l] f )
# 3231 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_238 =
    fun _endpos__6_ _startpos__1_ f l ->
      let _endpos = _endpos__6_ in
      let _startpos = _startpos__1_ in
      (
# 173 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.letin ~loc [l] f )
# 3241 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_239 =
    fun f ->
      (
# 179 "src/languages/tptp/v6.3.0/parser.mly"
                             ( f )
# 3249 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_240 =
    fun f ->
      (
# 176 "src/languages/tptp/v6.3.0/parser.mly"
                             ( f )
# 3257 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_241 =
    fun f ->
      (
# 93 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 3265 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_242 =
    fun f ->
      (
# 93 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 3273 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_243 =
    fun f ->
      (
# 93 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 3281 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_244 =
    fun f ->
      (
# 93 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 3289 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_245 =
    fun _endpos_ret_ _startpos_arg_ arg ret ->
      let _endpos = _endpos_ret_ in
      let _startpos = _startpos_arg_ in
      (
# 209 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.arrow ~loc arg ret )
# 3299 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_246 =
    fun _endpos_ret_ _startpos_arg_ arg ret ->
      let _endpos = _endpos_ret_ in
      let _startpos = _startpos_arg_ in
      (
# 209 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.arrow ~loc arg ret )
# 3309 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_247 =
    fun _endpos__2_ _endpos_g_ _startpos__2_ _startpos_f_ f g ->
      let _endpos = _endpos_g_ in
      let _startpos = _startpos_f_ in
      (
# 114 "src/languages/tptp/v6.3.0/parser.mly"
    ( let op = let loc = L.mk_pos _startpos__2_ _endpos__2_ in T.or_t ~loc () in
      let loc = L.mk_pos _startpos _endpos in T.apply ~loc op [f; g] )
# 3320 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_248 =
    fun _endpos__2_ _endpos_g_ _startpos__2_ _startpos_f_ f g ->
      let _endpos = _endpos_g_ in
      let _startpos = _startpos_f_ in
      (
# 114 "src/languages/tptp/v6.3.0/parser.mly"
    ( let op = let loc = L.mk_pos _startpos__2_ _endpos__2_ in T.or_t ~loc () in
      let loc = L.mk_pos _startpos _endpos in T.apply ~loc op [f; g] )
# 3331 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_249 =
    fun t ->
      (
# 555 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 3339 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_250 =
    fun t ->
      (
# 555 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 3347 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_251 =
    fun t ->
      (
# 555 "src/languages/tptp/v6.3.0/parser.mly"
    ( t )
# 3355 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_252 =
    fun _endpos_f_ _startpos_q_ f l q ->
      let _endpos = _endpos_f_ in
      let _startpos = _startpos_q_ in
      (
# 139 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = Some (L.mk_pos _startpos _endpos) in q ?loc l f )
# 3365 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_253 =
    fun q ->
      (
# 539 "src/languages/tptp/v6.3.0/parser.mly"
    ( q )
# 3373 "src/languages/tptp/v6.3.0/parser.ml"
       : (?loc:L.t -> T.t list -> T.t -> T.t))
  
  let _menhir_action_254 =
    fun () ->
      (
# 541 "src/languages/tptp/v6.3.0/parser.mly"
    ( T.lambda )
# 3381 "src/languages/tptp/v6.3.0/parser.ml"
       : (?loc:L.t -> T.t list -> T.t -> T.t))
  
  let _menhir_action_255 =
    fun () ->
      (
# 543 "src/languages/tptp/v6.3.0/parser.mly"
    ( T.forall )
# 3389 "src/languages/tptp/v6.3.0/parser.ml"
       : (?loc:L.t -> T.t list -> T.t -> T.t))
  
  let _menhir_action_256 =
    fun () ->
      (
# 545 "src/languages/tptp/v6.3.0/parser.mly"
    ( T.exists )
# 3397 "src/languages/tptp/v6.3.0/parser.ml"
       : (?loc:L.t -> T.t list -> T.t -> T.t))
  
  let _menhir_action_257 =
    fun () ->
      (
# 547 "src/languages/tptp/v6.3.0/parser.mly"
    ( T.description )
# 3405 "src/languages/tptp/v6.3.0/parser.ml"
       : (?loc:L.t -> T.t list -> T.t -> T.t))
  
  let _menhir_action_258 =
    fun () ->
      (
# 549 "src/languages/tptp/v6.3.0/parser.mly"
    ( T.choice )
# 3413 "src/languages/tptp/v6.3.0/parser.ml"
       : (?loc:L.t -> T.t list -> T.t -> T.t))
  
  let _menhir_action_259 =
    fun s ->
      (
# 223 "src/languages/tptp/v6.3.0/parser.mly"
    ( s )
# 3421 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_260 =
    fun _endpos_goal_ _startpos_hyp_ goal hyp ->
      let _endpos = _endpos_goal_ in
      let _startpos = _startpos_hyp_ in
      (
# 225 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.sequent ~loc hyp goal )
# 3431 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_261 =
    fun _endpos_u_ _startpos_t_ t u ->
      let _endpos = _endpos_u_ in
      let _startpos = _startpos_t_ in
      (
# 192 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.subtype ~loc t u )
# 3441 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_262 =
    fun f ->
      (
# 195 "src/languages/tptp/v6.3.0/parser.mly"
                        ( f )
# 3449 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_263 =
    fun () ->
      (
# 229 "src/languages/tptp/v6.3.0/parser.mly"
    ( [] )
# 3457 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t list))
  
  let _menhir_action_264 =
    fun l ->
      (
# 231 "src/languages/tptp/v6.3.0/parser.mly"
    ( l )
# 3465 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t list))
  
  let _menhir_action_265 =
    fun f ->
      (
# 235 "src/languages/tptp/v6.3.0/parser.mly"
    ( [ f ] )
# 3473 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t list))
  
  let _menhir_action_266 =
    fun f l ->
      (
# 237 "src/languages/tptp/v6.3.0/parser.mly"
    ( f :: l )
# 3481 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t list))
  
  let _menhir_action_267 =
    fun _endpos_ty_ _startpos_f_ f ty ->
      let _endpos = _endpos_ty_ in
      let _startpos = _startpos_f_ in
      (
# 183 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.colon ~loc f ty )
# 3491 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_268 =
    fun f ->
      (
# 188 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 3499 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_269 =
    fun f ->
      (
# 188 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 3507 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_270 =
    fun _endpos_ty_ _startpos_c_ c ty ->
      let _endpos = _endpos_ty_ in
      let _startpos = _startpos_c_ in
      (
# 154 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.colon ~loc c ty )
# 3517 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_271 =
    fun c ->
      (
# 559 "src/languages/tptp/v6.3.0/parser.mly"
    ( c )
# 3525 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_272 =
    fun _endpos__1_ _startpos__1_ ->
      let _endpos = _endpos__1_ in
      let _startpos = _startpos__1_ in
      (
# 563 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.pi_t ~loc () )
# 3535 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_273 =
    fun _endpos__1_ _startpos__1_ ->
      let _endpos = _endpos__1_ in
      let _startpos = _startpos__1_ in
      (
# 565 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.sigma_t ~loc () )
# 3545 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_274 =
    fun _endpos__4_ _startpos_c_ c f ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos_c_ in
      (
# 158 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.apply ~loc c [f] )
# 3555 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_275 =
    fun _endpos_right_ _startpos_left_ left right ->
      let _endpos = _endpos_right_ in
      let _startpos = _startpos_left_ in
      (
# 219 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.union ~loc left right )
# 3565 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_276 =
    fun _endpos_right_ _startpos_left_ left right ->
      let _endpos = _endpos_right_ in
      let _startpos = _startpos_left_ in
      (
# 219 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.union ~loc left right )
# 3575 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_277 =
    fun f ->
      (
# 135 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 3583 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_278 =
    fun f ->
      (
# 135 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 3591 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_279 =
    fun f ->
      (
# 135 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 3599 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_280 =
    fun f ->
      (
# 135 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 3607 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_281 =
    fun f ->
      (
# 135 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 3615 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_282 =
    fun f ->
      (
# 135 "src/languages/tptp/v6.3.0/parser.mly"
    ( f )
# 3623 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_283 =
    fun f ->
      (
# 198 "src/languages/tptp/v6.3.0/parser.mly"
                          ( f )
# 3631 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_284 =
    fun v ->
      (
# 150 "src/languages/tptp/v6.3.0/parser.mly"
    ( v )
# 3639 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_285 =
    fun v ->
      (
# 150 "src/languages/tptp/v6.3.0/parser.mly"
    ( v )
# 3647 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_286 =
    fun v ->
      (
# 143 "src/languages/tptp/v6.3.0/parser.mly"
   ( [ v ] )
# 3655 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t list))
  
  let _menhir_action_287 =
    fun l v ->
      (
# 145 "src/languages/tptp/v6.3.0/parser.mly"
   ( v :: l )
# 3663 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t list))
  
  let _menhir_action_288 =
    fun _endpos_right_ _startpos_left_ left right ->
      let _endpos = _endpos_right_ in
      let _startpos = _startpos_left_ in
      (
# 214 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.product ~loc left right )
# 3673 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_289 =
    fun _endpos_right_ _startpos_left_ left right ->
      let _endpos = _endpos_right_ in
      let _startpos = _startpos_left_ in
      (
# 214 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.product ~loc left right )
# 3683 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_290 =
    fun _endpos__10_ _startpos__1_ annot f r s ->
      let _endpos = _endpos__10_ in
      let _startpos = _startpos__1_ in
      (
# 47 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.tpi ~loc ?annot s r f )
# 3693 "src/languages/tptp/v6.3.0/parser.ml"
       : (S.t))
  
  let _menhir_action_291 =
    fun f ->
      (
# 75 "src/languages/tptp/v6.3.0/parser.mly"
                  ( f )
# 3701 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_292 =
    fun w ->
      (
# 676 "src/languages/tptp/v6.3.0/parser.mly"
    ( w )
# 3709 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_293 =
    fun _endpos__6_ _startpos__1_ f g ->
      let _endpos = _endpos__6_ in
      let _startpos = _startpos__1_ in
      (
# 761 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.include_ ~loc f g )
# 3719 "src/languages/tptp/v6.3.0/parser.ml"
       : (S.t))
  
  let _menhir_action_294 =
    fun i ->
      (
# 32 "src/languages/tptp/v6.3.0/parser.mly"
    ( i )
# 3727 "src/languages/tptp/v6.3.0/parser.ml"
       : (S.t))
  
  let _menhir_action_295 =
    fun i ->
      (
# 32 "src/languages/tptp/v6.3.0/parser.mly"
    ( i )
# 3735 "src/languages/tptp/v6.3.0/parser.ml"
       : (S.t))
  
  let _menhir_action_296 =
    fun c ->
      (
# 598 "src/languages/tptp/v6.3.0/parser.mly"
    ( c )
# 3743 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_297 =
    fun _endpos__1_ _startpos__1_ ->
      let _endpos = _endpos__1_ in
      let _startpos = _startpos__1_ in
      (
# 602 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.not_t ~loc () )
# 3753 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_action_298 =
    fun l ->
      (
# 754 "src/languages/tptp/v6.3.0/parser.mly"
    ( l )
# 3761 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t list))
  
  let _menhir_action_299 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 722 "src/languages/tptp/v6.3.0/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      T.var ~loc (I.mk I.term s) )
# 3772 "src/languages/tptp/v6.3.0/parser.ml"
       : (T.t))
  
  let _menhir_print_token : token -> string =
    fun _tok ->
      match _tok with
      | Tokens.AND ->
          "AND"
      | Tokens.APPLY ->
          "APPLY"
      | Tokens.ARROW ->
          "ARROW"
      | Tokens.CNF ->
          "CNF"
      | Tokens.COLON ->
          "COLON"
      | Tokens.COMMA ->
          "COMMA"
      | Tokens.DEFINITE_DESCRIPTION ->
          "DEFINITE_DESCRIPTION"
      | Tokens.DISTINCT_OBJECT _ ->
          "DISTINCT_OBJECT"
      | Tokens.DOLLAR_CNF ->
          "DOLLAR_CNF"
      | Tokens.DOLLAR_DOLLAR_WORD _ ->
          "DOLLAR_DOLLAR_WORD"
      | Tokens.DOLLAR_FOF ->
          "DOLLAR_FOF"
      | Tokens.DOLLAR_FOT ->
          "DOLLAR_FOT"
      | Tokens.DOLLAR_TFF ->
          "DOLLAR_TFF"
      | Tokens.DOLLAR_THF ->
          "DOLLAR_THF"
      | Tokens.DOLLAR_WORD _ ->
          "DOLLAR_WORD"
      | Tokens.DOT ->
          "DOT"
      | Tokens.EOF ->
          "EOF"
      | Tokens.EQUAL ->
          "EQUAL"
      | Tokens.EQUIV ->
          "EQUIV"
      | Tokens.EXISTS ->
          "EXISTS"
      | Tokens.EXISTS_TY ->
          "EXISTS_TY"
      | Tokens.FOF ->
          "FOF"
      | Tokens.FORALL ->
          "FORALL"
      | Tokens.FORALL_TY ->
          "FORALL_TY"
      | Tokens.GENTZEN_ARROW ->
          "GENTZEN_ARROW"
      | Tokens.IMPLY ->
          "IMPLY"
      | Tokens.INCLUDE ->
          "INCLUDE"
      | Tokens.INDEFINITE_DESCRIPTION ->
          "INDEFINITE_DESCRIPTION"
      | Tokens.INTEGER _ ->
          "INTEGER"
      | Tokens.ITE_F ->
          "ITE_F"
      | Tokens.ITE_T ->
          "ITE_T"
      | Tokens.LAMBDA ->
          "LAMBDA"
      | Tokens.LEFT_BRACKET ->
          "LEFT_BRACKET"
      | Tokens.LEFT_IMPLY ->
          "LEFT_IMPLY"
      | Tokens.LEFT_PAREN ->
          "LEFT_PAREN"
      | Tokens.LESS ->
          "LESS"
      | Tokens.LET_FF ->
          "LET_FF"
      | Tokens.LET_FT ->
          "LET_FT"
      | Tokens.LET_TF ->
          "LET_TF"
      | Tokens.LET_TT ->
          "LET_TT"
      | Tokens.LOWER_WORD _ ->
          "LOWER_WORD"
      | Tokens.NOT ->
          "NOT"
      | Tokens.NOTAND ->
          "NOTAND"
      | Tokens.NOTVLINE ->
          "NOTVLINE"
      | Tokens.NOT_EQUAL ->
          "NOT_EQUAL"
      | Tokens.PI ->
          "PI"
      | Tokens.PLUS ->
          "PLUS"
      | Tokens.RATIONAL _ ->
          "RATIONAL"
      | Tokens.REAL _ ->
          "REAL"
      | Tokens.RIGHT_BRACKET ->
          "RIGHT_BRACKET"
      | Tokens.RIGHT_PAREN ->
          "RIGHT_PAREN"
      | Tokens.SIGMA ->
          "SIGMA"
      | Tokens.SINGLE_QUOTED _ ->
          "SINGLE_QUOTED"
      | Tokens.STAR ->
          "STAR"
      | Tokens.TFF ->
          "TFF"
      | Tokens.THF ->
          "THF"
      | Tokens.TPI ->
          "TPI"
      | Tokens.UPPER_WORD _ ->
          "UPPER_WORD"
      | Tokens.VLINE ->
          "VLINE"
      | Tokens.XOR ->
          "XOR"
  
  let _menhir_fail : unit -> 'a =
    fun () ->
      Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
      assert false
  
  include struct
    
    [@@@ocaml.warning "-4-37"]
    
    let _menhir_goto_input : type  ttv_stack. ttv_stack -> _ -> _menhir_box_input =
      fun _menhir_stack _v ->
        MenhirBox_input _v
    
    let _menhir_run_621 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_input =
      fun _menhir_stack _v ->
        let i = _v in
        let _v = _menhir_action_110 i in
        _menhir_goto_input _menhir_stack _v
    
    let _menhir_run_560 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_file =
      fun _menhir_stack _v ->
        let l = _v in
        let _v = _menhir_action_049 l in
        MenhirBox_file _v
    
    let rec _menhir_run_556 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_tptp_input -> _ -> _menhir_box_file =
      fun _menhir_stack _v ->
        let MenhirCell1_tptp_input (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_116 x xs in
        _menhir_goto_list_tptp_input_ _menhir_stack _v _menhir_s
    
    and _menhir_goto_list_tptp_input_ : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _v _menhir_s ->
        match _menhir_s with
        | MenhirState000 ->
            _menhir_run_560 _menhir_stack _v
        | MenhirState551 ->
            _menhir_run_556 _menhir_stack _v
        | _ ->
            _menhir_fail ()
    
    let rec _menhir_run_001 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_TPI (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_PAREN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_LEFT_PAREN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState002 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 2)
        | _ ->
            _eRR 1
    
    and _menhir_run_003 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        let s = _v in
        let _v = _menhir_action_121 s in
        _menhir_goto_name _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_name : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState612 ->
            _menhir_run_613 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState601 ->
            _menhir_run_602 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState585 ->
            _menhir_run_586 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState575 ->
            _menhir_run_576 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState565 ->
            _menhir_run_566 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState542 ->
            _menhir_run_543 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState532 ->
            _menhir_run_533 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState526 ->
            _menhir_run_525 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState522 ->
            _menhir_run_525 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState508 ->
            _menhir_run_509 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState498 ->
            _menhir_run_499 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState002 ->
            _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_613 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_CNF _menhir_cell0_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_name (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState614 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.LOWER_WORD _v ->
                _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 614)
        | _ ->
            _eRR 613
    
    and _menhir_run_008 : type  ttv_stack ttv_result. ((ttv_stack _menhir_cell0_LEFT_PAREN, ttv_result) _menhir_cell1_name _menhir_cell0_COMMA as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        let s = _v in
        let _v = _menhir_action_088 s in
        _menhir_goto_formula_role _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_formula_role : type  ttv_stack ttv_result. ((ttv_stack _menhir_cell0_LEFT_PAREN, ttv_result) _menhir_cell1_name _menhir_cell0_COMMA as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState614 ->
            _menhir_run_615 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState603 ->
            _menhir_run_604 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState587 ->
            _menhir_run_588 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState577 ->
            _menhir_run_578 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState567 ->
            _menhir_run_568 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState544 ->
            _menhir_run_545 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState534 ->
            _menhir_run_535 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState510 ->
            _menhir_run_511 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState500 ->
            _menhir_run_501 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState007 ->
            _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_615 : type  ttv_stack. (((ttv_stack, _menhir_box_input) _menhir_cell1_CNF _menhir_cell0_LEFT_PAREN, _menhir_box_input) _menhir_cell1_name _menhir_cell0_COMMA as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_formula_role (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState616 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_456 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 616)
        | _ ->
            _eRR 615
    
    and _menhir_run_011 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_299 _endpos_s_ _startpos_s_ s in
        _menhir_goto_variable _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_s_ _startpos_s_ _v _menhir_s _tok
    
    and _menhir_goto_variable : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState299 ->
            _menhir_run_469 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState484 ->
            _menhir_run_469 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState479 ->
            _menhir_run_469 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState474 ->
            _menhir_run_469 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState300 ->
            _menhir_run_469 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState430 ->
            _menhir_run_316 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState315 ->
            _menhir_run_316 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState259 ->
            _menhir_run_258 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState257 ->
            _menhir_run_258 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState189 ->
            _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState190 ->
            _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState195 ->
            _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState207 ->
            _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState196 ->
            _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState203 ->
            _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState199 ->
            _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState197 ->
            _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState084 ->
            _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState080 ->
            _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState075 ->
            _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState192 ->
            _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState139 ->
            _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState101 ->
            _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState093 ->
            _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState073 ->
            _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState616 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState605 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState589 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState579 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState569 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState546 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState536 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState512 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState502 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState455 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState462 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState457 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState456 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState449 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState445 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState441 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState303 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState435 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState427 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState317 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState322 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState323 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState413 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState324 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState326 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState405 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState403 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState332 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState396 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState394 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState384 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState381 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState371 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState366 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState363 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState360 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState358 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState356 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState342 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState340 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState335 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState333 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState328 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState010 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState251 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState291 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState252 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState286 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState278 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState275 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState273 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState271 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState263 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState255 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState254 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState248 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState018 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState244 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState020 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState021 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState238 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState236 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState023 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState097 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState178 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState179 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState185 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState180 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState099 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState121 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState122 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState172 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState165 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState163 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState160 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState157 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState155 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState148 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState142 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState136 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState128 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState124 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState110 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState104 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState025 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState089 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState070 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState051 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState038 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState035 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState033 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState026 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_469 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_d_, _startpos_d_, d) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_096 d in
        _menhir_goto_general_data _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_d_ _startpos_d_ _v _menhir_s _tok
    
    and _menhir_goto_general_data : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.COLON ->
            let _menhir_stack = MenhirCell1_general_data (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState479 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LEFT_BRACKET ->
                _menhir_run_300 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_THF ->
                _menhir_run_302 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_TFF ->
                _menhir_run_440 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_FOT ->
                _menhir_run_444 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_FOF ->
                _menhir_run_448 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_CNF ->
                _menhir_run_454 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 479)
        | Tokens.COMMA | Tokens.RIGHT_BRACKET | Tokens.RIGHT_PAREN ->
            let (_endpos_d_, d) = (_endpos, _v) in
            let _v = _menhir_action_103 d in
            _menhir_goto_general_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_d_ _v _menhir_s _tok
        | _ ->
            _eRR 478
    
    and _menhir_run_012 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_019 _endpos_s_ _startpos_s_ s in
        _menhir_goto_atomic_word _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_s_ _startpos_s_ _v _menhir_s _tok
    
    and _menhir_goto_atomic_word : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState299 ->
            _menhir_run_483 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState300 ->
            _menhir_run_483 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState474 ->
            _menhir_run_483 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState484 ->
            _menhir_run_483 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState479 ->
            _menhir_run_483 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState189 ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState190 ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState195 ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState196 ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState207 ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState197 ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState203 ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState199 ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState080 ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState084 ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState075 ->
            _menhir_run_079 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState616 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState605 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState589 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState579 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState569 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState546 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState536 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState512 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState502 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState010 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState455 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState456 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState462 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState457 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState449 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState445 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState441 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState303 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState435 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState427 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState317 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState322 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState323 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState324 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState413 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState326 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState328 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState403 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState405 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState332 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState333 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState396 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState394 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState335 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState340 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState366 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState389 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState384 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState381 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState371 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState363 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState360 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState358 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState356 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState342 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState251 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState252 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState291 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState254 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState286 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState278 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState275 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState273 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState271 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState255 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState263 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState018 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState248 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState020 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState244 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState021 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState023 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState236 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState238 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState025 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState097 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState099 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState178 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState179 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState180 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState185 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState121 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState122 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState124 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState163 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState165 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState172 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState160 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState157 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState155 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState148 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState128 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState142 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState136 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState104 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState110 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState089 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState026 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState070 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState033 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState035 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState038 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState051 ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_483 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_PAREN ->
            let _menhir_stack = MenhirCell1_atomic_word (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_LEFT_PAREN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState484 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LEFT_BRACKET ->
                _menhir_run_300 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_THF ->
                _menhir_run_302 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_TFF ->
                _menhir_run_440 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_FOT ->
                _menhir_run_444 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_FOF ->
                _menhir_run_448 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_CNF ->
                _menhir_run_454 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 484)
        | Tokens.COLON | Tokens.COMMA | Tokens.RIGHT_BRACKET | Tokens.RIGHT_PAREN ->
            let (_endpos_d_, _startpos_d_, d) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_094 d in
            _menhir_goto_general_data _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_d_ _startpos_d_ _v _menhir_s _tok
        | _ ->
            _eRR 483
    
    and _menhir_run_013 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_n_, _startpos_n_, n) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_134 _endpos_n_ _startpos_n_ n in
        let (_endpos, _startpos) = (_endpos_n_, _startpos_n_) in
        let (_endpos_n_, _startpos_n_, n) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_127 n in
        _menhir_goto_number _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _menhir_s _tok
    
    and _menhir_goto_number : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState299 ->
            _menhir_run_470 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState484 ->
            _menhir_run_470 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState479 ->
            _menhir_run_470 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState474 ->
            _menhir_run_470 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState300 ->
            _menhir_run_470 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState616 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState605 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState589 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState579 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState569 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState546 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState536 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState512 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState502 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState010 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState455 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState462 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState456 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState457 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState449 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState445 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState441 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState303 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState435 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState427 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState317 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState322 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState323 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState324 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState413 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState326 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState328 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState403 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState405 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState332 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState333 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState396 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState394 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState335 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState340 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState366 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState384 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState381 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState371 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState363 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState360 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState358 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState356 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState342 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState251 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState291 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState252 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState286 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState278 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState275 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState273 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState271 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState254 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState263 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState255 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState018 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState248 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState020 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState244 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState021 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState023 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState236 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState238 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState025 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState097 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState099 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState178 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState179 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState180 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState185 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState121 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState122 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState124 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState163 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState165 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState172 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState160 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState157 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState155 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState148 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState142 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState128 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState136 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState104 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState110 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState089 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState026 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState070 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState033 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState035 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState051 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState038 ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_470 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_d_, _startpos_d_, d) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_097 d in
        _menhir_goto_general_data _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_d_ _startpos_d_ _v _menhir_s _tok
    
    and _menhir_run_043 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_031 a in
        _menhir_goto_defined_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _menhir_s _tok
    
    and _menhir_goto_defined_atom : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_043 t in
        _menhir_goto_defined_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _startpos_t_ _v _menhir_s _tok
    
    and _menhir_goto_defined_term : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_092 t in
        _menhir_goto_function_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _startpos_t_ _v _menhir_s _tok
    
    and _menhir_goto_function_term : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_142 t in
        _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _startpos_t_ _v _menhir_s _tok
    
    and _menhir_goto_term : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState445 ->
            _menhir_run_446 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState579 ->
            _menhir_run_350 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState502 ->
            _menhir_run_350 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState303 ->
            _menhir_run_350 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState435 ->
            _menhir_run_350 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState427 ->
            _menhir_run_350 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState317 ->
            _menhir_run_350 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState322 ->
            _menhir_run_350 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState323 ->
            _menhir_run_350 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState324 ->
            _menhir_run_350 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState413 ->
            _menhir_run_350 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState326 ->
            _menhir_run_350 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState328 ->
            _menhir_run_350 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState403 ->
            _menhir_run_350 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState405 ->
            _menhir_run_350 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState332 ->
            _menhir_run_350 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState333 ->
            _menhir_run_350 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState396 ->
            _menhir_run_350 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState394 ->
            _menhir_run_350 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState335 ->
            _menhir_run_350 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState340 ->
            _menhir_run_350 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState366 ->
            _menhir_run_350 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState384 ->
            _menhir_run_350 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState381 ->
            _menhir_run_350 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState371 ->
            _menhir_run_350 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState363 ->
            _menhir_run_350 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState360 ->
            _menhir_run_350 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState358 ->
            _menhir_run_350 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState356 ->
            _menhir_run_350 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState342 ->
            _menhir_run_350 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState248 ->
            _menhir_run_249 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState244 ->
            _menhir_run_245 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState238 ->
            _menhir_run_239 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState236 ->
            _menhir_run_237 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState136 ->
            _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState616 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState605 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState589 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState569 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState546 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState536 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState512 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState010 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState455 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState462 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState456 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState449 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState441 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState251 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState291 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState252 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState286 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState278 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState275 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState273 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState271 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState254 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState263 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState255 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState023 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState097 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState178 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState179 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState180 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState185 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState121 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState122 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState124 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState163 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState165 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState172 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState160 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState157 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState155 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState148 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState142 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState128 ->
            _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState110 ->
            _menhir_run_111 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState457 ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState020 ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState021 ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState099 ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState104 ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState070 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState018 ->
            _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState025 ->
            _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState089 ->
            _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState026 ->
            _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState051 ->
            _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState038 ->
            _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState035 ->
            _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState033 ->
            _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_446 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_DOLLAR_FOT _menhir_cell0_LEFT_PAREN -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_LEFT_PAREN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_DOLLAR_FOT (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__4_, f) = (_endpos_0, _v) in
            let _v = _menhir_action_087 f in
            _menhir_goto_formula_data _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__4_ _startpos__1_ _v _menhir_s _tok
        | _ ->
            _eRR 446
    
    and _menhir_goto_formula_data : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_d_, _startpos_d_, d) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_099 d in
        _menhir_goto_general_data _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_d_ _startpos_d_ _v _menhir_s _tok
    
    and _menhir_run_350 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_219 t in
        _menhir_goto_thf_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _startpos_t_ _v _menhir_s _tok
    
    and _menhir_goto_thf_atom : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState579 ->
            _menhir_run_379 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState502 ->
            _menhir_run_379 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState303 ->
            _menhir_run_379 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState435 ->
            _menhir_run_379 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState317 ->
            _menhir_run_379 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState322 ->
            _menhir_run_379 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState323 ->
            _menhir_run_379 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState324 ->
            _menhir_run_379 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState413 ->
            _menhir_run_379 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState326 ->
            _menhir_run_379 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState328 ->
            _menhir_run_379 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState403 ->
            _menhir_run_379 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState405 ->
            _menhir_run_379 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState333 ->
            _menhir_run_379 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState340 ->
            _menhir_run_379 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState366 ->
            _menhir_run_379 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState427 ->
            _menhir_run_349 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState332 ->
            _menhir_run_349 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState396 ->
            _menhir_run_349 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState394 ->
            _menhir_run_349 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState335 ->
            _menhir_run_349 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState384 ->
            _menhir_run_349 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState381 ->
            _menhir_run_349 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState371 ->
            _menhir_run_349 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState363 ->
            _menhir_run_349 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState360 ->
            _menhir_run_349 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState358 ->
            _menhir_run_349 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState356 ->
            _menhir_run_349 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState342 ->
            _menhir_run_349 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_379 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.COLON ->
            let (_startpos_f_, f) = (_startpos, _v) in
            let _v = _menhir_action_268 f in
            _menhir_goto_thf_typeable_formula _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_f_ _v _menhir_s
        | Tokens.AND | Tokens.APPLY | Tokens.ARROW | Tokens.COMMA | Tokens.EQUAL | Tokens.EQUIV | Tokens.IMPLY | Tokens.LEFT_IMPLY | Tokens.NOTAND | Tokens.NOTVLINE | Tokens.NOT_EQUAL | Tokens.PLUS | Tokens.RIGHT_BRACKET | Tokens.RIGHT_PAREN | Tokens.STAR | Tokens.VLINE | Tokens.XOR ->
            let (_endpos_f_, _startpos_f_, f) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_279 f in
            _menhir_goto_thf_unitary_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _startpos_f_ _v _menhir_s _tok
        | _ ->
            _eRR 379
    
    and _menhir_goto_thf_typeable_formula : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s ->
        let _menhir_stack = MenhirCell1_thf_typeable_formula (_menhir_stack, _menhir_s, _v, _startpos) in
        let _menhir_s = MenhirState366 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.VLINE ->
            _menhir_run_304 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.UPPER_WORD _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.SINGLE_QUOTED _v ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.SIGMA ->
            _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.REAL _v ->
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.RATIONAL _v ->
            _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.PI ->
            _menhir_run_306 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.NOT_EQUAL ->
            _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.NOTVLINE ->
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.NOTAND ->
            _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.NOT ->
            _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LET_TT ->
            _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET_TF ->
            _menhir_run_307 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET_FT ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET_FF ->
            _menhir_run_318 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFT_PAREN ->
            _menhir_run_326 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFT_IMPLY ->
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LAMBDA ->
            _menhir_run_309 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ITE_T ->
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ITE_F ->
            _menhir_run_327 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.INDEFINITE_DESCRIPTION ->
            _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.IMPLY ->
            _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FORALL_TY ->
            _menhir_run_311 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FORALL ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS_TY ->
            _menhir_run_312 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EQUIV ->
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EQUAL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DOLLAR_WORD _v ->
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DOLLAR_DOLLAR_WORD _v ->
            _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DISTINCT_OBJECT _v ->
            _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DEFINITE_DESCRIPTION ->
            _menhir_run_313 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.AND ->
            _menhir_run_329 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 366
    
    and _menhir_run_147 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_023 _endpos__1_ _startpos__1_ in
        _menhir_goto_binary_connective _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_goto_binary_connective : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState579 ->
            _menhir_run_354 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState502 ->
            _menhir_run_354 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState303 ->
            _menhir_run_354 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState435 ->
            _menhir_run_354 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState427 ->
            _menhir_run_354 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState317 ->
            _menhir_run_354 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState322 ->
            _menhir_run_354 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState323 ->
            _menhir_run_354 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState324 ->
            _menhir_run_354 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState413 ->
            _menhir_run_354 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState326 ->
            _menhir_run_354 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState328 ->
            _menhir_run_354 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState403 ->
            _menhir_run_354 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState405 ->
            _menhir_run_354 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState332 ->
            _menhir_run_354 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState333 ->
            _menhir_run_354 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState396 ->
            _menhir_run_354 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState394 ->
            _menhir_run_354 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState335 ->
            _menhir_run_354 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState340 ->
            _menhir_run_354 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState366 ->
            _menhir_run_354 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState384 ->
            _menhir_run_354 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState381 ->
            _menhir_run_354 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState371 ->
            _menhir_run_354 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState363 ->
            _menhir_run_354 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState341 ->
            _menhir_run_354 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState360 ->
            _menhir_run_354 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState358 ->
            _menhir_run_354 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState356 ->
            _menhir_run_354 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState342 ->
            _menhir_run_354 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState270 ->
            _menhir_run_275 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState146 ->
            _menhir_run_157 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_354 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_251 t in
        _menhir_goto_thf_pair_connective _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _startpos_t_ _v _menhir_s _tok
    
    and _menhir_goto_thf_pair_connective : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState341 ->
            _menhir_run_360 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState579 ->
            _menhir_run_345 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState502 ->
            _menhir_run_345 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState303 ->
            _menhir_run_345 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState435 ->
            _menhir_run_345 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState427 ->
            _menhir_run_345 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState317 ->
            _menhir_run_345 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState322 ->
            _menhir_run_345 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState323 ->
            _menhir_run_345 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState413 ->
            _menhir_run_345 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState324 ->
            _menhir_run_345 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState326 ->
            _menhir_run_345 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState405 ->
            _menhir_run_345 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState403 ->
            _menhir_run_345 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState328 ->
            _menhir_run_345 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState332 ->
            _menhir_run_345 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState333 ->
            _menhir_run_345 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState396 ->
            _menhir_run_345 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState394 ->
            _menhir_run_345 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState335 ->
            _menhir_run_345 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState340 ->
            _menhir_run_345 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState384 ->
            _menhir_run_345 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState381 ->
            _menhir_run_345 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState371 ->
            _menhir_run_345 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState366 ->
            _menhir_run_345 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState363 ->
            _menhir_run_345 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState360 ->
            _menhir_run_345 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState358 ->
            _menhir_run_345 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState356 ->
            _menhir_run_345 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState342 ->
            _menhir_run_345 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_360 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_thf_unitary_formula as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_thf_pair_connective (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState360
        | Tokens.VLINE ->
            _menhir_run_304 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState360
        | Tokens.UPPER_WORD _v_0 ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState360
        | Tokens.SINGLE_QUOTED _v_1 ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState360
        | Tokens.SIGMA ->
            _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState360
        | Tokens.REAL _v_2 ->
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState360
        | Tokens.RATIONAL _v_3 ->
            _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState360
        | Tokens.PI ->
            _menhir_run_306 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState360
        | Tokens.NOT_EQUAL ->
            _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState360
        | Tokens.NOTVLINE ->
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState360
        | Tokens.NOTAND ->
            _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState360
        | Tokens.NOT ->
            _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState360
        | Tokens.LOWER_WORD _v_4 ->
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState360
        | Tokens.LET_TT ->
            _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState360
        | Tokens.LET_TF ->
            _menhir_run_307 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState360
        | Tokens.LET_FT ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState360
        | Tokens.LET_FF ->
            _menhir_run_318 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState360
        | Tokens.LEFT_PAREN ->
            _menhir_run_333 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState360
        | Tokens.LEFT_IMPLY ->
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState360
        | Tokens.LAMBDA ->
            _menhir_run_309 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState360
        | Tokens.ITE_T ->
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState360
        | Tokens.ITE_F ->
            _menhir_run_327 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState360
        | Tokens.INTEGER _v_5 ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState360
        | Tokens.INDEFINITE_DESCRIPTION ->
            _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState360
        | Tokens.IMPLY ->
            _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState360
        | Tokens.FORALL_TY ->
            _menhir_run_311 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState360
        | Tokens.FORALL ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState360
        | Tokens.EXISTS_TY ->
            _menhir_run_312 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState360
        | Tokens.EXISTS ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState360
        | Tokens.EQUIV ->
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState360
        | Tokens.EQUAL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState360
        | Tokens.DOLLAR_WORD _v_6 ->
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v_6 MenhirState360
        | Tokens.DOLLAR_DOLLAR_WORD _v_7 ->
            _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v_7 MenhirState360
        | Tokens.DISTINCT_OBJECT _v_8 ->
            _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v_8 MenhirState360
        | Tokens.DEFINITE_DESCRIPTION ->
            _menhir_run_313 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState360
        | Tokens.AND ->
            _menhir_run_329 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState360
        | _ ->
            _eRR 360
    
    and _menhir_run_304 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_011 _endpos__1_ _startpos__1_ in
        _menhir_goto_assoc_connective _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_goto_assoc_connective : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_233 t in
        _menhir_goto_thf_conn_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _startpos_t_ _v _menhir_s _tok
    
    and _menhir_goto_thf_conn_term : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_220 t in
        _menhir_goto_thf_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _startpos_t_ _v _menhir_s _tok
    
    and _menhir_run_305 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_273 _endpos__1_ _startpos__1_ in
        _menhir_goto_thf_unary_connective _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_goto_thf_unary_connective : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_PAREN ->
            let _menhir_stack = MenhirCell1_thf_unary_connective (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_LEFT_PAREN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState340 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.XOR ->
                _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.VLINE ->
                _menhir_run_304 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SIGMA ->
                _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.PI ->
                _menhir_run_306 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT_EQUAL ->
                _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTVLINE ->
                _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTAND ->
                _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_TF ->
                _menhir_run_307 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FF ->
                _menhir_run_318 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_326 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_IMPLY ->
                _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LAMBDA ->
                _menhir_run_309 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_F ->
                _menhir_run_327 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INDEFINITE_DESCRIPTION ->
                _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.IMPLY ->
                _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL_TY ->
                _menhir_run_311 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS_TY ->
                _menhir_run_312 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUIV ->
                _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUAL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DEFINITE_DESCRIPTION ->
                _menhir_run_313 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.AND ->
                _menhir_run_329 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 340)
        | Tokens.AND | Tokens.APPLY | Tokens.ARROW | Tokens.COLON | Tokens.COMMA | Tokens.EQUAL | Tokens.EQUIV | Tokens.IMPLY | Tokens.LEFT_IMPLY | Tokens.NOTAND | Tokens.NOTVLINE | Tokens.NOT_EQUAL | Tokens.PLUS | Tokens.RIGHT_BRACKET | Tokens.RIGHT_PAREN | Tokens.STAR | Tokens.VLINE | Tokens.XOR ->
            let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_234 t in
            _menhir_goto_thf_conn_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _startpos_t_ _v _menhir_s _tok
        | _ ->
            _eRR 339
    
    and _menhir_run_014 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_n_, _startpos_n_, n) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_133 _endpos_n_ _startpos_n_ n in
        let (_endpos, _startpos) = (_endpos_n_, _startpos_n_) in
        let (_endpos_n_, _startpos_n_, n) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_126 n in
        _menhir_goto_number _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _menhir_s _tok
    
    and _menhir_run_306 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_272 _endpos__1_ _startpos__1_ in
        _menhir_goto_thf_unary_connective _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_135 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_109 _endpos__1_ _startpos__1_ in
        _menhir_goto_infix_inequality _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_goto_infix_inequality : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState579 ->
            _menhir_run_351 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState502 ->
            _menhir_run_351 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState303 ->
            _menhir_run_351 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState435 ->
            _menhir_run_351 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState427 ->
            _menhir_run_351 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState317 ->
            _menhir_run_351 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState322 ->
            _menhir_run_351 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState323 ->
            _menhir_run_351 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState324 ->
            _menhir_run_351 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState413 ->
            _menhir_run_351 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState326 ->
            _menhir_run_351 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState328 ->
            _menhir_run_351 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState403 ->
            _menhir_run_351 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState405 ->
            _menhir_run_351 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState332 ->
            _menhir_run_351 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState333 ->
            _menhir_run_351 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState396 ->
            _menhir_run_351 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState394 ->
            _menhir_run_351 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState335 ->
            _menhir_run_351 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState340 ->
            _menhir_run_351 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState366 ->
            _menhir_run_351 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState384 ->
            _menhir_run_351 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState381 ->
            _menhir_run_351 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState371 ->
            _menhir_run_351 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState363 ->
            _menhir_run_351 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState341 ->
            _menhir_run_351 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState360 ->
            _menhir_run_351 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState358 ->
            _menhir_run_351 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState356 ->
            _menhir_run_351 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState342 ->
            _menhir_run_351 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState134 ->
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_351 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_250 t in
        _menhir_goto_thf_pair_connective _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _startpos_t_ _v _menhir_s _tok
    
    and _menhir_run_136 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_term as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_infix_inequality (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v_0 ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState136
        | Tokens.SINGLE_QUOTED _v_1 ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState136
        | Tokens.REAL _v_2 ->
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState136
        | Tokens.RATIONAL _v_3 ->
            _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState136
        | Tokens.LOWER_WORD _v_4 ->
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState136
        | Tokens.LET_TT ->
            _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState136
        | Tokens.LET_FT ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState136
        | Tokens.ITE_T ->
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState136
        | Tokens.INTEGER _v_5 ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState136
        | Tokens.DOLLAR_WORD _v_6 ->
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v_6 MenhirState136
        | Tokens.DOLLAR_DOLLAR_WORD _v_7 ->
            _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v_7 MenhirState136
        | Tokens.DISTINCT_OBJECT _v_8 ->
            _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v_8 MenhirState136
        | _ ->
            _eRR 136
    
    and _menhir_run_016 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_018 _endpos_s_ _startpos_s_ s in
        _menhir_goto_atomic_word _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_s_ _startpos_s_ _v _menhir_s _tok
    
    and _menhir_run_017 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_LET_TT (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_PAREN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_LEFT_PAREN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState018 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 18)
        | _ ->
            _eRR 17
    
    and _menhir_run_019 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_LET_FT (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_PAREN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_LEFT_PAREN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState020 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 20)
        | _ ->
            _eRR 19
    
    and _menhir_run_021 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState021 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.SINGLE_QUOTED _v ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.REAL _v ->
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.RATIONAL _v ->
            _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LET_TT ->
            _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET_FT ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFT_PAREN ->
            _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ITE_T ->
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DOLLAR_WORD _v ->
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DOLLAR_DOLLAR_WORD _v ->
            _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DISTINCT_OBJECT _v ->
            _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 21
    
    and _menhir_run_022 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_ITE_T (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_PAREN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_LEFT_PAREN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState023 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_TF ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FF ->
                _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_F ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 23)
        | _ ->
            _eRR 22
    
    and _menhir_run_015 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_297 _endpos__1_ _startpos__1_ in
        _menhir_goto_unary_negation _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_goto_unary_negation : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState616 ->
            _menhir_run_457 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState546 ->
            _menhir_run_457 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState455 ->
            _menhir_run_457 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState462 ->
            _menhir_run_457 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState456 ->
            _menhir_run_457 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState605 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState589 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState579 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState569 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState536 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState512 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState502 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState449 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState441 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState303 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState435 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState427 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState317 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState322 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState323 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState413 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState324 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState326 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState405 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState403 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState332 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState396 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState394 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState384 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState381 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState371 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState366 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState363 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState360 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState358 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState356 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState342 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState340 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState335 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState333 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState328 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState010 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState251 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState291 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState252 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState286 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState278 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState275 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState273 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState271 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState263 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState255 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState254 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState023 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState097 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState178 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState179 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState185 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState180 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState121 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState122 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState172 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState165 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState163 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState160 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState157 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState155 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState148 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState142 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState128 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState124 ->
            _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_457 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_unary_negation (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v_0 ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState457
        | Tokens.SINGLE_QUOTED _v_1 ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState457
        | Tokens.REAL _v_2 ->
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState457
        | Tokens.RATIONAL _v_3 ->
            _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState457
        | Tokens.LOWER_WORD _v_4 ->
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState457
        | Tokens.LET_TT ->
            _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState457
        | Tokens.LET_FT ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState457
        | Tokens.ITE_T ->
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState457
        | Tokens.INTEGER _v_5 ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState457
        | Tokens.DOLLAR_WORD _v_6 ->
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v_6 MenhirState457
        | Tokens.DOLLAR_DOLLAR_WORD _v_7 ->
            _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v_7 MenhirState457
        | Tokens.DISTINCT_OBJECT _v_8 ->
            _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v_8 MenhirState457
        | _ ->
            _eRR 457
    
    and _menhir_run_027 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_n_, _startpos_n_, n) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_112 _endpos_n_ _startpos_n_ n in
        let (_endpos, _startpos) = (_endpos_n_, _startpos_n_) in
        let (_endpos_n_, _startpos_n_, n) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_125 n in
        _menhir_goto_number _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_n_ _startpos_n_ _v _menhir_s _tok
    
    and _menhir_run_028 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_013 _endpos_s_ _startpos_s_ s in
        _menhir_goto_atomic_defined_word _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_s_ _startpos_s_ _v _menhir_s _tok
    
    and _menhir_goto_atomic_defined_word : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState189 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState190 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState195 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState196 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState207 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState197 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState203 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState199 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState075 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState080 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState084 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState616 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState605 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState589 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState579 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState569 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState546 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState536 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState512 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState502 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState010 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState455 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState456 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState462 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState457 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState449 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState445 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState441 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState303 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState435 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState427 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState317 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState322 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState323 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState324 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState413 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState326 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState328 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState403 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState405 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState332 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState333 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState396 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState394 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState335 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState340 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState366 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState384 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState381 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState371 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState363 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState360 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState358 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState356 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState342 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState251 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState252 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState291 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState254 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState286 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState278 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState275 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState273 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState271 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState255 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState263 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState018 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState248 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState020 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState244 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState021 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState023 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState236 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState238 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState025 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState097 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState099 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState178 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState179 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState180 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState185 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState104 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState121 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState122 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState124 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState163 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState165 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState172 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState160 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState157 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState155 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState148 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState128 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState142 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState136 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState110 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState089 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState026 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState070 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState033 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState035 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState038 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState051 ->
            _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_086 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_045 t in
        let (_endpos, _startpos) = (_endpos_t_, _startpos_t_) in
        let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_150 t in
        _menhir_goto_tff_atomic_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _startpos_t_ _v _menhir_s _tok
    
    and _menhir_goto_tff_atomic_type : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState189 ->
            _menhir_run_218 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState190 ->
            _menhir_run_218 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState195 ->
            _menhir_run_212 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState207 ->
            _menhir_run_208 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState196 ->
            _menhir_run_205 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState197 ->
            _menhir_run_205 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState203 ->
            _menhir_run_204 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState199 ->
            _menhir_run_200 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState084 ->
            _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState080 ->
            _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState075 ->
            _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_218 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA | Tokens.RIGHT_PAREN ->
            let (_endpos_t_, t) = (_endpos, _v) in
            let _v = _menhir_action_183 t in
            _menhir_goto_tff_top_level_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _v _menhir_s _tok
        | Tokens.ARROW | Tokens.STAR ->
            let (_startpos_t_, t) = (_startpos, _v) in
            let _v = _menhir_action_204 t in
            _menhir_goto_tff_unitary_type _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_t_ _v _menhir_s _tok
        | _ ->
            _eRR 218
    
    and _menhir_goto_tff_top_level_type : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState189 ->
            _menhir_run_219 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState190 ->
            _menhir_run_214 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_219 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_tff_untyped_atom -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_tff_untyped_atom (_menhir_stack, _menhir_s, t, _startpos_t_) = _menhir_stack in
        let (_endpos_ty_, ty) = (_endpos, _v) in
        let _v = _menhir_action_193 _endpos_ty_ _startpos_t_ t ty in
        _menhir_goto_tff_typed_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_tff_typed_atom : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState589 ->
            _menhir_run_228 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState512 ->
            _menhir_run_228 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState441 ->
            _menhir_run_228 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState097 ->
            _menhir_run_228 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState178 ->
            _menhir_run_228 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState179 ->
            _menhir_run_220 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_228 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let f = _v in
        let _v = _menhir_action_160 f in
        _menhir_goto_tff_formula _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_tff_formula : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState589 ->
            _menhir_run_590 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState512 ->
            _menhir_run_513 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState441 ->
            _menhir_run_442 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState097 ->
            _menhir_run_233 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState178 ->
            _menhir_run_231 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_590 : type  ttv_stack. ((((ttv_stack, _menhir_box_input) _menhir_cell1_TFF _menhir_cell0_LEFT_PAREN, _menhir_box_input) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_input) _menhir_cell1_formula_role _menhir_cell0_COMMA as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_tff_formula (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            _menhir_run_299 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState590
        | Tokens.RIGHT_PAREN ->
            let _v_0 = _menhir_action_008 () in
            _menhir_run_591 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
        | _ ->
            _eRR 590
    
    and _menhir_run_299 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_COMMA (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState299 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.SINGLE_QUOTED _v ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.REAL _v ->
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.RATIONAL _v ->
            _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LEFT_BRACKET ->
            _menhir_run_300 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DOLLAR_THF ->
            _menhir_run_302 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DOLLAR_TFF ->
            _menhir_run_440 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DOLLAR_FOT ->
            _menhir_run_444 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DOLLAR_FOF ->
            _menhir_run_448 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DOLLAR_CNF ->
            _menhir_run_454 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DISTINCT_OBJECT _v ->
            _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 299
    
    and _menhir_run_300 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState300
        | Tokens.SINGLE_QUOTED _v ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState300
        | Tokens.RIGHT_BRACKET ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let (_startpos__1_, _endpos__2_) = (_startpos, _endpos) in
            let _v = _menhir_action_101 () in
            _menhir_goto_general_list _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__2_ _startpos__1_ _v _menhir_s _tok
        | Tokens.REAL _v ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState300
        | Tokens.RATIONAL _v ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState300
        | Tokens.LOWER_WORD _v ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState300
        | Tokens.LEFT_BRACKET ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_300 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState300
        | Tokens.INTEGER _v ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState300
        | Tokens.DOLLAR_THF ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_302 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState300
        | Tokens.DOLLAR_TFF ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_440 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState300
        | Tokens.DOLLAR_FOT ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_444 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState300
        | Tokens.DOLLAR_FOF ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_448 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState300
        | Tokens.DOLLAR_CNF ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_454 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState300
        | Tokens.DISTINCT_OBJECT _v ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState300
        | _ ->
            _eRR 300
    
    and _menhir_goto_general_list : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState488 ->
            _menhir_run_490 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState299 ->
            _menhir_run_476 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState300 ->
            _menhir_run_476 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState484 ->
            _menhir_run_476 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState479 ->
            _menhir_run_476 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState474 ->
            _menhir_run_476 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_490 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_COMMA, ttv_result) _menhir_cell1_source _menhir_cell0_COMMA -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let (_endpos_l_, l) = (_endpos, _v) in
        let _v = _menhir_action_298 l in
        let _endpos = _endpos_l_ in
        let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
        let (_endpos_i_, i) = (_endpos, _v) in
        let _v = _menhir_action_128 i in
        _menhir_goto_optional_info _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_i_ _v _tok
    
    and _menhir_goto_optional_info : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_COMMA, ttv_result) _menhir_cell1_source -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_source (_menhir_stack, _, s) = _menhir_stack in
        let MenhirCell1_COMMA (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos_i_, i) = (_endpos, _v) in
        let _v = _menhir_action_007 _endpos_i_ _startpos__1_ i s in
        _menhir_goto_annotations _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_annotations : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState617 ->
            _menhir_run_618 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState606 ->
            _menhir_run_607 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState590 ->
            _menhir_run_591 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState580 ->
            _menhir_run_581 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState570 ->
            _menhir_run_571 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState547 ->
            _menhir_run_548 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState537 ->
            _menhir_run_538 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState513 ->
            _menhir_run_514 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState503 ->
            _menhir_run_504 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState298 ->
            _menhir_run_493 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_618 : type  ttv_stack. ((((ttv_stack, _menhir_box_input) _menhir_cell1_CNF _menhir_cell0_LEFT_PAREN, _menhir_box_input) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_input) _menhir_cell1_formula_role _menhir_cell0_COMMA, _menhir_box_input) _menhir_cell1_cnf_formula -> _ -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.DOT ->
                let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
                let MenhirCell1_cnf_formula (_menhir_stack, _, f) = _menhir_stack in
                let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_formula_role (_menhir_stack, _, r) = _menhir_stack in
                let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_name (_menhir_stack, _, s) = _menhir_stack in
                let MenhirCell0_LEFT_PAREN (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_CNF (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
                let (_endpos__10_, annot) = (_endpos_0, _v) in
                let _v = _menhir_action_026 _endpos__10_ _startpos__1_ annot f r s in
                _menhir_goto_cnf_annotated _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
            | _ ->
                _eRR 619)
        | _ ->
            _eRR 618
    
    and _menhir_goto_cnf_annotated : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState563 ->
            _menhir_run_628 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState000 ->
            _menhir_run_558 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState551 ->
            _menhir_run_558 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_628 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let f = _v in
        let _v = _menhir_action_005 f in
        _menhir_goto_annotated_formula _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_annotated_formula : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState563 ->
            _menhir_run_629 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState000 ->
            _menhir_run_559 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState551 ->
            _menhir_run_559 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_629 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let i = _v in
        let _v = _menhir_action_294 i in
        _menhir_goto_tptp_input _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_tptp_input : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState563 ->
            _menhir_run_621 _menhir_stack _v
        | MenhirState551 ->
            _menhir_run_551 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState000 ->
            _menhir_run_551 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_551 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_tptp_input (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.TPI ->
            _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState551
        | Tokens.THF ->
            _menhir_run_497 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState551
        | Tokens.TFF ->
            _menhir_run_507 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState551
        | Tokens.INCLUDE ->
            _menhir_run_517 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState551
        | Tokens.FOF ->
            _menhir_run_531 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState551
        | Tokens.CNF ->
            _menhir_run_541 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState551
        | Tokens.EOF ->
            let _v_0 = _menhir_action_115 () in
            _menhir_run_556 _menhir_stack _v_0
        | _ ->
            _eRR 551
    
    and _menhir_run_497 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_THF (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_PAREN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_LEFT_PAREN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState498 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 498)
        | _ ->
            _eRR 497
    
    and _menhir_run_004 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        let s = _v in
        let _v = _menhir_action_120 s in
        _menhir_goto_name _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_005 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        let s = _v in
        let _v = _menhir_action_122 s in
        _menhir_goto_name _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_507 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_TFF (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_PAREN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_LEFT_PAREN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState508 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 508)
        | _ ->
            _eRR 507
    
    and _menhir_run_517 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_INCLUDE (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_PAREN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_LEFT_PAREN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState518 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_519 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 518)
        | _ ->
            _eRR 517
    
    and _menhir_run_519 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_INCLUDE _menhir_cell0_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        let s = _v in
        let _v = _menhir_action_050 s in
        _menhir_goto_file_name _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_file_name : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_INCLUDE _menhir_cell0_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState595 ->
            _menhir_run_596 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState518 ->
            _menhir_run_520 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_596 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_INCLUDE _menhir_cell0_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_file_name (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            _menhir_run_521 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState596
        | Tokens.RIGHT_PAREN ->
            let _v_0 = _menhir_action_090 () in
            _menhir_run_597 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
        | _ ->
            _eRR 596
    
    and _menhir_run_521 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_INCLUDE _menhir_cell0_LEFT_PAREN, ttv_result) _menhir_cell1_file_name as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_COMMA (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_BRACKET ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_LEFT_BRACKET (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState522 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 522)
        | _ ->
            _eRR 521
    
    and _menhir_run_597 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_INCLUDE _menhir_cell0_LEFT_PAREN, _menhir_box_input) _menhir_cell1_file_name -> _ -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.DOT ->
                let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
                let MenhirCell1_file_name (_menhir_stack, _, f) = _menhir_stack in
                let MenhirCell0_LEFT_PAREN (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_INCLUDE (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
                let (_endpos__6_, g) = (_endpos_0, _v) in
                let _v = _menhir_action_293 _endpos__6_ _startpos__1_ f g in
                _menhir_goto_tptp_include _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
            | _ ->
                _eRR 598)
        | _ ->
            _eRR 597
    
    and _menhir_goto_tptp_include : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState563 ->
            _menhir_run_622 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState000 ->
            _menhir_run_552 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState551 ->
            _menhir_run_552 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_622 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let i = _v in
        let _v = _menhir_action_295 i in
        _menhir_goto_tptp_input _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_552 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let i = _v in
        let _v = _menhir_action_295 i in
        _menhir_goto_tptp_input _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_520 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_INCLUDE _menhir_cell0_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_file_name (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            _menhir_run_521 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState520
        | Tokens.RIGHT_PAREN ->
            let _v_0 = _menhir_action_090 () in
            _menhir_run_528 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
        | _ ->
            _eRR 520
    
    and _menhir_run_528 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_INCLUDE _menhir_cell0_LEFT_PAREN, _menhir_box_file) _menhir_cell1_file_name -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.DOT ->
                let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
                let _tok = _menhir_lexer _menhir_lexbuf in
                let MenhirCell1_file_name (_menhir_stack, _, f) = _menhir_stack in
                let MenhirCell0_LEFT_PAREN (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_INCLUDE (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
                let (_endpos__6_, g) = (_endpos_0, _v) in
                let _v = _menhir_action_293 _endpos__6_ _startpos__1_ f g in
                _menhir_goto_tptp_include _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
            | _ ->
                _eRR 529)
        | _ ->
            _eRR 528
    
    and _menhir_run_531 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_FOF (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_PAREN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_LEFT_PAREN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState532 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 532)
        | _ ->
            _eRR 531
    
    and _menhir_run_541 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_CNF (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_PAREN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_LEFT_PAREN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState542 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 542)
        | _ ->
            _eRR 541
    
    and _menhir_run_559 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let i = _v in
        let _v = _menhir_action_294 i in
        _menhir_goto_tptp_input _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_558 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let f = _v in
        let _v = _menhir_action_005 f in
        _menhir_goto_annotated_formula _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_607 : type  ttv_stack. ((((ttv_stack, _menhir_box_input) _menhir_cell1_FOF _menhir_cell0_LEFT_PAREN, _menhir_box_input) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_input) _menhir_cell1_formula_role _menhir_cell0_COMMA, _menhir_box_input) _menhir_cell1_fof_formula -> _ -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.DOT ->
                let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
                let MenhirCell1_fof_formula (_menhir_stack, _, f) = _menhir_stack in
                let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_formula_role (_menhir_stack, _, r) = _menhir_stack in
                let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_name (_menhir_stack, _, s) = _menhir_stack in
                let MenhirCell0_LEFT_PAREN (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_FOF (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
                let (_endpos__10_, annot) = (_endpos_0, _v) in
                let _v = _menhir_action_053 _endpos__10_ _startpos__1_ annot f r s in
                _menhir_goto_fof_annotated _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
            | _ ->
                _eRR 608)
        | _ ->
            _eRR 607
    
    and _menhir_goto_fof_annotated : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState563 ->
            _menhir_run_627 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState000 ->
            _menhir_run_557 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState551 ->
            _menhir_run_557 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_627 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let f = _v in
        let _v = _menhir_action_004 f in
        _menhir_goto_annotated_formula _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_557 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let f = _v in
        let _v = _menhir_action_004 f in
        _menhir_goto_annotated_formula _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_591 : type  ttv_stack. ((((ttv_stack, _menhir_box_input) _menhir_cell1_TFF _menhir_cell0_LEFT_PAREN, _menhir_box_input) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_input) _menhir_cell1_formula_role _menhir_cell0_COMMA, _menhir_box_input) _menhir_cell1_tff_formula -> _ -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.DOT ->
                let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
                let MenhirCell1_tff_formula (_menhir_stack, _, f) = _menhir_stack in
                let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_formula_role (_menhir_stack, _, r) = _menhir_stack in
                let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_name (_menhir_stack, _, s) = _menhir_stack in
                let MenhirCell0_LEFT_PAREN (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_TFF (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
                let (_endpos__10_, annot) = (_endpos_0, _v) in
                let _v = _menhir_action_148 _endpos__10_ _startpos__1_ annot f r s in
                _menhir_goto_tff_annotated _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
            | _ ->
                _eRR 592)
        | _ ->
            _eRR 591
    
    and _menhir_goto_tff_annotated : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState563 ->
            _menhir_run_625 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState000 ->
            _menhir_run_555 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState551 ->
            _menhir_run_555 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_625 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let f = _v in
        let _v = _menhir_action_003 f in
        _menhir_goto_annotated_formula _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_555 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let f = _v in
        let _v = _menhir_action_003 f in
        _menhir_goto_annotated_formula _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_581 : type  ttv_stack. ((((ttv_stack, _menhir_box_input) _menhir_cell1_THF _menhir_cell0_LEFT_PAREN, _menhir_box_input) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_input) _menhir_cell1_formula_role _menhir_cell0_COMMA, _menhir_box_input) _menhir_cell1_thf_formula -> _ -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.DOT ->
                let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
                let MenhirCell1_thf_formula (_menhir_stack, _, f) = _menhir_stack in
                let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_formula_role (_menhir_stack, _, r) = _menhir_stack in
                let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_name (_menhir_stack, _, s) = _menhir_stack in
                let MenhirCell0_LEFT_PAREN (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_THF (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
                let (_endpos__10_, annot) = (_endpos_0, _v) in
                let _v = _menhir_action_216 _endpos__10_ _startpos__1_ annot f r s in
                _menhir_goto_thf_annotated _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
            | _ ->
                _eRR 582)
        | _ ->
            _eRR 581
    
    and _menhir_goto_thf_annotated : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState563 ->
            _menhir_run_624 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState000 ->
            _menhir_run_554 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState551 ->
            _menhir_run_554 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_624 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let f = _v in
        let _v = _menhir_action_002 f in
        _menhir_goto_annotated_formula _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_554 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let f = _v in
        let _v = _menhir_action_002 f in
        _menhir_goto_annotated_formula _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_571 : type  ttv_stack. ((((ttv_stack, _menhir_box_input) _menhir_cell1_TPI _menhir_cell0_LEFT_PAREN, _menhir_box_input) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_input) _menhir_cell1_formula_role _menhir_cell0_COMMA, _menhir_box_input) _menhir_cell1_tpi_formula -> _ -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.DOT ->
                let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
                let MenhirCell1_tpi_formula (_menhir_stack, _, f) = _menhir_stack in
                let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_formula_role (_menhir_stack, _, r) = _menhir_stack in
                let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_name (_menhir_stack, _, s) = _menhir_stack in
                let MenhirCell0_LEFT_PAREN (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_TPI (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
                let (_endpos__10_, annot) = (_endpos_0, _v) in
                let _v = _menhir_action_290 _endpos__10_ _startpos__1_ annot f r s in
                _menhir_goto_tpi_annotated _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
            | _ ->
                _eRR 572)
        | _ ->
            _eRR 571
    
    and _menhir_goto_tpi_annotated : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState563 ->
            _menhir_run_623 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState000 ->
            _menhir_run_553 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState551 ->
            _menhir_run_553 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_623 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let f = _v in
        let _v = _menhir_action_006 f in
        _menhir_goto_annotated_formula _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_553 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let f = _v in
        let _v = _menhir_action_006 f in
        _menhir_goto_annotated_formula _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_548 : type  ttv_stack. ((((ttv_stack, _menhir_box_file) _menhir_cell1_CNF _menhir_cell0_LEFT_PAREN, _menhir_box_file) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_file) _menhir_cell1_formula_role _menhir_cell0_COMMA, _menhir_box_file) _menhir_cell1_cnf_formula -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.DOT ->
                let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
                let _tok = _menhir_lexer _menhir_lexbuf in
                let MenhirCell1_cnf_formula (_menhir_stack, _, f) = _menhir_stack in
                let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_formula_role (_menhir_stack, _, r) = _menhir_stack in
                let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_name (_menhir_stack, _, s) = _menhir_stack in
                let MenhirCell0_LEFT_PAREN (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_CNF (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
                let (_endpos__10_, annot) = (_endpos_0, _v) in
                let _v = _menhir_action_026 _endpos__10_ _startpos__1_ annot f r s in
                _menhir_goto_cnf_annotated _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
            | _ ->
                _eRR 549)
        | _ ->
            _eRR 548
    
    and _menhir_run_538 : type  ttv_stack. ((((ttv_stack, _menhir_box_file) _menhir_cell1_FOF _menhir_cell0_LEFT_PAREN, _menhir_box_file) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_file) _menhir_cell1_formula_role _menhir_cell0_COMMA, _menhir_box_file) _menhir_cell1_fof_formula -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.DOT ->
                let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
                let _tok = _menhir_lexer _menhir_lexbuf in
                let MenhirCell1_fof_formula (_menhir_stack, _, f) = _menhir_stack in
                let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_formula_role (_menhir_stack, _, r) = _menhir_stack in
                let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_name (_menhir_stack, _, s) = _menhir_stack in
                let MenhirCell0_LEFT_PAREN (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_FOF (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
                let (_endpos__10_, annot) = (_endpos_0, _v) in
                let _v = _menhir_action_053 _endpos__10_ _startpos__1_ annot f r s in
                _menhir_goto_fof_annotated _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
            | _ ->
                _eRR 539)
        | _ ->
            _eRR 538
    
    and _menhir_run_514 : type  ttv_stack. ((((ttv_stack, _menhir_box_file) _menhir_cell1_TFF _menhir_cell0_LEFT_PAREN, _menhir_box_file) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_file) _menhir_cell1_formula_role _menhir_cell0_COMMA, _menhir_box_file) _menhir_cell1_tff_formula -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.DOT ->
                let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
                let _tok = _menhir_lexer _menhir_lexbuf in
                let MenhirCell1_tff_formula (_menhir_stack, _, f) = _menhir_stack in
                let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_formula_role (_menhir_stack, _, r) = _menhir_stack in
                let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_name (_menhir_stack, _, s) = _menhir_stack in
                let MenhirCell0_LEFT_PAREN (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_TFF (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
                let (_endpos__10_, annot) = (_endpos_0, _v) in
                let _v = _menhir_action_148 _endpos__10_ _startpos__1_ annot f r s in
                _menhir_goto_tff_annotated _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
            | _ ->
                _eRR 515)
        | _ ->
            _eRR 514
    
    and _menhir_run_504 : type  ttv_stack. ((((ttv_stack, _menhir_box_file) _menhir_cell1_THF _menhir_cell0_LEFT_PAREN, _menhir_box_file) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_file) _menhir_cell1_formula_role _menhir_cell0_COMMA, _menhir_box_file) _menhir_cell1_thf_formula -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.DOT ->
                let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
                let _tok = _menhir_lexer _menhir_lexbuf in
                let MenhirCell1_thf_formula (_menhir_stack, _, f) = _menhir_stack in
                let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_formula_role (_menhir_stack, _, r) = _menhir_stack in
                let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_name (_menhir_stack, _, s) = _menhir_stack in
                let MenhirCell0_LEFT_PAREN (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_THF (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
                let (_endpos__10_, annot) = (_endpos_0, _v) in
                let _v = _menhir_action_216 _endpos__10_ _startpos__1_ annot f r s in
                _menhir_goto_thf_annotated _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
            | _ ->
                _eRR 505)
        | _ ->
            _eRR 504
    
    and _menhir_run_493 : type  ttv_stack. ((((ttv_stack, _menhir_box_file) _menhir_cell1_TPI _menhir_cell0_LEFT_PAREN, _menhir_box_file) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_file) _menhir_cell1_formula_role _menhir_cell0_COMMA, _menhir_box_file) _menhir_cell1_tpi_formula -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.DOT ->
                let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
                let _tok = _menhir_lexer _menhir_lexbuf in
                let MenhirCell1_tpi_formula (_menhir_stack, _, f) = _menhir_stack in
                let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_formula_role (_menhir_stack, _, r) = _menhir_stack in
                let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_name (_menhir_stack, _, s) = _menhir_stack in
                let MenhirCell0_LEFT_PAREN (_menhir_stack, _) = _menhir_stack in
                let MenhirCell1_TPI (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
                let (_endpos__10_, annot) = (_endpos_0, _v) in
                let _v = _menhir_action_290 _endpos__10_ _startpos__1_ annot f r s in
                _menhir_goto_tpi_annotated _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
            | _ ->
                _eRR 494)
        | _ ->
            _eRR 493
    
    and _menhir_run_476 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_l_, _startpos_l_, l) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_104 _endpos_l_ _startpos_l_ l in
        _menhir_goto_general_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_l_ _v _menhir_s _tok
    
    and _menhir_goto_general_term : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState299 ->
            _menhir_run_492 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState479 ->
            _menhir_run_480 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState484 ->
            _menhir_run_473 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState474 ->
            _menhir_run_473 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState300 ->
            _menhir_run_473 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_492 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_COMMA as 'stack) -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        let t = _v in
        let _v = _menhir_action_135 t in
        let _menhir_stack = MenhirCell1_source (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState488 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.LEFT_BRACKET ->
                _menhir_run_300 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 488)
        | Tokens.RIGHT_PAREN ->
            let _v = _menhir_action_129 () in
            _menhir_goto_optional_info _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | _ ->
            _eRR 487
    
    and _menhir_run_480 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_general_data -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_general_data (_menhir_stack, _menhir_s, d, _startpos_d_, _) = _menhir_stack in
        let (_endpos_t_, t) = (_endpos, _v) in
        let _v = _menhir_action_105 _endpos_t_ _startpos_d_ d t in
        _menhir_goto_general_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _v _menhir_s _tok
    
    and _menhir_run_473 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _menhir_stack = MenhirCell1_general_term (_menhir_stack, _menhir_s, _v, _endpos) in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState474 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LEFT_BRACKET ->
                _menhir_run_300 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_THF ->
                _menhir_run_302 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_TFF ->
                _menhir_run_440 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_FOT ->
                _menhir_run_444 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_FOF ->
                _menhir_run_448 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_CNF ->
                _menhir_run_454 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 474)
        | Tokens.RIGHT_BRACKET | Tokens.RIGHT_PAREN ->
            let t = _v in
            let _v = _menhir_action_106 t in
            _menhir_goto_general_terms _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 473
    
    and _menhir_run_302 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_DOLLAR_THF (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_PAREN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_LEFT_PAREN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState303 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.XOR ->
                _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.VLINE ->
                _menhir_run_304 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SIGMA ->
                _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.PI ->
                _menhir_run_306 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT_EQUAL ->
                _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTVLINE ->
                _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTAND ->
                _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_TF ->
                _menhir_run_307 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FF ->
                _menhir_run_318 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_323 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_IMPLY ->
                _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_BRACKET ->
                _menhir_run_324 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LAMBDA ->
                _menhir_run_309 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_F ->
                _menhir_run_327 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INDEFINITE_DESCRIPTION ->
                _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.IMPLY ->
                _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL_TY ->
                _menhir_run_311 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS_TY ->
                _menhir_run_312 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUIV ->
                _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUAL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DEFINITE_DESCRIPTION ->
                _menhir_run_313 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.AND ->
                _menhir_run_329 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 303)
        | _ ->
            _eRR 302
    
    and _menhir_run_150 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_024 _endpos__1_ _startpos__1_ in
        _menhir_goto_binary_connective _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_151 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_025 _endpos__1_ _startpos__1_ in
        _menhir_goto_binary_connective _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_307 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_LET_TF (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_PAREN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_LEFT_PAREN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState308 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.LAMBDA ->
                _menhir_run_309 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INDEFINITE_DESCRIPTION ->
                _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL_TY ->
                _menhir_run_311 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS_TY ->
                _menhir_run_312 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DEFINITE_DESCRIPTION ->
                _menhir_run_313 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 308)
        | _ ->
            _eRR 307
    
    and _menhir_run_309 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let _startpos__1_ = _startpos in
        let _v = _menhir_action_254 () in
        _menhir_goto_thf_quantifier _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
    
    and _menhir_goto_thf_quantifier : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_thf_quantifier (_menhir_stack, _menhir_s, _v, _startpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_BRACKET ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_LEFT_BRACKET (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState315 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 315)
        | _ ->
            _eRR 314
    
    and _menhir_run_310 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let _startpos__1_ = _startpos in
        let _v = _menhir_action_258 () in
        _menhir_goto_thf_quantifier _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_311 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let _startpos__1_ = _startpos in
        let _v = _menhir_action_255 () in
        _menhir_goto_thf_quantifier _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_125 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let _startpos__1_ = _startpos in
        let _v = _menhir_action_081 () in
        _menhir_goto_fol_quantifier _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
    
    and _menhir_goto_fol_quantifier : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState579 ->
            _menhir_run_353 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState502 ->
            _menhir_run_353 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState303 ->
            _menhir_run_353 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState308 ->
            _menhir_run_353 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState435 ->
            _menhir_run_353 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState427 ->
            _menhir_run_353 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState317 ->
            _menhir_run_353 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState319 ->
            _menhir_run_353 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState322 ->
            _menhir_run_353 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState323 ->
            _menhir_run_353 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState324 ->
            _menhir_run_353 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState413 ->
            _menhir_run_353 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState326 ->
            _menhir_run_353 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState328 ->
            _menhir_run_353 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState403 ->
            _menhir_run_353 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState405 ->
            _menhir_run_353 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState332 ->
            _menhir_run_353 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState333 ->
            _menhir_run_353 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState396 ->
            _menhir_run_353 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState394 ->
            _menhir_run_353 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState335 ->
            _menhir_run_353 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState340 ->
            _menhir_run_353 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState366 ->
            _menhir_run_353 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState384 ->
            _menhir_run_353 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState381 ->
            _menhir_run_353 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState371 ->
            _menhir_run_353 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState363 ->
            _menhir_run_353 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState360 ->
            _menhir_run_353 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState358 ->
            _menhir_run_353 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState356 ->
            _menhir_run_353 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState342 ->
            _menhir_run_353 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState605 ->
            _menhir_run_256 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState569 ->
            _menhir_run_256 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState536 ->
            _menhir_run_256 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState010 ->
            _menhir_run_256 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState449 ->
            _menhir_run_256 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState251 ->
            _menhir_run_256 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState291 ->
            _menhir_run_256 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState252 ->
            _menhir_run_256 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState286 ->
            _menhir_run_256 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState278 ->
            _menhir_run_256 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState275 ->
            _menhir_run_256 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState273 ->
            _menhir_run_256 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState271 ->
            _menhir_run_256 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState254 ->
            _menhir_run_256 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState263 ->
            _menhir_run_256 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState255 ->
            _menhir_run_256 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState589 ->
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState512 ->
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState441 ->
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState023 ->
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState097 ->
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState178 ->
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState179 ->
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState180 ->
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState185 ->
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState121 ->
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState122 ->
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState124 ->
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState163 ->
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState165 ->
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState172 ->
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState160 ->
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState157 ->
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState155 ->
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState148 ->
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState142 ->
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState128 ->
            _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_353 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
        let (_startpos_q_, q) = (_startpos, _v) in
        let _v = _menhir_action_253 q in
        _menhir_goto_thf_quantifier _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_q_ _v _menhir_s _tok
    
    and _menhir_run_256 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_fol_quantifier (_menhir_stack, _menhir_s, _v, _startpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_BRACKET ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_LEFT_BRACKET (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState257 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 257)
        | _ ->
            _eRR 256
    
    and _menhir_run_138 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_fol_quantifier (_menhir_stack, _menhir_s, _v, _startpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_BRACKET ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_LEFT_BRACKET (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState139 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 139)
        | _ ->
            _eRR 138
    
    and _menhir_run_312 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let _startpos__1_ = _startpos in
        let _v = _menhir_action_256 () in
        _menhir_goto_thf_quantifier _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_126 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let _startpos__1_ = _startpos in
        let _v = _menhir_action_082 () in
        _menhir_goto_fol_quantifier _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_313 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let _startpos__1_ = _startpos in
        let _v = _menhir_action_257 () in
        _menhir_goto_thf_quantifier _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_318 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_LET_FF (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_PAREN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_LEFT_PAREN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState319 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.LAMBDA ->
                _menhir_run_309 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INDEFINITE_DESCRIPTION ->
                _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL_TY ->
                _menhir_run_311 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS_TY ->
                _menhir_run_312 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DEFINITE_DESCRIPTION ->
                _menhir_run_313 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 319)
        | _ ->
            _eRR 318
    
    and _menhir_run_323 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState323 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.VLINE ->
            _menhir_run_304 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.UPPER_WORD _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.SINGLE_QUOTED _v ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.SIGMA ->
            _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.REAL _v ->
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.RATIONAL _v ->
            _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.PI ->
            _menhir_run_306 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.NOT_EQUAL ->
            _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.NOTVLINE ->
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.NOTAND ->
            _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.NOT ->
            _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LET_TT ->
            _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET_TF ->
            _menhir_run_307 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET_FT ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET_FF ->
            _menhir_run_318 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFT_PAREN ->
            _menhir_run_323 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFT_IMPLY ->
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFT_BRACKET ->
            _menhir_run_324 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LAMBDA ->
            _menhir_run_309 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ITE_T ->
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ITE_F ->
            _menhir_run_327 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.INDEFINITE_DESCRIPTION ->
            _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.IMPLY ->
            _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FORALL_TY ->
            _menhir_run_311 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FORALL ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS_TY ->
            _menhir_run_312 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EQUIV ->
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EQUAL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DOLLAR_WORD _v ->
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DOLLAR_DOLLAR_WORD _v ->
            _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DISTINCT_OBJECT _v ->
            _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DEFINITE_DESCRIPTION ->
            _menhir_run_313 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.AND ->
            _menhir_run_329 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 323
    
    and _menhir_run_152 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_022 _endpos__1_ _startpos__1_ in
        _menhir_goto_binary_connective _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_324 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState324
        | Tokens.VLINE ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_304 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState324
        | Tokens.UPPER_WORD _v ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState324
        | Tokens.SINGLE_QUOTED _v ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState324
        | Tokens.SIGMA ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState324
        | Tokens.RIGHT_BRACKET ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let (_startpos__1_, _endpos__2_) = (_startpos, _endpos) in
            let _v = _menhir_action_263 () in
            _menhir_goto_thf_tuple _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__2_ _startpos__1_ _v _menhir_s _tok
        | Tokens.REAL _v ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState324
        | Tokens.RATIONAL _v ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState324
        | Tokens.PI ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_306 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState324
        | Tokens.NOT_EQUAL ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState324
        | Tokens.NOTVLINE ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState324
        | Tokens.NOTAND ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState324
        | Tokens.NOT ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState324
        | Tokens.LOWER_WORD _v ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState324
        | Tokens.LET_TT ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState324
        | Tokens.LET_TF ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_307 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState324
        | Tokens.LET_FT ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState324
        | Tokens.LET_FF ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_318 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState324
        | Tokens.LEFT_PAREN ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_326 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState324
        | Tokens.LEFT_IMPLY ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState324
        | Tokens.LAMBDA ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_309 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState324
        | Tokens.ITE_T ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState324
        | Tokens.ITE_F ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_327 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState324
        | Tokens.INTEGER _v ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState324
        | Tokens.INDEFINITE_DESCRIPTION ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState324
        | Tokens.IMPLY ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState324
        | Tokens.FORALL_TY ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_311 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState324
        | Tokens.FORALL ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState324
        | Tokens.EXISTS_TY ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_312 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState324
        | Tokens.EXISTS ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState324
        | Tokens.EQUIV ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState324
        | Tokens.EQUAL ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState324
        | Tokens.DOLLAR_WORD _v ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState324
        | Tokens.DOLLAR_DOLLAR_WORD _v ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState324
        | Tokens.DISTINCT_OBJECT _v ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState324
        | Tokens.DEFINITE_DESCRIPTION ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_313 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState324
        | Tokens.AND ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_329 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState324
        | _ ->
            _eRR 324
    
    and _menhir_goto_thf_tuple : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState416 ->
            _menhir_run_417 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState579 ->
            _menhir_run_415 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState502 ->
            _menhir_run_415 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState303 ->
            _menhir_run_415 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState435 ->
            _menhir_run_415 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState322 ->
            _menhir_run_415 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState323 ->
            _menhir_run_415 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_417 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_thf_tuple -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_thf_tuple (_menhir_stack, _menhir_s, hyp, _startpos_hyp_, _) = _menhir_stack in
        let (_endpos_goal_, goal) = (_endpos, _v) in
        let _v = _menhir_action_260 _endpos_goal_ _startpos_hyp_ goal hyp in
        _menhir_goto_thf_sequent _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_thf_sequent : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState579 ->
            _menhir_run_420 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState502 ->
            _menhir_run_420 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState303 ->
            _menhir_run_420 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState435 ->
            _menhir_run_420 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState322 ->
            _menhir_run_420 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState323 ->
            _menhir_run_418 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_420 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let f = _v in
        let _v = _menhir_action_235 f in
        _menhir_goto_thf_formula _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_thf_formula : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState579 ->
            _menhir_run_580 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState502 ->
            _menhir_run_503 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState303 ->
            _menhir_run_438 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState435 ->
            _menhir_run_436 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState322 ->
            _menhir_run_422 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_580 : type  ttv_stack. ((((ttv_stack, _menhir_box_input) _menhir_cell1_THF _menhir_cell0_LEFT_PAREN, _menhir_box_input) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_input) _menhir_cell1_formula_role _menhir_cell0_COMMA as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_thf_formula (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            _menhir_run_299 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState580
        | Tokens.RIGHT_PAREN ->
            let _v_0 = _menhir_action_008 () in
            _menhir_run_581 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
        | _ ->
            _eRR 580
    
    and _menhir_run_503 : type  ttv_stack. ((((ttv_stack, _menhir_box_file) _menhir_cell1_THF _menhir_cell0_LEFT_PAREN, _menhir_box_file) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_file) _menhir_cell1_formula_role _menhir_cell0_COMMA as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_thf_formula (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            _menhir_run_299 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState503
        | Tokens.RIGHT_PAREN ->
            let _v_0 = _menhir_action_008 () in
            _menhir_run_504 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
        | _ ->
            _eRR 503
    
    and _menhir_run_438 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_DOLLAR_THF _menhir_cell0_LEFT_PAREN -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_LEFT_PAREN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_DOLLAR_THF (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__4_, f) = (_endpos, _v) in
            let _v = _menhir_action_083 f in
            _menhir_goto_formula_data _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__4_ _startpos__1_ _v _menhir_s _tok
        | _ ->
            _eRR 438
    
    and _menhir_run_436 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LET_TF _menhir_cell0_LEFT_PAREN, ttv_result) _menhir_cell1_thf_let_term_defn _menhir_cell0_COMMA -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_thf_let_term_defn (_menhir_stack, _, l) = _menhir_stack in
            let MenhirCell0_LEFT_PAREN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_LET_TF (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__6_, f) = (_endpos, _v) in
            let _v = _menhir_action_237 _endpos__6_ _startpos__1_ f l in
            _menhir_goto_thf_let _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__6_ _startpos__1_ _v _menhir_s _tok
        | _ ->
            _eRR 436
    
    and _menhir_goto_thf_let : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_f_, _startpos_f_, f) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_281 f in
        _menhir_goto_thf_unitary_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _startpos_f_ _v _menhir_s _tok
    
    and _menhir_goto_thf_unitary_formula : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState427 ->
            _menhir_run_428 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState384 ->
            _menhir_run_385 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState381 ->
            _menhir_run_382 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState371 ->
            _menhir_run_372 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState360 ->
            _menhir_run_361 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState358 ->
            _menhir_run_359 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState356 ->
            _menhir_run_357 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState342 ->
            _menhir_run_343 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState579 ->
            _menhir_run_341 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState502 ->
            _menhir_run_341 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState303 ->
            _menhir_run_341 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState435 ->
            _menhir_run_341 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState317 ->
            _menhir_run_341 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState322 ->
            _menhir_run_341 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState323 ->
            _menhir_run_341 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState413 ->
            _menhir_run_341 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState324 ->
            _menhir_run_341 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState326 ->
            _menhir_run_341 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState405 ->
            _menhir_run_341 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState403 ->
            _menhir_run_341 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState328 ->
            _menhir_run_341 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState333 ->
            _menhir_run_341 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState366 ->
            _menhir_run_341 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState340 ->
            _menhir_run_341 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState332 ->
            _menhir_run_337 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState396 ->
            _menhir_run_337 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState394 ->
            _menhir_run_337 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState363 ->
            _menhir_run_337 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState335 ->
            _menhir_run_337 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_428 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_thf_quantifier _menhir_cell0_LEFT_BRACKET, ttv_result) _menhir_cell1_thf_variable_list _menhir_cell0_RIGHT_BRACKET -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell0_RIGHT_BRACKET (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_thf_variable_list (_menhir_stack, _, l) = _menhir_stack in
        let MenhirCell0_LEFT_BRACKET (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_thf_quantifier (_menhir_stack, _menhir_s, q, _startpos_q_) = _menhir_stack in
        let (_endpos_f_, f) = (_endpos, _v) in
        let _v = _menhir_action_252 _endpos_f_ _startpos_q_ f l q in
        _menhir_goto_thf_quantified_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _startpos_q_ _v _menhir_s _tok
    
    and _menhir_goto_thf_quantified_formula : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState308 ->
            _menhir_run_433 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState579 ->
            _menhir_run_344 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState502 ->
            _menhir_run_344 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState303 ->
            _menhir_run_344 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState435 ->
            _menhir_run_344 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState427 ->
            _menhir_run_344 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState317 ->
            _menhir_run_344 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState322 ->
            _menhir_run_344 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState323 ->
            _menhir_run_344 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState413 ->
            _menhir_run_344 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState324 ->
            _menhir_run_344 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState326 ->
            _menhir_run_344 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState405 ->
            _menhir_run_344 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState403 ->
            _menhir_run_344 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState328 ->
            _menhir_run_344 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState332 ->
            _menhir_run_344 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState333 ->
            _menhir_run_344 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState396 ->
            _menhir_run_344 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState394 ->
            _menhir_run_344 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState335 ->
            _menhir_run_344 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState340 ->
            _menhir_run_344 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState384 ->
            _menhir_run_344 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState381 ->
            _menhir_run_344 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState371 ->
            _menhir_run_344 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState366 ->
            _menhir_run_344 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState363 ->
            _menhir_run_344 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState360 ->
            _menhir_run_344 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState358 ->
            _menhir_run_344 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState356 ->
            _menhir_run_344 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState342 ->
            _menhir_run_344 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState319 ->
            _menhir_run_320 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_433 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LET_TF _menhir_cell0_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let f = _v in
        let _v = _menhir_action_240 f in
        let _menhir_stack = MenhirCell1_thf_let_term_defn (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState435 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.XOR ->
                _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.VLINE ->
                _menhir_run_304 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SIGMA ->
                _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.PI ->
                _menhir_run_306 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT_EQUAL ->
                _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTVLINE ->
                _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTAND ->
                _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_TF ->
                _menhir_run_307 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FF ->
                _menhir_run_318 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_323 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_IMPLY ->
                _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_BRACKET ->
                _menhir_run_324 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LAMBDA ->
                _menhir_run_309 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_F ->
                _menhir_run_327 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INDEFINITE_DESCRIPTION ->
                _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.IMPLY ->
                _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL_TY ->
                _menhir_run_311 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS_TY ->
                _menhir_run_312 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUIV ->
                _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUAL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DEFINITE_DESCRIPTION ->
                _menhir_run_313 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.AND ->
                _menhir_run_329 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 435)
        | _ ->
            _eRR 434
    
    and _menhir_run_327 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_ITE_F (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_PAREN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_LEFT_PAREN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState328 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.XOR ->
                _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.VLINE ->
                _menhir_run_304 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SIGMA ->
                _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.PI ->
                _menhir_run_306 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT_EQUAL ->
                _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTVLINE ->
                _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTAND ->
                _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_TF ->
                _menhir_run_307 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FF ->
                _menhir_run_318 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_326 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_IMPLY ->
                _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LAMBDA ->
                _menhir_run_309 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_F ->
                _menhir_run_327 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INDEFINITE_DESCRIPTION ->
                _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.IMPLY ->
                _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL_TY ->
                _menhir_run_311 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS_TY ->
                _menhir_run_312 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUIV ->
                _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUAL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DEFINITE_DESCRIPTION ->
                _menhir_run_313 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.AND ->
                _menhir_run_329 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 328)
        | _ ->
            _eRR 327
    
    and _menhir_run_326 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState326 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.VLINE ->
            _menhir_run_304 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.UPPER_WORD _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.SINGLE_QUOTED _v ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.SIGMA ->
            _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.REAL _v ->
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.RATIONAL _v ->
            _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.PI ->
            _menhir_run_306 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.NOT_EQUAL ->
            _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.NOTVLINE ->
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.NOTAND ->
            _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.NOT ->
            _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LET_TT ->
            _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET_TF ->
            _menhir_run_307 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET_FT ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET_FF ->
            _menhir_run_318 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFT_PAREN ->
            _menhir_run_326 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFT_IMPLY ->
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LAMBDA ->
            _menhir_run_309 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ITE_T ->
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ITE_F ->
            _menhir_run_327 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.INDEFINITE_DESCRIPTION ->
            _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.IMPLY ->
            _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FORALL_TY ->
            _menhir_run_311 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FORALL ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS_TY ->
            _menhir_run_312 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EQUIV ->
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EQUAL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DOLLAR_WORD _v ->
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DOLLAR_DOLLAR_WORD _v ->
            _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DISTINCT_OBJECT _v ->
            _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DEFINITE_DESCRIPTION ->
            _menhir_run_313 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.AND ->
            _menhir_run_329 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 326
    
    and _menhir_run_153 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_021 _endpos__1_ _startpos__1_ in
        _menhir_goto_binary_connective _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_154 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_020 _endpos__1_ _startpos__1_ in
        _menhir_goto_binary_connective _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_108 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_108 _endpos__1_ _startpos__1_ in
        _menhir_goto_infix_equality _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_goto_infix_equality : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState579 ->
            _menhir_run_352 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState502 ->
            _menhir_run_352 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState303 ->
            _menhir_run_352 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState435 ->
            _menhir_run_352 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState427 ->
            _menhir_run_352 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState317 ->
            _menhir_run_352 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState322 ->
            _menhir_run_352 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState323 ->
            _menhir_run_352 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState324 ->
            _menhir_run_352 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState413 ->
            _menhir_run_352 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState326 ->
            _menhir_run_352 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState328 ->
            _menhir_run_352 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState403 ->
            _menhir_run_352 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState405 ->
            _menhir_run_352 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState332 ->
            _menhir_run_352 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState333 ->
            _menhir_run_352 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState396 ->
            _menhir_run_352 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState394 ->
            _menhir_run_352 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState335 ->
            _menhir_run_352 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState340 ->
            _menhir_run_352 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState366 ->
            _menhir_run_352 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState384 ->
            _menhir_run_352 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState381 ->
            _menhir_run_352 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState371 ->
            _menhir_run_352 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState363 ->
            _menhir_run_352 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState341 ->
            _menhir_run_352 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState360 ->
            _menhir_run_352 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState358 ->
            _menhir_run_352 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState356 ->
            _menhir_run_352 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState342 ->
            _menhir_run_352 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState134 ->
            _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState107 ->
            _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_352 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_249 t in
        _menhir_goto_thf_pair_connective _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _startpos_t_ _v _menhir_s _tok
    
    and _menhir_run_109 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_term as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let t = _v in
        let _v = _menhir_action_039 t in
        let _menhir_stack = MenhirCell1_defined_infix_pred (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v_0 ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState110
        | Tokens.SINGLE_QUOTED _v_1 ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState110
        | Tokens.REAL _v_2 ->
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState110
        | Tokens.RATIONAL _v_3 ->
            _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState110
        | Tokens.LOWER_WORD _v_4 ->
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState110
        | Tokens.LET_TT ->
            _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
        | Tokens.LET_FT ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
        | Tokens.ITE_T ->
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState110
        | Tokens.INTEGER _v_5 ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState110
        | Tokens.DOLLAR_WORD _v_6 ->
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v_6 MenhirState110
        | Tokens.DOLLAR_DOLLAR_WORD _v_7 ->
            _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v_7 MenhirState110
        | Tokens.DISTINCT_OBJECT _v_8 ->
            _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v_8 MenhirState110
        | _ ->
            _eRR 110
    
    and _menhir_run_029 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_017 _endpos_s_ _startpos_s_ s in
        let (_endpos, _startpos) = (_endpos_s_, _startpos_s_) in
        let (_endpos_f_, _startpos_f_, f) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_139 f in
        _menhir_goto_system_functor _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _startpos_f_ _v _menhir_s _tok
    
    and _menhir_goto_system_functor : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState589 ->
            _menhir_run_227 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState512 ->
            _menhir_run_227 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState441 ->
            _menhir_run_227 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState097 ->
            _menhir_run_227 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState178 ->
            _menhir_run_227 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState179 ->
            _menhir_run_227 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState616 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState605 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState579 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState569 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState546 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState536 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState502 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState010 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState455 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState462 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState456 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState457 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState449 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState445 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState303 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState435 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState427 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState317 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState322 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState323 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState324 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState413 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState326 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState328 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState403 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState405 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState332 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState333 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState396 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState394 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState335 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState340 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState366 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState384 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState381 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState371 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState363 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState360 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState358 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState356 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState342 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState251 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState291 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState252 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState286 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState278 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState275 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState273 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState271 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState254 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState263 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState255 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState018 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState248 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState020 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState244 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState021 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState023 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState236 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState238 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState025 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState099 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState180 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState185 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState121 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState122 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState124 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState163 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState165 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState172 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState160 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState157 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState155 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState148 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState142 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState128 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState136 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState104 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState110 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState089 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState026 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState070 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState033 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState051 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState038 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState035 ->
            _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_227 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_PAREN ->
            let _menhir_stack = MenhirCell1_system_functor (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND | Tokens.COMMA | Tokens.EQUAL | Tokens.EQUIV | Tokens.IMPLY | Tokens.LEFT_IMPLY | Tokens.NOTAND | Tokens.NOTVLINE | Tokens.NOT_EQUAL | Tokens.RIGHT_PAREN | Tokens.VLINE | Tokens.XOR ->
            let (_endpos_f_, _startpos_f_, f) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_138 f in
            _menhir_goto_system_constant _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _startpos_f_ _v _menhir_s _tok
        | Tokens.COLON ->
            let (_startpos_f_, f) = (_startpos, _v) in
            let _v = _menhir_action_207 f in
            _menhir_goto_tff_untyped_atom _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_f_ _v _menhir_s
        | _ ->
            _eRR 227
    
    and _menhir_run_038 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_system_functor -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell0_LEFT_PAREN (_menhir_stack, _startpos) in
        let _menhir_s = MenhirState038 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.SINGLE_QUOTED _v ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.REAL _v ->
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.RATIONAL _v ->
            _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LET_TT ->
            _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET_FT ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ITE_T ->
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DOLLAR_WORD _v ->
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DOLLAR_DOLLAR_WORD _v ->
            _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DISTINCT_OBJECT _v ->
            _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 38
    
    and _menhir_run_030 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_048 _endpos_s_ _startpos_s_ s in
        _menhir_goto_distinct_object _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_s_ _startpos_s_ _v _menhir_s _tok
    
    and _menhir_goto_distinct_object : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState299 ->
            _menhir_run_482 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState300 ->
            _menhir_run_482 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState474 ->
            _menhir_run_482 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState484 ->
            _menhir_run_482 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState479 ->
            _menhir_run_482 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState616 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState605 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState589 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState579 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState569 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState546 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState536 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState512 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState502 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState010 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState455 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState462 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState456 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState457 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState449 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState445 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState441 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState303 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState435 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState427 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState317 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState322 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState323 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState324 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState413 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState326 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState328 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState403 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState405 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState332 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState333 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState396 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState394 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState335 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState340 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState366 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState384 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState381 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState371 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState363 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState360 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState358 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState356 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState342 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState251 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState252 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState291 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState254 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState286 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState278 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState275 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState273 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState271 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState255 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState263 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState018 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState248 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState020 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState244 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState021 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState023 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState236 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState238 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState025 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState097 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState099 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState178 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState179 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState180 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState185 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState121 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState122 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState124 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState163 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState165 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState172 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState160 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState157 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState155 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState148 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState128 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState142 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState136 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState104 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState110 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState089 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState026 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState070 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState033 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState035 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState051 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState038 ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_482 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_d_, _startpos_d_, d) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_098 d in
        _menhir_goto_general_data _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_d_ _startpos_d_ _v _menhir_s _tok
    
    and _menhir_run_047 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_a_, _startpos_a_, a) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_032 a in
        _menhir_goto_defined_atom _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_a_ _startpos_a_ _v _menhir_s _tok
    
    and _menhir_goto_system_constant : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_140 c in
        _menhir_goto_system_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v _menhir_s _tok
    
    and _menhir_goto_system_term : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState616 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState605 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState589 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState569 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState546 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState536 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState512 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState010 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState455 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState462 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState456 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState457 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState449 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState441 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState251 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState291 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState252 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState286 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState278 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState275 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState273 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState271 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState254 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState263 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState255 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState020 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState021 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState023 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState097 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState099 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState178 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState179 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState180 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState185 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState121 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState122 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState124 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState163 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState165 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState172 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState160 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState157 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState155 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState148 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState142 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState128 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState104 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState579 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState502 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState445 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState303 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState435 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState427 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState317 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState322 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState323 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState324 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState413 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState326 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState328 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState403 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState405 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState332 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState333 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState396 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState394 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState335 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState340 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState366 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState384 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState381 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState371 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState363 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState360 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState358 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState356 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState342 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState018 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState248 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState244 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState236 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState238 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState025 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState136 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState110 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState089 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState026 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState070 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState033 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState051 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState038 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState035 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_112 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.EQUAL | Tokens.NOT_EQUAL ->
            let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_093 t in
            _menhir_goto_function_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _startpos_t_ _v _menhir_s _tok
        | Tokens.AND | Tokens.COMMA | Tokens.EQUIV | Tokens.IMPLY | Tokens.LEFT_IMPLY | Tokens.NOTAND | Tokens.NOTVLINE | Tokens.RIGHT_BRACKET | Tokens.RIGHT_PAREN | Tokens.VLINE | Tokens.XOR ->
            let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_137 t in
            let (_endpos, _startpos) = (_endpos_t_, _startpos_t_) in
            let (_endpos_f_, _startpos_f_, f) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_016 f in
            _menhir_goto_atomic_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _startpos_f_ _v _menhir_s _tok
        | _ ->
            _eRR 112
    
    and _menhir_goto_atomic_formula : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState616 ->
            _menhir_run_464 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState546 ->
            _menhir_run_464 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState455 ->
            _menhir_run_464 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState456 ->
            _menhir_run_464 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState462 ->
            _menhir_run_464 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState457 ->
            _menhir_run_458 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState605 ->
            _menhir_run_268 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState569 ->
            _menhir_run_268 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState536 ->
            _menhir_run_268 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState010 ->
            _menhir_run_268 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState449 ->
            _menhir_run_268 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState251 ->
            _menhir_run_268 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState252 ->
            _menhir_run_268 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState291 ->
            _menhir_run_268 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState254 ->
            _menhir_run_268 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState286 ->
            _menhir_run_268 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState278 ->
            _menhir_run_268 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState275 ->
            _menhir_run_268 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState273 ->
            _menhir_run_268 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState271 ->
            _menhir_run_268 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState255 ->
            _menhir_run_268 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState263 ->
            _menhir_run_268 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState589 ->
            _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState512 ->
            _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState441 ->
            _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState023 ->
            _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState097 ->
            _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState178 ->
            _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState179 ->
            _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState180 ->
            _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState185 ->
            _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState121 ->
            _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState122 ->
            _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState124 ->
            _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState163 ->
            _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState165 ->
            _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState172 ->
            _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState160 ->
            _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState157 ->
            _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState155 ->
            _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState148 ->
            _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState128 ->
            _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState142 ->
            _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState020 ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState021 ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState099 ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState104 ->
            _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_464 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_f_, _startpos_f_, f) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_117 f in
        _menhir_goto_literal _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _startpos_f_ _v _menhir_s _tok
    
    and _menhir_goto_literal : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState462 ->
            _menhir_run_463 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState616 ->
            _menhir_run_459 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState546 ->
            _menhir_run_459 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState455 ->
            _menhir_run_459 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState456 ->
            _menhir_run_459 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_463 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_disjunction _menhir_cell0_VLINE -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell0_VLINE (_menhir_stack, _startpos__2_, _endpos__2_) = _menhir_stack in
        let MenhirCell1_disjunction (_menhir_stack, _menhir_s, f, _startpos_f_) = _menhir_stack in
        let (_endpos_x_, x) = (_endpos, _v) in
        let _v = _menhir_action_047 _endpos__2_ _endpos_x_ _startpos__2_ _startpos_f_ f x in
        _menhir_goto_disjunction _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_f_ _v _menhir_s _tok
    
    and _menhir_goto_disjunction : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState616 ->
            _menhir_run_466 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState546 ->
            _menhir_run_466 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState455 ->
            _menhir_run_466 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState456 ->
            _menhir_run_461 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_466 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.VLINE ->
            let _menhir_stack = MenhirCell1_disjunction (_menhir_stack, _menhir_s, _v, _startpos) in
            _menhir_run_462 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.COMMA | Tokens.RIGHT_PAREN ->
            let f = _v in
            let _v = _menhir_action_028 f in
            _menhir_goto_cnf_formula _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 466
    
    and _menhir_run_462 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_disjunction -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_VLINE (_menhir_stack, _startpos, _endpos) in
        let _menhir_s = MenhirState462 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.SINGLE_QUOTED _v ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.REAL _v ->
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.RATIONAL _v ->
            _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LET_TT ->
            _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET_FT ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ITE_T ->
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DOLLAR_WORD _v ->
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DOLLAR_DOLLAR_WORD _v ->
            _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DISTINCT_OBJECT _v ->
            _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 462
    
    and _menhir_goto_cnf_formula : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState616 ->
            _menhir_run_617 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState546 ->
            _menhir_run_547 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState455 ->
            _menhir_run_467 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_617 : type  ttv_stack. ((((ttv_stack, _menhir_box_input) _menhir_cell1_CNF _menhir_cell0_LEFT_PAREN, _menhir_box_input) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_input) _menhir_cell1_formula_role _menhir_cell0_COMMA as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_cnf_formula (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            _menhir_run_299 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState617
        | Tokens.RIGHT_PAREN ->
            let _v_0 = _menhir_action_008 () in
            _menhir_run_618 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
        | _ ->
            _eRR 617
    
    and _menhir_run_547 : type  ttv_stack. ((((ttv_stack, _menhir_box_file) _menhir_cell1_CNF _menhir_cell0_LEFT_PAREN, _menhir_box_file) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_file) _menhir_cell1_formula_role _menhir_cell0_COMMA as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_cnf_formula (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            _menhir_run_299 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState547
        | Tokens.RIGHT_PAREN ->
            let _v_0 = _menhir_action_008 () in
            _menhir_run_548 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
        | _ ->
            _eRR 547
    
    and _menhir_run_467 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_DOLLAR_CNF _menhir_cell0_LEFT_PAREN -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_LEFT_PAREN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_DOLLAR_CNF (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__4_, f) = (_endpos, _v) in
            let _v = _menhir_action_086 f in
            _menhir_goto_formula_data _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__4_ _startpos__1_ _v _menhir_s _tok
        | _ ->
            _eRR 467
    
    and _menhir_run_461 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.VLINE ->
            let _menhir_stack = MenhirCell1_disjunction (_menhir_stack, _menhir_s, _v, _startpos) in
            _menhir_run_462 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.RIGHT_PAREN ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s, _) = _menhir_stack in
            let f = _v in
            let _v = _menhir_action_027 f in
            _menhir_goto_cnf_formula _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 461
    
    and _menhir_run_459 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
        let (_startpos_x_, x) = (_startpos, _v) in
        let _v = _menhir_action_046 x in
        _menhir_goto_disjunction _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_x_ _v _menhir_s _tok
    
    and _menhir_run_458 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_unary_negation -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_unary_negation (_menhir_stack, _menhir_s, c, _startpos_c_, _) = _menhir_stack in
        let (_endpos_f_, f) = (_endpos, _v) in
        let _v = _menhir_action_118 _endpos_f_ _startpos_c_ c f in
        _menhir_goto_literal _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _startpos_c_ _v _menhir_s _tok
    
    and _menhir_run_268 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_f_, _startpos_f_, f) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_076 f in
        _menhir_goto_fof_unitary_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _startpos_f_ _v _menhir_s _tok
    
    and _menhir_goto_fof_unitary_formula : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState286 ->
            _menhir_run_287 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState278 ->
            _menhir_run_279 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState275 ->
            _menhir_run_276 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState273 ->
            _menhir_run_274 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState271 ->
            _menhir_run_272 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState605 ->
            _menhir_run_270 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState569 ->
            _menhir_run_270 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState536 ->
            _menhir_run_270 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState010 ->
            _menhir_run_270 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState449 ->
            _menhir_run_270 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState251 ->
            _menhir_run_270 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState291 ->
            _menhir_run_270 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState252 ->
            _menhir_run_270 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState254 ->
            _menhir_run_270 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState255 ->
            _menhir_run_269 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState263 ->
            _menhir_run_265 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_287 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_fof_and_formula _menhir_cell0_AND -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell0_AND (_menhir_stack, _startpos__2_, _endpos__2_) = _menhir_stack in
        let MenhirCell1_fof_and_formula (_menhir_stack, _menhir_s, f, _startpos_f_) = _menhir_stack in
        let (_endpos_g_, g) = (_endpos, _v) in
        let _v = _menhir_action_052 _endpos__2_ _endpos_g_ _startpos__2_ _startpos_f_ f g in
        _menhir_goto_fof_and_formula _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_f_ _v _menhir_s _tok
    
    and _menhir_goto_fof_and_formula : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.AND ->
            let _menhir_stack = MenhirCell1_fof_and_formula (_menhir_stack, _menhir_s, _v, _startpos) in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell0_AND (_menhir_stack, _startpos, _endpos) in
            let _menhir_s = MenhirState286 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_254 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 286)
        | Tokens.COMMA | Tokens.RIGHT_BRACKET | Tokens.RIGHT_PAREN ->
            let f = _v in
            let _v = _menhir_action_055 f in
            _menhir_goto_fof_binary_assoc _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 285
    
    and _menhir_run_254 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState254 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.SINGLE_QUOTED _v ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.REAL _v ->
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.RATIONAL _v ->
            _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LET_TT ->
            _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET_FT ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFT_PAREN ->
            _menhir_run_254 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ITE_T ->
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FORALL ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DOLLAR_WORD _v ->
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DOLLAR_DOLLAR_WORD _v ->
            _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DISTINCT_OBJECT _v ->
            _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 254
    
    and _menhir_goto_fof_binary_assoc : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let f = _v in
        let _v = _menhir_action_057 f in
        _menhir_goto_fof_binary_formula _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_fof_binary_formula : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let f = _v in
        let _v = _menhir_action_061 f in
        _menhir_goto_fof_logic_formula _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_fof_logic_formula : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState605 ->
            _menhir_run_451 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState569 ->
            _menhir_run_451 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState536 ->
            _menhir_run_451 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState010 ->
            _menhir_run_451 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState449 ->
            _menhir_run_451 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState291 ->
            _menhir_run_290 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState252 ->
            _menhir_run_290 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState251 ->
            _menhir_run_280 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState254 ->
            _menhir_run_280 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_451 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let f = _v in
        let _v = _menhir_action_059 f in
        _menhir_goto_fof_formula _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_fof_formula : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState605 ->
            _menhir_run_606 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState536 ->
            _menhir_run_537 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState569 ->
            _menhir_run_496 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState010 ->
            _menhir_run_496 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState449 ->
            _menhir_run_452 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_606 : type  ttv_stack. ((((ttv_stack, _menhir_box_input) _menhir_cell1_FOF _menhir_cell0_LEFT_PAREN, _menhir_box_input) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_input) _menhir_cell1_formula_role _menhir_cell0_COMMA as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_fof_formula (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            _menhir_run_299 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState606
        | Tokens.RIGHT_PAREN ->
            let _v_0 = _menhir_action_008 () in
            _menhir_run_607 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
        | _ ->
            _eRR 606
    
    and _menhir_run_537 : type  ttv_stack. ((((ttv_stack, _menhir_box_file) _menhir_cell1_FOF _menhir_cell0_LEFT_PAREN, _menhir_box_file) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_file) _menhir_cell1_formula_role _menhir_cell0_COMMA as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_fof_formula (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            _menhir_run_299 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState537
        | Tokens.RIGHT_PAREN ->
            let _v_0 = _menhir_action_008 () in
            _menhir_run_538 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
        | _ ->
            _eRR 537
    
    and _menhir_run_496 : type  ttv_stack ttv_result. ((((ttv_stack, ttv_result) _menhir_cell1_TPI _menhir_cell0_LEFT_PAREN, ttv_result) _menhir_cell1_name _menhir_cell0_COMMA, ttv_result) _menhir_cell1_formula_role _menhir_cell0_COMMA as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let f = _v in
        let _v = _menhir_action_291 f in
        _menhir_goto_tpi_formula _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_tpi_formula : type  ttv_stack ttv_result. ((((ttv_stack, ttv_result) _menhir_cell1_TPI _menhir_cell0_LEFT_PAREN, ttv_result) _menhir_cell1_name _menhir_cell0_COMMA, ttv_result) _menhir_cell1_formula_role _menhir_cell0_COMMA as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState569 ->
            _menhir_run_570 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState010 ->
            _menhir_run_298 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_570 : type  ttv_stack. ((((ttv_stack, _menhir_box_input) _menhir_cell1_TPI _menhir_cell0_LEFT_PAREN, _menhir_box_input) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_input) _menhir_cell1_formula_role _menhir_cell0_COMMA as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_tpi_formula (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            _menhir_run_299 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState570
        | Tokens.RIGHT_PAREN ->
            let _v_0 = _menhir_action_008 () in
            _menhir_run_571 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
        | _ ->
            _eRR 570
    
    and _menhir_run_298 : type  ttv_stack. ((((ttv_stack, _menhir_box_file) _menhir_cell1_TPI _menhir_cell0_LEFT_PAREN, _menhir_box_file) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_file) _menhir_cell1_formula_role _menhir_cell0_COMMA as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_tpi_formula (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            _menhir_run_299 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState298
        | Tokens.RIGHT_PAREN ->
            let _v_0 = _menhir_action_008 () in
            _menhir_run_493 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
        | _ ->
            _eRR 298
    
    and _menhir_run_452 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_DOLLAR_FOF _menhir_cell0_LEFT_PAREN -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_LEFT_PAREN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_DOLLAR_FOF (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__4_, f) = (_endpos, _v) in
            let _v = _menhir_action_085 f in
            _menhir_goto_formula_data _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__4_ _startpos__1_ _v _menhir_s _tok
        | _ ->
            _eRR 452
    
    and _menhir_run_290 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _menhir_stack = MenhirCell1_fof_logic_formula (_menhir_stack, _menhir_s, _v) in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState291 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_254 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 291)
        | Tokens.RIGHT_BRACKET ->
            let f = _v in
            let _v = _menhir_action_070 f in
            _menhir_goto_fof_tuple_list _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 290
    
    and _menhir_goto_fof_tuple_list : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState291 ->
            _menhir_run_292 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState252 ->
            _menhir_run_288 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_292 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_fof_logic_formula _menhir_cell0_COMMA -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_fof_logic_formula (_menhir_stack, _menhir_s, f) = _menhir_stack in
        let l = _v in
        let _v = _menhir_action_071 f l in
        _menhir_goto_fof_tuple_list _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_288 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LEFT_BRACKET -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (l, _endpos__3_) = (_v, _endpos) in
        let _v = _menhir_action_069 l in
        _menhir_goto_fof_tuple _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_goto_fof_tuple : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState294 ->
            _menhir_run_295 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState605 ->
            _menhir_run_293 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState569 ->
            _menhir_run_293 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState536 ->
            _menhir_run_293 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState010 ->
            _menhir_run_293 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState449 ->
            _menhir_run_293 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState251 ->
            _menhir_run_293 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_295 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_fof_tuple -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_fof_tuple (_menhir_stack, _menhir_s, hyp, _startpos_hyp_, _) = _menhir_stack in
        let (_endpos_goal_, goal) = (_endpos, _v) in
        let _v = _menhir_action_066 _endpos_goal_ _startpos_hyp_ goal hyp in
        _menhir_goto_fof_sequent _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_fof_sequent : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState605 ->
            _menhir_run_450 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState569 ->
            _menhir_run_450 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState536 ->
            _menhir_run_450 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState010 ->
            _menhir_run_450 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState449 ->
            _menhir_run_450 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState251 ->
            _menhir_run_296 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_450 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let f = _v in
        let _v = _menhir_action_060 f in
        _menhir_goto_fof_formula _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_296 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LEFT_PAREN -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s, _) = _menhir_stack in
            let t = _v in
            let _v = _menhir_action_067 t in
            _menhir_goto_fof_sequent _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 296
    
    and _menhir_run_293 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_fof_tuple (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.GENTZEN_ARROW ->
            let _menhir_s = MenhirState294 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.LEFT_BRACKET ->
                _menhir_run_252 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 294)
        | _ ->
            _eRR 293
    
    and _menhir_run_252 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState252
        | Tokens.SINGLE_QUOTED _v ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState252
        | Tokens.RIGHT_BRACKET ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let (_startpos__1_, _endpos__2_) = (_startpos, _endpos) in
            let _v = _menhir_action_068 () in
            _menhir_goto_fof_tuple _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__2_ _startpos__1_ _v _menhir_s _tok
        | Tokens.REAL _v ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState252
        | Tokens.RATIONAL _v ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState252
        | Tokens.NOT ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState252
        | Tokens.LOWER_WORD _v ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState252
        | Tokens.LET_TT ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState252
        | Tokens.LET_FT ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState252
        | Tokens.LEFT_PAREN ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_254 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState252
        | Tokens.ITE_T ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState252
        | Tokens.INTEGER _v ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState252
        | Tokens.FORALL ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState252
        | Tokens.EXISTS ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState252
        | Tokens.DOLLAR_WORD _v ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState252
        | Tokens.DOLLAR_DOLLAR_WORD _v ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState252
        | Tokens.DISTINCT_OBJECT _v ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState252
        | _ ->
            _eRR 252
    
    and _menhir_run_280 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LEFT_PAREN -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (f, _endpos__3_) = (_v, _endpos) in
            let _v = _menhir_action_077 f in
            _menhir_goto_fof_unitary_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
        | _ ->
            _eRR 280
    
    and _menhir_run_279 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_fof_or_formula _menhir_cell0_VLINE -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell0_VLINE (_menhir_stack, _startpos__2_, _endpos__2_) = _menhir_stack in
        let MenhirCell1_fof_or_formula (_menhir_stack, _menhir_s, f, _startpos_f_) = _menhir_stack in
        let (_endpos_g_, g) = (_endpos, _v) in
        let _v = _menhir_action_064 _endpos__2_ _endpos_g_ _startpos__2_ _startpos_f_ f g in
        _menhir_goto_fof_or_formula _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_f_ _v _menhir_s _tok
    
    and _menhir_goto_fof_or_formula : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.VLINE ->
            let _menhir_stack = MenhirCell1_fof_or_formula (_menhir_stack, _menhir_s, _v, _startpos) in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell0_VLINE (_menhir_stack, _startpos, _endpos) in
            let _menhir_s = MenhirState278 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_254 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 278)
        | Tokens.COMMA | Tokens.RIGHT_BRACKET | Tokens.RIGHT_PAREN ->
            let f = _v in
            let _v = _menhir_action_054 f in
            _menhir_goto_fof_binary_assoc _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 277
    
    and _menhir_run_276 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_fof_unitary_formula, ttv_result) _menhir_cell1_binary_connective -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_binary_connective (_menhir_stack, _, c, _, _) = _menhir_stack in
        let MenhirCell1_fof_unitary_formula (_menhir_stack, _menhir_s, f, _startpos_f_, _) = _menhir_stack in
        let (_endpos_g_, g) = (_endpos, _v) in
        let _v = _menhir_action_058 _endpos_g_ _startpos_f_ c f g in
        let f = _v in
        let _v = _menhir_action_056 f in
        _menhir_goto_fof_binary_formula _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_274 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_fof_unitary_formula, ttv_result) _menhir_cell1_AND -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_AND (_menhir_stack, _, _startpos__2_, _endpos__2_) = _menhir_stack in
        let MenhirCell1_fof_unitary_formula (_menhir_stack, _menhir_s, f, _startpos_f_, _) = _menhir_stack in
        let (_endpos_g_, g) = (_endpos, _v) in
        let _v = _menhir_action_051 _endpos__2_ _endpos_g_ _startpos__2_ _startpos_f_ f g in
        _menhir_goto_fof_and_formula _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_f_ _v _menhir_s _tok
    
    and _menhir_run_272 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_fof_unitary_formula, ttv_result) _menhir_cell1_VLINE -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_VLINE (_menhir_stack, _, _startpos__2_, _endpos__2_) = _menhir_stack in
        let MenhirCell1_fof_unitary_formula (_menhir_stack, _menhir_s, f, _startpos_f_, _) = _menhir_stack in
        let (_endpos_g_, g) = (_endpos, _v) in
        let _v = _menhir_action_063 _endpos__2_ _endpos_g_ _startpos__2_ _startpos_f_ f g in
        _menhir_goto_fof_or_formula _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_f_ _v _menhir_s _tok
    
    and _menhir_run_270 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            let _menhir_stack = MenhirCell1_fof_unitary_formula (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState270
        | Tokens.VLINE ->
            let _menhir_stack = MenhirCell1_fof_unitary_formula (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState270 in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell1_VLINE (_menhir_stack, _menhir_s, _startpos, _endpos) in
            let _menhir_s = MenhirState271 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_254 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 271)
        | Tokens.NOTVLINE ->
            let _menhir_stack = MenhirCell1_fof_unitary_formula (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState270
        | Tokens.NOTAND ->
            let _menhir_stack = MenhirCell1_fof_unitary_formula (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState270
        | Tokens.LEFT_IMPLY ->
            let _menhir_stack = MenhirCell1_fof_unitary_formula (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState270
        | Tokens.IMPLY ->
            let _menhir_stack = MenhirCell1_fof_unitary_formula (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState270
        | Tokens.EQUIV ->
            let _menhir_stack = MenhirCell1_fof_unitary_formula (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState270
        | Tokens.AND ->
            let _menhir_stack = MenhirCell1_fof_unitary_formula (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState270 in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell1_AND (_menhir_stack, _menhir_s, _startpos, _endpos) in
            let _menhir_s = MenhirState273 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_254 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 273)
        | Tokens.COMMA | Tokens.RIGHT_BRACKET | Tokens.RIGHT_PAREN ->
            let f = _v in
            let _v = _menhir_action_062 f in
            _menhir_goto_fof_logic_formula _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 270
    
    and _menhir_run_269 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_unary_connective -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_unary_connective (_menhir_stack, _menhir_s, c, _startpos_c_, _) = _menhir_stack in
        let (_endpos_f_, f) = (_endpos, _v) in
        let _v = _menhir_action_072 _endpos_f_ _startpos_c_ c f in
        _menhir_goto_fof_unary_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _startpos_c_ _v _menhir_s _tok
    
    and _menhir_goto_fof_unary_formula : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_f_, _startpos_f_, f) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_075 f in
        _menhir_goto_fof_unitary_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _startpos_f_ _v _menhir_s _tok
    
    and _menhir_run_265 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_fol_quantifier _menhir_cell0_LEFT_BRACKET, ttv_result) _menhir_cell1_fof_variable_list _menhir_cell0_RIGHT_BRACKET -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell0_RIGHT_BRACKET (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_fof_variable_list (_menhir_stack, _, l) = _menhir_stack in
        let MenhirCell0_LEFT_BRACKET (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_fol_quantifier (_menhir_stack, _menhir_s, q, _startpos_q_) = _menhir_stack in
        let (_endpos_f_, f) = (_endpos, _v) in
        let _v = _menhir_action_065 _endpos_f_ _startpos_q_ f l q in
        let (_endpos, _startpos) = (_endpos_f_, _startpos_q_) in
        let (_endpos_f_, _startpos_f_, f) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_074 f in
        _menhir_goto_fof_unitary_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _startpos_f_ _v _menhir_s _tok
    
    and _menhir_run_145 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_f_, _startpos_f_, f) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_200 f in
        _menhir_goto_tff_unitary_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _startpos_f_ _v _menhir_s _tok
    
    and _menhir_goto_tff_unitary_formula : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState121 ->
            _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState172 ->
            _menhir_run_173 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState160 ->
            _menhir_run_161 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState157 ->
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState155 ->
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState148 ->
            _menhir_run_149 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState589 ->
            _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState512 ->
            _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState441 ->
            _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState023 ->
            _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState097 ->
            _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState178 ->
            _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState179 ->
            _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState185 ->
            _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState180 ->
            _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState122 ->
            _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState165 ->
            _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState163 ->
            _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState124 ->
            _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState142 ->
            _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState128 ->
            _menhir_run_129 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_176 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_atomic_formula _menhir_cell0_EQUIV -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell0_EQUIV (_menhir_stack, _startpos__2_, _endpos__2_) = _menhir_stack in
        let MenhirCell1_atomic_formula (_menhir_stack, _menhir_s, t, _startpos_t_, _) = _menhir_stack in
        let (_endpos_u_, u) = (_endpos, _v) in
        let _v = _menhir_action_164 _endpos__2_ _endpos_u_ _startpos__2_ _startpos_t_ t u in
        _menhir_goto_tff_let_formula_binding _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_u_ _v _menhir_s _tok
    
    and _menhir_goto_tff_let_formula_binding : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState021 ->
            _menhir_run_241 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState020 ->
            _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState099 ->
            _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState104 ->
            _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_241 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LEFT_PAREN -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s, _) = _menhir_stack in
            let (t, _endpos__3_) = (_v, _endpos_0) in
            let _v = _menhir_action_165 t in
            _menhir_goto_tff_let_formula_binding _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _v _menhir_s _tok
        | _ ->
            _eRR 241
    
    and _menhir_run_106 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        let (_endpos_t_, t) = (_endpos, _v) in
        let _v = _menhir_action_167 t in
        _menhir_goto_tff_let_formula_defn _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _v _menhir_s _tok
    
    and _menhir_goto_tff_let_formula_defn : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState020 ->
            _menhir_run_243 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState099 ->
            _menhir_run_177 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState104 ->
            _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_243 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LET_FT _menhir_cell0_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_tff_let_formula_defn (_menhir_stack, _menhir_s, _v, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState244 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 244)
        | _ ->
            _eRR 243
    
    and _menhir_run_177 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LET_FF _menhir_cell0_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_tff_let_formula_defn (_menhir_stack, _menhir_s, _v, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState178 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_TF ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FF ->
                _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_179 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_BRACKET ->
                _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_F ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 178)
        | _ ->
            _eRR 177
    
    and _menhir_run_024 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_LET_TF (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_PAREN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_LEFT_PAREN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState025 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 25)
        | _ ->
            _eRR 24
    
    and _menhir_run_026 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState026 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.SINGLE_QUOTED _v ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.REAL _v ->
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.RATIONAL _v ->
            _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LET_TT ->
            _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET_FT ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFT_PAREN ->
            _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ITE_T ->
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DOLLAR_WORD _v ->
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DOLLAR_DOLLAR_WORD _v ->
            _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DISTINCT_OBJECT _v ->
            _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 26
    
    and _menhir_run_072 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_FORALL (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_BRACKET ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_LEFT_BRACKET (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState073 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 73)
        | _ ->
            _eRR 72
    
    and _menhir_run_098 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_LET_FF (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_PAREN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_LEFT_PAREN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState099 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 99)
        | _ ->
            _eRR 98
    
    and _menhir_run_100 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_FORALL (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_BRACKET ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_LEFT_BRACKET (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState101 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 101)
        | _ ->
            _eRR 100
    
    and _menhir_run_179 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState179 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.SINGLE_QUOTED _v ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.REAL _v ->
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.RATIONAL _v ->
            _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LET_TT ->
            _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET_TF ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET_FT ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET_FF ->
            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFT_PAREN ->
            _menhir_run_179 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFT_BRACKET ->
            _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ITE_T ->
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ITE_F ->
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FORALL ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DOLLAR_WORD _v ->
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DOLLAR_DOLLAR_WORD _v ->
            _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DISTINCT_OBJECT _v ->
            _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 179
    
    and _menhir_run_180 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState180
        | Tokens.SINGLE_QUOTED _v ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState180
        | Tokens.RIGHT_BRACKET ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let (_startpos__1_, _endpos__2_) = (_startpos, _endpos) in
            let _v = _menhir_action_187 () in
            _menhir_goto_tff_tuple _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__2_ _startpos__1_ _v _menhir_s _tok
        | Tokens.REAL _v ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState180
        | Tokens.RATIONAL _v ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState180
        | Tokens.NOT ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState180
        | Tokens.LOWER_WORD _v ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState180
        | Tokens.LET_TT ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState180
        | Tokens.LET_TF ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState180
        | Tokens.LET_FT ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState180
        | Tokens.LET_FF ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState180
        | Tokens.LEFT_PAREN ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState180
        | Tokens.ITE_T ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState180
        | Tokens.ITE_F ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState180
        | Tokens.INTEGER _v ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState180
        | Tokens.FORALL ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState180
        | Tokens.EXISTS ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState180
        | Tokens.DOLLAR_WORD _v ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState180
        | Tokens.DOLLAR_DOLLAR_WORD _v ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState180
        | Tokens.DISTINCT_OBJECT _v ->
            let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos) in
            _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState180
        | _ ->
            _eRR 180
    
    and _menhir_goto_tff_tuple : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState223 ->
            _menhir_run_224 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState589 ->
            _menhir_run_222 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState512 ->
            _menhir_run_222 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState441 ->
            _menhir_run_222 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState097 ->
            _menhir_run_222 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState178 ->
            _menhir_run_222 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState179 ->
            _menhir_run_222 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_224 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_tff_tuple -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_tff_tuple (_menhir_stack, _menhir_s, hyp, _startpos_hyp_, _) = _menhir_stack in
        let (_endpos_goal_, goal) = (_endpos, _v) in
        let _v = _menhir_action_181 _endpos_goal_ _startpos_hyp_ goal hyp in
        _menhir_goto_tff_sequent _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_tff_sequent : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState589 ->
            _menhir_run_229 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState512 ->
            _menhir_run_229 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState441 ->
            _menhir_run_229 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState097 ->
            _menhir_run_229 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState178 ->
            _menhir_run_229 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState179 ->
            _menhir_run_225 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_229 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let f = _v in
        let _v = _menhir_action_161 f in
        _menhir_goto_tff_formula _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_225 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LEFT_PAREN -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s, _) = _menhir_stack in
            let t = _v in
            let _v = _menhir_action_182 t in
            _menhir_goto_tff_sequent _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 225
    
    and _menhir_run_222 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_tff_tuple (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.GENTZEN_ARROW ->
            let _menhir_s = MenhirState223 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.LEFT_BRACKET ->
                _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 223)
        | _ ->
            _eRR 222
    
    and _menhir_run_122 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState122 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.SINGLE_QUOTED _v ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.REAL _v ->
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.RATIONAL _v ->
            _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LET_TT ->
            _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET_TF ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET_FT ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET_FF ->
            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFT_PAREN ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ITE_T ->
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ITE_F ->
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FORALL ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DOLLAR_WORD _v ->
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DOLLAR_DOLLAR_WORD _v ->
            _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DISTINCT_OBJECT _v ->
            _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 122
    
    and _menhir_run_123 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_ITE_F (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_PAREN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_LEFT_PAREN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState124 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_TF ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FF ->
                _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_F ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 124)
        | _ ->
            _eRR 123
    
    and _menhir_run_105 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_FORALL _menhir_cell0_LEFT_BRACKET, ttv_result) _menhir_cell1_tff_variable_list _menhir_cell0_RIGHT_BRACKET -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell0_RIGHT_BRACKET (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_tff_variable_list (_menhir_stack, _, l) = _menhir_stack in
        let MenhirCell0_LEFT_BRACKET (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_FORALL (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos_t_, t) = (_endpos, _v) in
        let _v = _menhir_action_166 _endpos_t_ _startpos__1_ l t in
        _menhir_goto_tff_let_formula_defn _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _v _menhir_s _tok
    
    and _menhir_run_173 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_tff_and_formula _menhir_cell0_AND -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell0_AND (_menhir_stack, _startpos__2_, _endpos__2_) = _menhir_stack in
        let MenhirCell1_tff_and_formula (_menhir_stack, _menhir_s, f, _startpos_f_) = _menhir_stack in
        let (_endpos_g_, g) = (_endpos, _v) in
        let _v = _menhir_action_147 _endpos__2_ _endpos_g_ _startpos__2_ _startpos_f_ f g in
        _menhir_goto_tff_and_formula _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_f_ _v _menhir_s _tok
    
    and _menhir_goto_tff_and_formula : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.AND ->
            let _menhir_stack = MenhirCell1_tff_and_formula (_menhir_stack, _menhir_s, _v, _startpos) in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell0_AND (_menhir_stack, _startpos, _endpos) in
            let _menhir_s = MenhirState172 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_TF ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FF ->
                _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_F ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 172)
        | Tokens.COMMA | Tokens.RIGHT_BRACKET | Tokens.RIGHT_PAREN ->
            let f = _v in
            let _v = _menhir_action_154 f in
            _menhir_goto_tff_binary_assoc _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 171
    
    and _menhir_goto_tff_binary_assoc : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let f = _v in
        let _v = _menhir_action_156 f in
        _menhir_goto_tff_binary_formula _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_tff_binary_formula : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let f = _v in
        let _v = _menhir_action_172 f in
        _menhir_goto_tff_logic_formula _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_tff_logic_formula : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState023 ->
            _menhir_run_235 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState589 ->
            _menhir_run_230 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState512 ->
            _menhir_run_230 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState441 ->
            _menhir_run_230 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState097 ->
            _menhir_run_230 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState178 ->
            _menhir_run_230 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState185 ->
            _menhir_run_184 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState180 ->
            _menhir_run_184 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState179 ->
            _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState122 ->
            _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState165 ->
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState163 ->
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState124 ->
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_235 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_ITE_T _menhir_cell0_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_tff_logic_formula (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState236 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 236)
        | _ ->
            _eRR 235
    
    and _menhir_run_230 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let f = _v in
        let _v = _menhir_action_159 f in
        _menhir_goto_tff_formula _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_184 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _menhir_stack = MenhirCell1_tff_logic_formula (_menhir_stack, _menhir_s, _v) in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState185 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_TF ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FF ->
                _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_F ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 185)
        | Tokens.RIGHT_BRACKET ->
            let f = _v in
            let _v = _menhir_action_189 f in
            _menhir_goto_tff_tuple_list _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 184
    
    and _menhir_goto_tff_tuple_list : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState185 ->
            _menhir_run_186 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState180 ->
            _menhir_run_182 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_186 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_tff_logic_formula _menhir_cell0_COMMA -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_tff_logic_formula (_menhir_stack, _menhir_s, f) = _menhir_stack in
        let l = _v in
        let _v = _menhir_action_190 f l in
        _menhir_goto_tff_tuple_list _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_182 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LEFT_BRACKET -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (l, _endpos__3_) = (_v, _endpos) in
        let _v = _menhir_action_188 l in
        _menhir_goto_tff_tuple _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_174 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LEFT_PAREN -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (f, _endpos__3_) = (_v, _endpos) in
            let _v = _menhir_action_203 f in
            _menhir_goto_tff_unitary_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
        | _ ->
            _eRR 174
    
    and _menhir_run_166 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_ITE_F _menhir_cell0_LEFT_PAREN, ttv_result) _menhir_cell1_tff_logic_formula _menhir_cell0_COMMA, ttv_result) _menhir_cell1_tff_logic_formula _menhir_cell0_COMMA -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_tff_logic_formula (_menhir_stack, _, if_then) = _menhir_stack in
            let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_tff_logic_formula (_menhir_stack, _, cond) = _menhir_stack in
            let MenhirCell0_LEFT_PAREN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_ITE_F (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__8_, if_else) = (_endpos, _v) in
            let _v = _menhir_action_158 _endpos__8_ _startpos__1_ cond if_else if_then in
            let (_endpos, _startpos) = (_endpos__8_, _startpos__1_) in
            let (_endpos_f_, _startpos_f_, f) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_201 f in
            _menhir_goto_tff_unitary_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _startpos_f_ _v _menhir_s _tok
        | _ ->
            _eRR 166
    
    and _menhir_run_164 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_ITE_F _menhir_cell0_LEFT_PAREN, ttv_result) _menhir_cell1_tff_logic_formula _menhir_cell0_COMMA as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_tff_logic_formula (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState165 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_TF ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FF ->
                _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_F ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 165)
        | _ ->
            _eRR 164
    
    and _menhir_run_162 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_ITE_F _menhir_cell0_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_tff_logic_formula (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState163 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_TF ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FF ->
                _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_F ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 163)
        | _ ->
            _eRR 162
    
    and _menhir_run_161 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_tff_or_formula _menhir_cell0_VLINE -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell0_VLINE (_menhir_stack, _startpos__2_, _endpos__2_) = _menhir_stack in
        let MenhirCell1_tff_or_formula (_menhir_stack, _menhir_s, f, _startpos_f_) = _menhir_stack in
        let (_endpos_g_, g) = (_endpos, _v) in
        let _v = _menhir_action_178 _endpos__2_ _endpos_g_ _startpos__2_ _startpos_f_ f g in
        _menhir_goto_tff_or_formula _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_f_ _v _menhir_s _tok
    
    and _menhir_goto_tff_or_formula : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.VLINE ->
            let _menhir_stack = MenhirCell1_tff_or_formula (_menhir_stack, _menhir_s, _v, _startpos) in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell0_VLINE (_menhir_stack, _startpos, _endpos) in
            let _menhir_s = MenhirState160 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_TF ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FF ->
                _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_F ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 160)
        | Tokens.COMMA | Tokens.RIGHT_BRACKET | Tokens.RIGHT_PAREN ->
            let f = _v in
            let _v = _menhir_action_153 f in
            _menhir_goto_tff_binary_assoc _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 159
    
    and _menhir_run_158 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_tff_unitary_formula, ttv_result) _menhir_cell1_binary_connective -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_binary_connective (_menhir_stack, _, c, _, _) = _menhir_stack in
        let MenhirCell1_tff_unitary_formula (_menhir_stack, _menhir_s, f, _startpos_f_, _) = _menhir_stack in
        let (_endpos_g_, g) = (_endpos, _v) in
        let _v = _menhir_action_157 _endpos_g_ _startpos_f_ c f g in
        let f = _v in
        let _v = _menhir_action_155 f in
        _menhir_goto_tff_binary_formula _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_156 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_tff_unitary_formula, ttv_result) _menhir_cell1_AND -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_AND (_menhir_stack, _, _startpos__2_, _endpos__2_) = _menhir_stack in
        let MenhirCell1_tff_unitary_formula (_menhir_stack, _menhir_s, f, _startpos_f_, _) = _menhir_stack in
        let (_endpos_g_, g) = (_endpos, _v) in
        let _v = _menhir_action_146 _endpos__2_ _endpos_g_ _startpos__2_ _startpos_f_ f g in
        _menhir_goto_tff_and_formula _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_f_ _v _menhir_s _tok
    
    and _menhir_run_149 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_tff_unitary_formula, ttv_result) _menhir_cell1_VLINE -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_VLINE (_menhir_stack, _, _startpos__2_, _endpos__2_) = _menhir_stack in
        let MenhirCell1_tff_unitary_formula (_menhir_stack, _menhir_s, f, _startpos_f_, _) = _menhir_stack in
        let (_endpos_g_, g) = (_endpos, _v) in
        let _v = _menhir_action_177 _endpos__2_ _endpos_g_ _startpos__2_ _startpos_f_ f g in
        _menhir_goto_tff_or_formula _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_f_ _v _menhir_s _tok
    
    and _menhir_run_146 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            let _menhir_stack = MenhirCell1_tff_unitary_formula (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState146
        | Tokens.VLINE ->
            let _menhir_stack = MenhirCell1_tff_unitary_formula (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState146 in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell1_VLINE (_menhir_stack, _menhir_s, _startpos, _endpos) in
            let _menhir_s = MenhirState148 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_TF ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FF ->
                _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_F ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 148)
        | Tokens.NOTVLINE ->
            let _menhir_stack = MenhirCell1_tff_unitary_formula (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState146
        | Tokens.NOTAND ->
            let _menhir_stack = MenhirCell1_tff_unitary_formula (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState146
        | Tokens.LEFT_IMPLY ->
            let _menhir_stack = MenhirCell1_tff_unitary_formula (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState146
        | Tokens.IMPLY ->
            let _menhir_stack = MenhirCell1_tff_unitary_formula (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState146
        | Tokens.EQUIV ->
            let _menhir_stack = MenhirCell1_tff_unitary_formula (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState146
        | Tokens.AND ->
            let _menhir_stack = MenhirCell1_tff_unitary_formula (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState146 in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell1_AND (_menhir_stack, _menhir_s, _startpos, _endpos) in
            let _menhir_s = MenhirState155 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_TF ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FF ->
                _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_F ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 155)
        | Tokens.COMMA | Tokens.RIGHT_BRACKET | Tokens.RIGHT_PAREN ->
            let f = _v in
            let _v = _menhir_action_173 f in
            _menhir_goto_tff_logic_formula _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 146
    
    and _menhir_run_143 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_fol_quantifier _menhir_cell0_LEFT_BRACKET, ttv_result) _menhir_cell1_tff_variable_list _menhir_cell0_RIGHT_BRACKET -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell0_RIGHT_BRACKET (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_tff_variable_list (_menhir_stack, _, l) = _menhir_stack in
        let MenhirCell0_LEFT_BRACKET (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_fol_quantifier (_menhir_stack, _menhir_s, q, _startpos_q_) = _menhir_stack in
        let (_endpos_f_, f) = (_endpos, _v) in
        let _v = _menhir_action_179 _endpos_f_ _startpos_q_ f l q in
        let (_endpos, _startpos) = (_endpos_f_, _startpos_q_) in
        let (_endpos_f_, _startpos_f_, f) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_198 f in
        _menhir_goto_tff_unitary_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _startpos_f_ _v _menhir_s _tok
    
    and _menhir_run_129 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_unary_connective -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_unary_connective (_menhir_stack, _menhir_s, u, _startpos_u_, _) = _menhir_stack in
        let (_endpos_f_, f) = (_endpos, _v) in
        let _v = _menhir_action_196 _endpos_f_ _startpos_u_ f u in
        _menhir_goto_tff_unary_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _startpos_u_ _v _menhir_s _tok
    
    and _menhir_goto_tff_unary_formula : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_f_, _startpos_f_, f) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_199 f in
        _menhir_goto_tff_unitary_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _startpos_f_ _v _menhir_s _tok
    
    and _menhir_run_120 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_atomic_formula (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.EQUIV ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell0_EQUIV (_menhir_stack, _startpos, _endpos) in
            let _menhir_s = MenhirState121 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_TF ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FF ->
                _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_F ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 121)
        | _ ->
            _eRR 120
    
    and _menhir_run_036 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_093 t in
        _menhir_goto_function_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _startpos_t_ _v _menhir_s _tok
    
    and _menhir_goto_tff_untyped_atom : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s ->
        let _menhir_stack = MenhirCell1_tff_untyped_atom (_menhir_stack, _menhir_s, _v, _startpos) in
        let _menhir_s = MenhirState189 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.SINGLE_QUOTED _v ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LEFT_PAREN ->
            _menhir_run_190 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FORALL_TY ->
            _menhir_run_191 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DOLLAR_WORD _v ->
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 189
    
    and _menhir_run_190 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState190 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.SINGLE_QUOTED _v ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LEFT_PAREN ->
            _menhir_run_190 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FORALL_TY ->
            _menhir_run_191 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DOLLAR_WORD _v ->
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 190
    
    and _menhir_run_191 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_FORALL_TY (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_BRACKET ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_LEFT_BRACKET (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState192 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 192)
        | _ ->
            _eRR 191
    
    and _menhir_run_037 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_PAREN ->
            let _menhir_stack = MenhirCell1_system_functor (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND | Tokens.APPLY | Tokens.ARROW | Tokens.COLON | Tokens.COMMA | Tokens.EQUAL | Tokens.EQUIV | Tokens.IMPLY | Tokens.LEFT_IMPLY | Tokens.NOTAND | Tokens.NOTVLINE | Tokens.NOT_EQUAL | Tokens.PLUS | Tokens.RIGHT_BRACKET | Tokens.RIGHT_PAREN | Tokens.STAR | Tokens.VLINE | Tokens.XOR ->
            let (_endpos_f_, _startpos_f_, f) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_138 f in
            _menhir_goto_system_constant _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _startpos_f_ _v _menhir_s _tok
        | _ ->
            _eRR 37
    
    and _menhir_run_329 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_012 _endpos__1_ _startpos__1_ in
        _menhir_goto_assoc_connective _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_344 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_f_, _startpos_f_, f) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_277 f in
        _menhir_goto_thf_unitary_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _startpos_f_ _v _menhir_s _tok
    
    and _menhir_run_320 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LET_FF _menhir_cell0_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let f = _v in
        let _v = _menhir_action_239 f in
        let _menhir_stack = MenhirCell1_thf_let_formula_defn (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState322 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.XOR ->
                _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.VLINE ->
                _menhir_run_304 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SIGMA ->
                _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.PI ->
                _menhir_run_306 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT_EQUAL ->
                _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTVLINE ->
                _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTAND ->
                _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_TF ->
                _menhir_run_307 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FF ->
                _menhir_run_318 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_323 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_IMPLY ->
                _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_BRACKET ->
                _menhir_run_324 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LAMBDA ->
                _menhir_run_309 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_F ->
                _menhir_run_327 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INDEFINITE_DESCRIPTION ->
                _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.IMPLY ->
                _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL_TY ->
                _menhir_run_311 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS_TY ->
                _menhir_run_312 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUIV ->
                _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUAL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DEFINITE_DESCRIPTION ->
                _menhir_run_313 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.AND ->
                _menhir_run_329 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 322)
        | _ ->
            _eRR 321
    
    and _menhir_run_385 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_thf_and_formula _menhir_cell0_AND -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell0_AND (_menhir_stack, _startpos__2_, _endpos__2_) = _menhir_stack in
        let MenhirCell1_thf_and_formula (_menhir_stack, _menhir_s, f, _startpos_f_, _) = _menhir_stack in
        let (_endpos_g_, g) = (_endpos, _v) in
        let _v = _menhir_action_215 _endpos__2_ _endpos_g_ _startpos__2_ _startpos_f_ f g in
        _menhir_goto_thf_and_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_g_ _startpos_f_ _v _menhir_s _tok
    
    and _menhir_goto_thf_and_formula : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.AND ->
            let _menhir_stack = MenhirCell1_thf_and_formula (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell0_AND (_menhir_stack, _startpos, _endpos) in
            let _menhir_s = MenhirState384 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.XOR ->
                _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.VLINE ->
                _menhir_run_304 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SIGMA ->
                _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.PI ->
                _menhir_run_306 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT_EQUAL ->
                _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTVLINE ->
                _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTAND ->
                _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_TF ->
                _menhir_run_307 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FF ->
                _menhir_run_318 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_333 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_IMPLY ->
                _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LAMBDA ->
                _menhir_run_309 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_F ->
                _menhir_run_327 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INDEFINITE_DESCRIPTION ->
                _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.IMPLY ->
                _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL_TY ->
                _menhir_run_311 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS_TY ->
                _menhir_run_312 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUIV ->
                _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUAL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DEFINITE_DESCRIPTION ->
                _menhir_run_313 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.AND ->
                _menhir_run_329 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 384)
        | Tokens.COMMA | Tokens.RIGHT_BRACKET | Tokens.RIGHT_PAREN ->
            let (_endpos_f_, f) = (_endpos, _v) in
            let _v = _menhir_action_226 f in
            _menhir_goto_thf_binary_tuple _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _v _menhir_s _tok
        | _ ->
            _eRR 383
    
    and _menhir_run_333 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState333 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.VLINE ->
            _menhir_run_304 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.UPPER_WORD _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.SINGLE_QUOTED _v ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.SIGMA ->
            _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.REAL _v ->
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.RATIONAL _v ->
            _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.PI ->
            _menhir_run_306 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.NOT_EQUAL ->
            _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.NOTVLINE ->
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.NOTAND ->
            _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.NOT ->
            _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LET_TT ->
            _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET_TF ->
            _menhir_run_307 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET_FT ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET_FF ->
            _menhir_run_318 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFT_PAREN ->
            _menhir_run_326 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFT_IMPLY ->
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LAMBDA ->
            _menhir_run_309 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ITE_T ->
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ITE_F ->
            _menhir_run_327 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.INDEFINITE_DESCRIPTION ->
            _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.IMPLY ->
            _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FORALL_TY ->
            _menhir_run_311 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FORALL ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS_TY ->
            _menhir_run_312 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EQUIV ->
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EQUAL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DOLLAR_WORD _v ->
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DOLLAR_DOLLAR_WORD _v ->
            _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DISTINCT_OBJECT _v ->
            _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DEFINITE_DESCRIPTION ->
            _menhir_run_313 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.AND ->
            _menhir_run_329 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 333
    
    and _menhir_goto_thf_binary_tuple : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        let (_endpos_f_, f) = (_endpos, _v) in
        let _v = _menhir_action_222 f in
        _menhir_goto_thf_binary_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _v _menhir_s _tok
    
    and _menhir_goto_thf_binary_formula : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        let (_endpos_f_, f) = (_endpos, _v) in
        let _v = _menhir_action_241 f in
        _menhir_goto_thf_logic_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _v _menhir_s _tok
    
    and _menhir_goto_thf_logic_formula : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState579 ->
            _menhir_run_421 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState502 ->
            _menhir_run_421 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState303 ->
            _menhir_run_421 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState435 ->
            _menhir_run_421 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState322 ->
            _menhir_run_421 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState413 ->
            _menhir_run_412 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState324 ->
            _menhir_run_412 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState323 ->
            _menhir_run_408 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState326 ->
            _menhir_run_408 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState405 ->
            _menhir_run_406 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState403 ->
            _menhir_run_404 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState328 ->
            _menhir_run_402 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState333 ->
            _menhir_run_399 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState340 ->
            _menhir_run_392 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState317 ->
            _menhir_run_374 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState366 ->
            _menhir_run_374 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_421 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let f = _v in
        let _v = _menhir_action_236 f in
        _menhir_goto_thf_formula _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_412 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _menhir_stack = MenhirCell1_thf_logic_formula (_menhir_stack, _menhir_s, _v, _endpos) in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState413 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.XOR ->
                _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.VLINE ->
                _menhir_run_304 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SIGMA ->
                _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.PI ->
                _menhir_run_306 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT_EQUAL ->
                _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTVLINE ->
                _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTAND ->
                _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_TF ->
                _menhir_run_307 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FF ->
                _menhir_run_318 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_326 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_IMPLY ->
                _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LAMBDA ->
                _menhir_run_309 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_F ->
                _menhir_run_327 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INDEFINITE_DESCRIPTION ->
                _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.IMPLY ->
                _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL_TY ->
                _menhir_run_311 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS_TY ->
                _menhir_run_312 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUIV ->
                _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUAL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DEFINITE_DESCRIPTION ->
                _menhir_run_313 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.AND ->
                _menhir_run_329 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 413)
        | Tokens.RIGHT_BRACKET ->
            let f = _v in
            let _v = _menhir_action_265 f in
            _menhir_goto_thf_tuple_list _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 412
    
    and _menhir_goto_thf_tuple_list : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState413 ->
            _menhir_run_414 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState324 ->
            _menhir_run_410 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_414 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_thf_logic_formula _menhir_cell0_COMMA -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_thf_logic_formula (_menhir_stack, _menhir_s, f, _) = _menhir_stack in
        let l = _v in
        let _v = _menhir_action_266 f l in
        _menhir_goto_thf_tuple_list _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_410 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LEFT_BRACKET -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (l, _endpos__3_) = (_v, _endpos) in
        let _v = _menhir_action_264 l in
        _menhir_goto_thf_tuple _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_408 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LEFT_PAREN -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.COLON ->
                let MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
                let f = _v in
                let _v = _menhir_action_269 f in
                _menhir_goto_thf_typeable_formula _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s
            | Tokens.AND | Tokens.APPLY | Tokens.ARROW | Tokens.COMMA | Tokens.EQUAL | Tokens.EQUIV | Tokens.IMPLY | Tokens.LEFT_IMPLY | Tokens.NOTAND | Tokens.NOTVLINE | Tokens.NOT_EQUAL | Tokens.PLUS | Tokens.RIGHT_BRACKET | Tokens.RIGHT_PAREN | Tokens.STAR | Tokens.VLINE | Tokens.XOR ->
                let MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
                let (f, _endpos__3_) = (_v, _endpos_0) in
                let _v = _menhir_action_282 f in
                _menhir_goto_thf_unitary_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
            | _ ->
                _eRR 409)
        | _ ->
            _eRR 408
    
    and _menhir_run_406 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_ITE_F _menhir_cell0_LEFT_PAREN, ttv_result) _menhir_cell1_thf_logic_formula _menhir_cell0_COMMA, ttv_result) _menhir_cell1_thf_logic_formula _menhir_cell0_COMMA -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_thf_logic_formula (_menhir_stack, _, if_then, _) = _menhir_stack in
            let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_thf_logic_formula (_menhir_stack, _, cond, _) = _menhir_stack in
            let MenhirCell0_LEFT_PAREN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_ITE_F (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__8_, if_else) = (_endpos_0, _v) in
            let _v = _menhir_action_231 _endpos__8_ _startpos__1_ cond if_else if_then in
            let (_endpos, _startpos) = (_endpos__8_, _startpos__1_) in
            let (_endpos_f_, _startpos_f_, f) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_280 f in
            _menhir_goto_thf_unitary_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _startpos_f_ _v _menhir_s _tok
        | _ ->
            _eRR 406
    
    and _menhir_run_404 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_ITE_F _menhir_cell0_LEFT_PAREN, ttv_result) _menhir_cell1_thf_logic_formula _menhir_cell0_COMMA as 'stack) -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_thf_logic_formula (_menhir_stack, _menhir_s, _v, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState405 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.XOR ->
                _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.VLINE ->
                _menhir_run_304 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SIGMA ->
                _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.PI ->
                _menhir_run_306 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT_EQUAL ->
                _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTVLINE ->
                _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTAND ->
                _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_TF ->
                _menhir_run_307 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FF ->
                _menhir_run_318 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_326 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_IMPLY ->
                _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LAMBDA ->
                _menhir_run_309 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_F ->
                _menhir_run_327 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INDEFINITE_DESCRIPTION ->
                _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.IMPLY ->
                _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL_TY ->
                _menhir_run_311 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS_TY ->
                _menhir_run_312 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUIV ->
                _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUAL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DEFINITE_DESCRIPTION ->
                _menhir_run_313 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.AND ->
                _menhir_run_329 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 405)
        | _ ->
            _eRR 404
    
    and _menhir_run_402 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_ITE_F _menhir_cell0_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_thf_logic_formula (_menhir_stack, _menhir_s, _v, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState403 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.XOR ->
                _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.VLINE ->
                _menhir_run_304 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SIGMA ->
                _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.PI ->
                _menhir_run_306 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT_EQUAL ->
                _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTVLINE ->
                _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTAND ->
                _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_TF ->
                _menhir_run_307 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FF ->
                _menhir_run_318 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_326 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_IMPLY ->
                _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LAMBDA ->
                _menhir_run_309 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_F ->
                _menhir_run_327 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INDEFINITE_DESCRIPTION ->
                _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.IMPLY ->
                _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL_TY ->
                _menhir_run_311 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS_TY ->
                _menhir_run_312 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUIV ->
                _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUAL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DEFINITE_DESCRIPTION ->
                _menhir_run_313 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.AND ->
                _menhir_run_329 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 403)
        | _ ->
            _eRR 402
    
    and _menhir_run_399 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LEFT_PAREN -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (f, _endpos__3_) = (_v, _endpos_0) in
            let _v = _menhir_action_282 f in
            _menhir_goto_thf_unitary_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
        | _ ->
            _eRR 399
    
    and _menhir_run_392 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_thf_unary_connective _menhir_cell0_LEFT_PAREN -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_LEFT_PAREN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_thf_unary_connective (_menhir_stack, _menhir_s, c, _startpos_c_, _) = _menhir_stack in
            let (_endpos__4_, f) = (_endpos_0, _v) in
            let _v = _menhir_action_274 _endpos__4_ _startpos_c_ c f in
            let (_endpos, _startpos) = (_endpos__4_, _startpos_c_) in
            let (_endpos_f_, _startpos_f_, f) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_278 f in
            _menhir_goto_thf_unitary_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _startpos_f_ _v _menhir_s _tok
        | _ ->
            _eRR 392
    
    and _menhir_run_374 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        let (_endpos_f_, f) = (_endpos, _v) in
        let _v = _menhir_action_262 f in
        _menhir_goto_thf_top_level_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _v _menhir_s _tok
    
    and _menhir_goto_thf_top_level_type : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState317 ->
            _menhir_run_424 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState366 ->
            _menhir_run_368 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_424 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_variable -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_variable (_menhir_stack, _menhir_s, c, _startpos_c_, _) = _menhir_stack in
        let (_endpos_ty_, ty) = (_endpos, _v) in
        let _v = _menhir_action_270 _endpos_ty_ _startpos_c_ c ty in
        let v = _v in
        let _v = _menhir_action_284 v in
        _menhir_goto_thf_variable _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_thf_variable : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _menhir_stack = MenhirCell1_thf_variable (_menhir_stack, _menhir_s, _v) in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState430 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 430)
        | Tokens.RIGHT_BRACKET ->
            let v = _v in
            let _v = _menhir_action_286 v in
            _menhir_goto_thf_variable_list _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 429
    
    and _menhir_goto_thf_variable_list : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState430 ->
            _menhir_run_431 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState315 ->
            _menhir_run_425 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_431 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_thf_variable _menhir_cell0_COMMA -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_thf_variable (_menhir_stack, _menhir_s, v) = _menhir_stack in
        let l = _v in
        let _v = _menhir_action_287 l v in
        _menhir_goto_thf_variable_list _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_425 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_thf_quantifier _menhir_cell0_LEFT_BRACKET as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_thf_variable_list (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_RIGHT_BRACKET (_menhir_stack, _endpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.COLON ->
            let _menhir_s = MenhirState427 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.XOR ->
                _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.VLINE ->
                _menhir_run_304 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SIGMA ->
                _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.PI ->
                _menhir_run_306 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT_EQUAL ->
                _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTVLINE ->
                _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTAND ->
                _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_TF ->
                _menhir_run_307 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FF ->
                _menhir_run_318 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_333 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_IMPLY ->
                _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LAMBDA ->
                _menhir_run_309 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_F ->
                _menhir_run_327 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INDEFINITE_DESCRIPTION ->
                _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.IMPLY ->
                _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL_TY ->
                _menhir_run_311 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS_TY ->
                _menhir_run_312 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUIV ->
                _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUAL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DEFINITE_DESCRIPTION ->
                _menhir_run_313 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.AND ->
                _menhir_run_329 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 427)
        | _ ->
            _eRR 426
    
    and _menhir_run_368 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_thf_typeable_formula -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_thf_typeable_formula (_menhir_stack, _menhir_s, f, _startpos_f_) = _menhir_stack in
        let (_endpos_ty_, ty) = (_endpos, _v) in
        let _v = _menhir_action_267 _endpos_ty_ _startpos_f_ f ty in
        let _endpos = _endpos_ty_ in
        let (_endpos_f_, f) = (_endpos, _v) in
        let _v = _menhir_action_243 f in
        _menhir_goto_thf_logic_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _v _menhir_s _tok
    
    and _menhir_run_382 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_thf_apply_formula -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_thf_apply_formula (_menhir_stack, _menhir_s, f, _startpos_f_, _) = _menhir_stack in
        let (_endpos_g_, g) = (_endpos, _v) in
        let _v = _menhir_action_218 _endpos_g_ _startpos_f_ f g in
        _menhir_goto_thf_apply_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_g_ _startpos_f_ _v _menhir_s _tok
    
    and _menhir_goto_thf_apply_formula : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.APPLY ->
            let _menhir_stack = MenhirCell1_thf_apply_formula (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState381 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.XOR ->
                _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.VLINE ->
                _menhir_run_304 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SIGMA ->
                _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.PI ->
                _menhir_run_306 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT_EQUAL ->
                _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTVLINE ->
                _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTAND ->
                _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_TF ->
                _menhir_run_307 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FF ->
                _menhir_run_318 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_333 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_IMPLY ->
                _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LAMBDA ->
                _menhir_run_309 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_F ->
                _menhir_run_327 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INDEFINITE_DESCRIPTION ->
                _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.IMPLY ->
                _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL_TY ->
                _menhir_run_311 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS_TY ->
                _menhir_run_312 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUIV ->
                _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUAL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DEFINITE_DESCRIPTION ->
                _menhir_run_313 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.AND ->
                _menhir_run_329 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 381)
        | Tokens.COMMA | Tokens.RIGHT_BRACKET | Tokens.RIGHT_PAREN ->
            let (_endpos_f_, f) = (_endpos, _v) in
            let _v = _menhir_action_227 f in
            _menhir_goto_thf_binary_tuple _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _v _menhir_s _tok
        | _ ->
            _eRR 380
    
    and _menhir_run_372 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_thf_or_formula _menhir_cell0_VLINE -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell0_VLINE (_menhir_stack, _startpos__2_, _endpos__2_) = _menhir_stack in
        let MenhirCell1_thf_or_formula (_menhir_stack, _menhir_s, f, _startpos_f_, _) = _menhir_stack in
        let (_endpos_g_, g) = (_endpos, _v) in
        let _v = _menhir_action_248 _endpos__2_ _endpos_g_ _startpos__2_ _startpos_f_ f g in
        _menhir_goto_thf_or_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_g_ _startpos_f_ _v _menhir_s _tok
    
    and _menhir_goto_thf_or_formula : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.VLINE ->
            let _menhir_stack = MenhirCell1_thf_or_formula (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell0_VLINE (_menhir_stack, _startpos, _endpos) in
            let _menhir_s = MenhirState371 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.XOR ->
                _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.VLINE ->
                _menhir_run_304 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SIGMA ->
                _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.PI ->
                _menhir_run_306 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT_EQUAL ->
                _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTVLINE ->
                _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTAND ->
                _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_TF ->
                _menhir_run_307 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FF ->
                _menhir_run_318 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_333 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_IMPLY ->
                _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LAMBDA ->
                _menhir_run_309 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_F ->
                _menhir_run_327 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INDEFINITE_DESCRIPTION ->
                _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.IMPLY ->
                _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL_TY ->
                _menhir_run_311 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS_TY ->
                _menhir_run_312 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUIV ->
                _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUAL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DEFINITE_DESCRIPTION ->
                _menhir_run_313 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.AND ->
                _menhir_run_329 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 371)
        | Tokens.COMMA | Tokens.RIGHT_BRACKET | Tokens.RIGHT_PAREN ->
            let (_endpos_f_, f) = (_endpos, _v) in
            let _v = _menhir_action_225 f in
            _menhir_goto_thf_binary_tuple _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _v _menhir_s _tok
        | _ ->
            _eRR 370
    
    and _menhir_run_361 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_thf_unitary_formula, ttv_result) _menhir_cell1_thf_pair_connective -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_thf_pair_connective (_menhir_stack, _, c, _, _) = _menhir_stack in
        let MenhirCell1_thf_unitary_formula (_menhir_stack, _menhir_s, f, _startpos_f_, _) = _menhir_stack in
        let (_endpos_g_, g) = (_endpos, _v) in
        let _v = _menhir_action_224 _endpos_g_ _startpos_f_ c f g in
        let _endpos = _endpos_g_ in
        let (_endpos_f_, f) = (_endpos, _v) in
        let _v = _menhir_action_221 f in
        _menhir_goto_thf_binary_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _v _menhir_s _tok
    
    and _menhir_run_359 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_thf_unitary_formula, ttv_result) _menhir_cell1_AND -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_AND (_menhir_stack, _, _startpos__2_, _endpos__2_) = _menhir_stack in
        let MenhirCell1_thf_unitary_formula (_menhir_stack, _menhir_s, f, _startpos_f_, _) = _menhir_stack in
        let (_endpos_g_, g) = (_endpos, _v) in
        let _v = _menhir_action_214 _endpos__2_ _endpos_g_ _startpos__2_ _startpos_f_ f g in
        _menhir_goto_thf_and_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_g_ _startpos_f_ _v _menhir_s _tok
    
    and _menhir_run_357 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_thf_unitary_formula, ttv_result) _menhir_cell1_APPLY -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_APPLY (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_thf_unitary_formula (_menhir_stack, _menhir_s, f, _startpos_f_, _) = _menhir_stack in
        let (_endpos_g_, g) = (_endpos, _v) in
        let _v = _menhir_action_217 _endpos_g_ _startpos_f_ f g in
        _menhir_goto_thf_apply_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_g_ _startpos_f_ _v _menhir_s _tok
    
    and _menhir_run_343 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_thf_unitary_formula, ttv_result) _menhir_cell1_VLINE -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_VLINE (_menhir_stack, _, _startpos__2_, _endpos__2_) = _menhir_stack in
        let MenhirCell1_thf_unitary_formula (_menhir_stack, _menhir_s, f, _startpos_f_, _) = _menhir_stack in
        let (_endpos_g_, g) = (_endpos, _v) in
        let _v = _menhir_action_247 _endpos__2_ _endpos_g_ _startpos__2_ _startpos_f_ f g in
        _menhir_goto_thf_or_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_g_ _startpos_f_ _v _menhir_s _tok
    
    and _menhir_run_341 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            let _menhir_stack = MenhirCell1_thf_unitary_formula (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState341
        | Tokens.VLINE ->
            let _menhir_stack = MenhirCell1_thf_unitary_formula (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState341 in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell1_VLINE (_menhir_stack, _menhir_s, _startpos, _endpos) in
            let _menhir_s = MenhirState342 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.XOR ->
                _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.VLINE ->
                _menhir_run_304 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SIGMA ->
                _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.PI ->
                _menhir_run_306 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT_EQUAL ->
                _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTVLINE ->
                _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTAND ->
                _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_TF ->
                _menhir_run_307 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FF ->
                _menhir_run_318 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_333 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_IMPLY ->
                _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LAMBDA ->
                _menhir_run_309 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_F ->
                _menhir_run_327 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INDEFINITE_DESCRIPTION ->
                _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.IMPLY ->
                _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL_TY ->
                _menhir_run_311 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS_TY ->
                _menhir_run_312 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUIV ->
                _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUAL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DEFINITE_DESCRIPTION ->
                _menhir_run_313 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.AND ->
                _menhir_run_329 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 342)
        | Tokens.NOT_EQUAL ->
            let _menhir_stack = MenhirCell1_thf_unitary_formula (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState341
        | Tokens.NOTVLINE ->
            let _menhir_stack = MenhirCell1_thf_unitary_formula (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState341
        | Tokens.NOTAND ->
            let _menhir_stack = MenhirCell1_thf_unitary_formula (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState341
        | Tokens.LEFT_IMPLY ->
            let _menhir_stack = MenhirCell1_thf_unitary_formula (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState341
        | Tokens.IMPLY ->
            let _menhir_stack = MenhirCell1_thf_unitary_formula (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState341
        | Tokens.EQUIV ->
            let _menhir_stack = MenhirCell1_thf_unitary_formula (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState341
        | Tokens.EQUAL ->
            let _menhir_stack = MenhirCell1_thf_unitary_formula (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState341
        | Tokens.APPLY ->
            let _menhir_stack = MenhirCell1_thf_unitary_formula (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _menhir_stack = MenhirCell1_APPLY (_menhir_stack, MenhirState341) in
            let _menhir_s = MenhirState356 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.XOR ->
                _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.VLINE ->
                _menhir_run_304 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SIGMA ->
                _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.PI ->
                _menhir_run_306 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT_EQUAL ->
                _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTVLINE ->
                _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTAND ->
                _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_TF ->
                _menhir_run_307 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FF ->
                _menhir_run_318 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_333 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_IMPLY ->
                _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LAMBDA ->
                _menhir_run_309 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_F ->
                _menhir_run_327 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INDEFINITE_DESCRIPTION ->
                _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.IMPLY ->
                _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL_TY ->
                _menhir_run_311 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS_TY ->
                _menhir_run_312 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUIV ->
                _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUAL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DEFINITE_DESCRIPTION ->
                _menhir_run_313 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.AND ->
                _menhir_run_329 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 356)
        | Tokens.AND ->
            let _menhir_stack = MenhirCell1_thf_unitary_formula (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState341 in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell1_AND (_menhir_stack, _menhir_s, _startpos, _endpos) in
            let _menhir_s = MenhirState358 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.XOR ->
                _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.VLINE ->
                _menhir_run_304 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SIGMA ->
                _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.PI ->
                _menhir_run_306 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT_EQUAL ->
                _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTVLINE ->
                _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTAND ->
                _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_TF ->
                _menhir_run_307 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FF ->
                _menhir_run_318 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_333 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_IMPLY ->
                _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LAMBDA ->
                _menhir_run_309 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_F ->
                _menhir_run_327 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INDEFINITE_DESCRIPTION ->
                _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.IMPLY ->
                _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL_TY ->
                _menhir_run_311 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS_TY ->
                _menhir_run_312 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUIV ->
                _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUAL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DEFINITE_DESCRIPTION ->
                _menhir_run_313 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.AND ->
                _menhir_run_329 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 358)
        | Tokens.COMMA | Tokens.RIGHT_BRACKET | Tokens.RIGHT_PAREN ->
            let (_endpos_f_, f) = (_endpos, _v) in
            let _v = _menhir_action_242 f in
            _menhir_goto_thf_logic_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _v _menhir_s _tok
        | Tokens.ARROW | Tokens.PLUS | Tokens.STAR ->
            let (_endpos_f_, _startpos_f_, f) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_283 f in
            _menhir_goto_thf_unitary_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _startpos_f_ _v _menhir_s _tok
        | _ ->
            _eRR 341
    
    and _menhir_goto_thf_unitary_type : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState332 ->
            _menhir_run_401 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState396 ->
            _menhir_run_397 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState394 ->
            _menhir_run_395 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState363 ->
            _menhir_run_364 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState335 ->
            _menhir_run_336 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState579 ->
            _menhir_run_334 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState502 ->
            _menhir_run_334 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState303 ->
            _menhir_run_334 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState435 ->
            _menhir_run_334 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState317 ->
            _menhir_run_334 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState322 ->
            _menhir_run_334 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState323 ->
            _menhir_run_334 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState413 ->
            _menhir_run_334 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState324 ->
            _menhir_run_334 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState326 ->
            _menhir_run_334 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState405 ->
            _menhir_run_334 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState403 ->
            _menhir_run_334 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState328 ->
            _menhir_run_334 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState366 ->
            _menhir_run_334 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState340 ->
            _menhir_run_334 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState333 ->
            _menhir_run_334 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_401 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_thf_xprod_type -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_thf_xprod_type (_menhir_stack, _menhir_s, left, _startpos_left_, _) = _menhir_stack in
        let (_endpos_right_, right) = (_endpos, _v) in
        let _v = _menhir_action_289 _endpos_right_ _startpos_left_ left right in
        _menhir_goto_thf_xprod_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_right_ _startpos_left_ _v _menhir_s _tok
    
    and _menhir_goto_thf_xprod_type : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.STAR ->
            let _menhir_stack = MenhirCell1_thf_xprod_type (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState332 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.XOR ->
                _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.VLINE ->
                _menhir_run_304 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SIGMA ->
                _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.PI ->
                _menhir_run_306 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT_EQUAL ->
                _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTVLINE ->
                _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTAND ->
                _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_TF ->
                _menhir_run_307 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FF ->
                _menhir_run_318 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_333 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_IMPLY ->
                _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LAMBDA ->
                _menhir_run_309 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_F ->
                _menhir_run_327 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INDEFINITE_DESCRIPTION ->
                _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.IMPLY ->
                _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL_TY ->
                _menhir_run_311 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS_TY ->
                _menhir_run_312 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUIV ->
                _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUAL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DEFINITE_DESCRIPTION ->
                _menhir_run_313 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.AND ->
                _menhir_run_329 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 332)
        | Tokens.COMMA | Tokens.RIGHT_BRACKET | Tokens.RIGHT_PAREN ->
            let (_endpos_t_, t) = (_endpos, _v) in
            let _v = _menhir_action_229 t in
            _menhir_goto_thf_binary_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _v _menhir_s _tok
        | _ ->
            _eRR 331
    
    and _menhir_goto_thf_binary_type : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        let (_endpos_f_, f) = (_endpos, _v) in
        let _v = _menhir_action_223 f in
        _menhir_goto_thf_binary_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _v _menhir_s _tok
    
    and _menhir_run_397 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_thf_unitary_type as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.ARROW ->
            let _menhir_stack = MenhirCell1_thf_unitary_type (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_396 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.COMMA | Tokens.RIGHT_BRACKET | Tokens.RIGHT_PAREN ->
            let MenhirCell1_thf_unitary_type (_menhir_stack, _menhir_s, arg, _startpos_arg_, _) = _menhir_stack in
            let (_endpos_ret_, ret) = (_endpos, _v) in
            let _v = _menhir_action_245 _endpos_ret_ _startpos_arg_ arg ret in
            _menhir_goto_thf_mapping_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_ret_ _v _menhir_s _tok
        | _ ->
            _eRR 397
    
    and _menhir_run_396 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_thf_unitary_type -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _menhir_s = MenhirState396 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.XOR ->
            _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.VLINE ->
            _menhir_run_304 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.UPPER_WORD _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.SINGLE_QUOTED _v ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.SIGMA ->
            _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.REAL _v ->
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.RATIONAL _v ->
            _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.PI ->
            _menhir_run_306 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.NOT_EQUAL ->
            _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.NOTVLINE ->
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.NOTAND ->
            _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.NOT ->
            _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LET_TT ->
            _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET_TF ->
            _menhir_run_307 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET_FT ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET_FF ->
            _menhir_run_318 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFT_PAREN ->
            _menhir_run_333 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFT_IMPLY ->
            _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LAMBDA ->
            _menhir_run_309 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ITE_T ->
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ITE_F ->
            _menhir_run_327 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.INDEFINITE_DESCRIPTION ->
            _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.IMPLY ->
            _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FORALL_TY ->
            _menhir_run_311 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FORALL ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS_TY ->
            _menhir_run_312 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EQUIV ->
            _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EQUAL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DOLLAR_WORD _v ->
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DOLLAR_DOLLAR_WORD _v ->
            _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DISTINCT_OBJECT _v ->
            _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DEFINITE_DESCRIPTION ->
            _menhir_run_313 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.AND ->
            _menhir_run_329 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 396
    
    and _menhir_goto_thf_mapping_type : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState396 ->
            _menhir_run_398 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState579 ->
            _menhir_run_373 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState502 ->
            _menhir_run_373 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState303 ->
            _menhir_run_373 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState435 ->
            _menhir_run_373 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState317 ->
            _menhir_run_373 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState322 ->
            _menhir_run_373 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState323 ->
            _menhir_run_373 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState413 ->
            _menhir_run_373 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState324 ->
            _menhir_run_373 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState326 ->
            _menhir_run_373 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState405 ->
            _menhir_run_373 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState403 ->
            _menhir_run_373 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState328 ->
            _menhir_run_373 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState333 ->
            _menhir_run_373 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState340 ->
            _menhir_run_373 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState366 ->
            _menhir_run_373 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_398 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_thf_unitary_type -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_thf_unitary_type (_menhir_stack, _menhir_s, arg, _startpos_arg_, _) = _menhir_stack in
        let (_endpos_ret_, ret) = (_endpos, _v) in
        let _v = _menhir_action_246 _endpos_ret_ _startpos_arg_ arg ret in
        _menhir_goto_thf_mapping_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_ret_ _v _menhir_s _tok
    
    and _menhir_run_373 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        let (_endpos_t_, t) = (_endpos, _v) in
        let _v = _menhir_action_228 t in
        _menhir_goto_thf_binary_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _v _menhir_s _tok
    
    and _menhir_run_395 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_thf_unitary_type -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_thf_unitary_type (_menhir_stack, _menhir_s, left, _startpos_left_, _) = _menhir_stack in
        let (_endpos_right_, right) = (_endpos, _v) in
        let _v = _menhir_action_275 _endpos_right_ _startpos_left_ left right in
        _menhir_goto_thf_union_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_right_ _startpos_left_ _v _menhir_s _tok
    
    and _menhir_goto_thf_union_type : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.PLUS ->
            let _menhir_stack = MenhirCell1_thf_union_type (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState363 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.XOR ->
                _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.VLINE ->
                _menhir_run_304 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SIGMA ->
                _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.PI ->
                _menhir_run_306 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT_EQUAL ->
                _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTVLINE ->
                _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTAND ->
                _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_TF ->
                _menhir_run_307 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FF ->
                _menhir_run_318 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_333 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_IMPLY ->
                _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LAMBDA ->
                _menhir_run_309 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_F ->
                _menhir_run_327 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INDEFINITE_DESCRIPTION ->
                _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.IMPLY ->
                _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL_TY ->
                _menhir_run_311 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS_TY ->
                _menhir_run_312 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUIV ->
                _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUAL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DEFINITE_DESCRIPTION ->
                _menhir_run_313 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.AND ->
                _menhir_run_329 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 363)
        | Tokens.COMMA | Tokens.RIGHT_BRACKET | Tokens.RIGHT_PAREN ->
            let (_endpos_t_, t) = (_endpos, _v) in
            let _v = _menhir_action_230 t in
            _menhir_goto_thf_binary_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _v _menhir_s _tok
        | _ ->
            _eRR 362
    
    and _menhir_run_364 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_thf_union_type -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_thf_union_type (_menhir_stack, _menhir_s, left, _startpos_left_, _) = _menhir_stack in
        let (_endpos_right_, right) = (_endpos, _v) in
        let _v = _menhir_action_276 _endpos_right_ _startpos_left_ left right in
        _menhir_goto_thf_union_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_right_ _startpos_left_ _v _menhir_s _tok
    
    and _menhir_run_336 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_thf_unitary_type -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_thf_unitary_type (_menhir_stack, _menhir_s, left, _startpos_left_, _) = _menhir_stack in
        let (_endpos_right_, right) = (_endpos, _v) in
        let _v = _menhir_action_288 _endpos_right_ _startpos_left_ left right in
        _menhir_goto_thf_xprod_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_right_ _startpos_left_ _v _menhir_s _tok
    
    and _menhir_run_334 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_thf_unitary_type (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.STAR ->
            let _menhir_s = MenhirState335 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.XOR ->
                _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.VLINE ->
                _menhir_run_304 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SIGMA ->
                _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.PI ->
                _menhir_run_306 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT_EQUAL ->
                _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTVLINE ->
                _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTAND ->
                _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_TF ->
                _menhir_run_307 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FF ->
                _menhir_run_318 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_333 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_IMPLY ->
                _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LAMBDA ->
                _menhir_run_309 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_F ->
                _menhir_run_327 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INDEFINITE_DESCRIPTION ->
                _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.IMPLY ->
                _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL_TY ->
                _menhir_run_311 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS_TY ->
                _menhir_run_312 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUIV ->
                _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUAL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DEFINITE_DESCRIPTION ->
                _menhir_run_313 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.AND ->
                _menhir_run_329 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 335)
        | Tokens.PLUS ->
            let _menhir_s = MenhirState394 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.XOR ->
                _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.VLINE ->
                _menhir_run_304 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SIGMA ->
                _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.PI ->
                _menhir_run_306 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT_EQUAL ->
                _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTVLINE ->
                _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTAND ->
                _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_TF ->
                _menhir_run_307 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FF ->
                _menhir_run_318 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_333 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_IMPLY ->
                _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LAMBDA ->
                _menhir_run_309 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_F ->
                _menhir_run_327 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INDEFINITE_DESCRIPTION ->
                _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.IMPLY ->
                _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL_TY ->
                _menhir_run_311 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS_TY ->
                _menhir_run_312 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUIV ->
                _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUAL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DEFINITE_DESCRIPTION ->
                _menhir_run_313 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.AND ->
                _menhir_run_329 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 394)
        | Tokens.ARROW ->
            _menhir_run_396 _menhir_stack _menhir_lexbuf _menhir_lexer
        | _ ->
            _eRR 334
    
    and _menhir_run_337 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_f_, _startpos_f_, f) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_283 f in
        _menhir_goto_thf_unitary_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _startpos_f_ _v _menhir_s _tok
    
    and _menhir_run_422 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LET_FF _menhir_cell0_LEFT_PAREN, ttv_result) _menhir_cell1_thf_let_formula_defn _menhir_cell0_COMMA -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_thf_let_formula_defn (_menhir_stack, _, l) = _menhir_stack in
            let MenhirCell0_LEFT_PAREN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_LET_FF (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__6_, f) = (_endpos, _v) in
            let _v = _menhir_action_238 _endpos__6_ _startpos__1_ f l in
            _menhir_goto_thf_let _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__6_ _startpos__1_ _v _menhir_s _tok
        | _ ->
            _eRR 422
    
    and _menhir_run_418 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LEFT_PAREN -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s, _) = _menhir_stack in
            let s = _v in
            let _v = _menhir_action_259 s in
            _menhir_goto_thf_sequent _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 418
    
    and _menhir_run_415 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_thf_tuple (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.GENTZEN_ARROW ->
            let _menhir_s = MenhirState416 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.LEFT_BRACKET ->
                _menhir_run_324 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 416)
        | _ ->
            _eRR 415
    
    and _menhir_run_440 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_DOLLAR_TFF (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_PAREN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_LEFT_PAREN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState441 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_TF ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FF ->
                _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_179 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_BRACKET ->
                _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_F ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 441)
        | _ ->
            _eRR 440
    
    and _menhir_run_444 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_DOLLAR_FOT (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_PAREN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_LEFT_PAREN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState445 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 445)
        | _ ->
            _eRR 444
    
    and _menhir_run_448 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_DOLLAR_FOF (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_PAREN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_LEFT_PAREN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState449 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_251 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_BRACKET ->
                _menhir_run_252 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 449)
        | _ ->
            _eRR 448
    
    and _menhir_run_251 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState251 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.SINGLE_QUOTED _v ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.REAL _v ->
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.RATIONAL _v ->
            _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LET_TT ->
            _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET_FT ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFT_PAREN ->
            _menhir_run_251 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFT_BRACKET ->
            _menhir_run_252 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ITE_T ->
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.FORALL ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.EXISTS ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DOLLAR_WORD _v ->
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DOLLAR_DOLLAR_WORD _v ->
            _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DISTINCT_OBJECT _v ->
            _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 251
    
    and _menhir_run_454 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_DOLLAR_CNF (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_PAREN ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_LEFT_PAREN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState455 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_456 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 455)
        | _ ->
            _eRR 454
    
    and _menhir_run_456 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState456 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.SINGLE_QUOTED _v ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.REAL _v ->
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.RATIONAL _v ->
            _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.NOT ->
            _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LET_TT ->
            _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET_FT ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ITE_T ->
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DOLLAR_WORD _v ->
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DOLLAR_DOLLAR_WORD _v ->
            _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DISTINCT_OBJECT _v ->
            _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 456
    
    and _menhir_goto_general_terms : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState484 ->
            _menhir_run_485 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState474 ->
            _menhir_run_475 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState300 ->
            _menhir_run_471 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_485 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_atomic_word _menhir_cell0_LEFT_PAREN -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_LEFT_PAREN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_atomic_word (_menhir_stack, _menhir_s, f, _startpos_f_, _) = _menhir_stack in
            let (l, _endpos__4_) = (_v, _endpos) in
            let _v = _menhir_action_100 _endpos__4_ _startpos_f_ f l in
            let (_endpos, _startpos) = (_endpos__4_, _startpos_f_) in
            let (_endpos_d_, _startpos_d_, d) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_095 d in
            _menhir_goto_general_data _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_d_ _startpos_d_ _v _menhir_s _tok
        | _ ->
            _eRR 485
    
    and _menhir_run_475 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_general_term _menhir_cell0_COMMA -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_general_term (_menhir_stack, _menhir_s, t, _) = _menhir_stack in
        let l = _v in
        let _v = _menhir_action_107 l t in
        _menhir_goto_general_terms _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_471 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LEFT_BRACKET -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_BRACKET ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (l, _endpos__3_) = (_v, _endpos) in
            let _v = _menhir_action_102 l in
            _menhir_goto_general_list _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
        | _ ->
            _eRR 471
    
    and _menhir_run_513 : type  ttv_stack. ((((ttv_stack, _menhir_box_file) _menhir_cell1_TFF _menhir_cell0_LEFT_PAREN, _menhir_box_file) _menhir_cell1_name _menhir_cell0_COMMA, _menhir_box_file) _menhir_cell1_formula_role _menhir_cell0_COMMA as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_tff_formula (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            _menhir_run_299 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState513
        | Tokens.RIGHT_PAREN ->
            let _v_0 = _menhir_action_008 () in
            _menhir_run_514 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
        | _ ->
            _eRR 513
    
    and _menhir_run_442 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_DOLLAR_TFF _menhir_cell0_LEFT_PAREN -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_LEFT_PAREN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_DOLLAR_TFF (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__4_, f) = (_endpos, _v) in
            let _v = _menhir_action_084 f in
            _menhir_goto_formula_data _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__4_ _startpos__1_ _v _menhir_s _tok
        | _ ->
            _eRR 442
    
    and _menhir_run_233 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LET_TF _menhir_cell0_LEFT_PAREN, ttv_result) _menhir_cell1_tff_let_term_defn _menhir_cell0_COMMA -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_tff_let_term_defn (_menhir_stack, _, l, _) = _menhir_stack in
            let MenhirCell0_LEFT_PAREN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_LET_TF (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__6_, f) = (_endpos, _v) in
            let _v = _menhir_action_162 _endpos__6_ _startpos__1_ f l in
            _menhir_goto_tff_let _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__6_ _startpos__1_ _v _menhir_s _tok
        | _ ->
            _eRR 233
    
    and _menhir_goto_tff_let : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_f_, _startpos_f_, f) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_202 f in
        _menhir_goto_tff_unitary_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _startpos_f_ _v _menhir_s _tok
    
    and _menhir_run_231 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LET_FF _menhir_cell0_LEFT_PAREN, ttv_result) _menhir_cell1_tff_let_formula_defn _menhir_cell0_COMMA -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_tff_let_formula_defn (_menhir_stack, _, l, _) = _menhir_stack in
            let MenhirCell0_LEFT_PAREN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_LET_FF (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__6_, f) = (_endpos, _v) in
            let _v = _menhir_action_163 _endpos__6_ _startpos__1_ f l in
            _menhir_goto_tff_let _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__6_ _startpos__1_ _v _menhir_s _tok
        | _ ->
            _eRR 231
    
    and _menhir_run_220 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LEFT_PAREN -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s, _) = _menhir_stack in
            let t = _v in
            let _v = _menhir_action_194 t in
            _menhir_goto_tff_typed_atom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 220
    
    and _menhir_run_214 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LEFT_PAREN -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s, _) = _menhir_stack in
            let (t, _endpos__3_) = (_v, _endpos_0) in
            let _v = _menhir_action_186 t in
            _menhir_goto_tff_top_level_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _v _menhir_s _tok
        | _ ->
            _eRR 214
    
    and _menhir_goto_tff_unitary_type : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState190 ->
            _menhir_run_213 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState189 ->
            _menhir_run_206 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState196 ->
            _menhir_run_206 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | MenhirState197 ->
            _menhir_run_202 _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_213 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_tff_unitary_type (_menhir_stack, _menhir_s, _v, _startpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.STAR ->
            _menhir_run_203 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.ARROW ->
            _menhir_run_207 _menhir_stack _menhir_lexbuf _menhir_lexer
        | _ ->
            _eRR 213
    
    and _menhir_run_203 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LEFT_PAREN, ttv_result) _menhir_cell1_tff_unitary_type -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _menhir_s = MenhirState203 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.SINGLE_QUOTED _v ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DOLLAR_WORD _v ->
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 203
    
    and _menhir_run_207 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_tff_unitary_type -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _menhir_s = MenhirState207 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.SINGLE_QUOTED _v ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DOLLAR_WORD _v ->
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 207
    
    and _menhir_run_206 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_tff_unitary_type (_menhir_stack, _menhir_s, _v, _startpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.ARROW ->
            _menhir_run_207 _menhir_stack _menhir_lexbuf _menhir_lexer
        | _ ->
            _eRR 206
    
    and _menhir_run_202 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_LEFT_PAREN, ttv_result) _menhir_cell1_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_tff_unitary_type (_menhir_stack, _menhir_s, _v, _startpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.STAR ->
            _menhir_run_203 _menhir_stack _menhir_lexbuf _menhir_lexer
        | _ ->
            _eRR 202
    
    and _menhir_run_212 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_FORALL_TY _menhir_cell0_LEFT_BRACKET, ttv_result) _menhir_cell1_tff_variable_list _menhir_cell0_RIGHT_BRACKET -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let (_endpos_t_, t) = (_endpos, _v) in
        let _v = _menhir_action_175 t in
        _menhir_goto_tff_monotype _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _v _tok
    
    and _menhir_goto_tff_monotype : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_FORALL_TY _menhir_cell0_LEFT_BRACKET, ttv_result) _menhir_cell1_tff_variable_list _menhir_cell0_RIGHT_BRACKET -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell0_RIGHT_BRACKET (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_tff_variable_list (_menhir_stack, _, l) = _menhir_stack in
        let MenhirCell0_LEFT_BRACKET (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_FORALL_TY (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos_t_, t) = (_endpos, _v) in
        let _v = _menhir_action_180 _endpos_t_ _startpos__1_ l t in
        let _endpos = _endpos_t_ in
        let (_endpos_t_, t) = (_endpos, _v) in
        let _v = _menhir_action_185 t in
        _menhir_goto_tff_top_level_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _v _menhir_s _tok
    
    and _menhir_run_208 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_tff_unitary_type -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_tff_unitary_type (_menhir_stack, _menhir_s, arg, _startpos_arg_) = _menhir_stack in
        let (_endpos_ret_, ret) = (_endpos, _v) in
        let _v = _menhir_action_174 _endpos_ret_ _startpos_arg_ arg ret in
        _menhir_goto_tff_mapping_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_ret_ _v _menhir_s _tok
    
    and _menhir_goto_tff_mapping_type : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState189 ->
            _menhir_run_217 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState190 ->
            _menhir_run_217 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState196 ->
            _menhir_run_209 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_217 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        let (_endpos_t_, t) = (_endpos, _v) in
        let _v = _menhir_action_184 t in
        _menhir_goto_tff_top_level_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _v _menhir_s _tok
    
    and _menhir_run_209 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_FORALL_TY _menhir_cell0_LEFT_BRACKET, ttv_result) _menhir_cell1_tff_variable_list _menhir_cell0_RIGHT_BRACKET, ttv_result) _menhir_cell1_LEFT_PAREN -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_LEFT_PAREN (_menhir_stack, _, _) = _menhir_stack in
            let (t, _endpos__3_) = (_v, _endpos_0) in
            let _v = _menhir_action_176 t in
            _menhir_goto_tff_monotype _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _v _tok
        | _ ->
            _eRR 209
    
    and _menhir_run_205 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
        let (_startpos_t_, t) = (_startpos, _v) in
        let _v = _menhir_action_204 t in
        _menhir_goto_tff_unitary_type _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_t_ _v _menhir_s _tok
    
    and _menhir_run_204 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LEFT_PAREN, ttv_result) _menhir_cell1_tff_unitary_type -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_tff_unitary_type (_menhir_stack, _menhir_s, t, _startpos_t_) = _menhir_stack in
        let (_endpos_u_, u) = (_endpos, _v) in
        let _v = _menhir_action_212 _endpos_u_ _startpos_t_ t u in
        _menhir_goto_tff_xprod_type _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_t_ _v _menhir_s _tok
    
    and _menhir_goto_tff_xprod_type : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.STAR ->
            let _menhir_stack = MenhirCell1_tff_xprod_type (_menhir_stack, _menhir_s, _v, _startpos) in
            let _menhir_s = MenhirState199 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 199)
        | Tokens.RIGHT_PAREN ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let t = _v in
            let _v = _menhir_action_205 t in
            _menhir_goto_tff_unitary_type _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
        | _ ->
            _eRR 198
    
    and _menhir_run_200 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LEFT_PAREN, ttv_result) _menhir_cell1_tff_xprod_type -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_tff_xprod_type (_menhir_stack, _menhir_s, t, _startpos_t_) = _menhir_stack in
        let (_endpos_u_, u) = (_endpos, _v) in
        let _v = _menhir_action_213 _endpos_u_ _startpos_t_ t u in
        _menhir_goto_tff_xprod_type _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_t_ _v _menhir_s _tok
    
    and _menhir_run_083 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _menhir_stack = MenhirCell1_tff_atomic_type (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState084 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 84)
        | Tokens.RIGHT_PAREN ->
            let t = _v in
            let _v = _menhir_action_191 t in
            _menhir_goto_tff_type_arguments _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 83
    
    and _menhir_goto_tff_type_arguments : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState084 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState080 ->
            _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_085 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_tff_atomic_type _menhir_cell0_COMMA -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_tff_atomic_type (_menhir_stack, _menhir_s, t, _, _) = _menhir_stack in
        let l = _v in
        let _v = _menhir_action_192 l t in
        _menhir_goto_tff_type_arguments _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_081 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_atomic_word _menhir_cell0_LEFT_PAREN -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell0_LEFT_PAREN (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_atomic_word (_menhir_stack, _menhir_s, f, _startpos_f_, _) = _menhir_stack in
        let (l, _endpos__4_) = (_v, _endpos) in
        let _v = _menhir_action_152 _endpos__4_ _startpos_f_ f l in
        _menhir_goto_tff_atomic_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__4_ _startpos_f_ _v _menhir_s _tok
    
    and _menhir_run_077 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_variable -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_variable (_menhir_stack, _menhir_s, v, _startpos_v_, _) = _menhir_stack in
        let (_endpos_ty_, ty) = (_endpos, _v) in
        let _v = _menhir_action_195 _endpos_ty_ _startpos_v_ ty v in
        let v = _v in
        let _v = _menhir_action_208 v in
        _menhir_goto_tff_variable _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_tff_variable : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _menhir_stack = MenhirCell1_tff_variable (_menhir_stack, _menhir_s, _v) in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState093 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 93)
        | Tokens.RIGHT_BRACKET ->
            let v = _v in
            let _v = _menhir_action_210 v in
            _menhir_goto_tff_variable_list _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 92
    
    and _menhir_goto_tff_variable_list : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState192 ->
            _menhir_run_193 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState139 ->
            _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState101 ->
            _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState093 ->
            _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState073 ->
            _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_193 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_FORALL_TY _menhir_cell0_LEFT_BRACKET as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_tff_variable_list (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_RIGHT_BRACKET (_menhir_stack, _endpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.COLON ->
            let _menhir_s = MenhirState195 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LEFT_PAREN ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _menhir_stack = MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s, _startpos) in
                let _menhir_s = MenhirState196 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.UPPER_WORD _v ->
                    _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.SINGLE_QUOTED _v ->
                    _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.LOWER_WORD _v ->
                    _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.LEFT_PAREN ->
                    _menhir_run_197 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
                | Tokens.DOLLAR_WORD _v ->
                    _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | _ ->
                    _eRR 196)
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 195)
        | _ ->
            _eRR 194
    
    and _menhir_run_197 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LEFT_PAREN as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState197 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.SINGLE_QUOTED _v ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LEFT_PAREN ->
            _menhir_run_197 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.DOLLAR_WORD _v ->
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 197
    
    and _menhir_run_140 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_fol_quantifier _menhir_cell0_LEFT_BRACKET as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_tff_variable_list (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_RIGHT_BRACKET (_menhir_stack, _endpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.COLON ->
            let _menhir_s = MenhirState142 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_TF ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FF ->
                _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_F ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 142)
        | _ ->
            _eRR 141
    
    and _menhir_run_102 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_FORALL _menhir_cell0_LEFT_BRACKET as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_tff_variable_list (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_RIGHT_BRACKET (_menhir_stack, _endpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.COLON ->
            let _menhir_s = MenhirState104 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 104)
        | _ ->
            _eRR 103
    
    and _menhir_run_094 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_tff_variable _menhir_cell0_COMMA -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_tff_variable (_menhir_stack, _menhir_s, v) = _menhir_stack in
        let l = _v in
        let _v = _menhir_action_211 l v in
        _menhir_goto_tff_variable_list _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_087 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_FORALL _menhir_cell0_LEFT_BRACKET as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_tff_variable_list (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_RIGHT_BRACKET (_menhir_stack, _endpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.COLON ->
            let _menhir_s = MenhirState089 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 89)
        | _ ->
            _eRR 88
    
    and _menhir_run_059 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_f_, _startpos_f_, f) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_037 f in
        let (_endpos, _startpos) = (_endpos_f_, _startpos_f_) in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_PAREN ->
            let _menhir_stack = MenhirCell1_defined_functor (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_LEFT_PAREN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState051 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 51)
        | Tokens.AND | Tokens.APPLY | Tokens.ARROW | Tokens.COLON | Tokens.COMMA | Tokens.EQUAL | Tokens.EQUIV | Tokens.IMPLY | Tokens.LEFT_IMPLY | Tokens.NOTAND | Tokens.NOTVLINE | Tokens.NOT_EQUAL | Tokens.PLUS | Tokens.RIGHT_BRACKET | Tokens.RIGHT_PAREN | Tokens.STAR | Tokens.VLINE | Tokens.XOR ->
            let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_036 c in
            let (_endpos, _startpos) = (_endpos_c_, _startpos_c_) in
            let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_041 c in
            _menhir_goto_defined_plain_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v _menhir_s _tok
        | _ ->
            _eRR 50
    
    and _menhir_goto_defined_plain_term : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState616 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState605 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState589 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState569 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState546 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState536 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState512 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState010 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState455 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState456 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState462 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState457 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState449 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState441 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState251 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState252 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState291 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState254 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState286 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState278 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState275 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState273 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState271 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState255 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState263 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState020 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState021 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState023 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState097 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState099 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState178 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState179 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState180 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState185 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState121 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState122 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState124 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState163 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState165 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState172 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState160 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState157 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState155 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState148 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState128 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState142 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState104 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState579 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState502 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState445 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState303 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState435 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState427 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState317 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState322 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState323 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState324 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState413 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState326 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState328 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState403 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState405 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState332 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState333 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState396 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState394 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState335 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState340 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState366 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState384 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState381 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState371 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState363 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState360 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState358 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState356 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState342 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState018 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState248 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState244 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState236 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState238 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState025 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState136 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState110 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState089 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState026 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState070 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState033 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState035 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState051 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState038 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_116 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.EQUAL | Tokens.NOT_EQUAL ->
            let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_035 t in
            _menhir_goto_defined_atomic_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _startpos_t_ _v _menhir_s _tok
        | Tokens.AND | Tokens.COMMA | Tokens.EQUIV | Tokens.IMPLY | Tokens.LEFT_IMPLY | Tokens.NOTAND | Tokens.NOTVLINE | Tokens.RIGHT_BRACKET | Tokens.RIGHT_PAREN | Tokens.VLINE | Tokens.XOR ->
            let (_endpos_f_, _startpos_f_, f) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_040 f in
            let (_endpos, _startpos) = (_endpos_f_, _startpos_f_) in
            let (_endpos_f_, _startpos_f_, f) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_033 f in
            _menhir_goto_defined_atomic_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _startpos_f_ _v _menhir_s _tok
        | _ ->
            _eRR 116
    
    and _menhir_goto_defined_atomic_term : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_044 t in
        _menhir_goto_defined_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _startpos_t_ _v _menhir_s _tok
    
    and _menhir_goto_defined_atomic_formula : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_f_, _startpos_f_, f) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_015 f in
        _menhir_goto_atomic_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _startpos_f_ _v _menhir_s _tok
    
    and _menhir_run_049 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_035 t in
        _menhir_goto_defined_atomic_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _startpos_t_ _v _menhir_s _tok
    
    and _menhir_run_127 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_296 c in
        _menhir_goto_unary_connective _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v _menhir_s _tok
    
    and _menhir_goto_unary_connective : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState579 ->
            _menhir_run_330 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState502 ->
            _menhir_run_330 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState303 ->
            _menhir_run_330 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState435 ->
            _menhir_run_330 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState427 ->
            _menhir_run_330 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState317 ->
            _menhir_run_330 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState322 ->
            _menhir_run_330 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState323 ->
            _menhir_run_330 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState413 ->
            _menhir_run_330 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState324 ->
            _menhir_run_330 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState326 ->
            _menhir_run_330 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState405 ->
            _menhir_run_330 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState403 ->
            _menhir_run_330 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState332 ->
            _menhir_run_330 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState396 ->
            _menhir_run_330 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState394 ->
            _menhir_run_330 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState384 ->
            _menhir_run_330 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState381 ->
            _menhir_run_330 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState371 ->
            _menhir_run_330 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState366 ->
            _menhir_run_330 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState363 ->
            _menhir_run_330 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState360 ->
            _menhir_run_330 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState358 ->
            _menhir_run_330 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState356 ->
            _menhir_run_330 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState342 ->
            _menhir_run_330 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState340 ->
            _menhir_run_330 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState335 ->
            _menhir_run_330 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState333 ->
            _menhir_run_330 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState328 ->
            _menhir_run_330 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState605 ->
            _menhir_run_255 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState569 ->
            _menhir_run_255 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState536 ->
            _menhir_run_255 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState449 ->
            _menhir_run_255 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState010 ->
            _menhir_run_255 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState251 ->
            _menhir_run_255 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState291 ->
            _menhir_run_255 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState252 ->
            _menhir_run_255 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState286 ->
            _menhir_run_255 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState278 ->
            _menhir_run_255 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState275 ->
            _menhir_run_255 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState273 ->
            _menhir_run_255 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState271 ->
            _menhir_run_255 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState263 ->
            _menhir_run_255 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState255 ->
            _menhir_run_255 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState254 ->
            _menhir_run_255 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState589 ->
            _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState512 ->
            _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState441 ->
            _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState023 ->
            _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState097 ->
            _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState178 ->
            _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState179 ->
            _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState185 ->
            _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState180 ->
            _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState121 ->
            _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState122 ->
            _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState172 ->
            _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState165 ->
            _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState163 ->
            _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState160 ->
            _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState157 ->
            _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState155 ->
            _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState148 ->
            _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState142 ->
            _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState128 ->
            _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState124 ->
            _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_330 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_271 c in
        _menhir_goto_thf_unary_connective _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v _menhir_s _tok
    
    and _menhir_run_255 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_unary_connective (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v_0 ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState255
        | Tokens.SINGLE_QUOTED _v_1 ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState255
        | Tokens.REAL _v_2 ->
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState255
        | Tokens.RATIONAL _v_3 ->
            _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState255
        | Tokens.NOT ->
            _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState255
        | Tokens.LOWER_WORD _v_4 ->
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState255
        | Tokens.LET_TT ->
            _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState255
        | Tokens.LET_FT ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState255
        | Tokens.LEFT_PAREN ->
            _menhir_run_254 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState255
        | Tokens.ITE_T ->
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState255
        | Tokens.INTEGER _v_5 ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState255
        | Tokens.FORALL ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState255
        | Tokens.EXISTS ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState255
        | Tokens.DOLLAR_WORD _v_6 ->
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v_6 MenhirState255
        | Tokens.DOLLAR_DOLLAR_WORD _v_7 ->
            _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v_7 MenhirState255
        | Tokens.DISTINCT_OBJECT _v_8 ->
            _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v_8 MenhirState255
        | _ ->
            _eRR 255
    
    and _menhir_run_128 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_unary_connective (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v_0 ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState128
        | Tokens.SINGLE_QUOTED _v_1 ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState128
        | Tokens.REAL _v_2 ->
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState128
        | Tokens.RATIONAL _v_3 ->
            _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState128
        | Tokens.NOT ->
            _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
        | Tokens.LOWER_WORD _v_4 ->
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState128
        | Tokens.LET_TT ->
            _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
        | Tokens.LET_TF ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
        | Tokens.LET_FT ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
        | Tokens.LET_FF ->
            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
        | Tokens.LEFT_PAREN ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
        | Tokens.ITE_T ->
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
        | Tokens.ITE_F ->
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
        | Tokens.INTEGER _v_5 ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState128
        | Tokens.FORALL ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
        | Tokens.EXISTS ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
        | Tokens.DOLLAR_WORD _v_6 ->
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v_6 MenhirState128
        | Tokens.DOLLAR_DOLLAR_WORD _v_7 ->
            _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v_7 MenhirState128
        | Tokens.DISTINCT_OBJECT _v_8 ->
            _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v_8 MenhirState128
        | _ ->
            _eRR 128
    
    and _menhir_run_345 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_232 t in
        _menhir_goto_thf_conn_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _startpos_t_ _v _menhir_s _tok
    
    and _menhir_run_275 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_fof_unitary_formula as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_binary_connective (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v_0 ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState275
        | Tokens.SINGLE_QUOTED _v_1 ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState275
        | Tokens.REAL _v_2 ->
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState275
        | Tokens.RATIONAL _v_3 ->
            _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState275
        | Tokens.NOT ->
            _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState275
        | Tokens.LOWER_WORD _v_4 ->
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState275
        | Tokens.LET_TT ->
            _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState275
        | Tokens.LET_FT ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState275
        | Tokens.LEFT_PAREN ->
            _menhir_run_254 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState275
        | Tokens.ITE_T ->
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState275
        | Tokens.INTEGER _v_5 ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState275
        | Tokens.FORALL ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState275
        | Tokens.EXISTS ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState275
        | Tokens.DOLLAR_WORD _v_6 ->
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v_6 MenhirState275
        | Tokens.DOLLAR_DOLLAR_WORD _v_7 ->
            _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v_7 MenhirState275
        | Tokens.DISTINCT_OBJECT _v_8 ->
            _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v_8 MenhirState275
        | _ ->
            _eRR 275
    
    and _menhir_run_157 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_tff_unitary_formula as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_binary_connective (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v_0 ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState157
        | Tokens.SINGLE_QUOTED _v_1 ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState157
        | Tokens.REAL _v_2 ->
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState157
        | Tokens.RATIONAL _v_3 ->
            _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState157
        | Tokens.NOT ->
            _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState157
        | Tokens.LOWER_WORD _v_4 ->
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState157
        | Tokens.LET_TT ->
            _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState157
        | Tokens.LET_TF ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState157
        | Tokens.LET_FT ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState157
        | Tokens.LET_FF ->
            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState157
        | Tokens.LEFT_PAREN ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState157
        | Tokens.ITE_T ->
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState157
        | Tokens.ITE_F ->
            _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState157
        | Tokens.INTEGER _v_5 ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState157
        | Tokens.FORALL ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState157
        | Tokens.EXISTS ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState157
        | Tokens.DOLLAR_WORD _v_6 ->
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v_6 MenhirState157
        | Tokens.DOLLAR_DOLLAR_WORD _v_7 ->
            _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v_7 MenhirState157
        | Tokens.DISTINCT_OBJECT _v_8 ->
            _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v_8 MenhirState157
        | _ ->
            _eRR 157
    
    and _menhir_run_349 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_f_, _startpos_f_, f) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_279 f in
        _menhir_goto_thf_unitary_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _startpos_f_ _v _menhir_s _tok
    
    and _menhir_run_249 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LET_TT _menhir_cell0_LEFT_PAREN, ttv_result) _menhir_cell1_tff_let_term_defn _menhir_cell0_COMMA -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_tff_let_term_defn (_menhir_stack, _, l, _) = _menhir_stack in
            let MenhirCell0_LEFT_PAREN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_LET_TT (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__6_, t) = (_endpos_0, _v) in
            let _v = _menhir_action_114 _endpos__6_ _startpos__1_ l t in
            _menhir_goto_let_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__6_ _startpos__1_ _v _menhir_s _tok
        | _ ->
            _eRR 249
    
    and _menhir_goto_let_term : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_145 t in
        _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _startpos_t_ _v _menhir_s _tok
    
    and _menhir_run_245 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LET_FT _menhir_cell0_LEFT_PAREN, ttv_result) _menhir_cell1_tff_let_formula_defn _menhir_cell0_COMMA -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_tff_let_formula_defn (_menhir_stack, _, l, _) = _menhir_stack in
            let MenhirCell0_LEFT_PAREN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_LET_FT (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__6_, t) = (_endpos_0, _v) in
            let _v = _menhir_action_113 _endpos__6_ _startpos__1_ l t in
            _menhir_goto_let_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__6_ _startpos__1_ _v _menhir_s _tok
        | _ ->
            _eRR 245
    
    and _menhir_run_239 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_ITE_T _menhir_cell0_LEFT_PAREN, ttv_result) _menhir_cell1_tff_logic_formula _menhir_cell0_COMMA, ttv_result) _menhir_cell1_term _menhir_cell0_COMMA -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_term (_menhir_stack, _, if_then, _, _) = _menhir_stack in
            let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_tff_logic_formula (_menhir_stack, _, cond) = _menhir_stack in
            let MenhirCell0_LEFT_PAREN (_menhir_stack, _) = _menhir_stack in
            let MenhirCell1_ITE_T (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__8_, if_else) = (_endpos_0, _v) in
            let _v = _menhir_action_029 _endpos__8_ _startpos__1_ cond if_else if_then in
            let (_endpos, _startpos) = (_endpos__8_, _startpos__1_) in
            let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_144 t in
            _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _startpos_t_ _v _menhir_s _tok
        | _ ->
            _eRR 239
    
    and _menhir_run_237 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_ITE_T _menhir_cell0_LEFT_PAREN, ttv_result) _menhir_cell1_tff_logic_formula _menhir_cell0_COMMA as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState238 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 238)
        | _ ->
            _eRR 237
    
    and _menhir_run_137 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_term, ttv_result) _menhir_cell1_infix_inequality -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_infix_inequality (_menhir_stack, _, f, _, _) = _menhir_stack in
        let MenhirCell1_term (_menhir_stack, _menhir_s, t, _startpos_t_, _) = _menhir_stack in
        let (_endpos_u_, u) = (_endpos, _v) in
        let _v = _menhir_action_080 _endpos_u_ _startpos_t_ f t u in
        _menhir_goto_fol_infix_unary _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_u_ _startpos_t_ _v _menhir_s _tok
    
    and _menhir_goto_fol_infix_unary : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState616 ->
            _menhir_run_460 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState546 ->
            _menhir_run_460 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState455 ->
            _menhir_run_460 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState462 ->
            _menhir_run_460 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState456 ->
            _menhir_run_460 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState605 ->
            _menhir_run_264 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState569 ->
            _menhir_run_264 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState536 ->
            _menhir_run_264 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState010 ->
            _menhir_run_264 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState449 ->
            _menhir_run_264 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState251 ->
            _menhir_run_264 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState291 ->
            _menhir_run_264 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState252 ->
            _menhir_run_264 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState286 ->
            _menhir_run_264 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState278 ->
            _menhir_run_264 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState275 ->
            _menhir_run_264 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState273 ->
            _menhir_run_264 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState271 ->
            _menhir_run_264 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState254 ->
            _menhir_run_264 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState255 ->
            _menhir_run_264 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState263 ->
            _menhir_run_264 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState589 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState512 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState441 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState023 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState097 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState178 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState179 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState180 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState185 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState121 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState122 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState124 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState163 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState165 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState172 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState160 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState157 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState155 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState148 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState128 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState142 ->
            _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_460 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_f_, _startpos_f_, f) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_119 f in
        _menhir_goto_literal _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _startpos_f_ _v _menhir_s _tok
    
    and _menhir_run_264 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_f_, _startpos_f_, f) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_073 f in
        _menhir_goto_fof_unary_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _startpos_f_ _v _menhir_s _tok
    
    and _menhir_run_144 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_f_, _startpos_f_, f) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_197 f in
        _menhir_goto_tff_unary_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _startpos_f_ _v _menhir_s _tok
    
    and _menhir_run_134 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.NOT_EQUAL ->
            _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
        | Tokens.EQUAL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState134
        | _ ->
            _eRR 134
    
    and _menhir_run_111 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_term, ttv_result) _menhir_cell1_defined_infix_pred -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_defined_infix_pred (_menhir_stack, _, c) = _menhir_stack in
        let MenhirCell1_term (_menhir_stack, _menhir_s, t, _startpos_t_, _) = _menhir_stack in
        let (_endpos_u_, u) = (_endpos, _v) in
        let _v = _menhir_action_038 _endpos_u_ _startpos_t_ c t u in
        let (_endpos, _startpos) = (_endpos_u_, _startpos_t_) in
        let (_endpos_f_, _startpos_f_, f) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_034 f in
        _menhir_goto_defined_atomic_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _startpos_f_ _v _menhir_s _tok
    
    and _menhir_run_107 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.EQUAL ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState107
        | _ ->
            _eRR 107
    
    and _menhir_run_071 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_term _menhir_cell0_EQUAL -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell0_EQUAL (_menhir_stack, _startpos__2_, _endpos__2_) = _menhir_stack in
        let MenhirCell1_term (_menhir_stack, _menhir_s, t, _startpos_t_, _) = _menhir_stack in
        let (_endpos_u_, u) = (_endpos, _v) in
        let _v = _menhir_action_168 _endpos__2_ _endpos_u_ _startpos__2_ _startpos_t_ t u in
        _menhir_goto_tff_let_term_binding _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_u_ _v _menhir_s _tok
    
    and _menhir_goto_tff_let_term_binding : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState018 ->
            _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState025 ->
            _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState089 ->
            _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState026 ->
            _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_091 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        let (_endpos_t_, t) = (_endpos, _v) in
        let _v = _menhir_action_171 t in
        _menhir_goto_tff_let_term_defn _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _v _menhir_s _tok
    
    and _menhir_goto_tff_let_term_defn : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState018 ->
            _menhir_run_247 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState025 ->
            _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState089 ->
            _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_247 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LET_TT _menhir_cell0_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_tff_let_term_defn (_menhir_stack, _menhir_s, _v, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState248 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 248)
        | _ ->
            _eRR 247
    
    and _menhir_run_096 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LET_TF _menhir_cell0_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_tff_let_term_defn (_menhir_stack, _menhir_s, _v, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState097 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_TF ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FF ->
                _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_179 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_BRACKET ->
                _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_F ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 97)
        | _ ->
            _eRR 96
    
    and _menhir_run_090 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_FORALL _menhir_cell0_LEFT_BRACKET, ttv_result) _menhir_cell1_tff_variable_list _menhir_cell0_RIGHT_BRACKET -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell0_RIGHT_BRACKET (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_tff_variable_list (_menhir_stack, _, l) = _menhir_stack in
        let MenhirCell0_LEFT_BRACKET (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_FORALL (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos_t_, t) = (_endpos, _v) in
        let _v = _menhir_action_170 _endpos_t_ _startpos__1_ l t in
        _menhir_goto_tff_let_term_defn _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _v _menhir_s _tok
    
    and _menhir_run_067 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LEFT_PAREN -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s, _) = _menhir_stack in
            let (t, _endpos__3_) = (_v, _endpos_0) in
            let _v = _menhir_action_169 t in
            _menhir_goto_tff_let_term_binding _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _v _menhir_s _tok
        | _ ->
            _eRR 67
    
    and _menhir_run_069 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.EQUAL ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _menhir_stack = MenhirCell0_EQUAL (_menhir_stack, _startpos, _endpos) in
            let _menhir_s = MenhirState070 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 70)
        | _ ->
            _eRR 69
    
    and _menhir_run_034 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState035 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 35)
        | Tokens.RIGHT_PAREN ->
            let t = _v in
            let _v = _menhir_action_009 t in
            _menhir_goto_arguments _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 34
    
    and _menhir_goto_arguments : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState033 ->
            _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState035 ->
            _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState038 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState051 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_065 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_tptp_functor _menhir_cell0_LEFT_PAREN -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell0_LEFT_PAREN (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_tptp_functor (_menhir_stack, _menhir_s, f, _startpos_f_, _) = _menhir_stack in
        let (l, _endpos__4_) = (_v, _endpos) in
        let _v = _menhir_action_132 _endpos__4_ _startpos_f_ f l in
        _menhir_goto_plain_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__4_ _startpos_f_ _v _menhir_s _tok
    
    and _menhir_goto_plain_term : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState616 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState605 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState589 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState569 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState546 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState536 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState512 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState010 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState455 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState462 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState456 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState457 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState449 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState441 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState251 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState291 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState252 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState286 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState278 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState275 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState273 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState271 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState254 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState263 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState255 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState020 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState021 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState023 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState097 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState099 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState178 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState179 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState180 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState185 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState121 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState122 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState124 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState163 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState165 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState172 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState160 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState157 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState155 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState148 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState142 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState128 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState104 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState579 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState502 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState445 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState303 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState435 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState427 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState317 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState322 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState323 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState324 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState413 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState326 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState328 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState403 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState405 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState332 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState333 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState396 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState394 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState335 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState340 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState366 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState384 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState381 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState371 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState363 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState360 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState358 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState356 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState342 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState018 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState248 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState244 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState236 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState238 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState025 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState136 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState110 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState089 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState026 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState070 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState033 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState035 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState051 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState038 ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_114 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.EQUAL | Tokens.NOT_EQUAL ->
            let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_091 t in
            _menhir_goto_function_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _startpos_t_ _v _menhir_s _tok
        | Tokens.AND | Tokens.COMMA | Tokens.EQUIV | Tokens.IMPLY | Tokens.LEFT_IMPLY | Tokens.NOTAND | Tokens.NOTVLINE | Tokens.RIGHT_BRACKET | Tokens.RIGHT_PAREN | Tokens.VLINE | Tokens.XOR ->
            let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_130 t in
            let (_endpos, _startpos) = (_endpos_t_, _startpos_t_) in
            let (_endpos_f_, _startpos_f_, f) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_014 f in
            _menhir_goto_atomic_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _startpos_f_ _v _menhir_s _tok
        | _ ->
            _eRR 114
    
    and _menhir_run_042 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_091 t in
        _menhir_goto_function_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _startpos_t_ _v _menhir_s _tok
    
    and _menhir_run_064 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_term _menhir_cell0_COMMA -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_term (_menhir_stack, _menhir_s, t, _, _) = _menhir_stack in
        let l = _v in
        let _v = _menhir_action_010 l t in
        _menhir_goto_arguments _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_062 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_system_functor _menhir_cell0_LEFT_PAREN -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell0_LEFT_PAREN (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_system_functor (_menhir_stack, _menhir_s, f, _startpos_f_, _) = _menhir_stack in
        let (l, _endpos__4_) = (_v, _endpos) in
        let _v = _menhir_action_141 _endpos__4_ _startpos_f_ f l in
        _menhir_goto_system_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__4_ _startpos_f_ _v _menhir_s _tok
    
    and _menhir_run_060 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_defined_functor _menhir_cell0_LEFT_PAREN -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell0_LEFT_PAREN (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_defined_functor (_menhir_stack, _menhir_s, f, _startpos_f_, _) = _menhir_stack in
        let (l, _endpos__4_) = (_v, _endpos) in
        let _v = _menhir_action_042 _endpos__4_ _startpos_f_ f l in
        _menhir_goto_defined_plain_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__4_ _startpos_f_ _v _menhir_s _tok
    
    and _menhir_run_079 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_PAREN ->
            let _menhir_stack = MenhirCell1_atomic_word (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_LEFT_PAREN (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState080 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 80)
        | Tokens.ARROW | Tokens.COMMA | Tokens.RIGHT_BRACKET | Tokens.RIGHT_PAREN | Tokens.STAR ->
            let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_149 t in
            _menhir_goto_tff_atomic_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _startpos_t_ _v _menhir_s _tok
        | _ ->
            _eRR 79
    
    and _menhir_run_057 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_w_, _startpos_w_, w) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_292 w in
        _menhir_goto_tptp_functor _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_w_ _startpos_w_ _v _menhir_s _tok
    
    and _menhir_goto_tptp_functor : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState389 ->
            _menhir_run_390 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState589 ->
            _menhir_run_187 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState512 ->
            _menhir_run_187 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState441 ->
            _menhir_run_187 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState097 ->
            _menhir_run_187 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState178 ->
            _menhir_run_187 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState179 ->
            _menhir_run_187 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState616 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState605 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState579 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState569 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState546 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState536 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState502 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState455 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState462 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState456 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState457 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState449 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState445 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState303 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState435 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState427 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState317 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState322 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState323 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState413 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState324 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState326 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState405 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState403 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState332 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState396 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState394 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState384 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState381 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState371 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState366 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState363 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState360 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState358 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState356 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState342 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState340 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState335 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState333 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState328 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState010 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState251 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState291 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState252 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState286 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState278 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState275 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState273 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState271 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState254 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState263 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState255 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState248 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState018 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState244 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState020 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState021 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState238 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState236 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState023 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState185 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState180 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState099 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState121 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState122 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState172 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState165 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState163 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState160 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState157 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState155 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState148 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState124 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState142 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState136 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState128 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState110 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState104 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState025 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState089 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState070 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState051 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState038 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState035 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState033 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState026 ->
            _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_390 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_constant _menhir_cell0_subtype_sign as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_030 c in
        _menhir_goto_constant _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v _menhir_s _tok
    
    and _menhir_goto_constant : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState389 ->
            _menhir_run_391 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState579 ->
            _menhir_run_386 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState502 ->
            _menhir_run_386 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState303 ->
            _menhir_run_386 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState435 ->
            _menhir_run_386 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState317 ->
            _menhir_run_386 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState322 ->
            _menhir_run_386 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState323 ->
            _menhir_run_386 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState324 ->
            _menhir_run_386 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState413 ->
            _menhir_run_386 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState326 ->
            _menhir_run_386 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState328 ->
            _menhir_run_386 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState403 ->
            _menhir_run_386 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState405 ->
            _menhir_run_386 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState333 ->
            _menhir_run_386 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState340 ->
            _menhir_run_386 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState366 ->
            _menhir_run_386 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState616 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState605 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState589 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState569 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState546 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState536 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState512 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState010 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState455 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState456 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState462 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState457 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState449 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState445 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState441 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState427 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState332 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState396 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState394 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState335 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState384 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState381 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState371 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState363 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState360 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState358 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState356 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState342 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState251 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState252 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState291 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState254 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState286 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState278 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState275 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState273 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState271 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState255 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState263 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState018 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState248 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState020 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState244 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState021 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState023 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState236 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState238 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState025 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState097 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState099 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState178 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState179 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState180 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState185 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState121 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState122 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState124 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState163 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState165 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState172 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState160 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState157 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState155 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState148 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState128 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState142 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState136 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState104 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState110 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState089 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState026 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState070 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState033 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState035 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState038 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState051 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_391 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_constant _menhir_cell0_subtype_sign -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell0_subtype_sign (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_constant (_menhir_stack, _menhir_s, t, _startpos_t_, _) = _menhir_stack in
        let (_endpos_u_, u) = (_endpos, _v) in
        let _v = _menhir_action_261 _endpos_u_ _startpos_t_ t u in
        let _endpos = _endpos_u_ in
        let (_endpos_f_, f) = (_endpos, _v) in
        let _v = _menhir_action_244 f in
        _menhir_goto_thf_logic_formula _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_f_ _v _menhir_s _tok
    
    and _menhir_run_386 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.LESS ->
            let _menhir_stack = MenhirCell1_constant (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.LESS ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                let _v = _menhir_action_136 () in
                let _menhir_stack = MenhirCell0_subtype_sign (_menhir_stack, _v) in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SINGLE_QUOTED _v_0 ->
                    _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState389
                | Tokens.LOWER_WORD _v_1 ->
                    _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState389
                | _ ->
                    _eRR 389)
            | _ ->
                _eRR 387)
        | Tokens.AND | Tokens.APPLY | Tokens.ARROW | Tokens.COLON | Tokens.COMMA | Tokens.EQUAL | Tokens.EQUIV | Tokens.IMPLY | Tokens.LEFT_IMPLY | Tokens.NOTAND | Tokens.NOTVLINE | Tokens.NOT_EQUAL | Tokens.PLUS | Tokens.RIGHT_BRACKET | Tokens.RIGHT_PAREN | Tokens.STAR | Tokens.VLINE | Tokens.XOR ->
            let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_131 c in
            _menhir_goto_plain_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v _menhir_s _tok
        | _ ->
            _eRR 386
    
    and _menhir_run_055 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_131 c in
        _menhir_goto_plain_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v _menhir_s _tok
    
    and _menhir_run_187 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_PAREN ->
            let _menhir_stack = MenhirCell1_tptp_functor (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND | Tokens.COMMA | Tokens.EQUAL | Tokens.EQUIV | Tokens.IMPLY | Tokens.LEFT_IMPLY | Tokens.NOTAND | Tokens.NOTVLINE | Tokens.NOT_EQUAL | Tokens.RIGHT_PAREN | Tokens.VLINE | Tokens.XOR ->
            let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_030 c in
            _menhir_goto_constant _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v _menhir_s _tok
        | Tokens.COLON ->
            let (_startpos_f_, f) = (_startpos, _v) in
            let _v = _menhir_action_206 f in
            _menhir_goto_tff_untyped_atom _menhir_stack _menhir_lexbuf _menhir_lexer _startpos_f_ _v _menhir_s
        | _ ->
            _eRR 187
    
    and _menhir_run_033 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_tptp_functor -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell0_LEFT_PAREN (_menhir_stack, _startpos) in
        let _menhir_s = MenhirState033 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.SINGLE_QUOTED _v ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.REAL _v ->
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.RATIONAL _v ->
            _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LET_TT ->
            _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LET_FT ->
            _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ITE_T ->
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DOLLAR_WORD _v ->
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DOLLAR_DOLLAR_WORD _v ->
            _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.DISTINCT_OBJECT _v ->
            _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 33
    
    and _menhir_run_032 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_PAREN ->
            let _menhir_stack = MenhirCell1_tptp_functor (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND | Tokens.APPLY | Tokens.ARROW | Tokens.COLON | Tokens.COMMA | Tokens.EQUAL | Tokens.EQUIV | Tokens.IMPLY | Tokens.LEFT_IMPLY | Tokens.LESS | Tokens.NOTAND | Tokens.NOTVLINE | Tokens.NOT_EQUAL | Tokens.PLUS | Tokens.RIGHT_BRACKET | Tokens.RIGHT_PAREN | Tokens.STAR | Tokens.VLINE | Tokens.XOR ->
            let (_endpos_c_, _startpos_c_, c) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_030 c in
            _menhir_goto_constant _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _startpos_c_ _v _menhir_s _tok
        | _ ->
            _eRR 32
    
    and _menhir_run_316 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.COLON ->
            let _menhir_stack = MenhirCell1_variable (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState317 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.XOR ->
                _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.VLINE ->
                _menhir_run_304 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SIGMA ->
                _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.PI ->
                _menhir_run_306 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT_EQUAL ->
                _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTVLINE ->
                _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTAND ->
                _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_TF ->
                _menhir_run_307 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FF ->
                _menhir_run_318 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_326 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_IMPLY ->
                _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LAMBDA ->
                _menhir_run_309 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_F ->
                _menhir_run_327 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INDEFINITE_DESCRIPTION ->
                _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.IMPLY ->
                _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL_TY ->
                _menhir_run_311 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS_TY ->
                _menhir_run_312 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUIV ->
                _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUAL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DEFINITE_DESCRIPTION ->
                _menhir_run_313 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.AND ->
                _menhir_run_329 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 317)
        | Tokens.COMMA | Tokens.RIGHT_BRACKET ->
            let v = _v in
            let _v = _menhir_action_285 v in
            _menhir_goto_thf_variable _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 316
    
    and _menhir_run_258 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _menhir_stack = MenhirCell1_variable (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState259 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 259)
        | Tokens.RIGHT_BRACKET ->
            let v = _v in
            let _v = _menhir_action_078 v in
            _menhir_goto_fof_variable_list _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 258
    
    and _menhir_goto_fof_variable_list : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState257 ->
            _menhir_run_261 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState259 ->
            _menhir_run_260 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_261 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_fol_quantifier _menhir_cell0_LEFT_BRACKET as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_fof_variable_list (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_RIGHT_BRACKET (_menhir_stack, _endpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.COLON ->
            let _menhir_s = MenhirState263 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_254 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 263)
        | _ ->
            _eRR 262
    
    and _menhir_run_260 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_variable _menhir_cell0_COMMA -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_variable (_menhir_stack, _menhir_s, v, _, _) = _menhir_stack in
        let l = _v in
        let _v = _menhir_action_079 l v in
        _menhir_goto_fof_variable_list _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_076 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_151 t in
        _menhir_goto_tff_atomic_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _startpos_t_ _v _menhir_s _tok
    
    and _menhir_run_074 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.COLON ->
            let _menhir_stack = MenhirCell1_variable (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState075 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 75)
        | Tokens.COMMA | Tokens.RIGHT_BRACKET ->
            let v = _v in
            let _v = _menhir_action_209 v in
            _menhir_goto_tff_variable _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 74
    
    and _menhir_run_031 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_143 t in
        _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _startpos_t_ _v _menhir_s _tok
    
    and _menhir_run_604 : type  ttv_stack. (((ttv_stack, _menhir_box_input) _menhir_cell1_FOF _menhir_cell0_LEFT_PAREN, _menhir_box_input) _menhir_cell1_name _menhir_cell0_COMMA as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_formula_role (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState605 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_251 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_BRACKET ->
                _menhir_run_252 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 605)
        | _ ->
            _eRR 604
    
    and _menhir_run_588 : type  ttv_stack. (((ttv_stack, _menhir_box_input) _menhir_cell1_TFF _menhir_cell0_LEFT_PAREN, _menhir_box_input) _menhir_cell1_name _menhir_cell0_COMMA as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_formula_role (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState589 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_TF ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FF ->
                _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_179 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_BRACKET ->
                _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_F ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 589)
        | _ ->
            _eRR 588
    
    and _menhir_run_578 : type  ttv_stack. (((ttv_stack, _menhir_box_input) _menhir_cell1_THF _menhir_cell0_LEFT_PAREN, _menhir_box_input) _menhir_cell1_name _menhir_cell0_COMMA as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_formula_role (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState579 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.XOR ->
                _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.VLINE ->
                _menhir_run_304 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SIGMA ->
                _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.PI ->
                _menhir_run_306 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT_EQUAL ->
                _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTVLINE ->
                _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTAND ->
                _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_TF ->
                _menhir_run_307 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FF ->
                _menhir_run_318 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_323 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_IMPLY ->
                _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_BRACKET ->
                _menhir_run_324 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LAMBDA ->
                _menhir_run_309 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_F ->
                _menhir_run_327 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INDEFINITE_DESCRIPTION ->
                _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.IMPLY ->
                _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL_TY ->
                _menhir_run_311 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS_TY ->
                _menhir_run_312 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUIV ->
                _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUAL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DEFINITE_DESCRIPTION ->
                _menhir_run_313 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.AND ->
                _menhir_run_329 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 579)
        | _ ->
            _eRR 578
    
    and _menhir_run_568 : type  ttv_stack. (((ttv_stack, _menhir_box_input) _menhir_cell1_TPI _menhir_cell0_LEFT_PAREN, _menhir_box_input) _menhir_cell1_name _menhir_cell0_COMMA as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_formula_role (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState569 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_251 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_BRACKET ->
                _menhir_run_252 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 569)
        | _ ->
            _eRR 568
    
    and _menhir_run_545 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_CNF _menhir_cell0_LEFT_PAREN, _menhir_box_file) _menhir_cell1_name _menhir_cell0_COMMA as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_formula_role (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState546 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_456 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 546)
        | _ ->
            _eRR 545
    
    and _menhir_run_535 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_FOF _menhir_cell0_LEFT_PAREN, _menhir_box_file) _menhir_cell1_name _menhir_cell0_COMMA as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_formula_role (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState536 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_251 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_BRACKET ->
                _menhir_run_252 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 536)
        | _ ->
            _eRR 535
    
    and _menhir_run_511 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_TFF _menhir_cell0_LEFT_PAREN, _menhir_box_file) _menhir_cell1_name _menhir_cell0_COMMA as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_formula_role (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState512 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_TF ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FF ->
                _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_179 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_BRACKET ->
                _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_F ->
                _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 512)
        | _ ->
            _eRR 511
    
    and _menhir_run_501 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_THF _menhir_cell0_LEFT_PAREN, _menhir_box_file) _menhir_cell1_name _menhir_cell0_COMMA as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_formula_role (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState502 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.XOR ->
                _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.VLINE ->
                _menhir_run_304 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SIGMA ->
                _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.PI ->
                _menhir_run_306 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT_EQUAL ->
                _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTVLINE ->
                _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOTAND ->
                _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_TF ->
                _menhir_run_307 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FF ->
                _menhir_run_318 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_323 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_IMPLY ->
                _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_BRACKET ->
                _menhir_run_324 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LAMBDA ->
                _menhir_run_309 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_F ->
                _menhir_run_327 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INDEFINITE_DESCRIPTION ->
                _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.IMPLY ->
                _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL_TY ->
                _menhir_run_311 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS_TY ->
                _menhir_run_312 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUIV ->
                _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EQUAL ->
                _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DEFINITE_DESCRIPTION ->
                _menhir_run_313 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.AND ->
                _menhir_run_329 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 502)
        | _ ->
            _eRR 501
    
    and _menhir_run_009 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_TPI _menhir_cell0_LEFT_PAREN, _menhir_box_file) _menhir_cell1_name _menhir_cell0_COMMA as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_formula_role (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState010 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.REAL _v ->
                _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.RATIONAL _v ->
                _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.NOT ->
                _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LET_TT ->
                _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LET_FT ->
                _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_251 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_BRACKET ->
                _menhir_run_252 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ITE_T ->
                _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.FORALL ->
                _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.EXISTS ->
                _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.DOLLAR_WORD _v ->
                _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DOLLAR_DOLLAR_WORD _v ->
                _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.DISTINCT_OBJECT _v ->
                _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 10)
        | _ ->
            _eRR 9
    
    and _menhir_run_602 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_FOF _menhir_cell0_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_name (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState603 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.LOWER_WORD _v ->
                _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 603)
        | _ ->
            _eRR 602
    
    and _menhir_run_586 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_TFF _menhir_cell0_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_name (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState587 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.LOWER_WORD _v ->
                _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 587)
        | _ ->
            _eRR 586
    
    and _menhir_run_576 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_THF _menhir_cell0_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_name (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState577 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.LOWER_WORD _v ->
                _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 577)
        | _ ->
            _eRR 576
    
    and _menhir_run_566 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_TPI _menhir_cell0_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_name (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState567 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.LOWER_WORD _v ->
                _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 567)
        | _ ->
            _eRR 566
    
    and _menhir_run_543 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_CNF _menhir_cell0_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_name (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState544 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.LOWER_WORD _v ->
                _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 544)
        | _ ->
            _eRR 543
    
    and _menhir_run_533 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_FOF _menhir_cell0_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_name (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState534 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.LOWER_WORD _v ->
                _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 534)
        | _ ->
            _eRR 533
    
    and _menhir_run_525 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _menhir_stack = MenhirCell1_name (_menhir_stack, _menhir_s, _v) in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState526 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.SINGLE_QUOTED _v ->
                _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 526)
        | Tokens.RIGHT_BRACKET ->
            let n = _v in
            let _v = _menhir_action_123 n in
            _menhir_goto_name_list _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 525
    
    and _menhir_goto_name_list : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState526 ->
            _menhir_run_527 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState522 ->
            _menhir_run_523 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_527 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_name _menhir_cell0_COMMA -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell0_COMMA (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_name (_menhir_stack, _menhir_s, n) = _menhir_stack in
        let l = _v in
        let _v = _menhir_action_124 l n in
        _menhir_goto_name_list _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_523 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_INCLUDE _menhir_cell0_LEFT_PAREN, ttv_result) _menhir_cell1_file_name, ttv_result) _menhir_cell1_COMMA _menhir_cell0_LEFT_BRACKET -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell0_LEFT_BRACKET (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_COMMA (_menhir_stack, _menhir_s, _) = _menhir_stack in
        let l = _v in
        let _v = _menhir_action_089 l in
        _menhir_goto_formula_section _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_formula_section : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_INCLUDE _menhir_cell0_LEFT_PAREN, ttv_result) _menhir_cell1_file_name as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState596 ->
            _menhir_run_597 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState520 ->
            _menhir_run_528 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_509 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_TFF _menhir_cell0_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_name (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState510 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.LOWER_WORD _v ->
                _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 510)
        | _ ->
            _eRR 509
    
    and _menhir_run_499 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_THF _menhir_cell0_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_name (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState500 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.LOWER_WORD _v ->
                _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 500)
        | _ ->
            _eRR 499
    
    and _menhir_run_006 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_TPI _menhir_cell0_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_name (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_COMMA (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState007 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.LOWER_WORD _v ->
                _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 7)
        | _ ->
            _eRR 6
    
    let _menhir_run_000 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.TPI ->
            _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
        | Tokens.THF ->
            _menhir_run_497 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
        | Tokens.TFF ->
            _menhir_run_507 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
        | Tokens.INCLUDE ->
            _menhir_run_517 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
        | Tokens.FOF ->
            _menhir_run_531 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
        | Tokens.CNF ->
            _menhir_run_541 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
        | Tokens.EOF ->
            let _v = _menhir_action_115 () in
            _menhir_run_560 _menhir_stack _v
        | _ ->
            _eRR 0
    
    let _menhir_run_563 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.TPI ->
            let _menhir_s = MenhirState563 in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell1_TPI (_menhir_stack, _menhir_s, _startpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.LEFT_PAREN ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _menhir_stack = MenhirCell0_LEFT_PAREN (_menhir_stack, _startpos) in
                let _menhir_s = MenhirState565 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SINGLE_QUOTED _v ->
                    _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.LOWER_WORD _v ->
                    _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.INTEGER _v ->
                    _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | _ ->
                    _eRR 565)
            | _ ->
                _eRR 564)
        | Tokens.THF ->
            let _menhir_s = MenhirState563 in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell1_THF (_menhir_stack, _menhir_s, _startpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.LEFT_PAREN ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _menhir_stack = MenhirCell0_LEFT_PAREN (_menhir_stack, _startpos) in
                let _menhir_s = MenhirState575 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SINGLE_QUOTED _v ->
                    _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.LOWER_WORD _v ->
                    _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.INTEGER _v ->
                    _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | _ ->
                    _eRR 575)
            | _ ->
                _eRR 574)
        | Tokens.TFF ->
            let _menhir_s = MenhirState563 in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell1_TFF (_menhir_stack, _menhir_s, _startpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.LEFT_PAREN ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _menhir_stack = MenhirCell0_LEFT_PAREN (_menhir_stack, _startpos) in
                let _menhir_s = MenhirState585 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SINGLE_QUOTED _v ->
                    _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.LOWER_WORD _v ->
                    _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.INTEGER _v ->
                    _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | _ ->
                    _eRR 585)
            | _ ->
                _eRR 584)
        | Tokens.INCLUDE ->
            let _menhir_s = MenhirState563 in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell1_INCLUDE (_menhir_stack, _menhir_s, _startpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.LEFT_PAREN ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _menhir_stack = MenhirCell0_LEFT_PAREN (_menhir_stack, _startpos) in
                let _menhir_s = MenhirState595 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SINGLE_QUOTED _v ->
                    _menhir_run_519 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | _ ->
                    _eRR 595)
            | _ ->
                _eRR 594)
        | Tokens.FOF ->
            let _menhir_s = MenhirState563 in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell1_FOF (_menhir_stack, _menhir_s, _startpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.LEFT_PAREN ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _menhir_stack = MenhirCell0_LEFT_PAREN (_menhir_stack, _startpos) in
                let _menhir_s = MenhirState601 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SINGLE_QUOTED _v ->
                    _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.LOWER_WORD _v ->
                    _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.INTEGER _v ->
                    _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | _ ->
                    _eRR 601)
            | _ ->
                _eRR 600)
        | Tokens.EOF ->
            let _v = _menhir_action_111 () in
            _menhir_goto_input _menhir_stack _v
        | Tokens.CNF ->
            let _menhir_s = MenhirState563 in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell1_CNF (_menhir_stack, _menhir_s, _startpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.LEFT_PAREN ->
                let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                let _menhir_stack = MenhirCell0_LEFT_PAREN (_menhir_stack, _startpos) in
                let _menhir_s = MenhirState612 in
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.SINGLE_QUOTED _v ->
                    _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.LOWER_WORD _v ->
                    _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | Tokens.INTEGER _v ->
                    _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                | _ ->
                    _eRR 612)
            | _ ->
                _eRR 611)
        | _ ->
            _eRR 563
    
  end
  
  let input =
    fun _menhir_lexer _menhir_lexbuf ->
      let _menhir_stack = () in
      let MenhirBox_input v = _menhir_run_563 _menhir_stack _menhir_lexbuf _menhir_lexer in
      v
  
  let file =
    fun _menhir_lexer _menhir_lexbuf ->
      let _menhir_stack = () in
      let MenhirBox_file v = _menhir_run_000 _menhir_stack _menhir_lexbuf _menhir_lexer in
      v
  
end
