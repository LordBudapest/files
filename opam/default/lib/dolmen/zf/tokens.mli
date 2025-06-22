
(* The type of tokens. *)

type token = 
  | WITH
  | WILDCARD
  | WHERE
  | VERTICAL_BAR
  | VAL
  | UPPER_WORD of (string)
  | TYPE
  | THEN
  | SEMI_COLON
  | RIGHT_PAREN
  | RIGHT_BRACKET
  | REWRITE
  | QUOTED of (string)
  | PROP
  | PI
  | MATCH
  | LOWER_WORD of (string)
  | LOGIC_TRUE
  | LOGIC_OR
  | LOGIC_NOT
  | LOGIC_NEQ
  | LOGIC_IMPLY
  | LOGIC_FORALL
  | LOGIC_FALSE
  | LOGIC_EXISTS
  | LOGIC_EQUIV
  | LOGIC_EQ
  | LOGIC_AND
  | LEMMA
  | LEFT_PAREN
  | LEFT_BRACKET
  | INTEGER of (string)
  | INT
  | INCLUDE
  | IF
  | GOAL
  | FUN
  | EQDEF
  | EOF
  | END
  | ELSE
  | DOT
  | DEF
  | DATA
  | COMMA
  | COLON
  | ASSERT
  | ARROW
  | ARITH_PRODUCT
  | ARITH_PLUS
  | ARITH_MINUS
  | ARITH_LT
  | ARITH_LEQ
  | ARITH_GT
  | ARITH_GEQ
  | AND
