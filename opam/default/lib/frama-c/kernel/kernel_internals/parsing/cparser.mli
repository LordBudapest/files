
(* The type of tokens. *)

type token = 
  | WHILE of (Cabs.cabsloc)
  | VOLATILE of (Cabs.cabsloc)
  | VOID of (Cabs.cabsloc)
  | UNSIGNED of (Cabs.cabsloc)
  | UNION of (Cabs.cabsloc)
  | TYPEOF of (Cabs.cabsloc)
  | TYPEDEF of (Cabs.cabsloc)
  | TILDE of (Cabs.cabsloc)
  | THREAD_LOCAL of (Cabs.cabsloc)
  | THREAD of (Cabs.cabsloc)
  | SWITCH of (Cabs.cabsloc)
  | SUP_SUP_EQ
  | SUP_SUP
  | SUP_EQ
  | SUP
  | STRUCT of (Cabs.cabsloc)
  | STATIC_ASSERT of (Cabs.cabsloc)
  | STATIC of (Cabs.cabsloc)
  | STAR_EQ
  | STAR of (Cabs.cabsloc)
  | SPEC of (Filepath.position * string)
  | SLASH_EQ
  | SLASH
  | SIZEOF of (Cabs.cabsloc)
  | SIGNED of (Cabs.cabsloc)
  | SHORT of (Cabs.cabsloc)
  | SEMICOLON of (Cabs.cabsloc)
  | RPAREN
  | RGHOST
  | RETURN of (Cabs.cabsloc)
  | RESTRICT of (Cabs.cabsloc)
  | REGISTER of (Cabs.cabsloc)
  | RBRACKET
  | RBRACE of (Cabs.cabsloc)
  | QUEST
  | PRETTY_FUNCTION__ of (Cabs.cabsloc)
  | PRAGMA_LINE of (string * Cabs.cabsloc)
  | PRAGMA_EOL
  | PRAGMA of (Cabs.cabsloc)
  | PLUS_PLUS of (Cabs.cabsloc)
  | PLUS_EQ
  | PLUS of (Cabs.cabsloc)
  | PIPE_PIPE
  | PIPE_EQ
  | PIPE
  | PERCENT_EQ
  | PERCENT
  | NORETURN of (Cabs.cabsloc)
  | NOP_ATTRIBUTE of (Cabs.cabsloc)
  | NAMED_TYPE of (string)
  | MSATTR of (string * Cabs.cabsloc)
  | MINUS_MINUS of (Cabs.cabsloc)
  | MINUS_EQ
  | MINUS of (Cabs.cabsloc)
  | LPAREN of (Cabs.cabsloc)
  | LOOP_ANNOT of (Logic_ptree.code_annot list * Cabs.cabsloc)
  | LONG of (Cabs.cabsloc)
  | LGHOST_ELSE of (Cabs.cabsloc)
  | LGHOST
  | LBRACKET
  | LBRACE of (Cabs.cabsloc)
  | LABEL__
  | INT64 of (Cabs.cabsloc)
  | INT of (Cabs.cabsloc)
  | INLINE of (Cabs.cabsloc)
  | INF_INF_EQ
  | INF_INF
  | INF_EQ
  | INF
  | IF of (Cabs.cabsloc)
  | IDENT of (string)
  | GOTO of (Cabs.cabsloc)
  | GHOST of (Cabs.cabsloc)
  | GENERIC of (Cabs.cabsloc)
  | FUNCTION__ of (Cabs.cabsloc)
  | FOR of (Cabs.cabsloc)
  | FLOAT of (Cabs.cabsloc)
  | EXTERN of (Cabs.cabsloc)
  | EXCLAM_EQ
  | EXCLAM of (Cabs.cabsloc)
  | EQ_EQ
  | EQ
  | EOF
  | ENUM of (Cabs.cabsloc)
  | ELSE
  | ELLIPSIS
  | DOUBLE of (Cabs.cabsloc)
  | DOT
  | DO of (Cabs.cabsloc)
  | DEFAULT of (Cabs.cabsloc)
  | DECLSPEC of (Cabs.cabsloc)
  | DECL of (Logic_ptree.decl list)
  | CST_WSTRING of (int64 list * Cabs.cabsloc)
  | CST_WCHAR of (int64 list * Cabs.cabsloc)
  | CST_STRING of (int64 list * Cabs.cabsloc)
  | CST_INT of (string * Cabs.cabsloc)
  | CST_FLOAT of (string * Cabs.cabsloc)
  | CST_CHAR of (int64 list * Cabs.cabsloc)
  | CONTINUE of (Cabs.cabsloc)
  | CONST of (Cabs.cabsloc)
  | COMMA
  | COLON2
  | COLON
  | CODE_ANNOT of (Logic_ptree.code_annot * Cabs.cabsloc)
  | CIRC_EQ
  | CIRC
  | CHAR of (Cabs.cabsloc)
  | CASE of (Cabs.cabsloc)
  | BUILTIN_VA_ARG of (Cabs.cabsloc)
  | BUILTIN_TYPES_COMPAT of (Cabs.cabsloc)
  | BUILTIN_OFFSETOF of (Cabs.cabsloc)
  | BREAK of (Cabs.cabsloc)
  | BOOL of (Cabs.cabsloc)
  | BLOCKATTRIBUTE
  | AUTO of (Cabs.cabsloc)
  | ATTRIBUTE_ANNOT of (string * Cabs.cabsloc)
  | ATTRIBUTE of (Cabs.cabsloc)
  | ASM of (Cabs.cabsloc)
  | ARROW
  | AND_EQ
  | AND_AND of (Cabs.cabsloc)
  | AND of (Cabs.cabsloc)
  | ALIGNOF of (Cabs.cabsloc)

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val interpret: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> ((bool * Cabs.definition) list)

val file: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> ((bool * Cabs.definition) list)
