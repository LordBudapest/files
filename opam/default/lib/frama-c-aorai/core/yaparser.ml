
module MenhirBasics = struct
  
  exception Error = Parsing.Parse_error
  
  let _eRR =
    fun _s ->
      raise Error
  
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
    | METAVAR of (
# 155 "src/plugins/aorai/yaparser.mly"
       (string)
# 34 "src/plugins/aorai/yaparser.ml"
  )
    | LT
    | LSQUARE
    | LPAREN
    | LE
    | LCURLY
    | LBRACELBRACE
    | INT of (
# 156 "src/plugins/aorai/yaparser.mly"
       (string)
# 45 "src/plugins/aorai/yaparser.ml"
  )
    | IDENTIFIER of (
# 154 "src/plugins/aorai/yaparser.mly"
       (string)
# 50 "src/plugins/aorai/yaparser.ml"
  )
    | GT
    | GE
    | FLOAT of (
# 157 "src/plugins/aorai/yaparser.mly"
       (string)
# 57 "src/plugins/aorai/yaparser.ml"
  )
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
  
end

include MenhirBasics

# 29 "src/plugins/aorai/yaparser.mly"
  
open Cil_types
open Logic_ptree
open Automaton_ast
open Bool3

type options =
  | Deterministic
  | Init of string list
  | Accept of string list
  | Observables of string list

let to_seq c =
  [{ condition = Some c;
     nested = [];
     min_rep = Some Data_for_aorai.cst_one;
     max_rep = Some Data_for_aorai.cst_one;
   }]

let is_no_repet (min,max) =
  let is_one c = Option.fold ~some:Data_for_aorai.is_cst_one ~none:false c in
  is_one min && is_one max

let observed_states      = Hashtbl.create 1
let prefetched_states    = Hashtbl.create 1

let fetch_and_create_state name =
  Hashtbl.remove prefetched_states name ;
  try
    Hashtbl.find observed_states name
  with
    Not_found ->
      let s = Data_for_aorai.new_state name in
      Hashtbl.add observed_states name s; s
;;

let prefetch_and_create_state name =
    if (Hashtbl.mem prefetched_states name) ||
      not (Hashtbl.mem observed_states name)
    then
      begin
        let s= fetch_and_create_state name in
        Hashtbl.add prefetched_states name name;
        s
      end
    else
      (fetch_and_create_state name)
;;

let set_init_state id =
  try
    let state = Hashtbl.find observed_states id in
    state.init <- True
  with Not_found ->
    Aorai_option.abort "no state '%s'" id

let set_accept_state id =
  try
    let state = Hashtbl.find observed_states id in
    state.acceptation <- True
  with Not_found ->
    Aorai_option.abort "no state '%s'" id

let add_metavariable map (name,typename) =
  let ty = match typename with
    | "int" -> TInt(IInt, [])
    | "char" -> TInt(IChar, [])
    | "long" -> TInt(ILong, [])
    | _ ->
      Aorai_option.abort "Unrecognized type %s for metavariable %s"
        typename name
  in
  if Datatype.String.Map.mem name map then
    Aorai_option.abort "The metavariable %s is declared twice" name;
  let vi =
    Cil.makeGlobalVar
      ~ghost:true (Data_for_aorai.get_fresh ("aorai_" ^ name)) ty
  in
  Datatype.String.Map.add name vi map

let check_state st =
  if st.acceptation=Undefined || st.init=Undefined then
   Aorai_option.abort
    "Error: the state '%s' is used but never defined." st.name

let interpret_option auto = function
  | Init states ->
    List.iter set_init_state states; auto
  | Accept states ->
    List.iter set_accept_state states; auto
  | Deterministic ->
    Aorai_option.Deterministic.set true; auto
  | Observables names ->
    let module Set = Datatype.String.Set in
    let new_set = Set.of_list names in
    let observables =
      match auto.observables with
      | None -> Some new_set
      | Some set -> Some (Set.union set new_set)
    in
    { auto with observables }

let build_automaton options metavariables trans =
  let htable_to_list table = Hashtbl.fold (fun _ st l -> st :: l) table [] in
  let states = htable_to_list observed_states
  and undefined_states = htable_to_list prefetched_states
  and metavariables =
    List.fold_left add_metavariable Datatype.String.Map.empty metavariables
  in
  let auto = { states; trans; metavariables; observables = None } in
  let auto = List.fold_left interpret_option auto options in
  List.iter check_state states;
  if not (List.exists (fun st -> st.init=True) states) then
    Aorai_option.abort "Automaton does not declare an initial state";
  if undefined_states <> [] then
    Aorai_option.abort "Error: the state(s) %a are used but never defined."
      (Pretty_utils.pp_list ~sep:"," Format.pp_print_string) undefined_states;
  auto

type pre_cond = Behavior of string | Pre of Automaton_ast.condition



