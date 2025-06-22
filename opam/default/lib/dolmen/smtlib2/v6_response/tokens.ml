
type token = 
  | UNSAT
  | UNDERSCORE
  | SYMBOL of (string)
  | STR of (string)
  | SAT
  | OPEN
  | NUM of (string)
  | MODEL
  | MATCH
  | LET
  | KEYWORD of (string)
  | HEX of (string)
  | FORALL
  | EXISTS
  | EOF
  | DEFINE_FUN_REC
  | DEFINE_FUNS_REC
  | DEFINE_FUN
  | DEC of (string)
  | CLOSE
  | BIN of (string)
  | ATTRIBUTE
  | AS
