
module Make
           (L : Dolmen_intf.Location.S)
           (I : Ast.Id)
           (T : Ast.Term with type location := L.t and type id := I.t)
           (S : Ast.Statement with type location := L.t and type id := I.t and type term := T.t)
           (E : Ast.Extension with type location := L.t and type term := T.t and type statement := S.t)
: sig
  
  (* The type of tokens. *)
  
  type token = Tokens.token
  
  (* This exception is raised by the monolithic API functions. *)
  
  exception Error of int
  
  (* The monolithic API. *)
  
  val term: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (T.t)
  
  val input: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (S.t option)
  
  val file: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (S.t list)
  
end
