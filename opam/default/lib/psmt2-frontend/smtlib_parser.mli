
(* The type of tokens. *)

type token = 
  | VERSION
  | VERBOSITY
  | VALUES
  | UNDERSCORE
  | THEORIES
  | SYMBOL of (string)
  | STRINGLIT of (string)
  | STATUTS
  | SOURCE
  | SORTSDESCRIPTION
  | SORTS
  | SMTLIBVERSION
  | SETOPTION
  | SETLOGIC
  | SETINFO
  | SERIES
  | RP
  | RESSOURCELIMIT
  | RESETASSERTIONS
  | RESET
  | REGULAROUTPUTCHAN
  | REASONUNKNOWN
  | RANDOMSEED
  | PUSH
  | PRODUCEUNSATCORES
  | PRODUCEUNSATASSUMPTIONS
  | PRODUCEPROOFS
  | PRODUCEMODELS
  | PRODUCEASSIGNEMENT
  | PRODUCEASSERTIONS
  | PRINTSUCCESS
  | POP
  | PATTERN
  | PAR
  | NUMERAL of (string)
  | NOTES
  | NAMED
  | NAME
  | MATCH
  | LP
  | LICENSE
  | LET
  | LANGUAGE
  | INTERACTIVE
  | INSTANCE
  | INCREMENTAL
  | HEXADECIMAL of (string)
  | GLOBALDECLARATIONS
  | GETVALUE
  | GETUNSATCORE
  | GETUNSATASSUMPTIONS
  | GETPROOF
  | GETOPTION
  | GETMODEL
  | GETINFO
  | GETASSIGN
  | GETASSERT
  | FUNSDESCRIPT
  | FUNS
  | FORALL
  | EXTENSIONS
  | EXIT
  | EXISTS
  | EXCLIMATIONPT
  | ERRORBEHAV
  | EOF
  | ECHO
  | DIFFICULTY
  | DIAGNOOUTPUTCHAN
  | DEFINITIO
  | DEFINESORT
  | DEFINEFUNSREC
  | DEFINEFUNREC
  | DEFINEFUN
  | DECLARESORT
  | DECLAREFUN
  | DECLAREDATATYPES
  | DECLAREDATATYPE
  | DECLARECONST
  | DECIMAL of (string)
  | CHECKSATASSUMING
  | CHECKSAT
  | CHECKENTAILMENT
  | CHECKALLSAT
  | CATEGORY
  | BINARY of (string)
  | AXIOMS
  | AUTHORS
  | AUTHOR
  | ASSERTIONSTACKLVL
  | ASSERT
  | ASCIIWOR of (string)
  | AS
  | ALLSTATS

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val term_list: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Smtlib_syntax.term list * bool)

val term: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Smtlib_syntax.term)

val commands: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Smtlib_syntax.commands)
