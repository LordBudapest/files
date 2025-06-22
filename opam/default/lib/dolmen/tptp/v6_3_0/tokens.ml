
type token = 
  | XOR
  | VLINE
  | UPPER_WORD of (string)
  | TPI
  | THF
  | TFF
  | STAR
  | SINGLE_QUOTED of (string)
  | SIGMA
  | RIGHT_PAREN
  | RIGHT_BRACKET
  | REAL of (string)
  | RATIONAL of (string)
  | PLUS
  | PI
  | NOT_EQUAL
  | NOTVLINE
  | NOTAND
  | NOT
  | LOWER_WORD of (string)
  | LET_TT
  | LET_TF
  | LET_FT
  | LET_FF
  | LESS
  | LEFT_PAREN
  | LEFT_IMPLY
  | LEFT_BRACKET
  | LAMBDA
  | ITE_T
  | ITE_F
  | INTEGER of (string)
  | INDEFINITE_DESCRIPTION
  | INCLUDE
  | IMPLY
  | GENTZEN_ARROW
  | FORALL_TY
  | FORALL
  | FOF
  | EXISTS_TY
  | EXISTS
  | EQUIV
  | EQUAL
  | EOF
  | DOT
  | DOLLAR_WORD of (string)
  | DOLLAR_THF
  | DOLLAR_TFF
  | DOLLAR_FOT
  | DOLLAR_FOF
  | DOLLAR_DOLLAR_WORD of (string)
  | DOLLAR_CNF
  | DISTINCT_OBJECT of (string)
  | DEFINITE_DESCRIPTION
  | COMMA
  | COLON
  | CNF
  | ARROW
  | APPLY
  | AND