# 201 "src/plugins/aorai/yaparser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState000 : ('s, _menhir_box_main) _menhir_state
    (** State 000.
        Stack shape : .
        Start symbol: main. *)

  | MenhirState010 : (('s, _menhir_box_main) _menhir_cell1_options, _menhir_box_main) _menhir_state
    (** State 010.
        Stack shape : options.
        Start symbol: main. *)

  | MenhirState015 : ((('s, _menhir_box_main) _menhir_cell1_options, _menhir_box_main) _menhir_cell1_non_empty_metavars, _menhir_box_main) _menhir_state
    (** State 015.
        Stack shape : options non_empty_metavars.
        Start symbol: main. *)

  | MenhirState017 : ((('s, _menhir_box_main) _menhir_cell1_options, _menhir_box_main) _menhir_cell1_metavars, _menhir_box_main) _menhir_state
    (** State 017.
        Stack shape : options metavars.
        Start symbol: main. *)

  | MenhirState019 : (('s, _menhir_box_main) _menhir_cell1_IDENTIFIER, _menhir_box_main) _menhir_state
    (** State 019.
        Stack shape : IDENTIFIER.
        Start symbol: main. *)

  | MenhirState020 : (('s, _menhir_box_main) _menhir_cell1_OTHERWISE, _menhir_box_main) _menhir_state
    (** State 020.
        Stack shape : OTHERWISE.
        Start symbol: main. *)

  | MenhirState022 : (('s, _menhir_box_main) _menhir_cell1_METAVAR, _menhir_box_main) _menhir_state
    (** State 022.
        Stack shape : METAVAR.
        Start symbol: main. *)

  | MenhirState023 : (('s, _menhir_box_main) _menhir_cell1_STAR, _menhir_box_main) _menhir_state
    (** State 023.
        Stack shape : STAR.
        Start symbol: main. *)

  | MenhirState025 : (('s, _menhir_box_main) _menhir_cell1_LPAREN, _menhir_box_main) _menhir_state
    (** State 025.
        Stack shape : LPAREN.
        Start symbol: main. *)

  | MenhirState031 : (('s, _menhir_box_main) _menhir_cell1_IDENTIFIER, _menhir_box_main) _menhir_state
    (** State 031.
        Stack shape : IDENTIFIER.
        Start symbol: main. *)

  | MenhirState032 : ((('s, _menhir_box_main) _menhir_cell1_IDENTIFIER, _menhir_box_main) _menhir_cell1_RPAREN, _menhir_box_main) _menhir_state
    (** State 032.
        Stack shape : IDENTIFIER RPAREN.
        Start symbol: main. *)

  | MenhirState037 : (('s, _menhir_box_main) _menhir_cell1_arith_relation_mul, _menhir_box_main) _menhir_state
    (** State 037.
        Stack shape : arith_relation_mul.
        Start symbol: main. *)

  | MenhirState039 : (('s, _menhir_box_main) _menhir_cell1_arith_relation_bw, _menhir_box_main) _menhir_state
    (** State 039.
        Stack shape : arith_relation_bw.
        Start symbol: main. *)

  | MenhirState045 : (('s, _menhir_box_main) _menhir_cell1_access, _menhir_box_main) _menhir_state
    (** State 045.
        Stack shape : access.
        Start symbol: main. *)

  | MenhirState050 : (('s, _menhir_box_main) _menhir_cell1_arith_relation_bw, _menhir_box_main) _menhir_state
    (** State 050.
        Stack shape : arith_relation_bw.
        Start symbol: main. *)

  | MenhirState052 : (('s, _menhir_box_main) _menhir_cell1_arith_relation_bw, _menhir_box_main) _menhir_state
    (** State 052.
        Stack shape : arith_relation_bw.
        Start symbol: main. *)

  | MenhirState055 : (('s, _menhir_box_main) _menhir_cell1_arith_relation_mul, _menhir_box_main) _menhir_state
    (** State 055.
        Stack shape : arith_relation_mul.
        Start symbol: main. *)

  | MenhirState057 : (('s, _menhir_box_main) _menhir_cell1_arith_relation_mul, _menhir_box_main) _menhir_state
    (** State 057.
        Stack shape : arith_relation_mul.
        Start symbol: main. *)

  | MenhirState060 : (('s, _menhir_box_main) _menhir_cell1_arith_relation_mul, _menhir_box_main) _menhir_state
    (** State 060.
        Stack shape : arith_relation_mul.
        Start symbol: main. *)

  | MenhirState062 : (('s, _menhir_box_main) _menhir_cell1_arith_relation_mul, _menhir_box_main) _menhir_state
    (** State 062.
        Stack shape : arith_relation_mul.
        Start symbol: main. *)

  | MenhirState072 : (('s, _menhir_box_main) _menhir_cell1_action, _menhir_box_main) _menhir_state
    (** State 072.
        Stack shape : action.
        Start symbol: main. *)

  | MenhirState074 : (('s, _menhir_box_main) _menhir_cell1_LCURLY, _menhir_box_main) _menhir_state
    (** State 074.
        Stack shape : LCURLY.
        Start symbol: main. *)

  | MenhirState080 : (('s, _menhir_box_main) _menhir_cell1_NOT, _menhir_box_main) _menhir_state
    (** State 080.
        Stack shape : NOT.
        Start symbol: main. *)

  | MenhirState081 : (('s, _menhir_box_main) _menhir_cell1_LPAREN, _menhir_box_main) _menhir_state
    (** State 081.
        Stack shape : LPAREN.
        Start symbol: main. *)

  | MenhirState093 : (('s, _menhir_box_main) _menhir_cell1_conjunction, _menhir_box_main) _menhir_state
    (** State 093.
        Stack shape : conjunction.
        Start symbol: main. *)

  | MenhirState096 : (('s, _menhir_box_main) _menhir_cell1_atomic_cond, _menhir_box_main) _menhir_state
    (** State 096.
        Stack shape : atomic_cond.
        Start symbol: main. *)

  | MenhirState099 : (('s, _menhir_box_main) _menhir_cell1_arith_relation, _menhir_box_main) _menhir_state
    (** State 099.
        Stack shape : arith_relation.
        Start symbol: main. *)

  | MenhirState101 : (('s, _menhir_box_main) _menhir_cell1_arith_relation, _menhir_box_main) _menhir_state
    (** State 101.
        Stack shape : arith_relation.
        Start symbol: main. *)

  | MenhirState103 : (('s, _menhir_box_main) _menhir_cell1_arith_relation, _menhir_box_main) _menhir_state
    (** State 103.
        Stack shape : arith_relation.
        Start symbol: main. *)

  | MenhirState105 : (('s, _menhir_box_main) _menhir_cell1_arith_relation, _menhir_box_main) _menhir_state
    (** State 105.
        Stack shape : arith_relation.
        Start symbol: main. *)

  | MenhirState107 : (('s, _menhir_box_main) _menhir_cell1_arith_relation, _menhir_box_main) _menhir_state
    (** State 107.
        Stack shape : arith_relation.
        Start symbol: main. *)

  | MenhirState109 : (('s, _menhir_box_main) _menhir_cell1_arith_relation, _menhir_box_main) _menhir_state
    (** State 109.
        Stack shape : arith_relation.
        Start symbol: main. *)

  | MenhirState115 : (('s, _menhir_box_main) _menhir_cell1_LSQUARE, _menhir_box_main) _menhir_state
    (** State 115.
        Stack shape : LSQUARE.
        Start symbol: main. *)

  | MenhirState117 : (('s, _menhir_box_main) _menhir_cell1_IDENTIFIER, _menhir_box_main) _menhir_state
    (** State 117.
        Stack shape : IDENTIFIER.
        Start symbol: main. *)

  | MenhirState118 : ((('s, _menhir_box_main) _menhir_cell1_IDENTIFIER, _menhir_box_main) _menhir_cell1_RPAREN, _menhir_box_main) _menhir_state
    (** State 118.
        Stack shape : IDENTIFIER RPAREN.
        Start symbol: main. *)

  | MenhirState119 : (('s, _menhir_box_main) _menhir_cell1_LBRACELBRACE, _menhir_box_main) _menhir_state
    (** State 119.
        Stack shape : LBRACELBRACE.
        Start symbol: main. *)

  | MenhirState124 : (('s, _menhir_box_main) _menhir_cell1_seq_elt, _menhir_box_main) _menhir_state
    (** State 124.
        Stack shape : seq_elt.
        Start symbol: main. *)

  | MenhirState131 : (('s, _menhir_box_main) _menhir_cell1_guard, _menhir_box_main) _menhir_state
    (** State 131.
        Stack shape : guard.
        Start symbol: main. *)

  | MenhirState132 : ((('s, _menhir_box_main) _menhir_cell1_guard, _menhir_box_main) _menhir_cell1_COMMA, _menhir_box_main) _menhir_state
    (** State 132.
        Stack shape : guard COMMA.
        Start symbol: main. *)

  | MenhirState137 : ((('s, _menhir_box_main) _menhir_cell1_guard, _menhir_box_main) _menhir_cell1_arith_relation, _menhir_box_main) _menhir_state
    (** State 137.
        Stack shape : guard arith_relation.
        Start symbol: main. *)

  | MenhirState144 : ((('s, _menhir_box_main) _menhir_cell1_IDENTIFIER, _menhir_box_main) _menhir_cell1_non_empty_seq, _menhir_box_main) _menhir_state
    (** State 144.
        Stack shape : IDENTIFIER non_empty_seq.
        Start symbol: main. *)

  | MenhirState146 : (('s, _menhir_box_main) _menhir_cell1_IDENTIFIER, _menhir_box_main) _menhir_state
    (** State 146.
        Stack shape : IDENTIFIER.
        Start symbol: main. *)

  | MenhirState152 : (('s, _menhir_box_main) _menhir_cell1_IDENTIFIER _menhir_cell0_pre_cond, _menhir_box_main) _menhir_state
    (** State 152.
        Stack shape : IDENTIFIER pre_cond.
        Start symbol: main. *)

  | MenhirState154 : ((('s, _menhir_box_main) _menhir_cell1_IDENTIFIER _menhir_cell0_pre_cond, _menhir_box_main) _menhir_cell1_seq, _menhir_box_main) _menhir_state
    (** State 154.
        Stack shape : IDENTIFIER pre_cond seq.
        Start symbol: main. *)

  | MenhirState159 : ((('s, _menhir_box_main) _menhir_cell1_LCURLY, _menhir_box_main) _menhir_cell1_seq_elt, _menhir_box_main) _menhir_state
    (** State 159.
        Stack shape : LCURLY seq_elt.
        Start symbol: main. *)

  | MenhirState165 : ((('s, _menhir_box_main) _menhir_cell1_IDENTIFIER, _menhir_box_main) _menhir_cell1_transitions, _menhir_box_main) _menhir_state
    (** State 165.
        Stack shape : IDENTIFIER transitions.
        Start symbol: main. *)

  | MenhirState171 : (((('s, _menhir_box_main) _menhir_cell1_options, _menhir_box_main) _menhir_cell1_metavars, _menhir_box_main) _menhir_cell1_states, _menhir_box_main) _menhir_state
    (** State 171.
        Stack shape : options metavars states.
        Start symbol: main. *)


and ('s, 'r) _menhir_cell1_access = 
  | MenhirCell1_access of 's * ('s, 'r) _menhir_state * (Automaton_ast.expression)

and ('s, 'r) _menhir_cell1_action = 
  | MenhirCell1_action of 's * ('s, 'r) _menhir_state * (Automaton_ast.action)

and ('s, 'r) _menhir_cell1_arith_relation = 
  | MenhirCell1_arith_relation of 's * ('s, 'r) _menhir_state * (Automaton_ast.expression)

and ('s, 'r) _menhir_cell1_arith_relation_bw = 
  | MenhirCell1_arith_relation_bw of 's * ('s, 'r) _menhir_state * (Automaton_ast.expression)

and ('s, 'r) _menhir_cell1_arith_relation_mul = 
  | MenhirCell1_arith_relation_mul of 's * ('s, 'r) _menhir_state * (Automaton_ast.expression)

and ('s, 'r) _menhir_cell1_atomic_cond = 
  | MenhirCell1_atomic_cond of 's * ('s, 'r) _menhir_state * (Automaton_ast.condition)

and ('s, 'r) _menhir_cell1_conjunction = 
  | MenhirCell1_conjunction of 's * ('s, 'r) _menhir_state * (Automaton_ast.condition)

and ('s, 'r) _menhir_cell1_guard = 
  | MenhirCell1_guard of 's * ('s, 'r) _menhir_state * (Automaton_ast.sequence)

and ('s, 'r) _menhir_cell1_metavars = 
  | MenhirCell1_metavars of 's * ('s, 'r) _menhir_state * ((string * string) list)

and ('s, 'r) _menhir_cell1_non_empty_metavars = 
  | MenhirCell1_non_empty_metavars of 's * ('s, 'r) _menhir_state * ((string * string) list)

and ('s, 'r) _menhir_cell1_non_empty_seq = 
  | MenhirCell1_non_empty_seq of 's * ('s, 'r) _menhir_state * (Automaton_ast.sequence)

and ('s, 'r) _menhir_cell1_options = 
  | MenhirCell1_options of 's * ('s, 'r) _menhir_state * (options list)

and 's _menhir_cell0_pre_cond = 
  | MenhirCell0_pre_cond of 's * (pre_cond)

and ('s, 'r) _menhir_cell1_seq = 
  | MenhirCell1_seq of 's * ('s, 'r) _menhir_state * (Automaton_ast.sequence)

and ('s, 'r) _menhir_cell1_seq_elt = 
  | MenhirCell1_seq_elt of 's * ('s, 'r) _menhir_state * (Automaton_ast.sequence)

and ('s, 'r) _menhir_cell1_states = 
  | MenhirCell1_states of 's * ('s, 'r) _menhir_state * ((Automaton_ast.guard, Automaton_ast.action) Automaton_ast.trans list)

and ('s, 'r) _menhir_cell1_transitions = 
  | MenhirCell1_transitions of 's * ('s, 'r) _menhir_state * ((Automaton_ast.guard * Automaton_ast.action list * Automaton_ast.state)
  list)

and ('s, 'r) _menhir_cell1_COMMA = 
  | MenhirCell1_COMMA of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_IDENTIFIER = 
  | MenhirCell1_IDENTIFIER of 's * ('s, 'r) _menhir_state * (
# 154 "src/plugins/aorai/yaparser.mly"
       (string)
# 499 "src/plugins/aorai/yaparser.ml"
)

and 's _menhir_cell0_IDENTIFIER = 
  | MenhirCell0_IDENTIFIER of 's * (
# 154 "src/plugins/aorai/yaparser.mly"
       (string)
# 506 "src/plugins/aorai/yaparser.ml"
)

and ('s, 'r) _menhir_cell1_LBRACELBRACE = 
  | MenhirCell1_LBRACELBRACE of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LCURLY = 
  | MenhirCell1_LCURLY of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LPAREN = 
  | MenhirCell1_LPAREN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LSQUARE = 
  | MenhirCell1_LSQUARE of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_METAVAR = 
  | MenhirCell1_METAVAR of 's * ('s, 'r) _menhir_state * (
# 155 "src/plugins/aorai/yaparser.mly"
       (string)
# 525 "src/plugins/aorai/yaparser.ml"
)

and ('s, 'r) _menhir_cell1_NOT = 
  | MenhirCell1_NOT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_OTHERWISE = 
  | MenhirCell1_OTHERWISE of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PERCENT = 
  | MenhirCell1_PERCENT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_RPAREN = 
  | MenhirCell1_RPAREN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_STAR = 
  | MenhirCell1_STAR of 's * ('s, 'r) _menhir_state

and _menhir_box_main = 
  | MenhirBox_main of ((Automaton_ast.guard, Automaton_ast.action) Automaton_ast.automaton) [@@unboxed]

let _menhir_action_01 =
  fun _1 _3 ->
    (* access -> access DOT IDENTIFIER *)
    (
# 400 "src/plugins/aorai/yaparser.mly"
                          ( PField(_1,_3) )
# 552 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.expression))

let _menhir_action_02 =
  fun _1 _3 ->
    (* access -> access RARROW IDENTIFIER *)
    (
# 401 "src/plugins/aorai/yaparser.mly"
                             ( PField(PUnop(Ustar,_1),_3) )
# 561 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.expression))

let _menhir_action_03 =
  fun _1 _3 ->
    (* access -> access LSQUARE access_or_const RSQUARE *)
    (
# 402 "src/plugins/aorai/yaparser.mly"
                                           ( PArrget(_1,_3) )
# 570 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.expression))

let _menhir_action_04 =
  fun _1 ->
    (* access -> access_leaf *)
    (
# 403 "src/plugins/aorai/yaparser.mly"
                    (_1)
# 579 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.expression))

let _menhir_action_05 =
  fun _2 ->
    (* access_leaf -> STAR access *)
    (
# 407 "src/plugins/aorai/yaparser.mly"
                ( PUnop (Ustar,_2) )
# 588 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.expression))

let _menhir_action_06 =
  fun _1 _5 ->
    (* access_leaf -> IDENTIFIER LPAREN RPAREN DOT IDENTIFIER *)
    (
# 408 "src/plugins/aorai/yaparser.mly"
                                            ( PPrm(_1,_5) )
# 597 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.expression))

let _menhir_action_07 =
  fun _1 ->
    (* access_leaf -> IDENTIFIER *)
    (
# 409 "src/plugins/aorai/yaparser.mly"
               ( PVar _1 )
# 606 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.expression))

let _menhir_action_08 =
  fun _2 ->
    (* access_leaf -> LPAREN arith_relation RPAREN *)
    (
# 410 "src/plugins/aorai/yaparser.mly"
                                 ( _2 )
# 615 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.expression))

let _menhir_action_09 =
  fun _1 ->
    (* access_leaf -> METAVAR *)
    (
# 411 "src/plugins/aorai/yaparser.mly"
            ( PMetavar _1 )
# 624 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.expression))

let _menhir_action_10 =
  fun _1 ->
    (* access_or_const -> INT *)
    (
# 391 "src/plugins/aorai/yaparser.mly"
        ( PCst (IntConstant _1) )
# 633 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.expression))

let _menhir_action_11 =
  fun _1 ->
    (* access_or_const -> FLOAT *)
    (
# 392 "src/plugins/aorai/yaparser.mly"
          ( PCst (FloatConstant _1) )
# 642 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.expression))

let _menhir_action_12 =
  fun _2 ->
    (* access_or_const -> MINUS INT *)
    (
# 393 "src/plugins/aorai/yaparser.mly"
              ( PUnop (Uminus, PCst (IntConstant _2)) )
# 651 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.expression))

let _menhir_action_13 =
  fun _2 ->
    (* access_or_const -> MINUS FLOAT *)
    (
# 394 "src/plugins/aorai/yaparser.mly"
                ( PUnop (Uminus, PCst (FloatConstant _2)) )
# 660 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.expression))

let _menhir_action_14 =
  fun _1 ->
    (* access_or_const -> access *)
    (
# 395 "src/plugins/aorai/yaparser.mly"
           ( _1 )
# 669 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.expression))

let _menhir_action_15 =
  fun _1 _3 ->
    (* action -> METAVAR AFF arith_relation SEMI_COLON *)
    (
# 420 "src/plugins/aorai/yaparser.mly"
                                          ( Metavar_assign (_1, _3) )
# 678 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.action))

let _menhir_action_16 =
  fun () ->
    (* actions -> *)
    (
# 415 "src/plugins/aorai/yaparser.mly"
                                    ( [] )
# 687 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.action list))

let _menhir_action_17 =
  fun _1 _2 ->
    (* actions -> action actions *)
    (
# 416 "src/plugins/aorai/yaparser.mly"
                   ( _1 :: _2 )
# 696 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.action list))

let _menhir_action_18 =
  fun _2 _3 ->
    (* an_option -> PERCENT IDENTIFIER opt_identifiers SEMI_COLON *)
    (
# 184 "src/plugins/aorai/yaparser.mly"
                                                  ( 
    match _2 with
    | "init" -> Init _3
    | "accept" -> Accept _3
    | "deterministic" -> Deterministic
    | "observables" -> Observables _3
    | _ ->  Aorai_option.abort "unknown option: '%s'" _2
  )
# 712 "src/plugins/aorai/yaparser.ml"
     : (options))

let _menhir_action_19 =
  fun _1 _3 ->
    (* arith_relation -> arith_relation_mul PLUS arith_relation *)
    (
# 371 "src/plugins/aorai/yaparser.mly"
                                           ( PBinop(Badd,_1,_3) )
# 721 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.expression))

let _menhir_action_20 =
  fun _1 _3 ->
    (* arith_relation -> arith_relation_mul MINUS arith_relation *)
    (
# 372 "src/plugins/aorai/yaparser.mly"
                                            ( PBinop(Bsub,_1,_3) )
# 730 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.expression))

let _menhir_action_21 =
  fun _1 ->
    (* arith_relation -> arith_relation_mul *)
    (
# 373 "src/plugins/aorai/yaparser.mly"
                       ( _1 )
# 739 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.expression))

let _menhir_action_22 =
  fun _1 ->
    (* arith_relation_bw -> access_or_const *)
    (
# 384 "src/plugins/aorai/yaparser.mly"
                    ( _1 )
# 748 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.expression))

let _menhir_action_23 =
  fun _1 _3 ->
    (* arith_relation_bw -> arith_relation_bw AMP access_or_const *)
    (
# 385 "src/plugins/aorai/yaparser.mly"
                                          ( PBinop(Bbw_and,_1,_3) )
# 757 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.expression))

let _menhir_action_24 =
  fun _1 _3 ->
    (* arith_relation_bw -> arith_relation_bw PIPE access_or_const *)
    (
# 386 "src/plugins/aorai/yaparser.mly"
                                           ( PBinop(Bbw_or,_1,_3) )
# 766 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.expression))

let _menhir_action_25 =
  fun _1 _3 ->
    (* arith_relation_bw -> arith_relation_bw CARET access_or_const *)
    (
# 387 "src/plugins/aorai/yaparser.mly"
                                            ( PBinop(Bbw_xor,_1,_3) )
# 775 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.expression))

let _menhir_action_26 =
  fun _1 _3 ->
    (* arith_relation_mul -> arith_relation_mul SLASH arith_relation_bw *)
    (
# 377 "src/plugins/aorai/yaparser.mly"
                                               ( PBinop(Bdiv,_1,_3) )
# 784 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.expression))

let _menhir_action_27 =
  fun _1 _3 ->
    (* arith_relation_mul -> arith_relation_mul STAR arith_relation_bw *)
    (
# 378 "src/plugins/aorai/yaparser.mly"
                                              ( PBinop(Bmul, _1, _3) )
# 793 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.expression))

let _menhir_action_28 =
  fun _1 _3 ->
    (* arith_relation_mul -> arith_relation_mul PERCENT arith_relation_bw *)
    (
# 379 "src/plugins/aorai/yaparser.mly"
                                                 ( PBinop(Bmod, _1, _3) )
# 802 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.expression))

let _menhir_action_29 =
  fun _1 ->
    (* arith_relation_mul -> arith_relation_bw *)
    (
# 380 "src/plugins/aorai/yaparser.mly"
                      ( _1 )
# 811 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.expression))

let _menhir_action_30 =
  fun _3 ->
    (* atomic_cond -> CALLORRETURN_OF LPAREN IDENTIFIER RPAREN *)
    (
# 350 "src/plugins/aorai/yaparser.mly"
      ( POr (PCall (_3,None), PReturn _3) )
# 820 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.condition))

let _menhir_action_31 =
  fun _3 ->
    (* atomic_cond -> CALL_OF LPAREN IDENTIFIER RPAREN *)
    (
# 351 "src/plugins/aorai/yaparser.mly"
                                      ( PCall (_3,None) )
# 829 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.condition))

let _menhir_action_32 =
  fun _3 ->
    (* atomic_cond -> RETURN_OF LPAREN IDENTIFIER RPAREN *)
    (
# 352 "src/plugins/aorai/yaparser.mly"
                                        ( PReturn _3 )
# 838 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.condition))

let _menhir_action_33 =
  fun () ->
    (* atomic_cond -> TRUE *)
    (
# 353 "src/plugins/aorai/yaparser.mly"
         ( PTrue )
# 847 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.condition))

let _menhir_action_34 =
  fun () ->
    (* atomic_cond -> FALSE *)
    (
# 354 "src/plugins/aorai/yaparser.mly"
          ( PFalse )
# 856 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.condition))

let _menhir_action_35 =
  fun _2 ->
    (* atomic_cond -> NOT atomic_cond *)
    (
# 355 "src/plugins/aorai/yaparser.mly"
                    ( PNot _2 )
# 865 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.condition))

let _menhir_action_36 =
  fun _2 ->
    (* atomic_cond -> LPAREN cond RPAREN *)
    (
# 356 "src/plugins/aorai/yaparser.mly"
                       ( _2 )
# 874 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.condition))

let _menhir_action_37 =
  fun _1 ->
    (* atomic_cond -> logic_relation *)
    (
# 357 "src/plugins/aorai/yaparser.mly"
                   ( _1 )
# 883 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.condition))

let _menhir_action_38 =
  fun _1 _3 ->
    (* cond -> conjunction OR cond *)
    (
# 341 "src/plugins/aorai/yaparser.mly"
                        ( POr (_1,_3) )
# 892 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.condition))

let _menhir_action_39 =
  fun _1 ->
    (* cond -> conjunction *)
    (
# 342 "src/plugins/aorai/yaparser.mly"
                ( _1 )
# 901 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.condition))

let _menhir_action_40 =
  fun _1 _3 ->
    (* conjunction -> atomic_cond AND conjunction *)
    (
# 345 "src/plugins/aorai/yaparser.mly"
                                ( PAnd(_1,_3) )
# 910 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.condition))

let _menhir_action_41 =
  fun _1 ->
    (* conjunction -> atomic_cond *)
    (
# 346 "src/plugins/aorai/yaparser.mly"
                ( _1 )
# 919 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.condition))

let _menhir_action_42 =
  fun _2 ->
    (* guard -> LSQUARE non_empty_seq RSQUARE *)
    (
# 273 "src/plugins/aorai/yaparser.mly"
                                  ( _2 )
# 928 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.sequence))

let _menhir_action_43 =
  fun _1 _2 _4 _6 ->
    (* guard -> IDENTIFIER pre_cond LPAREN seq RPAREN post_cond *)
    (
# 275 "src/plugins/aorai/yaparser.mly"
      ( let pre_cond =
          match _2 with
            | Behavior b -> PCall(_1,Some b)
            | Pre c -> PAnd (PCall(_1,None), c)
        in
        let post_cond =
          match _6 with
            | None -> PReturn _1
            | Some c -> PAnd (PReturn _1,c)
        in
        (to_seq pre_cond) @ _4 @ to_seq post_cond
      )
# 948 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.sequence))

let _menhir_action_44 =
  fun _1 _3 _5 ->
    (* guard -> IDENTIFIER LPAREN non_empty_seq RPAREN post_cond *)
    (
# 288 "src/plugins/aorai/yaparser.mly"
      ( let post_cond =
          match _5 with
            | None -> PReturn _1
            | Some c -> PAnd (PReturn _1,c)
        in
        (to_seq (PCall (_1, None))) @ _3 @ to_seq post_cond
      )
# 963 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.sequence))

let _menhir_action_45 =
  fun _1 _4 ->
    (* guard -> IDENTIFIER LPAREN RPAREN post_cond *)
    (
# 296 "src/plugins/aorai/yaparser.mly"
      ( let post_cond =
          match _4 with
            | None -> PReturn _1
            | Some c -> PAnd (PReturn _1,c)
        in
        (to_seq (PCall (_1, None))) @ to_seq post_cond
      )
# 978 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.sequence))

let _menhir_action_46 =
  fun _1 _3 ->
    (* id_list -> id_list COMMA IDENTIFIER *)
    (
# 199 "src/plugins/aorai/yaparser.mly"
                             ( _1 @ [_3] )
# 987 "src/plugins/aorai/yaparser.ml"
     : (string list))

let _menhir_action_47 =
  fun _1 ->
    (* id_list -> IDENTIFIER *)
    (
# 200 "src/plugins/aorai/yaparser.mly"
                             ( [_1] )
# 996 "src/plugins/aorai/yaparser.ml"
     : (string list))

let _menhir_action_48 =
  fun _1 _3 ->
    (* logic_relation -> arith_relation EQ arith_relation *)
    (
# 361 "src/plugins/aorai/yaparser.mly"
                                     ( PRel(Eq, _1, _3) )
# 1005 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.condition))

let _menhir_action_49 =
  fun _1 _3 ->
    (* logic_relation -> arith_relation LT arith_relation *)
    (
# 362 "src/plugins/aorai/yaparser.mly"
                                     ( PRel(Lt, _1, _3) )
# 1014 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.condition))

let _menhir_action_50 =
  fun _1 _3 ->
    (* logic_relation -> arith_relation GT arith_relation *)
    (
# 363 "src/plugins/aorai/yaparser.mly"
                                     ( PRel(Gt, _1, _3) )
# 1023 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.condition))

let _menhir_action_51 =
  fun _1 _3 ->
    (* logic_relation -> arith_relation LE arith_relation *)
    (
# 364 "src/plugins/aorai/yaparser.mly"
                                     ( PRel(Le, _1, _3) )
# 1032 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.condition))

let _menhir_action_52 =
  fun _1 _3 ->
    (* logic_relation -> arith_relation GE arith_relation *)
    (
# 365 "src/plugins/aorai/yaparser.mly"
                                     ( PRel(Ge, _1, _3) )
# 1041 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.condition))

let _menhir_action_53 =
  fun _1 _3 ->
    (* logic_relation -> arith_relation NEQ arith_relation *)
    (
# 366 "src/plugins/aorai/yaparser.mly"
                                      ( PRel(Neq, _1, _3) )
# 1050 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.condition))

let _menhir_action_54 =
  fun _1 _2 _3 ->
    (* main -> options metavars states EOF *)
    (
# 176 "src/plugins/aorai/yaparser.mly"
                                   ( build_automaton _1 _2 _3 )
# 1059 "src/plugins/aorai/yaparser.ml"
     : ((Automaton_ast.guard, Automaton_ast.action) Automaton_ast.automaton))

let _menhir_action_55 =
  fun _1 _3 ->
    (* metavar -> METAVAR COLON IDENTIFIER SEMI_COLON *)
    (
# 213 "src/plugins/aorai/yaparser.mly"
                                        ( _1,_3 )
# 1068 "src/plugins/aorai/yaparser.ml"
     : (string * string))

let _menhir_action_56 =
  fun () ->
    (* metavars -> *)
    (
# 204 "src/plugins/aorai/yaparser.mly"
                       ( [] )
# 1077 "src/plugins/aorai/yaparser.ml"
     : ((string * string) list))

let _menhir_action_57 =
  fun _1 ->
    (* metavars -> non_empty_metavars *)
    (
# 205 "src/plugins/aorai/yaparser.mly"
                       ( _1 )
# 1086 "src/plugins/aorai/yaparser.ml"
     : ((string * string) list))

let _menhir_action_58 =
  fun _1 _2 ->
    (* non_empty_metavars -> non_empty_metavars metavar *)
    (
# 208 "src/plugins/aorai/yaparser.mly"
                               ( _1 @ [_2] )
# 1095 "src/plugins/aorai/yaparser.ml"
     : ((string * string) list))

let _menhir_action_59 =
  fun _1 ->
    (* non_empty_metavars -> metavar *)
    (
# 209 "src/plugins/aorai/yaparser.mly"
                               ( [_1] )
# 1104 "src/plugins/aorai/yaparser.ml"
     : ((string * string) list))

let _menhir_action_60 =
  fun _1 ->
    (* non_empty_seq -> seq_elt *)
    (
# 263 "src/plugins/aorai/yaparser.mly"
            ( _1 )
# 1113 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.sequence))

let _menhir_action_61 =
  fun _1 _3 ->
    (* non_empty_seq -> seq_elt SEMI_COLON seq *)
    (
# 264 "src/plugins/aorai/yaparser.mly"
                           ( _1 @ _3 )
# 1122 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.sequence))

let _menhir_action_62 =
  fun () ->
    (* opt_identifiers -> *)
    (
# 194 "src/plugins/aorai/yaparser.mly"
                ( [] )
# 1131 "src/plugins/aorai/yaparser.ml"
     : (string list))

let _menhir_action_63 =
  fun _2 ->
    (* opt_identifiers -> COLON id_list *)
    (
# 195 "src/plugins/aorai/yaparser.mly"
                  ( _2 )
# 1140 "src/plugins/aorai/yaparser.ml"
     : (string list))

let _menhir_action_64 =
  fun _1 _2 ->
    (* options -> options an_option *)
    (
# 179 "src/plugins/aorai/yaparser.mly"
                      ( _1 @ [_2] )
# 1149 "src/plugins/aorai/yaparser.ml"
     : (options list))

let _menhir_action_65 =
  fun _1 ->
    (* options -> an_option *)
    (
# 180 "src/plugins/aorai/yaparser.mly"
                      ( [_1] )
# 1158 "src/plugins/aorai/yaparser.ml"
     : (options list))

let _menhir_action_66 =
  fun () ->
    (* post_cond -> *)
    (
# 311 "src/plugins/aorai/yaparser.mly"
                  ( None )
# 1167 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.condition option))

let _menhir_action_67 =
  fun _2 ->
    (* post_cond -> LBRACELBRACE cond RBRACERBRACE *)
    (
# 312 "src/plugins/aorai/yaparser.mly"
                                   ( Some _2 )
# 1176 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.condition option))

let _menhir_action_68 =
  fun _2 ->
    (* pre_cond -> COLUMNCOLUMN IDENTIFIER *)
    (
# 306 "src/plugins/aorai/yaparser.mly"
                            ( Behavior _2 )
# 1185 "src/plugins/aorai/yaparser.ml"
     : (pre_cond))

let _menhir_action_69 =
  fun _2 ->
    (* pre_cond -> LBRACELBRACE cond RBRACERBRACE *)
    (
# 307 "src/plugins/aorai/yaparser.mly"
                                   ( Pre _2 )
# 1194 "src/plugins/aorai/yaparser.ml"
     : (pre_cond))

let _menhir_action_70 =
  fun () ->
    (* repetition -> *)
    (
# 331 "src/plugins/aorai/yaparser.mly"
      ( Some Data_for_aorai.cst_one, Some Data_for_aorai.cst_one )
# 1203 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.expression option * Automaton_ast.expression option))

let _menhir_action_71 =
  fun () ->
    (* repetition -> PLUS *)
    (
# 332 "src/plugins/aorai/yaparser.mly"
         ( Some Data_for_aorai.cst_one, None)
# 1212 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.expression option * Automaton_ast.expression option))

let _menhir_action_72 =
  fun () ->
    (* repetition -> STAR *)
    (
# 333 "src/plugins/aorai/yaparser.mly"
         ( None, None )
# 1221 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.expression option * Automaton_ast.expression option))

let _menhir_action_73 =
  fun () ->
    (* repetition -> QUESTION *)
    (
# 334 "src/plugins/aorai/yaparser.mly"
             ( None, Some Data_for_aorai.cst_one )
# 1230 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.expression option * Automaton_ast.expression option))

let _menhir_action_74 =
  fun _2 _4 ->
    (* repetition -> LCURLY arith_relation COMMA arith_relation RCURLY *)
    (
# 335 "src/plugins/aorai/yaparser.mly"
                                                      ( Some _2, Some _4 )
# 1239 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.expression option * Automaton_ast.expression option))

let _menhir_action_75 =
  fun _2 ->
    (* repetition -> LCURLY arith_relation RCURLY *)
    (
# 336 "src/plugins/aorai/yaparser.mly"
                                 ( Some _2, Some _2 )
# 1248 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.expression option * Automaton_ast.expression option))

let _menhir_action_76 =
  fun _2 ->
    (* repetition -> LCURLY arith_relation COMMA RCURLY *)
    (
# 337 "src/plugins/aorai/yaparser.mly"
                                       ( Some _2, None )
# 1257 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.expression option * Automaton_ast.expression option))

let _menhir_action_77 =
  fun _3 ->
    (* repetition -> LCURLY COMMA arith_relation RCURLY *)
    (
# 338 "src/plugins/aorai/yaparser.mly"
                                       ( None, Some _3 )
# 1266 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.expression option * Automaton_ast.expression option))

let _menhir_action_78 =
  fun () ->
    (* seq -> *)
    (
# 268 "src/plugins/aorai/yaparser.mly"
                  ( [] )
# 1275 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.sequence))

let _menhir_action_79 =
  fun _1 ->
    (* seq -> non_empty_seq *)
    (
# 269 "src/plugins/aorai/yaparser.mly"
                  ( _1 )
# 1284 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.sequence))

let _menhir_action_80 =
  fun _1 ->
    (* seq_elt -> cond *)
    (
# 316 "src/plugins/aorai/yaparser.mly"
         ( to_seq _1 )
# 1293 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.sequence))

let _menhir_action_81 =
  fun _1 _2 ->
    (* seq_elt -> guard repetition *)
    (
# 317 "src/plugins/aorai/yaparser.mly"
                     (
    let min, max = _2 in
    match _1 with
      | [ s ] when Data_for_aorai.is_single s ->
        [ { s with min_rep = min; max_rep = max } ]
      | l ->
        if is_no_repet (min,max) then
          l (* [ a; [b;c]; d] is equivalent to [a;b;c;d] *)
        else [ { condition = None; nested = l; min_rep = min; max_rep = max } ]
  )
# 1311 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.sequence))

let _menhir_action_82 =
  fun _1 _3 ->
    (* state -> IDENTIFIER COLON transitions SEMI_COLON *)
    (
# 222 "src/plugins/aorai/yaparser.mly"
                                            (
      let start_state = fetch_and_create_state _1 in
      let (_, transitions) =
        List.fold_left
          (fun (otherwise, transitions) (cross,actions,stop_state) ->
            if otherwise then
              Aorai_option.abort
                "'other' directive in definition of %s \
                transitions is not the last one" start_state.name
            else begin
              let trans =
                { start=start_state; stop=stop_state;
                  cross; actions; numt=(-1) }::transitions
              in
              let otherwise =
                match cross with
                  | Otherwise -> true
                  | Seq _ -> false
              in otherwise, trans
            end)
          (false,[]) _3
      in
      List.rev transitions
  )
# 1343 "src/plugins/aorai/yaparser.ml"
     : ((Automaton_ast.guard, Automaton_ast.action) Automaton_ast.trans list))

let _menhir_action_83 =
  fun _1 _2 ->
    (* states -> states state *)
    (
# 217 "src/plugins/aorai/yaparser.mly"
                 ( _1@_2 )
# 1352 "src/plugins/aorai/yaparser.ml"
     : ((Automaton_ast.guard, Automaton_ast.action) Automaton_ast.trans list))

let _menhir_action_84 =
  fun _1 ->
    (* states -> state *)
    (
# 218 "src/plugins/aorai/yaparser.mly"
          ( _1 )
# 1361 "src/plugins/aorai/yaparser.ml"
     : ((Automaton_ast.guard, Automaton_ast.action) Automaton_ast.trans list))

let _menhir_action_85 =
  fun _2 _4 _6 ->
    (* transition -> LCURLY seq_elt RCURLY actions RARROW IDENTIFIER *)
    (
# 255 "src/plugins/aorai/yaparser.mly"
      ( (Seq _2, _4, prefetch_and_create_state _6) )
# 1370 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.guard * Automaton_ast.action list * Automaton_ast.state))

let _menhir_action_86 =
  fun _2 _4 ->
    (* transition -> OTHERWISE actions RARROW IDENTIFIER *)
    (
# 257 "src/plugins/aorai/yaparser.mly"
      ( (Otherwise, _2, prefetch_and_create_state _4) )
# 1379 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.guard * Automaton_ast.action list * Automaton_ast.state))

let _menhir_action_87 =
  fun _1 _3 ->
    (* transition -> actions RARROW IDENTIFIER *)
    (
# 259 "src/plugins/aorai/yaparser.mly"
      ( (Seq (to_seq PTrue), _1, prefetch_and_create_state _3) )
# 1388 "src/plugins/aorai/yaparser.ml"
     : (Automaton_ast.guard * Automaton_ast.action list * Automaton_ast.state))

let _menhir_action_88 =
  fun _1 _3 ->
    (* transitions -> transitions PIPE transition *)
    (
# 248 "src/plugins/aorai/yaparser.mly"
                                ( _1@[_3] )
# 1397 "src/plugins/aorai/yaparser.ml"
     : ((Automaton_ast.guard * Automaton_ast.action list * Automaton_ast.state)
  list))

let _menhir_action_89 =
  fun _1 ->
    (* transitions -> transition *)
    (
# 249 "src/plugins/aorai/yaparser.mly"
               ( [_1] )
# 1407 "src/plugins/aorai/yaparser.ml"
     : ((Automaton_ast.guard * Automaton_ast.action list * Automaton_ast.state)
  list))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | AFF ->
        "AFF"
    | AMP ->
        "AMP"
    | AND ->
        "AND"
    | CALLORRETURN_OF ->
        "CALLORRETURN_OF"
    | CALL_OF ->
        "CALL_OF"
    | CARET ->
        "CARET"
    | COLON ->
        "COLON"
    | COLUMNCOLUMN ->
        "COLUMNCOLUMN"
    | COMMA ->
        "COMMA"
    | DOT ->
        "DOT"
    | EOF ->
        "EOF"
    | EQ ->
        "EQ"
    | FALSE ->
        "FALSE"
    | FLOAT _ ->
        "FLOAT"
    | GE ->
        "GE"
    | GT ->
        "GT"
    | IDENTIFIER _ ->
        "IDENTIFIER"
    | INT _ ->
        "INT"
    | LBRACELBRACE ->
        "LBRACELBRACE"
    | LCURLY ->
        "LCURLY"
    | LE ->
        "LE"
    | LPAREN ->
        "LPAREN"
    | LSQUARE ->
        "LSQUARE"
    | LT ->
        "LT"
    | METAVAR _ ->
        "METAVAR"
    | MINUS ->
        "MINUS"
    | NEQ ->
        "NEQ"
    | NOT ->
        "NOT"
    | OR ->
        "OR"
    | OTHERWISE ->
        "OTHERWISE"
    | PERCENT ->
        "PERCENT"
    | PIPE ->
        "PIPE"
    | PLUS ->
        "PLUS"
    | QUESTION ->
        "QUESTION"
    | RARROW ->
        "RARROW"
    | RBRACERBRACE ->
        "RBRACERBRACE"
    | RCURLY ->
        "RCURLY"
    | RETURN_OF ->
        "RETURN_OF"
    | RPAREN ->
        "RPAREN"
    | RSQUARE ->
        "RSQUARE"
    | SEMI_COLON ->
        "SEMI_COLON"
    | SLASH ->
        "SLASH"
    | STAR ->
        "STAR"
    | TRUE ->
        "TRUE"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let rec _menhir_run_018 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      (* State 18: *)
      let _menhir_stack = MenhirCell1_IDENTIFIER (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          (* Shifting (COLON) to state 19 *)
          (* State 19: *)
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | OTHERWISE ->
              (* Shifting (OTHERWISE) to state 20 *)
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState019
          | METAVAR _v_0 ->
              (* Shifting (METAVAR) to state 21 *)
              _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState019
          | LCURLY ->
              (* Shifting (LCURLY) to state 74 *)
              _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState019
          | RARROW ->
              (* Reducing production actions -> *)
              let _v_1 = _menhir_action_16 () in
              _menhir_run_167 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState019
          | _ ->
              (* Initiating error handling *)
              _eRR ())
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_020 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      (* State 20: *)
      let _menhir_stack = MenhirCell1_OTHERWISE (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | METAVAR _v ->
          (* Shifting (METAVAR) to state 21 *)
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState020
      | RARROW ->
          (* Reducing production actions -> *)
          let _v = _menhir_action_16 () in
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_021 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      (* State 21: *)
      let _menhir_stack = MenhirCell1_METAVAR (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | AFF ->
          (* Shifting (AFF) to state 22 *)
          (* State 22: *)
          let _menhir_s = MenhirState022 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | STAR ->
              (* Shifting (STAR) to state 23 *)
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              (* Shifting (MINUS) to state 26 *)
              _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | METAVAR _v ->
              (* Shifting (METAVAR) to state 24 *)
              _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | LPAREN ->
              (* Shifting (LPAREN) to state 25 *)
              _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              (* Shifting (INT) to state 29 *)
              _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IDENTIFIER _v ->
              (* Shifting (IDENTIFIER) to state 30 *)
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FLOAT _v ->
              (* Shifting (FLOAT) to state 35 *)
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              (* Initiating error handling *)
              _eRR ())
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_023 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      (* State 23: *)
      let _menhir_stack = MenhirCell1_STAR (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState023 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STAR ->
          (* Shifting (STAR) to state 23 *)
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | METAVAR _v ->
          (* Shifting (METAVAR) to state 24 *)
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LPAREN ->
          (* Shifting (LPAREN) to state 25 *)
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IDENTIFIER _v ->
          (* Shifting (IDENTIFIER) to state 30 *)
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_024 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      (* State 24: *)
      let _tok = _menhir_lexer _menhir_lexbuf in
      (* Reducing production access_leaf -> METAVAR *)
      let _1 = _v in
      let _v = _menhir_action_09 _1 in
      _menhir_goto_access_leaf _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_access_leaf : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      (* State 41: *)
      (* Reducing production access -> access_leaf *)
      let _1 = _v in
      let _v = _menhir_action_04 _1 in
      _menhir_goto_access _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_access : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState023 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState074 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState115 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState152 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState146 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState117 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState124 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState131 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState137 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState132 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState119 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState080 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState081 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState093 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState096 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState109 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState107 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState105 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState103 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState101 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState099 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState022 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState025 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState062 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState060 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState057 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState055 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState037 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState052 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState050 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState045 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState039 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_066 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_STAR as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      (* State 66: *)
      match (_tok : MenhirBasics.token) with
      | RARROW ->
          let _menhir_stack = MenhirCell1_access (_menhir_stack, _menhir_s, _v) in
          (* Shifting (RARROW) to state 43 *)
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LSQUARE ->
          let _menhir_stack = MenhirCell1_access (_menhir_stack, _menhir_s, _v) in
          (* Shifting (LSQUARE) to state 45 *)
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DOT ->
          let _menhir_stack = MenhirCell1_access (_menhir_stack, _menhir_s, _v) in
          (* Shifting (DOT) to state 48 *)
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AMP | AND | CARET | COMMA | EQ | GE | GT | LE | LT | MINUS | NEQ | OR | PERCENT | PIPE | PLUS | RBRACERBRACE | RCURLY | RPAREN | RSQUARE | SEMI_COLON | SLASH | STAR ->
          let MenhirCell1_STAR (_menhir_stack, _menhir_s) = _menhir_stack in
          (* Reducing production access_leaf -> STAR access *)
          let _2 = _v in
          let _v = _menhir_action_05 _2 in
          _menhir_goto_access_leaf _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_043 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_access -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      (* State 43: *)
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENTIFIER _v ->
          (* Shifting (IDENTIFIER) to state 44 *)
          (* State 44: *)
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_access (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          (* Reducing production access -> access RARROW IDENTIFIER *)
          let _3 = _v in
          let _v = _menhir_action_02 _1 _3 in
          _menhir_goto_access _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_045 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_access -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      (* State 45: *)
      let _menhir_s = MenhirState045 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STAR ->
          (* Shifting (STAR) to state 23 *)
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          (* Shifting (MINUS) to state 26 *)
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | METAVAR _v ->
          (* Shifting (METAVAR) to state 24 *)
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LPAREN ->
          (* Shifting (LPAREN) to state 25 *)
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          (* Shifting (INT) to state 29 *)
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENTIFIER _v ->
          (* Shifting (IDENTIFIER) to state 30 *)
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FLOAT _v ->
          (* Shifting (FLOAT) to state 35 *)
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_026 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      (* State 26: *)
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | INT _v ->
          (* Shifting (INT) to state 27 *)
          (* State 27: *)
          let _tok = _menhir_lexer _menhir_lexbuf in
          (* Reducing production access_or_const -> MINUS INT *)
          let _2 = _v in
          let _v = _menhir_action_12 _2 in
          _menhir_goto_access_or_const _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | FLOAT _v ->
          (* Shifting (FLOAT) to state 28 *)
          (* State 28: *)
          let _tok = _menhir_lexer _menhir_lexbuf in
          (* Reducing production access_or_const -> MINUS FLOAT *)
          let _2 = _v in
          let _v = _menhir_action_13 _2 in
          _menhir_goto_access_or_const _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_goto_access_or_const : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState074 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState115 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState152 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState146 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState117 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState124 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState131 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState137 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState132 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState119 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState080 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState081 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState093 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState096 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState109 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState107 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState105 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState103 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState101 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState099 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState022 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState025 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState062 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState060 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState057 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState055 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState037 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState052 ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState050 ->
          _menhir_run_051 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState045 ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState039 ->
          _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_054 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      (* State 54: *)
      (* Reducing production arith_relation_bw -> access_or_const *)
      let _1 = _v in
      let _v = _menhir_action_22 _1 in
      _menhir_goto_arith_relation_bw _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_arith_relation_bw : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState060 ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState074 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState115 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState152 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState146 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState117 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState124 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState137 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState131 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState132 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState119 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState080 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState081 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState093 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState109 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState107 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState105 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState103 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState101 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState099 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState096 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState022 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState025 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState062 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState057 ->
          _menhir_run_058 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState055 ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState037 ->
          _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_061 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_arith_relation_mul as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      (* State 61: *)
      match (_tok : MenhirBasics.token) with
      | PIPE ->
          let _menhir_stack = MenhirCell1_arith_relation_bw (_menhir_stack, _menhir_s, _v) in
          (* Shifting (PIPE) to state 39 *)
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CARET ->
          let _menhir_stack = MenhirCell1_arith_relation_bw (_menhir_stack, _menhir_s, _v) in
          (* Shifting (CARET) to state 50 *)
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AMP ->
          let _menhir_stack = MenhirCell1_arith_relation_bw (_menhir_stack, _menhir_s, _v) in
          (* Shifting (AMP) to state 52 *)
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | EQ | GE | GT | LE | LT | MINUS | NEQ | OR | PERCENT | PLUS | RBRACERBRACE | RCURLY | RPAREN | RSQUARE | SEMI_COLON | SLASH | STAR ->
          let MenhirCell1_arith_relation_mul (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          (* Reducing production arith_relation_mul -> arith_relation_mul PERCENT arith_relation_bw *)
          let _3 = _v in
          let _v = _menhir_action_28 _1 _3 in
          _menhir_goto_arith_relation_mul _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_039 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_arith_relation_bw -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      (* State 39: *)
      let _menhir_s = MenhirState039 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STAR ->
          (* Shifting (STAR) to state 23 *)
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          (* Shifting (MINUS) to state 26 *)
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | METAVAR _v ->
          (* Shifting (METAVAR) to state 24 *)
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LPAREN ->
          (* Shifting (LPAREN) to state 25 *)
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          (* Shifting (INT) to state 29 *)
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENTIFIER _v ->
          (* Shifting (IDENTIFIER) to state 30 *)
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FLOAT _v ->
          (* Shifting (FLOAT) to state 35 *)
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_025 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      (* State 25: *)
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState025 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STAR ->
          (* Shifting (STAR) to state 23 *)
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          (* Shifting (MINUS) to state 26 *)
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | METAVAR _v ->
          (* Shifting (METAVAR) to state 24 *)
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LPAREN ->
          (* Shifting (LPAREN) to state 25 *)
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          (* Shifting (INT) to state 29 *)
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENTIFIER _v ->
          (* Shifting (IDENTIFIER) to state 30 *)
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FLOAT _v ->
          (* Shifting (FLOAT) to state 35 *)
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_029 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      (* State 29: *)
      let _tok = _menhir_lexer _menhir_lexbuf in
      (* Reducing production access_or_const -> INT *)
      let _1 = _v in
      let _v = _menhir_action_10 _1 in
      _menhir_goto_access_or_const _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_030 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      (* State 30: *)
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_stack = MenhirCell1_IDENTIFIER (_menhir_stack, _menhir_s, _v) in
          (* Shifting (LPAREN) to state 31 *)
          (* State 31: *)
          let _menhir_s = MenhirState031 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | RPAREN ->
              (* Shifting (RPAREN) to state 32 *)
              (* State 32: *)
              let _menhir_stack = MenhirCell1_RPAREN (_menhir_stack, _menhir_s) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | DOT ->
                  (* Shifting (DOT) to state 33 *)
                  _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer
              | _ ->
                  (* Initiating error handling *)
                  _eRR ())
          | _ ->
              (* Initiating error handling *)
              _eRR ())
      | AMP | AND | CARET | COMMA | DOT | EQ | GE | GT | LE | LSQUARE | LT | MINUS | NEQ | OR | PERCENT | PIPE | PLUS | RARROW | RBRACERBRACE | RCURLY | RPAREN | RSQUARE | SEMI_COLON | SLASH | STAR ->
          (* Reducing production access_leaf -> IDENTIFIER *)
          let _1 = _v in
          let _v = _menhir_action_07 _1 in
          _menhir_goto_access_leaf _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_033 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_IDENTIFIER, _menhir_box_main) _menhir_cell1_RPAREN -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      (* State 33: *)
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENTIFIER _v ->
          (* Shifting (IDENTIFIER) to state 34 *)
          (* State 34: *)
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_RPAREN (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_IDENTIFIER (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          (* Reducing production access_leaf -> IDENTIFIER LPAREN RPAREN DOT IDENTIFIER *)
          let _5 = _v in
          let _v = _menhir_action_06 _1 _5 in
          _menhir_goto_access_leaf _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_035 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      (* State 35: *)
      let _tok = _menhir_lexer _menhir_lexbuf in
      (* Reducing production access_or_const -> FLOAT *)
      let _1 = _v in
      let _v = _menhir_action_11 _1 in
      _menhir_goto_access_or_const _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_050 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_arith_relation_bw -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      (* State 50: *)
      let _menhir_s = MenhirState050 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STAR ->
          (* Shifting (STAR) to state 23 *)
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          (* Shifting (MINUS) to state 26 *)
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | METAVAR _v ->
          (* Shifting (METAVAR) to state 24 *)
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LPAREN ->
          (* Shifting (LPAREN) to state 25 *)
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          (* Shifting (INT) to state 29 *)
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENTIFIER _v ->
          (* Shifting (IDENTIFIER) to state 30 *)
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FLOAT _v ->
          (* Shifting (FLOAT) to state 35 *)
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_052 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_arith_relation_bw -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      (* State 52: *)
      let _menhir_s = MenhirState052 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STAR ->
          (* Shifting (STAR) to state 23 *)
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          (* Shifting (MINUS) to state 26 *)
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | METAVAR _v ->
          (* Shifting (METAVAR) to state 24 *)
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LPAREN ->
          (* Shifting (LPAREN) to state 25 *)
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          (* Shifting (INT) to state 29 *)
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENTIFIER _v ->
          (* Shifting (IDENTIFIER) to state 30 *)
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FLOAT _v ->
          (* Shifting (FLOAT) to state 35 *)
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_goto_arith_relation_mul : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      (* State 36: *)
      match (_tok : MenhirBasics.token) with
      | STAR ->
          let _menhir_stack = MenhirCell1_arith_relation_mul (_menhir_stack, _menhir_s, _v) in
          (* Shifting (STAR) to state 37 *)
          (* State 37: *)
          let _menhir_s = MenhirState037 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | STAR ->
              (* Shifting (STAR) to state 23 *)
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              (* Shifting (MINUS) to state 26 *)
              _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | METAVAR _v ->
              (* Shifting (METAVAR) to state 24 *)
              _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | LPAREN ->
              (* Shifting (LPAREN) to state 25 *)
              _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              (* Shifting (INT) to state 29 *)
              _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IDENTIFIER _v ->
              (* Shifting (IDENTIFIER) to state 30 *)
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FLOAT _v ->
              (* Shifting (FLOAT) to state 35 *)
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              (* Initiating error handling *)
              _eRR ())
      | SLASH ->
          let _menhir_stack = MenhirCell1_arith_relation_mul (_menhir_stack, _menhir_s, _v) in
          (* Shifting (SLASH) to state 55 *)
          (* State 55: *)
          let _menhir_s = MenhirState055 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | STAR ->
              (* Shifting (STAR) to state 23 *)
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              (* Shifting (MINUS) to state 26 *)
              _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | METAVAR _v ->
              (* Shifting (METAVAR) to state 24 *)
              _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | LPAREN ->
              (* Shifting (LPAREN) to state 25 *)
              _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              (* Shifting (INT) to state 29 *)
              _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IDENTIFIER _v ->
              (* Shifting (IDENTIFIER) to state 30 *)
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FLOAT _v ->
              (* Shifting (FLOAT) to state 35 *)
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              (* Initiating error handling *)
              _eRR ())
      | PLUS ->
          let _menhir_stack = MenhirCell1_arith_relation_mul (_menhir_stack, _menhir_s, _v) in
          (* Shifting (PLUS) to state 57 *)
          (* State 57: *)
          let _menhir_s = MenhirState057 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | STAR ->
              (* Shifting (STAR) to state 23 *)
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              (* Shifting (MINUS) to state 26 *)
              _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | METAVAR _v ->
              (* Shifting (METAVAR) to state 24 *)
              _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | LPAREN ->
              (* Shifting (LPAREN) to state 25 *)
              _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              (* Shifting (INT) to state 29 *)
              _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IDENTIFIER _v ->
              (* Shifting (IDENTIFIER) to state 30 *)
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FLOAT _v ->
              (* Shifting (FLOAT) to state 35 *)
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              (* Initiating error handling *)
              _eRR ())
      | PERCENT ->
          let _menhir_stack = MenhirCell1_arith_relation_mul (_menhir_stack, _menhir_s, _v) in
          (* Shifting (PERCENT) to state 60 *)
          (* State 60: *)
          let _menhir_s = MenhirState060 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | STAR ->
              (* Shifting (STAR) to state 23 *)
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              (* Shifting (MINUS) to state 26 *)
              _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | METAVAR _v ->
              (* Shifting (METAVAR) to state 24 *)
              _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | LPAREN ->
              (* Shifting (LPAREN) to state 25 *)
              _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              (* Shifting (INT) to state 29 *)
              _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IDENTIFIER _v ->
              (* Shifting (IDENTIFIER) to state 30 *)
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FLOAT _v ->
              (* Shifting (FLOAT) to state 35 *)
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              (* Initiating error handling *)
              _eRR ())
      | MINUS ->
          let _menhir_stack = MenhirCell1_arith_relation_mul (_menhir_stack, _menhir_s, _v) in
          (* Shifting (MINUS) to state 62 *)
          (* State 62: *)
          let _menhir_s = MenhirState062 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | STAR ->
              (* Shifting (STAR) to state 23 *)
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              (* Shifting (MINUS) to state 26 *)
              _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | METAVAR _v ->
              (* Shifting (METAVAR) to state 24 *)
              _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | LPAREN ->
              (* Shifting (LPAREN) to state 25 *)
              _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              (* Shifting (INT) to state 29 *)
              _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IDENTIFIER _v ->
              (* Shifting (IDENTIFIER) to state 30 *)
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FLOAT _v ->
              (* Shifting (FLOAT) to state 35 *)
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              (* Initiating error handling *)
              _eRR ())
      | AND | COMMA | EQ | GE | GT | LE | LT | NEQ | OR | RBRACERBRACE | RCURLY | RPAREN | RSQUARE | SEMI_COLON ->
          (* Reducing production arith_relation -> arith_relation_mul *)
          let _1 = _v in
          let _v = _menhir_action_21 _1 in
          _menhir_goto_arith_relation _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_goto_arith_relation : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState137 ->
          _menhir_run_139 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState131 ->
          _menhir_run_135 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState132 ->
          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState081 ->
          _menhir_run_113 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState109 ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState107 ->
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState105 ->
          _menhir_run_106 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState103 ->
          _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState101 ->
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState099 ->
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState074 ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState115 ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState152 ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState146 ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState117 ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState124 ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState119 ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState080 ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState093 ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState096 ->
          _menhir_run_098 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState022 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState025 ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState062 ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState057 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_139 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_guard, _menhir_box_main) _menhir_cell1_arith_relation -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      (* State 139: *)
      match (_tok : MenhirBasics.token) with
      | RCURLY ->
          (* Shifting (RCURLY) to state 140 *)
          (* State 140: *)
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_arith_relation (_menhir_stack, _, _2) = _menhir_stack in
          (* Reducing production repetition -> LCURLY arith_relation COMMA arith_relation RCURLY *)
          let _4 = _v in
          let _v = _menhir_action_74 _2 _4 in
          _menhir_goto_repetition _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_goto_repetition : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_guard -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      (* State 141: *)
      let MenhirCell1_guard (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      (* Reducing production seq_elt -> guard repetition *)
      let _2 = _v in
      let _v = _menhir_action_81 _1 _2 in
      _menhir_goto_seq_elt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_seq_elt : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState074 ->
          _menhir_run_158 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState115 ->
          _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState152 ->
          _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState124 ->
          _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState117 ->
          _menhir_run_123 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_158 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_LCURLY as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      (* State 158: *)
      let _menhir_stack = MenhirCell1_seq_elt (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RCURLY ->
          (* Shifting (RCURLY) to state 159 *)
          (* State 159: *)
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | METAVAR _v_0 ->
              (* Shifting (METAVAR) to state 21 *)
              _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState159
          | RARROW ->
              (* Reducing production actions -> *)
              let _v_1 = _menhir_action_16 () in
              _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1
          | _ ->
              (* Initiating error handling *)
              _eRR ())
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_160 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_LCURLY, _menhir_box_main) _menhir_cell1_seq_elt -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      (* State 160: *)
      (* The current token is RARROW. *)
      (* Shifting (RARROW) to state 161 *)
      (* State 161: *)
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENTIFIER _v_0 ->
          (* Shifting (IDENTIFIER) to state 162 *)
          (* State 162: *)
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_seq_elt (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_LCURLY (_menhir_stack, _menhir_s) = _menhir_stack in
          (* Reducing production transition -> LCURLY seq_elt RCURLY actions RARROW IDENTIFIER *)
          let (_4, _6) = (_v, _v_0) in
          let _v = _menhir_action_85 _2 _4 _6 in
          _menhir_goto_transition _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_goto_transition : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState019 ->
          _menhir_run_170 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState165 ->
          _menhir_run_166 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_170 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_IDENTIFIER as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      (* State 170: *)
      (* Reducing production transitions -> transition *)
      let _1 = _v in
      let _v = _menhir_action_89 _1 in
      _menhir_goto_transitions _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_transitions : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_IDENTIFIER as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      (* State 163: *)
      match (_tok : MenhirBasics.token) with
      | SEMI_COLON ->
          (* Shifting (SEMI_COLON) to state 164 *)
          (* State 164: *)
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_IDENTIFIER (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          (* Reducing production state -> IDENTIFIER COLON transitions SEMI_COLON *)
          let _3 = _v in
          let _v = _menhir_action_82 _1 _3 in
          _menhir_goto_state _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | PIPE ->
          let _menhir_stack = MenhirCell1_transitions (_menhir_stack, _menhir_s, _v) in
          (* Shifting (PIPE) to state 165 *)
          (* State 165: *)
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | OTHERWISE ->
              (* Shifting (OTHERWISE) to state 20 *)
              _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState165
          | METAVAR _v_0 ->
              (* Shifting (METAVAR) to state 21 *)
              _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState165
          | LCURLY ->
              (* Shifting (LCURLY) to state 74 *)
              _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState165
          | RARROW ->
              (* Reducing production actions -> *)
              let _v_1 = _menhir_action_16 () in
              _menhir_run_167 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState165
          | _ ->
              (* Initiating error handling *)
              _eRR ())
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_goto_state : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState017 ->
          _menhir_run_174 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState171 ->
          _menhir_run_173 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_174 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_options, _menhir_box_main) _menhir_cell1_metavars as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      (* State 174: *)
      (* Reducing production states -> state *)
      let _1 = _v in
      let _v = _menhir_action_84 _1 in
      _menhir_goto_states _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_states : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_options, _menhir_box_main) _menhir_cell1_metavars as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      (* State 171: *)
      match (_tok : MenhirBasics.token) with
      | IDENTIFIER _v_0 ->
          let _menhir_stack = MenhirCell1_states (_menhir_stack, _menhir_s, _v) in
          (* Shifting (IDENTIFIER) to state 18 *)
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState171
      | EOF ->
          (* Shifting (EOF) to state 172 *)
          (* State 172: *)
          let MenhirCell1_metavars (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_options (_menhir_stack, _, _1) = _menhir_stack in
          (* Reducing production main -> options metavars states EOF *)
          let _3 = _v in
          let _v = _menhir_action_54 _1 _2 _3 in
          (* State 177: *)
          (* Accepting *)
          MenhirBox_main _v
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_173 : type  ttv_stack. (((ttv_stack, _menhir_box_main) _menhir_cell1_options, _menhir_box_main) _menhir_cell1_metavars, _menhir_box_main) _menhir_cell1_states -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      (* State 173: *)
      let MenhirCell1_states (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      (* Reducing production states -> states state *)
      let _2 = _v in
      let _v = _menhir_action_83 _1 _2 in
      _menhir_goto_states _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_074 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      (* State 74: *)
      let _menhir_stack = MenhirCell1_LCURLY (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState074 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          (* Shifting (TRUE) to state 75 *)
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STAR ->
          (* Shifting (STAR) to state 23 *)
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RETURN_OF ->
          (* Shifting (RETURN_OF) to state 76 *)
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NOT ->
          (* Shifting (NOT) to state 80 *)
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          (* Shifting (MINUS) to state 26 *)
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | METAVAR _v ->
          (* Shifting (METAVAR) to state 24 *)
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LSQUARE ->
          (* Shifting (LSQUARE) to state 115 *)
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          (* Shifting (LPAREN) to state 81 *)
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          (* Shifting (INT) to state 29 *)
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENTIFIER _v ->
          (* Shifting (IDENTIFIER) to state 116 *)
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FLOAT _v ->
          (* Shifting (FLOAT) to state 35 *)
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          (* Shifting (FALSE) to state 82 *)
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CALL_OF ->
          (* Shifting (CALL_OF) to state 83 *)
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CALLORRETURN_OF ->
          (* Shifting (CALLORRETURN_OF) to state 87 *)
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_075 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      (* State 75: *)
      let _tok = _menhir_lexer _menhir_lexbuf in
      (* Reducing production atomic_cond -> TRUE *)
      let _v = _menhir_action_33 () in
      _menhir_goto_atomic_cond _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_atomic_cond : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState080 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState074 ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState115 ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState152 ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState146 ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState117 ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState124 ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState119 ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState081 ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState096 ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState093 ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_114 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_NOT -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      (* State 114: *)
      let MenhirCell1_NOT (_menhir_stack, _menhir_s) = _menhir_stack in
      (* Reducing production atomic_cond -> NOT atomic_cond *)
      let _2 = _v in
      let _v = _menhir_action_35 _2 in
      _menhir_goto_atomic_cond _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_095 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      (* State 95: *)
      match (_tok : MenhirBasics.token) with
      | AND ->
          let _menhir_stack = MenhirCell1_atomic_cond (_menhir_stack, _menhir_s, _v) in
          (* Shifting (AND) to state 96 *)
          (* State 96: *)
          let _menhir_s = MenhirState096 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              (* Shifting (TRUE) to state 75 *)
              _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STAR ->
              (* Shifting (STAR) to state 23 *)
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | RETURN_OF ->
              (* Shifting (RETURN_OF) to state 76 *)
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NOT ->
              (* Shifting (NOT) to state 80 *)
              _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              (* Shifting (MINUS) to state 26 *)
              _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | METAVAR _v ->
              (* Shifting (METAVAR) to state 24 *)
              _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | LPAREN ->
              (* Shifting (LPAREN) to state 81 *)
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              (* Shifting (INT) to state 29 *)
              _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IDENTIFIER _v ->
              (* Shifting (IDENTIFIER) to state 30 *)
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FLOAT _v ->
              (* Shifting (FLOAT) to state 35 *)
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FALSE ->
              (* Shifting (FALSE) to state 82 *)
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CALL_OF ->
              (* Shifting (CALL_OF) to state 83 *)
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CALLORRETURN_OF ->
              (* Shifting (CALLORRETURN_OF) to state 87 *)
              _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              (* Initiating error handling *)
              _eRR ())
      | OR | RBRACERBRACE | RCURLY | RPAREN | RSQUARE | SEMI_COLON ->
          (* Reducing production conjunction -> atomic_cond *)
          let _1 = _v in
          let _v = _menhir_action_41 _1 in
          _menhir_goto_conjunction _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_076 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      (* State 76: *)
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          (* Shifting (LPAREN) to state 77 *)
          (* State 77: *)
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENTIFIER _v ->
              (* Shifting (IDENTIFIER) to state 78 *)
              (* State 78: *)
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | RPAREN ->
                  (* Shifting (RPAREN) to state 79 *)
                  (* State 79: *)
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (* Reducing production atomic_cond -> RETURN_OF LPAREN IDENTIFIER RPAREN *)
                  let _3 = _v in
                  let _v = _menhir_action_32 _3 in
                  _menhir_goto_atomic_cond _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
              | _ ->
                  (* Initiating error handling *)
                  _eRR ())
          | _ ->
              (* Initiating error handling *)
              _eRR ())
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_080 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      (* State 80: *)
      let _menhir_stack = MenhirCell1_NOT (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState080 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          (* Shifting (TRUE) to state 75 *)
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STAR ->
          (* Shifting (STAR) to state 23 *)
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RETURN_OF ->
          (* Shifting (RETURN_OF) to state 76 *)
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NOT ->
          (* Shifting (NOT) to state 80 *)
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          (* Shifting (MINUS) to state 26 *)
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | METAVAR _v ->
          (* Shifting (METAVAR) to state 24 *)
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LPAREN ->
          (* Shifting (LPAREN) to state 81 *)
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          (* Shifting (INT) to state 29 *)
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENTIFIER _v ->
          (* Shifting (IDENTIFIER) to state 30 *)
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FLOAT _v ->
          (* Shifting (FLOAT) to state 35 *)
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          (* Shifting (FALSE) to state 82 *)
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CALL_OF ->
          (* Shifting (CALL_OF) to state 83 *)
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CALLORRETURN_OF ->
          (* Shifting (CALLORRETURN_OF) to state 87 *)
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_081 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      (* State 81: *)
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState081 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          (* Shifting (TRUE) to state 75 *)
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STAR ->
          (* Shifting (STAR) to state 23 *)
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RETURN_OF ->
          (* Shifting (RETURN_OF) to state 76 *)
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NOT ->
          (* Shifting (NOT) to state 80 *)
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          (* Shifting (MINUS) to state 26 *)
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | METAVAR _v ->
          (* Shifting (METAVAR) to state 24 *)
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LPAREN ->
          (* Shifting (LPAREN) to state 81 *)
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          (* Shifting (INT) to state 29 *)
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENTIFIER _v ->
          (* Shifting (IDENTIFIER) to state 30 *)
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FLOAT _v ->
          (* Shifting (FLOAT) to state 35 *)
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          (* Shifting (FALSE) to state 82 *)
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CALL_OF ->
          (* Shifting (CALL_OF) to state 83 *)
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CALLORRETURN_OF ->
          (* Shifting (CALLORRETURN_OF) to state 87 *)
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_082 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      (* State 82: *)
      let _tok = _menhir_lexer _menhir_lexbuf in
      (* Reducing production atomic_cond -> FALSE *)
      let _v = _menhir_action_34 () in
      _menhir_goto_atomic_cond _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_083 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      (* State 83: *)
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          (* Shifting (LPAREN) to state 84 *)
          (* State 84: *)
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENTIFIER _v ->
              (* Shifting (IDENTIFIER) to state 85 *)
              (* State 85: *)
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | RPAREN ->
                  (* Shifting (RPAREN) to state 86 *)
                  (* State 86: *)
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (* Reducing production atomic_cond -> CALL_OF LPAREN IDENTIFIER RPAREN *)
                  let _3 = _v in
                  let _v = _menhir_action_31 _3 in
                  _menhir_goto_atomic_cond _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
              | _ ->
                  (* Initiating error handling *)
                  _eRR ())
          | _ ->
              (* Initiating error handling *)
              _eRR ())
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_087 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      (* State 87: *)
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          (* Shifting (LPAREN) to state 88 *)
          (* State 88: *)
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENTIFIER _v ->
              (* Shifting (IDENTIFIER) to state 89 *)
              (* State 89: *)
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | RPAREN ->
                  (* Shifting (RPAREN) to state 90 *)
                  (* State 90: *)
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (* Reducing production atomic_cond -> CALLORRETURN_OF LPAREN IDENTIFIER RPAREN *)
                  let _3 = _v in
                  let _v = _menhir_action_30 _3 in
                  _menhir_goto_atomic_cond _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
              | _ ->
                  (* Initiating error handling *)
                  _eRR ())
          | _ ->
              (* Initiating error handling *)
              _eRR ())
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_goto_conjunction : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState096 ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState074 ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState115 ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState152 ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState146 ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState117 ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState124 ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState119 ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState093 ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState081 ->
          _menhir_run_092 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_097 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_atomic_cond -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      (* State 97: *)
      let MenhirCell1_atomic_cond (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      (* Reducing production conjunction -> atomic_cond AND conjunction *)
      let _3 = _v in
      let _v = _menhir_action_40 _1 _3 in
      _menhir_goto_conjunction _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_092 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      (* State 92: *)
      match (_tok : MenhirBasics.token) with
      | OR ->
          let _menhir_stack = MenhirCell1_conjunction (_menhir_stack, _menhir_s, _v) in
          (* Shifting (OR) to state 93 *)
          (* State 93: *)
          let _menhir_s = MenhirState093 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              (* Shifting (TRUE) to state 75 *)
              _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STAR ->
              (* Shifting (STAR) to state 23 *)
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | RETURN_OF ->
              (* Shifting (RETURN_OF) to state 76 *)
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NOT ->
              (* Shifting (NOT) to state 80 *)
              _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              (* Shifting (MINUS) to state 26 *)
              _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | METAVAR _v ->
              (* Shifting (METAVAR) to state 24 *)
              _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | LPAREN ->
              (* Shifting (LPAREN) to state 81 *)
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              (* Shifting (INT) to state 29 *)
              _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IDENTIFIER _v ->
              (* Shifting (IDENTIFIER) to state 30 *)
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FLOAT _v ->
              (* Shifting (FLOAT) to state 35 *)
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FALSE ->
              (* Shifting (FALSE) to state 82 *)
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CALL_OF ->
              (* Shifting (CALL_OF) to state 83 *)
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CALLORRETURN_OF ->
              (* Shifting (CALLORRETURN_OF) to state 87 *)
              _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              (* Initiating error handling *)
              _eRR ())
      | RBRACERBRACE | RCURLY | RPAREN | RSQUARE | SEMI_COLON ->
          (* Reducing production cond -> conjunction *)
          let _1 = _v in
          let _v = _menhir_action_39 _1 in
          _menhir_goto_cond _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_goto_cond : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState146 ->
          _menhir_run_147 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState074 ->
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState115 ->
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState152 ->
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState117 ->
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState124 ->
          _menhir_run_142 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState119 ->
          _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState081 ->
          _menhir_run_111 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState093 ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_147 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_IDENTIFIER -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      (* State 147: *)
      match (_tok : MenhirBasics.token) with
      | RBRACERBRACE ->
          (* Shifting (RBRACERBRACE) to state 148 *)
          (* State 148: *)
          let _tok = _menhir_lexer _menhir_lexbuf in
          (* Reducing production pre_cond -> LBRACELBRACE cond RBRACERBRACE *)
          let _2 = _v in
          let _v = _menhir_action_69 _2 in
          _menhir_goto_pre_cond _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_goto_pre_cond : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_IDENTIFIER -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      (* State 151: *)
      let _menhir_stack = MenhirCell0_pre_cond (_menhir_stack, _v) in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          (* Shifting (LPAREN) to state 152 *)
          (* State 152: *)
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              (* Shifting (TRUE) to state 75 *)
              _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState152
          | STAR ->
              (* Shifting (STAR) to state 23 *)
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState152
          | RETURN_OF ->
              (* Shifting (RETURN_OF) to state 76 *)
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState152
          | NOT ->
              (* Shifting (NOT) to state 80 *)
              _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState152
          | MINUS ->
              (* Shifting (MINUS) to state 26 *)
              _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState152
          | METAVAR _v_0 ->
              (* Shifting (METAVAR) to state 24 *)
              _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState152
          | LSQUARE ->
              (* Shifting (LSQUARE) to state 115 *)
              _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState152
          | LPAREN ->
              (* Shifting (LPAREN) to state 81 *)
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState152
          | INT _v_1 ->
              (* Shifting (INT) to state 29 *)
              _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState152
          | IDENTIFIER _v_2 ->
              (* Shifting (IDENTIFIER) to state 116 *)
              _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState152
          | FLOAT _v_3 ->
              (* Shifting (FLOAT) to state 35 *)
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState152
          | FALSE ->
              (* Shifting (FALSE) to state 82 *)
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState152
          | CALL_OF ->
              (* Shifting (CALL_OF) to state 83 *)
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState152
          | CALLORRETURN_OF ->
              (* Shifting (CALLORRETURN_OF) to state 87 *)
              _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState152
          | RPAREN ->
              (* Reducing production seq -> *)
              let _v_4 = _menhir_action_78 () in
              _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState152 _tok
          | _ ->
              (* Initiating error handling *)
              _eRR ())
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_115 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      (* State 115: *)
      let _menhir_stack = MenhirCell1_LSQUARE (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState115 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          (* Shifting (TRUE) to state 75 *)
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STAR ->
          (* Shifting (STAR) to state 23 *)
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RETURN_OF ->
          (* Shifting (RETURN_OF) to state 76 *)
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NOT ->
          (* Shifting (NOT) to state 80 *)
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          (* Shifting (MINUS) to state 26 *)
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | METAVAR _v ->
          (* Shifting (METAVAR) to state 24 *)
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LSQUARE ->
          (* Shifting (LSQUARE) to state 115 *)
          _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          (* Shifting (LPAREN) to state 81 *)
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          (* Shifting (INT) to state 29 *)
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENTIFIER _v ->
          (* Shifting (IDENTIFIER) to state 116 *)
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FLOAT _v ->
          (* Shifting (FLOAT) to state 35 *)
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          (* Shifting (FALSE) to state 82 *)
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CALL_OF ->
          (* Shifting (CALL_OF) to state 83 *)
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CALLORRETURN_OF ->
          (* Shifting (CALLORRETURN_OF) to state 87 *)
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_116 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      (* State 116: *)
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LPAREN ->
          let _menhir_stack = MenhirCell1_IDENTIFIER (_menhir_stack, _menhir_s, _v) in
          (* Shifting (LPAREN) to state 117 *)
          (* State 117: *)
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              (* Shifting (TRUE) to state 75 *)
              _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState117
          | STAR ->
              (* Shifting (STAR) to state 23 *)
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState117
          | RPAREN ->
              (* Shifting (RPAREN) to state 118 *)
              (* State 118: *)
              let _menhir_stack = MenhirCell1_RPAREN (_menhir_stack, MenhirState117) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LBRACELBRACE ->
                  (* Shifting (LBRACELBRACE) to state 119 *)
                  _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState118
              | DOT ->
                  (* Shifting (DOT) to state 33 *)
                  _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer
              | LCURLY | PLUS | QUESTION | RCURLY | RPAREN | RSQUARE | SEMI_COLON | STAR ->
                  (* Reducing production post_cond -> *)
                  let _v_0 = _menhir_action_66 () in
                  _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
              | _ ->
                  (* Initiating error handling *)
                  _eRR ())
          | RETURN_OF ->
              (* Shifting (RETURN_OF) to state 76 *)
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState117
          | NOT ->
              (* Shifting (NOT) to state 80 *)
              _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState117
          | MINUS ->
              (* Shifting (MINUS) to state 26 *)
              _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState117
          | METAVAR _v_1 ->
              (* Shifting (METAVAR) to state 24 *)
              _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState117
          | LSQUARE ->
              (* Shifting (LSQUARE) to state 115 *)
              _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState117
          | LPAREN ->
              (* Shifting (LPAREN) to state 81 *)
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState117
          | INT _v_2 ->
              (* Shifting (INT) to state 29 *)
              _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState117
          | IDENTIFIER _v_3 ->
              (* Shifting (IDENTIFIER) to state 116 *)
              _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState117
          | FLOAT _v_4 ->
              (* Shifting (FLOAT) to state 35 *)
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState117
          | FALSE ->
              (* Shifting (FALSE) to state 82 *)
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState117
          | CALL_OF ->
              (* Shifting (CALL_OF) to state 83 *)
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState117
          | CALLORRETURN_OF ->
              (* Shifting (CALLORRETURN_OF) to state 87 *)
              _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState117
          | _ ->
              (* Initiating error handling *)
              _eRR ())
      | LBRACELBRACE ->
          let _menhir_stack = MenhirCell1_IDENTIFIER (_menhir_stack, _menhir_s, _v) in
          (* Shifting (LBRACELBRACE) to state 146 *)
          (* State 146: *)
          let _menhir_s = MenhirState146 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              (* Shifting (TRUE) to state 75 *)
              _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STAR ->
              (* Shifting (STAR) to state 23 *)
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | RETURN_OF ->
              (* Shifting (RETURN_OF) to state 76 *)
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NOT ->
              (* Shifting (NOT) to state 80 *)
              _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              (* Shifting (MINUS) to state 26 *)
              _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | METAVAR _v ->
              (* Shifting (METAVAR) to state 24 *)
              _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | LPAREN ->
              (* Shifting (LPAREN) to state 81 *)
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              (* Shifting (INT) to state 29 *)
              _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IDENTIFIER _v ->
              (* Shifting (IDENTIFIER) to state 30 *)
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FLOAT _v ->
              (* Shifting (FLOAT) to state 35 *)
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FALSE ->
              (* Shifting (FALSE) to state 82 *)
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CALL_OF ->
              (* Shifting (CALL_OF) to state 83 *)
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CALLORRETURN_OF ->
              (* Shifting (CALLORRETURN_OF) to state 87 *)
              _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              (* Initiating error handling *)
              _eRR ())
      | COLUMNCOLUMN ->
          let _menhir_stack = MenhirCell1_IDENTIFIER (_menhir_stack, _menhir_s, _v) in
          (* Shifting (COLUMNCOLUMN) to state 149 *)
          (* State 149: *)
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENTIFIER _v_9 ->
              (* Shifting (IDENTIFIER) to state 150 *)
              (* State 150: *)
              let _tok = _menhir_lexer _menhir_lexbuf in
              (* Reducing production pre_cond -> COLUMNCOLUMN IDENTIFIER *)
              let _2 = _v_9 in
              let _v = _menhir_action_68 _2 in
              _menhir_goto_pre_cond _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              (* Initiating error handling *)
              _eRR ())
      | AMP | CARET | DOT | EQ | GE | GT | LE | LSQUARE | LT | MINUS | NEQ | PERCENT | PIPE | PLUS | RARROW | SLASH | STAR ->
          (* Reducing production access_leaf -> IDENTIFIER *)
          let _1 = _v in
          let _v = _menhir_action_07 _1 in
          _menhir_goto_access_leaf _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_119 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      (* State 119: *)
      let _menhir_stack = MenhirCell1_LBRACELBRACE (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState119 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | TRUE ->
          (* Shifting (TRUE) to state 75 *)
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | STAR ->
          (* Shifting (STAR) to state 23 *)
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | RETURN_OF ->
          (* Shifting (RETURN_OF) to state 76 *)
          _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | NOT ->
          (* Shifting (NOT) to state 80 *)
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          (* Shifting (MINUS) to state 26 *)
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | METAVAR _v ->
          (* Shifting (METAVAR) to state 24 *)
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LPAREN ->
          (* Shifting (LPAREN) to state 81 *)
          _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          (* Shifting (INT) to state 29 *)
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENTIFIER _v ->
          (* Shifting (IDENTIFIER) to state 30 *)
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FLOAT _v ->
          (* Shifting (FLOAT) to state 35 *)
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FALSE ->
          (* Shifting (FALSE) to state 82 *)
          _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CALL_OF ->
          (* Shifting (CALL_OF) to state 83 *)
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | CALLORRETURN_OF ->
          (* Shifting (CALLORRETURN_OF) to state 87 *)
          _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_122 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_IDENTIFIER, _menhir_box_main) _menhir_cell1_RPAREN -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      (* State 122: *)
      let MenhirCell1_RPAREN (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_IDENTIFIER (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      (* Reducing production guard -> IDENTIFIER LPAREN RPAREN post_cond *)
      let _4 = _v in
      let _v = _menhir_action_45 _1 _4 in
      _menhir_goto_guard _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_guard : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      (* State 127: *)
      let _menhir_stack = MenhirCell1_guard (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | STAR ->
          (* Shifting (STAR) to state 128 *)
          (* State 128: *)
          let _tok = _menhir_lexer _menhir_lexbuf in
          (* Reducing production repetition -> STAR *)
          let _v = _menhir_action_72 () in
          _menhir_goto_repetition _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | QUESTION ->
          (* Shifting (QUESTION) to state 129 *)
          (* State 129: *)
          let _tok = _menhir_lexer _menhir_lexbuf in
          (* Reducing production repetition -> QUESTION *)
          let _v = _menhir_action_73 () in
          _menhir_goto_repetition _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | PLUS ->
          (* Shifting (PLUS) to state 130 *)
          (* State 130: *)
          let _tok = _menhir_lexer _menhir_lexbuf in
          (* Reducing production repetition -> PLUS *)
          let _v = _menhir_action_71 () in
          _menhir_goto_repetition _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | LCURLY ->
          (* Shifting (LCURLY) to state 131 *)
          (* State 131: *)
          let _menhir_s = MenhirState131 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | STAR ->
              (* Shifting (STAR) to state 23 *)
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              (* Shifting (MINUS) to state 26 *)
              _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | METAVAR _v ->
              (* Shifting (METAVAR) to state 24 *)
              _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | LPAREN ->
              (* Shifting (LPAREN) to state 25 *)
              _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INT _v ->
              (* Shifting (INT) to state 29 *)
              _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | IDENTIFIER _v ->
              (* Shifting (IDENTIFIER) to state 30 *)
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | FLOAT _v ->
              (* Shifting (FLOAT) to state 35 *)
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | COMMA ->
              (* Shifting (COMMA) to state 132 *)
              (* State 132: *)
              let _menhir_stack = MenhirCell1_COMMA (_menhir_stack, _menhir_s) in
              let _menhir_s = MenhirState132 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | STAR ->
                  (* Shifting (STAR) to state 23 *)
                  _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | MINUS ->
                  (* Shifting (MINUS) to state 26 *)
                  _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | METAVAR _v ->
                  (* Shifting (METAVAR) to state 24 *)
                  _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | LPAREN ->
                  (* Shifting (LPAREN) to state 25 *)
                  _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | INT _v ->
                  (* Shifting (INT) to state 29 *)
                  _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | IDENTIFIER _v ->
                  (* Shifting (IDENTIFIER) to state 30 *)
                  _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | FLOAT _v ->
                  (* Shifting (FLOAT) to state 35 *)
                  _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  (* Initiating error handling *)
                  _eRR ())
          | _ ->
              (* Initiating error handling *)
              _eRR ())
      | RCURLY | RPAREN | RSQUARE | SEMI_COLON ->
          (* Reducing production repetition -> *)
          let _v = _menhir_action_70 () in
          _menhir_goto_repetition _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_153 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_IDENTIFIER _menhir_cell0_pre_cond as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      (* State 153: *)
      let _menhir_stack = MenhirCell1_seq (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          (* Shifting (RPAREN) to state 154 *)
          (* State 154: *)
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LBRACELBRACE ->
              (* Shifting (LBRACELBRACE) to state 119 *)
              _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState154
          | LCURLY | PLUS | QUESTION | RCURLY | RPAREN | RSQUARE | SEMI_COLON | STAR ->
              (* Reducing production post_cond -> *)
              let _v_0 = _menhir_action_66 () in
              _menhir_run_155 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
          | _ ->
              (* Initiating error handling *)
              _eRR ())
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_155 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_IDENTIFIER _menhir_cell0_pre_cond, _menhir_box_main) _menhir_cell1_seq -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      (* State 155: *)
      let MenhirCell1_seq (_menhir_stack, _, _4) = _menhir_stack in
      let MenhirCell0_pre_cond (_menhir_stack, _2) = _menhir_stack in
      let MenhirCell1_IDENTIFIER (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      (* Reducing production guard -> IDENTIFIER pre_cond LPAREN seq RPAREN post_cond *)
      let _6 = _v in
      let _v = _menhir_action_43 _1 _2 _4 _6 in
      _menhir_goto_guard _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_142 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      (* State 142: *)
      (* Reducing production seq_elt -> cond *)
      let _1 = _v in
      let _v = _menhir_action_80 _1 in
      _menhir_goto_seq_elt _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_120 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_LBRACELBRACE -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      (* State 120: *)
      match (_tok : MenhirBasics.token) with
      | RBRACERBRACE ->
          (* Shifting (RBRACERBRACE) to state 121 *)
          (* State 121: *)
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LBRACELBRACE (_menhir_stack, _menhir_s) = _menhir_stack in
          (* Reducing production post_cond -> LBRACELBRACE cond RBRACERBRACE *)
          let _2 = _v in
          let _v = _menhir_action_67 _2 in
          _menhir_goto_post_cond _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_goto_post_cond : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState154 ->
          _menhir_run_155 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState144 ->
          _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState118 ->
          _menhir_run_122 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_145 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_IDENTIFIER, _menhir_box_main) _menhir_cell1_non_empty_seq -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      (* State 145: *)
      let MenhirCell1_non_empty_seq (_menhir_stack, _, _3) = _menhir_stack in
      let MenhirCell1_IDENTIFIER (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      (* Reducing production guard -> IDENTIFIER LPAREN non_empty_seq RPAREN post_cond *)
      let _5 = _v in
      let _v = _menhir_action_44 _1 _3 _5 in
      _menhir_goto_guard _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_111 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_LPAREN -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      (* State 111: *)
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          (* Shifting (RPAREN) to state 112 *)
          (* State 112: *)
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          (* Reducing production atomic_cond -> LPAREN cond RPAREN *)
          let _2 = _v in
          let _v = _menhir_action_36 _2 in
          _menhir_goto_atomic_cond _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_094 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_conjunction -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      (* State 94: *)
      let MenhirCell1_conjunction (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      (* Reducing production cond -> conjunction OR cond *)
      let _3 = _v in
      let _v = _menhir_action_38 _1 _3 in
      _menhir_goto_cond _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_167 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      (* State 167: *)
      (* The current token is RARROW. *)
      (* Shifting (RARROW) to state 168 *)
      (* State 168: *)
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENTIFIER _v_0 ->
          (* Shifting (IDENTIFIER) to state 169 *)
          (* State 169: *)
          let _tok = _menhir_lexer _menhir_lexbuf in
          (* Reducing production transition -> actions RARROW IDENTIFIER *)
          let (_1, _3) = (_v, _v_0) in
          let _v = _menhir_action_87 _1 _3 in
          _menhir_goto_transition _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_166 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_IDENTIFIER, _menhir_box_main) _menhir_cell1_transitions -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      (* State 166: *)
      let MenhirCell1_transitions (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      (* Reducing production transitions -> transitions PIPE transition *)
      let _3 = _v in
      let _v = _menhir_action_88 _1 _3 in
      _menhir_goto_transitions _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_123 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      (* State 123: *)
      match (_tok : MenhirBasics.token) with
      | SEMI_COLON ->
          let _menhir_stack = MenhirCell1_seq_elt (_menhir_stack, _menhir_s, _v) in
          (* Shifting (SEMI_COLON) to state 124 *)
          (* State 124: *)
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | TRUE ->
              (* Shifting (TRUE) to state 75 *)
              _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState124
          | STAR ->
              (* Shifting (STAR) to state 23 *)
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState124
          | RETURN_OF ->
              (* Shifting (RETURN_OF) to state 76 *)
              _menhir_run_076 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState124
          | NOT ->
              (* Shifting (NOT) to state 80 *)
              _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState124
          | MINUS ->
              (* Shifting (MINUS) to state 26 *)
              _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState124
          | METAVAR _v_0 ->
              (* Shifting (METAVAR) to state 24 *)
              _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState124
          | LSQUARE ->
              (* Shifting (LSQUARE) to state 115 *)
              _menhir_run_115 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState124
          | LPAREN ->
              (* Shifting (LPAREN) to state 81 *)
              _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState124
          | INT _v_1 ->
              (* Shifting (INT) to state 29 *)
              _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState124
          | IDENTIFIER _v_2 ->
              (* Shifting (IDENTIFIER) to state 116 *)
              _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState124
          | FLOAT _v_3 ->
              (* Shifting (FLOAT) to state 35 *)
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState124
          | FALSE ->
              (* Shifting (FALSE) to state 82 *)
              _menhir_run_082 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState124
          | CALL_OF ->
              (* Shifting (CALL_OF) to state 83 *)
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState124
          | CALLORRETURN_OF ->
              (* Shifting (CALLORRETURN_OF) to state 87 *)
              _menhir_run_087 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState124
          | RPAREN | RSQUARE ->
              (* Reducing production seq -> *)
              let _v_4 = _menhir_action_78 () in
              _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 _tok
          | _ ->
              (* Initiating error handling *)
              _eRR ())
      | RPAREN | RSQUARE ->
          (* Reducing production non_empty_seq -> seq_elt *)
          let _1 = _v in
          let _v = _menhir_action_60 _1 in
          _menhir_goto_non_empty_seq _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_125 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_seq_elt -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      (* State 125: *)
      let MenhirCell1_seq_elt (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      (* Reducing production non_empty_seq -> seq_elt SEMI_COLON seq *)
      let _3 = _v in
      let _v = _menhir_action_61 _1 _3 in
      _menhir_goto_non_empty_seq _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_non_empty_seq : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState115 ->
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState117 ->
          _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState152 ->
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState124 ->
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_156 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_LSQUARE -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      (* State 156: *)
      match (_tok : MenhirBasics.token) with
      | RSQUARE ->
          (* Shifting (RSQUARE) to state 157 *)
          (* State 157: *)
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LSQUARE (_menhir_stack, _menhir_s) = _menhir_stack in
          (* Reducing production guard -> LSQUARE non_empty_seq RSQUARE *)
          let _2 = _v in
          let _v = _menhir_action_42 _2 in
          _menhir_goto_guard _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_143 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_IDENTIFIER as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      (* State 143: *)
      let _menhir_stack = MenhirCell1_non_empty_seq (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          (* Shifting (RPAREN) to state 144 *)
          (* State 144: *)
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LBRACELBRACE ->
              (* Shifting (LBRACELBRACE) to state 119 *)
              _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState144
          | LCURLY | PLUS | QUESTION | RCURLY | RPAREN | RSQUARE | SEMI_COLON | STAR ->
              (* Reducing production post_cond -> *)
              let _v_0 = _menhir_action_66 () in
              _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
          | _ ->
              (* Initiating error handling *)
              _eRR ())
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_126 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      (* State 126: *)
      (* Reducing production seq -> non_empty_seq *)
      let _1 = _v in
      let _v = _menhir_action_79 _1 in
      _menhir_goto_seq _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_seq : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState152 ->
          _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState124 ->
          _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_135 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_guard as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      (* State 135: *)
      match (_tok : MenhirBasics.token) with
      | RCURLY ->
          (* Shifting (RCURLY) to state 136 *)
          (* State 136: *)
          let _tok = _menhir_lexer _menhir_lexbuf in
          (* Reducing production repetition -> LCURLY arith_relation RCURLY *)
          let _2 = _v in
          let _v = _menhir_action_75 _2 in
          _menhir_goto_repetition _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | COMMA ->
          (* Shifting (COMMA) to state 137 *)
          (* State 137: *)
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | STAR ->
              let _menhir_stack = MenhirCell1_arith_relation (_menhir_stack, _menhir_s, _v) in
              (* Shifting (STAR) to state 23 *)
              _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState137
          | RCURLY ->
              (* Shifting (RCURLY) to state 138 *)
              (* State 138: *)
              let _tok = _menhir_lexer _menhir_lexbuf in
              (* Reducing production repetition -> LCURLY arith_relation COMMA RCURLY *)
              let _2 = _v in
              let _v = _menhir_action_76 _2 in
              _menhir_goto_repetition _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | MINUS ->
              let _menhir_stack = MenhirCell1_arith_relation (_menhir_stack, _menhir_s, _v) in
              (* Shifting (MINUS) to state 26 *)
              _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState137
          | METAVAR _v_0 ->
              let _menhir_stack = MenhirCell1_arith_relation (_menhir_stack, _menhir_s, _v) in
              (* Shifting (METAVAR) to state 24 *)
              _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState137
          | LPAREN ->
              let _menhir_stack = MenhirCell1_arith_relation (_menhir_stack, _menhir_s, _v) in
              (* Shifting (LPAREN) to state 25 *)
              _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState137
          | INT _v_1 ->
              let _menhir_stack = MenhirCell1_arith_relation (_menhir_stack, _menhir_s, _v) in
              (* Shifting (INT) to state 29 *)
              _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState137
          | IDENTIFIER _v_2 ->
              let _menhir_stack = MenhirCell1_arith_relation (_menhir_stack, _menhir_s, _v) in
              (* Shifting (IDENTIFIER) to state 30 *)
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState137
          | FLOAT _v_3 ->
              let _menhir_stack = MenhirCell1_arith_relation (_menhir_stack, _menhir_s, _v) in
              (* Shifting (FLOAT) to state 35 *)
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState137
          | _ ->
              (* Initiating error handling *)
              _eRR ())
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_133 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_guard, _menhir_box_main) _menhir_cell1_COMMA -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      (* State 133: *)
      match (_tok : MenhirBasics.token) with
      | RCURLY ->
          (* Shifting (RCURLY) to state 134 *)
          (* State 134: *)
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_COMMA (_menhir_stack, _) = _menhir_stack in
          (* Reducing production repetition -> LCURLY COMMA arith_relation RCURLY *)
          let _3 = _v in
          let _v = _menhir_action_77 _3 in
          _menhir_goto_repetition _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_113 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      (* State 113: *)
      let _menhir_stack = MenhirCell1_arith_relation (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          (* Shifting (RPAREN) to state 65 *)
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer
      | NEQ ->
          (* Shifting (NEQ) to state 99 *)
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LT ->
          (* Shifting (LT) to state 101 *)
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LE ->
          (* Shifting (LE) to state 103 *)
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          (* Shifting (GT) to state 105 *)
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GE ->
          (* Shifting (GE) to state 107 *)
          _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQ ->
          (* Shifting (EQ) to state 109 *)
          _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_065 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_LPAREN, _menhir_box_main) _menhir_cell1_arith_relation -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      (* State 65: *)
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_arith_relation (_menhir_stack, _, _2) = _menhir_stack in
      let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
      (* Reducing production access_leaf -> LPAREN arith_relation RPAREN *)
      let _v = _menhir_action_08 _2 in
      _menhir_goto_access_leaf _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_099 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_arith_relation -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      (* State 99: *)
      let _menhir_s = MenhirState099 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STAR ->
          (* Shifting (STAR) to state 23 *)
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          (* Shifting (MINUS) to state 26 *)
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | METAVAR _v ->
          (* Shifting (METAVAR) to state 24 *)
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LPAREN ->
          (* Shifting (LPAREN) to state 25 *)
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          (* Shifting (INT) to state 29 *)
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENTIFIER _v ->
          (* Shifting (IDENTIFIER) to state 30 *)
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FLOAT _v ->
          (* Shifting (FLOAT) to state 35 *)
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_101 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_arith_relation -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      (* State 101: *)
      let _menhir_s = MenhirState101 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STAR ->
          (* Shifting (STAR) to state 23 *)
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          (* Shifting (MINUS) to state 26 *)
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | METAVAR _v ->
          (* Shifting (METAVAR) to state 24 *)
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LPAREN ->
          (* Shifting (LPAREN) to state 25 *)
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          (* Shifting (INT) to state 29 *)
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENTIFIER _v ->
          (* Shifting (IDENTIFIER) to state 30 *)
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FLOAT _v ->
          (* Shifting (FLOAT) to state 35 *)
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_103 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_arith_relation -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      (* State 103: *)
      let _menhir_s = MenhirState103 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STAR ->
          (* Shifting (STAR) to state 23 *)
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          (* Shifting (MINUS) to state 26 *)
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | METAVAR _v ->
          (* Shifting (METAVAR) to state 24 *)
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LPAREN ->
          (* Shifting (LPAREN) to state 25 *)
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          (* Shifting (INT) to state 29 *)
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENTIFIER _v ->
          (* Shifting (IDENTIFIER) to state 30 *)
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FLOAT _v ->
          (* Shifting (FLOAT) to state 35 *)
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_105 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_arith_relation -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      (* State 105: *)
      let _menhir_s = MenhirState105 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STAR ->
          (* Shifting (STAR) to state 23 *)
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          (* Shifting (MINUS) to state 26 *)
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | METAVAR _v ->
          (* Shifting (METAVAR) to state 24 *)
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LPAREN ->
          (* Shifting (LPAREN) to state 25 *)
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          (* Shifting (INT) to state 29 *)
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENTIFIER _v ->
          (* Shifting (IDENTIFIER) to state 30 *)
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FLOAT _v ->
          (* Shifting (FLOAT) to state 35 *)
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_107 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_arith_relation -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      (* State 107: *)
      let _menhir_s = MenhirState107 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STAR ->
          (* Shifting (STAR) to state 23 *)
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          (* Shifting (MINUS) to state 26 *)
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | METAVAR _v ->
          (* Shifting (METAVAR) to state 24 *)
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LPAREN ->
          (* Shifting (LPAREN) to state 25 *)
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          (* Shifting (INT) to state 29 *)
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENTIFIER _v ->
          (* Shifting (IDENTIFIER) to state 30 *)
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FLOAT _v ->
          (* Shifting (FLOAT) to state 35 *)
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_109 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_arith_relation -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      (* State 109: *)
      let _menhir_s = MenhirState109 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | STAR ->
          (* Shifting (STAR) to state 23 *)
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          (* Shifting (MINUS) to state 26 *)
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | METAVAR _v ->
          (* Shifting (METAVAR) to state 24 *)
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LPAREN ->
          (* Shifting (LPAREN) to state 25 *)
          _menhir_run_025 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | INT _v ->
          (* Shifting (INT) to state 29 *)
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | IDENTIFIER _v ->
          (* Shifting (IDENTIFIER) to state 30 *)
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | FLOAT _v ->
          (* Shifting (FLOAT) to state 35 *)
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_110 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_arith_relation -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      (* State 110: *)
      let MenhirCell1_arith_relation (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      (* Reducing production logic_relation -> arith_relation EQ arith_relation *)
      let _3 = _v in
      let _v = _menhir_action_48 _1 _3 in
      _menhir_goto_logic_relation _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_logic_relation : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      (* State 91: *)
      (* Reducing production atomic_cond -> logic_relation *)
      let _1 = _v in
      let _v = _menhir_action_37 _1 in
      _menhir_goto_atomic_cond _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_108 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_arith_relation -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      (* State 108: *)
      let MenhirCell1_arith_relation (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      (* Reducing production logic_relation -> arith_relation GE arith_relation *)
      let _3 = _v in
      let _v = _menhir_action_52 _1 _3 in
      _menhir_goto_logic_relation _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_106 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_arith_relation -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      (* State 106: *)
      let MenhirCell1_arith_relation (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      (* Reducing production logic_relation -> arith_relation GT arith_relation *)
      let _3 = _v in
      let _v = _menhir_action_50 _1 _3 in
      _menhir_goto_logic_relation _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_104 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_arith_relation -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      (* State 104: *)
      let MenhirCell1_arith_relation (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      (* Reducing production logic_relation -> arith_relation LE arith_relation *)
      let _3 = _v in
      let _v = _menhir_action_51 _1 _3 in
      _menhir_goto_logic_relation _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_102 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_arith_relation -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      (* State 102: *)
      let MenhirCell1_arith_relation (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      (* Reducing production logic_relation -> arith_relation LT arith_relation *)
      let _3 = _v in
      let _v = _menhir_action_49 _1 _3 in
      _menhir_goto_logic_relation _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_100 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_arith_relation -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      (* State 100: *)
      let MenhirCell1_arith_relation (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      (* Reducing production logic_relation -> arith_relation NEQ arith_relation *)
      let _3 = _v in
      let _v = _menhir_action_53 _1 _3 in
      _menhir_goto_logic_relation _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_098 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      (* State 98: *)
      let _menhir_stack = MenhirCell1_arith_relation (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | NEQ ->
          (* Shifting (NEQ) to state 99 *)
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LT ->
          (* Shifting (LT) to state 101 *)
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LE ->
          (* Shifting (LE) to state 103 *)
          _menhir_run_103 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GT ->
          (* Shifting (GT) to state 105 *)
          _menhir_run_105 _menhir_stack _menhir_lexbuf _menhir_lexer
      | GE ->
          (* Shifting (GE) to state 107 *)
          _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer
      | EQ ->
          (* Shifting (EQ) to state 109 *)
          _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_067 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_METAVAR -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      (* State 67: *)
      match (_tok : MenhirBasics.token) with
      | SEMI_COLON ->
          (* Shifting (SEMI_COLON) to state 68 *)
          (* State 68: *)
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_METAVAR (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          (* Reducing production action -> METAVAR AFF arith_relation SEMI_COLON *)
          let _3 = _v in
          let _v = _menhir_action_15 _1 _3 in
          (* State 72: *)
          let _menhir_stack = MenhirCell1_action (_menhir_stack, _menhir_s, _v) in
          (match (_tok : MenhirBasics.token) with
          | METAVAR _v_0 ->
              (* Shifting (METAVAR) to state 21 *)
              _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState072
          | RARROW ->
              (* Reducing production actions -> *)
              let _v_1 = _menhir_action_16 () in
              _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1
          | _ ->
              (* Initiating error handling *)
              _eRR ())
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_073 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_action -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      (* State 73: *)
      let MenhirCell1_action (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      (* Reducing production actions -> action actions *)
      let _2 = _v in
      let _v = _menhir_action_17 _1 _2 in
      _menhir_goto_actions _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_actions : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState019 ->
          _menhir_run_167 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState165 ->
          _menhir_run_167 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState159 ->
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState072 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState020 ->
          _menhir_run_069 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_069 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_OTHERWISE -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      (* State 69: *)
      (* The current token is RARROW. *)
      (* Shifting (RARROW) to state 70 *)
      (* State 70: *)
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENTIFIER _v_0 ->
          (* Shifting (IDENTIFIER) to state 71 *)
          (* State 71: *)
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_OTHERWISE (_menhir_stack, _menhir_s) = _menhir_stack in
          (* Reducing production transition -> OTHERWISE actions RARROW IDENTIFIER *)
          let (_4, _2) = (_v_0, _v) in
          let _v = _menhir_action_86 _2 _4 in
          _menhir_goto_transition _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_064 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_LPAREN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      (* State 64: *)
      let _menhir_stack = MenhirCell1_arith_relation (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          (* Shifting (RPAREN) to state 65 *)
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_063 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_arith_relation_mul -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      (* State 63: *)
      let MenhirCell1_arith_relation_mul (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      (* Reducing production arith_relation -> arith_relation_mul MINUS arith_relation *)
      let _3 = _v in
      let _v = _menhir_action_20 _1 _3 in
      _menhir_goto_arith_relation _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_059 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_arith_relation_mul -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      (* State 59: *)
      let MenhirCell1_arith_relation_mul (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      (* Reducing production arith_relation -> arith_relation_mul PLUS arith_relation *)
      let _3 = _v in
      let _v = _menhir_action_19 _1 _3 in
      _menhir_goto_arith_relation _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_058 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      (* State 58: *)
      match (_tok : MenhirBasics.token) with
      | PIPE ->
          let _menhir_stack = MenhirCell1_arith_relation_bw (_menhir_stack, _menhir_s, _v) in
          (* Shifting (PIPE) to state 39 *)
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CARET ->
          let _menhir_stack = MenhirCell1_arith_relation_bw (_menhir_stack, _menhir_s, _v) in
          (* Shifting (CARET) to state 50 *)
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AMP ->
          let _menhir_stack = MenhirCell1_arith_relation_bw (_menhir_stack, _menhir_s, _v) in
          (* Shifting (AMP) to state 52 *)
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | EQ | GE | GT | LE | LT | MINUS | NEQ | OR | PERCENT | PLUS | RBRACERBRACE | RCURLY | RPAREN | RSQUARE | SEMI_COLON | SLASH | STAR ->
          (* Reducing production arith_relation_mul -> arith_relation_bw *)
          let _1 = _v in
          let _v = _menhir_action_29 _1 in
          _menhir_goto_arith_relation_mul _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_056 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_arith_relation_mul as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      (* State 56: *)
      match (_tok : MenhirBasics.token) with
      | PIPE ->
          let _menhir_stack = MenhirCell1_arith_relation_bw (_menhir_stack, _menhir_s, _v) in
          (* Shifting (PIPE) to state 39 *)
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CARET ->
          let _menhir_stack = MenhirCell1_arith_relation_bw (_menhir_stack, _menhir_s, _v) in
          (* Shifting (CARET) to state 50 *)
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AMP ->
          let _menhir_stack = MenhirCell1_arith_relation_bw (_menhir_stack, _menhir_s, _v) in
          (* Shifting (AMP) to state 52 *)
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | EQ | GE | GT | LE | LT | MINUS | NEQ | OR | PERCENT | PLUS | RBRACERBRACE | RCURLY | RPAREN | RSQUARE | SEMI_COLON | SLASH | STAR ->
          let MenhirCell1_arith_relation_mul (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          (* Reducing production arith_relation_mul -> arith_relation_mul SLASH arith_relation_bw *)
          let _3 = _v in
          let _v = _menhir_action_26 _1 _3 in
          _menhir_goto_arith_relation_mul _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_038 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_arith_relation_mul as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      (* State 38: *)
      match (_tok : MenhirBasics.token) with
      | PIPE ->
          let _menhir_stack = MenhirCell1_arith_relation_bw (_menhir_stack, _menhir_s, _v) in
          (* Shifting (PIPE) to state 39 *)
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer
      | CARET ->
          let _menhir_stack = MenhirCell1_arith_relation_bw (_menhir_stack, _menhir_s, _v) in
          (* Shifting (CARET) to state 50 *)
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AMP ->
          let _menhir_stack = MenhirCell1_arith_relation_bw (_menhir_stack, _menhir_s, _v) in
          (* Shifting (AMP) to state 52 *)
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AND | COMMA | EQ | GE | GT | LE | LT | MINUS | NEQ | OR | PERCENT | PLUS | RBRACERBRACE | RCURLY | RPAREN | RSQUARE | SEMI_COLON | SLASH | STAR ->
          let MenhirCell1_arith_relation_mul (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          (* Reducing production arith_relation_mul -> arith_relation_mul STAR arith_relation_bw *)
          let _3 = _v in
          let _v = _menhir_action_27 _1 _3 in
          _menhir_goto_arith_relation_mul _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_053 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_arith_relation_bw -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      (* State 53: *)
      let MenhirCell1_arith_relation_bw (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      (* Reducing production arith_relation_bw -> arith_relation_bw AMP access_or_const *)
      let _3 = _v in
      let _v = _menhir_action_23 _1 _3 in
      _menhir_goto_arith_relation_bw _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_051 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_arith_relation_bw -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      (* State 51: *)
      let MenhirCell1_arith_relation_bw (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      (* Reducing production arith_relation_bw -> arith_relation_bw CARET access_or_const *)
      let _3 = _v in
      let _v = _menhir_action_25 _1 _3 in
      _menhir_goto_arith_relation_bw _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_046 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_access -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      (* State 46: *)
      match (_tok : MenhirBasics.token) with
      | RSQUARE ->
          (* Shifting (RSQUARE) to state 47 *)
          (* State 47: *)
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_access (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          (* Reducing production access -> access LSQUARE access_or_const RSQUARE *)
          let _3 = _v in
          let _v = _menhir_action_03 _1 _3 in
          _menhir_goto_access _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_040 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_arith_relation_bw -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      (* State 40: *)
      let MenhirCell1_arith_relation_bw (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      (* Reducing production arith_relation_bw -> arith_relation_bw PIPE access_or_const *)
      let _3 = _v in
      let _v = _menhir_action_24 _1 _3 in
      _menhir_goto_arith_relation_bw _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_048 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_access -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      (* State 48: *)
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENTIFIER _v ->
          (* Shifting (IDENTIFIER) to state 49 *)
          (* State 49: *)
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_access (_menhir_stack, _menhir_s, _1) = _menhir_stack in
          (* Reducing production access -> access DOT IDENTIFIER *)
          let _3 = _v in
          let _v = _menhir_action_01 _1 _3 in
          _menhir_goto_access _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_042 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      (* State 42: *)
      match (_tok : MenhirBasics.token) with
      | RARROW ->
          let _menhir_stack = MenhirCell1_access (_menhir_stack, _menhir_s, _v) in
          (* Shifting (RARROW) to state 43 *)
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer
      | LSQUARE ->
          let _menhir_stack = MenhirCell1_access (_menhir_stack, _menhir_s, _v) in
          (* Shifting (LSQUARE) to state 45 *)
          _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer
      | DOT ->
          let _menhir_stack = MenhirCell1_access (_menhir_stack, _menhir_s, _v) in
          (* Shifting (DOT) to state 48 *)
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer
      | AMP | AND | CARET | COMMA | EQ | GE | GT | LE | LT | MINUS | NEQ | OR | PERCENT | PIPE | PLUS | RBRACERBRACE | RCURLY | RPAREN | RSQUARE | SEMI_COLON | SLASH | STAR ->
          (* Reducing production access_or_const -> access *)
          let _1 = _v in
          let _v = _menhir_action_14 _1 in
          _menhir_goto_access_or_const _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  let _menhir_goto_metavars : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_options as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      (* State 17: *)
      let _menhir_stack = MenhirCell1_metavars (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | IDENTIFIER _v_0 ->
          (* Shifting (IDENTIFIER) to state 18 *)
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState017
      | _ ->
          _menhir_fail ()
  
  let rec _menhir_run_011 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      (* State 11: *)
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | COLON ->
          (* Shifting (COLON) to state 12 *)
          (* State 12: *)
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENTIFIER _v_0 ->
              (* Shifting (IDENTIFIER) to state 13 *)
              (* State 13: *)
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | SEMI_COLON ->
                  (* Shifting (SEMI_COLON) to state 14 *)
                  (* State 14: *)
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (* Reducing production metavar -> METAVAR COLON IDENTIFIER SEMI_COLON *)
                  let (_1, _3) = (_v, _v_0) in
                  let _v = _menhir_action_55 _1 _3 in
                  _menhir_goto_metavar _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
              | _ ->
                  (* Initiating error handling *)
                  _eRR ())
          | _ ->
              (* Initiating error handling *)
              _eRR ())
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_goto_metavar : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState010 ->
          _menhir_run_175 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState015 ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_175 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_options as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      (* State 175: *)
      (* Reducing production non_empty_metavars -> metavar *)
      let _1 = _v in
      let _v = _menhir_action_59 _1 in
      _menhir_goto_non_empty_metavars _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_non_empty_metavars : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_options as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      (* State 15: *)
      match (_tok : MenhirBasics.token) with
      | METAVAR _v_0 ->
          let _menhir_stack = MenhirCell1_non_empty_metavars (_menhir_stack, _menhir_s, _v) in
          (* Shifting (METAVAR) to state 11 *)
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState015
      | IDENTIFIER _ ->
          (* Reducing production metavars -> non_empty_metavars *)
          let _1 = _v in
          let _v = _menhir_action_57 _1 in
          _menhir_goto_metavars _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_016 : type  ttv_stack. ((ttv_stack, _menhir_box_main) _menhir_cell1_options, _menhir_box_main) _menhir_cell1_non_empty_metavars -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      (* State 16: *)
      let MenhirCell1_non_empty_metavars (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      (* Reducing production non_empty_metavars -> non_empty_metavars metavar *)
      let _2 = _v in
      let _v = _menhir_action_58 _1 _2 in
      _menhir_goto_non_empty_metavars _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let rec _menhir_run_001 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      (* State 1: *)
      let _menhir_stack = MenhirCell1_PERCENT (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | IDENTIFIER _v ->
          (* Shifting (IDENTIFIER) to state 2 *)
          (* State 2: *)
          let _menhir_stack = MenhirCell0_IDENTIFIER (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | COLON ->
              (* Shifting (COLON) to state 3 *)
              (* State 3: *)
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | IDENTIFIER _v_0 ->
                  (* Shifting (IDENTIFIER) to state 4 *)
                  (* State 4: *)
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (* Reducing production id_list -> IDENTIFIER *)
                  let _1 = _v_0 in
                  let _v = _menhir_action_47 _1 in
                  _menhir_goto_id_list _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
              | _ ->
                  (* Initiating error handling *)
                  _eRR ())
          | SEMI_COLON ->
              (* Reducing production opt_identifiers -> *)
              let _v = _menhir_action_62 () in
              _menhir_goto_opt_identifiers _menhir_stack _menhir_lexbuf _menhir_lexer _v
          | _ ->
              (* Initiating error handling *)
              _eRR ())
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_goto_id_list : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_PERCENT _menhir_cell0_IDENTIFIER -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      (* State 5: *)
      match (_tok : MenhirBasics.token) with
      | COMMA ->
          (* Shifting (COMMA) to state 6 *)
          (* State 6: *)
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | IDENTIFIER _v_0 ->
              (* Shifting (IDENTIFIER) to state 7 *)
              (* State 7: *)
              let _tok = _menhir_lexer _menhir_lexbuf in
              (* Reducing production id_list -> id_list COMMA IDENTIFIER *)
              let (_1, _3) = (_v, _v_0) in
              let _v = _menhir_action_46 _1 _3 in
              _menhir_goto_id_list _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
          | _ ->
              (* Initiating error handling *)
              _eRR ())
      | SEMI_COLON ->
          (* Reducing production opt_identifiers -> COLON id_list *)
          let _2 = _v in
          let _v = _menhir_action_63 _2 in
          _menhir_goto_opt_identifiers _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_goto_opt_identifiers : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_PERCENT _menhir_cell0_IDENTIFIER -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      (* State 8: *)
      (* The current token is SEMI_COLON. *)
      (* Shifting (SEMI_COLON) to state 9 *)
      (* State 9: *)
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell0_IDENTIFIER (_menhir_stack, _2) = _menhir_stack in
      let MenhirCell1_PERCENT (_menhir_stack, _menhir_s) = _menhir_stack in
      (* Reducing production an_option -> PERCENT IDENTIFIER opt_identifiers SEMI_COLON *)
      let _3 = _v in
      let _v = _menhir_action_18 _2 _3 in
      _menhir_goto_an_option _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_an_option : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState000 ->
          _menhir_run_178 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState010 ->
          _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_178 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      (* State 178: *)
      (* Reducing production options -> an_option *)
      let _1 = _v in
      let _v = _menhir_action_65 _1 in
      _menhir_goto_options _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_options : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_main) _menhir_state -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      (* State 10: *)
      let _menhir_stack = MenhirCell1_options (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | PERCENT ->
          (* Shifting (PERCENT) to state 1 *)
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState010
      | METAVAR _v_0 ->
          (* Shifting (METAVAR) to state 11 *)
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState010
      | IDENTIFIER _ ->
          (* Reducing production metavars -> *)
          let _menhir_s = MenhirState010 in
          let _v = _menhir_action_56 () in
          _menhir_goto_metavars _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
  and _menhir_run_176 : type  ttv_stack. (ttv_stack, _menhir_box_main) _menhir_cell1_options -> _ -> _ -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      (* State 176: *)
      let MenhirCell1_options (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      (* Reducing production options -> options an_option *)
      let _2 = _v in
      let _v = _menhir_action_64 _1 _2 in
      _menhir_goto_options _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let _menhir_run_000 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_main =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      (* State 0: *)
      let _menhir_s = MenhirState000 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PERCENT ->
          (* Shifting (PERCENT) to state 1 *)
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          (* Initiating error handling *)
          _eRR ()
  
end

let main =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_main v = _menhir_run_000 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
