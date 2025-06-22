
module Make
           (L : Dolmen_intf.Location.S)
           (T : Ast.Term with type location := L.t)
           (S : Ast.Statement with type location := L.t and type term := T.t)
: sig
  
  (* The type of tokens. *)
  
  type token = Tokens.token
  
  (* This exception is raised by the monolithic API functions. *)
  
  exception Error of int
  
  (* The monolithic API. *)
  
  val input: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (S.t option)
  
  val file: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (S.t list)
  
end
