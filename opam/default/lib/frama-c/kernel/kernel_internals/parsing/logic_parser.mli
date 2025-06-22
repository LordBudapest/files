
(* The type of tokens. *)

type token = 
  | WSTRING_CONSTANT of (string)
  | WRITES
  | WITH
  | VOLATILE
  | VOID
  | VARIANT
  | VALID_READ
  | VALID_RANGE
  | VALID_INDEX
  | VALID_FUNCTION
  | VALID
  | UNSIGNED
  | UNION
  | UNALLOCATED
  | TYPEOF
  | TYPENAME of (string)
  | TYPE
  | TRUE
  | TILDE
  | TERMINATES
  | STRUCT
  | STRING_LITERAL of (bool*string)
  | STRING_CONSTANT of (string)
  | STATIC
  | STARHAT
  | STAR
  | SLASH
  | SIZEOF
  | SIGNED
  | SHORT
  | SEPARATED
  | SEMICOLON
  | RSQUAREPIPE
  | RSQUARE
  | RPAR
  | RETURNS
  | RESULT
  | REQUIRES
  | REGISTER
  | REAL
  | READS
  | RBRACE
  | QUESTION
  | PREDICATE
  | PLUS
  | PIPE
  | PI
  | PERCENT
  | OR
  | OLD
  | OFFSET
  | OBJECT_POINTER
  | NULL
  | NOTHING
  | NOT
  | NE
  | MODULE
  | MODEL
  | MINUS
  | LTLT
  | LT
  | LSQUAREPIPE
  | LSQUARE
  | LPAR
  | LOOP
  | LONGIDENT of (string)
  | LONG
  | LOGIC
  | LET
  | LEMMA
  | LE
  | LBRACE
  | LAMBDA
  | LABEL
  | INVARIANT
  | INT_CONSTANT of (string)
  | INTER
  | INTEGER
  | INT
  | INITIALIZED
  | INDUCTIVE
  | IN
  | IMPORT
  | IMPLIES
  | IFF
  | IF
  | IDENTIFIER_LOADER of (string)
  | IDENTIFIER_EXT of (string)
  | IDENTIFIER of (string)
  | HATHAT
  | HAT
  | GTGT
  | GT
  | GLOBAL
  | GHOST
  | GE
  | FROM
  | FRESH
  | FREES
  | FREEABLE
  | FORALL
  | FOR
  | FLOAT_CONSTANT of (string)
  | FLOAT
  | FALSE
  | EXT_SPEC_MODULE
  | EXT_SPEC_LET
  | EXT_SPEC_INCLUDE
  | EXT_SPEC_FUNCTION
  | EXT_SPEC_CONTRACT
  | EXT_SPEC_AT
  | EXT_LOADER_PLUGIN of (string * string)
  | EXT_LOADER of (string * string)
  | EXT_GLOBAL_BLOCK of (string * string)
  | EXT_GLOBAL of (string * string)
  | EXT_CONTRACT of (string * string)
  | EXT_CODE_ANNOT of (string * string)
  | EXITS
  | EXISTS
  | EQUAL
  | EQ
  | EOF
  | ENUM
  | ENSURES
  | EMPTY
  | ELSE
  | DYNAMIC
  | DOUBLE
  | DOTDOTDOT
  | DOTDOT
  | DOT
  | DOLLAR
  | DISJOINT
  | DECREASES
  | DANGLING
  | CONTINUES
  | CONST
  | COMPLETE
  | COMMA
  | COLONCOLON
  | COLON2
  | COLON
  | CHECK_RETURNS
  | CHECK_REQUIRES
  | CHECK_LOOP
  | CHECK_LEMMA
  | CHECK_INVARIANT
  | CHECK_EXITS
  | CHECK_ENSURES
  | CHECK_CONTINUES
  | CHECK_BREAKS
  | CHECK
  | CHAR
  | CASE
  | BSUNION
  | BSTYPE
  | BSGHOST
  | BREAKS
  | BOOLEAN
  | BOOL
  | BLOCK_LENGTH
  | BIMPLIES
  | BIFF
  | BEHAVIORS
  | BEHAVIOR
  | BASE_ADDR
  | AXIOMATIC
  | AXIOM
  | AUTOMATIC
  | AT
  | ASSUMES
  | ASSIGNS
  | ASSERT
  | AS
  | ARROW
  | AND
  | AMP
  | ALLOCATION
  | ALLOCATES
  | ALLOCABLE
  | ADMIT_RETURNS
  | ADMIT_REQUIRES
  | ADMIT_LOOP
  | ADMIT_LEMMA
  | ADMIT_INVARIANT
  | ADMIT_EXITS
  | ADMIT_ENSURES
  | ADMIT_CONTINUES
  | ADMIT_BREAKS
  | ADMIT

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val spec: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Logic_ptree.spec)

val lexpr_eof: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Logic_ptree.lexpr)

val ext_spec: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Logic_ptree.ext_spec)

val annot: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Logic_ptree.annot)
