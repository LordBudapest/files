
module MenhirBasics = struct
  
  exception Error = Parsing.Parse_error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | XOR
    | WITH
    | VOID
    | UNIT
    | TYPE
    | TRUE
    | TIMES
    | THEORY
    | THEN
    | STRING of (
# 41 "src/parsers/native_parser.mly"
       (string)
# 24 "src/parsers/native_parser.ml"
  )
    | SLASH
    | SHARP
    | RIGHTSQ
    | RIGHTPAR
    | RIGHTBR
    | RIGHTARROW
    | REWRITING
    | REAL
    | QUOTE
    | QM_ID of (
# 38 "src/parsers/native_parser.mly"
       (string)
# 38 "src/parsers/native_parser.ml"
  )
    | QM
    | PV
    | PROP
    | PRED
    | POWDOT
    | POW
    | PLUS
    | PERCENT
    | OR
    | OF
    | NUM of (
# 40 "src/parsers/native_parser.mly"
       (AltErgoLib.Numbers.Q.t)
# 53 "src/parsers/native_parser.ml"
  )
    | NOTEQ
    | NOT
    | MINUS
    | MATCH
    | MAPS_TO
    | LT
    | LRARROW
    | LOGIC
    | LET
    | LEFTSQ
    | LEFTPAR
    | LEFTBR
    | LEFTARROW
    | LE
    | INTEGER of (
# 39 "src/parsers/native_parser.mly"
       (string)
# 72 "src/parsers/native_parser.ml"
  )
    | INT
    | IN
    | IF
    | ID of (
# 37 "src/parsers/native_parser.mly"
       (string)
# 80 "src/parsers/native_parser.ml"
  )
    | HAT
    | GT
    | GOAL
    | GE
    | FUNC
    | FORALL
    | FALSE
    | EXTENDS
    | EXISTS
    | EQUAL
    | EOF
    | END
    | ELSE
    | DOT
    | DISTINCT
    | CUT
    | COMMA
    | COLON
    | CHECK_SAT
    | CHECK
    | CASESPLIT
    | BOOL
    | BITV
    | BAR
    | AXIOM
    | AT
    | AND
    | AC
  
end

include MenhirBasics

# 28 "src/parsers/native_parser.mly"
  
  [@@@ocaml.warning "-33"]
  open AltErgoLib
  open Options
  open Parsed_interface

