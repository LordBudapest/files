
(* The type of tokens. *)

type token = 
  | UNDERSCORE
  | SYMBOL of (string)
  | STR of (string)
  | SET_OPTION
  | SET_LOGIC
  | SET_INFO
  | RESET_ASSERTIONS
  | RESET
  | PUSH
  | POP
  | PAR
  | OPEN
  | NUM of (string)
  | MATCH
  | LET
  | KEYWORD of (string)
  | HEX of (string)
  | GET_VALUE
  | GET_UNSAT_CORE
  | GET_UNSAT_ASSUMPTIONS
  | GET_PROOF
  | GET_OPTION
  | GET_MODEL
  | GET_INFO
  | GET_ASSIGNMENT
  | GET_ASSERTIONS
  | FORALL
  | EXIT
  | EXISTS
  | EOF
  | ECHO
  | DEFINE_SORT
  | DEFINE_FUN_REC
  | DEFINE_FUNS_REC
  | DEFINE_FUN
  | DECLARE_SORT
  | DECLARE_FUN
  | DECLARE_DATATYPES
  | DECLARE_DATATYPE
  | DECLARE_CONST
  | DEC of (string)
  | CLOSE
  | CHECK_SAT_ASSUMING
  | CHECK_SAT
  | BIN of (string)
  | ATTRIBUTE
  | ASSERT
  | AS
