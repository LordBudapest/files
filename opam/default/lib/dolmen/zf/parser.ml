
module Make

# 6 "src/languages/zf/parser.mly"
           (L : Dolmen_intf.Location.S)
# 7 "src/languages/zf/parser.ml"


# 7 "src/languages/zf/parser.mly"
           (I : Ast.Id)
# 12 "src/languages/zf/parser.ml"


# 8 "src/languages/zf/parser.mly"
           (T : Ast.Term with type location := L.t and type id := I.t)
# 17 "src/languages/zf/parser.ml"


# 9 "src/languages/zf/parser.mly"
           (S : Ast.Statement with type location := L.t and type id := I.t and type term := T.t)
# 22 "src/languages/zf/parser.ml"

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

    | MenhirState001 : (('s, _menhir_box_file) _menhir_cell1_VAL, _menhir_box_file) _menhir_state
      (** State 001.
        Stack shape : VAL.
        Start symbol: file. *)

    | MenhirState002 : (('s, 'r) _menhir_cell1_LEFT_BRACKET, 'r) _menhir_state
      (** State 002.
        Stack shape : LEFT_BRACKET.
        Start symbol: <undetermined>. *)

    | MenhirState006 : (('s, 'r) _menhir_cell1_LEFT_PAREN, 'r) _menhir_state
      (** State 006.
        Stack shape : LEFT_PAREN.
        Start symbol: <undetermined>. *)

    | MenhirState007 : (('s, 'r) _menhir_cell1_raw_var, 'r) _menhir_state
      (** State 007.
        Stack shape : raw_var.
        Start symbol: <undetermined>. *)

    | MenhirState011 : (('s, 'r) _menhir_cell1_atomic_attr, 'r) _menhir_state
      (** State 011.
        Stack shape : atomic_attr.
        Start symbol: <undetermined>. *)

    | MenhirState019 : (('s, 'r) _menhir_cell1_attr, 'r) _menhir_state
      (** State 019.
        Stack shape : attr.
        Start symbol: <undetermined>. *)

    | MenhirState021 : ((('s, _menhir_box_file) _menhir_cell1_VAL, _menhir_box_file) _menhir_cell1_attrs, _menhir_box_file) _menhir_state
      (** State 021.
        Stack shape : VAL attrs.
        Start symbol: file. *)

    | MenhirState023 : (((('s, _menhir_box_file) _menhir_cell1_VAL, _menhir_box_file) _menhir_cell1_attrs, _menhir_box_file) _menhir_cell1_name, _menhir_box_file) _menhir_state
      (** State 023.
        Stack shape : VAL attrs name.
        Start symbol: file. *)

    | MenhirState027 : (('s, 'r) _menhir_cell1_PI, 'r) _menhir_state
      (** State 027.
        Stack shape : PI.
        Start symbol: <undetermined>. *)

    | MenhirState028 : (('s, 'r) _menhir_cell1_LEFT_PAREN, 'r) _menhir_state
      (** State 028.
        Stack shape : LEFT_PAREN.
        Start symbol: <undetermined>. *)

    | MenhirState029 : (('s, 'r) _menhir_cell1_raw_var, 'r) _menhir_state
      (** State 029.
        Stack shape : raw_var.
        Start symbol: <undetermined>. *)

    | MenhirState032 : ((('s, 'r) _menhir_cell1_LEFT_PAREN, 'r) _menhir_cell1_nonempty_list_raw_var_, 'r) _menhir_state
      (** State 032.
        Stack shape : LEFT_PAREN nonempty_list(raw_var).
        Start symbol: <undetermined>. *)

    | MenhirState037 : ((('s, 'r) _menhir_cell1_PI, 'r) _menhir_cell1_typed_ty_var_list _menhir_cell0_DOT, 'r) _menhir_state
      (** State 037.
        Stack shape : PI typed_ty_var_list DOT.
        Start symbol: <undetermined>. *)

    | MenhirState038 : (('s, 'r) _menhir_cell1_MATCH, 'r) _menhir_state
      (** State 038.
        Stack shape : MATCH.
        Start symbol: <undetermined>. *)

    | MenhirState040 : (('s, 'r) _menhir_cell1_LOGIC_NOT, 'r) _menhir_state
      (** State 040.
        Stack shape : LOGIC_NOT.
        Start symbol: <undetermined>. *)

    | MenhirState042 : (('s, 'r) _menhir_cell1_LEFT_PAREN, 'r) _menhir_state
      (** State 042.
        Stack shape : LEFT_PAREN.
        Start symbol: <undetermined>. *)

    | MenhirState043 : (('s, 'r) _menhir_cell1_LOGIC_FORALL, 'r) _menhir_state
      (** State 043.
        Stack shape : LOGIC_FORALL.
        Start symbol: <undetermined>. *)

    | MenhirState044 : (('s, 'r) _menhir_cell1_LEFT_PAREN, 'r) _menhir_state
      (** State 044.
        Stack shape : LEFT_PAREN.
        Start symbol: <undetermined>. *)

    | MenhirState046 : ((('s, 'r) _menhir_cell1_LEFT_PAREN, 'r) _menhir_cell1_nonempty_list_raw_var_, 'r) _menhir_state
      (** State 046.
        Stack shape : LEFT_PAREN nonempty_list(raw_var).
        Start symbol: <undetermined>. *)

    | MenhirState047 : (('s, 'r) _menhir_cell1_LOGIC_EXISTS, 'r) _menhir_state
      (** State 047.
        Stack shape : LOGIC_EXISTS.
        Start symbol: <undetermined>. *)

    | MenhirState050 : ((('s, 'r) _menhir_cell1_LOGIC_EXISTS, 'r) _menhir_cell1_typed_var_list _menhir_cell0_DOT, 'r) _menhir_state
      (** State 050.
        Stack shape : LOGIC_EXISTS typed_var_list DOT.
        Start symbol: <undetermined>. *)

    | MenhirState053 : (('s, 'r) _menhir_cell1_IF, 'r) _menhir_state
      (** State 053.
        Stack shape : IF.
        Start symbol: <undetermined>. *)

    | MenhirState054 : (('s, 'r) _menhir_cell1_FUN, 'r) _menhir_state
      (** State 054.
        Stack shape : FUN.
        Start symbol: <undetermined>. *)

    | MenhirState056 : ((('s, 'r) _menhir_cell1_FUN, 'r) _menhir_cell1_typed_var_list _menhir_cell0_DOT, 'r) _menhir_state
      (** State 056.
        Stack shape : FUN typed_var_list DOT.
        Start symbol: <undetermined>. *)

    | MenhirState057 : (('s, 'r) _menhir_cell1_ARITH_MINUS, 'r) _menhir_state
      (** State 057.
        Stack shape : ARITH_MINUS.
        Start symbol: <undetermined>. *)

    | MenhirState062 : (('s, 'r) _menhir_cell1_atomic_term, 'r) _menhir_state
      (** State 062.
        Stack shape : atomic_term.
        Start symbol: <undetermined>. *)

    | MenhirState064 : ((('s, 'r) _menhir_cell1_atomic_term, 'r) _menhir_cell1_atomic_term, 'r) _menhir_state
      (** State 064.
        Stack shape : atomic_term atomic_term.
        Start symbol: <undetermined>. *)

    | MenhirState069 : (('s, 'r) _menhir_cell1_plus_term, 'r) _menhir_state
      (** State 069.
        Stack shape : plus_term.
        Start symbol: <undetermined>. *)

    | MenhirState072 : (('s, 'r) _menhir_cell1_mult_term, 'r) _menhir_state
      (** State 072.
        Stack shape : mult_term.
        Start symbol: <undetermined>. *)

    | MenhirState075 : (('s, 'r) _menhir_cell1_apply_term, 'r) _menhir_state
      (** State 075.
        Stack shape : apply_term.
        Start symbol: <undetermined>. *)

    | MenhirState077 : (('s, 'r) _menhir_cell1_mult_term _menhir_cell0_ARITH_MINUS, 'r) _menhir_state
      (** State 077.
        Stack shape : mult_term ARITH_MINUS.
        Start symbol: <undetermined>. *)

    | MenhirState079 : (('s, 'r) _menhir_cell1_plus_term, 'r) _menhir_state
      (** State 079.
        Stack shape : plus_term.
        Start symbol: <undetermined>. *)

    | MenhirState081 : (('s, 'r) _menhir_cell1_plus_term, 'r) _menhir_state
      (** State 081.
        Stack shape : plus_term.
        Start symbol: <undetermined>. *)

    | MenhirState083 : (('s, 'r) _menhir_cell1_plus_term, 'r) _menhir_state
      (** State 083.
        Stack shape : plus_term.
        Start symbol: <undetermined>. *)

    | MenhirState087 : (('s, 'r) _menhir_cell1_not_term, 'r) _menhir_state
      (** State 087.
        Stack shape : not_term.
        Start symbol: <undetermined>. *)

    | MenhirState090 : (('s, 'r) _menhir_cell1_not_term, 'r) _menhir_state
      (** State 090.
        Stack shape : not_term.
        Start symbol: <undetermined>. *)

    | MenhirState093 : (('s, 'r) _menhir_cell1_eq_term, 'r) _menhir_state
      (** State 093.
        Stack shape : eq_term.
        Start symbol: <undetermined>. *)

    | MenhirState096 : (('s, 'r) _menhir_cell1_apply_term, 'r) _menhir_state
      (** State 096.
        Stack shape : apply_term.
        Start symbol: <undetermined>. *)

    | MenhirState099 : (('s, 'r) _menhir_cell1_and_term, 'r) _menhir_state
      (** State 099.
        Stack shape : and_term.
        Start symbol: <undetermined>. *)

    | MenhirState101 : (('s, 'r) _menhir_cell1_and_term, 'r) _menhir_state
      (** State 101.
        Stack shape : and_term.
        Start symbol: <undetermined>. *)

    | MenhirState103 : (('s, 'r) _menhir_cell1_and_term, 'r) _menhir_state
      (** State 103.
        Stack shape : and_term.
        Start symbol: <undetermined>. *)

    | MenhirState105 : (('s, 'r) _menhir_cell1_typed_var_block, 'r) _menhir_state
      (** State 105.
        Stack shape : typed_var_block.
        Start symbol: <undetermined>. *)

    | MenhirState109 : ((('s, 'r) _menhir_cell1_IF, 'r) _menhir_cell1_term, 'r) _menhir_state
      (** State 109.
        Stack shape : IF term.
        Start symbol: <undetermined>. *)

    | MenhirState111 : (((('s, 'r) _menhir_cell1_IF, 'r) _menhir_cell1_term, 'r) _menhir_cell1_term, 'r) _menhir_state
      (** State 111.
        Stack shape : IF term term.
        Start symbol: <undetermined>. *)

    | MenhirState117 : ((('s, 'r) _menhir_cell1_LOGIC_FORALL, 'r) _menhir_cell1_typed_var_list _menhir_cell0_DOT, 'r) _menhir_state
      (** State 117.
        Stack shape : LOGIC_FORALL typed_var_list DOT.
        Start symbol: <undetermined>. *)

    | MenhirState123 : ((('s, 'r) _menhir_cell1_MATCH, 'r) _menhir_cell1_term, 'r) _menhir_state
      (** State 123.
        Stack shape : MATCH term.
        Start symbol: <undetermined>. *)

    | MenhirState124 : (('s, 'r) _menhir_cell1_VERTICAL_BAR, 'r) _menhir_state
      (** State 124.
        Stack shape : VERTICAL_BAR.
        Start symbol: <undetermined>. *)

    | MenhirState125 : ((('s, 'r) _menhir_cell1_VERTICAL_BAR, 'r) _menhir_cell1_raw_var, 'r) _menhir_state
      (** State 125.
        Stack shape : VERTICAL_BAR raw_var.
        Start symbol: <undetermined>. *)

    | MenhirState127 : (('s, 'r) _menhir_cell1_var_or_wildcard, 'r) _menhir_state
      (** State 127.
        Stack shape : var_or_wildcard.
        Start symbol: <undetermined>. *)

    | MenhirState131 : (((('s, 'r) _menhir_cell1_VERTICAL_BAR, 'r) _menhir_cell1_raw_var, 'r) _menhir_cell1_list_var_or_wildcard_, 'r) _menhir_state
      (** State 131.
        Stack shape : VERTICAL_BAR raw_var list(var_or_wildcard).
        Start symbol: <undetermined>. *)

    | MenhirState135 : (('s, 'r) _menhir_cell1_match_branch, 'r) _menhir_state
      (** State 135.
        Stack shape : match_branch.
        Start symbol: <undetermined>. *)

    | MenhirState138 : (('s, 'r) _menhir_cell1_typed_ty_var_block, 'r) _menhir_state
      (** State 138.
        Stack shape : typed_ty_var_block.
        Start symbol: <undetermined>. *)

    | MenhirState141 : (('s, 'r) _menhir_cell1_raw_var, 'r) _menhir_state
      (** State 141.
        Stack shape : raw_var.
        Start symbol: <undetermined>. *)

    | MenhirState145 : (('s, _menhir_box_file) _menhir_cell1_REWRITE, _menhir_box_file) _menhir_state
      (** State 145.
        Stack shape : REWRITE.
        Start symbol: file. *)

    | MenhirState146 : ((('s, _menhir_box_file) _menhir_cell1_REWRITE, _menhir_box_file) _menhir_cell1_attrs, _menhir_box_file) _menhir_state
      (** State 146.
        Stack shape : REWRITE attrs.
        Start symbol: file. *)

    | MenhirState149 : (('s, _menhir_box_file) _menhir_cell1_LEMMA, _menhir_box_file) _menhir_state
      (** State 149.
        Stack shape : LEMMA.
        Start symbol: file. *)

    | MenhirState150 : ((('s, _menhir_box_file) _menhir_cell1_LEMMA, _menhir_box_file) _menhir_cell1_attrs, _menhir_box_file) _menhir_state
      (** State 150.
        Stack shape : LEMMA attrs.
        Start symbol: file. *)

    | MenhirState156 : (('s, _menhir_box_file) _menhir_cell1_GOAL, _menhir_box_file) _menhir_state
      (** State 156.
        Stack shape : GOAL.
        Start symbol: file. *)

    | MenhirState157 : ((('s, _menhir_box_file) _menhir_cell1_GOAL, _menhir_box_file) _menhir_cell1_attrs, _menhir_box_file) _menhir_state
      (** State 157.
        Stack shape : GOAL attrs.
        Start symbol: file. *)

    | MenhirState160 : (('s, _menhir_box_file) _menhir_cell1_DEF, _menhir_box_file) _menhir_state
      (** State 160.
        Stack shape : DEF.
        Start symbol: file. *)

    | MenhirState161 : ((('s, _menhir_box_file) _menhir_cell1_DEF, _menhir_box_file) _menhir_cell1_attrs, _menhir_box_file) _menhir_state
      (** State 161.
        Stack shape : DEF attrs.
        Start symbol: file. *)

    | MenhirState165 : (('s, 'r) _menhir_cell1_name, 'r) _menhir_state
      (** State 165.
        Stack shape : name.
        Start symbol: <undetermined>. *)

    | MenhirState167 : ((('s, 'r) _menhir_cell1_name, 'r) _menhir_cell1_term, 'r) _menhir_state
      (** State 167.
        Stack shape : name term.
        Start symbol: <undetermined>. *)

    | MenhirState169 : (('s, 'r) _menhir_cell1_term, 'r) _menhir_state
      (** State 169.
        Stack shape : term.
        Start symbol: <undetermined>. *)

    | MenhirState172 : ((('s, 'r) _menhir_cell1_name, 'r) _menhir_cell1_term, 'r) _menhir_state
      (** State 172.
        Stack shape : name term.
        Start symbol: <undetermined>. *)

    | MenhirState175 : (('s, 'r) _menhir_cell1_def, 'r) _menhir_state
      (** State 175.
        Stack shape : def.
        Start symbol: <undetermined>. *)

    | MenhirState177 : (('s, _menhir_box_file) _menhir_cell1_DATA, _menhir_box_file) _menhir_state
      (** State 177.
        Stack shape : DATA.
        Start symbol: file. *)

    | MenhirState178 : ((('s, _menhir_box_file) _menhir_cell1_DATA, _menhir_box_file) _menhir_cell1_attrs, _menhir_box_file) _menhir_state
      (** State 178.
        Stack shape : DATA attrs.
        Start symbol: file. *)

    | MenhirState180 : (('s, 'r) _menhir_cell1_type_def, 'r) _menhir_state
      (** State 180.
        Stack shape : type_def.
        Start symbol: <undetermined>. *)

    | MenhirState182 : (('s, 'r) _menhir_cell1_name, 'r) _menhir_state
      (** State 182.
        Stack shape : name.
        Start symbol: <undetermined>. *)

    | MenhirState183 : (('s, 'r) _menhir_cell1_raw_var, 'r) _menhir_state
      (** State 183.
        Stack shape : raw_var.
        Start symbol: <undetermined>. *)

    | MenhirState188 : ((('s, 'r) _menhir_cell1_name, 'r) _menhir_cell1_list_raw_var_ _menhir_cell0_option_VERTICAL_BAR_, 'r) _menhir_state
      (** State 188.
        Stack shape : name list(raw_var) option(VERTICAL_BAR).
        Start symbol: <undetermined>. *)

    | MenhirState190 : (('s, 'r) _menhir_cell1_name, 'r) _menhir_state
      (** State 190.
        Stack shape : name.
        Start symbol: <undetermined>. *)

    | MenhirState192 : (('s, 'r) _menhir_cell1_atomic_term, 'r) _menhir_state
      (** State 192.
        Stack shape : atomic_term.
        Start symbol: <undetermined>. *)

    | MenhirState195 : (('s, 'r) _menhir_cell1_constructor, 'r) _menhir_state
      (** State 195.
        Stack shape : constructor.
        Start symbol: <undetermined>. *)

    | MenhirState201 : (('s, _menhir_box_file) _menhir_cell1_ASSERT, _menhir_box_file) _menhir_state
      (** State 201.
        Stack shape : ASSERT.
        Start symbol: file. *)

    | MenhirState202 : ((('s, _menhir_box_file) _menhir_cell1_ASSERT, _menhir_box_file) _menhir_cell1_attrs, _menhir_box_file) _menhir_state
      (** State 202.
        Stack shape : ASSERT attrs.
        Start symbol: file. *)

    | MenhirState205 : (('s, _menhir_box_file) _menhir_cell1_statement, _menhir_box_file) _menhir_state
      (** State 205.
        Stack shape : statement.
        Start symbol: file. *)

    | MenhirState210 : ('s, _menhir_box_input) _menhir_state
      (** State 210.
        Stack shape : .
        Start symbol: input. *)

    | MenhirState211 : (('s, _menhir_box_input) _menhir_cell1_VAL, _menhir_box_input) _menhir_state
      (** State 211.
        Stack shape : VAL.
        Start symbol: input. *)

    | MenhirState212 : ((('s, _menhir_box_input) _menhir_cell1_VAL, _menhir_box_input) _menhir_cell1_attrs, _menhir_box_input) _menhir_state
      (** State 212.
        Stack shape : VAL attrs.
        Start symbol: input. *)

    | MenhirState214 : (((('s, _menhir_box_input) _menhir_cell1_VAL, _menhir_box_input) _menhir_cell1_attrs, _menhir_box_input) _menhir_cell1_name, _menhir_box_input) _menhir_state
      (** State 214.
        Stack shape : VAL attrs name.
        Start symbol: input. *)

    | MenhirState217 : (('s, _menhir_box_input) _menhir_cell1_REWRITE, _menhir_box_input) _menhir_state
      (** State 217.
        Stack shape : REWRITE.
        Start symbol: input. *)

    | MenhirState218 : ((('s, _menhir_box_input) _menhir_cell1_REWRITE, _menhir_box_input) _menhir_cell1_attrs, _menhir_box_input) _menhir_state
      (** State 218.
        Stack shape : REWRITE attrs.
        Start symbol: input. *)

    | MenhirState221 : (('s, _menhir_box_input) _menhir_cell1_LEMMA, _menhir_box_input) _menhir_state
      (** State 221.
        Stack shape : LEMMA.
        Start symbol: input. *)

    | MenhirState222 : ((('s, _menhir_box_input) _menhir_cell1_LEMMA, _menhir_box_input) _menhir_cell1_attrs, _menhir_box_input) _menhir_state
      (** State 222.
        Stack shape : LEMMA attrs.
        Start symbol: input. *)

    | MenhirState228 : (('s, _menhir_box_input) _menhir_cell1_GOAL, _menhir_box_input) _menhir_state
      (** State 228.
        Stack shape : GOAL.
        Start symbol: input. *)

    | MenhirState229 : ((('s, _menhir_box_input) _menhir_cell1_GOAL, _menhir_box_input) _menhir_cell1_attrs, _menhir_box_input) _menhir_state
      (** State 229.
        Stack shape : GOAL attrs.
        Start symbol: input. *)

    | MenhirState233 : (('s, _menhir_box_input) _menhir_cell1_DEF, _menhir_box_input) _menhir_state
      (** State 233.
        Stack shape : DEF.
        Start symbol: input. *)

    | MenhirState234 : ((('s, _menhir_box_input) _menhir_cell1_DEF, _menhir_box_input) _menhir_cell1_attrs, _menhir_box_input) _menhir_state
      (** State 234.
        Stack shape : DEF attrs.
        Start symbol: input. *)

    | MenhirState237 : (('s, _menhir_box_input) _menhir_cell1_DATA, _menhir_box_input) _menhir_state
      (** State 237.
        Stack shape : DATA.
        Start symbol: input. *)

    | MenhirState238 : ((('s, _menhir_box_input) _menhir_cell1_DATA, _menhir_box_input) _menhir_cell1_attrs, _menhir_box_input) _menhir_state
      (** State 238.
        Stack shape : DATA attrs.
        Start symbol: input. *)

    | MenhirState241 : (('s, _menhir_box_input) _menhir_cell1_ASSERT, _menhir_box_input) _menhir_state
      (** State 241.
        Stack shape : ASSERT.
        Start symbol: input. *)

    | MenhirState242 : ((('s, _menhir_box_input) _menhir_cell1_ASSERT, _menhir_box_input) _menhir_cell1_attrs, _menhir_box_input) _menhir_state
      (** State 242.
        Stack shape : ASSERT attrs.
        Start symbol: input. *)

  
  and ('s, 'r) _menhir_cell1_and_term = 
    | MenhirCell1_and_term of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_apply_term = 
    | MenhirCell1_apply_term of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_atomic_attr = 
    | MenhirCell1_atomic_attr of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position
  
  and ('s, 'r) _menhir_cell1_atomic_term = 
    | MenhirCell1_atomic_term of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_attr = 
    | MenhirCell1_attr of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_attrs = 
    | MenhirCell1_attrs of 's * ('s, 'r) _menhir_state * (T.t list)
  
  and ('s, 'r) _menhir_cell1_constructor = 
    | MenhirCell1_constructor of 's * ('s, 'r) _menhir_state * (I.t * T.t list) * Lexing.position
  
  and ('s, 'r) _menhir_cell1_def = 
    | MenhirCell1_def of 's * ('s, 'r) _menhir_state * (S.t)
  
  and ('s, 'r) _menhir_cell1_eq_term = 
    | MenhirCell1_eq_term of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_list_raw_var_ = 
    | MenhirCell1_list_raw_var_ of 's * ('s, 'r) _menhir_state * (T.t list)
  
  and ('s, 'r) _menhir_cell1_list_var_or_wildcard_ = 
    | MenhirCell1_list_var_or_wildcard_ of 's * ('s, 'r) _menhir_state * (T.t list) * Lexing.position
  
  and ('s, 'r) _menhir_cell1_match_branch = 
    | MenhirCell1_match_branch of 's * ('s, 'r) _menhir_state * (T.t * T.t)
  
  and ('s, 'r) _menhir_cell1_mult_term = 
    | MenhirCell1_mult_term of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_name = 
    | MenhirCell1_name of 's * ('s, 'r) _menhir_state * (I.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_nonempty_list_raw_var_ = 
    | MenhirCell1_nonempty_list_raw_var_ of 's * ('s, 'r) _menhir_state * (T.t list)
  
  and ('s, 'r) _menhir_cell1_not_term = 
    | MenhirCell1_not_term of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and 's _menhir_cell0_option_VERTICAL_BAR_ = 
    | MenhirCell0_option_VERTICAL_BAR_ of 's * (unit option)
  
  and ('s, 'r) _menhir_cell1_plus_term = 
    | MenhirCell1_plus_term of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_raw_var = 
    | MenhirCell1_raw_var of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position * Lexing.position
  
  and ('s, 'r) _menhir_cell1_statement = 
    | MenhirCell1_statement of 's * ('s, 'r) _menhir_state * (S.t)
  
  and ('s, 'r) _menhir_cell1_term = 
    | MenhirCell1_term of 's * ('s, 'r) _menhir_state * (T.t) * Lexing.position
  
  and ('s, 'r) _menhir_cell1_type_def = 
    | MenhirCell1_type_def of 's * ('s, 'r) _menhir_state * (S.t)
  
  and ('s, 'r) _menhir_cell1_typed_ty_var_block = 
    | MenhirCell1_typed_ty_var_block of 's * ('s, 'r) _menhir_state * (T.t list)
  
  and ('s, 'r) _menhir_cell1_typed_ty_var_list = 
    | MenhirCell1_typed_ty_var_list of 's * ('s, 'r) _menhir_state * (T.t list)
  
  and ('s, 'r) _menhir_cell1_typed_var_block = 
    | MenhirCell1_typed_var_block of 's * ('s, 'r) _menhir_state * (T.t list)
  
  and ('s, 'r) _menhir_cell1_typed_var_list = 
    | MenhirCell1_typed_var_list of 's * ('s, 'r) _menhir_state * (T.t list)
  
  and ('s, 'r) _menhir_cell1_var_or_wildcard = 
    | MenhirCell1_var_or_wildcard of 's * ('s, 'r) _menhir_state * (T.t)
  
  and ('s, 'r) _menhir_cell1_ARITH_MINUS = 
    | MenhirCell1_ARITH_MINUS of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and 's _menhir_cell0_ARITH_MINUS = 
    | MenhirCell0_ARITH_MINUS of 's * Lexing.position
  
  and ('s, 'r) _menhir_cell1_ASSERT = 
    | MenhirCell1_ASSERT of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_DATA = 
    | MenhirCell1_DATA of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_DEF = 
    | MenhirCell1_DEF of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and 's _menhir_cell0_DOT = 
    | MenhirCell0_DOT of 's * Lexing.position
  
  and ('s, 'r) _menhir_cell1_FUN = 
    | MenhirCell1_FUN of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_GOAL = 
    | MenhirCell1_GOAL of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_IF = 
    | MenhirCell1_IF of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_LEFT_BRACKET = 
    | MenhirCell1_LEFT_BRACKET of 's * ('s, 'r) _menhir_state
  
  and ('s, 'r) _menhir_cell1_LEFT_PAREN = 
    | MenhirCell1_LEFT_PAREN of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_LEMMA = 
    | MenhirCell1_LEMMA of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_LOGIC_EXISTS = 
    | MenhirCell1_LOGIC_EXISTS of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_LOGIC_FORALL = 
    | MenhirCell1_LOGIC_FORALL of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_LOGIC_NOT = 
    | MenhirCell1_LOGIC_NOT of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_MATCH = 
    | MenhirCell1_MATCH of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_PI = 
    | MenhirCell1_PI of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_REWRITE = 
    | MenhirCell1_REWRITE of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_VAL = 
    | MenhirCell1_VAL of 's * ('s, 'r) _menhir_state * Lexing.position
  
  and ('s, 'r) _menhir_cell1_VERTICAL_BAR = 
    | MenhirCell1_VERTICAL_BAR of 's * ('s, 'r) _menhir_state
  
  and _menhir_box_input = 
    | MenhirBox_input of (S.t option) [@@unboxed]
  
  and _menhir_box_file = 
    | MenhirBox_file of (S.t list) [@@unboxed]
  
  let _menhir_action_002 =
    fun t ->
      (
# 164 "src/languages/zf/parser.mly"
    ( t )
# 669 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_003 =
    fun _endpos_u_ _startpos_t_ t u ->
      let _endpos = _endpos_u_ in
      let _startpos = _startpos_t_ in
      (
# 166 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.and_ ~loc [t; u] )
# 679 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_004 =
    fun t ->
      (
# 108 "src/languages/zf/parser.mly"
    ( t )
# 687 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_005 =
    fun _endpos_u_ _startpos_t_ t u ->
      let _endpos = _endpos_u_ in
      let _startpos = _startpos_t_ in
      (
# 110 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.apply ~loc t u )
# 697 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_006 =
    fun _endpos_t_ _startpos__1_ t ->
      let _endpos = _endpos_t_ in
      let _startpos = _startpos__1_ in
      (
# 112 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.uminus ~loc t )
# 707 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_007 =
    fun t ->
      (
# 144 "src/languages/zf/parser.mly"
    ( t )
# 715 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_008 =
    fun _endpos_b_ _startpos_a_ a b ->
      let o = 
# 134 "src/languages/zf/parser.mly"
    ( T.lt )
# 723 "src/languages/zf/parser.ml"
       in
      let _endpos = _endpos_b_ in
      let _startpos = _startpos_a_ in
      (
# 146 "src/languages/zf/parser.mly"
    ( let loc = Some (L.mk_pos _startpos _endpos) in o ?loc a b )
# 730 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_009 =
    fun _endpos_b_ _startpos_a_ a b ->
      let o = 
# 136 "src/languages/zf/parser.mly"
    ( T.leq )
# 738 "src/languages/zf/parser.ml"
       in
      let _endpos = _endpos_b_ in
      let _startpos = _startpos_a_ in
      (
# 146 "src/languages/zf/parser.mly"
    ( let loc = Some (L.mk_pos _startpos _endpos) in o ?loc a b )
# 745 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_010 =
    fun _endpos_b_ _startpos_a_ a b ->
      let o = 
# 138 "src/languages/zf/parser.mly"
    ( T.gt )
# 753 "src/languages/zf/parser.ml"
       in
      let _endpos = _endpos_b_ in
      let _startpos = _startpos_a_ in
      (
# 146 "src/languages/zf/parser.mly"
    ( let loc = Some (L.mk_pos _startpos _endpos) in o ?loc a b )
# 760 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_011 =
    fun _endpos_b_ _startpos_a_ a b ->
      let o = 
# 140 "src/languages/zf/parser.mly"
    ( T.geq )
# 768 "src/languages/zf/parser.ml"
       in
      let _endpos = _endpos_b_ in
      let _startpos = _startpos_a_ in
      (
# 146 "src/languages/zf/parser.mly"
    ( let loc = Some (L.mk_pos _startpos _endpos) in o ?loc a b )
# 775 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_012 =
    fun s ->
      (
# 224 "src/languages/zf/parser.mly"
    ( s )
# 783 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_013 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 226 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.quoted ~loc s )
# 793 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_014 =
    fun a ->
      (
# 228 "src/languages/zf/parser.mly"
    ( a )
# 801 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_015 =
    fun v ->
      (
# 96 "src/languages/zf/parser.mly"
    ( v )
# 809 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_016 =
    fun t ->
      (
# 98 "src/languages/zf/parser.mly"
    ( t )
# 817 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_017 =
    fun _endpos_i_ _startpos_i_ i ->
      let _endpos = _endpos_i_ in
      let _startpos = _startpos_i_ in
      (
# 100 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.int ~loc i )
# 827 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_018 =
    fun t ->
      (
# 102 "src/languages/zf/parser.mly"
    ( t )
# 835 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_019 =
    fun _endpos__5_ _startpos__1_ l t ->
      let _endpos = _endpos__5_ in
      let _startpos = _startpos__1_ in
      (
# 104 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.match_ ~loc t l )
# 845 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_020 =
    fun a ->
      (
# 218 "src/languages/zf/parser.mly"
    ( a )
# 853 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_021 =
    fun _endpos_l_ _startpos_s_ l s ->
      let _endpos = _endpos_l_ in
      let _startpos = _startpos_s_ in
      (
# 220 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.apply ~loc s l )
# 863 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_022 =
    fun l ->
      (
# 232 "src/languages/zf/parser.mly"
    ( l )
# 871 "src/languages/zf/parser.ml"
       : (T.t list))
  
  let _menhir_action_023 =
    fun () ->
      (
# 233 "src/languages/zf/parser.mly"
    ( [] )
# 879 "src/languages/zf/parser.ml"
       : (T.t list))
  
  let _menhir_action_024 =
    fun _endpos__1_ _startpos__1_ ->
      let _endpos = _endpos__1_ in
      let _startpos = _startpos__1_ in
      (
# 76 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.tType ~loc () )
# 889 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_025 =
    fun _endpos__1_ _startpos__1_ ->
      let _endpos = _endpos__1_ in
      let _startpos = _startpos__1_ in
      (
# 78 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.prop ~loc () )
# 899 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_026 =
    fun _endpos__1_ _startpos__1_ ->
      let _endpos = _endpos__1_ in
      let _startpos = _startpos__1_ in
      (
# 80 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.ty_int ~loc () )
# 909 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_027 =
    fun _endpos__1_ _startpos__1_ ->
      let _endpos = _endpos__1_ in
      let _startpos = _startpos__1_ in
      (
# 82 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.true_ ~loc () )
# 919 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_028 =
    fun _endpos__1_ _startpos__1_ ->
      let _endpos = _endpos__1_ in
      let _startpos = _startpos__1_ in
      (
# 84 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.false_ ~loc () )
# 929 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_029 =
    fun l v ->
      (
# 202 "src/languages/zf/parser.mly"
    ( v, l )
# 937 "src/languages/zf/parser.ml"
       : (I.t * T.t list))
  
  let _menhir_action_030 =
    fun l ->
      (
# 206 "src/languages/zf/parser.mly"
    ( l )
# 945 "src/languages/zf/parser.ml"
       : ((I.t * T.t list) list))
  
  let _menhir_action_031 =
    fun _endpos_t_ _startpos_id_ id t ty ->
      let _endpos = _endpos_t_ in
      let _startpos = _startpos_id_ in
      (
# 237 "src/languages/zf/parser.mly"
    ( let v =
        let loc = L.mk_pos _startpos _endpos in
        T.const ~loc id
      in
      let loc = L.mk_pos _startpos _endpos in
      let eq = T.eq ~loc v t in
      S.definition ~loc id ty [eq] )
# 961 "src/languages/zf/parser.ml"
       : (S.t))
  
  let _menhir_action_032 =
    fun _endpos_rules_ _startpos_id_ id rules ty ->
      let _endpos = _endpos_rules_ in
      let _startpos = _startpos_id_ in
      (
# 245 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      S.definition ~loc id ty rules )
# 972 "src/languages/zf/parser.ml"
       : (S.t))
  
  let _menhir_action_033 =
    fun t ->
      (
# 156 "src/languages/zf/parser.mly"
    ( t )
# 980 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_034 =
    fun _endpos_u_ _startpos_t_ t u ->
      let _endpos = _endpos_u_ in
      let _startpos = _startpos_t_ in
      (
# 158 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.eq ~loc t u )
# 990 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_035 =
    fun _endpos_u_ _startpos_t_ t u ->
      let _endpos = _endpos_u_ in
      let _startpos = _startpos_t_ in
      (
# 160 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.neq ~loc [t; u] )
# 1000 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_036 =
    fun l ->
      (
# 277 "src/languages/zf/parser.mly"
                     ( l )
# 1008 "src/languages/zf/parser.ml"
       : (S.t list))
  
  let _menhir_action_037 =
    fun () ->
      (
# 273 "src/languages/zf/parser.mly"
                ( None )
# 1016 "src/languages/zf/parser.ml"
       : (S.t option))
  
  let _menhir_action_038 =
    fun s ->
      (
# 274 "src/languages/zf/parser.mly"
                ( Some s )
# 1024 "src/languages/zf/parser.ml"
       : (S.t option))
  
  let _menhir_action_039 =
    fun () ->
      (
# 216 "<standard.mly>"
    ( [] )
# 1032 "src/languages/zf/parser.ml"
       : (T.t list))
  
  let _menhir_action_040 =
    fun x xs ->
      (
# 219 "<standard.mly>"
    ( x :: xs )
# 1040 "src/languages/zf/parser.ml"
       : (T.t list))
  
  let _menhir_action_041 =
    fun () ->
      (
# 216 "<standard.mly>"
    ( [] )
# 1048 "src/languages/zf/parser.ml"
       : (T.t list))
  
  let _menhir_action_042 =
    fun x xs ->
      (
# 219 "<standard.mly>"
    ( x :: xs )
# 1056 "src/languages/zf/parser.ml"
       : (T.t list))
  
  let _menhir_action_043 =
    fun () ->
      (
# 216 "<standard.mly>"
    ( [] )
# 1064 "src/languages/zf/parser.ml"
       : (S.t list))
  
  let _menhir_action_044 =
    fun x xs ->
      (
# 219 "<standard.mly>"
    ( x :: xs )
# 1072 "src/languages/zf/parser.ml"
       : (S.t list))
  
  let _menhir_action_045 =
    fun () ->
      (
# 216 "<standard.mly>"
    ( [] )
# 1080 "src/languages/zf/parser.ml"
       : (T.t list))
  
  let _menhir_action_046 =
    fun x xs ->
      (
# 219 "<standard.mly>"
    ( x :: xs )
# 1088 "src/languages/zf/parser.ml"
       : (T.t list))
  
  let _menhir_action_047 =
    fun _endpos_vars_ _startpos_c_ c rhs vars ->
      (
# 88 "src/languages/zf/parser.mly"
    ( let pattern =
        let loc = L.mk_pos _startpos_c_ _endpos_vars_ in
        T.apply ~loc c vars
      in
      (pattern,rhs) )
# 1100 "src/languages/zf/parser.ml"
       : (T.t * T.t))
  
  let _menhir_action_048 =
    fun t ->
      (
# 116 "src/languages/zf/parser.mly"
    ( t )
# 1108 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_049 =
    fun _endpos_b_ _startpos_a_ a b ->
      let _endpos = _endpos_b_ in
      let _startpos = _startpos_a_ in
      (
# 118 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.mult ~loc a b )
# 1118 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_050 =
    fun l ->
      (
# 214 "src/languages/zf/parser.mly"
    ( l )
# 1126 "src/languages/zf/parser.ml"
       : (S.t list))
  
  let _menhir_action_051 =
    fun w ->
      (
# 18 "src/languages/zf/parser.mly"
    ( I.mk I.term w )
# 1134 "src/languages/zf/parser.ml"
       : (I.t))
  
  let _menhir_action_052 =
    fun w ->
      (
# 18 "src/languages/zf/parser.mly"
    ( I.mk I.term w )
# 1142 "src/languages/zf/parser.ml"
       : (I.t))
  
  let _menhir_action_053 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 1150 "src/languages/zf/parser.ml"
       : (T.t list))
  
  let _menhir_action_054 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 1158 "src/languages/zf/parser.ml"
       : (T.t list))
  
  let _menhir_action_055 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 1166 "src/languages/zf/parser.ml"
       : (T.t list))
  
  let _menhir_action_056 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 1174 "src/languages/zf/parser.ml"
       : (T.t list))
  
  let _menhir_action_057 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 1182 "src/languages/zf/parser.ml"
       : ((T.t * T.t) list))
  
  let _menhir_action_058 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 1190 "src/languages/zf/parser.ml"
       : ((T.t * T.t) list))
  
  let _menhir_action_059 =
    fun x ->
      (
# 228 "<standard.mly>"
    ( [ x ] )
# 1198 "src/languages/zf/parser.ml"
       : (T.t list))
  
  let _menhir_action_060 =
    fun x xs ->
      (
# 231 "<standard.mly>"
    ( x :: xs )
# 1206 "src/languages/zf/parser.ml"
       : (T.t list))
  
  let _menhir_action_061 =
    fun t ->
      (
# 150 "src/languages/zf/parser.mly"
    ( t )
# 1214 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_062 =
    fun _endpos_t_ _startpos__1_ t ->
      let _endpos = _endpos_t_ in
      let _startpos = _startpos__1_ in
      (
# 152 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.not_ ~loc t )
# 1224 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_063 =
    fun () ->
      (
# 111 "<standard.mly>"
    ( None )
# 1232 "src/languages/zf/parser.ml"
       : (unit option))
  
  let _menhir_action_064 =
    fun x ->
      (
# 114 "<standard.mly>"
    ( Some x )
# 1240 "src/languages/zf/parser.ml"
       : (unit option))
  
  let _menhir_action_065 =
    fun t ->
      (
# 170 "src/languages/zf/parser.mly"
    ( t )
# 1248 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_066 =
    fun _endpos_u_ _startpos_t_ t u ->
      let _endpos = _endpos_u_ in
      let _startpos = _startpos_t_ in
      (
# 172 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.or_ ~loc [t; u] )
# 1258 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_067 =
    fun _endpos_u_ _startpos_t_ t u ->
      let _endpos = _endpos_u_ in
      let _startpos = _startpos_t_ in
      (
# 174 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.imply ~loc t u )
# 1268 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_068 =
    fun _endpos_u_ _startpos_t_ t u ->
      let _endpos = _endpos_u_ in
      let _startpos = _startpos_t_ in
      (
# 176 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.equiv ~loc t u )
# 1278 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_069 =
    fun t ->
      (
# 128 "src/languages/zf/parser.mly"
    ( t )
# 1286 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_070 =
    fun _endpos_b_ _startpos_a_ a b ->
      let o = 
# 122 "src/languages/zf/parser.mly"
    ( T.add )
# 1294 "src/languages/zf/parser.ml"
       in
      let _endpos = _endpos_b_ in
      let _startpos = _startpos_a_ in
      (
# 130 "src/languages/zf/parser.mly"
    ( let loc = Some (L.mk_pos _startpos _endpos) in o ?loc a b )
# 1301 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_071 =
    fun _endpos_b_ _startpos_a_ a b ->
      let o = 
# 124 "src/languages/zf/parser.mly"
    ( T.sub )
# 1309 "src/languages/zf/parser.ml"
       in
      let _endpos = _endpos_b_ in
      let _startpos = _startpos_a_ in
      (
# 130 "src/languages/zf/parser.mly"
    ( let loc = Some (L.mk_pos _startpos _endpos) in o ?loc a b )
# 1316 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_072 =
    fun _endpos_s_ _startpos_s_ s ->
      let _endpos = _endpos_s_ in
      let _startpos = _startpos_s_ in
      (
# 22 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.const ~loc s )
# 1326 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_073 =
    fun x ->
      (
# 250 "<standard.mly>"
    ( [ x ] )
# 1334 "src/languages/zf/parser.ml"
       : (S.t list))
  
  let _menhir_action_074 =
    fun x xs ->
      (
# 253 "<standard.mly>"
    ( x :: xs )
# 1342 "src/languages/zf/parser.ml"
       : (S.t list))
  
  let _menhir_action_075 =
    fun x ->
      (
# 250 "<standard.mly>"
    ( [ x ] )
# 1350 "src/languages/zf/parser.ml"
       : (S.t list))
  
  let _menhir_action_076 =
    fun x xs ->
      (
# 253 "<standard.mly>"
    ( x :: xs )
# 1358 "src/languages/zf/parser.ml"
       : (S.t list))
  
  let _menhir_action_077 =
    fun x ->
      (
# 250 "<standard.mly>"
    ( [ x ] )
# 1366 "src/languages/zf/parser.ml"
       : (T.t list))
  
  let _menhir_action_078 =
    fun x xs ->
      (
# 253 "<standard.mly>"
    ( x :: xs )
# 1374 "src/languages/zf/parser.ml"
       : (T.t list))
  
  let _menhir_action_079 =
    fun x ->
      (
# 250 "<standard.mly>"
    ( [ x ] )
# 1382 "src/languages/zf/parser.ml"
       : (T.t list))
  
  let _menhir_action_080 =
    fun x xs ->
      (
# 253 "<standard.mly>"
    ( x :: xs )
# 1390 "src/languages/zf/parser.ml"
       : (T.t list))
  
  let _menhir_action_081 =
    fun x ->
      (
# 250 "<standard.mly>"
    ( [ x ] )
# 1398 "src/languages/zf/parser.ml"
       : ((I.t * T.t list) list))
  
  let _menhir_action_082 =
    fun x xs ->
      (
# 253 "<standard.mly>"
    ( x :: xs )
# 1406 "src/languages/zf/parser.ml"
       : ((I.t * T.t list) list))
  
  let _menhir_action_083 =
    fun _endpos__3_ _startpos__1_ s ->
      let _endpos = _endpos__3_ in
      let _startpos = _startpos__1_ in
      (
# 250 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.import ~loc s )
# 1416 "src/languages/zf/parser.ml"
       : (S.t))
  
  let _menhir_action_084 =
    fun _endpos__6_ _startpos__1_ attrs t v ->
      let _endpos = _endpos__6_ in
      let _startpos = _startpos__1_ in
      (
# 252 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.decl ~loc ~attrs v t )
# 1426 "src/languages/zf/parser.ml"
       : (S.t))
  
  let _menhir_action_085 =
    fun _endpos__4_ _startpos__1_ attrs l ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 254 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.defs ~loc ~attrs l )
# 1436 "src/languages/zf/parser.ml"
       : (S.t))
  
  let _menhir_action_086 =
    fun _endpos__4_ _startpos__1_ attrs t ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 256 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.rewrite ~loc ~attrs t )
# 1446 "src/languages/zf/parser.ml"
       : (S.t))
  
  let _menhir_action_087 =
    fun _endpos__4_ _startpos__1_ attrs t ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 258 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.assume ~loc ~attrs t )
# 1456 "src/languages/zf/parser.ml"
       : (S.t))
  
  let _menhir_action_088 =
    fun _endpos__4_ _startpos__1_ attrs t ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 260 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.lemma ~loc ~attrs t )
# 1466 "src/languages/zf/parser.ml"
       : (S.t))
  
  let _menhir_action_089 =
    fun _endpos__4_ _startpos__1_ attrs t ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 262 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.goal ~loc ~attrs t )
# 1476 "src/languages/zf/parser.ml"
       : (S.t))
  
  let _menhir_action_090 =
    fun _endpos__4_ _startpos__1_ attrs l ->
      let _endpos = _endpos__4_ in
      let _startpos = _startpos__1_ in
      (
# 264 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.data ~loc ~attrs l )
# 1486 "src/languages/zf/parser.ml"
       : (S.t))
  
  let _menhir_action_091 =
    fun _endpos__1_ _startpos__1_ ->
      let _endpos = _endpos__1_ in
      let _startpos = _startpos__1_ in
      (
# 30 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.tType ~loc () )
# 1496 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_092 =
    fun t ->
      (
# 180 "src/languages/zf/parser.mly"
    ( t )
# 1504 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_093 =
    fun _endpos_t_ _startpos__1_ t vars ->
      let _endpos = _endpos_t_ in
      let _startpos = _startpos__1_ in
      (
# 182 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.forall ~loc vars t )
# 1514 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_094 =
    fun _endpos_t_ _startpos__1_ t vars ->
      let _endpos = _endpos_t_ in
      let _startpos = _startpos__1_ in
      (
# 184 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.exists ~loc vars t )
# 1524 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_095 =
    fun _endpos_t_ _startpos__1_ t vars ->
      let _endpos = _endpos_t_ in
      let _startpos = _startpos__1_ in
      (
# 186 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.lambda ~loc vars t )
# 1534 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_096 =
    fun _endpos_u_ _startpos_t_ t u ->
      let _endpos = _endpos_u_ in
      let _startpos = _startpos_t_ in
      (
# 188 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.arrow ~loc t u )
# 1544 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_097 =
    fun _endpos_t_ _startpos__1_ t vars ->
      let _endpos = _endpos_t_ in
      let _startpos = _startpos__1_ in
      (
# 190 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.pi ~loc vars t )
# 1554 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_098 =
    fun _endpos_c_ _startpos__1_ a b c ->
      let _endpos = _endpos_c_ in
      let _startpos = _startpos__1_ in
      (
# 192 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.ite ~loc a b c )
# 1564 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_099 =
    fun _endpos_l_ _startpos_t_ l t vars ->
      let _endpos = _endpos_l_ in
      let _startpos = _startpos_t_ in
      (
# 210 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in S.inductive ~loc t vars l )
# 1574 "src/languages/zf/parser.ml"
       : (S.t))
  
  let _menhir_action_100 =
    fun v ->
      (
# 53 "src/languages/zf/parser.mly"
    ( [ v ] )
# 1582 "src/languages/zf/parser.ml"
       : (T.t list))
  
  let _menhir_action_101 =
    fun _endpos_ty_ _startpos_v_ ty v ->
      let _endpos = _endpos_ty_ in
      let _startpos = _startpos_v_ in
      (
# 55 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      [ T.colon ~loc v ty ]
    )
# 1594 "src/languages/zf/parser.ml"
       : (T.t list))
  
  let _menhir_action_102 =
    fun _endpos__5_ _startpos__1_ l ty ->
      let _endpos = _endpos__5_ in
      let _startpos = _startpos__1_ in
      (
# 59 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      List.map (fun x -> T.colon ~loc x ty) l
    )
# 1606 "src/languages/zf/parser.ml"
       : (T.t list))
  
  let _menhir_action_103 =
    fun l ->
      (
# 65 "src/languages/zf/parser.mly"
    ( l )
# 1614 "src/languages/zf/parser.ml"
       : (T.t list))
  
  let _menhir_action_104 =
    fun l l2 ->
      (
# 67 "src/languages/zf/parser.mly"
    ( l @ l2 )
# 1622 "src/languages/zf/parser.ml"
       : (T.t list))
  
  let _menhir_action_105 =
    fun v ->
      (
# 40 "src/languages/zf/parser.mly"
    ( [ v ] )
# 1630 "src/languages/zf/parser.ml"
       : (T.t list))
  
  let _menhir_action_106 =
    fun v ->
      (
# 40 "src/languages/zf/parser.mly"
    ( [ v ] )
# 1638 "src/languages/zf/parser.ml"
       : (T.t list))
  
  let _menhir_action_107 =
    fun _endpos__5_ _startpos__1_ l t ->
      let _endpos = _endpos__5_ in
      let _startpos = _startpos__1_ in
      (
# 42 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in
      List.map (fun x -> T.colon ~loc x t) l )
# 1649 "src/languages/zf/parser.ml"
       : (T.t list))
  
  let _menhir_action_108 =
    fun l ->
      (
# 47 "src/languages/zf/parser.mly"
    ( l )
# 1657 "src/languages/zf/parser.ml"
       : (T.t list))
  
  let _menhir_action_109 =
    fun l l2 ->
      (
# 49 "src/languages/zf/parser.mly"
    ( l @ l2 )
# 1665 "src/languages/zf/parser.ml"
       : (T.t list))
  
  let _menhir_action_110 =
    fun v ->
      (
# 72 "src/languages/zf/parser.mly"
    ( v )
# 1673 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_111 =
    fun v ->
      (
# 72 "src/languages/zf/parser.mly"
    ( v )
# 1681 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_112 =
    fun v ->
      (
# 35 "src/languages/zf/parser.mly"
    ( v )
# 1689 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_113 =
    fun v ->
      (
# 35 "src/languages/zf/parser.mly"
    ( v )
# 1697 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_action_114 =
    fun _endpos__1_ _startpos__1_ ->
      let _endpos = _endpos__1_ in
      let _startpos = _startpos__1_ in
      (
# 26 "src/languages/zf/parser.mly"
    ( let loc = L.mk_pos _startpos _endpos in T.wildcard ~loc () )
# 1707 "src/languages/zf/parser.ml"
       : (T.t))
  
  let _menhir_print_token : token -> string =
    fun _tok ->
      match _tok with
      | Tokens.AND ->
          "AND"
      | Tokens.ARITH_GEQ ->
          "ARITH_GEQ"
      | Tokens.ARITH_GT ->
          "ARITH_GT"
      | Tokens.ARITH_LEQ ->
          "ARITH_LEQ"
      | Tokens.ARITH_LT ->
          "ARITH_LT"
      | Tokens.ARITH_MINUS ->
          "ARITH_MINUS"
      | Tokens.ARITH_PLUS ->
          "ARITH_PLUS"
      | Tokens.ARITH_PRODUCT ->
          "ARITH_PRODUCT"
      | Tokens.ARROW ->
          "ARROW"
      | Tokens.ASSERT ->
          "ASSERT"
      | Tokens.COLON ->
          "COLON"
      | Tokens.COMMA ->
          "COMMA"
      | Tokens.DATA ->
          "DATA"
      | Tokens.DEF ->
          "DEF"
      | Tokens.DOT ->
          "DOT"
      | Tokens.ELSE ->
          "ELSE"
      | Tokens.END ->
          "END"
      | Tokens.EOF ->
          "EOF"
      | Tokens.EQDEF ->
          "EQDEF"
      | Tokens.FUN ->
          "FUN"
      | Tokens.GOAL ->
          "GOAL"
      | Tokens.IF ->
          "IF"
      | Tokens.INCLUDE ->
          "INCLUDE"
      | Tokens.INT ->
          "INT"
      | Tokens.INTEGER _ ->
          "INTEGER"
      | Tokens.LEFT_BRACKET ->
          "LEFT_BRACKET"
      | Tokens.LEFT_PAREN ->
          "LEFT_PAREN"
      | Tokens.LEMMA ->
          "LEMMA"
      | Tokens.LOGIC_AND ->
          "LOGIC_AND"
      | Tokens.LOGIC_EQ ->
          "LOGIC_EQ"
      | Tokens.LOGIC_EQUIV ->
          "LOGIC_EQUIV"
      | Tokens.LOGIC_EXISTS ->
          "LOGIC_EXISTS"
      | Tokens.LOGIC_FALSE ->
          "LOGIC_FALSE"
      | Tokens.LOGIC_FORALL ->
          "LOGIC_FORALL"
      | Tokens.LOGIC_IMPLY ->
          "LOGIC_IMPLY"
      | Tokens.LOGIC_NEQ ->
          "LOGIC_NEQ"
      | Tokens.LOGIC_NOT ->
          "LOGIC_NOT"
      | Tokens.LOGIC_OR ->
          "LOGIC_OR"
      | Tokens.LOGIC_TRUE ->
          "LOGIC_TRUE"
      | Tokens.LOWER_WORD _ ->
          "LOWER_WORD"
      | Tokens.MATCH ->
          "MATCH"
      | Tokens.PI ->
          "PI"
      | Tokens.PROP ->
          "PROP"
      | Tokens.QUOTED _ ->
          "QUOTED"
      | Tokens.REWRITE ->
          "REWRITE"
      | Tokens.RIGHT_BRACKET ->
          "RIGHT_BRACKET"
      | Tokens.RIGHT_PAREN ->
          "RIGHT_PAREN"
      | Tokens.SEMI_COLON ->
          "SEMI_COLON"
      | Tokens.THEN ->
          "THEN"
      | Tokens.TYPE ->
          "TYPE"
      | Tokens.UPPER_WORD _ ->
          "UPPER_WORD"
      | Tokens.VAL ->
          "VAL"
      | Tokens.VERTICAL_BAR ->
          "VERTICAL_BAR"
      | Tokens.WHERE ->
          "WHERE"
      | Tokens.WILDCARD ->
          "WILDCARD"
      | Tokens.WITH ->
          "WITH"
  
  let _menhir_fail : unit -> 'a =
    fun () ->
      Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
      assert false
  
  include struct
    
    [@@@ocaml.warning "-4-37"]
    
    let _menhir_goto_input : type  ttv_stack. ttv_stack -> _ -> _menhir_box_input =
      fun _menhir_stack _v ->
        MenhirBox_input _v
    
    let _menhir_run_245 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_input =
      fun _menhir_stack _v ->
        let s = _v in
        let _v = _menhir_action_038 s in
        _menhir_goto_input _menhir_stack _v
    
    let _menhir_run_207 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_file =
      fun _menhir_stack _v ->
        let l = _v in
        let _v = _menhir_action_036 l in
        MenhirBox_file _v
    
    let rec _menhir_run_206 : type  ttv_stack. (ttv_stack, _menhir_box_file) _menhir_cell1_statement -> _ -> _menhir_box_file =
      fun _menhir_stack _v ->
        let MenhirCell1_statement (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_044 x xs in
        _menhir_goto_list_statement_ _menhir_stack _v _menhir_s
    
    and _menhir_goto_list_statement_ : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _v _menhir_s ->
        match _menhir_s with
        | MenhirState000 ->
            _menhir_run_207 _menhir_stack _v
        | MenhirState205 ->
            _menhir_run_206 _menhir_stack _v
        | _ ->
            _menhir_fail ()
    
    let rec _menhir_run_001 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_VAL (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_BRACKET ->
            _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState001
        | Tokens.LOWER_WORD _ | Tokens.UPPER_WORD _ ->
            let _v = _menhir_action_023 () in
            _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState001 _tok
        | _ ->
            _eRR 1
    
    and _menhir_run_002 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _menhir_stack = MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s) in
        let _menhir_s = MenhirState002 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.QUOTED _v ->
            _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LEFT_PAREN ->
            _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 2
    
    and _menhir_run_003 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_w_, _startpos_w_, w) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_052 w in
        _menhir_goto_name _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_w_ _startpos_w_ _v _menhir_s _tok
    
    and _menhir_goto_name : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState212 ->
            _menhir_run_213 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState195 ->
            _menhir_run_190 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState188 ->
            _menhir_run_190 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState238 ->
            _menhir_run_182 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState178 ->
            _menhir_run_182 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState180 ->
            _menhir_run_182 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState234 ->
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState175 ->
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState161 ->
            _menhir_run_164 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState021 ->
            _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState242 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState229 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState222 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState218 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState214 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState202 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState192 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState190 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState182 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState183 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState165 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState172 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState167 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState169 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState157 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState150 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState146 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState023 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState027 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState138 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState037 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState038 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState124 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState131 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState125 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState127 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState040 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState042 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState043 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState117 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState044 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState046 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState047 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState050 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState053 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState109 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState111 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState054 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState105 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState103 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState101 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState099 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState096 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState093 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState056 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState090 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState087 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState083 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState081 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState079 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState077 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState075 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState072 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState069 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState064 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState062 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState057 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState028 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState029 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState019 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState002 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState006 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState011 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState007 ->
            _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_213 : type  ttv_stack. (((ttv_stack, _menhir_box_input) _menhir_cell1_VAL, _menhir_box_input) _menhir_cell1_attrs as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_name (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COLON ->
            let _menhir_s = MenhirState214 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.WILDCARD ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.TYPE ->
                _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.PROP ->
                _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.PI ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOGIC_TRUE ->
                _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_NOT ->
                _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_FORALL ->
                _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_FALSE ->
                _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_EXISTS ->
                _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INT ->
                _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.IF ->
                _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FUN ->
                _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ARITH_MINUS ->
                _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 214)
        | _ ->
            _eRR 213
    
    and _menhir_run_024 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_114 _endpos__1_ _startpos__1_ in
        _menhir_goto_wildcard _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_goto_wildcard : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState127 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState125 ->
            _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState242 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState229 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState222 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState218 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState214 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState202 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState192 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState190 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState172 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState169 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState167 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState165 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState157 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState150 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState146 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState023 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState037 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState131 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState038 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState040 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState042 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState117 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState046 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState050 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState111 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState109 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState053 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState103 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState101 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState099 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState096 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState093 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState090 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState087 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState083 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState081 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState079 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState077 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState075 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState072 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState069 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState056 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState064 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState062 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState057 ->
            _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState043 ->
            _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState105 ->
            _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState054 ->
            _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState047 ->
            _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_126 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        let v = _v in
        let _v = _menhir_action_113 v in
        _menhir_goto_var_or_wildcard _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
    
    and _menhir_goto_var_or_wildcard : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_var_or_wildcard (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.WILDCARD ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState127
        | Tokens.UPPER_WORD _v_0 ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState127
        | Tokens.LOWER_WORD _v_1 ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState127
        | Tokens.ARROW ->
            let _v_2 = _menhir_action_045 () in
            _menhir_run_129 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v_2
        | _ ->
            _eRR 127
    
    and _menhir_run_005 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_w_, _startpos_w_, w) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_051 w in
        _menhir_goto_name _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_w_ _startpos_w_ _v _menhir_s _tok
    
    and _menhir_run_129 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_var_or_wildcard -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v ->
        let MenhirCell1_var_or_wildcard (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let (_endpos_xs_, xs) = (_endpos, _v) in
        let _v = _menhir_action_046 x xs in
        _menhir_goto_list_var_or_wildcard_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_xs_ _v _menhir_s
    
    and _menhir_goto_list_var_or_wildcard_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s ->
        match _menhir_s with
        | MenhirState125 ->
            _menhir_run_130 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s
        | MenhirState127 ->
            _menhir_run_129 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_130 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_VERTICAL_BAR, ttv_result) _menhir_cell1_raw_var as 'stack) -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s ->
        let _menhir_stack = MenhirCell1_list_var_or_wildcard_ (_menhir_stack, _menhir_s, _v, _endpos) in
        let _menhir_s = MenhirState131 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.WILDCARD ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.UPPER_WORD _v ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.TYPE ->
            _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.PROP ->
            _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.PI ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LOGIC_TRUE ->
            _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_NOT ->
            _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_FORALL ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_FALSE ->
            _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_EXISTS ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFT_PAREN ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.INT ->
            _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.IF ->
            _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FUN ->
            _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ARITH_MINUS ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 131
    
    and _menhir_run_025 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_024 _endpos__1_ _startpos__1_ in
        _menhir_goto_const _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_goto_const : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_016 t in
        _menhir_goto_atomic_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _startpos_t_ _v _menhir_s _tok
    
    and _menhir_goto_atomic_term : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState192 ->
            _menhir_run_192 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState190 ->
            _menhir_run_192 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState064 ->
            _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState062 ->
            _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState242 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState229 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState222 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState218 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState214 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState202 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState165 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState172 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState167 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState169 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState157 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState150 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState146 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState023 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState037 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState038 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState131 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState040 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState042 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState117 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState046 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState050 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState053 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState109 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState111 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState103 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState101 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState099 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState096 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState056 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState093 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState090 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState087 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState083 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState081 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState079 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState069 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState077 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState075 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState072 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState057 ->
            _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_192 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_atomic_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.WILDCARD ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState192
        | Tokens.UPPER_WORD _v_0 ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState192
        | Tokens.TYPE ->
            _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState192
        | Tokens.PROP ->
            _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState192
        | Tokens.MATCH ->
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState192
        | Tokens.LOWER_WORD _v_1 ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState192
        | Tokens.LOGIC_TRUE ->
            _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState192
        | Tokens.LOGIC_FALSE ->
            _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState192
        | Tokens.LEFT_PAREN ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState192
        | Tokens.INTEGER _v_2 ->
            _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState192
        | Tokens.INT ->
            _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState192
        | Tokens.AND | Tokens.DOT | Tokens.VERTICAL_BAR ->
            let _v_3 = _menhir_action_039 () in
            _menhir_run_193 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v_3 _tok
        | _ ->
            _eRR 192
    
    and _menhir_run_026 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_025 _endpos__1_ _startpos__1_ in
        _menhir_goto_const _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_038 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_MATCH (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState038 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.WILDCARD ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.UPPER_WORD _v ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.TYPE ->
            _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.PROP ->
            _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.PI ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LOGIC_TRUE ->
            _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_NOT ->
            _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_FORALL ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_FALSE ->
            _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_EXISTS ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFT_PAREN ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.INT ->
            _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.IF ->
            _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FUN ->
            _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ARITH_MINUS ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 38
    
    and _menhir_run_027 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_PI (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState027 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LEFT_PAREN ->
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 27
    
    and _menhir_run_028 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState028 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 28
    
    and _menhir_run_039 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_027 _endpos__1_ _startpos__1_ in
        _menhir_goto_const _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_040 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_LOGIC_NOT (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState040 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.WILDCARD ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.UPPER_WORD _v ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.TYPE ->
            _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.PROP ->
            _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LOGIC_TRUE ->
            _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_FALSE ->
            _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFT_PAREN ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.INT ->
            _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ARITH_MINUS ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 40
    
    and _menhir_run_041 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_028 _endpos__1_ _startpos__1_ in
        _menhir_goto_const _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_042 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState042 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.WILDCARD ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.UPPER_WORD _v ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.TYPE ->
            _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.PROP ->
            _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.PI ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LOGIC_TRUE ->
            _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_NOT ->
            _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_FORALL ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_FALSE ->
            _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_EXISTS ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFT_PAREN ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.INT ->
            _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.IF ->
            _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FUN ->
            _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ARITH_MINUS ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 42
    
    and _menhir_run_043 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_LOGIC_FORALL (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState043 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.WILDCARD ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.UPPER_WORD _v ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LEFT_PAREN ->
            _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 43
    
    and _menhir_run_044 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState044 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 44
    
    and _menhir_run_047 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_LOGIC_EXISTS (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState047 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.WILDCARD ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.UPPER_WORD _v ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LEFT_PAREN ->
            _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 47
    
    and _menhir_run_051 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_i_, _startpos_i_, i) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_017 _endpos_i_ _startpos_i_ i in
        _menhir_goto_atomic_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_i_ _startpos_i_ _v _menhir_s _tok
    
    and _menhir_run_052 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_026 _endpos__1_ _startpos__1_ in
        _menhir_goto_const _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_053 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState053 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.WILDCARD ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.UPPER_WORD _v ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.TYPE ->
            _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.PROP ->
            _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.PI ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LOGIC_TRUE ->
            _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_NOT ->
            _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_FORALL ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_FALSE ->
            _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_EXISTS ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFT_PAREN ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.INT ->
            _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.IF ->
            _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FUN ->
            _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ARITH_MINUS ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 53
    
    and _menhir_run_054 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_FUN (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState054 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.WILDCARD ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.UPPER_WORD _v ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LEFT_PAREN ->
            _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 54
    
    and _menhir_run_057 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_ARITH_MINUS (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState057 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.WILDCARD ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.UPPER_WORD _v ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.TYPE ->
            _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.PROP ->
            _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LOGIC_TRUE ->
            _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_FALSE ->
            _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFT_PAREN ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.INT ->
            _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ARITH_MINUS ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 57
    
    and _menhir_run_193 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_atomic_term -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_atomic_term (_menhir_stack, _menhir_s, x, _, _) = _menhir_stack in
        let (_endpos_xs_, xs) = (_endpos, _v) in
        let _v = _menhir_action_040 x xs in
        _menhir_goto_list_atomic_term_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_xs_ _v _menhir_s _tok
    
    and _menhir_goto_list_atomic_term_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState192 ->
            _menhir_run_193 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState190 ->
            _menhir_run_191 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_191 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_name -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_name (_menhir_stack, _menhir_s, v, _, _) = _menhir_stack in
        let (_endpos_l_, l) = (_endpos, _v) in
        let _v = _menhir_action_029 l v in
        let _endpos = _endpos_l_ in
        match (_tok : MenhirBasics.token) with
        | Tokens.VERTICAL_BAR ->
            let _menhir_stack = MenhirCell1_constructor (_menhir_stack, _menhir_s, _v, _endpos) in
            let _menhir_s = MenhirState195 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 195)
        | Tokens.AND | Tokens.DOT ->
            let (_endpos_x_, x) = (_endpos, _v) in
            let _v = _menhir_action_081 x in
            _menhir_goto_separated_nonempty_list_VERTICAL_BAR_constructor_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_goto_separated_nonempty_list_VERTICAL_BAR_constructor_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState195 ->
            _menhir_run_196 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState188 ->
            _menhir_run_189 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_196 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_constructor -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_constructor (_menhir_stack, _menhir_s, x, _) = _menhir_stack in
        let (_endpos_xs_, xs) = (_endpos, _v) in
        let _v = _menhir_action_082 x xs in
        _menhir_goto_separated_nonempty_list_VERTICAL_BAR_constructor_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_xs_ _v _menhir_s _tok
    
    and _menhir_run_189 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_name, ttv_result) _menhir_cell1_list_raw_var_ _menhir_cell0_option_VERTICAL_BAR_ -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell0_option_VERTICAL_BAR_ (_menhir_stack, _) = _menhir_stack in
        let (_endpos_l_, l) = (_endpos, _v) in
        let _v = _menhir_action_030 l in
        let _endpos = _endpos_l_ in
        let MenhirCell1_list_raw_var_ (_menhir_stack, _, vars) = _menhir_stack in
        let MenhirCell1_name (_menhir_stack, _menhir_s, t, _startpos_t_, _) = _menhir_stack in
        let (_endpos_l_, l) = (_endpos, _v) in
        let _v = _menhir_action_099 _endpos_l_ _startpos_t_ l t vars in
        match (_tok : MenhirBasics.token) with
        | Tokens.AND ->
            let _menhir_stack = MenhirCell1_type_def (_menhir_stack, _menhir_s, _v) in
            let _menhir_s = MenhirState180 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 180)
        | Tokens.DOT ->
            let x = _v in
            let _v = _menhir_action_075 x in
            _menhir_goto_separated_nonempty_list_AND_type_def_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_goto_separated_nonempty_list_AND_type_def_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState238 ->
            _menhir_run_198 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState178 ->
            _menhir_run_198 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState180 ->
            _menhir_run_181 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_198 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_DATA, ttv_result) _menhir_cell1_attrs as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let l = _v in
        let _v = _menhir_action_050 l in
        _menhir_goto_mutual_types _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_mutual_types : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_DATA, ttv_result) _menhir_cell1_attrs as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState238 ->
            _menhir_run_239 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState178 ->
            _menhir_run_199 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_239 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_DATA, _menhir_box_input) _menhir_cell1_attrs -> _ -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let MenhirCell1_attrs (_menhir_stack, _, attrs) = _menhir_stack in
        let MenhirCell1_DATA (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (l, _endpos__4_) = (_v, _endpos) in
        let _v = _menhir_action_090 _endpos__4_ _startpos__1_ attrs l in
        _menhir_goto_statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_statement : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState210 ->
            _menhir_run_245 _menhir_stack _v
        | MenhirState205 ->
            _menhir_run_205 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState000 ->
            _menhir_run_205 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_205 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_statement (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.VAL ->
            _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState205
        | Tokens.REWRITE ->
            _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState205
        | Tokens.LEMMA ->
            _menhir_run_149 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState205
        | Tokens.INCLUDE ->
            _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState205
        | Tokens.GOAL ->
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState205
        | Tokens.DEF ->
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState205
        | Tokens.DATA ->
            _menhir_run_177 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState205
        | Tokens.ASSERT ->
            _menhir_run_201 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState205
        | Tokens.EOF ->
            let _v_0 = _menhir_action_043 () in
            _menhir_run_206 _menhir_stack _v_0
        | _ ->
            _eRR 205
    
    and _menhir_run_145 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_REWRITE (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_BRACKET ->
            _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState145
        | Tokens.ARITH_MINUS | Tokens.FUN | Tokens.IF | Tokens.INT | Tokens.INTEGER _ | Tokens.LEFT_PAREN | Tokens.LOGIC_EXISTS | Tokens.LOGIC_FALSE | Tokens.LOGIC_FORALL | Tokens.LOGIC_NOT | Tokens.LOGIC_TRUE | Tokens.LOWER_WORD _ | Tokens.MATCH | Tokens.PI | Tokens.PROP | Tokens.TYPE | Tokens.UPPER_WORD _ | Tokens.WILDCARD ->
            let _v = _menhir_action_023 () in
            _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState145 _tok
        | _ ->
            _eRR 145
    
    and _menhir_run_146 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_REWRITE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_attrs (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.WILDCARD ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState146
        | Tokens.UPPER_WORD _v_0 ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState146
        | Tokens.TYPE ->
            _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState146
        | Tokens.PROP ->
            _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState146
        | Tokens.PI ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState146
        | Tokens.MATCH ->
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState146
        | Tokens.LOWER_WORD _v_1 ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState146
        | Tokens.LOGIC_TRUE ->
            _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState146
        | Tokens.LOGIC_NOT ->
            _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState146
        | Tokens.LOGIC_FORALL ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState146
        | Tokens.LOGIC_FALSE ->
            _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState146
        | Tokens.LOGIC_EXISTS ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState146
        | Tokens.LEFT_PAREN ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState146
        | Tokens.INTEGER _v_2 ->
            _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState146
        | Tokens.INT ->
            _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState146
        | Tokens.IF ->
            _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState146
        | Tokens.FUN ->
            _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState146
        | Tokens.ARITH_MINUS ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState146
        | _ ->
            _eRR 146
    
    and _menhir_run_149 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_LEMMA (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_BRACKET ->
            _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState149
        | Tokens.ARITH_MINUS | Tokens.FUN | Tokens.IF | Tokens.INT | Tokens.INTEGER _ | Tokens.LEFT_PAREN | Tokens.LOGIC_EXISTS | Tokens.LOGIC_FALSE | Tokens.LOGIC_FORALL | Tokens.LOGIC_NOT | Tokens.LOGIC_TRUE | Tokens.LOWER_WORD _ | Tokens.MATCH | Tokens.PI | Tokens.PROP | Tokens.TYPE | Tokens.UPPER_WORD _ | Tokens.WILDCARD ->
            let _v = _menhir_action_023 () in
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState149 _tok
        | _ ->
            _eRR 149
    
    and _menhir_run_150 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LEMMA as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_attrs (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.WILDCARD ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState150
        | Tokens.UPPER_WORD _v_0 ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState150
        | Tokens.TYPE ->
            _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState150
        | Tokens.PROP ->
            _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState150
        | Tokens.PI ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState150
        | Tokens.MATCH ->
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState150
        | Tokens.LOWER_WORD _v_1 ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState150
        | Tokens.LOGIC_TRUE ->
            _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState150
        | Tokens.LOGIC_NOT ->
            _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState150
        | Tokens.LOGIC_FORALL ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState150
        | Tokens.LOGIC_FALSE ->
            _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState150
        | Tokens.LOGIC_EXISTS ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState150
        | Tokens.LEFT_PAREN ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState150
        | Tokens.INTEGER _v_2 ->
            _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState150
        | Tokens.INT ->
            _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState150
        | Tokens.IF ->
            _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState150
        | Tokens.FUN ->
            _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState150
        | Tokens.ARITH_MINUS ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState150
        | _ ->
            _eRR 150
    
    and _menhir_run_153 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.QUOTED _v ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.DOT ->
                let _endpos_1 = _menhir_lexbuf.Lexing.lex_curr_p in
                let _tok = _menhir_lexer _menhir_lexbuf in
                let (_startpos__1_, s, _endpos__3_) = (_startpos, _v, _endpos_1) in
                let _v = _menhir_action_083 _endpos__3_ _startpos__1_ s in
                _menhir_goto_statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
            | _ ->
                _eRR 154)
        | _ ->
            _eRR 153
    
    and _menhir_run_156 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_GOAL (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_BRACKET ->
            _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState156
        | Tokens.ARITH_MINUS | Tokens.FUN | Tokens.IF | Tokens.INT | Tokens.INTEGER _ | Tokens.LEFT_PAREN | Tokens.LOGIC_EXISTS | Tokens.LOGIC_FALSE | Tokens.LOGIC_FORALL | Tokens.LOGIC_NOT | Tokens.LOGIC_TRUE | Tokens.LOWER_WORD _ | Tokens.MATCH | Tokens.PI | Tokens.PROP | Tokens.TYPE | Tokens.UPPER_WORD _ | Tokens.WILDCARD ->
            let _v = _menhir_action_023 () in
            _menhir_run_157 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState156 _tok
        | _ ->
            _eRR 156
    
    and _menhir_run_157 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_GOAL as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_attrs (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.WILDCARD ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState157
        | Tokens.UPPER_WORD _v_0 ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState157
        | Tokens.TYPE ->
            _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState157
        | Tokens.PROP ->
            _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState157
        | Tokens.PI ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState157
        | Tokens.MATCH ->
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState157
        | Tokens.LOWER_WORD _v_1 ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState157
        | Tokens.LOGIC_TRUE ->
            _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState157
        | Tokens.LOGIC_NOT ->
            _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState157
        | Tokens.LOGIC_FORALL ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState157
        | Tokens.LOGIC_FALSE ->
            _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState157
        | Tokens.LOGIC_EXISTS ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState157
        | Tokens.LEFT_PAREN ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState157
        | Tokens.INTEGER _v_2 ->
            _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState157
        | Tokens.INT ->
            _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState157
        | Tokens.IF ->
            _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState157
        | Tokens.FUN ->
            _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState157
        | Tokens.ARITH_MINUS ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState157
        | _ ->
            _eRR 157
    
    and _menhir_run_160 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_DEF (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_BRACKET ->
            _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState160
        | Tokens.LOWER_WORD _ | Tokens.UPPER_WORD _ ->
            let _v = _menhir_action_023 () in
            _menhir_run_161 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState160 _tok
        | _ ->
            _eRR 160
    
    and _menhir_run_161 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_DEF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_attrs (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v_0 ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState161
        | Tokens.LOWER_WORD _v_1 ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState161
        | _ ->
            _eRR 161
    
    and _menhir_run_177 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_DATA (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_BRACKET ->
            _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState177
        | Tokens.LOWER_WORD _ | Tokens.UPPER_WORD _ ->
            let _v = _menhir_action_023 () in
            _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState177 _tok
        | _ ->
            _eRR 177
    
    and _menhir_run_178 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_DATA as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_attrs (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v_0 ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState178
        | Tokens.LOWER_WORD _v_1 ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState178
        | _ ->
            _eRR 178
    
    and _menhir_run_201 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_file) _menhir_state -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_ASSERT (_menhir_stack, _menhir_s, _startpos) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.LEFT_BRACKET ->
            _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState201
        | Tokens.ARITH_MINUS | Tokens.FUN | Tokens.IF | Tokens.INT | Tokens.INTEGER _ | Tokens.LEFT_PAREN | Tokens.LOGIC_EXISTS | Tokens.LOGIC_FALSE | Tokens.LOGIC_FORALL | Tokens.LOGIC_NOT | Tokens.LOGIC_TRUE | Tokens.LOWER_WORD _ | Tokens.MATCH | Tokens.PI | Tokens.PROP | Tokens.TYPE | Tokens.UPPER_WORD _ | Tokens.WILDCARD ->
            let _v = _menhir_action_023 () in
            _menhir_run_202 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState201 _tok
        | _ ->
            _eRR 201
    
    and _menhir_run_202 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_ASSERT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_attrs (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.WILDCARD ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
        | Tokens.UPPER_WORD _v_0 ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState202
        | Tokens.TYPE ->
            _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
        | Tokens.PROP ->
            _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
        | Tokens.PI ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
        | Tokens.MATCH ->
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
        | Tokens.LOWER_WORD _v_1 ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState202
        | Tokens.LOGIC_TRUE ->
            _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
        | Tokens.LOGIC_NOT ->
            _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
        | Tokens.LOGIC_FORALL ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
        | Tokens.LOGIC_FALSE ->
            _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
        | Tokens.LOGIC_EXISTS ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
        | Tokens.LEFT_PAREN ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
        | Tokens.INTEGER _v_2 ->
            _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState202
        | Tokens.INT ->
            _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
        | Tokens.IF ->
            _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
        | Tokens.FUN ->
            _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
        | Tokens.ARITH_MINUS ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState202
        | _ ->
            _eRR 202
    
    and _menhir_run_199 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_DATA, _menhir_box_file) _menhir_cell1_attrs -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell1_attrs (_menhir_stack, _, attrs) = _menhir_stack in
        let MenhirCell1_DATA (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (l, _endpos__4_) = (_v, _endpos) in
        let _v = _menhir_action_090 _endpos__4_ _startpos__1_ attrs l in
        _menhir_goto_statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_181 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_type_def -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let MenhirCell1_type_def (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_076 x xs in
        _menhir_goto_separated_nonempty_list_AND_type_def_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_064 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_atomic_term as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.WILDCARD ->
            let _menhir_stack = MenhirCell1_atomic_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
        | Tokens.UPPER_WORD _v_0 ->
            let _menhir_stack = MenhirCell1_atomic_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState064
        | Tokens.TYPE ->
            let _menhir_stack = MenhirCell1_atomic_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
        | Tokens.PROP ->
            let _menhir_stack = MenhirCell1_atomic_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
        | Tokens.MATCH ->
            let _menhir_stack = MenhirCell1_atomic_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
        | Tokens.LOWER_WORD _v_1 ->
            let _menhir_stack = MenhirCell1_atomic_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState064
        | Tokens.LOGIC_TRUE ->
            let _menhir_stack = MenhirCell1_atomic_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
        | Tokens.LOGIC_FALSE ->
            let _menhir_stack = MenhirCell1_atomic_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
        | Tokens.LEFT_PAREN ->
            let _menhir_stack = MenhirCell1_atomic_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
        | Tokens.INTEGER _v_2 ->
            let _menhir_stack = MenhirCell1_atomic_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState064
        | Tokens.INT ->
            let _menhir_stack = MenhirCell1_atomic_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
        | Tokens.AND | Tokens.ARITH_GEQ | Tokens.ARITH_GT | Tokens.ARITH_LEQ | Tokens.ARITH_LT | Tokens.ARITH_MINUS | Tokens.ARITH_PLUS | Tokens.ARITH_PRODUCT | Tokens.ARROW | Tokens.DOT | Tokens.ELSE | Tokens.END | Tokens.EQDEF | Tokens.LOGIC_AND | Tokens.LOGIC_EQ | Tokens.LOGIC_EQUIV | Tokens.LOGIC_IMPLY | Tokens.LOGIC_NEQ | Tokens.LOGIC_OR | Tokens.RIGHT_PAREN | Tokens.SEMI_COLON | Tokens.THEN | Tokens.VERTICAL_BAR | Tokens.WHERE | Tokens.WITH ->
            let (_endpos_x_, x) = (_endpos, _v) in
            let _v = _menhir_action_055 x in
            _menhir_goto_nonempty_list_atomic_term_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _v _menhir_s _tok
        | _ ->
            _eRR 64
    
    and _menhir_goto_nonempty_list_atomic_term_ : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_atomic_term as 'stack) -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState064 ->
            _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState062 ->
            _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_065 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_atomic_term, ttv_result) _menhir_cell1_atomic_term -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_atomic_term (_menhir_stack, _menhir_s, x, _, _) = _menhir_stack in
        let (_endpos_xs_, xs) = (_endpos, _v) in
        let _v = _menhir_action_056 x xs in
        _menhir_goto_nonempty_list_atomic_term_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_xs_ _v _menhir_s _tok
    
    and _menhir_run_063 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_atomic_term -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_atomic_term (_menhir_stack, _menhir_s, t, _startpos_t_, _) = _menhir_stack in
        let (_endpos_u_, u) = (_endpos, _v) in
        let _v = _menhir_action_005 _endpos_u_ _startpos_t_ t u in
        _menhir_goto_apply_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_u_ _startpos_t_ _v _menhir_s _tok
    
    and _menhir_goto_apply_term : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState242 ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState229 ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState222 ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState218 ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState214 ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState202 ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState165 ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState172 ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState167 ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState169 ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState157 ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState150 ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState146 ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState023 ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState037 ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState038 ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState131 ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState042 ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState117 ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState046 ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState050 ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState053 ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState109 ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState111 ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState096 ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState056 ->
            _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState040 ->
            _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState103 ->
            _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState101 ->
            _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState099 ->
            _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState093 ->
            _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState090 ->
            _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState087 ->
            _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState083 ->
            _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState081 ->
            _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState079 ->
            _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState069 ->
            _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState077 ->
            _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState075 ->
            _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState072 ->
            _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState057 ->
            _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_095 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.ARROW ->
            let _menhir_stack = MenhirCell1_apply_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState096 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.WILDCARD ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.TYPE ->
                _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.PROP ->
                _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.PI ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOGIC_TRUE ->
                _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_NOT ->
                _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_FORALL ->
                _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_FALSE ->
                _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_EXISTS ->
                _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INT ->
                _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.IF ->
                _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FUN ->
                _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ARITH_MINUS ->
                _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 96)
        | Tokens.ARITH_PRODUCT ->
            let _menhir_stack = MenhirCell1_apply_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND | Tokens.ARITH_GEQ | Tokens.ARITH_GT | Tokens.ARITH_LEQ | Tokens.ARITH_LT | Tokens.ARITH_MINUS | Tokens.ARITH_PLUS | Tokens.DOT | Tokens.ELSE | Tokens.END | Tokens.EQDEF | Tokens.LOGIC_AND | Tokens.LOGIC_EQ | Tokens.LOGIC_EQUIV | Tokens.LOGIC_IMPLY | Tokens.LOGIC_NEQ | Tokens.LOGIC_OR | Tokens.RIGHT_PAREN | Tokens.SEMI_COLON | Tokens.THEN | Tokens.VERTICAL_BAR | Tokens.WHERE | Tokens.WITH ->
            let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_048 t in
            _menhir_goto_mult_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _startpos_t_ _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_075 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_apply_term -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _menhir_s = MenhirState075 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.WILDCARD ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.UPPER_WORD _v ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.TYPE ->
            _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.PROP ->
            _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LOGIC_TRUE ->
            _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_FALSE ->
            _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFT_PAREN ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.INT ->
            _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ARITH_MINUS ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 75
    
    and _menhir_goto_mult_term : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState075 ->
            _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState242 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState229 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState222 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState218 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState214 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState202 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState165 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState172 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState167 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState169 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState157 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState150 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState146 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState023 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState037 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState038 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState131 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState040 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState042 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState117 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState046 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState050 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState053 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState109 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState111 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState103 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState101 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState099 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState096 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState093 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState056 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState090 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState087 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState083 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState081 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState079 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState077 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState072 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState069 ->
            _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_076 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_apply_term -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_apply_term (_menhir_stack, _menhir_s, a, _startpos_a_, _) = _menhir_stack in
        let (_endpos_b_, b) = (_endpos, _v) in
        let _v = _menhir_action_049 _endpos_b_ _startpos_a_ a b in
        _menhir_goto_mult_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_a_ _v _menhir_s _tok
    
    and _menhir_run_071 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.ARITH_PLUS ->
            let _menhir_stack = MenhirCell1_mult_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState072 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.WILDCARD ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.TYPE ->
                _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.PROP ->
                _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOGIC_TRUE ->
                _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_FALSE ->
                _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INT ->
                _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ARITH_MINUS ->
                _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 72)
        | Tokens.ARITH_MINUS ->
            let _menhir_stack = MenhirCell1_mult_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell0_ARITH_MINUS (_menhir_stack, _startpos) in
            let _menhir_s = MenhirState077 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.WILDCARD ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.TYPE ->
                _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.PROP ->
                _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOGIC_TRUE ->
                _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_FALSE ->
                _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INT ->
                _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ARITH_MINUS ->
                _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 77)
        | Tokens.AND | Tokens.ARITH_GEQ | Tokens.ARITH_GT | Tokens.ARITH_LEQ | Tokens.ARITH_LT | Tokens.DOT | Tokens.ELSE | Tokens.END | Tokens.EQDEF | Tokens.LOGIC_AND | Tokens.LOGIC_EQ | Tokens.LOGIC_EQUIV | Tokens.LOGIC_IMPLY | Tokens.LOGIC_NEQ | Tokens.LOGIC_OR | Tokens.RIGHT_PAREN | Tokens.SEMI_COLON | Tokens.THEN | Tokens.VERTICAL_BAR | Tokens.WHERE | Tokens.WITH ->
            let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_069 t in
            _menhir_goto_plus_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _startpos_t_ _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_goto_plus_term : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState083 ->
            _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState081 ->
            _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState079 ->
            _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState077 ->
            _menhir_run_078 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState072 ->
            _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState069 ->
            _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState242 ->
            _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState229 ->
            _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState222 ->
            _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState218 ->
            _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState214 ->
            _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState202 ->
            _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState165 ->
            _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState172 ->
            _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState167 ->
            _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState169 ->
            _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState157 ->
            _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState150 ->
            _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState146 ->
            _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState023 ->
            _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState037 ->
            _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState038 ->
            _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState131 ->
            _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState040 ->
            _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState042 ->
            _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState117 ->
            _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState046 ->
            _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState050 ->
            _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState053 ->
            _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState109 ->
            _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState111 ->
            _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState103 ->
            _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState101 ->
            _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState099 ->
            _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState096 ->
            _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState093 ->
            _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState090 ->
            _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState087 ->
            _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState056 ->
            _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_084 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_plus_term -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_plus_term (_menhir_stack, _menhir_s, a, _startpos_a_, _) = _menhir_stack in
        let (_endpos_b_, b) = (_endpos, _v) in
        let _v = _menhir_action_011 _endpos_b_ _startpos_a_ a b in
        _menhir_goto_arith_op_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_a_ _v _menhir_s _tok
    
    and _menhir_goto_arith_op_term : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState040 ->
            _menhir_run_121 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState242 ->
            _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState229 ->
            _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState222 ->
            _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState218 ->
            _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState214 ->
            _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState202 ->
            _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState165 ->
            _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState172 ->
            _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState167 ->
            _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState169 ->
            _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState157 ->
            _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState150 ->
            _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState146 ->
            _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState023 ->
            _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState037 ->
            _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState038 ->
            _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState131 ->
            _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState042 ->
            _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState117 ->
            _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState046 ->
            _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState050 ->
            _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState053 ->
            _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState109 ->
            _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState111 ->
            _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState103 ->
            _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState101 ->
            _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState099 ->
            _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState096 ->
            _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState056 ->
            _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState093 ->
            _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState090 ->
            _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState087 ->
            _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_121 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LOGIC_NOT -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_LOGIC_NOT (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos_t_, t) = (_endpos, _v) in
        let _v = _menhir_action_062 _endpos_t_ _startpos__1_ t in
        _menhir_goto_not_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_goto_not_term : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState090 ->
            _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState087 ->
            _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState242 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState229 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState222 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState218 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState214 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState202 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState165 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState172 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState167 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState169 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState157 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState150 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState146 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState023 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState037 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState038 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState131 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState042 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState117 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState046 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState050 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState053 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState109 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState111 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState103 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState101 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState099 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState096 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState093 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState056 ->
            _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_091 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_not_term -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_not_term (_menhir_stack, _menhir_s, t, _startpos_t_, _) = _menhir_stack in
        let (_endpos_u_, u) = (_endpos, _v) in
        let _v = _menhir_action_034 _endpos_u_ _startpos_t_ t u in
        _menhir_goto_eq_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_u_ _startpos_t_ _v _menhir_s _tok
    
    and _menhir_goto_eq_term : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.LOGIC_AND ->
            let _menhir_stack = MenhirCell1_eq_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState093 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.WILDCARD ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.TYPE ->
                _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.PROP ->
                _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOGIC_TRUE ->
                _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_NOT ->
                _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_FALSE ->
                _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INT ->
                _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ARITH_MINUS ->
                _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 93)
        | Tokens.AND | Tokens.DOT | Tokens.ELSE | Tokens.END | Tokens.EQDEF | Tokens.LOGIC_EQUIV | Tokens.LOGIC_IMPLY | Tokens.LOGIC_OR | Tokens.RIGHT_PAREN | Tokens.SEMI_COLON | Tokens.THEN | Tokens.VERTICAL_BAR | Tokens.WHERE | Tokens.WITH ->
            let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_002 t in
            _menhir_goto_and_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _startpos_t_ _v _menhir_s _tok
        | _ ->
            _eRR 92
    
    and _menhir_goto_and_term : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState242 ->
            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState229 ->
            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState222 ->
            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState218 ->
            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState214 ->
            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState202 ->
            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState165 ->
            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState172 ->
            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState167 ->
            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState169 ->
            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState157 ->
            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState150 ->
            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState146 ->
            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState023 ->
            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState037 ->
            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState038 ->
            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState131 ->
            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState042 ->
            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState117 ->
            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState046 ->
            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState050 ->
            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState053 ->
            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState109 ->
            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState111 ->
            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState056 ->
            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState103 ->
            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState101 ->
            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState099 ->
            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState096 ->
            _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState093 ->
            _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_098 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.LOGIC_OR ->
            let _menhir_stack = MenhirCell1_and_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState099 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.WILDCARD ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.TYPE ->
                _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.PROP ->
                _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOGIC_TRUE ->
                _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_NOT ->
                _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_FALSE ->
                _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INT ->
                _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ARITH_MINUS ->
                _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 99)
        | Tokens.LOGIC_IMPLY ->
            let _menhir_stack = MenhirCell1_and_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState101 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.WILDCARD ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.TYPE ->
                _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.PROP ->
                _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOGIC_TRUE ->
                _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_NOT ->
                _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_FALSE ->
                _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INT ->
                _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ARITH_MINUS ->
                _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 101)
        | Tokens.LOGIC_EQUIV ->
            let _menhir_stack = MenhirCell1_and_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState103 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.WILDCARD ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.TYPE ->
                _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.PROP ->
                _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOGIC_TRUE ->
                _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_NOT ->
                _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_FALSE ->
                _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INT ->
                _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ARITH_MINUS ->
                _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 103)
        | Tokens.AND | Tokens.DOT | Tokens.ELSE | Tokens.END | Tokens.EQDEF | Tokens.RIGHT_PAREN | Tokens.SEMI_COLON | Tokens.THEN | Tokens.VERTICAL_BAR | Tokens.WHERE | Tokens.WITH ->
            let (_endpos_t_, t) = (_endpos, _v) in
            let _v = _menhir_action_065 t in
            _menhir_goto_or_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_goto_or_term : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState103 ->
            _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState101 ->
            _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState099 ->
            _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState242 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState229 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState222 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState218 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState214 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState202 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState165 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState172 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState167 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState169 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState157 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState150 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState146 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState023 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState037 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState038 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState131 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState042 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState117 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState046 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState050 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState053 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState109 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState111 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState096 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState056 ->
            _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_104 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_and_term -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_and_term (_menhir_stack, _menhir_s, t, _startpos_t_, _) = _menhir_stack in
        let (_endpos_u_, u) = (_endpos, _v) in
        let _v = _menhir_action_068 _endpos_u_ _startpos_t_ t u in
        _menhir_goto_or_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_u_ _v _menhir_s _tok
    
    and _menhir_run_102 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_and_term -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_and_term (_menhir_stack, _menhir_s, t, _startpos_t_, _) = _menhir_stack in
        let (_endpos_u_, u) = (_endpos, _v) in
        let _v = _menhir_action_067 _endpos_u_ _startpos_t_ t u in
        _menhir_goto_or_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_u_ _v _menhir_s _tok
    
    and _menhir_run_100 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_and_term -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_and_term (_menhir_stack, _menhir_s, t, _startpos_t_, _) = _menhir_stack in
        let (_endpos_u_, u) = (_endpos, _v) in
        let _v = _menhir_action_066 _endpos_u_ _startpos_t_ t u in
        _menhir_goto_or_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_u_ _v _menhir_s _tok
    
    and _menhir_run_085 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        let (_endpos_t_, t) = (_endpos, _v) in
        let _v = _menhir_action_092 t in
        _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _v _menhir_s _tok
    
    and _menhir_goto_term : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState242 ->
            _menhir_run_243 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState229 ->
            _menhir_run_230 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState222 ->
            _menhir_run_223 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState218 ->
            _menhir_run_219 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState214 ->
            _menhir_run_215 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState202 ->
            _menhir_run_203 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState172 ->
            _menhir_run_173 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState169 ->
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState167 ->
            _menhir_run_168 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState165 ->
            _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState157 ->
            _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState150 ->
            _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState146 ->
            _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState023 ->
            _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState037 ->
            _menhir_run_137 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState131 ->
            _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState038 ->
            _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState042 ->
            _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState117 ->
            _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState046 ->
            _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState050 ->
            _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState111 ->
            _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState109 ->
            _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState053 ->
            _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState096 ->
            _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState056 ->
            _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_243 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_ASSERT, _menhir_box_input) _menhir_cell1_attrs -> _ -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.DOT ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let MenhirCell1_attrs (_menhir_stack, _, attrs) = _menhir_stack in
            let MenhirCell1_ASSERT (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (t, _endpos__4_) = (_v, _endpos_0) in
            let _v = _menhir_action_087 _endpos__4_ _startpos__1_ attrs t in
            _menhir_goto_statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 243
    
    and _menhir_run_230 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_GOAL, _menhir_box_input) _menhir_cell1_attrs -> _ -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.DOT ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let MenhirCell1_attrs (_menhir_stack, _, attrs) = _menhir_stack in
            let MenhirCell1_GOAL (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (t, _endpos__4_) = (_v, _endpos_0) in
            let _v = _menhir_action_089 _endpos__4_ _startpos__1_ attrs t in
            _menhir_goto_statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 230
    
    and _menhir_run_223 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_LEMMA, _menhir_box_input) _menhir_cell1_attrs -> _ -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.DOT ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let MenhirCell1_attrs (_menhir_stack, _, attrs) = _menhir_stack in
            let MenhirCell1_LEMMA (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (t, _endpos__4_) = (_v, _endpos_0) in
            let _v = _menhir_action_088 _endpos__4_ _startpos__1_ attrs t in
            _menhir_goto_statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 223
    
    and _menhir_run_219 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_REWRITE, _menhir_box_input) _menhir_cell1_attrs -> _ -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.DOT ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let MenhirCell1_attrs (_menhir_stack, _, attrs) = _menhir_stack in
            let MenhirCell1_REWRITE (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (t, _endpos__4_) = (_v, _endpos_0) in
            let _v = _menhir_action_086 _endpos__4_ _startpos__1_ attrs t in
            _menhir_goto_statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 219
    
    and _menhir_run_215 : type  ttv_stack. (((ttv_stack, _menhir_box_input) _menhir_cell1_VAL, _menhir_box_input) _menhir_cell1_attrs, _menhir_box_input) _menhir_cell1_name -> _ -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.DOT ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let MenhirCell1_name (_menhir_stack, _, v, _, _) = _menhir_stack in
            let MenhirCell1_attrs (_menhir_stack, _, attrs) = _menhir_stack in
            let MenhirCell1_VAL (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (t, _endpos__6_) = (_v, _endpos_0) in
            let _v = _menhir_action_084 _endpos__6_ _startpos__1_ attrs t v in
            _menhir_goto_statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 215
    
    and _menhir_run_203 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_ASSERT, _menhir_box_file) _menhir_cell1_attrs -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.DOT ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_attrs (_menhir_stack, _, attrs) = _menhir_stack in
            let MenhirCell1_ASSERT (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (t, _endpos__4_) = (_v, _endpos_0) in
            let _v = _menhir_action_087 _endpos__4_ _startpos__1_ attrs t in
            _menhir_goto_statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 203
    
    and _menhir_run_173 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_name, ttv_result) _menhir_cell1_term -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_term (_menhir_stack, _, ty, _) = _menhir_stack in
        let MenhirCell1_name (_menhir_stack, _menhir_s, id, _startpos_id_, _) = _menhir_stack in
        let (_endpos_t_, t) = (_endpos, _v) in
        let _v = _menhir_action_031 _endpos_t_ _startpos_id_ id t ty in
        _menhir_goto_def _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_def : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.AND ->
            let _menhir_stack = MenhirCell1_def (_menhir_stack, _menhir_s, _v) in
            let _menhir_s = MenhirState175 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | _ ->
                _eRR 175)
        | Tokens.DOT ->
            let x = _v in
            let _v = _menhir_action_073 x in
            _menhir_goto_separated_nonempty_list_AND_def_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 174
    
    and _menhir_goto_separated_nonempty_list_AND_def_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState234 ->
            _menhir_run_235 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState175 ->
            _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | MenhirState161 ->
            _menhir_run_162 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_235 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_DEF, _menhir_box_input) _menhir_cell1_attrs -> _ -> _ -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let MenhirCell1_attrs (_menhir_stack, _, attrs) = _menhir_stack in
        let MenhirCell1_DEF (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (l, _endpos__4_) = (_v, _endpos) in
        let _v = _menhir_action_085 _endpos__4_ _startpos__1_ attrs l in
        _menhir_goto_statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_176 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_def -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let MenhirCell1_def (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_074 x xs in
        _menhir_goto_separated_nonempty_list_AND_def_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_162 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_DEF, _menhir_box_file) _menhir_cell1_attrs -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell1_attrs (_menhir_stack, _, attrs) = _menhir_stack in
        let MenhirCell1_DEF (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (l, _endpos__4_) = (_v, _endpos) in
        let _v = _menhir_action_085 _endpos__4_ _startpos__1_ attrs l in
        _menhir_goto_statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_168 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.SEMI_COLON ->
            let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v, _endpos) in
            let _menhir_s = MenhirState169 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.WILDCARD ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.TYPE ->
                _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.PROP ->
                _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.PI ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOGIC_TRUE ->
                _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_NOT ->
                _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_FORALL ->
                _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_FALSE ->
                _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_EXISTS ->
                _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INT ->
                _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.IF ->
                _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FUN ->
                _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ARITH_MINUS ->
                _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 169)
        | Tokens.AND | Tokens.DOT ->
            let (_endpos_x_, x) = (_endpos, _v) in
            let _v = _menhir_action_079 x in
            _menhir_goto_separated_nonempty_list_SEMI_COLON_term_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _v _menhir_s _tok
        | _ ->
            _eRR 168
    
    and _menhir_goto_separated_nonempty_list_SEMI_COLON_term_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState167 ->
            _menhir_run_171 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState169 ->
            _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_171 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_name, ttv_result) _menhir_cell1_term -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_term (_menhir_stack, _, ty, _) = _menhir_stack in
        let MenhirCell1_name (_menhir_stack, _menhir_s, id, _startpos_id_, _) = _menhir_stack in
        let (_endpos_rules_, rules) = (_endpos, _v) in
        let _v = _menhir_action_032 _endpos_rules_ _startpos_id_ id rules ty in
        _menhir_goto_def _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_170 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_term -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_term (_menhir_stack, _menhir_s, x, _) = _menhir_stack in
        let (_endpos_xs_, xs) = (_endpos, _v) in
        let _v = _menhir_action_080 x xs in
        _menhir_goto_separated_nonempty_list_SEMI_COLON_term_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_xs_ _v _menhir_s _tok
    
    and _menhir_run_166 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_name as 'stack) -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.WHERE ->
            let _menhir_s = MenhirState167 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.WILDCARD ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.TYPE ->
                _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.PROP ->
                _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.PI ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOGIC_TRUE ->
                _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_NOT ->
                _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_FORALL ->
                _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_FALSE ->
                _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_EXISTS ->
                _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INT ->
                _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.IF ->
                _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FUN ->
                _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ARITH_MINUS ->
                _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 167)
        | Tokens.EQDEF ->
            let _menhir_s = MenhirState172 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.WILDCARD ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.TYPE ->
                _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.PROP ->
                _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.PI ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOGIC_TRUE ->
                _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_NOT ->
                _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_FORALL ->
                _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_FALSE ->
                _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_EXISTS ->
                _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INT ->
                _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.IF ->
                _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FUN ->
                _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ARITH_MINUS ->
                _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 172)
        | _ ->
            _eRR 166
    
    and _menhir_run_158 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_GOAL, _menhir_box_file) _menhir_cell1_attrs -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.DOT ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_attrs (_menhir_stack, _, attrs) = _menhir_stack in
            let MenhirCell1_GOAL (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (t, _endpos__4_) = (_v, _endpos_0) in
            let _v = _menhir_action_089 _endpos__4_ _startpos__1_ attrs t in
            _menhir_goto_statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 158
    
    and _menhir_run_151 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_LEMMA, _menhir_box_file) _menhir_cell1_attrs -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.DOT ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_attrs (_menhir_stack, _, attrs) = _menhir_stack in
            let MenhirCell1_LEMMA (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (t, _endpos__4_) = (_v, _endpos_0) in
            let _v = _menhir_action_088 _endpos__4_ _startpos__1_ attrs t in
            _menhir_goto_statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 151
    
    and _menhir_run_147 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_REWRITE, _menhir_box_file) _menhir_cell1_attrs -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.DOT ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_attrs (_menhir_stack, _, attrs) = _menhir_stack in
            let MenhirCell1_REWRITE (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (t, _endpos__4_) = (_v, _endpos_0) in
            let _v = _menhir_action_086 _endpos__4_ _startpos__1_ attrs t in
            _menhir_goto_statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 147
    
    and _menhir_run_143 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_VAL, _menhir_box_file) _menhir_cell1_attrs, _menhir_box_file) _menhir_cell1_name -> _ -> _ -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.DOT ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_name (_menhir_stack, _, v, _, _) = _menhir_stack in
            let MenhirCell1_attrs (_menhir_stack, _, attrs) = _menhir_stack in
            let MenhirCell1_VAL (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (t, _endpos__6_) = (_v, _endpos_0) in
            let _v = _menhir_action_084 _endpos__6_ _startpos__1_ attrs t v in
            _menhir_goto_statement _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 143
    
    and _menhir_run_137 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_PI, ttv_result) _menhir_cell1_typed_ty_var_list _menhir_cell0_DOT -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell0_DOT (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_typed_ty_var_list (_menhir_stack, _, vars) = _menhir_stack in
        let MenhirCell1_PI (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos_t_, t) = (_endpos, _v) in
        let _v = _menhir_action_097 _endpos_t_ _startpos__1_ t vars in
        _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _v _menhir_s _tok
    
    and _menhir_run_132 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_VERTICAL_BAR, ttv_result) _menhir_cell1_raw_var, ttv_result) _menhir_cell1_list_var_or_wildcard_ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let MenhirCell1_list_var_or_wildcard_ (_menhir_stack, _, vars, _endpos_vars_) = _menhir_stack in
        let MenhirCell1_raw_var (_menhir_stack, _, c, _startpos_c_, _) = _menhir_stack in
        let MenhirCell1_VERTICAL_BAR (_menhir_stack, _menhir_s) = _menhir_stack in
        let rhs = _v in
        let _v = _menhir_action_047 _endpos_vars_ _startpos_c_ c rhs vars in
        match (_tok : MenhirBasics.token) with
        | Tokens.VERTICAL_BAR ->
            let _menhir_stack = MenhirCell1_match_branch (_menhir_stack, _menhir_s, _v) in
            _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState135
        | Tokens.END ->
            let x = _v in
            let _v = _menhir_action_057 x in
            _menhir_goto_nonempty_list_match_branch_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 135
    
    and _menhir_run_124 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _menhir_stack = MenhirCell1_VERTICAL_BAR (_menhir_stack, _menhir_s) in
        let _menhir_s = MenhirState124 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 124
    
    and _menhir_goto_nonempty_list_match_branch_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState135 ->
            _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState123 ->
            _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_136 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_match_branch -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_match_branch (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_058 x xs in
        _menhir_goto_nonempty_list_match_branch_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_133 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_MATCH, ttv_result) _menhir_cell1_term -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell1_term (_menhir_stack, _, t, _) = _menhir_stack in
        let MenhirCell1_MATCH (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (l, _endpos__5_) = (_v, _endpos) in
        let _v = _menhir_action_019 _endpos__5_ _startpos__1_ l t in
        _menhir_goto_atomic_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__5_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_122 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_MATCH as 'stack) -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.WITH ->
            let _menhir_s = MenhirState123 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.VERTICAL_BAR ->
                _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 123)
        | _ ->
            _eRR 122
    
    and _menhir_run_119 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LEFT_PAREN -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (_endpos__3_, t) = (_endpos_0, _v) in
            let _v = _menhir_action_018 t in
            _menhir_goto_atomic_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _startpos__1_ _v _menhir_s _tok
        | _ ->
            _eRR 119
    
    and _menhir_run_118 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LOGIC_FORALL, ttv_result) _menhir_cell1_typed_var_list _menhir_cell0_DOT -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell0_DOT (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_typed_var_list (_menhir_stack, _, vars) = _menhir_stack in
        let MenhirCell1_LOGIC_FORALL (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos_t_, t) = (_endpos, _v) in
        let _v = _menhir_action_093 _endpos_t_ _startpos__1_ t vars in
        _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _v _menhir_s _tok
    
    and _menhir_run_114 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LEFT_PAREN, ttv_result) _menhir_cell1_nonempty_list_raw_var_ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_nonempty_list_raw_var_ (_menhir_stack, _, l) = _menhir_stack in
            let MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (t, _endpos__5_) = (_v, _endpos_0) in
            let _v = _menhir_action_107 _endpos__5_ _startpos__1_ l t in
            _menhir_goto_typed_var_block _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 114
    
    and _menhir_goto_typed_var_block : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.WILDCARD ->
            let _menhir_stack = MenhirCell1_typed_var_block (_menhir_stack, _menhir_s, _v) in
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState105
        | Tokens.UPPER_WORD _v_0 ->
            let _menhir_stack = MenhirCell1_typed_var_block (_menhir_stack, _menhir_s, _v) in
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState105
        | Tokens.LOWER_WORD _v_1 ->
            let _menhir_stack = MenhirCell1_typed_var_block (_menhir_stack, _menhir_s, _v) in
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState105
        | Tokens.LEFT_PAREN ->
            let _menhir_stack = MenhirCell1_typed_var_block (_menhir_stack, _menhir_s, _v) in
            _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState105
        | Tokens.DOT ->
            let l = _v in
            let _v = _menhir_action_108 l in
            _menhir_goto_typed_var_list _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 105
    
    and _menhir_goto_typed_var_list : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState043 ->
            _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState105 ->
            _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState054 ->
            _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState047 ->
            _menhir_run_049 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_116 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LOGIC_FORALL as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_typed_var_list (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_DOT (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState117 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.WILDCARD ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.UPPER_WORD _v ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.TYPE ->
            _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.PROP ->
            _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.PI ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LOGIC_TRUE ->
            _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_NOT ->
            _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_FORALL ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_FALSE ->
            _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_EXISTS ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFT_PAREN ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.INT ->
            _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.IF ->
            _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FUN ->
            _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ARITH_MINUS ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 117
    
    and _menhir_run_106 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_typed_var_block -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_typed_var_block (_menhir_stack, _menhir_s, l) = _menhir_stack in
        let l2 = _v in
        let _v = _menhir_action_109 l l2 in
        _menhir_goto_typed_var_list _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_055 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_FUN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_typed_var_list (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_DOT (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState056 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.WILDCARD ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.UPPER_WORD _v ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.TYPE ->
            _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.PROP ->
            _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.PI ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LOGIC_TRUE ->
            _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_NOT ->
            _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_FORALL ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_FALSE ->
            _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_EXISTS ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFT_PAREN ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.INT ->
            _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.IF ->
            _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FUN ->
            _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ARITH_MINUS ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 56
    
    and _menhir_run_049 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LOGIC_EXISTS as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_typed_var_list (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_DOT (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState050 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.WILDCARD ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.UPPER_WORD _v ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.TYPE ->
            _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.PROP ->
            _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.PI ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LOGIC_TRUE ->
            _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_NOT ->
            _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_FORALL ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_FALSE ->
            _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_EXISTS ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFT_PAREN ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.INT ->
            _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.IF ->
            _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FUN ->
            _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ARITH_MINUS ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 50
    
    and _menhir_run_113 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LOGIC_EXISTS, ttv_result) _menhir_cell1_typed_var_list _menhir_cell0_DOT -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell0_DOT (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_typed_var_list (_menhir_stack, _, vars) = _menhir_stack in
        let MenhirCell1_LOGIC_EXISTS (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos_t_, t) = (_endpos, _v) in
        let _v = _menhir_action_094 _endpos_t_ _startpos__1_ t vars in
        _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _v _menhir_s _tok
    
    and _menhir_run_112 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_IF, ttv_result) _menhir_cell1_term, ttv_result) _menhir_cell1_term -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_term (_menhir_stack, _, b, _) = _menhir_stack in
        let MenhirCell1_term (_menhir_stack, _, a, _) = _menhir_stack in
        let MenhirCell1_IF (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos_c_, c) = (_endpos, _v) in
        let _v = _menhir_action_098 _endpos_c_ _startpos__1_ a b c in
        _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_c_ _v _menhir_s _tok
    
    and _menhir_run_110 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_IF, ttv_result) _menhir_cell1_term as 'stack) -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.ELSE ->
            let _menhir_s = MenhirState111 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.WILDCARD ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.TYPE ->
                _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.PROP ->
                _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.PI ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOGIC_TRUE ->
                _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_NOT ->
                _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_FORALL ->
                _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_FALSE ->
                _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_EXISTS ->
                _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INT ->
                _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.IF ->
                _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FUN ->
                _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ARITH_MINUS ->
                _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 111)
        | _ ->
            _eRR 110
    
    and _menhir_run_108 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.THEN ->
            let _menhir_s = MenhirState109 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.WILDCARD ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.TYPE ->
                _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.PROP ->
                _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.PI ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOGIC_TRUE ->
                _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_NOT ->
                _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_FORALL ->
                _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_FALSE ->
                _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_EXISTS ->
                _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INT ->
                _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.IF ->
                _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FUN ->
                _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ARITH_MINUS ->
                _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 109)
        | _ ->
            _eRR 108
    
    and _menhir_run_097 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_apply_term -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_apply_term (_menhir_stack, _menhir_s, t, _startpos_t_, _) = _menhir_stack in
        let (_endpos_u_, u) = (_endpos, _v) in
        let _v = _menhir_action_096 _endpos_u_ _startpos_t_ t u in
        _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_u_ _v _menhir_s _tok
    
    and _menhir_run_067 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_FUN, ttv_result) _menhir_cell1_typed_var_list _menhir_cell0_DOT -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell0_DOT (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_typed_var_list (_menhir_stack, _, vars) = _menhir_stack in
        let MenhirCell1_FUN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos_t_, t) = (_endpos, _v) in
        let _v = _menhir_action_095 _endpos_t_ _startpos__1_ t vars in
        _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _v _menhir_s _tok
    
    and _menhir_run_094 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_eq_term -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_eq_term (_menhir_stack, _menhir_s, t, _startpos_t_, _) = _menhir_stack in
        let (_endpos_u_, u) = (_endpos, _v) in
        let _v = _menhir_action_003 _endpos_u_ _startpos_t_ t u in
        _menhir_goto_and_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_u_ _startpos_t_ _v _menhir_s _tok
    
    and _menhir_run_088 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_not_term -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_not_term (_menhir_stack, _menhir_s, t, _startpos_t_, _) = _menhir_stack in
        let (_endpos_u_, u) = (_endpos, _v) in
        let _v = _menhir_action_035 _endpos_u_ _startpos_t_ t u in
        _menhir_goto_eq_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_u_ _startpos_t_ _v _menhir_s _tok
    
    and _menhir_run_086 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.LOGIC_NEQ ->
            let _menhir_stack = MenhirCell1_not_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState087 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.WILDCARD ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.TYPE ->
                _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.PROP ->
                _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOGIC_TRUE ->
                _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_NOT ->
                _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_FALSE ->
                _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INT ->
                _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ARITH_MINUS ->
                _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 87)
        | Tokens.LOGIC_EQ ->
            let _menhir_stack = MenhirCell1_not_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState090 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.WILDCARD ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.TYPE ->
                _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.PROP ->
                _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOGIC_TRUE ->
                _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_NOT ->
                _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_FALSE ->
                _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INT ->
                _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ARITH_MINUS ->
                _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 90)
        | Tokens.AND | Tokens.DOT | Tokens.ELSE | Tokens.END | Tokens.EQDEF | Tokens.LOGIC_AND | Tokens.LOGIC_EQUIV | Tokens.LOGIC_IMPLY | Tokens.LOGIC_OR | Tokens.RIGHT_PAREN | Tokens.SEMI_COLON | Tokens.THEN | Tokens.VERTICAL_BAR | Tokens.WHERE | Tokens.WITH ->
            let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_033 t in
            _menhir_goto_eq_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _startpos_t_ _v _menhir_s _tok
        | _ ->
            _eRR 86
    
    and _menhir_run_089 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_061 t in
        _menhir_goto_not_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _startpos_t_ _v _menhir_s _tok
    
    and _menhir_run_082 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_plus_term -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_plus_term (_menhir_stack, _menhir_s, a, _startpos_a_, _) = _menhir_stack in
        let (_endpos_b_, b) = (_endpos, _v) in
        let _v = _menhir_action_010 _endpos_b_ _startpos_a_ a b in
        _menhir_goto_arith_op_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_a_ _v _menhir_s _tok
    
    and _menhir_run_080 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_plus_term -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_plus_term (_menhir_stack, _menhir_s, a, _startpos_a_, _) = _menhir_stack in
        let (_endpos_b_, b) = (_endpos, _v) in
        let _v = _menhir_action_009 _endpos_b_ _startpos_a_ a b in
        _menhir_goto_arith_op_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_a_ _v _menhir_s _tok
    
    and _menhir_run_078 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_mult_term _menhir_cell0_ARITH_MINUS -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell0_ARITH_MINUS (_menhir_stack, _) = _menhir_stack in
        let MenhirCell1_mult_term (_menhir_stack, _menhir_s, a, _startpos_a_, _) = _menhir_stack in
        let (_endpos_b_, b) = (_endpos, _v) in
        let _v = _menhir_action_071 _endpos_b_ _startpos_a_ a b in
        _menhir_goto_plus_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_a_ _v _menhir_s _tok
    
    and _menhir_run_073 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_mult_term -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_mult_term (_menhir_stack, _menhir_s, a, _startpos_a_, _) = _menhir_stack in
        let (_endpos_b_, b) = (_endpos, _v) in
        let _v = _menhir_action_070 _endpos_b_ _startpos_a_ a b in
        _menhir_goto_plus_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_a_ _v _menhir_s _tok
    
    and _menhir_run_070 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_plus_term -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_plus_term (_menhir_stack, _menhir_s, a, _startpos_a_, _) = _menhir_stack in
        let (_endpos_b_, b) = (_endpos, _v) in
        let _v = _menhir_action_008 _endpos_b_ _startpos_a_ a b in
        _menhir_goto_arith_op_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_b_ _startpos_a_ _v _menhir_s _tok
    
    and _menhir_run_068 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.ARITH_LT ->
            let _menhir_stack = MenhirCell1_plus_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState069 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.WILDCARD ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.TYPE ->
                _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.PROP ->
                _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOGIC_TRUE ->
                _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_FALSE ->
                _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INT ->
                _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ARITH_MINUS ->
                _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 69)
        | Tokens.ARITH_LEQ ->
            let _menhir_stack = MenhirCell1_plus_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState079 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.WILDCARD ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.TYPE ->
                _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.PROP ->
                _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOGIC_TRUE ->
                _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_FALSE ->
                _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INT ->
                _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ARITH_MINUS ->
                _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 79)
        | Tokens.ARITH_GT ->
            let _menhir_stack = MenhirCell1_plus_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState081 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.WILDCARD ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.TYPE ->
                _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.PROP ->
                _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOGIC_TRUE ->
                _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_FALSE ->
                _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INT ->
                _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ARITH_MINUS ->
                _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 81)
        | Tokens.ARITH_GEQ ->
            let _menhir_stack = MenhirCell1_plus_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState083 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.WILDCARD ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.TYPE ->
                _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.PROP ->
                _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOGIC_TRUE ->
                _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_FALSE ->
                _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INT ->
                _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ARITH_MINUS ->
                _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 83)
        | Tokens.AND | Tokens.DOT | Tokens.ELSE | Tokens.END | Tokens.EQDEF | Tokens.LOGIC_AND | Tokens.LOGIC_EQ | Tokens.LOGIC_EQUIV | Tokens.LOGIC_IMPLY | Tokens.LOGIC_NEQ | Tokens.LOGIC_OR | Tokens.RIGHT_PAREN | Tokens.SEMI_COLON | Tokens.THEN | Tokens.VERTICAL_BAR | Tokens.WHERE | Tokens.WITH ->
            let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_007 t in
            _menhir_goto_arith_op_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _startpos_t_ _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_074 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.ARITH_PRODUCT ->
            let _menhir_stack = MenhirCell1_apply_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer
        | Tokens.AND | Tokens.ARITH_GEQ | Tokens.ARITH_GT | Tokens.ARITH_LEQ | Tokens.ARITH_LT | Tokens.ARITH_MINUS | Tokens.ARITH_PLUS | Tokens.DOT | Tokens.ELSE | Tokens.END | Tokens.EQDEF | Tokens.LOGIC_AND | Tokens.LOGIC_EQ | Tokens.LOGIC_EQUIV | Tokens.LOGIC_IMPLY | Tokens.LOGIC_NEQ | Tokens.LOGIC_OR | Tokens.RIGHT_PAREN | Tokens.SEMI_COLON | Tokens.THEN | Tokens.VERTICAL_BAR | Tokens.WHERE | Tokens.WITH ->
            let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_048 t in
            _menhir_goto_mult_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _startpos_t_ _v _menhir_s _tok
        | _ ->
            _eRR 74
    
    and _menhir_run_066 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_ARITH_MINUS -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_ARITH_MINUS (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
        let (_endpos_t_, t) = (_endpos, _v) in
        let _v = _menhir_action_006 _endpos_t_ _startpos__1_ t in
        _menhir_goto_apply_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _startpos__1_ _v _menhir_s _tok
    
    and _menhir_run_062 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.WILDCARD ->
            let _menhir_stack = MenhirCell1_atomic_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState062
        | Tokens.UPPER_WORD _v_0 ->
            let _menhir_stack = MenhirCell1_atomic_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState062
        | Tokens.TYPE ->
            let _menhir_stack = MenhirCell1_atomic_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState062
        | Tokens.PROP ->
            let _menhir_stack = MenhirCell1_atomic_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState062
        | Tokens.MATCH ->
            let _menhir_stack = MenhirCell1_atomic_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState062
        | Tokens.LOWER_WORD _v_1 ->
            let _menhir_stack = MenhirCell1_atomic_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState062
        | Tokens.LOGIC_TRUE ->
            let _menhir_stack = MenhirCell1_atomic_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState062
        | Tokens.LOGIC_FALSE ->
            let _menhir_stack = MenhirCell1_atomic_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState062
        | Tokens.LEFT_PAREN ->
            let _menhir_stack = MenhirCell1_atomic_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState062
        | Tokens.INTEGER _v_2 ->
            let _menhir_stack = MenhirCell1_atomic_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState062
        | Tokens.INT ->
            let _menhir_stack = MenhirCell1_atomic_term (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState062
        | Tokens.AND | Tokens.ARITH_GEQ | Tokens.ARITH_GT | Tokens.ARITH_LEQ | Tokens.ARITH_LT | Tokens.ARITH_MINUS | Tokens.ARITH_PLUS | Tokens.ARITH_PRODUCT | Tokens.ARROW | Tokens.DOT | Tokens.ELSE | Tokens.END | Tokens.EQDEF | Tokens.LOGIC_AND | Tokens.LOGIC_EQ | Tokens.LOGIC_EQUIV | Tokens.LOGIC_IMPLY | Tokens.LOGIC_NEQ | Tokens.LOGIC_OR | Tokens.RIGHT_PAREN | Tokens.SEMI_COLON | Tokens.THEN | Tokens.VERTICAL_BAR | Tokens.WHERE | Tokens.WITH ->
            let (_endpos_t_, _startpos_t_, t) = (_endpos, _startpos, _v) in
            let _v = _menhir_action_004 t in
            _menhir_goto_apply_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_t_ _startpos_t_ _v _menhir_s _tok
        | _ ->
            _eRR 62
    
    and _menhir_run_058 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_v_, _startpos_v_, v) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_111 v in
        _menhir_goto_var _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_v_ _startpos_v_ _v _menhir_s _tok
    
    and _menhir_goto_var : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_v_, _startpos_v_, v) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_015 v in
        _menhir_goto_atomic_term _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_v_ _startpos_v_ _v _menhir_s _tok
    
    and _menhir_run_048 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let v = _v in
        let _v = _menhir_action_106 v in
        _menhir_goto_typed_var_block _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_190 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_name (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.WILDCARD ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState190
        | Tokens.UPPER_WORD _v_0 ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState190
        | Tokens.TYPE ->
            _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState190
        | Tokens.PROP ->
            _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState190
        | Tokens.MATCH ->
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState190
        | Tokens.LOWER_WORD _v_1 ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState190
        | Tokens.LOGIC_TRUE ->
            _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState190
        | Tokens.LOGIC_FALSE ->
            _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState190
        | Tokens.LEFT_PAREN ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState190
        | Tokens.INTEGER _v_2 ->
            _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState190
        | Tokens.INT ->
            _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState190
        | Tokens.AND | Tokens.DOT | Tokens.VERTICAL_BAR ->
            let _v_3 = _menhir_action_039 () in
            _menhir_run_191 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v_3 _tok
        | _ ->
            _eRR 190
    
    and _menhir_run_182 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_name (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v_0 ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState182
        | Tokens.LOWER_WORD _v_1 ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState182
        | Tokens.EQDEF ->
            let _v_2 = _menhir_action_041 () in
            _menhir_run_185 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState182
        | _ ->
            _eRR 182
    
    and _menhir_run_185 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_name as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_list_raw_var_ (_menhir_stack, _menhir_s, _v) in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.VERTICAL_BAR ->
            let _tok = _menhir_lexer _menhir_lexbuf in
            let x = () in
            let _v = _menhir_action_064 x in
            _menhir_goto_option_VERTICAL_BAR_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | Tokens.LOWER_WORD _ | Tokens.UPPER_WORD _ ->
            let _v = _menhir_action_063 () in
            _menhir_goto_option_VERTICAL_BAR_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _eRR 186
    
    and _menhir_goto_option_VERTICAL_BAR_ : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_name, ttv_result) _menhir_cell1_list_raw_var_ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        let _menhir_stack = MenhirCell0_option_VERTICAL_BAR_ (_menhir_stack, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v_0 ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState188
        | Tokens.LOWER_WORD _v_1 ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState188
        | _ ->
            _eRR 188
    
    and _menhir_run_164 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_name (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COLON ->
            let _menhir_s = MenhirState165 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.WILDCARD ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.TYPE ->
                _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.PROP ->
                _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.PI ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOGIC_TRUE ->
                _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_NOT ->
                _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_FORALL ->
                _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_FALSE ->
                _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_EXISTS ->
                _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INT ->
                _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.IF ->
                _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FUN ->
                _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ARITH_MINUS ->
                _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 165)
        | _ ->
            _eRR 164
    
    and _menhir_run_022 : type  ttv_stack. (((ttv_stack, _menhir_box_file) _menhir_cell1_VAL, _menhir_box_file) _menhir_cell1_attrs as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_name (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.COLON ->
            let _menhir_s = MenhirState023 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.WILDCARD ->
                _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.UPPER_WORD _v ->
                _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.TYPE ->
                _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.PROP ->
                _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.PI ->
                _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.MATCH ->
                _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOGIC_TRUE ->
                _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_NOT ->
                _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_FORALL ->
                _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_FALSE ->
                _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LOGIC_EXISTS ->
                _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.INTEGER _v ->
                _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.INT ->
                _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.IF ->
                _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.FUN ->
                _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | Tokens.ARITH_MINUS ->
                _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 23)
        | _ ->
            _eRR 22
    
    and _menhir_run_010 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_072 _endpos_s_ _startpos_s_ s in
        _menhir_goto_raw_var _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_s_ _startpos_s_ _v _menhir_s _tok
    
    and _menhir_goto_raw_var : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState183 ->
            _menhir_run_183 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState182 ->
            _menhir_run_183 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState027 ->
            _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState138 ->
            _menhir_run_140 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState125 ->
            _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState127 ->
            _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState124 ->
            _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState043 ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState047 ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState054 ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState105 ->
            _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState242 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState229 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState222 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState218 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState214 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState202 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState192 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState190 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState165 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState172 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState167 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState169 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState157 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState150 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState146 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState023 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState037 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState038 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState131 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState040 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState042 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState117 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState046 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState050 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState053 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState109 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState111 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState103 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState101 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState099 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState096 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState093 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState090 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState087 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState083 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState081 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState079 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState077 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState075 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState072 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState069 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState056 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState064 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState062 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState057 ->
            _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState044 ->
            _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState029 ->
            _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState028 ->
            _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState011 ->
            _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState007 ->
            _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState019 ->
            _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState002 ->
            _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | MenhirState006 ->
            _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_183 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_raw_var (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v_0 ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState183
        | Tokens.LOWER_WORD _v_1 ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState183
        | Tokens.EQDEF ->
            let _v_2 = _menhir_action_041 () in
            _menhir_run_184 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2
        | _ ->
            _eRR 183
    
    and _menhir_run_184 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_raw_var -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_raw_var (_menhir_stack, _menhir_s, x, _, _) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_042 x xs in
        _menhir_goto_list_raw_var_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_goto_list_raw_var_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState182 ->
            _menhir_run_185 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState183 ->
            _menhir_run_184 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_140 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.COLON ->
            let _menhir_stack = MenhirCell1_raw_var (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            let _menhir_s = MenhirState141 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.TYPE ->
                _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 141)
        | Tokens.DOT | Tokens.LEFT_PAREN | Tokens.LOWER_WORD _ | Tokens.UPPER_WORD _ ->
            let v = _v in
            let _v = _menhir_action_100 v in
            _menhir_goto_typed_ty_var_block _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 140
    
    and _menhir_run_033 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
        let _v = _menhir_action_091 _endpos__1_ _startpos__1_ in
        _menhir_goto_t_type _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _v _menhir_s _tok
    
    and _menhir_goto_t_type : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState141 ->
            _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState032 ->
            _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_142 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_raw_var -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_raw_var (_menhir_stack, _menhir_s, v, _startpos_v_, _) = _menhir_stack in
        let (_endpos_ty_, ty) = (_endpos, _v) in
        let _v = _menhir_action_101 _endpos_ty_ _startpos_v_ ty v in
        _menhir_goto_typed_ty_var_block _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_typed_ty_var_block : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v_0 ->
            let _menhir_stack = MenhirCell1_typed_ty_var_block (_menhir_stack, _menhir_s, _v) in
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState138
        | Tokens.LOWER_WORD _v_1 ->
            let _menhir_stack = MenhirCell1_typed_ty_var_block (_menhir_stack, _menhir_s, _v) in
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState138
        | Tokens.LEFT_PAREN ->
            let _menhir_stack = MenhirCell1_typed_ty_var_block (_menhir_stack, _menhir_s, _v) in
            _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState138
        | Tokens.DOT ->
            let l = _v in
            let _v = _menhir_action_103 l in
            _menhir_goto_typed_ty_var_list _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 138
    
    and _menhir_goto_typed_ty_var_list : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState138 ->
            _menhir_run_139 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState027 ->
            _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_139 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_typed_ty_var_block -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_typed_ty_var_block (_menhir_stack, _menhir_s, l) = _menhir_stack in
        let l2 = _v in
        let _v = _menhir_action_104 l l2 in
        _menhir_goto_typed_ty_var_list _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_036 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_PI as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_typed_ty_var_list (_menhir_stack, _menhir_s, _v) in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _menhir_stack = MenhirCell0_DOT (_menhir_stack, _endpos) in
        let _menhir_s = MenhirState037 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.WILDCARD ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.UPPER_WORD _v ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.TYPE ->
            _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.PROP ->
            _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.PI ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LOGIC_TRUE ->
            _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_NOT ->
            _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_FORALL ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_FALSE ->
            _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_EXISTS ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFT_PAREN ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.INT ->
            _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.IF ->
            _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FUN ->
            _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ARITH_MINUS ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 37
    
    and _menhir_run_034 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LEFT_PAREN, ttv_result) _menhir_cell1_nonempty_list_raw_var_ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_nonempty_list_raw_var_ (_menhir_stack, _, l) = _menhir_stack in
            let MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
            let (ty, _endpos__5_) = (_v, _endpos_0) in
            let _v = _menhir_action_102 _endpos__5_ _startpos__1_ l ty in
            _menhir_goto_typed_ty_var_block _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _eRR 34
    
    and _menhir_run_128 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        let v = _v in
        let _v = _menhir_action_112 v in
        _menhir_goto_var_or_wildcard _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
    
    and _menhir_run_125 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_VERTICAL_BAR as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_raw_var (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
        match (_tok : MenhirBasics.token) with
        | Tokens.WILDCARD ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState125
        | Tokens.UPPER_WORD _v_0 ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState125
        | Tokens.LOWER_WORD _v_1 ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState125
        | Tokens.ARROW ->
            let _v_2 = _menhir_action_045 () in
            _menhir_run_130 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v_2 MenhirState125
        | _ ->
            _eRR 125
    
    and _menhir_run_107 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let v = _v in
        let _v = _menhir_action_105 v in
        _menhir_goto_typed_var_block _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_060 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        let (_endpos_v_, _startpos_v_, v) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_110 v in
        _menhir_goto_var _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_v_ _startpos_v_ _v _menhir_s _tok
    
    and _menhir_run_029 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v_0 ->
            let _menhir_stack = MenhirCell1_raw_var (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState029
        | Tokens.LOWER_WORD _v_1 ->
            let _menhir_stack = MenhirCell1_raw_var (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState029
        | Tokens.COLON ->
            let x = _v in
            let _v = _menhir_action_059 x in
            _menhir_goto_nonempty_list_raw_var_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 29
    
    and _menhir_goto_nonempty_list_raw_var_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState044 ->
            _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState028 ->
            _menhir_run_031 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | MenhirState029 ->
            _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_045 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_nonempty_list_raw_var_ (_menhir_stack, _menhir_s, _v) in
        let _menhir_s = MenhirState046 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.WILDCARD ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.UPPER_WORD _v ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.TYPE ->
            _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.PROP ->
            _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.PI ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.MATCH ->
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LOGIC_TRUE ->
            _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_NOT ->
            _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_FORALL ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_FALSE ->
            _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LOGIC_EXISTS ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.LEFT_PAREN ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.INTEGER _v ->
            _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.INT ->
            _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.IF ->
            _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.FUN ->
            _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | Tokens.ARITH_MINUS ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 46
    
    and _menhir_run_031 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LEFT_PAREN as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _menhir_stack = MenhirCell1_nonempty_list_raw_var_ (_menhir_stack, _menhir_s, _v) in
        let _menhir_s = MenhirState032 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.TYPE ->
            _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 32
    
    and _menhir_run_030 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_raw_var -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_raw_var (_menhir_stack, _menhir_s, x, _, _) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_060 x xs in
        _menhir_goto_nonempty_list_raw_var_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_008 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        let (_endpos_s_, s) = (_endpos, _v) in
        let _v = _menhir_action_012 s in
        _menhir_goto_atomic_attr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_s_ _v _menhir_s _tok
    
    and _menhir_goto_atomic_attr : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState002 ->
            _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState019 ->
            _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState006 ->
            _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState011 ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | MenhirState007 ->
            _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_015 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let a = _v in
        let _v = _menhir_action_020 a in
        _menhir_goto_attr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_attr : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState019 ->
            _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState002 ->
            _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState006 ->
            _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_018 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.COMMA ->
            let _menhir_stack = MenhirCell1_attr (_menhir_stack, _menhir_s, _v) in
            let _menhir_s = MenhirState019 in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.UPPER_WORD _v ->
                _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.QUOTED _v ->
                _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LOWER_WORD _v ->
                _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
            | Tokens.LEFT_PAREN ->
                _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
            | _ ->
                _eRR 19)
        | Tokens.RIGHT_BRACKET ->
            let x = _v in
            let _v = _menhir_action_077 x in
            _menhir_goto_separated_nonempty_list_COMMA_attr_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | _ ->
            _eRR 18
    
    and _menhir_run_004 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
        let _tok = _menhir_lexer _menhir_lexbuf in
        let (_endpos_s_, _startpos_s_, s) = (_endpos, _startpos, _v) in
        let _v = _menhir_action_013 _endpos_s_ _startpos_s_ s in
        _menhir_goto_atomic_attr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_s_ _v _menhir_s _tok
    
    and _menhir_run_006 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
        let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
        let _menhir_stack = MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s, _startpos) in
        let _menhir_s = MenhirState006 in
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.QUOTED _v ->
            _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LOWER_WORD _v ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
        | Tokens.LEFT_PAREN ->
            _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
        | _ ->
            _eRR 6
    
    and _menhir_goto_separated_nonempty_list_COMMA_attr_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
        match _menhir_s with
        | MenhirState019 ->
            _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | MenhirState002 ->
            _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_020 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_attr -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let MenhirCell1_attr (_menhir_stack, _menhir_s, x) = _menhir_stack in
        let xs = _v in
        let _v = _menhir_action_078 x xs in
        _menhir_goto_separated_nonempty_list_COMMA_attr_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
    
    and _menhir_run_016 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LEFT_BRACKET -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        let MenhirCell1_LEFT_BRACKET (_menhir_stack, _menhir_s) = _menhir_stack in
        let l = _v in
        let _v = _menhir_action_022 l in
        _menhir_goto_attrs _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_goto_attrs : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState241 ->
            _menhir_run_242 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState237 ->
            _menhir_run_238 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState233 ->
            _menhir_run_234 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState228 ->
            _menhir_run_229 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState221 ->
            _menhir_run_222 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState217 ->
            _menhir_run_218 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState211 ->
            _menhir_run_212 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState201 ->
            _menhir_run_202 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState177 ->
            _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState160 ->
            _menhir_run_161 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState156 ->
            _menhir_run_157 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState149 ->
            _menhir_run_150 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState145 ->
            _menhir_run_146 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | MenhirState001 ->
            _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_242 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_ASSERT as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_attrs (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.WILDCARD ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState242
        | Tokens.UPPER_WORD _v_0 ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState242
        | Tokens.TYPE ->
            _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState242
        | Tokens.PROP ->
            _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState242
        | Tokens.PI ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState242
        | Tokens.MATCH ->
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState242
        | Tokens.LOWER_WORD _v_1 ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState242
        | Tokens.LOGIC_TRUE ->
            _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState242
        | Tokens.LOGIC_NOT ->
            _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState242
        | Tokens.LOGIC_FORALL ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState242
        | Tokens.LOGIC_FALSE ->
            _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState242
        | Tokens.LOGIC_EXISTS ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState242
        | Tokens.LEFT_PAREN ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState242
        | Tokens.INTEGER _v_2 ->
            _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState242
        | Tokens.INT ->
            _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState242
        | Tokens.IF ->
            _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState242
        | Tokens.FUN ->
            _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState242
        | Tokens.ARITH_MINUS ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState242
        | _ ->
            _eRR 242
    
    and _menhir_run_238 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_DATA as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_attrs (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v_0 ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState238
        | Tokens.LOWER_WORD _v_1 ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState238
        | _ ->
            _eRR 238
    
    and _menhir_run_234 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_DEF as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_attrs (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v_0 ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState234
        | Tokens.LOWER_WORD _v_1 ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState234
        | _ ->
            _eRR 234
    
    and _menhir_run_229 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_GOAL as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_attrs (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.WILDCARD ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState229
        | Tokens.UPPER_WORD _v_0 ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState229
        | Tokens.TYPE ->
            _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState229
        | Tokens.PROP ->
            _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState229
        | Tokens.PI ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState229
        | Tokens.MATCH ->
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState229
        | Tokens.LOWER_WORD _v_1 ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState229
        | Tokens.LOGIC_TRUE ->
            _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState229
        | Tokens.LOGIC_NOT ->
            _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState229
        | Tokens.LOGIC_FORALL ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState229
        | Tokens.LOGIC_FALSE ->
            _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState229
        | Tokens.LOGIC_EXISTS ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState229
        | Tokens.LEFT_PAREN ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState229
        | Tokens.INTEGER _v_2 ->
            _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState229
        | Tokens.INT ->
            _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState229
        | Tokens.IF ->
            _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState229
        | Tokens.FUN ->
            _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState229
        | Tokens.ARITH_MINUS ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState229
        | _ ->
            _eRR 229
    
    and _menhir_run_222 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_LEMMA as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_attrs (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.WILDCARD ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState222
        | Tokens.UPPER_WORD _v_0 ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState222
        | Tokens.TYPE ->
            _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState222
        | Tokens.PROP ->
            _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState222
        | Tokens.PI ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState222
        | Tokens.MATCH ->
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState222
        | Tokens.LOWER_WORD _v_1 ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState222
        | Tokens.LOGIC_TRUE ->
            _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState222
        | Tokens.LOGIC_NOT ->
            _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState222
        | Tokens.LOGIC_FORALL ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState222
        | Tokens.LOGIC_FALSE ->
            _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState222
        | Tokens.LOGIC_EXISTS ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState222
        | Tokens.LEFT_PAREN ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState222
        | Tokens.INTEGER _v_2 ->
            _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState222
        | Tokens.INT ->
            _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState222
        | Tokens.IF ->
            _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState222
        | Tokens.FUN ->
            _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState222
        | Tokens.ARITH_MINUS ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState222
        | _ ->
            _eRR 222
    
    and _menhir_run_218 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_REWRITE as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_attrs (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.WILDCARD ->
            _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState218
        | Tokens.UPPER_WORD _v_0 ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState218
        | Tokens.TYPE ->
            _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState218
        | Tokens.PROP ->
            _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState218
        | Tokens.PI ->
            _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState218
        | Tokens.MATCH ->
            _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState218
        | Tokens.LOWER_WORD _v_1 ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState218
        | Tokens.LOGIC_TRUE ->
            _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState218
        | Tokens.LOGIC_NOT ->
            _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState218
        | Tokens.LOGIC_FORALL ->
            _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState218
        | Tokens.LOGIC_FALSE ->
            _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState218
        | Tokens.LOGIC_EXISTS ->
            _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState218
        | Tokens.LEFT_PAREN ->
            _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState218
        | Tokens.INTEGER _v_2 ->
            _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState218
        | Tokens.INT ->
            _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState218
        | Tokens.IF ->
            _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState218
        | Tokens.FUN ->
            _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState218
        | Tokens.ARITH_MINUS ->
            _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState218
        | _ ->
            _eRR 218
    
    and _menhir_run_212 : type  ttv_stack. ((ttv_stack, _menhir_box_input) _menhir_cell1_VAL as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_input) _menhir_state -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_attrs (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v_0 ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState212
        | Tokens.LOWER_WORD _v_1 ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState212
        | _ ->
            _eRR 212
    
    and _menhir_run_021 : type  ttv_stack. ((ttv_stack, _menhir_box_file) _menhir_cell1_VAL as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_file) _menhir_state -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
        let _menhir_stack = MenhirCell1_attrs (_menhir_stack, _menhir_s, _v) in
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v_0 ->
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState021
        | Tokens.LOWER_WORD _v_1 ->
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState021
        | _ ->
            _eRR 21
    
    and _menhir_run_013 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LEFT_PAREN -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.RIGHT_PAREN ->
            let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            let MenhirCell1_LEFT_PAREN (_menhir_stack, _menhir_s, _) = _menhir_stack in
            let (_endpos__3_, a) = (_endpos, _v) in
            let _v = _menhir_action_014 a in
            _menhir_goto_atomic_attr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _v _menhir_s _tok
        | _ ->
            _eRR 13
    
    and _menhir_run_011 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v_0 ->
            let _menhir_stack = MenhirCell1_atomic_attr (_menhir_stack, _menhir_s, _v, _endpos) in
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState011
        | Tokens.QUOTED _v_1 ->
            let _menhir_stack = MenhirCell1_atomic_attr (_menhir_stack, _menhir_s, _v, _endpos) in
            _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState011
        | Tokens.LOWER_WORD _v_2 ->
            let _menhir_stack = MenhirCell1_atomic_attr (_menhir_stack, _menhir_s, _v, _endpos) in
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState011
        | Tokens.LEFT_PAREN ->
            let _menhir_stack = MenhirCell1_atomic_attr (_menhir_stack, _menhir_s, _v, _endpos) in
            _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState011
        | Tokens.COMMA | Tokens.RIGHT_BRACKET | Tokens.RIGHT_PAREN ->
            let (_endpos_x_, x) = (_endpos, _v) in
            let _v = _menhir_action_053 x in
            _menhir_goto_nonempty_list_atomic_attr_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_x_ _v _menhir_s _tok
        | _ ->
            _eRR 11
    
    and _menhir_goto_nonempty_list_atomic_attr_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
        match _menhir_s with
        | MenhirState011 ->
            _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | MenhirState007 ->
            _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
        | _ ->
            _menhir_fail ()
    
    and _menhir_run_012 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_atomic_attr -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_atomic_attr (_menhir_stack, _menhir_s, x, _) = _menhir_stack in
        let (_endpos_xs_, xs) = (_endpos, _v) in
        let _v = _menhir_action_054 x xs in
        _menhir_goto_nonempty_list_atomic_attr_ _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_xs_ _v _menhir_s _tok
    
    and _menhir_run_009 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_raw_var -> _ -> _ -> _ -> _ -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
        let MenhirCell1_raw_var (_menhir_stack, _menhir_s, s, _startpos_s_, _) = _menhir_stack in
        let (_endpos_l_, l) = (_endpos, _v) in
        let _v = _menhir_action_021 _endpos_l_ _startpos_s_ l s in
        _menhir_goto_attr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
    
    and _menhir_run_007 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
        match (_tok : MenhirBasics.token) with
        | Tokens.UPPER_WORD _v_0 ->
            let _menhir_stack = MenhirCell1_raw_var (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState007
        | Tokens.QUOTED _v_1 ->
            let _menhir_stack = MenhirCell1_raw_var (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState007
        | Tokens.LOWER_WORD _v_2 ->
            let _menhir_stack = MenhirCell1_raw_var (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState007
        | Tokens.LEFT_PAREN ->
            let _menhir_stack = MenhirCell1_raw_var (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
            _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState007
        | Tokens.COMMA | Tokens.RIGHT_BRACKET | Tokens.RIGHT_PAREN ->
            let (_endpos_s_, s) = (_endpos, _v) in
            let _v = _menhir_action_012 s in
            _menhir_goto_atomic_attr _menhir_stack _menhir_lexbuf _menhir_lexer _endpos_s_ _v _menhir_s _tok
        | _ ->
            _eRR 7
    
    let _menhir_run_000 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_file =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.VAL ->
            _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
        | Tokens.REWRITE ->
            _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
        | Tokens.LEMMA ->
            _menhir_run_149 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
        | Tokens.INCLUDE ->
            _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
        | Tokens.GOAL ->
            _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
        | Tokens.DEF ->
            _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
        | Tokens.DATA ->
            _menhir_run_177 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
        | Tokens.ASSERT ->
            _menhir_run_201 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState000
        | Tokens.EOF ->
            let _v = _menhir_action_043 () in
            _menhir_run_207 _menhir_stack _v
        | _ ->
            _eRR 0
    
    let _menhir_run_210 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_input =
      fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
        let _tok = _menhir_lexer _menhir_lexbuf in
        match (_tok : MenhirBasics.token) with
        | Tokens.VAL ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell1_VAL (_menhir_stack, MenhirState210, _startpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.LEFT_BRACKET ->
                _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState211
            | Tokens.LOWER_WORD _ | Tokens.UPPER_WORD _ ->
                let _v = _menhir_action_023 () in
                _menhir_run_212 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState211 _tok
            | _ ->
                _eRR 211)
        | Tokens.REWRITE ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell1_REWRITE (_menhir_stack, MenhirState210, _startpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.LEFT_BRACKET ->
                _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState217
            | Tokens.ARITH_MINUS | Tokens.FUN | Tokens.IF | Tokens.INT | Tokens.INTEGER _ | Tokens.LEFT_PAREN | Tokens.LOGIC_EXISTS | Tokens.LOGIC_FALSE | Tokens.LOGIC_FORALL | Tokens.LOGIC_NOT | Tokens.LOGIC_TRUE | Tokens.LOWER_WORD _ | Tokens.MATCH | Tokens.PI | Tokens.PROP | Tokens.TYPE | Tokens.UPPER_WORD _ | Tokens.WILDCARD ->
                let _v = _menhir_action_023 () in
                _menhir_run_218 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState217 _tok
            | _ ->
                _eRR 217)
        | Tokens.LEMMA ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell1_LEMMA (_menhir_stack, MenhirState210, _startpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.LEFT_BRACKET ->
                _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState221
            | Tokens.ARITH_MINUS | Tokens.FUN | Tokens.IF | Tokens.INT | Tokens.INTEGER _ | Tokens.LEFT_PAREN | Tokens.LOGIC_EXISTS | Tokens.LOGIC_FALSE | Tokens.LOGIC_FORALL | Tokens.LOGIC_NOT | Tokens.LOGIC_TRUE | Tokens.LOWER_WORD _ | Tokens.MATCH | Tokens.PI | Tokens.PROP | Tokens.TYPE | Tokens.UPPER_WORD _ | Tokens.WILDCARD ->
                let _v = _menhir_action_023 () in
                _menhir_run_222 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState221 _tok
            | _ ->
                _eRR 221)
        | Tokens.INCLUDE ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.QUOTED _v ->
                let _tok = _menhir_lexer _menhir_lexbuf in
                (match (_tok : MenhirBasics.token) with
                | Tokens.DOT ->
                    let _endpos_1 = _menhir_lexbuf.Lexing.lex_curr_p in
                    let _v =
                      let (_startpos__1_, s, _endpos__3_) = (_startpos, _v, _endpos_1) in
                      _menhir_action_083 _endpos__3_ _startpos__1_ s
                    in
                    _menhir_run_245 _menhir_stack _v
                | _ ->
                    _eRR 226)
            | _ ->
                _eRR 225)
        | Tokens.GOAL ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell1_GOAL (_menhir_stack, MenhirState210, _startpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.LEFT_BRACKET ->
                _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState228
            | Tokens.ARITH_MINUS | Tokens.FUN | Tokens.IF | Tokens.INT | Tokens.INTEGER _ | Tokens.LEFT_PAREN | Tokens.LOGIC_EXISTS | Tokens.LOGIC_FALSE | Tokens.LOGIC_FORALL | Tokens.LOGIC_NOT | Tokens.LOGIC_TRUE | Tokens.LOWER_WORD _ | Tokens.MATCH | Tokens.PI | Tokens.PROP | Tokens.TYPE | Tokens.UPPER_WORD _ | Tokens.WILDCARD ->
                let _v = _menhir_action_023 () in
                _menhir_run_229 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState228 _tok
            | _ ->
                _eRR 228)
        | Tokens.EOF ->
            let _v = _menhir_action_037 () in
            _menhir_goto_input _menhir_stack _v
        | Tokens.DEF ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell1_DEF (_menhir_stack, MenhirState210, _startpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.LEFT_BRACKET ->
                _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState233
            | Tokens.LOWER_WORD _ | Tokens.UPPER_WORD _ ->
                let _v = _menhir_action_023 () in
                _menhir_run_234 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState233 _tok
            | _ ->
                _eRR 233)
        | Tokens.DATA ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell1_DATA (_menhir_stack, MenhirState210, _startpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.LEFT_BRACKET ->
                _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState237
            | Tokens.LOWER_WORD _ | Tokens.UPPER_WORD _ ->
                let _v = _menhir_action_023 () in
                _menhir_run_238 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState237 _tok
            | _ ->
                _eRR 237)
        | Tokens.ASSERT ->
            let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
            let _menhir_stack = MenhirCell1_ASSERT (_menhir_stack, MenhirState210, _startpos) in
            let _tok = _menhir_lexer _menhir_lexbuf in
            (match (_tok : MenhirBasics.token) with
            | Tokens.LEFT_BRACKET ->
                _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState241
            | Tokens.ARITH_MINUS | Tokens.FUN | Tokens.IF | Tokens.INT | Tokens.INTEGER _ | Tokens.LEFT_PAREN | Tokens.LOGIC_EXISTS | Tokens.LOGIC_FALSE | Tokens.LOGIC_FORALL | Tokens.LOGIC_NOT | Tokens.LOGIC_TRUE | Tokens.LOWER_WORD _ | Tokens.MATCH | Tokens.PI | Tokens.PROP | Tokens.TYPE | Tokens.UPPER_WORD _ | Tokens.WILDCARD ->
                let _v = _menhir_action_023 () in
                _menhir_run_242 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState241 _tok
            | _ ->
                _eRR 241)
        | _ ->
            _eRR 210
    
  end
  
  let input =
    fun _menhir_lexer _menhir_lexbuf ->
      let _menhir_stack = () in
      let MenhirBox_input v = _menhir_run_210 _menhir_stack _menhir_lexbuf _menhir_lexer in
      v
  
  let file =
    fun _menhir_lexer _menhir_lexbuf ->
      let _menhir_stack = () in
      let MenhirBox_file v = _menhir_run_000 _menhir_stack _menhir_lexbuf _menhir_lexer in
      v
  
# 279 "src/languages/zf/parser.mly"
  


# 6681 "src/languages/zf/parser.ml"
  
end