# 122 "src/parsers/native_parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState000 : ('s, _menhir_box_file_parser) _menhir_state
    (** State 000.
        Stack shape : .
        Start symbol: file_parser. *)

  | MenhirState001 : (('s, _menhir_box_file_parser) _menhir_cell1_TYPE, _menhir_box_file_parser) _menhir_state
    (** State 001.
        Stack shape : TYPE.
        Start symbol: file_parser. *)

  | MenhirState002 : (('s, 'r) _menhir_cell1_QUOTE, 'r) _menhir_state
    (** State 002.
        Stack shape : QUOTE.
        Start symbol: <undetermined>. *)

  | MenhirState005 : (('s, _menhir_box_file_parser) _menhir_cell1_LEFTPAR, _menhir_box_file_parser) _menhir_state
    (** State 005.
        Stack shape : LEFTPAR.
        Start symbol: file_parser. *)

  | MenhirState007 : (('s, _menhir_box_file_parser) _menhir_cell1_type_var, _menhir_box_file_parser) _menhir_state
    (** State 007.
        Stack shape : type_var.
        Start symbol: file_parser. *)

  | MenhirState011 : ((('s, _menhir_box_file_parser) _menhir_cell1_TYPE, _menhir_box_file_parser) _menhir_cell1_type_vars, _menhir_box_file_parser) _menhir_state
    (** State 011.
        Stack shape : TYPE type_vars.
        Start symbol: file_parser. *)

  | MenhirState013 : (((('s, _menhir_box_file_parser) _menhir_cell1_TYPE, _menhir_box_file_parser) _menhir_cell1_type_vars, _menhir_box_file_parser) _menhir_cell1_ident, _menhir_box_file_parser) _menhir_state
    (** State 013.
        Stack shape : TYPE type_vars ident.
        Start symbol: file_parser. *)

  | MenhirState014 : (('s, _menhir_box_file_parser) _menhir_cell1_LEFTBR, _menhir_box_file_parser) _menhir_state
    (** State 014.
        Stack shape : LEFTBR.
        Start symbol: file_parser. *)

  | MenhirState018 : (('s, _menhir_box_file_parser) _menhir_cell1_label_with_type _menhir_cell0_PV, _menhir_box_file_parser) _menhir_state
    (** State 018.
        Stack shape : label_with_type PV.
        Start symbol: file_parser. *)

  | MenhirState021 : (('s, _menhir_box_file_parser) _menhir_cell1_ident, _menhir_box_file_parser) _menhir_state
    (** State 021.
        Stack shape : ident.
        Start symbol: file_parser. *)

  | MenhirState024 : (('s, 'r) _menhir_cell1_LEFTPAR, 'r) _menhir_state
    (** State 024.
        Stack shape : LEFTPAR.
        Start symbol: <undetermined>. *)

  | MenhirState032 : (('s, 'r) _menhir_cell1_primitive_type, 'r) _menhir_state
    (** State 032.
        Stack shape : primitive_type.
        Start symbol: <undetermined>. *)

  | MenhirState033 : ((('s, 'r) _menhir_cell1_primitive_type, 'r) _menhir_cell1_COMMA, 'r) _menhir_state
    (** State 033.
        Stack shape : primitive_type COMMA.
        Start symbol: <undetermined>. *)

  | MenhirState038 : ((('s, 'r) _menhir_cell1_LEFTPAR, 'r) _menhir_cell1_list1_primitive_type_sep_comma _menhir_cell0_RIGHTPAR, 'r) _menhir_state
    (** State 038.
        Stack shape : LEFTPAR list1_primitive_type_sep_comma RIGHTPAR.
        Start symbol: <undetermined>. *)

  | MenhirState040 : ((('s, _menhir_box_file_parser) _menhir_cell1_ident, _menhir_box_file_parser) _menhir_cell1_primitive_type, _menhir_box_file_parser) _menhir_state
    (** State 040.
        Stack shape : ident primitive_type.
        Start symbol: file_parser. *)

  | MenhirState042 : ((((('s, _menhir_box_file_parser) _menhir_cell1_TYPE, _menhir_box_file_parser) _menhir_cell1_type_vars, _menhir_box_file_parser) _menhir_cell1_ident, _menhir_box_file_parser) _menhir_cell1_list1_constructors_sep_bar, _menhir_box_file_parser) _menhir_state
    (** State 042.
        Stack shape : TYPE type_vars ident list1_constructors_sep_bar.
        Start symbol: file_parser. *)

  | MenhirState043 : ((((('s, _menhir_box_file_parser) _menhir_cell1_type_vars, _menhir_box_file_parser) _menhir_cell1_ident, _menhir_box_file_parser) _menhir_cell1_list1_constructors_sep_bar, _menhir_box_file_parser) _menhir_cell1_AND, _menhir_box_file_parser) _menhir_state
    (** State 043.
        Stack shape : type_vars ident list1_constructors_sep_bar AND.
        Start symbol: file_parser. *)

  | MenhirState044 : (((((('s, _menhir_box_file_parser) _menhir_cell1_type_vars, _menhir_box_file_parser) _menhir_cell1_ident, _menhir_box_file_parser) _menhir_cell1_list1_constructors_sep_bar, _menhir_box_file_parser) _menhir_cell1_AND, _menhir_box_file_parser) _menhir_cell1_type_vars, _menhir_box_file_parser) _menhir_state
    (** State 044.
        Stack shape : type_vars ident list1_constructors_sep_bar AND type_vars.
        Start symbol: file_parser. *)

  | MenhirState046 : ((((((('s, _menhir_box_file_parser) _menhir_cell1_type_vars, _menhir_box_file_parser) _menhir_cell1_ident, _menhir_box_file_parser) _menhir_cell1_list1_constructors_sep_bar, _menhir_box_file_parser) _menhir_cell1_AND, _menhir_box_file_parser) _menhir_cell1_type_vars, _menhir_box_file_parser) _menhir_cell1_ident, _menhir_box_file_parser) _menhir_state
    (** State 046.
        Stack shape : type_vars ident list1_constructors_sep_bar AND type_vars ident.
        Start symbol: file_parser. *)

  | MenhirState047 : (((((((('s, _menhir_box_file_parser) _menhir_cell1_type_vars, _menhir_box_file_parser) _menhir_cell1_ident, _menhir_box_file_parser) _menhir_cell1_list1_constructors_sep_bar, _menhir_box_file_parser) _menhir_cell1_AND, _menhir_box_file_parser) _menhir_cell1_type_vars, _menhir_box_file_parser) _menhir_cell1_ident, _menhir_box_file_parser) _menhir_cell1_list1_constructors_sep_bar, _menhir_box_file_parser) _menhir_state
    (** State 047.
        Stack shape : type_vars ident list1_constructors_sep_bar AND type_vars ident list1_constructors_sep_bar.
        Start symbol: file_parser. *)

  | MenhirState050 : (('s, _menhir_box_file_parser) _menhir_cell1_ident, _menhir_box_file_parser) _menhir_state
    (** State 050.
        Stack shape : ident.
        Start symbol: file_parser. *)

  | MenhirState053 : (('s, _menhir_box_file_parser) _menhir_cell1_ident _menhir_cell0_algebraic_args, _menhir_box_file_parser) _menhir_state
    (** State 053.
        Stack shape : ident algebraic_args.
        Start symbol: file_parser. *)

  | MenhirState057 : (('s, _menhir_box_file_parser) _menhir_cell1_THEORY, _menhir_box_file_parser) _menhir_state
    (** State 057.
        Stack shape : THEORY.
        Start symbol: file_parser. *)

  | MenhirState059 : ((('s, _menhir_box_file_parser) _menhir_cell1_THEORY, _menhir_box_file_parser) _menhir_cell1_ident, _menhir_box_file_parser) _menhir_state
    (** State 059.
        Stack shape : THEORY ident.
        Start symbol: file_parser. *)

  | MenhirState061 : (((('s, _menhir_box_file_parser) _menhir_cell1_THEORY, _menhir_box_file_parser) _menhir_cell1_ident, _menhir_box_file_parser) _menhir_cell1_ident, _menhir_box_file_parser) _menhir_state
    (** State 061.
        Stack shape : THEORY ident ident.
        Start symbol: file_parser. *)

  | MenhirState062 : (('s, _menhir_box_file_parser) _menhir_cell1_CASESPLIT, _menhir_box_file_parser) _menhir_state
    (** State 062.
        Stack shape : CASESPLIT.
        Start symbol: file_parser. *)

  | MenhirState064 : ((('s, _menhir_box_file_parser) _menhir_cell1_CASESPLIT, _menhir_box_file_parser) _menhir_cell1_ident, _menhir_box_file_parser) _menhir_state
    (** State 064.
        Stack shape : CASESPLIT ident.
        Start symbol: file_parser. *)

  | MenhirState068 : (('s, 'r) _menhir_cell1_STRING, 'r) _menhir_state
    (** State 068.
        Stack shape : STRING.
        Start symbol: <undetermined>. *)

  | MenhirState070 : (('s, 'r) _menhir_cell1_NOT, 'r) _menhir_state
    (** State 070.
        Stack shape : NOT.
        Start symbol: <undetermined>. *)

  | MenhirState071 : (('s, 'r) _menhir_cell1_MINUS, 'r) _menhir_state
    (** State 071.
        Stack shape : MINUS.
        Start symbol: <undetermined>. *)

  | MenhirState072 : (('s, 'r) _menhir_cell1_MATCH, 'r) _menhir_state
    (** State 072.
        Stack shape : MATCH.
        Start symbol: <undetermined>. *)

  | MenhirState073 : (('s, 'r) _menhir_cell1_LET, 'r) _menhir_state
    (** State 073.
        Stack shape : LET.
        Start symbol: <undetermined>. *)

  | MenhirState075 : ((('s, 'r) _menhir_cell1_LET, 'r) _menhir_cell1_let_binders, 'r) _menhir_state
    (** State 075.
        Stack shape : LET let_binders.
        Start symbol: <undetermined>. *)

  | MenhirState081 : (('s, 'r) _menhir_cell1_LEFTPAR, 'r) _menhir_state
    (** State 081.
        Stack shape : LEFTPAR.
        Start symbol: <undetermined>. *)

  | MenhirState082 : (('s, 'r) _menhir_cell1_LEFTBR, 'r) _menhir_state
    (** State 082.
        Stack shape : LEFTBR.
        Start symbol: <undetermined>. *)

  | MenhirState086 : ((('s, 'r) _menhir_cell1_LEFTBR, 'r) _menhir_cell1_simple_expr, 'r) _menhir_state
    (** State 086.
        Stack shape : LEFTBR simple_expr.
        Start symbol: <undetermined>. *)

  | MenhirState090 : (('s, 'r) _menhir_cell1_ident, 'r) _menhir_state
    (** State 090.
        Stack shape : ident.
        Start symbol: <undetermined>. *)

  | MenhirState091 : (('s, 'r) _menhir_cell1_IF, 'r) _menhir_state
    (** State 091.
        Stack shape : IF.
        Start symbol: <undetermined>. *)

  | MenhirState092 : (('s, 'r) _menhir_cell1_FORALL, 'r) _menhir_state
    (** State 092.
        Stack shape : FORALL.
        Start symbol: <undetermined>. *)

  | MenhirState096 : (('s, 'r) _menhir_cell1_named_ident, 'r) _menhir_state
    (** State 096.
        Stack shape : named_ident.
        Start symbol: <undetermined>. *)

  | MenhirState099 : (('s, 'r) _menhir_cell1_multi_logic_binder, 'r) _menhir_state
    (** State 099.
        Stack shape : multi_logic_binder.
        Start symbol: <undetermined>. *)

  | MenhirState101 : (('s, 'r) _menhir_cell1_list1_named_ident_sep_comma, 'r) _menhir_state
    (** State 101.
        Stack shape : list1_named_ident_sep_comma.
        Start symbol: <undetermined>. *)

  | MenhirState102 : ((('s, 'r) _menhir_cell1_list1_named_ident_sep_comma, 'r) _menhir_cell1_primitive_type, 'r) _menhir_state
    (** State 102.
        Stack shape : list1_named_ident_sep_comma primitive_type.
        Start symbol: <undetermined>. *)

  | MenhirState104 : ((('s, 'r) _menhir_cell1_FORALL, 'r) _menhir_cell1_list1_multi_logic_binder, 'r) _menhir_state
    (** State 104.
        Stack shape : FORALL list1_multi_logic_binder.
        Start symbol: <undetermined>. *)

  | MenhirState105 : ((('s, 'r) _menhir_cell1_list1_multi_logic_binder, 'r) _menhir_cell1_LEFTSQ, 'r) _menhir_state
    (** State 105.
        Stack shape : list1_multi_logic_binder LEFTSQ.
        Start symbol: <undetermined>. *)

  | MenhirState106 : (('s, 'r) _menhir_cell1_EXISTS, 'r) _menhir_state
    (** State 106.
        Stack shape : EXISTS.
        Start symbol: <undetermined>. *)

  | MenhirState107 : ((('s, 'r) _menhir_cell1_EXISTS, 'r) _menhir_cell1_list1_multi_logic_binder, 'r) _menhir_state
    (** State 107.
        Stack shape : EXISTS list1_multi_logic_binder.
        Start symbol: <undetermined>. *)

  | MenhirState108 : (((('s, 'r) _menhir_cell1_EXISTS, 'r) _menhir_cell1_list1_multi_logic_binder, 'r) _menhir_cell1_triggers, 'r) _menhir_state
    (** State 108.
        Stack shape : EXISTS list1_multi_logic_binder triggers.
        Start symbol: <undetermined>. *)

  | MenhirState109 : (((('s, 'r) _menhir_cell1_list1_multi_logic_binder, 'r) _menhir_cell1_triggers, 'r) _menhir_cell1_LEFTBR, 'r) _menhir_state
    (** State 109.
        Stack shape : list1_multi_logic_binder triggers LEFTBR.
        Start symbol: <undetermined>. *)

  | MenhirState111 : (('s, 'r) _menhir_cell1_DISTINCT _menhir_cell0_LEFTPAR, 'r) _menhir_state
    (** State 111.
        Stack shape : DISTINCT LEFTPAR.
        Start symbol: <undetermined>. *)

  | MenhirState112 : (('s, 'r) _menhir_cell1_CUT, 'r) _menhir_state
    (** State 112.
        Stack shape : CUT.
        Start symbol: <undetermined>. *)

  | MenhirState113 : (('s, 'r) _menhir_cell1_CHECK, 'r) _menhir_state
    (** State 113.
        Stack shape : CHECK.
        Start symbol: <undetermined>. *)

  | MenhirState115 : (('s, 'r) _menhir_cell1_simple_expr, 'r) _menhir_state
    (** State 115.
        Stack shape : simple_expr.
        Start symbol: <undetermined>. *)

  | MenhirState118 : (('s, 'r) _menhir_cell1_simple_expr _menhir_cell0_QM, 'r) _menhir_state
    (** State 118.
        Stack shape : simple_expr QM.
        Start symbol: <undetermined>. *)

  | MenhirState120 : (('s, 'r) _menhir_cell1_simple_expr _menhir_cell0_LEFTSQ, 'r) _menhir_state
    (** State 120.
        Stack shape : simple_expr LEFTSQ.
        Start symbol: <undetermined>. *)

  | MenhirState121 : ((('s, 'r) _menhir_cell1_simple_expr _menhir_cell0_LEFTSQ, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 121.
        Stack shape : simple_expr LEFTSQ lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState122 : ((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_XOR, 'r) _menhir_state
    (** State 122.
        Stack shape : lexpr XOR.
        Start symbol: <undetermined>. *)

  | MenhirState123 : (((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_XOR, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 123.
        Stack shape : lexpr XOR lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState124 : ((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_TIMES, 'r) _menhir_state
    (** State 124.
        Stack shape : lexpr TIMES.
        Start symbol: <undetermined>. *)

  | MenhirState125 : (((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_TIMES, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 125.
        Stack shape : lexpr TIMES lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState133 : (('s, 'r) _menhir_cell1_ident _menhir_cell0_LEFTPAR, 'r) _menhir_state
    (** State 133.
        Stack shape : ident LEFTPAR.
        Start symbol: <undetermined>. *)

  | MenhirState137 : (('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 137.
        Stack shape : lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState138 : ((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_SLASH, 'r) _menhir_state
    (** State 138.
        Stack shape : lexpr SLASH.
        Start symbol: <undetermined>. *)

  | MenhirState139 : (((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_SLASH, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 139.
        Stack shape : lexpr SLASH lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState140 : ((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_RIGHTARROW, 'r) _menhir_state
    (** State 140.
        Stack shape : lexpr RIGHTARROW.
        Start symbol: <undetermined>. *)

  | MenhirState141 : (((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_RIGHTARROW, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 141.
        Stack shape : lexpr RIGHTARROW lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState142 : ((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_POWDOT, 'r) _menhir_state
    (** State 142.
        Stack shape : lexpr POWDOT.
        Start symbol: <undetermined>. *)

  | MenhirState143 : (((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_POWDOT, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 143.
        Stack shape : lexpr POWDOT lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState144 : ((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_POW, 'r) _menhir_state
    (** State 144.
        Stack shape : lexpr POW.
        Start symbol: <undetermined>. *)

  | MenhirState145 : (((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_POW, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 145.
        Stack shape : lexpr POW lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState146 : ((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_PLUS, 'r) _menhir_state
    (** State 146.
        Stack shape : lexpr PLUS.
        Start symbol: <undetermined>. *)

  | MenhirState147 : (((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_PLUS, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 147.
        Stack shape : lexpr PLUS lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState148 : ((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_PERCENT, 'r) _menhir_state
    (** State 148.
        Stack shape : lexpr PERCENT.
        Start symbol: <undetermined>. *)

  | MenhirState149 : (((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_PERCENT, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 149.
        Stack shape : lexpr PERCENT lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState150 : ((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_AT, 'r) _menhir_state
    (** State 150.
        Stack shape : lexpr AT.
        Start symbol: <undetermined>. *)

  | MenhirState151 : (((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_AT, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 151.
        Stack shape : lexpr AT lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState152 : ((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_OR, 'r) _menhir_state
    (** State 152.
        Stack shape : lexpr OR.
        Start symbol: <undetermined>. *)

  | MenhirState153 : (((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_OR, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 153.
        Stack shape : lexpr OR lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState154 : ((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_NOTEQ, 'r) _menhir_state
    (** State 154.
        Stack shape : lexpr NOTEQ.
        Start symbol: <undetermined>. *)

  | MenhirState155 : (((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_NOTEQ, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 155.
        Stack shape : lexpr NOTEQ lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState156 : ((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_MINUS, 'r) _menhir_state
    (** State 156.
        Stack shape : lexpr MINUS.
        Start symbol: <undetermined>. *)

  | MenhirState157 : (((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_MINUS, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 157.
        Stack shape : lexpr MINUS lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState158 : ((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_LT, 'r) _menhir_state
    (** State 158.
        Stack shape : lexpr LT.
        Start symbol: <undetermined>. *)

  | MenhirState159 : (((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_LT, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 159.
        Stack shape : lexpr LT lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState160 : ((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_LE, 'r) _menhir_state
    (** State 160.
        Stack shape : lexpr LE.
        Start symbol: <undetermined>. *)

  | MenhirState161 : (((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_LE, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 161.
        Stack shape : lexpr LE lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState162 : ((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_GT, 'r) _menhir_state
    (** State 162.
        Stack shape : lexpr GT.
        Start symbol: <undetermined>. *)

  | MenhirState163 : (((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_GT, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 163.
        Stack shape : lexpr GT lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState164 : ((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_GE, 'r) _menhir_state
    (** State 164.
        Stack shape : lexpr GE.
        Start symbol: <undetermined>. *)

  | MenhirState165 : (((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_GE, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 165.
        Stack shape : lexpr GE lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState166 : ((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_EQUAL, 'r) _menhir_state
    (** State 166.
        Stack shape : lexpr EQUAL.
        Start symbol: <undetermined>. *)

  | MenhirState167 : (((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_EQUAL, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 167.
        Stack shape : lexpr EQUAL lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState168 : ((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_AND, 'r) _menhir_state
    (** State 168.
        Stack shape : lexpr AND.
        Start symbol: <undetermined>. *)

  | MenhirState169 : (((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_AND, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 169.
        Stack shape : lexpr AND lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState170 : ((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_LRARROW, 'r) _menhir_state
    (** State 170.
        Stack shape : lexpr LRARROW.
        Start symbol: <undetermined>. *)

  | MenhirState171 : (((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_LRARROW, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 171.
        Stack shape : lexpr LRARROW lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState172 : ((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_COMMA, 'r) _menhir_state
    (** State 172.
        Stack shape : lexpr COMMA.
        Start symbol: <undetermined>. *)

  | MenhirState175 : ((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_LEFTARROW, 'r) _menhir_state
    (** State 175.
        Stack shape : lexpr LEFTARROW.
        Start symbol: <undetermined>. *)

  | MenhirState176 : (((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_LEFTARROW, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 176.
        Stack shape : lexpr LEFTARROW lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState180 : (('s, 'r) _menhir_cell1_array_assignement, 'r) _menhir_state
    (** State 180.
        Stack shape : array_assignement.
        Start symbol: <undetermined>. *)

  | MenhirState181 : ((('s, 'r) _menhir_cell1_array_assignement, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 181.
        Stack shape : array_assignement lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState183 : (('s, 'r) _menhir_cell1_simple_expr, 'r) _menhir_state
    (** State 183.
        Stack shape : simple_expr.
        Start symbol: <undetermined>. *)

  | MenhirState185 : (('s, 'r) _menhir_cell1_simple_expr, 'r) _menhir_state
    (** State 185.
        Stack shape : simple_expr.
        Start symbol: <undetermined>. *)

  | MenhirState186 : ((('s, 'r) _menhir_cell1_simple_expr, 'r) _menhir_cell1_primitive_type, 'r) _menhir_state
    (** State 186.
        Stack shape : simple_expr primitive_type.
        Start symbol: <undetermined>. *)

  | MenhirState191 : ((('s, 'r) _menhir_cell1_DISTINCT _menhir_cell0_LEFTPAR, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 191.
        Stack shape : DISTINCT LEFTPAR lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState192 : ((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_COMMA, 'r) _menhir_state
    (** State 192.
        Stack shape : lexpr COMMA.
        Start symbol: <undetermined>. *)

  | MenhirState194 : (((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_COMMA, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 194.
        Stack shape : lexpr COMMA lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState195 : ((((('s, 'r) _menhir_cell1_list1_multi_logic_binder, 'r) _menhir_cell1_triggers, 'r) _menhir_cell1_LEFTBR, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 195.
        Stack shape : list1_multi_logic_binder triggers LEFTBR lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState197 : (((((('s, 'r) _menhir_cell1_list1_multi_logic_binder, 'r) _menhir_cell1_triggers, 'r) _menhir_cell1_LEFTBR, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_COMMA, 'r) _menhir_state
    (** State 197.
        Stack shape : list1_multi_logic_binder triggers LEFTBR lexpr COMMA.
        Start symbol: <undetermined>. *)

  | MenhirState201 : ((((('s, 'r) _menhir_cell1_EXISTS, 'r) _menhir_cell1_list1_multi_logic_binder, 'r) _menhir_cell1_triggers, 'r) _menhir_cell1_filters, 'r) _menhir_state
    (** State 201.
        Stack shape : EXISTS list1_multi_logic_binder triggers filters.
        Start symbol: <undetermined>. *)

  | MenhirState202 : (((((('s, 'r) _menhir_cell1_EXISTS, 'r) _menhir_cell1_list1_multi_logic_binder, 'r) _menhir_cell1_triggers, 'r) _menhir_cell1_filters, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 202.
        Stack shape : EXISTS list1_multi_logic_binder triggers filters lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState204 : (('s, 'r) _menhir_cell1_trigger, 'r) _menhir_state
    (** State 204.
        Stack shape : trigger.
        Start symbol: <undetermined>. *)

  | MenhirState208 : (('s, 'r) _menhir_cell1_lexpr_or_dom, 'r) _menhir_state
    (** State 208.
        Stack shape : lexpr_or_dom.
        Start symbol: <undetermined>. *)

  | MenhirState210 : (('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 210.
        Stack shape : lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState211 : ((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_IN, 'r) _menhir_state
    (** State 211.
        Stack shape : lexpr IN.
        Start symbol: <undetermined>. *)

  | MenhirState214 : (((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_IN, 'r) _menhir_cell1_sq, 'r) _menhir_state
    (** State 214.
        Stack shape : lexpr IN sq.
        Start symbol: <undetermined>. *)

  | MenhirState224 : ((((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_IN, 'r) _menhir_cell1_sq, 'r) _menhir_cell1_bound, 'r) _menhir_state
    (** State 224.
        Stack shape : lexpr IN sq bound.
        Start symbol: <undetermined>. *)

  | MenhirState225 : (((((('s, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_IN, 'r) _menhir_cell1_sq, 'r) _menhir_cell1_bound, 'r) _menhir_cell1_bound, 'r) _menhir_state
    (** State 225.
        Stack shape : lexpr IN sq bound bound.
        Start symbol: <undetermined>. *)

  | MenhirState228 : (('s, 'r) _menhir_cell1_ident, 'r) _menhir_state
    (** State 228.
        Stack shape : ident.
        Start symbol: <undetermined>. *)

  | MenhirState229 : ((('s, 'r) _menhir_cell1_ident, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 229.
        Stack shape : ident lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState232 : (((('s, 'r) _menhir_cell1_FORALL, 'r) _menhir_cell1_list1_multi_logic_binder, 'r) _menhir_cell1_triggers, 'r) _menhir_state
    (** State 232.
        Stack shape : FORALL list1_multi_logic_binder triggers.
        Start symbol: <undetermined>. *)

  | MenhirState234 : ((((('s, 'r) _menhir_cell1_FORALL, 'r) _menhir_cell1_list1_multi_logic_binder, 'r) _menhir_cell1_triggers, 'r) _menhir_cell1_filters, 'r) _menhir_state
    (** State 234.
        Stack shape : FORALL list1_multi_logic_binder triggers filters.
        Start symbol: <undetermined>. *)

  | MenhirState235 : (((((('s, 'r) _menhir_cell1_FORALL, 'r) _menhir_cell1_list1_multi_logic_binder, 'r) _menhir_cell1_triggers, 'r) _menhir_cell1_filters, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 235.
        Stack shape : FORALL list1_multi_logic_binder triggers filters lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState236 : ((('s, 'r) _menhir_cell1_IF, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 236.
        Stack shape : IF lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState237 : (((('s, 'r) _menhir_cell1_IF, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_THEN, 'r) _menhir_state
    (** State 237.
        Stack shape : IF lexpr THEN.
        Start symbol: <undetermined>. *)

  | MenhirState238 : ((((('s, 'r) _menhir_cell1_IF, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_THEN, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 238.
        Stack shape : IF lexpr THEN lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState239 : (((((('s, 'r) _menhir_cell1_IF, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_THEN, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_ELSE, 'r) _menhir_state
    (** State 239.
        Stack shape : IF lexpr THEN lexpr ELSE.
        Start symbol: <undetermined>. *)

  | MenhirState240 : ((((((('s, 'r) _menhir_cell1_IF, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_THEN, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_ELSE, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 240.
        Stack shape : IF lexpr THEN lexpr ELSE lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState241 : ((('s, 'r) _menhir_cell1_ident, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 241.
        Stack shape : ident lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState242 : (((('s, 'r) _menhir_cell1_ident, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_PV, 'r) _menhir_state
    (** State 242.
        Stack shape : ident lexpr PV.
        Start symbol: <undetermined>. *)

  | MenhirState247 : ((('s, 'r) _menhir_cell1_LEFTPAR, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 247.
        Stack shape : LEFTPAR lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState249 : (((('s, 'r) _menhir_cell1_LET, 'r) _menhir_cell1_let_binders, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 249.
        Stack shape : LET let_binders lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState251 : (('s, 'r) _menhir_cell1_ident, 'r) _menhir_state
    (** State 251.
        Stack shape : ident.
        Start symbol: <undetermined>. *)

  | MenhirState252 : ((('s, 'r) _menhir_cell1_ident, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 252.
        Stack shape : ident lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState253 : (((('s, 'r) _menhir_cell1_ident, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_COMMA, 'r) _menhir_state
    (** State 253.
        Stack shape : ident lexpr COMMA.
        Start symbol: <undetermined>. *)

  | MenhirState255 : ((('s, 'r) _menhir_cell1_MATCH, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 255.
        Stack shape : MATCH lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState256 : (((('s, 'r) _menhir_cell1_MATCH, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_WITH, 'r) _menhir_state
    (** State 256.
        Stack shape : MATCH lexpr WITH.
        Start symbol: <undetermined>. *)

  | MenhirState257 : ((((('s, 'r) _menhir_cell1_MATCH, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_WITH, 'r) _menhir_cell1_BAR, 'r) _menhir_state
    (** State 257.
        Stack shape : MATCH lexpr WITH BAR.
        Start symbol: <undetermined>. *)

  | MenhirState259 : (((((('s, 'r) _menhir_cell1_MATCH, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_WITH, 'r) _menhir_cell1_BAR, 'r) _menhir_cell1_simple_pattern, 'r) _menhir_state
    (** State 259.
        Stack shape : MATCH lexpr WITH BAR simple_pattern.
        Start symbol: <undetermined>. *)

  | MenhirState260 : ((((((('s, 'r) _menhir_cell1_MATCH, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_WITH, 'r) _menhir_cell1_BAR, 'r) _menhir_cell1_simple_pattern, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 260.
        Stack shape : MATCH lexpr WITH BAR simple_pattern lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState262 : (('s, 'r) _menhir_cell1_ident _menhir_cell0_LEFTPAR, 'r) _menhir_state
    (** State 262.
        Stack shape : ident LEFTPAR.
        Start symbol: <undetermined>. *)

  | MenhirState266 : (('s, 'r) _menhir_cell1_ident, 'r) _menhir_state
    (** State 266.
        Stack shape : ident.
        Start symbol: <undetermined>. *)

  | MenhirState269 : ((((('s, 'r) _menhir_cell1_MATCH, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_WITH, 'r) _menhir_cell1_simple_pattern, 'r) _menhir_state
    (** State 269.
        Stack shape : MATCH lexpr WITH simple_pattern.
        Start symbol: <undetermined>. *)

  | MenhirState270 : (((((('s, 'r) _menhir_cell1_MATCH, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_WITH, 'r) _menhir_cell1_simple_pattern, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 270.
        Stack shape : MATCH lexpr WITH simple_pattern lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState273 : ((((('s, 'r) _menhir_cell1_MATCH, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_WITH, 'r) _menhir_cell1_list1_match_cases, 'r) _menhir_state
    (** State 273.
        Stack shape : MATCH lexpr WITH list1_match_cases.
        Start symbol: <undetermined>. *)

  | MenhirState275 : (((((('s, 'r) _menhir_cell1_MATCH, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_WITH, 'r) _menhir_cell1_list1_match_cases, 'r) _menhir_cell1_simple_pattern, 'r) _menhir_state
    (** State 275.
        Stack shape : MATCH lexpr WITH list1_match_cases simple_pattern.
        Start symbol: <undetermined>. *)

  | MenhirState276 : ((((((('s, 'r) _menhir_cell1_MATCH, 'r) _menhir_cell1_lexpr, 'r) _menhir_cell1_WITH, 'r) _menhir_cell1_list1_match_cases, 'r) _menhir_cell1_simple_pattern, 'r) _menhir_cell1_lexpr, 'r) _menhir_state
    (** State 276.
        Stack shape : MATCH lexpr WITH list1_match_cases simple_pattern lexpr.
        Start symbol: <undetermined>. *)

  | MenhirState280 : (((('s, _menhir_box_file_parser) _menhir_cell1_CASESPLIT, _menhir_box_file_parser) _menhir_cell1_ident, _menhir_box_file_parser) _menhir_cell1_lexpr, _menhir_box_file_parser) _menhir_state
    (** State 280.
        Stack shape : CASESPLIT ident lexpr.
        Start symbol: file_parser. *)

  | MenhirState281 : (('s, _menhir_box_file_parser) _menhir_cell1_AXIOM, _menhir_box_file_parser) _menhir_state
    (** State 281.
        Stack shape : AXIOM.
        Start symbol: file_parser. *)

  | MenhirState283 : ((('s, _menhir_box_file_parser) _menhir_cell1_AXIOM, _menhir_box_file_parser) _menhir_cell1_ident, _menhir_box_file_parser) _menhir_state
    (** State 283.
        Stack shape : AXIOM ident.
        Start symbol: file_parser. *)

  | MenhirState284 : (((('s, _menhir_box_file_parser) _menhir_cell1_AXIOM, _menhir_box_file_parser) _menhir_cell1_ident, _menhir_box_file_parser) _menhir_cell1_lexpr, _menhir_box_file_parser) _menhir_state
    (** State 284.
        Stack shape : AXIOM ident lexpr.
        Start symbol: file_parser. *)

  | MenhirState287 : (('s, _menhir_box_file_parser) _menhir_cell1_theory_elt, _menhir_box_file_parser) _menhir_state
    (** State 287.
        Stack shape : theory_elt.
        Start symbol: file_parser. *)

  | MenhirState289 : (('s, _menhir_box_file_parser) _menhir_cell1_REWRITING, _menhir_box_file_parser) _menhir_state
    (** State 289.
        Stack shape : REWRITING.
        Start symbol: file_parser. *)

  | MenhirState291 : ((('s, _menhir_box_file_parser) _menhir_cell1_REWRITING, _menhir_box_file_parser) _menhir_cell1_ident, _menhir_box_file_parser) _menhir_state
    (** State 291.
        Stack shape : REWRITING ident.
        Start symbol: file_parser. *)

  | MenhirState293 : (('s, _menhir_box_file_parser) _menhir_cell1_lexpr, _menhir_box_file_parser) _menhir_state
    (** State 293.
        Stack shape : lexpr.
        Start symbol: file_parser. *)

  | MenhirState294 : ((('s, _menhir_box_file_parser) _menhir_cell1_lexpr, _menhir_box_file_parser) _menhir_cell1_PV, _menhir_box_file_parser) _menhir_state
    (** State 294.
        Stack shape : lexpr PV.
        Start symbol: file_parser. *)

  | MenhirState296 : (('s, _menhir_box_file_parser) _menhir_cell1_PRED, _menhir_box_file_parser) _menhir_state
    (** State 296.
        Stack shape : PRED.
        Start symbol: file_parser. *)

  | MenhirState298 : ((('s, _menhir_box_file_parser) _menhir_cell1_PRED, _menhir_box_file_parser) _menhir_cell1_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file_parser) _menhir_state
    (** State 298.
        Stack shape : PRED named_ident LEFTPAR.
        Start symbol: file_parser. *)

  | MenhirState300 : (('s, _menhir_box_file_parser) _menhir_cell1_logic_binder, _menhir_box_file_parser) _menhir_state
    (** State 300.
        Stack shape : logic_binder.
        Start symbol: file_parser. *)

  | MenhirState303 : (('s, _menhir_box_file_parser) _menhir_cell1_ident, _menhir_box_file_parser) _menhir_state
    (** State 303.
        Stack shape : ident.
        Start symbol: file_parser. *)

  | MenhirState304 : ((('s, _menhir_box_file_parser) _menhir_cell1_ident, _menhir_box_file_parser) _menhir_cell1_primitive_type, _menhir_box_file_parser) _menhir_state
    (** State 304.
        Stack shape : ident primitive_type.
        Start symbol: file_parser. *)

  | MenhirState308 : (((('s, _menhir_box_file_parser) _menhir_cell1_PRED, _menhir_box_file_parser) _menhir_cell1_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file_parser) _menhir_cell1_list0_logic_binder_sep_comma _menhir_cell0_RIGHTPAR, _menhir_box_file_parser) _menhir_state
    (** State 308.
        Stack shape : PRED named_ident LEFTPAR list0_logic_binder_sep_comma RIGHTPAR.
        Start symbol: file_parser. *)

  | MenhirState309 : ((((('s, _menhir_box_file_parser) _menhir_cell1_PRED, _menhir_box_file_parser) _menhir_cell1_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file_parser) _menhir_cell1_list0_logic_binder_sep_comma _menhir_cell0_RIGHTPAR, _menhir_box_file_parser) _menhir_cell1_lexpr, _menhir_box_file_parser) _menhir_state
    (** State 309.
        Stack shape : PRED named_ident LEFTPAR list0_logic_binder_sep_comma RIGHTPAR lexpr.
        Start symbol: file_parser. *)

  | MenhirState310 : ((('s, _menhir_box_file_parser) _menhir_cell1_lexpr, _menhir_box_file_parser) _menhir_cell1_AND, _menhir_box_file_parser) _menhir_state
    (** State 310.
        Stack shape : lexpr AND.
        Start symbol: file_parser. *)

  | MenhirState311 : (((('s, _menhir_box_file_parser) _menhir_cell1_lexpr, _menhir_box_file_parser) _menhir_cell1_AND, _menhir_box_file_parser) _menhir_cell1_PRED, _menhir_box_file_parser) _menhir_state
    (** State 311.
        Stack shape : lexpr AND PRED.
        Start symbol: file_parser. *)

  | MenhirState313 : ((((('s, _menhir_box_file_parser) _menhir_cell1_lexpr, _menhir_box_file_parser) _menhir_cell1_AND, _menhir_box_file_parser) _menhir_cell1_PRED, _menhir_box_file_parser) _menhir_cell1_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file_parser) _menhir_state
    (** State 313.
        Stack shape : lexpr AND PRED named_ident LEFTPAR.
        Start symbol: file_parser. *)

  | MenhirState316 : (((((('s, _menhir_box_file_parser) _menhir_cell1_lexpr, _menhir_box_file_parser) _menhir_cell1_AND, _menhir_box_file_parser) _menhir_cell1_PRED, _menhir_box_file_parser) _menhir_cell1_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file_parser) _menhir_cell1_list0_logic_binder_sep_comma _menhir_cell0_RIGHTPAR, _menhir_box_file_parser) _menhir_state
    (** State 316.
        Stack shape : lexpr AND PRED named_ident LEFTPAR list0_logic_binder_sep_comma RIGHTPAR.
        Start symbol: file_parser. *)

  | MenhirState317 : ((((((('s, _menhir_box_file_parser) _menhir_cell1_lexpr, _menhir_box_file_parser) _menhir_cell1_AND, _menhir_box_file_parser) _menhir_cell1_PRED, _menhir_box_file_parser) _menhir_cell1_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file_parser) _menhir_cell1_list0_logic_binder_sep_comma _menhir_cell0_RIGHTPAR, _menhir_box_file_parser) _menhir_cell1_lexpr, _menhir_box_file_parser) _menhir_state
    (** State 317.
        Stack shape : lexpr AND PRED named_ident LEFTPAR list0_logic_binder_sep_comma RIGHTPAR lexpr.
        Start symbol: file_parser. *)

  | MenhirState319 : (((('s, _menhir_box_file_parser) _menhir_cell1_lexpr, _menhir_box_file_parser) _menhir_cell1_AND, _menhir_box_file_parser) _menhir_cell1_FUNC, _menhir_box_file_parser) _menhir_state
    (** State 319.
        Stack shape : lexpr AND FUNC.
        Start symbol: file_parser. *)

  | MenhirState321 : ((((('s, _menhir_box_file_parser) _menhir_cell1_lexpr, _menhir_box_file_parser) _menhir_cell1_AND, _menhir_box_file_parser) _menhir_cell1_FUNC, _menhir_box_file_parser) _menhir_cell1_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file_parser) _menhir_state
    (** State 321.
        Stack shape : lexpr AND FUNC named_ident LEFTPAR.
        Start symbol: file_parser. *)

  | MenhirState324 : (((((('s, _menhir_box_file_parser) _menhir_cell1_lexpr, _menhir_box_file_parser) _menhir_cell1_AND, _menhir_box_file_parser) _menhir_cell1_FUNC, _menhir_box_file_parser) _menhir_cell1_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file_parser) _menhir_cell1_list0_logic_binder_sep_comma _menhir_cell0_RIGHTPAR, _menhir_box_file_parser) _menhir_state
    (** State 324.
        Stack shape : lexpr AND FUNC named_ident LEFTPAR list0_logic_binder_sep_comma RIGHTPAR.
        Start symbol: file_parser. *)

  | MenhirState325 : ((((((('s, _menhir_box_file_parser) _menhir_cell1_lexpr, _menhir_box_file_parser) _menhir_cell1_AND, _menhir_box_file_parser) _menhir_cell1_FUNC, _menhir_box_file_parser) _menhir_cell1_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file_parser) _menhir_cell1_list0_logic_binder_sep_comma _menhir_cell0_RIGHTPAR, _menhir_box_file_parser) _menhir_cell1_primitive_type, _menhir_box_file_parser) _menhir_state
    (** State 325.
        Stack shape : lexpr AND FUNC named_ident LEFTPAR list0_logic_binder_sep_comma RIGHTPAR primitive_type.
        Start symbol: file_parser. *)

  | MenhirState326 : (((((((('s, _menhir_box_file_parser) _menhir_cell1_lexpr, _menhir_box_file_parser) _menhir_cell1_AND, _menhir_box_file_parser) _menhir_cell1_FUNC, _menhir_box_file_parser) _menhir_cell1_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file_parser) _menhir_cell1_list0_logic_binder_sep_comma _menhir_cell0_RIGHTPAR, _menhir_box_file_parser) _menhir_cell1_primitive_type, _menhir_box_file_parser) _menhir_cell1_EQUAL, _menhir_box_file_parser) _menhir_state
    (** State 326.
        Stack shape : lexpr AND FUNC named_ident LEFTPAR list0_logic_binder_sep_comma RIGHTPAR primitive_type EQUAL.
        Start symbol: file_parser. *)

  | MenhirState327 : ((((((((('s, _menhir_box_file_parser) _menhir_cell1_lexpr, _menhir_box_file_parser) _menhir_cell1_AND, _menhir_box_file_parser) _menhir_cell1_FUNC, _menhir_box_file_parser) _menhir_cell1_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file_parser) _menhir_cell1_list0_logic_binder_sep_comma _menhir_cell0_RIGHTPAR, _menhir_box_file_parser) _menhir_cell1_primitive_type, _menhir_box_file_parser) _menhir_cell1_EQUAL, _menhir_box_file_parser) _menhir_cell1_lexpr, _menhir_box_file_parser) _menhir_state
    (** State 327.
        Stack shape : lexpr AND FUNC named_ident LEFTPAR list0_logic_binder_sep_comma RIGHTPAR primitive_type EQUAL lexpr.
        Start symbol: file_parser. *)

  | MenhirState330 : ((('s, _menhir_box_file_parser) _menhir_cell1_PRED, _menhir_box_file_parser) _menhir_cell1_named_ident, _menhir_box_file_parser) _menhir_state
    (** State 330.
        Stack shape : PRED named_ident.
        Start symbol: file_parser. *)

  | MenhirState331 : (((('s, _menhir_box_file_parser) _menhir_cell1_PRED, _menhir_box_file_parser) _menhir_cell1_named_ident, _menhir_box_file_parser) _menhir_cell1_lexpr, _menhir_box_file_parser) _menhir_state
    (** State 331.
        Stack shape : PRED named_ident lexpr.
        Start symbol: file_parser. *)

  | MenhirState334 : (('s, _menhir_box_file_parser) _menhir_cell1_LOGIC _menhir_cell0_ac_modifier, _menhir_box_file_parser) _menhir_state
    (** State 334.
        Stack shape : LOGIC ac_modifier.
        Start symbol: file_parser. *)

  | MenhirState336 : ((('s, _menhir_box_file_parser) _menhir_cell1_LOGIC _menhir_cell0_ac_modifier, _menhir_box_file_parser) _menhir_cell1_list1_named_ident_sep_comma, _menhir_box_file_parser) _menhir_state
    (** State 336.
        Stack shape : LOGIC ac_modifier list1_named_ident_sep_comma.
        Start symbol: file_parser. *)

  | MenhirState338 : (((('s, _menhir_box_file_parser) _menhir_cell1_LOGIC _menhir_cell0_ac_modifier, _menhir_box_file_parser) _menhir_cell1_list1_named_ident_sep_comma, _menhir_box_file_parser) _menhir_cell1_primitive_type, _menhir_box_file_parser) _menhir_state
    (** State 338.
        Stack shape : LOGIC ac_modifier list1_named_ident_sep_comma primitive_type.
        Start symbol: file_parser. *)

  | MenhirState342 : (((('s, _menhir_box_file_parser) _menhir_cell1_LOGIC _menhir_cell0_ac_modifier, _menhir_box_file_parser) _menhir_cell1_list1_named_ident_sep_comma, _menhir_box_file_parser) _menhir_cell1_list0_primitive_type_sep_comma, _menhir_box_file_parser) _menhir_state
    (** State 342.
        Stack shape : LOGIC ac_modifier list1_named_ident_sep_comma list0_primitive_type_sep_comma.
        Start symbol: file_parser. *)

  | MenhirState344 : ((((('s, _menhir_box_file_parser) _menhir_cell1_LOGIC _menhir_cell0_ac_modifier, _menhir_box_file_parser) _menhir_cell1_list1_named_ident_sep_comma, _menhir_box_file_parser) _menhir_cell1_list0_primitive_type_sep_comma, _menhir_box_file_parser) _menhir_cell1_primitive_type, _menhir_box_file_parser) _menhir_state
    (** State 344.
        Stack shape : LOGIC ac_modifier list1_named_ident_sep_comma list0_primitive_type_sep_comma primitive_type.
        Start symbol: file_parser. *)

  | MenhirState345 : (('s, _menhir_box_file_parser) _menhir_cell1_GOAL, _menhir_box_file_parser) _menhir_state
    (** State 345.
        Stack shape : GOAL.
        Start symbol: file_parser. *)

  | MenhirState347 : ((('s, _menhir_box_file_parser) _menhir_cell1_GOAL, _menhir_box_file_parser) _menhir_cell1_ident, _menhir_box_file_parser) _menhir_state
    (** State 347.
        Stack shape : GOAL ident.
        Start symbol: file_parser. *)

  | MenhirState348 : (((('s, _menhir_box_file_parser) _menhir_cell1_GOAL, _menhir_box_file_parser) _menhir_cell1_ident, _menhir_box_file_parser) _menhir_cell1_lexpr, _menhir_box_file_parser) _menhir_state
    (** State 348.
        Stack shape : GOAL ident lexpr.
        Start symbol: file_parser. *)

  | MenhirState349 : (('s, _menhir_box_file_parser) _menhir_cell1_FUNC, _menhir_box_file_parser) _menhir_state
    (** State 349.
        Stack shape : FUNC.
        Start symbol: file_parser. *)

  | MenhirState351 : ((('s, _menhir_box_file_parser) _menhir_cell1_FUNC, _menhir_box_file_parser) _menhir_cell1_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file_parser) _menhir_state
    (** State 351.
        Stack shape : FUNC named_ident LEFTPAR.
        Start symbol: file_parser. *)

  | MenhirState354 : (((('s, _menhir_box_file_parser) _menhir_cell1_FUNC, _menhir_box_file_parser) _menhir_cell1_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file_parser) _menhir_cell1_list0_logic_binder_sep_comma _menhir_cell0_RIGHTPAR, _menhir_box_file_parser) _menhir_state
    (** State 354.
        Stack shape : FUNC named_ident LEFTPAR list0_logic_binder_sep_comma RIGHTPAR.
        Start symbol: file_parser. *)

  | MenhirState355 : ((((('s, _menhir_box_file_parser) _menhir_cell1_FUNC, _menhir_box_file_parser) _menhir_cell1_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file_parser) _menhir_cell1_list0_logic_binder_sep_comma _menhir_cell0_RIGHTPAR, _menhir_box_file_parser) _menhir_cell1_primitive_type, _menhir_box_file_parser) _menhir_state
    (** State 355.
        Stack shape : FUNC named_ident LEFTPAR list0_logic_binder_sep_comma RIGHTPAR primitive_type.
        Start symbol: file_parser. *)

  | MenhirState356 : (((((('s, _menhir_box_file_parser) _menhir_cell1_FUNC, _menhir_box_file_parser) _menhir_cell1_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file_parser) _menhir_cell1_list0_logic_binder_sep_comma _menhir_cell0_RIGHTPAR, _menhir_box_file_parser) _menhir_cell1_primitive_type, _menhir_box_file_parser) _menhir_cell1_EQUAL, _menhir_box_file_parser) _menhir_state
    (** State 356.
        Stack shape : FUNC named_ident LEFTPAR list0_logic_binder_sep_comma RIGHTPAR primitive_type EQUAL.
        Start symbol: file_parser. *)

  | MenhirState357 : ((((((('s, _menhir_box_file_parser) _menhir_cell1_FUNC, _menhir_box_file_parser) _menhir_cell1_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file_parser) _menhir_cell1_list0_logic_binder_sep_comma _menhir_cell0_RIGHTPAR, _menhir_box_file_parser) _menhir_cell1_primitive_type, _menhir_box_file_parser) _menhir_cell1_EQUAL, _menhir_box_file_parser) _menhir_cell1_lexpr, _menhir_box_file_parser) _menhir_state
    (** State 357.
        Stack shape : FUNC named_ident LEFTPAR list0_logic_binder_sep_comma RIGHTPAR primitive_type EQUAL lexpr.
        Start symbol: file_parser. *)

  | MenhirState360 : (('s, _menhir_box_file_parser) _menhir_cell1_CHECK_SAT, _menhir_box_file_parser) _menhir_state
    (** State 360.
        Stack shape : CHECK_SAT.
        Start symbol: file_parser. *)

  | MenhirState362 : ((('s, _menhir_box_file_parser) _menhir_cell1_CHECK_SAT, _menhir_box_file_parser) _menhir_cell1_ident, _menhir_box_file_parser) _menhir_state
    (** State 362.
        Stack shape : CHECK_SAT ident.
        Start symbol: file_parser. *)

  | MenhirState363 : (((('s, _menhir_box_file_parser) _menhir_cell1_CHECK_SAT, _menhir_box_file_parser) _menhir_cell1_ident, _menhir_box_file_parser) _menhir_cell1_lexpr, _menhir_box_file_parser) _menhir_state
    (** State 363.
        Stack shape : CHECK_SAT ident lexpr.
        Start symbol: file_parser. *)

  | MenhirState364 : (('s, _menhir_box_file_parser) _menhir_cell1_AXIOM, _menhir_box_file_parser) _menhir_state
    (** State 364.
        Stack shape : AXIOM.
        Start symbol: file_parser. *)

  | MenhirState366 : ((('s, _menhir_box_file_parser) _menhir_cell1_AXIOM, _menhir_box_file_parser) _menhir_cell1_ident, _menhir_box_file_parser) _menhir_state
    (** State 366.
        Stack shape : AXIOM ident.
        Start symbol: file_parser. *)

  | MenhirState367 : (((('s, _menhir_box_file_parser) _menhir_cell1_AXIOM, _menhir_box_file_parser) _menhir_cell1_ident, _menhir_box_file_parser) _menhir_cell1_lexpr, _menhir_box_file_parser) _menhir_state
    (** State 367.
        Stack shape : AXIOM ident lexpr.
        Start symbol: file_parser. *)

  | MenhirState371 : (('s, _menhir_box_file_parser) _menhir_cell1_decl, _menhir_box_file_parser) _menhir_state
    (** State 371.
        Stack shape : decl.
        Start symbol: file_parser. *)

  | MenhirState373 : ('s, _menhir_box_lexpr_parser) _menhir_state
    (** State 373.
        Stack shape : .
        Start symbol: lexpr_parser. *)

  | MenhirState375 : (('s, _menhir_box_lexpr_parser) _menhir_cell1_lexpr, _menhir_box_lexpr_parser) _menhir_state
    (** State 375.
        Stack shape : lexpr.
        Start symbol: lexpr_parser. *)

  | MenhirState377 : ('s, _menhir_box_trigger_parser) _menhir_state
    (** State 377.
        Stack shape : .
        Start symbol: trigger_parser. *)


and 's _menhir_cell0_ac_modifier = 
  | MenhirCell0_ac_modifier of 's * (AltErgoLib.Symbols.name_kind)

and 's _menhir_cell0_algebraic_args = 
  | MenhirCell0_algebraic_args of 's * ((string * AltErgoLib.Parsed.ppure_type) list)

and ('s, 'r) _menhir_cell1_array_assignement = 
  | MenhirCell1_array_assignement of 's * ('s, 'r) _menhir_state * (AltErgoLib.Parsed.lexpr * AltErgoLib.Parsed.lexpr)

and ('s, 'r) _menhir_cell1_bound = 
  | MenhirCell1_bound of 's * ('s, 'r) _menhir_state * (AltErgoLib.Parsed.lexpr)

and ('s, 'r) _menhir_cell1_decl = 
  | MenhirCell1_decl of 's * ('s, 'r) _menhir_state * (AltErgoLib.Parsed.decl)

and ('s, 'r) _menhir_cell1_filters = 
  | MenhirCell1_filters of 's * ('s, 'r) _menhir_state * (AltErgoLib.Parsed.lexpr list)

and ('s, 'r) _menhir_cell1_ident = 
  | MenhirCell1_ident of 's * ('s, 'r) _menhir_state * (string) * Lexing.position * Lexing.position

and ('s, 'r) _menhir_cell1_label_with_type = 
  | MenhirCell1_label_with_type of 's * ('s, 'r) _menhir_state * (string * AltErgoLib.Parsed.ppure_type)

and ('s, 'r) _menhir_cell1_let_binders = 
  | MenhirCell1_let_binders of 's * ('s, 'r) _menhir_state * ((string * AltErgoLib.Parsed.lexpr) list)

and ('s, 'r) _menhir_cell1_lexpr = 
  | MenhirCell1_lexpr of 's * ('s, 'r) _menhir_state * (AltErgoLib.Parsed.lexpr) * Lexing.position * Lexing.position

and ('s, 'r) _menhir_cell1_lexpr_or_dom = 
  | MenhirCell1_lexpr_or_dom of 's * ('s, 'r) _menhir_state * (AltErgoLib.Parsed.lexpr)

and ('s, 'r) _menhir_cell1_list0_logic_binder_sep_comma = 
  | MenhirCell1_list0_logic_binder_sep_comma of 's * ('s, 'r) _menhir_state * ((AltErgoLib.Loc.t * string * AltErgoLib.Parsed.ppure_type) list)

and ('s, 'r) _menhir_cell1_list0_primitive_type_sep_comma = 
  | MenhirCell1_list0_primitive_type_sep_comma of 's * ('s, 'r) _menhir_state * (AltErgoLib.Parsed.ppure_type list)

and ('s, 'r) _menhir_cell1_list1_constructors_sep_bar = 
  | MenhirCell1_list1_constructors_sep_bar of 's * ('s, 'r) _menhir_state * ((string * (string * AltErgoLib.Parsed.ppure_type) list) list)

and ('s, 'r) _menhir_cell1_list1_match_cases = 
  | MenhirCell1_list1_match_cases of 's * ('s, 'r) _menhir_state * ((AltErgoLib.Parsed.pattern * AltErgoLib.Parsed.lexpr) list)

and ('s, 'r) _menhir_cell1_list1_multi_logic_binder = 
  | MenhirCell1_list1_multi_logic_binder of 's * ('s, 'r) _menhir_state * (((string * string) list * AltErgoLib.Parsed.ppure_type) list)

and ('s, 'r) _menhir_cell1_list1_named_ident_sep_comma = 
  | MenhirCell1_list1_named_ident_sep_comma of 's * ('s, 'r) _menhir_state * ((string * string) list)

and ('s, 'r) _menhir_cell1_list1_primitive_type_sep_comma = 
  | MenhirCell1_list1_primitive_type_sep_comma of 's * ('s, 'r) _menhir_state * (AltErgoLib.Parsed.ppure_type list)

and ('s, 'r) _menhir_cell1_logic_binder = 
  | MenhirCell1_logic_binder of 's * ('s, 'r) _menhir_state * (AltErgoLib.Loc.t * string * AltErgoLib.Parsed.ppure_type)

and ('s, 'r) _menhir_cell1_multi_logic_binder = 
  | MenhirCell1_multi_logic_binder of 's * ('s, 'r) _menhir_state * ((string * string) list * AltErgoLib.Parsed.ppure_type)

and ('s, 'r) _menhir_cell1_named_ident = 
  | MenhirCell1_named_ident of 's * ('s, 'r) _menhir_state * (string * string)

and ('s, 'r) _menhir_cell1_primitive_type = 
  | MenhirCell1_primitive_type of 's * ('s, 'r) _menhir_state * (AltErgoLib.Parsed.ppure_type) * Lexing.position

and ('s, 'r) _menhir_cell1_simple_expr = 
  | MenhirCell1_simple_expr of 's * ('s, 'r) _menhir_state * (AltErgoLib.Parsed.lexpr) * Lexing.position * Lexing.position

and ('s, 'r) _menhir_cell1_simple_pattern = 
  | MenhirCell1_simple_pattern of 's * ('s, 'r) _menhir_state * (AltErgoLib.Parsed.pattern)

and ('s, 'r) _menhir_cell1_sq = 
  | MenhirCell1_sq of 's * ('s, 'r) _menhir_state * (bool) * Lexing.position

and ('s, 'r) _menhir_cell1_theory_elt = 
  | MenhirCell1_theory_elt of 's * ('s, 'r) _menhir_state * (AltErgoLib.Parsed.decl)

and ('s, 'r) _menhir_cell1_trigger = 
  | MenhirCell1_trigger of 's * ('s, 'r) _menhir_state * (AltErgoLib.Parsed.lexpr list * bool)

and ('s, 'r) _menhir_cell1_triggers = 
  | MenhirCell1_triggers of 's * ('s, 'r) _menhir_state * ((AltErgoLib.Parsed.lexpr list * bool) list)

and ('s, 'r) _menhir_cell1_type_var = 
  | MenhirCell1_type_var of 's * ('s, 'r) _menhir_state * (string) * Lexing.position * Lexing.position

and ('s, 'r) _menhir_cell1_type_vars = 
  | MenhirCell1_type_vars of 's * ('s, 'r) _menhir_state * (string list)

and ('s, 'r) _menhir_cell1_AND = 
  | MenhirCell1_AND of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_AT = 
  | MenhirCell1_AT of 's * ('s, 'r) _menhir_state

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

and ('s, 'r) _menhir_cell1_ELSE = 
  | MenhirCell1_ELSE of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_EQUAL = 
  | MenhirCell1_EQUAL of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_EXISTS = 
  | MenhirCell1_EXISTS of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_FORALL = 
  | MenhirCell1_FORALL of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_FUNC = 
  | MenhirCell1_FUNC of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_GE = 
  | MenhirCell1_GE of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_GOAL = 
  | MenhirCell1_GOAL of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_GT = 
  | MenhirCell1_GT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_IF = 
  | MenhirCell1_IF of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_IN = 
  | MenhirCell1_IN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LE = 
  | MenhirCell1_LE of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LEFTARROW = 
  | MenhirCell1_LEFTARROW of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LEFTBR = 
  | MenhirCell1_LEFTBR of 's * ('s, 'r) _menhir_state * Lexing.position

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

and ('s, 'r) _menhir_cell1_LRARROW = 
  | MenhirCell1_LRARROW of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LT = 
  | MenhirCell1_LT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_MATCH = 
  | MenhirCell1_MATCH of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_MINUS = 
  | MenhirCell1_MINUS of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_NOT = 
  | MenhirCell1_NOT of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_NOTEQ = 
  | MenhirCell1_NOTEQ of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_OR = 
  | MenhirCell1_OR of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PERCENT = 
  | MenhirCell1_PERCENT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PLUS = 
  | MenhirCell1_PLUS of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_POW = 
  | MenhirCell1_POW of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_POWDOT = 
  | MenhirCell1_POWDOT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PRED = 
  | MenhirCell1_PRED of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_PV = 
  | MenhirCell1_PV of 's * ('s, 'r) _menhir_state * Lexing.position

and 's _menhir_cell0_PV = 
  | MenhirCell0_PV of 's * Lexing.position

and 's _menhir_cell0_QM = 
  | MenhirCell0_QM of 's * Lexing.position * Lexing.position

and ('s, 'r) _menhir_cell1_QUOTE = 
  | MenhirCell1_QUOTE of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_REWRITING = 
  | MenhirCell1_REWRITING of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_RIGHTARROW = 
  | MenhirCell1_RIGHTARROW of 's * ('s, 'r) _menhir_state

and 's _menhir_cell0_RIGHTPAR = 
  | MenhirCell0_RIGHTPAR of 's * Lexing.position

and ('s, 'r) _menhir_cell1_SLASH = 
  | MenhirCell1_SLASH of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_STRING = 
  | MenhirCell1_STRING of 's * ('s, 'r) _menhir_state * (
# 41 "src/parsers/native_parser.mly"
       (string)
# 1367 "src/parsers/native_parser.ml"
) * Lexing.position

and ('s, 'r) _menhir_cell1_THEN = 
  | MenhirCell1_THEN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_THEORY = 
  | MenhirCell1_THEORY of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_TIMES = 
  | MenhirCell1_TIMES of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_TYPE = 
  | MenhirCell1_TYPE of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_WITH = 
  | MenhirCell1_WITH of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_XOR = 
  | MenhirCell1_XOR of 's * ('s, 'r) _menhir_state

and _menhir_box_trigger_parser = 
  | MenhirBox_trigger_parser of (AltErgoLib.Parsed.lexpr list * bool) [@@unboxed]

and _menhir_box_lexpr_parser = 
  | MenhirBox_lexpr_parser of (AltErgoLib.Parsed.lexpr) [@@unboxed]

and _menhir_box_file_parser = 
  | MenhirBox_file_parser of (AltErgoLib.Parsed.file) [@@unboxed]

let _menhir_action_003 =
  fun () ->
    (
# 177 "src/parsers/native_parser.mly"
        ( Symbols.Other )
# 1402 "src/parsers/native_parser.ml"
     : (AltErgoLib.Symbols.name_kind))

let _menhir_action_004 =
  fun () ->
    (
# 178 "src/parsers/native_parser.mly"
        ( Symbols.Ac )
# 1410 "src/parsers/native_parser.ml"
     : (AltErgoLib.Symbols.name_kind))

let _menhir_action_005 =
  fun () ->
    (
# 237 "src/parsers/native_parser.mly"
  ( [] )
# 1418 "src/parsers/native_parser.ml"
     : ((string * AltErgoLib.Parsed.ppure_type) list))

let _menhir_action_006 =
  fun _2 ->
    (
# 238 "src/parsers/native_parser.mly"
                 ( _2 )
# 1426 "src/parsers/native_parser.ml"
     : ((string * AltErgoLib.Parsed.ppure_type) list))

let _menhir_action_007 =
  fun () ->
    (
# 247 "src/parsers/native_parser.mly"
    ( [] )
# 1434 "src/parsers/native_parser.ml"
     : ((AltErgoLib.Loc.t * (string * string) *
   (AltErgoLib.Loc.t * string * AltErgoLib.Parsed.ppure_type) list *
   AltErgoLib.Parsed.ppure_type option * AltErgoLib.Parsed.lexpr)
  list))

let _menhir_action_008 =
  fun _endpos_others_ _startpos__1_ app args body others ->
    let _endpos = _endpos_others_ in
    let _startpos = _startpos__1_ in
    (
# 250 "src/parsers/native_parser.mly"
      ( ((_startpos, _endpos), app, args, None, body) :: others )
# 1447 "src/parsers/native_parser.ml"
     : ((AltErgoLib.Loc.t * (string * string) *
   (AltErgoLib.Loc.t * string * AltErgoLib.Parsed.ppure_type) list *
   AltErgoLib.Parsed.ppure_type option * AltErgoLib.Parsed.lexpr)
  list))

let _menhir_action_009 =
  fun _endpos_others_ _startpos__1_ app args body others ret_ty ->
    let _endpos = _endpos_others_ in
    let _startpos = _startpos__1_ in
    (
# 254 "src/parsers/native_parser.mly"
      ( ((_startpos, _endpos), app, args, Some ret_ty, body) :: others )
# 1460 "src/parsers/native_parser.ml"
     : ((AltErgoLib.Loc.t * (string * string) *
   (AltErgoLib.Loc.t * string * AltErgoLib.Parsed.ppure_type) list *
   AltErgoLib.Parsed.ppure_type option * AltErgoLib.Parsed.lexpr)
  list))

let _menhir_action_010 =
  fun () ->
    (
# 241 "src/parsers/native_parser.mly"
    ( [] )
# 1471 "src/parsers/native_parser.ml"
     : ((AltErgoLib.Loc.t * string list * string *
   (string * (string * AltErgoLib.Parsed.ppure_type) list) list)
  list))

let _menhir_action_011 =
  fun _endpos_others_ _startpos__1_ enum others ty ty_vars ->
    let _endpos = _endpos_others_ in
    let _startpos = _startpos__1_ in
    (
# 244 "src/parsers/native_parser.mly"
      ( ((_startpos, _endpos), ty_vars, ty, enum) :: others)
# 1483 "src/parsers/native_parser.ml"
     : ((AltErgoLib.Loc.t * string list * string *
   (string * (string * AltErgoLib.Parsed.ppure_type) list) list)
  list))

let _menhir_action_012 =
  fun e1 e2 ->
    (
# 456 "src/parsers/native_parser.mly"
                                   ( e1, e2 )
# 1493 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr * AltErgoLib.Parsed.lexpr))

let _menhir_action_013 =
  fun assign ->
    (
# 451 "src/parsers/native_parser.mly"
   ( [assign] )
# 1501 "src/parsers/native_parser.ml"
     : ((AltErgoLib.Parsed.lexpr * AltErgoLib.Parsed.lexpr) list))

let _menhir_action_014 =
  fun assign assign_l ->
    (
# 453 "src/parsers/native_parser.mly"
   ( assign :: assign_l )
# 1509 "src/parsers/native_parser.ml"
     : ((AltErgoLib.Parsed.lexpr * AltErgoLib.Parsed.lexpr) list))

let _menhir_action_015 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 510 "src/parsers/native_parser.mly"
                     ( mk_var (_startpos, _endpos) "?" )
# 1519 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_016 =
  fun _endpos_id_ _startpos_id_ id ->
    let _endpos = _endpos_id_ in
    let _startpos = _startpos_id_ in
    (
# 511 "src/parsers/native_parser.mly"
                     ( mk_var (_startpos, _endpos) id )
# 1529 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_017 =
  fun _endpos_id_ _startpos_id_ id ->
    let _endpos = _endpos_id_ in
    let _startpos = _startpos_id_ in
    (
# 512 "src/parsers/native_parser.mly"
                     ( mk_var (_startpos, _endpos) id )
# 1539 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_018 =
  fun _endpos_i_ _startpos_i_ i ->
    let _endpos = _endpos_i_ in
    let _startpos = _startpos_i_ in
    (
# 513 "src/parsers/native_parser.mly"
                     ( mk_int_const (_startpos, _endpos) i )
# 1549 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_019 =
  fun _endpos_i_ _startpos_i_ i ->
    let _endpos = _endpos_i_ in
    let _startpos = _startpos_i_ in
    (
# 514 "src/parsers/native_parser.mly"
                     ( mk_real_const (_startpos, _endpos) i )
# 1559 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_020 =
  fun _endpos_i_ _startpos__1_ i ->
    let _endpos = _endpos_i_ in
    let _startpos = _startpos__1_ in
    (
# 515 "src/parsers/native_parser.mly"
                     ( mk_int_const (_startpos, _endpos) i )
# 1569 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_021 =
  fun _endpos_i_ _startpos__1_ i ->
    let _endpos = _endpos_i_ in
    let _startpos = _startpos__1_ in
    (
# 516 "src/parsers/native_parser.mly"
                     ( mk_real_const (_startpos, _endpos) i )
# 1579 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_022 =
  fun _endpos__7_ _startpos__1_ th_body th_ext th_id ->
    let _endpos = _endpos__7_ in
    let _startpos = _startpos__1_ in
    (
# 101 "src/parsers/native_parser.mly"
   ( mk_theory (_startpos, _endpos) th_id th_ext th_body )
# 1589 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.decl))

let _menhir_action_023 =
  fun _endpos_ty_ _startpos__1_ ty ty_vars ->
    let _endpos = _endpos_ty_ in
    let _startpos = _startpos__1_ in
    (
# 104 "src/parsers/native_parser.mly"
    ( mk_abstract_type_decl (_startpos, _endpos) ty_vars ty )
# 1599 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.decl))

let _menhir_action_024 =
  fun _endpos_others_ _startpos__1_ enum others ty ty_vars ->
    let _endpos = _endpos_others_ in
    let _startpos = _startpos__1_ in
    (
# 108 "src/parsers/native_parser.mly"
    (
      match others with
        | [] ->
           mk_algebraic_type_decl (_startpos, _endpos) ty_vars ty enum
        | l ->
           let l = ((_startpos, _endpos), ty_vars, ty, enum) :: l in
           let l =
             List.map
               (fun (a, b, c, d) ->
                 match mk_algebraic_type_decl a b c d with
                 | Parsed.TypeDecl [e] -> e
                 | _ -> assert false
               ) l
           in
           mk_rec_type_decl l
    )
# 1624 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.decl))

let _menhir_action_025 =
  fun _endpos_record_ _startpos__1_ record ty ty_vars ->
    let _endpos = _endpos_record_ in
    let _startpos = _startpos__1_ in
    (
# 126 "src/parsers/native_parser.mly"
   ( mk_record_type_decl (_startpos, _endpos) ty_vars ty record )
# 1634 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.decl))

let _menhir_action_026 =
  fun _endpos_ty_ _startpos__1_ ids is_ac ty ->
    let _endpos = _endpos_ty_ in
    let _startpos = _startpos__1_ in
    (
# 130 "src/parsers/native_parser.mly"
   ( mk_logic (_startpos, _endpos) is_ac ids ty )
# 1644 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.decl))

let _menhir_action_027 =
  fun _endpos_others_ _startpos__1_ app args body others ret_ty ->
    let _endpos = _endpos_others_ in
    let _startpos = _startpos__1_ in
    (
# 135 "src/parsers/native_parser.mly"
   ( match others with
     | [] -> mk_function_def (_startpos, _endpos) app args ret_ty body
     | _ ->
       mk_mut_rec_def
         (((_startpos, _endpos), app, args, Some ret_ty, body) :: others))
# 1658 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.decl))

let _menhir_action_028 =
  fun _endpos_body_ _startpos__1_ app body ->
    let _endpos = _endpos_body_ in
    let _startpos = _startpos__1_ in
    (
# 142 "src/parsers/native_parser.mly"
   ( mk_ground_predicate_def (_startpos, _endpos) app body )
# 1668 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.decl))

let _menhir_action_029 =
  fun _endpos_others_ _startpos__1_ app args body others ->
    let _endpos = _endpos_others_ in
    let _startpos = _startpos__1_ in
    (
# 146 "src/parsers/native_parser.mly"
   ( match others with
     | [] -> mk_non_ground_predicate_def (_startpos, _endpos) app args body
     | _ ->
       mk_mut_rec_def
         (((_startpos, _endpos), app, args, None, body) :: others))
# 1682 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.decl))

let _menhir_action_030 =
  fun _endpos_body_ _startpos__1_ body name ->
    let _endpos = _endpos_body_ in
    let _startpos = _startpos__1_ in
    (
# 153 "src/parsers/native_parser.mly"
   ( mk_generic_axiom (_startpos, _endpos) name body )
# 1692 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.decl))

let _menhir_action_031 =
  fun _endpos_body_ _startpos__1_ body name ->
    let _endpos = _endpos_body_ in
    let _startpos = _startpos__1_ in
    (
# 156 "src/parsers/native_parser.mly"
   ( mk_rewriting (_startpos, _endpos) name body )
# 1702 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.decl))

let _menhir_action_032 =
  fun _endpos_body_ _startpos__1_ body name ->
    let _endpos = _endpos_body_ in
    let _startpos = _startpos__1_ in
    (
# 159 "src/parsers/native_parser.mly"
   ( mk_goal (_startpos, _endpos) name body )
# 1712 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.decl))

let _menhir_action_033 =
  fun _endpos_body_ _startpos__1_ body name ->
    let _endpos = _endpos_body_ in
    let _startpos = _startpos__1_ in
    (
# 162 "src/parsers/native_parser.mly"
   ( mk_check_sat (_startpos, _endpos) name body )
# 1722 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.decl))

let _menhir_action_034 =
  fun decls ->
    (
# 86 "src/parsers/native_parser.mly"
                         ( decls )
# 1730 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.file))

let _menhir_action_035 =
  fun () ->
    (
# 87 "src/parsers/native_parser.mly"
      ( [] )
# 1738 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.file))

let _menhir_action_036 =
  fun () ->
    (
# 465 "src/parsers/native_parser.mly"
    ( [] )
# 1746 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr list))

let _menhir_action_037 =
  fun filt ->
    (
# 467 "src/parsers/native_parser.mly"
   ( [filt] )
# 1754 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr list))

let _menhir_action_038 =
  fun filt filt_l ->
    (
# 469 "src/parsers/native_parser.mly"
   ( filt :: filt_l )
# 1762 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr list))

let _menhir_action_039 =
  fun id ->
    (
# 552 "src/parsers/native_parser.mly"
          ( id )
# 1770 "src/parsers/native_parser.ml"
     : (string))

let _menhir_action_040 =
  fun id ty ->
    (
# 530 "src/parsers/native_parser.mly"
                                       ( id, ty )
# 1778 "src/parsers/native_parser.ml"
     : (string * AltErgoLib.Parsed.ppure_type))

let _menhir_action_041 =
  fun binder e ->
    (
# 392 "src/parsers/native_parser.mly"
                                 ( [binder, e] )
# 1786 "src/parsers/native_parser.ml"
     : ((string * AltErgoLib.Parsed.lexpr) list))

let _menhir_action_042 =
  fun binder e l ->
    (
# 393 "src/parsers/native_parser.mly"
                                                       ( (binder, e) :: l )
# 1794 "src/parsers/native_parser.ml"
     : ((string * AltErgoLib.Parsed.lexpr) list))

let _menhir_action_043 =
  fun se ->
    (
# 258 "src/parsers/native_parser.mly"
                   ( se )
# 1802 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_044 =
  fun _endpos_se2_ _startpos_se1_ se1 se2 ->
    let _endpos = _endpos_se2_ in
    let _startpos = _startpos_se1_ in
    (
# 263 "src/parsers/native_parser.mly"
   ( mk_add (_startpos, _endpos) se1 se2 )
# 1812 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_045 =
  fun _endpos_se2_ _startpos_se1_ se1 se2 ->
    let _endpos = _endpos_se2_ in
    let _startpos = _startpos_se1_ in
    (
# 266 "src/parsers/native_parser.mly"
   ( mk_sub (_startpos, _endpos) se1 se2 )
# 1822 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_046 =
  fun _endpos_se2_ _startpos_se1_ se1 se2 ->
    let _endpos = _endpos_se2_ in
    let _startpos = _startpos_se1_ in
    (
# 269 "src/parsers/native_parser.mly"
   ( mk_mul (_startpos, _endpos) se1 se2 )
# 1832 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_047 =
  fun _endpos_se2_ _startpos_se1_ se1 se2 ->
    let _endpos = _endpos_se2_ in
    let _startpos = _startpos_se1_ in
    (
# 272 "src/parsers/native_parser.mly"
   ( mk_div (_startpos, _endpos) se1 se2 )
# 1842 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_048 =
  fun _endpos_se2_ _startpos_se1_ se1 se2 ->
    let _endpos = _endpos_se2_ in
    let _startpos = _startpos_se1_ in
    (
# 275 "src/parsers/native_parser.mly"
   ( mk_mod (_startpos, _endpos) se1 se2 )
# 1852 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_049 =
  fun _endpos_se2_ _startpos_se1_ se1 se2 ->
    let _endpos = _endpos_se2_ in
    let _startpos = _startpos_se1_ in
    (
# 278 "src/parsers/native_parser.mly"
   ( mk_pow_int (_startpos, _endpos) se1 se2 )
# 1862 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_050 =
  fun _endpos_se2_ _startpos_se1_ se1 se2 ->
    let _endpos = _endpos_se2_ in
    let _startpos = _startpos_se1_ in
    (
# 281 "src/parsers/native_parser.mly"
   ( mk_pow_real (_startpos, _endpos) se1 se2 )
# 1872 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_051 =
  fun _endpos_se2_ _startpos_se1_ se1 se2 ->
    let _endpos = _endpos_se2_ in
    let _startpos = _startpos_se1_ in
    (
# 284 "src/parsers/native_parser.mly"
   ( mk_and (_startpos, _endpos) se1 se2 )
# 1882 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_052 =
  fun _endpos_se2_ _startpos_se1_ se1 se2 ->
    let _endpos = _endpos_se2_ in
    let _startpos = _startpos_se1_ in
    (
# 287 "src/parsers/native_parser.mly"
   ( mk_or (_startpos, _endpos) se1 se2 )
# 1892 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_053 =
  fun _endpos_se2_ _startpos_se1_ se1 se2 ->
    let _endpos = _endpos_se2_ in
    let _startpos = _startpos_se1_ in
    (
# 290 "src/parsers/native_parser.mly"
   ( mk_xor (_startpos, _endpos) se1 se2 )
# 1902 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_054 =
  fun _endpos_se2_ _startpos_se1_ se1 se2 ->
    let _endpos = _endpos_se2_ in
    let _startpos = _startpos_se1_ in
    (
# 293 "src/parsers/native_parser.mly"
   ( mk_iff (_startpos, _endpos) se1 se2 )
# 1912 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_055 =
  fun _endpos_se2_ _startpos_se1_ se1 se2 ->
    let _endpos = _endpos_se2_ in
    let _startpos = _startpos_se1_ in
    (
# 296 "src/parsers/native_parser.mly"
   ( mk_implies (_startpos, _endpos) se1 se2 )
# 1922 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_056 =
  fun _endpos_se2_ _startpos_se1_ se1 se2 ->
    let _endpos = _endpos_se2_ in
    let _startpos = _startpos_se1_ in
    (
# 299 "src/parsers/native_parser.mly"
   ( mk_pred_lt (_startpos, _endpos) se1 se2 )
# 1932 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_057 =
  fun _endpos_se2_ _startpos_se1_ se1 se2 ->
    let _endpos = _endpos_se2_ in
    let _startpos = _startpos_se1_ in
    (
# 302 "src/parsers/native_parser.mly"
   ( mk_pred_le (_startpos, _endpos) se1 se2 )
# 1942 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_058 =
  fun _endpos_se2_ _startpos_se1_ se1 se2 ->
    let _endpos = _endpos_se2_ in
    let _startpos = _startpos_se1_ in
    (
# 305 "src/parsers/native_parser.mly"
   ( mk_pred_gt (_startpos, _endpos) se1 se2 )
# 1952 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_059 =
  fun _endpos_se2_ _startpos_se1_ se1 se2 ->
    let _endpos = _endpos_se2_ in
    let _startpos = _startpos_se1_ in
    (
# 308 "src/parsers/native_parser.mly"
   ( mk_pred_ge (_startpos, _endpos) se1 se2 )
# 1962 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_060 =
  fun _endpos_se2_ _startpos_se1_ se1 se2 ->
    let _endpos = _endpos_se2_ in
    let _startpos = _startpos_se1_ in
    (
# 311 "src/parsers/native_parser.mly"
   ( mk_pred_eq (_startpos, _endpos) se1 se2 )
# 1972 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_061 =
  fun _endpos_se2_ _startpos_se1_ se1 se2 ->
    let _endpos = _endpos_se2_ in
    let _startpos = _startpos_se1_ in
    (
# 314 "src/parsers/native_parser.mly"
   ( mk_pred_not_eq (_startpos, _endpos) se1 se2 )
# 1982 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_062 =
  fun _endpos_se_ _startpos__1_ se ->
    let _endpos = _endpos_se_ in
    let _startpos = _startpos__1_ in
    (
# 317 "src/parsers/native_parser.mly"
   ( mk_not (_startpos, _endpos) se )
# 1992 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_063 =
  fun _endpos_se_ _startpos__1_ se ->
    let _endpos = _endpos_se_ in
    let _startpos = _startpos__1_ in
    (
# 320 "src/parsers/native_parser.mly"
   ( mk_minus (_startpos, _endpos) se )
# 2002 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_064 =
  fun _endpos__5_ _startpos__1_ bv_cst ->
    let _endpos = _endpos__5_ in
    let _startpos = _startpos__1_ in
    (
# 325 "src/parsers/native_parser.mly"
    ( mk_bitv_const (_startpos, _endpos) bv_cst )
# 2012 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_065 =
  fun _endpos__7_ _startpos_e_ e i j ->
    let _endpos = _endpos__7_ in
    let _startpos = _startpos_e_ in
    (
# 328 "src/parsers/native_parser.mly"
   ( mk_bitv_extract (_startpos, _endpos) e i j )
# 2022 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_066 =
  fun _endpos_e2_ _startpos_e1_ e1 e2 ->
    let _endpos = _endpos_e2_ in
    let _startpos = _startpos_e1_ in
    (
# 331 "src/parsers/native_parser.mly"
   ( mk_bitv_concat (_startpos, _endpos) e1 e2 )
# 2032 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_067 =
  fun _endpos__4_ _startpos__1_ dist_l ->
    let _endpos = _endpos__4_ in
    let _startpos = _startpos__1_ in
    (
# 336 "src/parsers/native_parser.mly"
   ( mk_distinct (_startpos, _endpos) dist_l )
# 2042 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_068 =
  fun _endpos_br2_ _startpos__1_ br1 br2 cond ->
    let _endpos = _endpos_br2_ in
    let _startpos = _startpos__1_ in
    (
# 339 "src/parsers/native_parser.mly"
   ( mk_ite (_startpos, _endpos) cond br1 br2 )
# 2052 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_069 =
  fun _endpos_body_ _startpos__1_ body filters quant_vars triggers ->
    let _endpos = _endpos_body_ in
    let _startpos = _startpos__1_ in
    (
# 343 "src/parsers/native_parser.mly"
   (
     let vs_ty =
       List.map (fun (vs, ty) ->
         List.map (fun (v, name) -> v, name, ty) vs) quant_vars
     in
     let vs_ty = List.flatten vs_ty in
     mk_forall (_startpos, _endpos) vs_ty triggers filters body
   )
# 2069 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_070 =
  fun _endpos_body_ _startpos__1_ body filters quant_vars triggers ->
    let _endpos = _endpos_body_ in
    let _startpos = _startpos__1_ in
    (
# 354 "src/parsers/native_parser.mly"
   (
     let vs_ty =
       List.map (fun (vs, ty) ->
         List.map (fun (v, name) -> v, name, ty) vs) quant_vars
     in
     let vs_ty = List.flatten vs_ty in
     mk_exists (_startpos, _endpos) vs_ty triggers filters body
   )
# 2086 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_071 =
  fun _endpos_e_ _startpos_name_ e name ->
    let _endpos = _endpos_e_ in
    let _startpos = _startpos_name_ in
    (
# 364 "src/parsers/native_parser.mly"
   ( mk_named (_startpos, _endpos) name e )
# 2096 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_072 =
  fun _endpos_e2_ _startpos__1_ binders e2 ->
    let _endpos = _endpos_e2_ in
    let _startpos = _startpos__1_ in
    (
# 367 "src/parsers/native_parser.mly"
   ( mk_let (_startpos, _endpos) binders e2 )
# 2106 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_073 =
  fun _endpos_e_ _startpos__1_ e ->
    let _endpos = _endpos_e_ in
    let _startpos = _startpos__1_ in
    (
# 370 "src/parsers/native_parser.mly"
   ( mk_check (_startpos, _endpos) e )
# 2116 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_074 =
  fun _endpos_e_ _startpos__1_ e ->
    let _endpos = _endpos_e_ in
    let _startpos = _startpos__1_ in
    (
# 373 "src/parsers/native_parser.mly"
   ( mk_cut (_startpos, _endpos) e )
# 2126 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_075 =
  fun _endpos__5_ _startpos__1_ cases e ->
    let _endpos = _endpos__5_ in
    let _startpos = _startpos__1_ in
    (
# 377 "src/parsers/native_parser.mly"
    ( mk_match (_startpos, _endpos) e (List.rev cases) )
# 2136 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_076 =
  fun e ->
    (
# 498 "src/parsers/native_parser.mly"
   ( e )
# 2144 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_077 =
  fun _endpos_rbr_ _startpos_e_ e lbnd lbr rbnd rbr ->
    let _endpos = _endpos_rbr_ in
    let _startpos = _startpos_e_ in
    (
# 500 "src/parsers/native_parser.mly"
   ( mk_in_interval (_startpos, _endpos) e lbr lbnd rbnd rbr )
# 2154 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_078 =
  fun _endpos_e_ _startpos_id_ e id ->
    let _endpos = _endpos_e_ in
    let _startpos = _startpos_id_ in
    (
# 502 "src/parsers/native_parser.mly"
   ( mk_maps_to (_startpos, _endpos) id e )
# 2164 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_079 =
  fun e ->
    (
# 93 "src/parsers/native_parser.mly"
                ( e )
# 2172 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_080 =
  fun () ->
    (
# 485 "src/parsers/native_parser.mly"
                        ( [] )
# 2180 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr list))

let _menhir_action_081 =
  fun l ->
    (
# 486 "src/parsers/native_parser.mly"
                            ( l )
# 2188 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr list))

let _menhir_action_082 =
  fun () ->
    (
# 218 "src/parsers/native_parser.mly"
                                           ( [] )
# 2196 "src/parsers/native_parser.ml"
     : ((AltErgoLib.Loc.t * string * AltErgoLib.Parsed.ppure_type) list))

let _menhir_action_083 =
  fun binders_l ->
    (
# 219 "src/parsers/native_parser.mly"
                                           ( binders_l )
# 2204 "src/parsers/native_parser.ml"
     : ((AltErgoLib.Loc.t * string * AltErgoLib.Parsed.ppure_type) list))

let _menhir_action_084 =
  fun () ->
    (
# 214 "src/parsers/native_parser.mly"
                                        ( [] )
# 2212 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.ppure_type list))

let _menhir_action_085 =
  fun ty_l ->
    (
# 215 "src/parsers/native_parser.mly"
                                        ( ty_l )
# 2220 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.ppure_type list))

let _menhir_action_086 =
  fun _2 cons ->
    (
# 232 "src/parsers/native_parser.mly"
                              ( [cons, _2] )
# 2228 "src/parsers/native_parser.ml"
     : ((string * (string * AltErgoLib.Parsed.ppure_type) list) list))

let _menhir_action_087 =
  fun _2 cons cons_l ->
    (
# 234 "src/parsers/native_parser.mly"
                                             ( (cons, _2) :: cons_l )
# 2236 "src/parsers/native_parser.ml"
     : ((string * (string * AltErgoLib.Parsed.ppure_type) list) list))

let _menhir_action_088 =
  fun decl ->
    (
# 96 "src/parsers/native_parser.mly"
              ( [decl] )
# 2244 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.file))

let _menhir_action_089 =
  fun decl decls ->
    (
# 97 "src/parsers/native_parser.mly"
                                 ( decl :: decls )
# 2252 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.file))

let _menhir_action_090 =
  fun e id ->
    (
# 535 "src/parsers/native_parser.mly"
   ( [id, e] )
# 2260 "src/parsers/native_parser.ml"
     : ((string * AltErgoLib.Parsed.lexpr) list))

let _menhir_action_091 =
  fun e id l ->
    (
# 537 "src/parsers/native_parser.mly"
   ( (id, e) :: l )
# 2268 "src/parsers/native_parser.ml"
     : ((string * AltErgoLib.Parsed.lexpr) list))

let _menhir_action_092 =
  fun label_typed ->
    (
# 526 "src/parsers/native_parser.mly"
                                                        ( [label_typed] )
# 2276 "src/parsers/native_parser.ml"
     : ((string * AltErgoLib.Parsed.ppure_type) list))

let _menhir_action_093 =
  fun list_lt lt ->
    (
# 527 "src/parsers/native_parser.mly"
                                                         ( lt :: list_lt )
# 2284 "src/parsers/native_parser.ml"
     : ((string * AltErgoLib.Parsed.ppure_type) list))

let _menhir_action_094 =
  fun ed ->
    (
# 493 "src/parsers/native_parser.mly"
                                                ( [ed] )
# 2292 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr list))

let _menhir_action_095 =
  fun ed edl ->
    (
# 494 "src/parsers/native_parser.mly"
                                                             ( ed :: edl )
# 2300 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr list))

let _menhir_action_096 =
  fun e ->
    (
# 489 "src/parsers/native_parser.mly"
                                            ( [e] )
# 2308 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr list))

let _menhir_action_097 =
  fun e l ->
    (
# 490 "src/parsers/native_parser.mly"
                                            ( e :: l )
# 2316 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr list))

let _menhir_action_098 =
  fun e ->
    (
# 480 "src/parsers/native_parser.mly"
                                         ( [e] )
# 2324 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr list))

let _menhir_action_099 =
  fun e ->
    (
# 481 "src/parsers/native_parser.mly"
                                         ( [e] )
# 2332 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr list))

let _menhir_action_100 =
  fun e e_l ->
    (
# 482 "src/parsers/native_parser.mly"
                                         ( e :: e_l )
# 2340 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr list))

let _menhir_action_101 =
  fun binder ->
    (
# 223 "src/parsers/native_parser.mly"
   ( [binder] )
# 2348 "src/parsers/native_parser.ml"
     : ((AltErgoLib.Loc.t * string * AltErgoLib.Parsed.ppure_type) list))

let _menhir_action_102 =
  fun binder binders_list ->
    (
# 225 "src/parsers/native_parser.mly"
   ( binder :: binders_list )
# 2356 "src/parsers/native_parser.ml"
     : ((AltErgoLib.Loc.t * string * AltErgoLib.Parsed.ppure_type) list))

let _menhir_action_103 =
  fun e p ->
    (
# 380 "src/parsers/native_parser.mly"
                                              ( [p, e])
# 2364 "src/parsers/native_parser.ml"
     : ((AltErgoLib.Parsed.pattern * AltErgoLib.Parsed.lexpr) list))

let _menhir_action_104 =
  fun e p ->
    (
# 381 "src/parsers/native_parser.mly"
                                              ( [p, e])
# 2372 "src/parsers/native_parser.ml"
     : ((AltErgoLib.Parsed.pattern * AltErgoLib.Parsed.lexpr) list))

let _menhir_action_105 =
  fun e l p ->
    (
# 383 "src/parsers/native_parser.mly"
    ( (p,e) :: l )
# 2380 "src/parsers/native_parser.ml"
     : ((AltErgoLib.Parsed.pattern * AltErgoLib.Parsed.lexpr) list))

let _menhir_action_106 =
  fun binders ->
    (
# 560 "src/parsers/native_parser.mly"
   ( [binders] )
# 2388 "src/parsers/native_parser.ml"
     : (((string * string) list * AltErgoLib.Parsed.ppure_type) list))

let _menhir_action_107 =
  fun binders l ->
    (
# 562 "src/parsers/native_parser.mly"
   ( binders :: l )
# 2396 "src/parsers/native_parser.ml"
     : (((string * string) list * AltErgoLib.Parsed.ppure_type) list))

let _menhir_action_108 =
  fun id ->
    (
# 565 "src/parsers/native_parser.mly"
                                                     ( [id] )
# 2404 "src/parsers/native_parser.ml"
     : ((string * string) list))

let _menhir_action_109 =
  fun id l ->
    (
# 566 "src/parsers/native_parser.mly"
                                                                ( id :: l )
# 2412 "src/parsers/native_parser.ml"
     : ((string * string) list))

let _menhir_action_110 =
  fun ty ->
    (
# 210 "src/parsers/native_parser.mly"
                                                           ( [ty] )
# 2420 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.ppure_type list))

let _menhir_action_111 =
  fun ty ty_l ->
    (
# 211 "src/parsers/native_parser.mly"
                                                                  ( ty::ty_l )
# 2428 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.ppure_type list))

let _menhir_action_112 =
  fun id ->
    (
# 570 "src/parsers/native_parser.mly"
    ( [ id ] )
# 2436 "src/parsers/native_parser.ml"
     : (string list))

let _menhir_action_113 =
  fun id l ->
    (
# 571 "src/parsers/native_parser.mly"
                                              ( id :: l  )
# 2444 "src/parsers/native_parser.ml"
     : (string list))

let _menhir_action_114 =
  fun trig ->
    (
# 472 "src/parsers/native_parser.mly"
                 ( [trig] )
# 2452 "src/parsers/native_parser.ml"
     : ((AltErgoLib.Parsed.lexpr list * bool) list))

let _menhir_action_115 =
  fun trig trigs ->
    (
# 473 "src/parsers/native_parser.mly"
                                                   ( trig :: trigs )
# 2460 "src/parsers/native_parser.ml"
     : ((AltErgoLib.Parsed.lexpr list * bool) list))

let _menhir_action_116 =
  fun alpha ->
    (
# 548 "src/parsers/native_parser.mly"
                                                  ( [alpha] )
# 2468 "src/parsers/native_parser.ml"
     : (string list))

let _menhir_action_117 =
  fun alpha l ->
    (
# 549 "src/parsers/native_parser.mly"
                                                                ( alpha :: l )
# 2476 "src/parsers/native_parser.ml"
     : (string list))

let _menhir_action_118 =
  fun e1 e2 ->
    (
# 519 "src/parsers/native_parser.mly"
                                              ( [e1; e2] )
# 2484 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr list))

let _menhir_action_119 =
  fun e el ->
    (
# 520 "src/parsers/native_parser.mly"
                                              ( e :: el   )
# 2492 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr list))

let _menhir_action_120 =
  fun _endpos_id_ _startpos_id_ id ty ->
    (
# 229 "src/parsers/native_parser.mly"
    ( ((_startpos_id_, _endpos_id_), id, ty) )
# 2500 "src/parsers/native_parser.ml"
     : (AltErgoLib.Loc.t * string * AltErgoLib.Parsed.ppure_type))

let _menhir_action_121 =
  fun ty_list ->
    (
# 199 "src/parsers/native_parser.mly"
   ( mk_logic_type ty_list None )
# 2508 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.plogic_type))

let _menhir_action_122 =
  fun () ->
    (
# 201 "src/parsers/native_parser.mly"
       ( mk_logic_type [] None )
# 2516 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.plogic_type))

let _menhir_action_123 =
  fun ret_ty ty_list ->
    (
# 204 "src/parsers/native_parser.mly"
   ( mk_logic_type ty_list (Some ret_ty) )
# 2524 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.plogic_type))

let _menhir_action_124 =
  fun ret_ty ->
    (
# 207 "src/parsers/native_parser.mly"
   ( mk_logic_type [] (Some ret_ty) )
# 2532 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.plogic_type))

let _menhir_action_125 =
  fun binders ty ->
    (
# 556 "src/parsers/native_parser.mly"
    ( binders, ty )
# 2540 "src/parsers/native_parser.ml"
     : ((string * string) list * AltErgoLib.Parsed.ppure_type))

let _menhir_action_126 =
  fun id ->
    (
# 574 "src/parsers/native_parser.mly"
          ( id, "" )
# 2548 "src/parsers/native_parser.ml"
     : (string * string))

let _menhir_action_127 =
  fun id str ->
    (
# 575 "src/parsers/native_parser.mly"
                       ( id, str )
# 2556 "src/parsers/native_parser.ml"
     : (string * string))

let _menhir_action_128 =
  fun () ->
    (
# 181 "src/parsers/native_parser.mly"
       ( int_type )
# 2564 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.ppure_type))

let _menhir_action_129 =
  fun () ->
    (
# 182 "src/parsers/native_parser.mly"
       ( bool_type )
# 2572 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.ppure_type))

let _menhir_action_130 =
  fun () ->
    (
# 183 "src/parsers/native_parser.mly"
       ( real_type )
# 2580 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.ppure_type))

let _menhir_action_131 =
  fun () ->
    (
# 184 "src/parsers/native_parser.mly"
       ( unit_type )
# 2588 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.ppure_type))

let _menhir_action_132 =
  fun sz ->
    (
# 185 "src/parsers/native_parser.mly"
                                   ( mk_bitv_type sz )
# 2596 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.ppure_type))

let _menhir_action_133 =
  fun _endpos_ext_ty_ _startpos_ext_ty_ ext_ty ->
    let _endpos = _endpos_ext_ty_ in
    let _startpos = _startpos_ext_ty_ in
    (
# 187 "src/parsers/native_parser.mly"
                 ( mk_external_type (_startpos, _endpos) [] ext_ty )
# 2606 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.ppure_type))

let _menhir_action_134 =
  fun _endpos_alpha_ _startpos_alpha_ alpha ->
    let _endpos = _endpos_alpha_ in
    let _startpos = _startpos_alpha_ in
    (
# 189 "src/parsers/native_parser.mly"
                   ( mk_var_type (_startpos, _endpos) alpha )
# 2616 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.ppure_type))

let _menhir_action_135 =
  fun _endpos_ext_ty_ _startpos_ext_ty_ ext_ty par ->
    (
# 192 "src/parsers/native_parser.mly"
   ( mk_external_type (_startpos_ext_ty_, _endpos_ext_ty_) [par] ext_ty )
# 2624 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.ppure_type))

let _menhir_action_136 =
  fun _endpos_ext_ty_ _startpos_ext_ty_ ext_ty pars ->
    (
# 195 "src/parsers/native_parser.mly"
   ( mk_external_type (_startpos_ext_ty_, _endpos_ext_ty_) pars ext_ty )
# 2632 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.ppure_type))

let _menhir_action_137 =
  fun labels ->
    (
# 523 "src/parsers/native_parser.mly"
                                             ( labels )
# 2640 "src/parsers/native_parser.ml"
     : ((string * AltErgoLib.Parsed.ppure_type) list))

let _menhir_action_138 =
  fun _endpos_i_ _startpos_i_ i ->
    let _endpos = _endpos_i_ in
    let _startpos = _startpos_i_ in
    (
# 396 "src/parsers/native_parser.mly"
              ( mk_int_const (_startpos, _endpos) i )
# 2650 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_139 =
  fun _endpos_i_ _startpos_i_ i ->
    let _endpos = _endpos_i_ in
    let _startpos = _startpos_i_ in
    (
# 397 "src/parsers/native_parser.mly"
              ( mk_real_const (_startpos, _endpos) i )
# 2660 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_140 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 398 "src/parsers/native_parser.mly"
              ( mk_true_const (_startpos, _endpos) )
# 2670 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_141 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 399 "src/parsers/native_parser.mly"
              ( mk_false_const (_startpos, _endpos) )
# 2680 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_142 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 400 "src/parsers/native_parser.mly"
              ( mk_void (_startpos, _endpos) )
# 2690 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_143 =
  fun _endpos_var_ _startpos_var_ var ->
    let _endpos = _endpos_var_ in
    let _startpos = _startpos_var_ in
    (
# 401 "src/parsers/native_parser.mly"
              ( mk_var (_startpos, _endpos) var )
# 2700 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_144 =
  fun _endpos__3_ _startpos__1_ labels ->
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    (
# 406 "src/parsers/native_parser.mly"
   ( mk_record (_startpos, _endpos) labels )
# 2710 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_145 =
  fun _endpos__5_ _startpos__1_ labels se ->
    let _endpos = _endpos__5_ in
    let _startpos = _startpos__1_ in
    (
# 409 "src/parsers/native_parser.mly"
   ( mk_with_record (_startpos, _endpos) se labels )
# 2720 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_146 =
  fun _endpos_label_ _startpos_se_ label se ->
    let _endpos = _endpos_label_ in
    let _startpos = _startpos_se_ in
    (
# 412 "src/parsers/native_parser.mly"
   ( mk_dot_record (_startpos, _endpos) se label )
# 2730 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_147 =
  fun _endpos__4_ _startpos_app_ app args ->
    let _endpos = _endpos__4_ in
    let _startpos = _startpos_app_ in
    (
# 417 "src/parsers/native_parser.mly"
   ( mk_application (_startpos, _endpos) app args )
# 2740 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_148 =
  fun _endpos__4_ _startpos_se_ e se ->
    let _endpos = _endpos__4_ in
    let _startpos = _startpos_se_ in
    (
# 422 "src/parsers/native_parser.mly"
   ( mk_array_get (_startpos, _endpos) se e )
# 2750 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_149 =
  fun _endpos__4_ _startpos_se_ assigns se ->
    let _endpos = _endpos__4_ in
    let _startpos = _startpos_se_ in
    (
# 425 "src/parsers/native_parser.mly"
    (
      let acc, l =
        match assigns with
	| [] -> assert false
	| (i, v)::l -> mk_array_set (_startpos, _endpos) se i v, l
      in
      List.fold_left (fun acc (i,v) ->
          mk_array_set (_startpos, _endpos) acc i v) acc l
    )
# 2768 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_150 =
  fun e ->
    (
# 436 "src/parsers/native_parser.mly"
   ( e )
# 2776 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_151 =
  fun _endpos_ty_ _startpos_se_ se ty ->
    let _endpos = _endpos_ty_ in
    let _startpos = _startpos_se_ in
    (
# 439 "src/parsers/native_parser.mly"
    (  mk_type_cast (_startpos, _endpos) se ty )
# 2786 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_152 =
  fun _endpos_id_ _startpos_se_ id se ->
    let _endpos = _endpos_id_ in
    let _startpos = _startpos_se_ in
    (
# 442 "src/parsers/native_parser.mly"
    ( mk_algebraic_test (_startpos, _endpos) se id )
# 2796 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_153 =
  fun _endpos_id_ _startpos_se_ id se ->
    let _endpos = _endpos_id_ in
    let _startpos = _startpos_se_ in
    (
# 445 "src/parsers/native_parser.mly"
    ( mk_algebraic_test (_startpos, _endpos) se id )
# 2806 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_154 =
  fun _endpos_label_ _startpos_se_ label se ->
    let _endpos = _endpos_label_ in
    let _startpos = _startpos_se_ in
    (
# 448 "src/parsers/native_parser.mly"
   ( mk_algebraic_project (_startpos, _endpos) se label )
# 2816 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr))

let _menhir_action_155 =
  fun _endpos_id_ _startpos_id_ id ->
    let _endpos = _endpos_id_ in
    let _startpos = _startpos_id_ in
    (
# 386 "src/parsers/native_parser.mly"
             ( mk_pattern (_startpos, _endpos) id [] )
# 2826 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.pattern))

let _menhir_action_156 =
  fun _endpos__4_ _startpos_app_ app args ->
    let _endpos = _endpos__4_ in
    let _startpos = _startpos_app_ in
    (
# 388 "src/parsers/native_parser.mly"
   ( mk_pattern (_startpos, _endpos) app args )
# 2836 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.pattern))

let _menhir_action_157 =
  fun () ->
    (
# 506 "src/parsers/native_parser.mly"
         (true)
# 2844 "src/parsers/native_parser.ml"
     : (bool))

let _menhir_action_158 =
  fun () ->
    (
# 507 "src/parsers/native_parser.mly"
          (false)
# 2852 "src/parsers/native_parser.ml"
     : (bool))

let _menhir_action_159 =
  fun _endpos_body_ _startpos__1_ body name ->
    let _endpos = _endpos_body_ in
    let _startpos = _startpos__1_ in
    (
# 170 "src/parsers/native_parser.mly"
   ( mk_theory_axiom (_startpos, _endpos) name body )
# 2862 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.decl))

let _menhir_action_160 =
  fun _endpos_body_ _startpos__1_ body name ->
    let _endpos = _endpos_body_ in
    let _startpos = _startpos__1_ in
    (
# 173 "src/parsers/native_parser.mly"
   ( mk_theory_case_split (_startpos, _endpos) name body )
# 2872 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.decl))

let _menhir_action_161 =
  fun () ->
    (
# 165 "src/parsers/native_parser.mly"
         ( [] )
# 2880 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.decl list))

let _menhir_action_162 =
  fun th_elt th_rest ->
    (
# 166 "src/parsers/native_parser.mly"
                                            ( th_elt :: th_rest )
# 2888 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.decl list))

let _menhir_action_163 =
  fun terms ->
    (
# 477 "src/parsers/native_parser.mly"
   ( terms, true (* true <-> user-given trigger *) )
# 2896 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr list * bool))

let _menhir_action_164 =
  fun trigger ->
    (
# 90 "src/parsers/native_parser.mly"
                        ( trigger )
# 2904 "src/parsers/native_parser.ml"
     : (AltErgoLib.Parsed.lexpr list * bool))

let _menhir_action_165 =
  fun () ->
    (
# 459 "src/parsers/native_parser.mly"
                                        ( [] )
# 2912 "src/parsers/native_parser.ml"
     : ((AltErgoLib.Parsed.lexpr list * bool) list))

let _menhir_action_166 =
  fun trigs ->
    (
# 460 "src/parsers/native_parser.mly"
                                                ( trigs )
# 2920 "src/parsers/native_parser.ml"
     : ((AltErgoLib.Parsed.lexpr list * bool) list))

let _menhir_action_167 =
  fun alpha ->
    (
# 540 "src/parsers/native_parser.mly"
                      ( alpha )
# 2928 "src/parsers/native_parser.ml"
     : (string))

let _menhir_action_168 =
  fun () ->
    (
# 543 "src/parsers/native_parser.mly"
            ( [] )
# 2936 "src/parsers/native_parser.ml"
     : (string list))

let _menhir_action_169 =
  fun alpha ->
    (
# 544 "src/parsers/native_parser.mly"
                    ( [alpha] )
# 2944 "src/parsers/native_parser.ml"
     : (string list))

let _menhir_action_170 =
  fun l ->
    (
# 545 "src/parsers/native_parser.mly"
                                                ( l )
# 2952 "src/parsers/native_parser.ml"
     : (string list))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | AC ->
        "AC"
    | AND ->
        "AND"
    | AT ->
        "AT"
    | AXIOM ->
        "AXIOM"
    | BAR ->
        "BAR"
    | BITV ->
        "BITV"
    | BOOL ->
        "BOOL"
    | CASESPLIT ->
        "CASESPLIT"
    | CHECK ->
        "CHECK"
    | CHECK_SAT ->
        "CHECK_SAT"
    | COLON ->
        "COLON"
    | COMMA ->
        "COMMA"
    | CUT ->
        "CUT"
    | DISTINCT ->
        "DISTINCT"
    | DOT ->
        "DOT"
    | ELSE ->
        "ELSE"
    | END ->
        "END"
    | EOF ->
        "EOF"
    | EQUAL ->
        "EQUAL"
    | EXISTS ->
        "EXISTS"
    | EXTENDS ->
        "EXTENDS"
    | FALSE ->
        "FALSE"
    | FORALL ->
        "FORALL"
    | FUNC ->
        "FUNC"
    | GE ->
        "GE"
    | GOAL ->
        "GOAL"
    | GT ->
        "GT"
    | HAT ->
        "HAT"
    | ID _ ->
        "ID"
    | IF ->
        "IF"
    | IN ->
        "IN"
    | INT ->
        "INT"
    | INTEGER _ ->
        "INTEGER"
    | LE ->
        "LE"
    | LEFTARROW ->
        "LEFTARROW"
    | LEFTBR ->
        "LEFTBR"
    | LEFTPAR ->
        "LEFTPAR"
    | LEFTSQ ->
        "LEFTSQ"
    | LET ->
        "LET"
    | LOGIC ->
        "LOGIC"
    | LRARROW ->
        "LRARROW"
    | LT ->
        "LT"
    | MAPS_TO ->
        "MAPS_TO"
    | MATCH ->
        "MATCH"
    | MINUS ->
        "MINUS"
    | NOT ->
        "NOT"
    | NOTEQ ->
        "NOTEQ"
    | NUM _ ->
        "NUM"
    | OF ->
        "OF"
    | OR ->
        "OR"
    | PERCENT ->
        "PERCENT"
    | PLUS ->
        "PLUS"
    | POW ->
        "POW"
    | POWDOT ->
        "POWDOT"
    | PRED ->
        "PRED"
    | PROP ->
        "PROP"
    | PV ->
        "PV"
    | QM ->
        "QM"
    | QM_ID _ ->
        "QM_ID"
    | QUOTE ->
        "QUOTE"
    | REAL ->
        "REAL"
    | REWRITING ->
        "REWRITING"
    | RIGHTARROW ->
        "RIGHTARROW"
    | RIGHTBR ->
        "RIGHTBR"
    | RIGHTPAR ->
        "RIGHTPAR"
    | RIGHTSQ ->
        "RIGHTSQ"
    | SHARP ->
        "SHARP"
    | SLASH ->
        "SLASH"
    | STRING _ ->
        "STRING"
    | THEN ->
        "THEN"
    | THEORY ->
        "THEORY"
    | TIMES ->
        "TIMES"
    | TRUE ->
        "TRUE"
    | TYPE ->
        "TYPE"
    | UNIT ->
        "UNIT"
    | VOID ->
        "VOID"
    | WITH ->
        "WITH"
    | XOR ->
        "XOR"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_goto_file_parser : type  ttv_stack. ttv_stack -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _v ->
      MenhirBox_file_parser _v
  
  let _menhir_run_368 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _v ->
      let decls = _v in
      let _v = _menhir_action_034 decls in
      _menhir_goto_file_parser _menhir_stack _v
  
  let rec _menhir_goto_list1_decl : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_file_parser) _menhir_state -> _menhir_box_file_parser =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState371 ->
          _menhir_run_372 _menhir_stack _v
      | MenhirState000 ->
          _menhir_run_368 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_372 : type  ttv_stack. (ttv_stack, _menhir_box_file_parser) _menhir_cell1_decl -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _v ->
      let MenhirCell1_decl (_menhir_stack, _menhir_s, decl) = _menhir_stack in
      let decls = _v in
      let _v = _menhir_action_089 decl decls in
      _menhir_goto_list1_decl _menhir_stack _v _menhir_s
  
  let _menhir_run_379 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_trigger_parser =
    fun _menhir_stack _v _tok ->
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let trigger = _v in
          let _v = _menhir_action_164 trigger in
          MenhirBox_trigger_parser _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_001 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file_parser) _menhir_state -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_TYPE (_menhir_stack, _menhir_s, _startpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | QUOTE ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState001
      | LEFTPAR ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState001
      | ID _ ->
          let _v = _menhir_action_168 () in
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState001 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_002 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_QUOTE (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState002 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_003 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos_id_, _startpos_id_, id) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_039 id in
      _menhir_goto_ident _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_id_ _startpos_id_ _v _menhir_s _tok
  
  and _menhir_goto_ident : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState364 ->
          _menhir_run_365 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState360 ->
          _menhir_run_361 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState345 ->
          _menhir_run_346 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState351 ->
          _menhir_run_302 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState298 ->
          _menhir_run_302 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState321 ->
          _menhir_run_302 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState313 ->
          _menhir_run_302 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState300 ->
          _menhir_run_302 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState289 ->
          _menhir_run_290 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState281 ->
          _menhir_run_282 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState266 ->
          _menhir_run_265 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState262 ->
          _menhir_run_265 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState256 ->
          _menhir_run_261 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState273 ->
          _menhir_run_261 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState257 ->
          _menhir_run_261 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState253 ->
          _menhir_run_250 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState073 ->
          _menhir_run_250 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState082 ->
          _menhir_run_246 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState377 ->
          _menhir_run_227 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState105 ->
          _menhir_run_227 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState204 ->
          _menhir_run_227 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState208 ->
          _menhir_run_227 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState183 ->
          _menhir_run_184 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState373 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState366 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState362 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState356 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState347 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState330 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState308 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState310 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState326 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState316 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState291 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState294 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState283 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState064 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState068 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState070 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState071 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState072 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState275 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState269 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState259 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState251 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState075 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState081 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState090 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState091 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState237 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState239 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState234 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState228 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState201 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState109 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState197 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState111 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState192 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState112 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState113 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState180 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState120 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState175 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState122 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState133 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState172 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState140 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState170 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState152 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState168 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState166 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState164 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState162 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState160 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState158 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState154 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState156 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState146 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState150 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState148 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState144 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState142 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState138 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState124 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState118 ->
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState115 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState242 ->
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState086 ->
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState062 ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState059 ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState057 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState013 ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState053 ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState046 ->
          _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState044 ->
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState038 ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState355 ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState344 ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState338 ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState325 ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState304 ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState186 ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState102 ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState040 ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState032 ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState354 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState336 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState342 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState324 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState303 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState185 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState101 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState021 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState024 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState033 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState014 ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState018 ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState011 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState002 ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_365 : type  ttv_stack. ((ttv_stack, _menhir_box_file_parser) _menhir_cell1_AXIOM as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _menhir_s = MenhirState366 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VOID ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUM _v ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MATCH ->
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LET ->
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTSQ ->
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTPAR ->
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTBR ->
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTEGER _v ->
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FORALL ->
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXISTS ->
              _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DISTINCT ->
              _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CUT ->
              _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CHECK ->
              _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_065 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
      let _v = _menhir_action_142 _endpos__1_ _startpos__1_ in
      _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_goto_simple_expr : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState377 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState373 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState366 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState362 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState356 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState347 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState330 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState310 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState326 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState316 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState308 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState294 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState291 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState283 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState064 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState068 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState070 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState071 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState275 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState269 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState259 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState072 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState251 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState075 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState081 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState090 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState239 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState237 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState091 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState234 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState105 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState228 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState208 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState204 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState201 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState197 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState109 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState192 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState111 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState112 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState180 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState175 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState172 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState170 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState168 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState166 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState164 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState162 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState160 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState158 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState156 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState154 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState152 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState150 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState148 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState146 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState144 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState142 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState140 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState138 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState133 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState124 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState122 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState120 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState113 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState082 ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_114 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SHARP ->
          let _menhir_stack = MenhirCell1_simple_expr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer
      | QM_ID _v_0 ->
          let _menhir_stack = MenhirCell1_simple_expr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | QM ->
          let _menhir_stack = MenhirCell1_simple_expr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LEFTSQ ->
          let _menhir_stack = MenhirCell1_simple_expr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DOT ->
          let _menhir_stack = MenhirCell1_simple_expr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_183 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COLON ->
          let _menhir_stack = MenhirCell1_simple_expr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_185 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | AT | AXIOM | BAR | CASESPLIT | CHECK_SAT | COMMA | ELSE | END | EOF | EQUAL | FUNC | GE | GOAL | GT | HAT | IN | LE | LEFTARROW | LOGIC | LRARROW | LT | MINUS | NOTEQ | OR | PERCENT | PLUS | POW | POWDOT | PRED | PV | REWRITING | RIGHTARROW | RIGHTBR | RIGHTPAR | RIGHTSQ | SLASH | THEN | THEORY | TIMES | TYPE | WITH | XOR ->
          let (_endpos_se_, _startpos_se_, se) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_043 se in
          _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_se_ _startpos_se_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_115 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_simple_expr -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState115 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_117 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_simple_expr -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_simple_expr (_menhir_stack, _menhir_s, se, _startpos_se_, _) = _menhir_stack in
      let (_endpos_id_, id) = (_endpos, _v) in
      let _v = _menhir_action_153 _endpos_id_ _startpos_se_ id se in
      _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_id_ _startpos_se_ _v _menhir_s _tok
  
  and _menhir_run_118 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_simple_expr -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _menhir_stack = MenhirCell0_QM (_menhir_stack, _startpos, _endpos) in
      let _menhir_s = MenhirState118 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_120 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_simple_expr -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _menhir_stack = MenhirCell0_LEFTSQ (_menhir_stack, _startpos, _endpos) in
      let _menhir_s = MenhirState120 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MATCH ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTSQ ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTBR ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTEGER _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FORALL ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISTINCT ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CUT ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CHECK ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_066 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
      let _v = _menhir_action_140 _endpos__1_ _startpos__1_ in
      _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_067 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_STRING (_menhir_stack, _menhir_s, _v, _startpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _menhir_s = MenhirState068 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VOID ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUM _v ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MATCH ->
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LET ->
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTSQ ->
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTPAR ->
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTBR ->
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTEGER _v ->
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FORALL ->
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXISTS ->
              _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DISTINCT ->
              _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CUT ->
              _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CHECK ->
              _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_069 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos_i_, _startpos_i_, i) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_139 _endpos_i_ _startpos_i_ i in
      _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_i_ _startpos_i_ _v _menhir_s _tok
  
  and _menhir_run_070 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_NOT (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState070 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MATCH ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTSQ ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTBR ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTEGER _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FORALL ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISTINCT ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CUT ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CHECK ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_071 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState071 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MATCH ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTSQ ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTBR ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTEGER _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FORALL ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISTINCT ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CUT ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CHECK ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_072 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_MATCH (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState072 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MATCH ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTSQ ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTBR ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTEGER _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FORALL ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISTINCT ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CUT ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CHECK ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_073 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LET (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState073 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_076 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | BAR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | INTEGER _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | BAR ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | RIGHTSQ ->
                      let _endpos_2 = _menhir_lexbuf.Lexing.lex_curr_p in
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      let (_startpos__1_, _endpos__5_, bv_cst) = (_startpos, _endpos_2, _v) in
                      let _v = _menhir_action_064 _endpos__5_ _startpos__1_ bv_cst in
                      _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__5_ _startpos__1_ _v _menhir_s _tok
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_lexpr : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState373 ->
          _menhir_run_375 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState366 ->
          _menhir_run_367 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState362 ->
          _menhir_run_363 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState356 ->
          _menhir_run_357 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState347 ->
          _menhir_run_348 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState330 ->
          _menhir_run_331 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState326 ->
          _menhir_run_327 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState316 ->
          _menhir_run_317 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState308 ->
          _menhir_run_309 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState294 ->
          _menhir_run_293 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState291 ->
          _menhir_run_293 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState283 ->
          _menhir_run_284 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState064 ->
          _menhir_run_280 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState068 ->
          _menhir_run_279 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState070 ->
          _menhir_run_278 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState071 ->
          _menhir_run_277 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState275 ->
          _menhir_run_276 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState269 ->
          _menhir_run_270 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState259 ->
          _menhir_run_260 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState072 ->
          _menhir_run_255 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState251 ->
          _menhir_run_252 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState075 ->
          _menhir_run_249 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState081 ->
          _menhir_run_247 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState090 ->
          _menhir_run_241 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState239 ->
          _menhir_run_240 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState237 ->
          _menhir_run_238 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState091 ->
          _menhir_run_236 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState234 ->
          _menhir_run_235 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState228 ->
          _menhir_run_229 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState377 ->
          _menhir_run_210 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState105 ->
          _menhir_run_210 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState204 ->
          _menhir_run_210 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState208 ->
          _menhir_run_210 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState201 ->
          _menhir_run_202 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState109 ->
          _menhir_run_195 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState192 ->
          _menhir_run_194 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState111 ->
          _menhir_run_191 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState112 ->
          _menhir_run_188 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState113 ->
          _menhir_run_187 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState180 ->
          _menhir_run_181 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState175 ->
          _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState170 ->
          _menhir_run_171 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState310 ->
          _menhir_run_169 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
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
      | MenhirState148 ->
          _menhir_run_149 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState146 ->
          _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState144 ->
          _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState142 ->
          _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState140 ->
          _menhir_run_141 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState138 ->
          _menhir_run_139 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState197 ->
          _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState172 ->
          _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState133 ->
          _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState124 ->
          _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState122 ->
          _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState120 ->
          _menhir_run_121 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_375 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_lexpr_parser) _menhir_state -> _ -> _menhir_box_lexpr_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | XOR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState375
      | TIMES ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState375
      | SLASH ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState375
      | RIGHTARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState375
      | POWDOT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState375
      | POW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState375
      | PLUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState375
      | PERCENT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState375
      | OR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState375
      | NOTEQ ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState375
      | MINUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState375
      | LT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState375
      | LRARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState375
      | LE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState375
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState375
      | GE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState375
      | EQUAL ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState375
      | EOF ->
          let e = _v in
          let _v = _menhir_action_079 e in
          MenhirBox_lexpr_parser _v
      | AT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState375
      | AND ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState375
      | _ ->
          _eRR ()
  
  and _menhir_run_122 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_XOR (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState122 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MATCH ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTSQ ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTBR ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTEGER _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FORALL ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISTINCT ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CUT ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CHECK ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_081 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LEFTPAR (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState081 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MATCH ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTSQ ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTBR ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTEGER _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FORALL ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISTINCT ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CUT ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CHECK ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_082 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LEFTBR (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState082 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NUM _v ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LEFTPAR ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTBR ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTEGER _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_083 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos_i_, _startpos_i_, i) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_138 _endpos_i_ _startpos_i_ i in
      _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_i_ _startpos_i_ _v _menhir_s _tok
  
  and _menhir_run_084 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
      let _v = _menhir_action_141 _endpos__1_ _startpos__1_ in
      _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_091 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState091 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MATCH ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTSQ ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTBR ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTEGER _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FORALL ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISTINCT ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CUT ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CHECK ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_092 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_FORALL (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState092 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_093 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STRING _v_0 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (id, str) = (_v, _v_0) in
          let _v = _menhir_action_127 id str in
          _menhir_goto_named_ident _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | COLON | COMMA | EQUAL | LEFTPAR ->
          let id = _v in
          let _v = _menhir_action_126 id in
          _menhir_goto_named_ident _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_named_ident : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState349 ->
          _menhir_run_350 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState319 ->
          _menhir_run_320 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState311 ->
          _menhir_run_312 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState296 ->
          _menhir_run_297 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState334 ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState106 ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState099 ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState096 ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState092 ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_350 : type  ttv_stack. ((ttv_stack, _menhir_box_file_parser) _menhir_cell1_FUNC as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_named_ident (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LEFTPAR ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _menhir_stack = MenhirCell0_LEFTPAR (_menhir_stack, _startpos) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v_0 ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState351
          | RIGHTPAR ->
              let _v_1 = _menhir_action_082 () in
              _menhir_run_352 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState351
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_352 : type  ttv_stack. (((ttv_stack, _menhir_box_file_parser) _menhir_cell1_FUNC, _menhir_box_file_parser) _menhir_cell1_named_ident _menhir_cell0_LEFTPAR as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_list0_logic_binder_sep_comma (_menhir_stack, _menhir_s, _v) in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _menhir_stack = MenhirCell0_RIGHTPAR (_menhir_stack, _endpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _menhir_s = MenhirState354 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UNIT ->
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | REAL ->
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | QUOTE ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTPAR ->
              _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT ->
              _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BOOL ->
              _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BITV ->
              _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_022 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _endpos__1_ = _endpos in
      let _v = _menhir_action_131 () in
      _menhir_goto_primitive_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _v _menhir_s _tok
  
  and _menhir_goto_primitive_type : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState354 ->
          _menhir_run_355 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
      | MenhirState342 ->
          _menhir_run_344 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
      | MenhirState336 ->
          _menhir_run_338 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
      | MenhirState324 ->
          _menhir_run_325 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
      | MenhirState303 ->
          _menhir_run_304 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
      | MenhirState185 ->
          _menhir_run_186 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
      | MenhirState101 ->
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
      | MenhirState021 ->
          _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
      | MenhirState033 ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
      | MenhirState024 ->
          _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_355 : type  ttv_stack. ((((ttv_stack, _menhir_box_file_parser) _menhir_cell1_FUNC, _menhir_box_file_parser) _menhir_cell1_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file_parser) _menhir_cell1_list0_logic_binder_sep_comma _menhir_cell0_RIGHTPAR as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_primitive_type (_menhir_stack, _menhir_s, _v, _endpos) in
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState355
      | EQUAL ->
          let _menhir_stack = MenhirCell1_EQUAL (_menhir_stack, MenhirState355) in
          let _menhir_s = MenhirState356 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VOID ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUM _v ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MATCH ->
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LET ->
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTSQ ->
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTPAR ->
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTBR ->
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTEGER _v ->
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FORALL ->
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXISTS ->
              _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DISTINCT ->
              _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CUT ->
              _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CHECK ->
              _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_106 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_EXISTS (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState106 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_110 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_DISTINCT (_menhir_stack, _menhir_s, _startpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LEFTPAR ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _menhir_stack = MenhirCell0_LEFTPAR (_menhir_stack, _startpos) in
          let _menhir_s = MenhirState111 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VOID ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUM _v ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MATCH ->
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LET ->
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTSQ ->
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTPAR ->
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTBR ->
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTEGER _v ->
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FORALL ->
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXISTS ->
              _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DISTINCT ->
              _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CUT ->
              _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CHECK ->
              _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_112 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_CUT (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState112 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MATCH ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTSQ ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTBR ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTEGER _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FORALL ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISTINCT ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CUT ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CHECK ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_113 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_CHECK (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState113 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MATCH ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTSQ ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTBR ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTEGER _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FORALL ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISTINCT ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CUT ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CHECK ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_344 : type  ttv_stack. ((((ttv_stack, _menhir_box_file_parser) _menhir_cell1_LOGIC _menhir_cell0_ac_modifier, _menhir_box_file_parser) _menhir_cell1_list1_named_ident_sep_comma, _menhir_box_file_parser) _menhir_cell1_list0_primitive_type_sep_comma as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          let _menhir_stack = MenhirCell1_primitive_type (_menhir_stack, _menhir_s, _v, _endpos) in
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState344
      | AXIOM | CHECK_SAT | EOF | FUNC | GOAL | LOGIC | PRED | REWRITING | THEORY | TYPE ->
          let MenhirCell1_list0_primitive_type_sep_comma (_menhir_stack, _, ty_list) = _menhir_stack in
          let (_endpos_ret_ty_, ret_ty) = (_endpos, _v) in
          let _v = _menhir_action_123 ret_ty ty_list in
          _menhir_goto_logic_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_ret_ty_ _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_logic_type : type  ttv_stack. ((ttv_stack, _menhir_box_file_parser) _menhir_cell1_LOGIC _menhir_cell0_ac_modifier, _menhir_box_file_parser) _menhir_cell1_list1_named_ident_sep_comma -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_list1_named_ident_sep_comma (_menhir_stack, _, ids) = _menhir_stack in
      let MenhirCell0_ac_modifier (_menhir_stack, is_ac) = _menhir_stack in
      let MenhirCell1_LOGIC (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_ty_, ty) = (_endpos, _v) in
      let _v = _menhir_action_026 _endpos_ty_ _startpos__1_ ids is_ac ty in
      _menhir_goto_decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_decl : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TYPE ->
          let _menhir_stack = MenhirCell1_decl (_menhir_stack, _menhir_s, _v) in
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState371
      | THEORY ->
          let _menhir_stack = MenhirCell1_decl (_menhir_stack, _menhir_s, _v) in
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState371
      | REWRITING ->
          let _menhir_stack = MenhirCell1_decl (_menhir_stack, _menhir_s, _v) in
          _menhir_run_289 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState371
      | PRED ->
          let _menhir_stack = MenhirCell1_decl (_menhir_stack, _menhir_s, _v) in
          _menhir_run_296 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState371
      | LOGIC ->
          let _menhir_stack = MenhirCell1_decl (_menhir_stack, _menhir_s, _v) in
          _menhir_run_332 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState371
      | GOAL ->
          let _menhir_stack = MenhirCell1_decl (_menhir_stack, _menhir_s, _v) in
          _menhir_run_345 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState371
      | FUNC ->
          let _menhir_stack = MenhirCell1_decl (_menhir_stack, _menhir_s, _v) in
          _menhir_run_349 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState371
      | CHECK_SAT ->
          let _menhir_stack = MenhirCell1_decl (_menhir_stack, _menhir_s, _v) in
          _menhir_run_360 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState371
      | AXIOM ->
          let _menhir_stack = MenhirCell1_decl (_menhir_stack, _menhir_s, _v) in
          _menhir_run_364 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState371
      | EOF ->
          let decl = _v in
          let _v = _menhir_action_088 decl in
          _menhir_goto_list1_decl _menhir_stack _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_057 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file_parser) _menhir_state -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_THEORY (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState057 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_289 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file_parser) _menhir_state -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_REWRITING (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState289 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_296 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file_parser) _menhir_state -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_PRED (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState296 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_332 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file_parser) _menhir_state -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LOGIC (_menhir_stack, _menhir_s, _startpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | AC ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _v = _menhir_action_004 () in
          _menhir_goto_ac_modifier _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | ID _ ->
          let _v = _menhir_action_003 () in
          _menhir_goto_ac_modifier _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_ac_modifier : type  ttv_stack. (ttv_stack, _menhir_box_file_parser) _menhir_cell1_LOGIC -> _ -> _ -> _ -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _menhir_stack = MenhirCell0_ac_modifier (_menhir_stack, _v) in
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState334
      | _ ->
          _eRR ()
  
  and _menhir_run_345 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file_parser) _menhir_state -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_GOAL (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState345 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_349 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file_parser) _menhir_state -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_FUNC (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState349 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_360 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file_parser) _menhir_state -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_CHECK_SAT (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState360 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_364 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file_parser) _menhir_state -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_AXIOM (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState364 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_338 : type  ttv_stack. (((ttv_stack, _menhir_box_file_parser) _menhir_cell1_LOGIC _menhir_cell0_ac_modifier, _menhir_box_file_parser) _menhir_cell1_list1_named_ident_sep_comma as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          let _menhir_stack = MenhirCell1_primitive_type (_menhir_stack, _menhir_s, _v, _endpos) in
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState338
      | COMMA ->
          let _menhir_stack = MenhirCell1_primitive_type (_menhir_stack, _menhir_s, _v, _endpos) in
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState338
      | RIGHTARROW ->
          let ty = _v in
          let _v = _menhir_action_110 ty in
          _menhir_goto_list1_primitive_type_sep_comma _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | AXIOM | CHECK_SAT | EOF | FUNC | GOAL | LOGIC | PRED | REWRITING | THEORY | TYPE ->
          let (_endpos_ret_ty_, ret_ty) = (_endpos, _v) in
          let _v = _menhir_action_124 ret_ty in
          _menhir_goto_logic_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_ret_ty_ _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_033 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_primitive_type as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_COMMA (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState033 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UNIT ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | REAL ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | QUOTE ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BITV ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_023 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _endpos__1_ = _endpos in
      let _v = _menhir_action_130 () in
      _menhir_goto_primitive_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _v _menhir_s _tok
  
  and _menhir_run_024 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LEFTPAR (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState024 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UNIT ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | REAL ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | QUOTE ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BITV ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_025 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _endpos__1_ = _endpos in
      let _v = _menhir_action_128 () in
      _menhir_goto_primitive_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _v _menhir_s _tok
  
  and _menhir_run_026 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _endpos__1_ = _endpos in
      let _v = _menhir_action_129 () in
      _menhir_goto_primitive_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _v _menhir_s _tok
  
  and _menhir_run_027 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LEFTSQ ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | INTEGER _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | RIGHTSQ ->
                  let _endpos_2 = _menhir_lexbuf.Lexing.lex_curr_p in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let (_endpos__4_, sz) = (_endpos_2, _v) in
                  let _v = _menhir_action_132 sz in
                  _menhir_goto_primitive_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__4_ _v _menhir_s _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_list1_primitive_type_sep_comma : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState336 ->
          _menhir_run_340 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState024 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState033 ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_340 : type  ttv_stack. (((ttv_stack, _menhir_box_file_parser) _menhir_cell1_LOGIC _menhir_cell0_ac_modifier, _menhir_box_file_parser) _menhir_cell1_list1_named_ident_sep_comma as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let ty_l = _v in
      let _v = _menhir_action_085 ty_l in
      _menhir_goto_list0_primitive_type_sep_comma _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_list0_primitive_type_sep_comma : type  ttv_stack. (((ttv_stack, _menhir_box_file_parser) _menhir_cell1_LOGIC _menhir_cell0_ac_modifier, _menhir_box_file_parser) _menhir_cell1_list1_named_ident_sep_comma as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | RIGHTARROW ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UNIT ->
              let _menhir_stack = MenhirCell1_list0_primitive_type_sep_comma (_menhir_stack, _menhir_s, _v) in
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState342
          | REAL ->
              let _menhir_stack = MenhirCell1_list0_primitive_type_sep_comma (_menhir_stack, _menhir_s, _v) in
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState342
          | QUOTE ->
              let _menhir_stack = MenhirCell1_list0_primitive_type_sep_comma (_menhir_stack, _menhir_s, _v) in
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState342
          | PROP ->
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_endpos__3_, ty_list) = (_endpos, _v) in
              let _v = _menhir_action_121 ty_list in
              _menhir_goto_logic_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _v _tok
          | LEFTPAR ->
              let _menhir_stack = MenhirCell1_list0_primitive_type_sep_comma (_menhir_stack, _menhir_s, _v) in
              _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState342
          | INT ->
              let _menhir_stack = MenhirCell1_list0_primitive_type_sep_comma (_menhir_stack, _menhir_s, _v) in
              _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState342
          | ID _v_0 ->
              let _menhir_stack = MenhirCell1_list0_primitive_type_sep_comma (_menhir_stack, _menhir_s, _v) in
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState342
          | BOOL ->
              let _menhir_stack = MenhirCell1_list0_primitive_type_sep_comma (_menhir_stack, _menhir_s, _v) in
              _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState342
          | BITV ->
              let _menhir_stack = MenhirCell1_list0_primitive_type_sep_comma (_menhir_stack, _menhir_s, _v) in
              _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState342
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_037 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LEFTPAR as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_list1_primitive_type_sep_comma (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RIGHTPAR ->
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _menhir_stack = MenhirCell0_RIGHTPAR (_menhir_stack, _endpos) in
          let _menhir_s = MenhirState038 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_034 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_primitive_type, ttv_result) _menhir_cell1_COMMA -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_COMMA (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_primitive_type (_menhir_stack, _menhir_s, ty, _) = _menhir_stack in
      let ty_l = _v in
      let _v = _menhir_action_111 ty ty_l in
      _menhir_goto_list1_primitive_type_sep_comma _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_325 : type  ttv_stack. ((((((ttv_stack, _menhir_box_file_parser) _menhir_cell1_lexpr, _menhir_box_file_parser) _menhir_cell1_AND, _menhir_box_file_parser) _menhir_cell1_FUNC, _menhir_box_file_parser) _menhir_cell1_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file_parser) _menhir_cell1_list0_logic_binder_sep_comma _menhir_cell0_RIGHTPAR as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_primitive_type (_menhir_stack, _menhir_s, _v, _endpos) in
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState325
      | EQUAL ->
          let _menhir_stack = MenhirCell1_EQUAL (_menhir_stack, MenhirState325) in
          let _menhir_s = MenhirState326 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VOID ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUM _v ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MATCH ->
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LET ->
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTSQ ->
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTPAR ->
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTBR ->
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTEGER _v ->
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FORALL ->
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXISTS ->
              _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DISTINCT ->
              _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CUT ->
              _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CHECK ->
              _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_304 : type  ttv_stack. ((ttv_stack, _menhir_box_file_parser) _menhir_cell1_ident as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          let _menhir_stack = MenhirCell1_primitive_type (_menhir_stack, _menhir_s, _v, _endpos) in
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState304
      | COMMA | RIGHTPAR ->
          let MenhirCell1_ident (_menhir_stack, _menhir_s, id, _startpos_id_, _endpos_id_) = _menhir_stack in
          let ty = _v in
          let _v = _menhir_action_120 _endpos_id_ _startpos_id_ id ty in
          (match (_tok : MenhirBasics.token) with
          | COMMA ->
              let _menhir_stack = MenhirCell1_logic_binder (_menhir_stack, _menhir_s, _v) in
              let _menhir_s = MenhirState300 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | ID _v ->
                  _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | RIGHTPAR ->
              let binder = _v in
              let _v = _menhir_action_101 binder in
              _menhir_goto_list1_logic_binder_sep_comma _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _menhir_fail ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_list1_logic_binder_sep_comma : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file_parser) _menhir_state -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState351 ->
          _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState321 ->
          _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState313 ->
          _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState298 ->
          _menhir_run_305 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState300 ->
          _menhir_run_301 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_305 : type  ttv_stack. ((ttv_stack, _menhir_box_file_parser) _menhir_cell1_named_ident _menhir_cell0_LEFTPAR as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let binders_l = _v in
      let _v = _menhir_action_083 binders_l in
      _menhir_goto_list0_logic_binder_sep_comma _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list0_logic_binder_sep_comma : type  ttv_stack. ((ttv_stack, _menhir_box_file_parser) _menhir_cell1_named_ident _menhir_cell0_LEFTPAR as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState351 ->
          _menhir_run_352 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState321 ->
          _menhir_run_322 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState313 ->
          _menhir_run_314 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState298 ->
          _menhir_run_306 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_322 : type  ttv_stack. (((((ttv_stack, _menhir_box_file_parser) _menhir_cell1_lexpr, _menhir_box_file_parser) _menhir_cell1_AND, _menhir_box_file_parser) _menhir_cell1_FUNC, _menhir_box_file_parser) _menhir_cell1_named_ident _menhir_cell0_LEFTPAR as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_list0_logic_binder_sep_comma (_menhir_stack, _menhir_s, _v) in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _menhir_stack = MenhirCell0_RIGHTPAR (_menhir_stack, _endpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _menhir_s = MenhirState324 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UNIT ->
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | REAL ->
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | QUOTE ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTPAR ->
              _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT ->
              _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BOOL ->
              _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BITV ->
              _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_314 : type  ttv_stack. (((((ttv_stack, _menhir_box_file_parser) _menhir_cell1_lexpr, _menhir_box_file_parser) _menhir_cell1_AND, _menhir_box_file_parser) _menhir_cell1_PRED, _menhir_box_file_parser) _menhir_cell1_named_ident _menhir_cell0_LEFTPAR as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_list0_logic_binder_sep_comma (_menhir_stack, _menhir_s, _v) in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _menhir_stack = MenhirCell0_RIGHTPAR (_menhir_stack, _endpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | EQUAL ->
          let _menhir_s = MenhirState316 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VOID ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUM _v ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MATCH ->
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LET ->
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTSQ ->
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTPAR ->
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTBR ->
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTEGER _v ->
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FORALL ->
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXISTS ->
              _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DISTINCT ->
              _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CUT ->
              _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CHECK ->
              _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_306 : type  ttv_stack. (((ttv_stack, _menhir_box_file_parser) _menhir_cell1_PRED, _menhir_box_file_parser) _menhir_cell1_named_ident _menhir_cell0_LEFTPAR as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_list0_logic_binder_sep_comma (_menhir_stack, _menhir_s, _v) in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _menhir_stack = MenhirCell0_RIGHTPAR (_menhir_stack, _endpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | EQUAL ->
          let _menhir_s = MenhirState308 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VOID ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUM _v ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MATCH ->
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LET ->
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTSQ ->
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTPAR ->
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTBR ->
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTEGER _v ->
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FORALL ->
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXISTS ->
              _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DISTINCT ->
              _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CUT ->
              _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CHECK ->
              _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_301 : type  ttv_stack. (ttv_stack, _menhir_box_file_parser) _menhir_cell1_logic_binder -> _ -> _ -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_logic_binder (_menhir_stack, _menhir_s, binder) = _menhir_stack in
      let binders_list = _v in
      let _v = _menhir_action_102 binder binders_list in
      _menhir_goto_list1_logic_binder_sep_comma _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_186 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_simple_expr as 'stack) -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          let _menhir_stack = MenhirCell1_primitive_type (_menhir_stack, _menhir_s, _v, _endpos) in
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState186
      | AND | AT | AXIOM | BAR | CASESPLIT | CHECK_SAT | COLON | COMMA | DOT | ELSE | END | EOF | EQUAL | FUNC | GE | GOAL | GT | HAT | IN | LE | LEFTARROW | LEFTSQ | LOGIC | LRARROW | LT | MINUS | NOTEQ | OR | PERCENT | PLUS | POW | POWDOT | PRED | PV | QM | QM_ID _ | REWRITING | RIGHTARROW | RIGHTBR | RIGHTPAR | RIGHTSQ | SHARP | SLASH | THEN | THEORY | TIMES | TYPE | WITH | XOR ->
          let MenhirCell1_simple_expr (_menhir_stack, _menhir_s, se, _startpos_se_, _) = _menhir_stack in
          let (_endpos_ty_, ty) = (_endpos, _v) in
          let _v = _menhir_action_151 _endpos_ty_ _startpos_se_ se ty in
          _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_ty_ _startpos_se_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_102 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_list1_named_ident_sep_comma as 'stack) -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          let _menhir_stack = MenhirCell1_primitive_type (_menhir_stack, _menhir_s, _v, _endpos) in
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState102
      | COMMA | DOT | LEFTBR | LEFTSQ ->
          let MenhirCell1_list1_named_ident_sep_comma (_menhir_stack, _menhir_s, binders) = _menhir_stack in
          let ty = _v in
          let _v = _menhir_action_125 binders ty in
          (match (_tok : MenhirBasics.token) with
          | COMMA ->
              let _menhir_stack = MenhirCell1_multi_logic_binder (_menhir_stack, _menhir_s, _v) in
              let _menhir_s = MenhirState099 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | ID _v ->
                  _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | DOT | LEFTBR | LEFTSQ ->
              let binders = _v in
              let _v = _menhir_action_106 binders in
              _menhir_goto_list1_multi_logic_binder _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _menhir_fail ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_list1_multi_logic_binder : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState106 ->
          _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState092 ->
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState099 ->
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_107 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_EXISTS as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_list1_multi_logic_binder (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LEFTSQ ->
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState107
      | DOT | LEFTBR ->
          let _v_0 = _menhir_action_165 () in
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState107 _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_105 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_list1_multi_logic_binder as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _menhir_stack = MenhirCell1_LEFTSQ (_menhir_stack, _menhir_s, _startpos, _endpos) in
      let _menhir_s = MenhirState105 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MATCH ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTSQ ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTBR ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTEGER _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FORALL ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISTINCT ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CUT ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CHECK ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_108 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_EXISTS, ttv_result) _menhir_cell1_list1_multi_logic_binder as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_triggers (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LEFTBR ->
          _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState108
      | DOT ->
          let _v_0 = _menhir_action_036 () in
          _menhir_run_200 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState108 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_109 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_list1_multi_logic_binder, ttv_result) _menhir_cell1_triggers as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LEFTBR (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState109 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MATCH ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTSQ ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTBR ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTEGER _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FORALL ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISTINCT ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CUT ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CHECK ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_200 : type  ttv_stack ttv_result. ((((ttv_stack, ttv_result) _menhir_cell1_EXISTS, ttv_result) _menhir_cell1_list1_multi_logic_binder, ttv_result) _menhir_cell1_triggers as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_filters (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | DOT ->
          let _menhir_s = MenhirState201 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VOID ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUM _v ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MATCH ->
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LET ->
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTSQ ->
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTPAR ->
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTBR ->
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTEGER _v ->
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FORALL ->
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXISTS ->
              _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DISTINCT ->
              _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CUT ->
              _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CHECK ->
              _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_104 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_FORALL as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_list1_multi_logic_binder (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LEFTSQ ->
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState104
      | DOT | LEFTBR ->
          let _v_0 = _menhir_action_165 () in
          _menhir_run_232 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState104 _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_232 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_FORALL, ttv_result) _menhir_cell1_list1_multi_logic_binder as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_triggers (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LEFTBR ->
          _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState232
      | DOT ->
          let _v_0 = _menhir_action_036 () in
          _menhir_run_233 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState232 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_233 : type  ttv_stack ttv_result. ((((ttv_stack, ttv_result) _menhir_cell1_FORALL, ttv_result) _menhir_cell1_list1_multi_logic_binder, ttv_result) _menhir_cell1_triggers as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_filters (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | DOT ->
          let _menhir_s = MenhirState234 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VOID ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUM _v ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MATCH ->
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LET ->
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTSQ ->
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTPAR ->
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTBR ->
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTEGER _v ->
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FORALL ->
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXISTS ->
              _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DISTINCT ->
              _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CUT ->
              _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CHECK ->
              _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_103 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_multi_logic_binder -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_multi_logic_binder (_menhir_stack, _menhir_s, binders) = _menhir_stack in
      let l = _v in
      let _v = _menhir_action_107 binders l in
      _menhir_goto_list1_multi_logic_binder _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_040 : type  ttv_stack. ((ttv_stack, _menhir_box_file_parser) _menhir_cell1_ident as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          let _menhir_stack = MenhirCell1_primitive_type (_menhir_stack, _menhir_s, _v, _endpos) in
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState040
      | PV | RIGHTBR ->
          let MenhirCell1_ident (_menhir_stack, _menhir_s, id, _, _) = _menhir_stack in
          let ty = _v in
          let _v = _menhir_action_040 id ty in
          (match (_tok : MenhirBasics.token) with
          | PV ->
              let _menhir_stack = MenhirCell1_label_with_type (_menhir_stack, _menhir_s, _v) in
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _menhir_stack = MenhirCell0_PV (_menhir_stack, _endpos) in
              let _menhir_s = MenhirState018 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | ID _v ->
                  _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | RIGHTBR ->
              let label_typed = _v in
              let _v = _menhir_action_092 label_typed in
              _menhir_goto_list1_label_sep_PV _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _menhir_fail ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_list1_label_sep_PV : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file_parser) _menhir_state -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState018 ->
          _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState014 ->
          _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_019 : type  ttv_stack. (ttv_stack, _menhir_box_file_parser) _menhir_cell1_label_with_type _menhir_cell0_PV -> _ -> _ -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell0_PV (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_label_with_type (_menhir_stack, _menhir_s, lt) = _menhir_stack in
      let list_lt = _v in
      let _v = _menhir_action_093 list_lt lt in
      _menhir_goto_list1_label_sep_PV _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_015 : type  ttv_stack. (ttv_stack, _menhir_box_file_parser) _menhir_cell1_LEFTBR -> _ -> _ -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_LEFTBR (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let (_endpos__3_, labels) = (_endpos, _v) in
      let _v = _menhir_action_137 labels in
      _menhir_goto_record_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _v _menhir_s _tok
  
  and _menhir_goto_record_type : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState050 ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState013 ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_051 : type  ttv_stack. (ttv_stack, _menhir_box_file_parser) _menhir_cell1_ident -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let _2 = _v in
      let _v = _menhir_action_006 _2 in
      _menhir_goto_algebraic_args _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
  
  and _menhir_goto_algebraic_args : type  ttv_stack. (ttv_stack, _menhir_box_file_parser) _menhir_cell1_ident -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      match (_tok : MenhirBasics.token) with
      | BAR ->
          let _menhir_stack = MenhirCell0_algebraic_args (_menhir_stack, _v) in
          let _menhir_s = MenhirState053 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | AND | AXIOM | CHECK_SAT | EOF | FUNC | GOAL | LOGIC | PRED | REWRITING | THEORY | TYPE ->
          let MenhirCell1_ident (_menhir_stack, _menhir_s, cons, _, _) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_086 _2 cons in
          _menhir_goto_list1_constructors_sep_bar _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_list1_constructors_sep_bar : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState053 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState046 ->
          _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
      | MenhirState013 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_054 : type  ttv_stack. (ttv_stack, _menhir_box_file_parser) _menhir_cell1_ident _menhir_cell0_algebraic_args -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell0_algebraic_args (_menhir_stack, _2) = _menhir_stack in
      let MenhirCell1_ident (_menhir_stack, _menhir_s, cons, _, _) = _menhir_stack in
      let cons_l = _v in
      let _v = _menhir_action_087 _2 cons cons_l in
      _menhir_goto_list1_constructors_sep_bar _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
  
  and _menhir_run_047 : type  ttv_stack. (((((((ttv_stack, _menhir_box_file_parser) _menhir_cell1_type_vars, _menhir_box_file_parser) _menhir_cell1_ident, _menhir_box_file_parser) _menhir_cell1_list1_constructors_sep_bar, _menhir_box_file_parser) _menhir_cell1_AND, _menhir_box_file_parser) _menhir_cell1_type_vars, _menhir_box_file_parser) _menhir_cell1_ident as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_list1_constructors_sep_bar (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | AND ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState047
      | AXIOM | CHECK_SAT | EOF | FUNC | GOAL | LOGIC | PRED | REWRITING | THEORY | TYPE ->
          let _v_0 = _menhir_action_010 () in
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v_0 _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_043 : type  ttv_stack. ((((ttv_stack, _menhir_box_file_parser) _menhir_cell1_type_vars, _menhir_box_file_parser) _menhir_cell1_ident, _menhir_box_file_parser) _menhir_cell1_list1_constructors_sep_bar as 'stack) -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_AND (_menhir_stack, _menhir_s, _startpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | QUOTE ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState043
      | LEFTPAR ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState043
      | ID _ ->
          let _v = _menhir_action_168 () in
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState043 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_005 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file_parser) _menhir_state -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LEFTPAR (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState005 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | QUOTE ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_044 : type  ttv_stack. (((((ttv_stack, _menhir_box_file_parser) _menhir_cell1_type_vars, _menhir_box_file_parser) _menhir_cell1_ident, _menhir_box_file_parser) _menhir_cell1_list1_constructors_sep_bar, _menhir_box_file_parser) _menhir_cell1_AND as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_type_vars (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState044
      | _ ->
          _eRR ()
  
  and _menhir_run_048 : type  ttv_stack. (((((((ttv_stack, _menhir_box_file_parser) _menhir_cell1_type_vars, _menhir_box_file_parser) _menhir_cell1_ident, _menhir_box_file_parser) _menhir_cell1_list1_constructors_sep_bar, _menhir_box_file_parser) _menhir_cell1_AND, _menhir_box_file_parser) _menhir_cell1_type_vars, _menhir_box_file_parser) _menhir_cell1_ident, _menhir_box_file_parser) _menhir_cell1_list1_constructors_sep_bar -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_list1_constructors_sep_bar (_menhir_stack, _, enum) = _menhir_stack in
      let MenhirCell1_ident (_menhir_stack, _, ty, _, _) = _menhir_stack in
      let MenhirCell1_type_vars (_menhir_stack, _, ty_vars) = _menhir_stack in
      let MenhirCell1_AND (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_others_, others) = (_endpos, _v) in
      let _v = _menhir_action_011 _endpos_others_ _startpos__1_ enum others ty ty_vars in
      _menhir_goto_and_recursive_ty_opt _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_others_ _v _menhir_s _tok
  
  and _menhir_goto_and_recursive_ty_opt : type  ttv_stack. ((((ttv_stack, _menhir_box_file_parser) _menhir_cell1_type_vars, _menhir_box_file_parser) _menhir_cell1_ident, _menhir_box_file_parser) _menhir_cell1_list1_constructors_sep_bar as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState042 ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState047 ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_056 : type  ttv_stack. ((((ttv_stack, _menhir_box_file_parser) _menhir_cell1_TYPE, _menhir_box_file_parser) _menhir_cell1_type_vars, _menhir_box_file_parser) _menhir_cell1_ident, _menhir_box_file_parser) _menhir_cell1_list1_constructors_sep_bar -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_list1_constructors_sep_bar (_menhir_stack, _, enum) = _menhir_stack in
      let MenhirCell1_ident (_menhir_stack, _, ty, _, _) = _menhir_stack in
      let MenhirCell1_type_vars (_menhir_stack, _, ty_vars) = _menhir_stack in
      let MenhirCell1_TYPE (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_others_, others) = (_endpos, _v) in
      let _v = _menhir_action_024 _endpos_others_ _startpos__1_ enum others ty ty_vars in
      _menhir_goto_decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_042 : type  ttv_stack. ((((ttv_stack, _menhir_box_file_parser) _menhir_cell1_TYPE, _menhir_box_file_parser) _menhir_cell1_type_vars, _menhir_box_file_parser) _menhir_cell1_ident as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_list1_constructors_sep_bar (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | AND ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState042
      | AXIOM | CHECK_SAT | EOF | FUNC | GOAL | LOGIC | PRED | REWRITING | THEORY | TYPE ->
          let _v_0 = _menhir_action_010 () in
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v_0 _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_041 : type  ttv_stack. (((ttv_stack, _menhir_box_file_parser) _menhir_cell1_TYPE, _menhir_box_file_parser) _menhir_cell1_type_vars, _menhir_box_file_parser) _menhir_cell1_ident -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_ident (_menhir_stack, _, ty, _, _) = _menhir_stack in
      let MenhirCell1_type_vars (_menhir_stack, _, ty_vars) = _menhir_stack in
      let MenhirCell1_TYPE (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_record_, record) = (_endpos, _v) in
      let _v = _menhir_action_025 _endpos_record_ _startpos__1_ record ty ty_vars in
      _menhir_goto_decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_032 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          let _menhir_stack = MenhirCell1_primitive_type (_menhir_stack, _menhir_s, _v, _endpos) in
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState032
      | COMMA ->
          let _menhir_stack = MenhirCell1_primitive_type (_menhir_stack, _menhir_s, _v, _endpos) in
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState032
      | RIGHTARROW | RIGHTPAR ->
          let ty = _v in
          let _v = _menhir_action_110 ty in
          _menhir_goto_list1_primitive_type_sep_comma _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_320 : type  ttv_stack. ((((ttv_stack, _menhir_box_file_parser) _menhir_cell1_lexpr, _menhir_box_file_parser) _menhir_cell1_AND, _menhir_box_file_parser) _menhir_cell1_FUNC as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_named_ident (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LEFTPAR ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _menhir_stack = MenhirCell0_LEFTPAR (_menhir_stack, _startpos) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v_0 ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState321
          | RIGHTPAR ->
              let _v_1 = _menhir_action_082 () in
              _menhir_run_322 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState321
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_312 : type  ttv_stack. ((((ttv_stack, _menhir_box_file_parser) _menhir_cell1_lexpr, _menhir_box_file_parser) _menhir_cell1_AND, _menhir_box_file_parser) _menhir_cell1_PRED as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_named_ident (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LEFTPAR ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _menhir_stack = MenhirCell0_LEFTPAR (_menhir_stack, _startpos) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v_0 ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState313
          | RIGHTPAR ->
              let _v_1 = _menhir_action_082 () in
              _menhir_run_314 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState313
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_297 : type  ttv_stack. ((ttv_stack, _menhir_box_file_parser) _menhir_cell1_PRED as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_named_ident (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LEFTPAR ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _menhir_stack = MenhirCell0_LEFTPAR (_menhir_stack, _startpos) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v_0 ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState298
          | RIGHTPAR ->
              let _v_1 = _menhir_action_082 () in
              _menhir_run_306 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState298
          | _ ->
              _eRR ())
      | EQUAL ->
          let _menhir_s = MenhirState330 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VOID ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUM _v ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MATCH ->
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LET ->
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTSQ ->
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTPAR ->
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTBR ->
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTEGER _v ->
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FORALL ->
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXISTS ->
              _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DISTINCT ->
              _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CUT ->
              _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CHECK ->
              _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_095 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell1_named_ident (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState096 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v ->
              _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | COLON ->
          let id = _v in
          let _v = _menhir_action_108 id in
          _menhir_goto_list1_named_ident_sep_comma _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_list1_named_ident_sep_comma : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState334 ->
          _menhir_run_335 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState106 ->
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState092 ->
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState099 ->
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState096 ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_335 : type  ttv_stack. ((ttv_stack, _menhir_box_file_parser) _menhir_cell1_LOGIC _menhir_cell0_ac_modifier as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_list1_named_ident_sep_comma (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UNIT ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState336
      | REAL ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState336
      | QUOTE ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState336
      | PROP ->
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let _endpos__1_ = _endpos in
          let _v = _menhir_action_122 () in
          _menhir_goto_logic_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _v _tok
      | LEFTPAR ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState336
      | INT ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState336
      | ID _v_1 ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState336
      | BOOL ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState336
      | BITV ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState336
      | RIGHTARROW ->
          let _menhir_s = MenhirState336 in
          let _v = _menhir_action_084 () in
          _menhir_goto_list0_primitive_type_sep_comma _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_100 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_list1_named_ident_sep_comma (_menhir_stack, _menhir_s, _v) in
      let _menhir_s = MenhirState101 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UNIT ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | REAL ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | QUOTE ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BITV ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_097 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_named_ident -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_named_ident (_menhir_stack, _menhir_s, id) = _menhir_stack in
      let l = _v in
      let _v = _menhir_action_109 id l in
      _menhir_goto_list1_named_ident_sep_comma _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_124 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_TIMES (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState124 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MATCH ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTSQ ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTBR ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTEGER _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FORALL ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISTINCT ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CUT ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CHECK ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_138 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_SLASH (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState138 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MATCH ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTSQ ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTBR ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTEGER _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FORALL ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISTINCT ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CUT ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CHECK ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_140 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_RIGHTARROW (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState140 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MATCH ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTSQ ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTBR ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTEGER _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FORALL ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISTINCT ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CUT ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CHECK ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_142 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_POWDOT (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState142 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MATCH ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTSQ ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTBR ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTEGER _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FORALL ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISTINCT ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CUT ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CHECK ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_144 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_POW (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState144 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MATCH ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTSQ ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTBR ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTEGER _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FORALL ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISTINCT ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CUT ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CHECK ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_146 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PLUS (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState146 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MATCH ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTSQ ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTBR ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTEGER _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FORALL ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISTINCT ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CUT ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CHECK ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_148 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PERCENT (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState148 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MATCH ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTSQ ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTBR ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTEGER _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FORALL ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISTINCT ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CUT ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CHECK ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_152 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_OR (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState152 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MATCH ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTSQ ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTBR ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTEGER _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FORALL ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISTINCT ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CUT ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CHECK ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_154 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_NOTEQ (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState154 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MATCH ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTSQ ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTBR ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTEGER _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FORALL ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISTINCT ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CUT ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CHECK ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_156 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState156 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MATCH ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTSQ ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTBR ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTEGER _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FORALL ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISTINCT ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CUT ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CHECK ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_158 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LT (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState158 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MATCH ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTSQ ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTBR ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTEGER _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FORALL ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISTINCT ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CUT ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CHECK ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_170 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LRARROW (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState170 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MATCH ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTSQ ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTBR ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTEGER _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FORALL ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISTINCT ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CUT ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CHECK ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_160 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LE (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState160 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MATCH ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTSQ ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTBR ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTEGER _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FORALL ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISTINCT ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CUT ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CHECK ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_126 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_lexpr -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LEFTBR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | INTEGER _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | COMMA ->
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | INTEGER _v_1 ->
                      let _tok = _menhir_lexer _menhir_lexbuf in
                      (match (_tok : MenhirBasics.token) with
                      | RIGHTBR ->
                          let _endpos_4 = _menhir_lexbuf.Lexing.lex_curr_p in
                          let _tok = _menhir_lexer _menhir_lexbuf in
                          let MenhirCell1_lexpr (_menhir_stack, _menhir_s, e, _startpos_e_, _) = _menhir_stack in
                          let (i, _endpos__7_, j) = (_v, _endpos_4, _v_1) in
                          let _v = _menhir_action_065 _endpos__7_ _startpos_e_ e i j in
                          _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__7_ _startpos_e_ _v _menhir_s _tok
                      | _ ->
                          _eRR ())
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_162 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_GT (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState162 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MATCH ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTSQ ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTBR ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTEGER _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FORALL ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISTINCT ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CUT ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CHECK ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_164 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_GE (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState164 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MATCH ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTSQ ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTBR ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTEGER _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FORALL ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISTINCT ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CUT ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CHECK ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_166 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_EQUAL (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState166 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MATCH ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTSQ ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTBR ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTEGER _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FORALL ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISTINCT ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CUT ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CHECK ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_150 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_AT (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState150 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MATCH ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTSQ ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTBR ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTEGER _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FORALL ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISTINCT ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CUT ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CHECK ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_168 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_AND (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState168 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MATCH ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTSQ ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTBR ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTEGER _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FORALL ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISTINCT ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CUT ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CHECK ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_367 : type  ttv_stack. (((ttv_stack, _menhir_box_file_parser) _menhir_cell1_AXIOM, _menhir_box_file_parser) _menhir_cell1_ident as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | XOR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState367
      | TIMES ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState367
      | SLASH ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState367
      | RIGHTARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState367
      | POWDOT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState367
      | POW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState367
      | PLUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState367
      | PERCENT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState367
      | OR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState367
      | NOTEQ ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState367
      | MINUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState367
      | LT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState367
      | LRARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState367
      | LE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState367
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState367
      | GE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState367
      | EQUAL ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState367
      | AT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState367
      | AND ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState367
      | AXIOM | CHECK_SAT | EOF | FUNC | GOAL | LOGIC | PRED | REWRITING | THEORY | TYPE ->
          let MenhirCell1_ident (_menhir_stack, _, name, _, _) = _menhir_stack in
          let MenhirCell1_AXIOM (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_endpos_body_, body) = (_endpos, _v) in
          let _v = _menhir_action_030 _endpos_body_ _startpos__1_ body name in
          _menhir_goto_decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_363 : type  ttv_stack. (((ttv_stack, _menhir_box_file_parser) _menhir_cell1_CHECK_SAT, _menhir_box_file_parser) _menhir_cell1_ident as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | XOR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState363
      | TIMES ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState363
      | SLASH ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState363
      | RIGHTARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState363
      | POWDOT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState363
      | POW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState363
      | PLUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState363
      | PERCENT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState363
      | OR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState363
      | NOTEQ ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState363
      | MINUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState363
      | LT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState363
      | LRARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState363
      | LE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState363
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState363
      | GE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState363
      | EQUAL ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState363
      | AT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState363
      | AND ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState363
      | AXIOM | CHECK_SAT | EOF | FUNC | GOAL | LOGIC | PRED | REWRITING | THEORY | TYPE ->
          let MenhirCell1_ident (_menhir_stack, _, name, _, _) = _menhir_stack in
          let MenhirCell1_CHECK_SAT (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_endpos_body_, body) = (_endpos, _v) in
          let _v = _menhir_action_033 _endpos_body_ _startpos__1_ body name in
          _menhir_goto_decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_357 : type  ttv_stack. ((((((ttv_stack, _menhir_box_file_parser) _menhir_cell1_FUNC, _menhir_box_file_parser) _menhir_cell1_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file_parser) _menhir_cell1_list0_logic_binder_sep_comma _menhir_cell0_RIGHTPAR, _menhir_box_file_parser) _menhir_cell1_primitive_type, _menhir_box_file_parser) _menhir_cell1_EQUAL as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | XOR ->
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState357
      | TIMES ->
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState357
      | SLASH ->
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState357
      | RIGHTARROW ->
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState357
      | POWDOT ->
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState357
      | POW ->
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState357
      | PLUS ->
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState357
      | PERCENT ->
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState357
      | OR ->
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState357
      | NOTEQ ->
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState357
      | MINUS ->
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState357
      | LT ->
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState357
      | LRARROW ->
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState357
      | LE ->
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState357
      | HAT ->
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState357
      | GE ->
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState357
      | EQUAL ->
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState357
      | AT ->
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState357
      | AND ->
          _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState357
      | AXIOM | CHECK_SAT | EOF | FUNC | GOAL | LOGIC | PRED | REWRITING | THEORY | TYPE ->
          let _v_0 = _menhir_action_007 () in
          _menhir_run_358 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v_0 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_310 : type  ttv_stack. ((ttv_stack, _menhir_box_file_parser) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_AND (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState310 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | PRED ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _menhir_stack = MenhirCell1_PRED (_menhir_stack, _menhir_s, _startpos) in
          let _menhir_s = MenhirState311 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v ->
              _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | NUM _v ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MATCH ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTSQ ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTBR ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTEGER _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FUNC ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _menhir_stack = MenhirCell1_FUNC (_menhir_stack, _menhir_s, _startpos) in
          let _menhir_s = MenhirState319 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v ->
              _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | FORALL ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISTINCT ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CUT ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CHECK ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_358 : type  ttv_stack. ((((((ttv_stack, _menhir_box_file_parser) _menhir_cell1_FUNC, _menhir_box_file_parser) _menhir_cell1_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file_parser) _menhir_cell1_list0_logic_binder_sep_comma _menhir_cell0_RIGHTPAR, _menhir_box_file_parser) _menhir_cell1_primitive_type, _menhir_box_file_parser) _menhir_cell1_EQUAL, _menhir_box_file_parser) _menhir_cell1_lexpr -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_lexpr (_menhir_stack, _, body, _, _) = _menhir_stack in
      let MenhirCell1_EQUAL (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_primitive_type (_menhir_stack, _, ret_ty, _) = _menhir_stack in
      let MenhirCell0_RIGHTPAR (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_list0_logic_binder_sep_comma (_menhir_stack, _, args) = _menhir_stack in
      let MenhirCell0_LEFTPAR (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_named_ident (_menhir_stack, _, app) = _menhir_stack in
      let MenhirCell1_FUNC (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_others_, others) = (_endpos, _v) in
      let _v = _menhir_action_027 _endpos_others_ _startpos__1_ app args body others ret_ty in
      _menhir_goto_decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_348 : type  ttv_stack. (((ttv_stack, _menhir_box_file_parser) _menhir_cell1_GOAL, _menhir_box_file_parser) _menhir_cell1_ident as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | XOR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState348
      | TIMES ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState348
      | SLASH ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState348
      | RIGHTARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState348
      | POWDOT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState348
      | POW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState348
      | PLUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState348
      | PERCENT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState348
      | OR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState348
      | NOTEQ ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState348
      | MINUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState348
      | LT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState348
      | LRARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState348
      | LE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState348
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState348
      | GE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState348
      | EQUAL ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState348
      | AT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState348
      | AND ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState348
      | AXIOM | CHECK_SAT | EOF | FUNC | GOAL | LOGIC | PRED | REWRITING | THEORY | TYPE ->
          let MenhirCell1_ident (_menhir_stack, _, name, _, _) = _menhir_stack in
          let MenhirCell1_GOAL (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_endpos_body_, body) = (_endpos, _v) in
          let _v = _menhir_action_032 _endpos_body_ _startpos__1_ body name in
          _menhir_goto_decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_331 : type  ttv_stack. (((ttv_stack, _menhir_box_file_parser) _menhir_cell1_PRED, _menhir_box_file_parser) _menhir_cell1_named_ident as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | XOR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState331
      | TIMES ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState331
      | SLASH ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState331
      | RIGHTARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState331
      | POWDOT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState331
      | POW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState331
      | PLUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState331
      | PERCENT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState331
      | OR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState331
      | NOTEQ ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState331
      | MINUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState331
      | LT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState331
      | LRARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState331
      | LE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState331
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState331
      | GE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState331
      | EQUAL ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState331
      | AT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState331
      | AND ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState331
      | AXIOM | CHECK_SAT | EOF | FUNC | GOAL | LOGIC | PRED | REWRITING | THEORY | TYPE ->
          let MenhirCell1_named_ident (_menhir_stack, _, app) = _menhir_stack in
          let MenhirCell1_PRED (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_endpos_body_, body) = (_endpos, _v) in
          let _v = _menhir_action_028 _endpos_body_ _startpos__1_ app body in
          _menhir_goto_decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_327 : type  ttv_stack. ((((((((ttv_stack, _menhir_box_file_parser) _menhir_cell1_lexpr, _menhir_box_file_parser) _menhir_cell1_AND, _menhir_box_file_parser) _menhir_cell1_FUNC, _menhir_box_file_parser) _menhir_cell1_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file_parser) _menhir_cell1_list0_logic_binder_sep_comma _menhir_cell0_RIGHTPAR, _menhir_box_file_parser) _menhir_cell1_primitive_type, _menhir_box_file_parser) _menhir_cell1_EQUAL as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | XOR ->
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState327
      | TIMES ->
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState327
      | SLASH ->
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState327
      | RIGHTARROW ->
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState327
      | POWDOT ->
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState327
      | POW ->
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState327
      | PLUS ->
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState327
      | PERCENT ->
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState327
      | OR ->
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState327
      | NOTEQ ->
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState327
      | MINUS ->
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState327
      | LT ->
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState327
      | LRARROW ->
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState327
      | LE ->
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState327
      | HAT ->
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState327
      | GE ->
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState327
      | EQUAL ->
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState327
      | AT ->
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState327
      | AND ->
          _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState327
      | AXIOM | CHECK_SAT | EOF | FUNC | GOAL | LOGIC | PRED | REWRITING | THEORY | TYPE ->
          let _v_0 = _menhir_action_007 () in
          _menhir_run_328 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v_0 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_328 : type  ttv_stack. ((((((((ttv_stack, _menhir_box_file_parser) _menhir_cell1_lexpr, _menhir_box_file_parser) _menhir_cell1_AND, _menhir_box_file_parser) _menhir_cell1_FUNC, _menhir_box_file_parser) _menhir_cell1_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file_parser) _menhir_cell1_list0_logic_binder_sep_comma _menhir_cell0_RIGHTPAR, _menhir_box_file_parser) _menhir_cell1_primitive_type, _menhir_box_file_parser) _menhir_cell1_EQUAL, _menhir_box_file_parser) _menhir_cell1_lexpr -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_lexpr (_menhir_stack, _, body, _, _) = _menhir_stack in
      let MenhirCell1_EQUAL (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_primitive_type (_menhir_stack, _, ret_ty, _) = _menhir_stack in
      let MenhirCell0_RIGHTPAR (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_list0_logic_binder_sep_comma (_menhir_stack, _, args) = _menhir_stack in
      let MenhirCell0_LEFTPAR (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_named_ident (_menhir_stack, _, app) = _menhir_stack in
      let MenhirCell1_FUNC (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_AND (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_others_, others) = (_endpos, _v) in
      let _v = _menhir_action_009 _endpos_others_ _startpos__1_ app args body others ret_ty in
      _menhir_goto_and_recursive_def_opt _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_others_ _v _menhir_s _tok
  
  and _menhir_goto_and_recursive_def_opt : type  ttv_stack. ((ttv_stack, _menhir_box_file_parser) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState357 ->
          _menhir_run_358 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState309 ->
          _menhir_run_329 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState327 ->
          _menhir_run_328 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState317 ->
          _menhir_run_318 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_329 : type  ttv_stack. ((((ttv_stack, _menhir_box_file_parser) _menhir_cell1_PRED, _menhir_box_file_parser) _menhir_cell1_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file_parser) _menhir_cell1_list0_logic_binder_sep_comma _menhir_cell0_RIGHTPAR, _menhir_box_file_parser) _menhir_cell1_lexpr -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_lexpr (_menhir_stack, _, body, _, _) = _menhir_stack in
      let MenhirCell0_RIGHTPAR (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_list0_logic_binder_sep_comma (_menhir_stack, _, args) = _menhir_stack in
      let MenhirCell0_LEFTPAR (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_named_ident (_menhir_stack, _, app) = _menhir_stack in
      let MenhirCell1_PRED (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_others_, others) = (_endpos, _v) in
      let _v = _menhir_action_029 _endpos_others_ _startpos__1_ app args body others in
      _menhir_goto_decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_318 : type  ttv_stack. ((((((ttv_stack, _menhir_box_file_parser) _menhir_cell1_lexpr, _menhir_box_file_parser) _menhir_cell1_AND, _menhir_box_file_parser) _menhir_cell1_PRED, _menhir_box_file_parser) _menhir_cell1_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file_parser) _menhir_cell1_list0_logic_binder_sep_comma _menhir_cell0_RIGHTPAR, _menhir_box_file_parser) _menhir_cell1_lexpr -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_lexpr (_menhir_stack, _, body, _, _) = _menhir_stack in
      let MenhirCell0_RIGHTPAR (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_list0_logic_binder_sep_comma (_menhir_stack, _, args) = _menhir_stack in
      let MenhirCell0_LEFTPAR (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_named_ident (_menhir_stack, _, app) = _menhir_stack in
      let MenhirCell1_PRED (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_AND (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_others_, others) = (_endpos, _v) in
      let _v = _menhir_action_008 _endpos_others_ _startpos__1_ app args body others in
      _menhir_goto_and_recursive_def_opt _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_others_ _v _menhir_s _tok
  
  and _menhir_run_317 : type  ttv_stack. ((((((ttv_stack, _menhir_box_file_parser) _menhir_cell1_lexpr, _menhir_box_file_parser) _menhir_cell1_AND, _menhir_box_file_parser) _menhir_cell1_PRED, _menhir_box_file_parser) _menhir_cell1_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file_parser) _menhir_cell1_list0_logic_binder_sep_comma _menhir_cell0_RIGHTPAR as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | XOR ->
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState317
      | TIMES ->
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState317
      | SLASH ->
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState317
      | RIGHTARROW ->
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState317
      | POWDOT ->
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState317
      | POW ->
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState317
      | PLUS ->
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState317
      | PERCENT ->
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState317
      | OR ->
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState317
      | NOTEQ ->
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState317
      | MINUS ->
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState317
      | LT ->
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState317
      | LRARROW ->
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState317
      | LE ->
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState317
      | HAT ->
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState317
      | GE ->
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState317
      | EQUAL ->
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState317
      | AT ->
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState317
      | AND ->
          _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState317
      | AXIOM | CHECK_SAT | EOF | FUNC | GOAL | LOGIC | PRED | REWRITING | THEORY | TYPE ->
          let _v_0 = _menhir_action_007 () in
          _menhir_run_318 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v_0 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_309 : type  ttv_stack. ((((ttv_stack, _menhir_box_file_parser) _menhir_cell1_PRED, _menhir_box_file_parser) _menhir_cell1_named_ident _menhir_cell0_LEFTPAR, _menhir_box_file_parser) _menhir_cell1_list0_logic_binder_sep_comma _menhir_cell0_RIGHTPAR as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | XOR ->
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState309
      | TIMES ->
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState309
      | SLASH ->
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState309
      | RIGHTARROW ->
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState309
      | POWDOT ->
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState309
      | POW ->
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState309
      | PLUS ->
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState309
      | PERCENT ->
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState309
      | OR ->
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState309
      | NOTEQ ->
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState309
      | MINUS ->
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState309
      | LT ->
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState309
      | LRARROW ->
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState309
      | LE ->
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState309
      | HAT ->
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState309
      | GE ->
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState309
      | EQUAL ->
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState309
      | AT ->
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState309
      | AND ->
          _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState309
      | AXIOM | CHECK_SAT | EOF | FUNC | GOAL | LOGIC | PRED | REWRITING | THEORY | TYPE ->
          let _v_0 = _menhir_action_007 () in
          _menhir_run_329 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v_0 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_293 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | XOR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState293
      | TIMES ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState293
      | SLASH ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState293
      | RIGHTARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState293
      | PV ->
          let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VOID ->
              let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
              let _menhir_stack = MenhirCell1_PV (_menhir_stack, MenhirState293, _endpos_0) in
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState294
          | TRUE ->
              let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
              let _menhir_stack = MenhirCell1_PV (_menhir_stack, MenhirState293, _endpos_0) in
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState294
          | STRING _v_1 ->
              let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
              let _menhir_stack = MenhirCell1_PV (_menhir_stack, MenhirState293, _endpos_0) in
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState294
          | NUM _v_2 ->
              let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
              let _menhir_stack = MenhirCell1_PV (_menhir_stack, MenhirState293, _endpos_0) in
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState294
          | NOT ->
              let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
              let _menhir_stack = MenhirCell1_PV (_menhir_stack, MenhirState293, _endpos_0) in
              _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState294
          | MINUS ->
              let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
              let _menhir_stack = MenhirCell1_PV (_menhir_stack, MenhirState293, _endpos_0) in
              _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState294
          | MATCH ->
              let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
              let _menhir_stack = MenhirCell1_PV (_menhir_stack, MenhirState293, _endpos_0) in
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState294
          | LET ->
              let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
              let _menhir_stack = MenhirCell1_PV (_menhir_stack, MenhirState293, _endpos_0) in
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState294
          | LEFTSQ ->
              let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
              let _menhir_stack = MenhirCell1_PV (_menhir_stack, MenhirState293, _endpos_0) in
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState294
          | LEFTPAR ->
              let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
              let _menhir_stack = MenhirCell1_PV (_menhir_stack, MenhirState293, _endpos_0) in
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState294
          | LEFTBR ->
              let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
              let _menhir_stack = MenhirCell1_PV (_menhir_stack, MenhirState293, _endpos_0) in
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState294
          | INTEGER _v_3 ->
              let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
              let _menhir_stack = MenhirCell1_PV (_menhir_stack, MenhirState293, _endpos_0) in
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState294
          | IF ->
              let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
              let _menhir_stack = MenhirCell1_PV (_menhir_stack, MenhirState293, _endpos_0) in
              _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState294
          | ID _v_4 ->
              let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
              let _menhir_stack = MenhirCell1_PV (_menhir_stack, MenhirState293, _endpos_0) in
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState294
          | FORALL ->
              let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
              let _menhir_stack = MenhirCell1_PV (_menhir_stack, MenhirState293, _endpos_0) in
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState294
          | FALSE ->
              let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
              let _menhir_stack = MenhirCell1_PV (_menhir_stack, MenhirState293, _endpos_0) in
              _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState294
          | EXISTS ->
              let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
              let _menhir_stack = MenhirCell1_PV (_menhir_stack, MenhirState293, _endpos_0) in
              _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState294
          | DISTINCT ->
              let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
              let _menhir_stack = MenhirCell1_PV (_menhir_stack, MenhirState293, _endpos_0) in
              _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState294
          | CUT ->
              let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
              let _menhir_stack = MenhirCell1_PV (_menhir_stack, MenhirState293, _endpos_0) in
              _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState294
          | CHECK ->
              let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
              let _menhir_stack = MenhirCell1_PV (_menhir_stack, MenhirState293, _endpos_0) in
              _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState294
          | AXIOM | CHECK_SAT | EOF | FUNC | GOAL | LOGIC | PRED | REWRITING | THEORY | TYPE ->
              let (_endpos__2_, e) = (_endpos_0, _v) in
              let _v = _menhir_action_099 e in
              _menhir_goto_list1_lexpr_sep_pv _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__2_ _v _menhir_s _tok
          | _ ->
              _eRR ())
      | POWDOT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState293
      | POW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState293
      | PLUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState293
      | PERCENT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState293
      | OR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState293
      | NOTEQ ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState293
      | MINUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState293
      | LT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState293
      | LRARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState293
      | LE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState293
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState293
      | GE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState293
      | EQUAL ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState293
      | AT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState293
      | AND ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState293
      | AXIOM | CHECK_SAT | EOF | FUNC | GOAL | LOGIC | PRED | REWRITING | THEORY | TYPE ->
          let (_endpos_e_, e) = (_endpos, _v) in
          let _v = _menhir_action_098 e in
          _menhir_goto_list1_lexpr_sep_pv _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_list1_lexpr_sep_pv : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState294 ->
          _menhir_run_295 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState291 ->
          _menhir_run_292 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_295 : type  ttv_stack. ((ttv_stack, _menhir_box_file_parser) _menhir_cell1_lexpr, _menhir_box_file_parser) _menhir_cell1_PV -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_PV (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_lexpr (_menhir_stack, _menhir_s, e, _, _) = _menhir_stack in
      let (_endpos_e_l_, e_l) = (_endpos, _v) in
      let _v = _menhir_action_100 e e_l in
      _menhir_goto_list1_lexpr_sep_pv _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_l_ _v _menhir_s _tok
  
  and _menhir_run_292 : type  ttv_stack. ((ttv_stack, _menhir_box_file_parser) _menhir_cell1_REWRITING, _menhir_box_file_parser) _menhir_cell1_ident -> _ -> _ -> _ -> _ -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_ident (_menhir_stack, _, name, _, _) = _menhir_stack in
      let MenhirCell1_REWRITING (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_body_, body) = (_endpos, _v) in
      let _v = _menhir_action_031 _endpos_body_ _startpos__1_ body name in
      _menhir_goto_decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_284 : type  ttv_stack. (((ttv_stack, _menhir_box_file_parser) _menhir_cell1_AXIOM, _menhir_box_file_parser) _menhir_cell1_ident as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | XOR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState284
      | TIMES ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState284
      | SLASH ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState284
      | RIGHTARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState284
      | POWDOT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState284
      | POW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState284
      | PLUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState284
      | PERCENT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState284
      | OR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState284
      | NOTEQ ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState284
      | MINUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState284
      | LT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState284
      | LRARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState284
      | LE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState284
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState284
      | GE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState284
      | EQUAL ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState284
      | AT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState284
      | AND ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState284
      | AXIOM | CASESPLIT | END ->
          let MenhirCell1_ident (_menhir_stack, _, name, _, _) = _menhir_stack in
          let MenhirCell1_AXIOM (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_endpos_body_, body) = (_endpos, _v) in
          let _v = _menhir_action_159 _endpos_body_ _startpos__1_ body name in
          _menhir_goto_theory_elt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_theory_elt : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_theory_elt (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | CASESPLIT ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState287
      | AXIOM ->
          _menhir_run_281 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState287
      | END ->
          let _v_0 = _menhir_action_161 () in
          _menhir_run_288 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_062 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file_parser) _menhir_state -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_CASESPLIT (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState062 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_281 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file_parser) _menhir_state -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_AXIOM (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState281 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_288 : type  ttv_stack. (ttv_stack, _menhir_box_file_parser) _menhir_cell1_theory_elt -> _ -> _ -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_theory_elt (_menhir_stack, _menhir_s, th_elt) = _menhir_stack in
      let th_rest = _v in
      let _v = _menhir_action_162 th_elt th_rest in
      _menhir_goto_theory_elts _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_theory_elts : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file_parser) _menhir_state -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState287 ->
          _menhir_run_288 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState061 ->
          _menhir_run_285 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_285 : type  ttv_stack. (((ttv_stack, _menhir_box_file_parser) _menhir_cell1_THEORY, _menhir_box_file_parser) _menhir_cell1_ident, _menhir_box_file_parser) _menhir_cell1_ident -> _ -> _ -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_ident (_menhir_stack, _, th_ext, _, _) = _menhir_stack in
      let MenhirCell1_ident (_menhir_stack, _, th_id, _, _) = _menhir_stack in
      let MenhirCell1_THEORY (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos__7_, th_body) = (_endpos, _v) in
      let _v = _menhir_action_022 _endpos__7_ _startpos__1_ th_body th_ext th_id in
      _menhir_goto_decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_280 : type  ttv_stack. (((ttv_stack, _menhir_box_file_parser) _menhir_cell1_CASESPLIT, _menhir_box_file_parser) _menhir_cell1_ident as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | XOR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState280
      | TIMES ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState280
      | SLASH ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState280
      | RIGHTARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState280
      | POWDOT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState280
      | POW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState280
      | PLUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState280
      | PERCENT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState280
      | OR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState280
      | NOTEQ ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState280
      | MINUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState280
      | LT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState280
      | LRARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState280
      | LE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState280
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState280
      | GE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState280
      | EQUAL ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState280
      | AT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState280
      | AND ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState280
      | AXIOM | CASESPLIT | END ->
          let MenhirCell1_ident (_menhir_stack, _, name, _, _) = _menhir_stack in
          let MenhirCell1_CASESPLIT (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_endpos_body_, body) = (_endpos, _v) in
          let _v = _menhir_action_160 _endpos_body_ _startpos__1_ body name in
          _menhir_goto_theory_elt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_279 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_STRING -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_STRING (_menhir_stack, _menhir_s, name, _startpos_name_) = _menhir_stack in
      let (_endpos_e_, e) = (_endpos, _v) in
      let _v = _menhir_action_071 _endpos_e_ _startpos_name_ e name in
      _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos_name_ _v _menhir_s _tok
  
  and _menhir_run_278 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_NOT -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_NOT (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_se_, se) = (_endpos, _v) in
      let _v = _menhir_action_062 _endpos_se_ _startpos__1_ se in
      _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_se_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_277 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_MINUS -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_MINUS (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_se_, se) = (_endpos, _v) in
      let _v = _menhir_action_063 _endpos_se_ _startpos__1_ se in
      _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_se_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_276 : type  ttv_stack ttv_result. ((((((ttv_stack, ttv_result) _menhir_cell1_MATCH, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_WITH, ttv_result) _menhir_cell1_list1_match_cases, ttv_result) _menhir_cell1_simple_pattern as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | XOR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState276
      | TIMES ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState276
      | SLASH ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState276
      | RIGHTARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState276
      | POWDOT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState276
      | POW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState276
      | PLUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState276
      | PERCENT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState276
      | OR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState276
      | NOTEQ ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState276
      | MINUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState276
      | LT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState276
      | LRARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState276
      | LE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState276
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState276
      | GE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState276
      | EQUAL ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState276
      | AT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState276
      | AND ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState276
      | BAR | END ->
          let MenhirCell1_simple_pattern (_menhir_stack, _, p) = _menhir_stack in
          let MenhirCell1_list1_match_cases (_menhir_stack, _menhir_s, l) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_105 e l p in
          _menhir_goto_list1_match_cases _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_list1_match_cases : type  ttv_stack ttv_result. ((((ttv_stack, ttv_result) _menhir_cell1_MATCH, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_WITH as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | END ->
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_WITH (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_lexpr (_menhir_stack, _, e, _, _) = _menhir_stack in
          let MenhirCell1_MATCH (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_endpos__5_, cases) = (_endpos, _v) in
          let _v = _menhir_action_075 _endpos__5_ _startpos__1_ cases e in
          _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__5_ _startpos__1_ _v _menhir_s _tok
      | BAR ->
          let _menhir_stack = MenhirCell1_list1_match_cases (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState273 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_270 : type  ttv_stack ttv_result. (((((ttv_stack, ttv_result) _menhir_cell1_MATCH, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_WITH, ttv_result) _menhir_cell1_simple_pattern as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | XOR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState270
      | TIMES ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState270
      | SLASH ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState270
      | RIGHTARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState270
      | POWDOT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState270
      | POW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState270
      | PLUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState270
      | PERCENT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState270
      | OR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState270
      | NOTEQ ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState270
      | MINUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState270
      | LT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState270
      | LRARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState270
      | LE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState270
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState270
      | GE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState270
      | EQUAL ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState270
      | AT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState270
      | AND ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState270
      | BAR | END ->
          let MenhirCell1_simple_pattern (_menhir_stack, _menhir_s, p) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_103 e p in
          _menhir_goto_list1_match_cases _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_260 : type  ttv_stack ttv_result. ((((((ttv_stack, ttv_result) _menhir_cell1_MATCH, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_WITH, ttv_result) _menhir_cell1_BAR, ttv_result) _menhir_cell1_simple_pattern as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | XOR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState260
      | TIMES ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState260
      | SLASH ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState260
      | RIGHTARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState260
      | POWDOT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState260
      | POW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState260
      | PLUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState260
      | PERCENT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState260
      | OR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState260
      | NOTEQ ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState260
      | MINUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState260
      | LT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState260
      | LRARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState260
      | LE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState260
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState260
      | GE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState260
      | EQUAL ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState260
      | AT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState260
      | AND ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState260
      | BAR | END ->
          let MenhirCell1_simple_pattern (_menhir_stack, _, p) = _menhir_stack in
          let MenhirCell1_BAR (_menhir_stack, _menhir_s) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_104 e p in
          _menhir_goto_list1_match_cases _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_255 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_MATCH as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | XOR ->
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState255
      | WITH ->
          let _menhir_stack = MenhirCell1_WITH (_menhir_stack, MenhirState255) in
          let _menhir_s = MenhirState256 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BAR ->
              let _menhir_stack = MenhirCell1_BAR (_menhir_stack, _menhir_s) in
              let _menhir_s = MenhirState257 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | ID _v ->
                  _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | TIMES ->
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState255
      | SLASH ->
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState255
      | RIGHTARROW ->
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState255
      | POWDOT ->
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState255
      | POW ->
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState255
      | PLUS ->
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState255
      | PERCENT ->
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState255
      | OR ->
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState255
      | NOTEQ ->
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState255
      | MINUS ->
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState255
      | LT ->
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState255
      | LRARROW ->
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState255
      | LE ->
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState255
      | HAT ->
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState255
      | GE ->
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState255
      | EQUAL ->
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState255
      | AT ->
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState255
      | AND ->
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState255
      | _ ->
          _eRR ()
  
  and _menhir_run_252 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_ident as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | XOR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState252
      | TIMES ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState252
      | SLASH ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState252
      | RIGHTARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState252
      | POWDOT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState252
      | POW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState252
      | PLUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState252
      | PERCENT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState252
      | OR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState252
      | NOTEQ ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState252
      | MINUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState252
      | LT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState252
      | LRARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState252
      | LE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState252
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState252
      | GE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState252
      | EQUAL ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState252
      | COMMA ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          let _menhir_stack = MenhirCell1_COMMA (_menhir_stack, MenhirState252) in
          let _menhir_s = MenhirState253 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | AT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState252
      | AND ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState252
      | IN ->
          let MenhirCell1_ident (_menhir_stack, _menhir_s, binder, _, _) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_041 binder e in
          _menhir_goto_let_binders _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_let_binders : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState253 ->
          _menhir_run_254 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState073 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_254 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_ident, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_COMMA -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_COMMA (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_lexpr (_menhir_stack, _, e, _, _) = _menhir_stack in
      let MenhirCell1_ident (_menhir_stack, _menhir_s, binder, _, _) = _menhir_stack in
      let l = _v in
      let _v = _menhir_action_042 binder e l in
      _menhir_goto_let_binders _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_074 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LET as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_let_binders (_menhir_stack, _menhir_s, _v) in
      let _menhir_s = MenhirState075 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MATCH ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTSQ ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTBR ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTEGER _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FORALL ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISTINCT ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CUT ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CHECK ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_249 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_LET, ttv_result) _menhir_cell1_let_binders as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | XOR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState249
      | TIMES ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState249
      | SLASH ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState249
      | RIGHTARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState249
      | POWDOT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState249
      | POW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState249
      | PLUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState249
      | PERCENT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState249
      | OR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState249
      | NOTEQ ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState249
      | MINUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState249
      | LT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState249
      | LRARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState249
      | LE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState249
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState249
      | GE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState249
      | EQUAL ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState249
      | AT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState249
      | AND ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState249
      | AXIOM | BAR | CASESPLIT | CHECK_SAT | COMMA | ELSE | END | EOF | FUNC | GOAL | IN | LEFTARROW | LOGIC | PRED | PV | REWRITING | RIGHTBR | RIGHTPAR | RIGHTSQ | THEN | THEORY | TYPE | WITH ->
          let MenhirCell1_let_binders (_menhir_stack, _, binders) = _menhir_stack in
          let MenhirCell1_LET (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_endpos_e2_, e2) = (_endpos, _v) in
          let _v = _menhir_action_072 _endpos_e2_ _startpos__1_ binders e2 in
          _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e2_ _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_247 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LEFTPAR as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | XOR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState247
      | TIMES ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState247
      | SLASH ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState247
      | RIGHTPAR ->
          let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LEFTPAR (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_endpos__3_, e) = (_endpos_0, _v) in
          let _v = _menhir_action_150 e in
          _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
      | RIGHTARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState247
      | POWDOT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState247
      | POW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState247
      | PLUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState247
      | PERCENT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState247
      | OR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState247
      | NOTEQ ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState247
      | MINUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState247
      | LT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState247
      | LRARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState247
      | LE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState247
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState247
      | GE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState247
      | EQUAL ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState247
      | AT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState247
      | AND ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState247
      | _ ->
          _eRR ()
  
  and _menhir_run_241 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_ident as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | XOR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState241
      | TIMES ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState241
      | SLASH ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState241
      | RIGHTARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState241
      | PV ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          let _menhir_s = MenhirState241 in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _menhir_stack = MenhirCell1_PV (_menhir_stack, _menhir_s, _endpos) in
          let _menhir_s = MenhirState242 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | POWDOT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState241
      | POW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState241
      | PLUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState241
      | PERCENT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState241
      | OR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState241
      | NOTEQ ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState241
      | MINUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState241
      | LT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState241
      | LRARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState241
      | LE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState241
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState241
      | GE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState241
      | EQUAL ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState241
      | AT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState241
      | AND ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState241
      | RIGHTBR ->
          let MenhirCell1_ident (_menhir_stack, _menhir_s, id, _, _) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_090 e id in
          _menhir_goto_list1_label_expr_sep_PV _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_list1_label_expr_sep_PV : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState082 ->
          _menhir_run_244 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState242 ->
          _menhir_run_243 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState086 ->
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_244 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LEFTBR -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_LEFTBR (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos__3_, labels) = (_endpos, _v) in
      let _v = _menhir_action_144 _endpos__3_ _startpos__1_ labels in
      _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_243 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_ident, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_PV -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_PV (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_lexpr (_menhir_stack, _, e, _, _) = _menhir_stack in
      let MenhirCell1_ident (_menhir_stack, _menhir_s, id, _, _) = _menhir_stack in
      let l = _v in
      let _v = _menhir_action_091 e id l in
      _menhir_goto_list1_label_expr_sep_PV _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_087 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LEFTBR, ttv_result) _menhir_cell1_simple_expr -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_simple_expr (_menhir_stack, _, se, _, _) = _menhir_stack in
      let MenhirCell1_LEFTBR (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos__5_, labels) = (_endpos, _v) in
      let _v = _menhir_action_145 _endpos__5_ _startpos__1_ labels se in
      _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__5_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_240 : type  ttv_stack ttv_result. ((((((ttv_stack, ttv_result) _menhir_cell1_IF, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_THEN, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_ELSE as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState240
      | SLASH ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState240
      | POWDOT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState240
      | POW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState240
      | PLUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState240
      | PERCENT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState240
      | NOTEQ ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState240
      | MINUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState240
      | LT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState240
      | LE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState240
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState240
      | GE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState240
      | EQUAL ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState240
      | AT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState240
      | AND | AXIOM | BAR | CASESPLIT | CHECK_SAT | COMMA | ELSE | END | EOF | FUNC | GOAL | IN | LEFTARROW | LOGIC | LRARROW | OR | PRED | PV | REWRITING | RIGHTARROW | RIGHTBR | RIGHTPAR | RIGHTSQ | THEN | THEORY | TYPE | WITH | XOR ->
          let MenhirCell1_ELSE (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_lexpr (_menhir_stack, _, br1, _, _) = _menhir_stack in
          let MenhirCell1_THEN (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_lexpr (_menhir_stack, _, cond, _, _) = _menhir_stack in
          let MenhirCell1_IF (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_endpos_br2_, br2) = (_endpos, _v) in
          let _v = _menhir_action_068 _endpos_br2_ _startpos__1_ br1 br2 cond in
          _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_br2_ _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_238 : type  ttv_stack ttv_result. ((((ttv_stack, ttv_result) _menhir_cell1_IF, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_THEN as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | XOR ->
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState238
      | TIMES ->
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState238
      | SLASH ->
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState238
      | RIGHTARROW ->
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState238
      | POWDOT ->
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState238
      | POW ->
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState238
      | PLUS ->
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState238
      | PERCENT ->
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState238
      | OR ->
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState238
      | NOTEQ ->
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState238
      | MINUS ->
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState238
      | LT ->
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState238
      | LRARROW ->
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState238
      | LE ->
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState238
      | HAT ->
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState238
      | GE ->
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState238
      | EQUAL ->
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState238
      | ELSE ->
          let _menhir_stack = MenhirCell1_ELSE (_menhir_stack, MenhirState238) in
          let _menhir_s = MenhirState239 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VOID ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUM _v ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MATCH ->
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LET ->
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTSQ ->
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTPAR ->
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTBR ->
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTEGER _v ->
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FORALL ->
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXISTS ->
              _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DISTINCT ->
              _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CUT ->
              _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CHECK ->
              _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | AT ->
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState238
      | AND ->
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState238
      | _ ->
          _eRR ()
  
  and _menhir_run_236 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | XOR ->
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState236
      | TIMES ->
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState236
      | THEN ->
          let _menhir_stack = MenhirCell1_THEN (_menhir_stack, MenhirState236) in
          let _menhir_s = MenhirState237 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VOID ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUM _v ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MATCH ->
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LET ->
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTSQ ->
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTPAR ->
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTBR ->
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTEGER _v ->
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FORALL ->
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXISTS ->
              _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DISTINCT ->
              _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CUT ->
              _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CHECK ->
              _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | SLASH ->
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState236
      | RIGHTARROW ->
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState236
      | POWDOT ->
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState236
      | POW ->
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState236
      | PLUS ->
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState236
      | PERCENT ->
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState236
      | OR ->
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState236
      | NOTEQ ->
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState236
      | MINUS ->
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState236
      | LT ->
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState236
      | LRARROW ->
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState236
      | LE ->
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState236
      | HAT ->
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState236
      | GE ->
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState236
      | EQUAL ->
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState236
      | AT ->
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState236
      | AND ->
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState236
      | _ ->
          _eRR ()
  
  and _menhir_run_235 : type  ttv_stack ttv_result. (((((ttv_stack, ttv_result) _menhir_cell1_FORALL, ttv_result) _menhir_cell1_list1_multi_logic_binder, ttv_result) _menhir_cell1_triggers, ttv_result) _menhir_cell1_filters as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | XOR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState235
      | TIMES ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState235
      | SLASH ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState235
      | RIGHTARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState235
      | POWDOT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState235
      | POW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState235
      | PLUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState235
      | PERCENT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState235
      | OR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState235
      | NOTEQ ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState235
      | MINUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState235
      | LT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState235
      | LRARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState235
      | LE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState235
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState235
      | GE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState235
      | EQUAL ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState235
      | AT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState235
      | AND ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState235
      | AXIOM | BAR | CASESPLIT | CHECK_SAT | COMMA | ELSE | END | EOF | FUNC | GOAL | IN | LEFTARROW | LOGIC | PRED | PV | REWRITING | RIGHTBR | RIGHTPAR | RIGHTSQ | THEN | THEORY | TYPE | WITH ->
          let MenhirCell1_filters (_menhir_stack, _, filters) = _menhir_stack in
          let MenhirCell1_triggers (_menhir_stack, _, triggers) = _menhir_stack in
          let MenhirCell1_list1_multi_logic_binder (_menhir_stack, _, quant_vars) = _menhir_stack in
          let MenhirCell1_FORALL (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_endpos_body_, body) = (_endpos, _v) in
          let _v = _menhir_action_069 _endpos_body_ _startpos__1_ body filters quant_vars triggers in
          _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_body_ _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_229 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_ident as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | XOR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState229
      | TIMES ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState229
      | SLASH ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState229
      | RIGHTARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState229
      | POWDOT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState229
      | POW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState229
      | PLUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState229
      | PERCENT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState229
      | OR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState229
      | NOTEQ ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState229
      | MINUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState229
      | LT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState229
      | LRARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState229
      | LE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState229
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState229
      | GE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState229
      | EQUAL ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState229
      | AT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState229
      | AND ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState229
      | BAR | COMMA | EOF | RIGHTSQ ->
          let MenhirCell1_ident (_menhir_stack, _menhir_s, id, _startpos_id_, _) = _menhir_stack in
          let (_endpos_e_, e) = (_endpos, _v) in
          let _v = _menhir_action_078 _endpos_e_ _startpos_id_ e id in
          _menhir_goto_lexpr_or_dom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_lexpr_or_dom : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell1_lexpr_or_dom (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState208 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VOID ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUM _v ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MATCH ->
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LET ->
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTSQ ->
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTPAR ->
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTBR ->
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTEGER _v ->
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FORALL ->
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXISTS ->
              _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DISTINCT ->
              _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CUT ->
              _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CHECK ->
              _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | BAR | EOF | RIGHTSQ ->
          let ed = _v in
          let _v = _menhir_action_094 ed in
          _menhir_goto_list1_lexpr_or_dom_sep_comma _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_list1_lexpr_or_dom_sep_comma : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState208 ->
          _menhir_run_209 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState377 ->
          _menhir_run_206 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState105 ->
          _menhir_run_206 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState204 ->
          _menhir_run_206 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_209 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_lexpr_or_dom -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_lexpr_or_dom (_menhir_stack, _menhir_s, ed) = _menhir_stack in
      let edl = _v in
      let _v = _menhir_action_095 ed edl in
      _menhir_goto_list1_lexpr_or_dom_sep_comma _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_206 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let terms = _v in
      let _v = _menhir_action_163 terms in
      _menhir_goto_trigger _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_trigger : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState377 ->
          _menhir_run_379 _menhir_stack _v _tok
      | MenhirState204 ->
          _menhir_run_203 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState105 ->
          _menhir_run_203 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_203 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | BAR ->
          let _menhir_stack = MenhirCell1_trigger (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState204 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VOID ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUM _v ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MATCH ->
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LET ->
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTSQ ->
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTPAR ->
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTBR ->
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTEGER _v ->
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FORALL ->
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXISTS ->
              _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DISTINCT ->
              _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CUT ->
              _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CHECK ->
              _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | RIGHTSQ ->
          let trig = _v in
          let _v = _menhir_action_114 trig in
          _menhir_goto_list1_trigger_sep_bar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_list1_trigger_sep_bar : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState105 ->
          _menhir_run_230 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState204 ->
          _menhir_run_205 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_230 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_list1_multi_logic_binder, ttv_result) _menhir_cell1_LEFTSQ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_LEFTSQ (_menhir_stack, _menhir_s, _, _) = _menhir_stack in
      let trigs = _v in
      let _v = _menhir_action_166 trigs in
      _menhir_goto_triggers _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_triggers : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_list1_multi_logic_binder as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState104 ->
          _menhir_run_232 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState107 ->
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_205 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_trigger -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_trigger (_menhir_stack, _menhir_s, trig) = _menhir_stack in
      let trigs = _v in
      let _v = _menhir_action_115 trig trigs in
      _menhir_goto_list1_trigger_sep_bar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_210 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | XOR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState210
      | TIMES ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState210
      | SLASH ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState210
      | RIGHTARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState210
      | POWDOT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState210
      | POW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState210
      | PLUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState210
      | PERCENT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState210
      | OR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState210
      | NOTEQ ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState210
      | MINUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState210
      | LT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState210
      | LRARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState210
      | LE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState210
      | IN ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          let _menhir_stack = MenhirCell1_IN (_menhir_stack, MenhirState210) in
          let _menhir_s = MenhirState211 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | RIGHTSQ ->
              _menhir_run_212 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTSQ ->
              _menhir_run_213 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState210
      | GE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState210
      | EQUAL ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState210
      | AT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState210
      | AND ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState210
      | BAR | COMMA | EOF | RIGHTSQ ->
          let e = _v in
          let _v = _menhir_action_076 e in
          _menhir_goto_lexpr_or_dom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_212 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _endpos__1_ = _endpos in
      let _v = _menhir_action_158 () in
      _menhir_goto_sq _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _v _menhir_s _tok
  
  and _menhir_goto_sq : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState225 ->
          _menhir_run_226 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState211 ->
          _menhir_run_214 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_226 : type  ttv_stack ttv_result. (((((ttv_stack, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_IN, ttv_result) _menhir_cell1_sq, ttv_result) _menhir_cell1_bound, ttv_result) _menhir_cell1_bound -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_bound (_menhir_stack, _, rbnd) = _menhir_stack in
      let MenhirCell1_bound (_menhir_stack, _, lbnd) = _menhir_stack in
      let MenhirCell1_sq (_menhir_stack, _, lbr, _) = _menhir_stack in
      let MenhirCell1_IN (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_lexpr (_menhir_stack, _menhir_s, e, _startpos_e_, _) = _menhir_stack in
      let (_endpos_rbr_, rbr) = (_endpos, _v) in
      let _v = _menhir_action_077 _endpos_rbr_ _startpos_e_ e lbnd lbr rbnd rbr in
      _menhir_goto_lexpr_or_dom _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_214 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_IN as 'stack) -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_sq (_menhir_stack, _menhir_s, _v, _endpos) in
      match (_tok : MenhirBasics.token) with
      | QM_ID _v_0 ->
          _menhir_run_215 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState214
      | QM ->
          _menhir_run_216 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState214
      | NUM _v_1 ->
          _menhir_run_217 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState214
      | MINUS ->
          _menhir_run_218 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState214
      | INTEGER _v_2 ->
          _menhir_run_221 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState214
      | ID _v_3 ->
          _menhir_run_222 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState214
      | _ ->
          _eRR ()
  
  and _menhir_run_215 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos_id_, _startpos_id_, id) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_016 _endpos_id_ _startpos_id_ id in
      _menhir_goto_bound _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_bound : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState224 ->
          _menhir_run_225 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState214 ->
          _menhir_run_223 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_225 : type  ttv_stack ttv_result. (((((ttv_stack, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_IN, ttv_result) _menhir_cell1_sq, ttv_result) _menhir_cell1_bound as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_bound (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RIGHTSQ ->
          _menhir_run_212 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState225
      | LEFTSQ ->
          _menhir_run_213 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState225
      | _ ->
          _eRR ()
  
  and _menhir_run_213 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let _endpos__1_ = _endpos in
      let _v = _menhir_action_157 () in
      _menhir_goto_sq _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _v _menhir_s _tok
  
  and _menhir_run_223 : type  ttv_stack ttv_result. ((((ttv_stack, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_IN, ttv_result) _menhir_cell1_sq as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_bound (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_s = MenhirState224 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | QM_ID _v ->
              _menhir_run_215 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | QM ->
              _menhir_run_216 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NUM _v ->
              _menhir_run_217 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | MINUS ->
              _menhir_run_218 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTEGER _v ->
              _menhir_run_221 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ID _v ->
              _menhir_run_222 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_216 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
      let _v = _menhir_action_015 _endpos__1_ _startpos__1_ in
      _menhir_goto_bound _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_217 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos_i_, _startpos_i_, i) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_019 _endpos_i_ _startpos_i_ i in
      _menhir_goto_bound _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_218 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NUM _v ->
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_startpos__1_, _endpos_i_, i) = (_startpos, _endpos, _v) in
          let _v = _menhir_action_021 _endpos_i_ _startpos__1_ i in
          _menhir_goto_bound _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | INTEGER _v ->
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_startpos__1_, _endpos_i_, i) = (_startpos, _endpos, _v) in
          let _v = _menhir_action_020 _endpos_i_ _startpos__1_ i in
          _menhir_goto_bound _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_221 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos_i_, _startpos_i_, i) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_018 _endpos_i_ _startpos_i_ i in
      _menhir_goto_bound _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_222 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos_id_, _startpos_id_, id) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_017 _endpos_id_ _startpos_id_ id in
      _menhir_goto_bound _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_202 : type  ttv_stack ttv_result. (((((ttv_stack, ttv_result) _menhir_cell1_EXISTS, ttv_result) _menhir_cell1_list1_multi_logic_binder, ttv_result) _menhir_cell1_triggers, ttv_result) _menhir_cell1_filters as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | XOR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
      | TIMES ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
      | SLASH ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
      | RIGHTARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
      | POWDOT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
      | POW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
      | PLUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
      | PERCENT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
      | OR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
      | NOTEQ ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
      | MINUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
      | LT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
      | LRARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
      | LE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
      | GE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
      | EQUAL ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
      | AT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
      | AND ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
      | AXIOM | BAR | CASESPLIT | CHECK_SAT | COMMA | ELSE | END | EOF | FUNC | GOAL | IN | LEFTARROW | LOGIC | PRED | PV | REWRITING | RIGHTBR | RIGHTPAR | RIGHTSQ | THEN | THEORY | TYPE | WITH ->
          let MenhirCell1_filters (_menhir_stack, _, filters) = _menhir_stack in
          let MenhirCell1_triggers (_menhir_stack, _, triggers) = _menhir_stack in
          let MenhirCell1_list1_multi_logic_binder (_menhir_stack, _, quant_vars) = _menhir_stack in
          let MenhirCell1_EXISTS (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_endpos_body_, body) = (_endpos, _v) in
          let _v = _menhir_action_070 _endpos_body_ _startpos__1_ body filters quant_vars triggers in
          _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_body_ _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_195 : type  ttv_stack ttv_result. ((((ttv_stack, ttv_result) _menhir_cell1_list1_multi_logic_binder, ttv_result) _menhir_cell1_triggers, ttv_result) _menhir_cell1_LEFTBR as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | XOR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState195
      | TIMES ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState195
      | SLASH ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState195
      | RIGHTBR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LEFTBR (_menhir_stack, _menhir_s, _) = _menhir_stack in
          let filt = _v in
          let _v = _menhir_action_037 filt in
          _menhir_goto_filters _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | RIGHTARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState195
      | POWDOT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState195
      | POW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState195
      | PLUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState195
      | PERCENT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState195
      | OR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState195
      | NOTEQ ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState195
      | MINUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState195
      | LT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState195
      | LRARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState195
      | LE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState195
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState195
      | GE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState195
      | EQUAL ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState195
      | COMMA ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          let _menhir_stack = MenhirCell1_COMMA (_menhir_stack, MenhirState195) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VOID ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState197
          | TRUE ->
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState197
          | STRING _v_1 ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState197
          | NUM _v_2 ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState197
          | NOT ->
              _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState197
          | MINUS ->
              _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState197
          | MATCH ->
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState197
          | LET ->
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState197
          | LEFTSQ ->
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState197
          | LEFTPAR ->
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState197
          | LEFTBR ->
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState197
          | INTEGER _v_3 ->
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState197
          | IF ->
              _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState197
          | ID _v_4 ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState197
          | FORALL ->
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState197
          | FALSE ->
              _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState197
          | EXISTS ->
              _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState197
          | DISTINCT ->
              _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState197
          | CUT ->
              _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState197
          | CHECK ->
              _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState197
          | RIGHTBR ->
              let _v_5 = _menhir_action_080 () in
              _menhir_run_198 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 _tok
          | _ ->
              _eRR ())
      | AT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState195
      | AND ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState195
      | _ ->
          _eRR ()
  
  and _menhir_goto_filters : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_list1_multi_logic_binder, ttv_result) _menhir_cell1_triggers as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState232 ->
          _menhir_run_233 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState108 ->
          _menhir_run_200 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_198 : type  ttv_stack ttv_result. (((((ttv_stack, ttv_result) _menhir_cell1_list1_multi_logic_binder, ttv_result) _menhir_cell1_triggers, ttv_result) _menhir_cell1_LEFTBR, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_COMMA -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RIGHTBR ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_COMMA (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_lexpr (_menhir_stack, _, filt, _, _) = _menhir_stack in
          let MenhirCell1_LEFTBR (_menhir_stack, _menhir_s, _) = _menhir_stack in
          let filt_l = _v in
          let _v = _menhir_action_038 filt filt_l in
          _menhir_goto_filters _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_194 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_COMMA as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | XOR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState194
      | TIMES ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState194
      | SLASH ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState194
      | RIGHTARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState194
      | POWDOT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState194
      | POW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState194
      | PLUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState194
      | PERCENT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState194
      | OR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState194
      | NOTEQ ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState194
      | MINUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState194
      | LT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState194
      | LRARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState194
      | LE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState194
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState194
      | GE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState194
      | EQUAL ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState194
      | COMMA ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_192 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState194
      | AT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState194
      | AND ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState194
      | RIGHTPAR ->
          let MenhirCell1_COMMA (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_lexpr (_menhir_stack, _menhir_s, e1, _, _) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_118 e1 e2 in
          _menhir_goto_list2_lexpr_sep_comma _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_192 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_COMMA (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState192 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MATCH ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTSQ ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTBR ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTEGER _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FORALL ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISTINCT ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CUT ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CHECK ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_list2_lexpr_sep_comma : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState192 ->
          _menhir_run_193 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState111 ->
          _menhir_run_189 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_193 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_COMMA -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_COMMA (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_lexpr (_menhir_stack, _menhir_s, e, _, _) = _menhir_stack in
      let el = _v in
      let _v = _menhir_action_119 e el in
      _menhir_goto_list2_lexpr_sep_comma _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_189 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_DISTINCT _menhir_cell0_LEFTPAR -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell0_LEFTPAR (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_DISTINCT (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos__4_, dist_l) = (_endpos, _v) in
      let _v = _menhir_action_067 _endpos__4_ _startpos__1_ dist_l in
      _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__4_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_191 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_DISTINCT _menhir_cell0_LEFTPAR as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | XOR ->
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState191
      | TIMES ->
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState191
      | SLASH ->
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState191
      | RIGHTARROW ->
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState191
      | POWDOT ->
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState191
      | POW ->
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState191
      | PLUS ->
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState191
      | PERCENT ->
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState191
      | OR ->
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState191
      | NOTEQ ->
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState191
      | MINUS ->
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState191
      | LT ->
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState191
      | LRARROW ->
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState191
      | LE ->
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState191
      | HAT ->
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState191
      | GE ->
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState191
      | EQUAL ->
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState191
      | COMMA ->
          _menhir_run_192 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState191
      | AT ->
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState191
      | AND ->
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState191
      | _ ->
          _eRR ()
  
  and _menhir_run_188 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_CUT -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_CUT (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_e_, e) = (_endpos, _v) in
      let _v = _menhir_action_074 _endpos_e_ _startpos__1_ e in
      _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_187 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_CHECK -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_CHECK (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_e_, e) = (_endpos, _v) in
      let _v = _menhir_action_073 _endpos_e_ _startpos__1_ e in
      _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_181 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_array_assignement as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | XOR ->
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState181
      | TIMES ->
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState181
      | SLASH ->
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState181
      | RIGHTARROW ->
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState181
      | POWDOT ->
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState181
      | POW ->
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState181
      | PLUS ->
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState181
      | PERCENT ->
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState181
      | OR ->
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState181
      | NOTEQ ->
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState181
      | MINUS ->
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState181
      | LT ->
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState181
      | LRARROW ->
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState181
      | LEFTARROW ->
          _menhir_run_175 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState181
      | LE ->
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState181
      | HAT ->
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState181
      | GE ->
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState181
      | EQUAL ->
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState181
      | AT ->
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState181
      | AND ->
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState181
      | _ ->
          _eRR ()
  
  and _menhir_run_175 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_lexpr as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LEFTARROW (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState175 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MATCH ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTSQ ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTBR ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTEGER _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FORALL ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISTINCT ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CUT ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CHECK ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_176 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_LEFTARROW as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | XOR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState176
      | TIMES ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState176
      | SLASH ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState176
      | RIGHTARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState176
      | POWDOT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState176
      | POW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState176
      | PLUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState176
      | PERCENT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState176
      | OR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState176
      | NOTEQ ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState176
      | MINUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState176
      | LT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState176
      | LRARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState176
      | LE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState176
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState176
      | GE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState176
      | EQUAL ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState176
      | AT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState176
      | AND ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState176
      | COMMA | RIGHTSQ ->
          let MenhirCell1_LEFTARROW (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_lexpr (_menhir_stack, _menhir_s, e1, _, _) = _menhir_stack in
          let e2 = _v in
          let _v = _menhir_action_012 e1 e2 in
          (match (_tok : MenhirBasics.token) with
          | COMMA ->
              let _menhir_stack = MenhirCell1_array_assignement (_menhir_stack, _menhir_s, _v) in
              let _menhir_s = MenhirState180 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | VOID ->
                  _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | TRUE ->
                  _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | STRING _v ->
                  _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | NUM _v ->
                  _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | NOT ->
                  _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | MINUS ->
                  _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | MATCH ->
                  _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LET ->
                  _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LEFTSQ ->
                  _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LEFTPAR ->
                  _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LEFTBR ->
                  _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | INTEGER _v ->
                  _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | IF ->
                  _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | ID _v ->
                  _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | FORALL ->
                  _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | FALSE ->
                  _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | EXISTS ->
                  _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | DISTINCT ->
                  _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | CUT ->
                  _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | CHECK ->
                  _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | _ ->
                  _eRR ())
          | RIGHTSQ ->
              let assign = _v in
              let _v = _menhir_action_013 assign in
              _menhir_goto_array_assignements _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _menhir_fail ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_array_assignements : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState180 ->
          _menhir_run_182 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState120 ->
          _menhir_run_177 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_182 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_array_assignement -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_array_assignement (_menhir_stack, _menhir_s, assign) = _menhir_stack in
      let assign_l = _v in
      let _v = _menhir_action_014 assign assign_l in
      _menhir_goto_array_assignements _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_177 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_simple_expr _menhir_cell0_LEFTSQ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell0_LEFTSQ (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_simple_expr (_menhir_stack, _menhir_s, se, _startpos_se_, _) = _menhir_stack in
      let (_endpos__4_, assigns) = (_endpos, _v) in
      let _v = _menhir_action_149 _endpos__4_ _startpos_se_ assigns se in
      _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__4_ _startpos_se_ _v _menhir_s _tok
  
  and _menhir_run_171 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_LRARROW as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | XOR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState171
      | TIMES ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState171
      | SLASH ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState171
      | RIGHTARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState171
      | POWDOT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState171
      | POW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState171
      | PLUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState171
      | PERCENT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState171
      | OR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState171
      | NOTEQ ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState171
      | MINUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState171
      | LT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState171
      | LRARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState171
      | LE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState171
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState171
      | GE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState171
      | EQUAL ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState171
      | AT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState171
      | AND ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState171
      | AXIOM | BAR | CASESPLIT | CHECK_SAT | COMMA | ELSE | END | EOF | FUNC | GOAL | IN | LEFTARROW | LOGIC | PRED | PV | REWRITING | RIGHTBR | RIGHTPAR | RIGHTSQ | THEN | THEORY | TYPE | WITH ->
          let MenhirCell1_LRARROW (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_lexpr (_menhir_stack, _menhir_s, se1, _startpos_se1_, _) = _menhir_stack in
          let (_endpos_se2_, se2) = (_endpos, _v) in
          let _v = _menhir_action_054 _endpos_se2_ _startpos_se1_ se1 se2 in
          _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_se2_ _startpos_se1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_169 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_AND as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState169
      | SLASH ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState169
      | POWDOT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState169
      | POW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState169
      | PLUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState169
      | PERCENT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState169
      | NOTEQ ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState169
      | MINUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState169
      | LT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState169
      | LE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState169
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState169
      | GE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState169
      | EQUAL ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState169
      | AT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState169
      | AND ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState169
      | AXIOM | BAR | CASESPLIT | CHECK_SAT | COMMA | ELSE | END | EOF | FUNC | GOAL | IN | LEFTARROW | LOGIC | LRARROW | OR | PRED | PV | REWRITING | RIGHTARROW | RIGHTBR | RIGHTPAR | RIGHTSQ | THEN | THEORY | TYPE | WITH | XOR ->
          let MenhirCell1_AND (_menhir_stack, _, _) = _menhir_stack in
          let MenhirCell1_lexpr (_menhir_stack, _menhir_s, se1, _startpos_se1_, _) = _menhir_stack in
          let (_endpos_se2_, se2) = (_endpos, _v) in
          let _v = _menhir_action_051 _endpos_se2_ _startpos_se1_ se1 se2 in
          _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_se2_ _startpos_se1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_167 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_EQUAL as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState167
      | SLASH ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState167
      | POWDOT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState167
      | POW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState167
      | PLUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState167
      | PERCENT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState167
      | MINUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState167
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState167
      | AND | AXIOM | BAR | CASESPLIT | CHECK_SAT | COMMA | ELSE | END | EOF | EQUAL | FUNC | GE | GOAL | GT | IN | LE | LEFTARROW | LOGIC | LRARROW | LT | NOTEQ | OR | PRED | PV | REWRITING | RIGHTARROW | RIGHTBR | RIGHTPAR | RIGHTSQ | THEN | THEORY | TYPE | WITH | XOR ->
          let MenhirCell1_EQUAL (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_lexpr (_menhir_stack, _menhir_s, se1, _startpos_se1_, _) = _menhir_stack in
          let (_endpos_se2_, se2) = (_endpos, _v) in
          let _v = _menhir_action_060 _endpos_se2_ _startpos_se1_ se1 se2 in
          _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_se2_ _startpos_se1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_165 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_GE as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState165
      | SLASH ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState165
      | POWDOT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState165
      | POW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState165
      | PLUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState165
      | PERCENT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState165
      | MINUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState165
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState165
      | AND | AXIOM | BAR | CASESPLIT | CHECK_SAT | COMMA | ELSE | END | EOF | EQUAL | FUNC | GE | GOAL | GT | IN | LE | LEFTARROW | LOGIC | LRARROW | LT | NOTEQ | OR | PRED | PV | REWRITING | RIGHTARROW | RIGHTBR | RIGHTPAR | RIGHTSQ | THEN | THEORY | TYPE | WITH | XOR ->
          let MenhirCell1_GE (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_lexpr (_menhir_stack, _menhir_s, se1, _startpos_se1_, _) = _menhir_stack in
          let (_endpos_se2_, se2) = (_endpos, _v) in
          let _v = _menhir_action_059 _endpos_se2_ _startpos_se1_ se1 se2 in
          _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_se2_ _startpos_se1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_163 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_GT as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState163
      | SLASH ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState163
      | POWDOT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState163
      | POW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState163
      | PLUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState163
      | PERCENT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState163
      | MINUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState163
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState163
      | AND | AXIOM | BAR | CASESPLIT | CHECK_SAT | COMMA | ELSE | END | EOF | EQUAL | FUNC | GE | GOAL | GT | IN | LE | LEFTARROW | LOGIC | LRARROW | LT | NOTEQ | OR | PRED | PV | REWRITING | RIGHTARROW | RIGHTBR | RIGHTPAR | RIGHTSQ | THEN | THEORY | TYPE | WITH | XOR ->
          let MenhirCell1_GT (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_lexpr (_menhir_stack, _menhir_s, se1, _startpos_se1_, _) = _menhir_stack in
          let (_endpos_se2_, se2) = (_endpos, _v) in
          let _v = _menhir_action_058 _endpos_se2_ _startpos_se1_ se1 se2 in
          _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_se2_ _startpos_se1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_161 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_LE as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState161
      | SLASH ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState161
      | POWDOT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState161
      | POW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState161
      | PLUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState161
      | PERCENT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState161
      | MINUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState161
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState161
      | AND | AXIOM | BAR | CASESPLIT | CHECK_SAT | COMMA | ELSE | END | EOF | EQUAL | FUNC | GE | GOAL | GT | IN | LE | LEFTARROW | LOGIC | LRARROW | LT | NOTEQ | OR | PRED | PV | REWRITING | RIGHTARROW | RIGHTBR | RIGHTPAR | RIGHTSQ | THEN | THEORY | TYPE | WITH | XOR ->
          let MenhirCell1_LE (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_lexpr (_menhir_stack, _menhir_s, se1, _startpos_se1_, _) = _menhir_stack in
          let (_endpos_se2_, se2) = (_endpos, _v) in
          let _v = _menhir_action_057 _endpos_se2_ _startpos_se1_ se1 se2 in
          _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_se2_ _startpos_se1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_159 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_LT as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState159
      | SLASH ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState159
      | POWDOT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState159
      | POW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState159
      | PLUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState159
      | PERCENT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState159
      | MINUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState159
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState159
      | AND | AXIOM | BAR | CASESPLIT | CHECK_SAT | COMMA | ELSE | END | EOF | EQUAL | FUNC | GE | GOAL | GT | IN | LE | LEFTARROW | LOGIC | LRARROW | LT | NOTEQ | OR | PRED | PV | REWRITING | RIGHTARROW | RIGHTBR | RIGHTPAR | RIGHTSQ | THEN | THEORY | TYPE | WITH | XOR ->
          let MenhirCell1_LT (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_lexpr (_menhir_stack, _menhir_s, se1, _startpos_se1_, _) = _menhir_stack in
          let (_endpos_se2_, se2) = (_endpos, _v) in
          let _v = _menhir_action_056 _endpos_se2_ _startpos_se1_ se1 se2 in
          _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_se2_ _startpos_se1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_157 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_MINUS as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState157
      | SLASH ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState157
      | POWDOT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState157
      | POW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState157
      | PERCENT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState157
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState157
      | AND | AXIOM | BAR | CASESPLIT | CHECK_SAT | COMMA | ELSE | END | EOF | EQUAL | FUNC | GE | GOAL | GT | IN | LE | LEFTARROW | LOGIC | LRARROW | LT | MINUS | NOTEQ | OR | PLUS | PRED | PV | REWRITING | RIGHTARROW | RIGHTBR | RIGHTPAR | RIGHTSQ | THEN | THEORY | TYPE | WITH | XOR ->
          let MenhirCell1_MINUS (_menhir_stack, _, _) = _menhir_stack in
          let MenhirCell1_lexpr (_menhir_stack, _menhir_s, se1, _startpos_se1_, _) = _menhir_stack in
          let (_endpos_se2_, se2) = (_endpos, _v) in
          let _v = _menhir_action_045 _endpos_se2_ _startpos_se1_ se1 se2 in
          _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_se2_ _startpos_se1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_155 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_NOTEQ as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState155
      | SLASH ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState155
      | POWDOT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState155
      | POW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState155
      | PLUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState155
      | PERCENT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState155
      | MINUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState155
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState155
      | AND | AXIOM | BAR | CASESPLIT | CHECK_SAT | COMMA | ELSE | END | EOF | EQUAL | FUNC | GE | GOAL | GT | IN | LE | LEFTARROW | LOGIC | LRARROW | LT | NOTEQ | OR | PRED | PV | REWRITING | RIGHTARROW | RIGHTBR | RIGHTPAR | RIGHTSQ | THEN | THEORY | TYPE | WITH | XOR ->
          let MenhirCell1_NOTEQ (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_lexpr (_menhir_stack, _menhir_s, se1, _startpos_se1_, _) = _menhir_stack in
          let (_endpos_se2_, se2) = (_endpos, _v) in
          let _v = _menhir_action_061 _endpos_se2_ _startpos_se1_ se1 se2 in
          _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_se2_ _startpos_se1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_153 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_OR as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
      | SLASH ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
      | POWDOT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
      | POW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
      | PLUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
      | PERCENT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
      | OR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
      | NOTEQ ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
      | MINUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
      | LT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
      | LE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
      | GE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
      | EQUAL ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
      | AT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
      | AND ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState153
      | AXIOM | BAR | CASESPLIT | CHECK_SAT | COMMA | ELSE | END | EOF | FUNC | GOAL | IN | LEFTARROW | LOGIC | LRARROW | PRED | PV | REWRITING | RIGHTARROW | RIGHTBR | RIGHTPAR | RIGHTSQ | THEN | THEORY | TYPE | WITH | XOR ->
          let MenhirCell1_OR (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_lexpr (_menhir_stack, _menhir_s, se1, _startpos_se1_, _) = _menhir_stack in
          let (_endpos_se2_, se2) = (_endpos, _v) in
          let _v = _menhir_action_052 _endpos_se2_ _startpos_se1_ se1 se2 in
          _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_se2_ _startpos_se1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_151 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_AT as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | AT | AXIOM | BAR | CASESPLIT | CHECK_SAT | COMMA | ELSE | END | EOF | EQUAL | FUNC | GE | GOAL | GT | IN | LE | LEFTARROW | LOGIC | LRARROW | LT | MINUS | NOTEQ | OR | PERCENT | PLUS | POW | POWDOT | PRED | PV | REWRITING | RIGHTARROW | RIGHTBR | RIGHTPAR | RIGHTSQ | SLASH | THEN | THEORY | TIMES | TYPE | WITH | XOR ->
          let MenhirCell1_AT (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_lexpr (_menhir_stack, _menhir_s, e1, _startpos_e1_, _) = _menhir_stack in
          let (_endpos_e2_, e2) = (_endpos, _v) in
          let _v = _menhir_action_066 _endpos_e2_ _startpos_e1_ e1 e2 in
          _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_e2_ _startpos_e1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_149 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_PERCENT as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | AT | AXIOM | BAR | CASESPLIT | CHECK_SAT | COMMA | ELSE | END | EOF | EQUAL | FUNC | GE | GOAL | GT | IN | LE | LEFTARROW | LOGIC | LRARROW | LT | MINUS | NOTEQ | OR | PERCENT | PLUS | POW | POWDOT | PRED | PV | REWRITING | RIGHTARROW | RIGHTBR | RIGHTPAR | RIGHTSQ | SLASH | THEN | THEORY | TIMES | TYPE | WITH | XOR ->
          let MenhirCell1_PERCENT (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_lexpr (_menhir_stack, _menhir_s, se1, _startpos_se1_, _) = _menhir_stack in
          let (_endpos_se2_, se2) = (_endpos, _v) in
          let _v = _menhir_action_048 _endpos_se2_ _startpos_se1_ se1 se2 in
          _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_se2_ _startpos_se1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_147 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_PLUS as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState147
      | SLASH ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState147
      | POWDOT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState147
      | POW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState147
      | PERCENT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState147
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState147
      | AND | AXIOM | BAR | CASESPLIT | CHECK_SAT | COMMA | ELSE | END | EOF | EQUAL | FUNC | GE | GOAL | GT | IN | LE | LEFTARROW | LOGIC | LRARROW | LT | MINUS | NOTEQ | OR | PLUS | PRED | PV | REWRITING | RIGHTARROW | RIGHTBR | RIGHTPAR | RIGHTSQ | THEN | THEORY | TYPE | WITH | XOR ->
          let MenhirCell1_PLUS (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_lexpr (_menhir_stack, _menhir_s, se1, _startpos_se1_, _) = _menhir_stack in
          let (_endpos_se2_, se2) = (_endpos, _v) in
          let _v = _menhir_action_044 _endpos_se2_ _startpos_se1_ se1 se2 in
          _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_se2_ _startpos_se1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_145 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_POW as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | AT | AXIOM | BAR | CASESPLIT | CHECK_SAT | COMMA | ELSE | END | EOF | EQUAL | FUNC | GE | GOAL | GT | IN | LE | LEFTARROW | LOGIC | LRARROW | LT | MINUS | NOTEQ | OR | PERCENT | PLUS | POW | POWDOT | PRED | PV | REWRITING | RIGHTARROW | RIGHTBR | RIGHTPAR | RIGHTSQ | SLASH | THEN | THEORY | TIMES | TYPE | WITH | XOR ->
          let MenhirCell1_POW (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_lexpr (_menhir_stack, _menhir_s, se1, _startpos_se1_, _) = _menhir_stack in
          let (_endpos_se2_, se2) = (_endpos, _v) in
          let _v = _menhir_action_049 _endpos_se2_ _startpos_se1_ se1 se2 in
          _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_se2_ _startpos_se1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_143 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_POWDOT as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | AT | AXIOM | BAR | CASESPLIT | CHECK_SAT | COMMA | ELSE | END | EOF | EQUAL | FUNC | GE | GOAL | GT | IN | LE | LEFTARROW | LOGIC | LRARROW | LT | MINUS | NOTEQ | OR | PERCENT | PLUS | POW | POWDOT | PRED | PV | REWRITING | RIGHTARROW | RIGHTBR | RIGHTPAR | RIGHTSQ | SLASH | THEN | THEORY | TIMES | TYPE | WITH | XOR ->
          let MenhirCell1_POWDOT (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_lexpr (_menhir_stack, _menhir_s, se1, _startpos_se1_, _) = _menhir_stack in
          let (_endpos_se2_, se2) = (_endpos, _v) in
          let _v = _menhir_action_050 _endpos_se2_ _startpos_se1_ se1 se2 in
          _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_se2_ _startpos_se1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_141 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_RIGHTARROW as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | XOR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState141
      | TIMES ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState141
      | SLASH ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState141
      | RIGHTARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState141
      | POWDOT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState141
      | POW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState141
      | PLUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState141
      | PERCENT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState141
      | OR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState141
      | NOTEQ ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState141
      | MINUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState141
      | LT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState141
      | LRARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState141
      | LE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState141
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState141
      | GE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState141
      | EQUAL ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState141
      | AT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState141
      | AND ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState141
      | AXIOM | BAR | CASESPLIT | CHECK_SAT | COMMA | ELSE | END | EOF | FUNC | GOAL | IN | LEFTARROW | LOGIC | PRED | PV | REWRITING | RIGHTBR | RIGHTPAR | RIGHTSQ | THEN | THEORY | TYPE | WITH ->
          let MenhirCell1_RIGHTARROW (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_lexpr (_menhir_stack, _menhir_s, se1, _startpos_se1_, _) = _menhir_stack in
          let (_endpos_se2_, se2) = (_endpos, _v) in
          let _v = _menhir_action_055 _endpos_se2_ _startpos_se1_ se1 se2 in
          _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_se2_ _startpos_se1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_139 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_SLASH as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | AT | AXIOM | BAR | CASESPLIT | CHECK_SAT | COMMA | ELSE | END | EOF | EQUAL | FUNC | GE | GOAL | GT | IN | LE | LEFTARROW | LOGIC | LRARROW | LT | MINUS | NOTEQ | OR | PERCENT | PLUS | POW | POWDOT | PRED | PV | REWRITING | RIGHTARROW | RIGHTBR | RIGHTPAR | RIGHTSQ | SLASH | THEN | THEORY | TIMES | TYPE | WITH | XOR ->
          let MenhirCell1_SLASH (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_lexpr (_menhir_stack, _menhir_s, se1, _startpos_se1_, _) = _menhir_stack in
          let (_endpos_se2_, se2) = (_endpos, _v) in
          let _v = _menhir_action_047 _endpos_se2_ _startpos_se1_ se1 se2 in
          _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_se2_ _startpos_se1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_137 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | XOR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState137
      | TIMES ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState137
      | SLASH ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState137
      | RIGHTARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState137
      | POWDOT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState137
      | POW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState137
      | PLUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState137
      | PERCENT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState137
      | OR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState137
      | NOTEQ ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState137
      | MINUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState137
      | LT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState137
      | LRARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState137
      | LE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState137
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState137
      | GE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState137
      | EQUAL ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState137
      | COMMA ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          let _menhir_stack = MenhirCell1_COMMA (_menhir_stack, MenhirState137) in
          let _menhir_s = MenhirState172 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VOID ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUM _v ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MATCH ->
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LET ->
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTSQ ->
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTPAR ->
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTBR ->
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTEGER _v ->
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FORALL ->
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXISTS ->
              _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DISTINCT ->
              _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CUT ->
              _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CHECK ->
              _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | AT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState137
      | AND ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState137
      | RIGHTBR | RIGHTPAR ->
          let e = _v in
          let _v = _menhir_action_096 e in
          _menhir_goto_list1_lexpr_sep_comma _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_list1_lexpr_sep_comma : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState172 ->
          _menhir_run_173 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState197 ->
          _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState133 ->
          _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_173 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_COMMA -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_COMMA (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_lexpr (_menhir_stack, _menhir_s, e, _, _) = _menhir_stack in
      let l = _v in
      let _v = _menhir_action_097 e l in
      _menhir_goto_list1_lexpr_sep_comma _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_134 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let l = _v in
      let _v = _menhir_action_081 l in
      _menhir_goto_list0_lexpr_sep_comma _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_list0_lexpr_sep_comma : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState197 ->
          _menhir_run_198 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState133 ->
          _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_135 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_ident _menhir_cell0_LEFTPAR -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RIGHTPAR ->
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_LEFTPAR (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_ident (_menhir_stack, _menhir_s, app, _startpos_app_, _) = _menhir_stack in
          let (_endpos__4_, args) = (_endpos, _v) in
          let _v = _menhir_action_147 _endpos__4_ _startpos_app_ app args in
          _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__4_ _startpos_app_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_125 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_TIMES as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | AT | AXIOM | BAR | CASESPLIT | CHECK_SAT | COMMA | ELSE | END | EOF | EQUAL | FUNC | GE | GOAL | GT | IN | LE | LEFTARROW | LOGIC | LRARROW | LT | MINUS | NOTEQ | OR | PERCENT | PLUS | POW | POWDOT | PRED | PV | REWRITING | RIGHTARROW | RIGHTBR | RIGHTPAR | RIGHTSQ | SLASH | THEN | THEORY | TIMES | TYPE | WITH | XOR ->
          let MenhirCell1_TIMES (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_lexpr (_menhir_stack, _menhir_s, se1, _startpos_se1_, _) = _menhir_stack in
          let (_endpos_se2_, se2) = (_endpos, _v) in
          let _v = _menhir_action_046 _endpos_se2_ _startpos_se1_ se1 se2 in
          _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_se2_ _startpos_se1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_123 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_XOR as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | XOR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState123
      | TIMES ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState123
      | SLASH ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState123
      | RIGHTARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState123
      | POWDOT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState123
      | POW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState123
      | PLUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState123
      | PERCENT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState123
      | OR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState123
      | NOTEQ ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState123
      | MINUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState123
      | LT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState123
      | LRARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState123
      | LE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState123
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState123
      | GE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState123
      | EQUAL ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState123
      | AT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState123
      | AND ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState123
      | AXIOM | BAR | CASESPLIT | CHECK_SAT | COMMA | ELSE | END | EOF | FUNC | GOAL | IN | LEFTARROW | LOGIC | PRED | PV | REWRITING | RIGHTBR | RIGHTPAR | RIGHTSQ | THEN | THEORY | TYPE | WITH ->
          let MenhirCell1_XOR (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_lexpr (_menhir_stack, _menhir_s, se1, _startpos_se1_, _) = _menhir_stack in
          let (_endpos_se2_, se2) = (_endpos, _v) in
          let _v = _menhir_action_053 _endpos_se2_ _startpos_se1_ se1 se2 in
          _menhir_goto_lexpr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_se2_ _startpos_se1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_121 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_simple_expr _menhir_cell0_LEFTSQ as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | XOR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | TIMES ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | SLASH ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | RIGHTSQ ->
          let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_LEFTSQ (_menhir_stack, _, _) = _menhir_stack in
          let MenhirCell1_simple_expr (_menhir_stack, _menhir_s, se, _startpos_se_, _) = _menhir_stack in
          let (e, _endpos__4_) = (_v, _endpos_0) in
          let _v = _menhir_action_148 _endpos__4_ _startpos_se_ e se in
          _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__4_ _startpos_se_ _v _menhir_s _tok
      | RIGHTARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | POWDOT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | POW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | PLUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | PERCENT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | OR ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_152 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | NOTEQ ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_154 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | MINUS ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | LT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | LRARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | LEFTARROW ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_175 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | LE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | HAT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | GE ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | EQUAL ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | AT ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | AND ->
          let _menhir_stack = MenhirCell1_lexpr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState121
      | _ ->
          _eRR ()
  
  and _menhir_run_183 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_simple_expr -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState183 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_185 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_simple_expr -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState185 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UNIT ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | REAL ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | QUOTE ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT ->
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | BITV ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_085 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LEFTBR as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_simple_expr (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | WITH ->
          let _menhir_s = MenhirState086 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | SHARP ->
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer
      | QM_ID _v_1 ->
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1
      | QM ->
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LEFTSQ ->
          _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DOT ->
          _menhir_run_183 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COLON ->
          _menhir_run_185 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_361 : type  ttv_stack. ((ttv_stack, _menhir_box_file_parser) _menhir_cell1_CHECK_SAT as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _menhir_s = MenhirState362 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VOID ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUM _v ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MATCH ->
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LET ->
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTSQ ->
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTPAR ->
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTBR ->
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTEGER _v ->
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FORALL ->
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXISTS ->
              _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DISTINCT ->
              _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CUT ->
              _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CHECK ->
              _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_346 : type  ttv_stack. ((ttv_stack, _menhir_box_file_parser) _menhir_cell1_GOAL as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _menhir_s = MenhirState347 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VOID ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUM _v ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MATCH ->
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LET ->
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTSQ ->
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTPAR ->
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTBR ->
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTEGER _v ->
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FORALL ->
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXISTS ->
              _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DISTINCT ->
              _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CUT ->
              _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CHECK ->
              _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_302 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _menhir_s = MenhirState303 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UNIT ->
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | REAL ->
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | QUOTE ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTPAR ->
              _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT ->
              _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BOOL ->
              _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BITV ->
              _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_290 : type  ttv_stack. ((ttv_stack, _menhir_box_file_parser) _menhir_cell1_REWRITING as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _menhir_s = MenhirState291 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VOID ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUM _v ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MATCH ->
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LET ->
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTSQ ->
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTPAR ->
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTBR ->
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTEGER _v ->
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FORALL ->
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXISTS ->
              _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DISTINCT ->
              _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CUT ->
              _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CHECK ->
              _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_282 : type  ttv_stack. ((ttv_stack, _menhir_box_file_parser) _menhir_cell1_AXIOM as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _menhir_s = MenhirState283 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VOID ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUM _v ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MATCH ->
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LET ->
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTSQ ->
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTPAR ->
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTBR ->
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTEGER _v ->
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FORALL ->
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXISTS ->
              _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DISTINCT ->
              _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CUT ->
              _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CHECK ->
              _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_265 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell1_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          let _menhir_s = MenhirState266 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | RIGHTPAR ->
          let id = _v in
          let _v = _menhir_action_112 id in
          _menhir_goto_list1_string_sep_comma _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_list1_string_sep_comma : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState266 ->
          _menhir_run_267 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState262 ->
          _menhir_run_263 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_267 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_ident -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_ident (_menhir_stack, _menhir_s, id, _, _) = _menhir_stack in
      let l = _v in
      let _v = _menhir_action_113 id l in
      _menhir_goto_list1_string_sep_comma _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_263 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_ident _menhir_cell0_LEFTPAR -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell0_LEFTPAR (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_ident (_menhir_stack, _menhir_s, app, _startpos_app_, _) = _menhir_stack in
      let (_endpos__4_, args) = (_endpos, _v) in
      let _v = _menhir_action_156 _endpos__4_ _startpos_app_ app args in
      _menhir_goto_simple_pattern _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_simple_pattern : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState273 ->
          _menhir_run_274 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState256 ->
          _menhir_run_268 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState257 ->
          _menhir_run_258 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_274 : type  ttv_stack ttv_result. (((((ttv_stack, ttv_result) _menhir_cell1_MATCH, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_WITH, ttv_result) _menhir_cell1_list1_match_cases as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_simple_pattern (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RIGHTARROW ->
          let _menhir_s = MenhirState275 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VOID ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUM _v ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MATCH ->
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LET ->
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTSQ ->
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTPAR ->
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTBR ->
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTEGER _v ->
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FORALL ->
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXISTS ->
              _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DISTINCT ->
              _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CUT ->
              _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CHECK ->
              _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_268 : type  ttv_stack ttv_result. ((((ttv_stack, ttv_result) _menhir_cell1_MATCH, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_WITH as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_simple_pattern (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RIGHTARROW ->
          let _menhir_s = MenhirState269 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VOID ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUM _v ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MATCH ->
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LET ->
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTSQ ->
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTPAR ->
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTBR ->
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTEGER _v ->
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FORALL ->
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXISTS ->
              _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DISTINCT ->
              _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CUT ->
              _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CHECK ->
              _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_258 : type  ttv_stack ttv_result. (((((ttv_stack, ttv_result) _menhir_cell1_MATCH, ttv_result) _menhir_cell1_lexpr, ttv_result) _menhir_cell1_WITH, ttv_result) _menhir_cell1_BAR as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_simple_pattern (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RIGHTARROW ->
          let _menhir_s = MenhirState259 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VOID ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUM _v ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MATCH ->
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LET ->
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTSQ ->
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTPAR ->
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTBR ->
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTEGER _v ->
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FORALL ->
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXISTS ->
              _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DISTINCT ->
              _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CUT ->
              _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CHECK ->
              _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_261 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | LEFTPAR ->
          let _menhir_stack = MenhirCell1_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _menhir_stack = MenhirCell0_LEFTPAR (_menhir_stack, _startpos) in
          let _menhir_s = MenhirState262 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | RIGHTARROW ->
          let (_endpos_id_, _startpos_id_, id) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_155 _endpos_id_ _startpos_id_ id in
          _menhir_goto_simple_pattern _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_250 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | EQUAL ->
          let _menhir_s = MenhirState251 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VOID ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUM _v ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MATCH ->
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LET ->
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTSQ ->
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTPAR ->
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTBR ->
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTEGER _v ->
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FORALL ->
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXISTS ->
              _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DISTINCT ->
              _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CUT ->
              _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CHECK ->
              _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_246 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LEFTBR as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | LEFTPAR ->
          let _menhir_stack = MenhirCell1_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQUAL ->
          let _menhir_stack = MenhirCell1_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer
      | COLON | DOT | LEFTSQ | QM | QM_ID _ | SHARP | WITH ->
          let (_endpos_var_, _startpos_var_, var) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_143 _endpos_var_ _startpos_var_ var in
          _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_var_ _startpos_var_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_133 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_ident -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell0_LEFTPAR (_menhir_stack, _startpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
      | TRUE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
      | STRING _v ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState133
      | NUM _v ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState133
      | NOT ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
      | MINUS ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
      | MATCH ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
      | LET ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
      | LEFTSQ ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
      | LEFTPAR ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
      | LEFTBR ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
      | INTEGER _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState133
      | IF ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState133
      | FORALL ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
      | FALSE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
      | EXISTS ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
      | DISTINCT ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
      | CUT ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
      | CHECK ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState133
      | RIGHTPAR ->
          let _v = _menhir_action_080 () in
          _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_090 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_ident -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState090 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MATCH ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTSQ ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTBR ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTEGER _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FORALL ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISTINCT ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CUT ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CHECK ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_227 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | MAPS_TO ->
          let _menhir_stack = MenhirCell1_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          let _menhir_s = MenhirState228 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VOID ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUM _v ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MATCH ->
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LET ->
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTSQ ->
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTPAR ->
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTBR ->
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTEGER _v ->
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FORALL ->
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXISTS ->
              _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DISTINCT ->
              _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CUT ->
              _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CHECK ->
              _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | LEFTPAR ->
          let _menhir_stack = MenhirCell1_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | AT | BAR | COLON | COMMA | DOT | EOF | EQUAL | GE | GT | HAT | IN | LE | LEFTSQ | LRARROW | LT | MINUS | NOTEQ | OR | PERCENT | PLUS | POW | POWDOT | QM | QM_ID _ | RIGHTARROW | RIGHTSQ | SHARP | SLASH | TIMES | XOR ->
          let (_endpos_var_, _startpos_var_, var) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_143 _endpos_var_ _startpos_var_ var in
          _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_var_ _startpos_var_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_184 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_simple_expr -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_simple_expr (_menhir_stack, _menhir_s, se, _startpos_se_, _) = _menhir_stack in
      let (_endpos_label_, label) = (_endpos, _v) in
      let _v = _menhir_action_146 _endpos_label_ _startpos_se_ label se in
      _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_label_ _startpos_se_ _v _menhir_s _tok
  
  and _menhir_run_132 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | LEFTPAR ->
          let _menhir_stack = MenhirCell1_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | AT | AXIOM | BAR | CASESPLIT | CHECK_SAT | COLON | COMMA | DOT | ELSE | END | EOF | EQUAL | FUNC | GE | GOAL | GT | HAT | IN | LE | LEFTARROW | LEFTSQ | LOGIC | LRARROW | LT | MINUS | NOTEQ | OR | PERCENT | PLUS | POW | POWDOT | PRED | PV | QM | QM_ID _ | REWRITING | RIGHTARROW | RIGHTBR | RIGHTPAR | RIGHTSQ | SHARP | SLASH | THEN | THEORY | TIMES | TYPE | WITH | XOR ->
          let (_endpos_var_, _startpos_var_, var) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_143 _endpos_var_ _startpos_var_ var in
          _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_var_ _startpos_var_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_119 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_simple_expr _menhir_cell0_QM -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell0_QM (_menhir_stack, _, _) = _menhir_stack in
      let MenhirCell1_simple_expr (_menhir_stack, _menhir_s, se, _startpos_se_, _) = _menhir_stack in
      let (_endpos_id_, id) = (_endpos, _v) in
      let _v = _menhir_action_152 _endpos_id_ _startpos_se_ id se in
      _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_id_ _startpos_se_ _v _menhir_s _tok
  
  and _menhir_run_116 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_simple_expr -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_simple_expr (_menhir_stack, _menhir_s, se, _startpos_se_, _) = _menhir_stack in
      let (_endpos_label_, label) = (_endpos, _v) in
      let _v = _menhir_action_154 _endpos_label_ _startpos_se_ label se in
      _menhir_goto_simple_expr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_label_ _startpos_se_ _v _menhir_s _tok
  
  and _menhir_run_089 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | EQUAL ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          _eRR ()
  
  and _menhir_run_063 : type  ttv_stack. ((ttv_stack, _menhir_box_file_parser) _menhir_cell1_CASESPLIT as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _menhir_s = MenhirState064 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VOID ->
              _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | TRUE ->
              _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STRING _v ->
              _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUM _v ->
              _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MATCH ->
              _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LET ->
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTSQ ->
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTPAR ->
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTBR ->
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INTEGER _v ->
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IF ->
              _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FORALL ->
              _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FALSE ->
              _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXISTS ->
              _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DISTINCT ->
              _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CUT ->
              _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CHECK ->
              _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_060 : type  ttv_stack. (((ttv_stack, _menhir_box_file_parser) _menhir_cell1_THEORY, _menhir_box_file_parser) _menhir_cell1_ident as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | EQUAL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | CASESPLIT ->
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState061
          | AXIOM ->
              _menhir_run_281 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState061
          | END ->
              let _v_0 = _menhir_action_161 () in
              _menhir_run_285 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_058 : type  ttv_stack. ((ttv_stack, _menhir_box_file_parser) _menhir_cell1_THEORY as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | EXTENDS ->
          let _menhir_s = MenhirState059 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_049 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | OF ->
          let _menhir_s = MenhirState050 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LEFTBR ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | AND | AXIOM | BAR | CHECK_SAT | EOF | FUNC | GOAL | LOGIC | PRED | REWRITING | THEORY | TYPE ->
          let _v = _menhir_action_005 () in
          _menhir_goto_algebraic_args _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_014 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file_parser) _menhir_state -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LEFTBR (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState014 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_045 : type  ttv_stack. ((((((ttv_stack, _menhir_box_file_parser) _menhir_cell1_type_vars, _menhir_box_file_parser) _menhir_cell1_ident, _menhir_box_file_parser) _menhir_cell1_list1_constructors_sep_bar, _menhir_box_file_parser) _menhir_cell1_AND, _menhir_box_file_parser) _menhir_cell1_type_vars as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | EQUAL ->
          let _menhir_s = MenhirState046 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_039 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LEFTPAR, ttv_result) _menhir_cell1_list1_primitive_type_sep_comma _menhir_cell0_RIGHTPAR -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let MenhirCell0_RIGHTPAR (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_list1_primitive_type_sep_comma (_menhir_stack, _, pars) = _menhir_stack in
      let MenhirCell1_LEFTPAR (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let (_endpos_ext_ty_, _startpos_ext_ty_, ext_ty) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_136 _endpos_ext_ty_ _startpos_ext_ty_ ext_ty pars in
      _menhir_goto_primitive_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_ext_ty_ _v _menhir_s _tok
  
  and _menhir_run_036 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_primitive_type -> _ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let MenhirCell1_primitive_type (_menhir_stack, _menhir_s, par, _) = _menhir_stack in
      let (_endpos_ext_ty_, _startpos_ext_ty_, ext_ty) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_135 _endpos_ext_ty_ _startpos_ext_ty_ ext_ty par in
      _menhir_goto_primitive_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_ext_ty_ _v _menhir_s _tok
  
  and _menhir_run_035 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let (_endpos_ext_ty_, _startpos_ext_ty_, ext_ty) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_133 _endpos_ext_ty_ _startpos_ext_ty_ ext_ty in
      _menhir_goto_primitive_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_ext_ty_ _v _menhir_s _tok
  
  and _menhir_run_020 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          let _menhir_s = MenhirState021 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UNIT ->
              _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | REAL ->
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | QUOTE ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LEFTPAR ->
              _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT ->
              _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BOOL ->
              _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | BITV ->
              _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_012 : type  ttv_stack. (((ttv_stack, _menhir_box_file_parser) _menhir_cell1_TYPE, _menhir_box_file_parser) _menhir_cell1_type_vars as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | EQUAL ->
          let _menhir_stack = MenhirCell1_ident (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          let _menhir_s = MenhirState013 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LEFTBR ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | AXIOM | CHECK_SAT | EOF | FUNC | GOAL | LOGIC | PRED | REWRITING | THEORY | TYPE ->
          let MenhirCell1_type_vars (_menhir_stack, _, ty_vars) = _menhir_stack in
          let MenhirCell1_TYPE (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_endpos_ty_, ty) = (_endpos, _v) in
          let _v = _menhir_action_023 _endpos_ty_ _startpos__1_ ty ty_vars in
          _menhir_goto_decl _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_004 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_QUOTE -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_QUOTE (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos_alpha_, alpha) = (_endpos, _v) in
      let _v = _menhir_action_167 alpha in
      _menhir_goto_type_var _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_alpha_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_goto_type_var : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState001 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState043 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState354 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState342 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState336 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState324 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState303 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState185 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState101 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState021 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState033 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState024 ->
          _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState007 ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState005 ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_055 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let alpha = _v in
      let _v = _menhir_action_169 alpha in
      _menhir_goto_type_vars _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_type_vars : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState043 ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState001 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_011 : type  ttv_stack. ((ttv_stack, _menhir_box_file_parser) _menhir_cell1_TYPE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_type_vars (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState011
      | _ ->
          _eRR ()
  
  and _menhir_run_031 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let (_endpos_alpha_, _startpos_alpha_, alpha) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_134 _endpos_alpha_ _startpos_alpha_ alpha in
      _menhir_goto_primitive_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_alpha_ _v _menhir_s _tok
  
  and _menhir_run_006 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file_parser) _menhir_state -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          let _menhir_stack = MenhirCell1_type_var (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          let _menhir_s = MenhirState007 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | QUOTE ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | RIGHTPAR ->
          let alpha = _v in
          let _v = _menhir_action_116 alpha in
          _menhir_goto_list1_type_var_sep_comma _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_list1_type_var_sep_comma : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file_parser) _menhir_state -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState005 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState007 ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_009 : type  ttv_stack. (ttv_stack, _menhir_box_file_parser) _menhir_cell1_LEFTPAR -> _ -> _ -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_LEFTPAR (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let l = _v in
      let _v = _menhir_action_170 l in
      _menhir_goto_type_vars _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_008 : type  ttv_stack. (ttv_stack, _menhir_box_file_parser) _menhir_cell1_type_var -> _ -> _ -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_type_var (_menhir_stack, _menhir_s, alpha, _, _) = _menhir_stack in
      let l = _v in
      let _v = _menhir_action_117 alpha l in
      _menhir_goto_list1_type_var_sep_comma _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  let _menhir_run_000 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_file_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TYPE ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
      | THEORY ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
      | REWRITING ->
          _menhir_run_289 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
      | PRED ->
          _menhir_run_296 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
      | LOGIC ->
          _menhir_run_332 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
      | GOAL ->
          _menhir_run_345 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
      | FUNC ->
          _menhir_run_349 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
      | EOF ->
          let _v = _menhir_action_035 () in
          _menhir_goto_file_parser _menhir_stack _v
      | CHECK_SAT ->
          _menhir_run_360 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
      | AXIOM ->
          _menhir_run_364 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
      | _ ->
          _eRR ()
  
  let _menhir_run_373 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_lexpr_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState373 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MATCH ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTSQ ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTBR ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTEGER _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FORALL ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISTINCT ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CUT ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CHECK ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  let _menhir_run_377 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_trigger_parser =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState377 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VOID ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | TRUE ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STRING _v ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUM _v ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MATCH ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTSQ ->
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTPAR ->
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LEFTBR ->
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INTEGER _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IF ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FORALL ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FALSE ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | DISTINCT ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CUT ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CHECK ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
end

let trigger_parser =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_trigger_parser v = _menhir_run_377 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

let lexpr_parser =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_lexpr_parser v = _menhir_run_373 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

let file_parser =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_file_parser v = _menhir_run_000 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
