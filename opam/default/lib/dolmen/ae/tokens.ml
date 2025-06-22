
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
  | STRING of (string)
  | SLASH
  | SHARP
  | RIGHTSQ
  | RIGHTPAR
  | RIGHTBR
  | RIGHTARROW
  | REWRITING
  | REAL
  | QUOTE
  | QM_ID of (string)
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
  | INTEGER of (string)
  | INT
  | IN
  | IF
  | ID of (string)
  | HEXADECIMAL of (string)
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
  | DECIMAL of (string)
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
