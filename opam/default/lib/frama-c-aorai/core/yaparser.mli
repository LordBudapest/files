
(* The type of tokens. *)

type token = 
  | TRUE
  | STAR
  | SLASH
  | SEMI_COLON
  | RSQUARE
  | RPAREN
  | RETURN_OF
  | RCURLY
  | RBRACERBRACE
  | RARROW
  | QUESTION
  | PLUS
  | PIPE
  | PERCENT
  | OTHERWISE
  | OR
  | NOT
  | NEQ
  | MINUS
  | METAVAR of (string)
  | LT
  | LSQUARE
  | LPAREN
  | LE
  | LCURLY
  | LBRACELBRACE
  | INT of (string)
  | IDENTIFIER of (string)
  | GT
  | GE
  | FLOAT of (string)
  | FALSE
  | EQ
  | EOF
  | DOT
  | COMMA
  | COLUMNCOLUMN
  | COLON
  | CARET
  | CALL_OF
  | CALLORRETURN_OF
  | AND
  | AMP
  | AFF

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val main: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> ((Automaton_ast.guard, Automaton_ast.action) Automaton_ast.automaton)
