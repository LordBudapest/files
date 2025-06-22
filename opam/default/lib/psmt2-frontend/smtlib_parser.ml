
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | VERSION
    | VERBOSITY
    | VALUES
    | UNDERSCORE
    | THEORIES
    | SYMBOL of (
# 41 "src/lib/smtlib_parser.mly"
       (string)
# 20 "src/lib/smtlib_parser.ml"
  )
    | STRINGLIT of (
# 41 "src/lib/smtlib_parser.mly"
       (string)
# 25 "src/lib/smtlib_parser.ml"
  )
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
    | NUMERAL of (
# 41 "src/lib/smtlib_parser.mly"
       (string)
# 57 "src/lib/smtlib_parser.ml"
  )
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
    | HEXADECIMAL of (
# 41 "src/lib/smtlib_parser.mly"
       (string)
# 73 "src/lib/smtlib_parser.ml"
  )
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
    | DECIMAL of (
# 41 "src/lib/smtlib_parser.mly"
       (string)
# 110 "src/lib/smtlib_parser.ml"
  )
    | CHECKSATASSUMING
    | CHECKSAT
    | CHECKENTAILMENT
    | CHECKALLSAT
    | CATEGORY
    | BINARY of (
# 41 "src/lib/smtlib_parser.mly"
       (string)
# 120 "src/lib/smtlib_parser.ml"
  )
    | AXIOMS
    | AUTHORS
    | AUTHOR
    | ASSERTIONSTACKLVL
    | ASSERT
    | ASCIIWOR of (
# 41 "src/lib/smtlib_parser.mly"
       (string)
# 130 "src/lib/smtlib_parser.ml"
  )
    | AS
    | ALLSTATS
  
end

include MenhirBasics

# 6 "src/lib/smtlib_parser.mly"
  
   open Smtlib_syntax

   let mk_data p c =
     let p =
       if Options.keep_loc () then Some p
       else None
     in
       {p;c;ty= Smtlib_ty.new_type Smtlib_ty.TDummy;is_quantif=false}

# 150 "src/lib/smtlib_parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState000 : ('s, _menhir_box_commands) _menhir_state
    (** State 000.
        Stack shape : .
        Start symbol: commands. *)

  | MenhirState001 : (('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_state
    (** State 001.
        Stack shape : LP.
        Start symbol: commands. *)

  | MenhirState003 : ((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_SETOPTION, _menhir_box_commands) _menhir_state
    (** State 003.
        Stack shape : LP SETOPTION.
        Start symbol: commands. *)

  | MenhirState008 : (('s, _menhir_box_commands) _menhir_cell1_STATUTS, _menhir_box_commands) _menhir_state
    (** State 008.
        Stack shape : STATUTS.
        Start symbol: commands. *)

  | MenhirState051 : (((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_SETOPTION, _menhir_box_commands) _menhir_cell1_key_option, _menhir_box_commands) _menhir_state
    (** State 051.
        Stack shape : LP SETOPTION key_option.
        Start symbol: commands. *)

  | MenhirState055 : (('s, _menhir_box_commands) _menhir_cell1_key_info, _menhir_box_commands) _menhir_state
    (** State 055.
        Stack shape : key_info.
        Start symbol: commands. *)

  | MenhirState058 : ((('s, _menhir_box_commands) _menhir_cell1_key_info, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_state
    (** State 058.
        Stack shape : key_info LP.
        Start symbol: commands. *)

  | MenhirState059 : (('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_state
    (** State 059.
        Stack shape : LP.
        Start symbol: commands. *)

  | MenhirState064 : (('s, _menhir_box_commands) _menhir_cell1_sexpr, _menhir_box_commands) _menhir_state
    (** State 064.
        Stack shape : sexpr.
        Start symbol: commands. *)

  | MenhirState076 : ((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_SETLOGIC, _menhir_box_commands) _menhir_state
    (** State 076.
        Stack shape : LP SETLOGIC.
        Start symbol: commands. *)

  | MenhirState079 : ((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_SETINFO, _menhir_box_commands) _menhir_state
    (** State 079.
        Stack shape : LP SETINFO.
        Start symbol: commands. *)

  | MenhirState093 : ((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_GETVALUE _menhir_cell0_LP, _menhir_box_commands) _menhir_state
    (** State 093.
        Stack shape : LP GETVALUE LP.
        Start symbol: commands. *)

  | MenhirState094 : (('s, 'r) _menhir_cell1_LP, 'r) _menhir_state
    (** State 094.
        Stack shape : LP.
        Start symbol: <undetermined>. *)

  | MenhirState095 : ((('s, 'r) _menhir_cell1_LP, 'r) _menhir_cell1_UNDERSCORE, 'r) _menhir_state
    (** State 095.
        Stack shape : LP UNDERSCORE.
        Start symbol: <undetermined>. *)

  | MenhirState096 : (((('s, 'r) _menhir_cell1_LP, 'r) _menhir_cell1_UNDERSCORE, 'r) _menhir_cell1_symbol, 'r) _menhir_state
    (** State 096.
        Stack shape : LP UNDERSCORE symbol.
        Start symbol: <undetermined>. *)

  | MenhirState099 : (('s, 'r) _menhir_cell1_index, 'r) _menhir_state
    (** State 099.
        Stack shape : index.
        Start symbol: <undetermined>. *)

  | MenhirState101 : ((('s, 'r) _menhir_cell1_LP, 'r) _menhir_cell1_MATCH, 'r) _menhir_state
    (** State 101.
        Stack shape : LP MATCH.
        Start symbol: <undetermined>. *)

  | MenhirState103 : (((('s, 'r) _menhir_cell1_LP, 'r) _menhir_cell1_MATCH, 'r) _menhir_cell1_term _menhir_cell0_LP, 'r) _menhir_state
    (** State 103.
        Stack shape : LP MATCH term LP.
        Start symbol: <undetermined>. *)

  | MenhirState104 : (('s, 'r) _menhir_cell1_LP, 'r) _menhir_state
    (** State 104.
        Stack shape : LP.
        Start symbol: <undetermined>. *)

  | MenhirState106 : ((('s, 'r) _menhir_cell1_LP, 'r) _menhir_cell1_LP, 'r) _menhir_state
    (** State 106.
        Stack shape : LP LP.
        Start symbol: <undetermined>. *)

  | MenhirState107 : (((('s, 'r) _menhir_cell1_LP, 'r) _menhir_cell1_LP, 'r) _menhir_cell1_symbol, 'r) _menhir_state
    (** State 107.
        Stack shape : LP LP symbol.
        Start symbol: <undetermined>. *)

  | MenhirState108 : (('s, 'r) _menhir_cell1_symbol, 'r) _menhir_state
    (** State 108.
        Stack shape : symbol.
        Start symbol: <undetermined>. *)

  | MenhirState113 : ((('s, 'r) _menhir_cell1_LP, 'r) _menhir_cell1_pattern, 'r) _menhir_state
    (** State 113.
        Stack shape : LP pattern.
        Start symbol: <undetermined>. *)

  | MenhirState123 : (('s, 'r) _menhir_cell1_match_case, 'r) _menhir_state
    (** State 123.
        Stack shape : match_case.
        Start symbol: <undetermined>. *)

  | MenhirState125 : ((('s, 'r) _menhir_cell1_LP, 'r) _menhir_cell1_LP, 'r) _menhir_state
    (** State 125.
        Stack shape : LP LP.
        Start symbol: <undetermined>. *)

  | MenhirState126 : ((('s, 'r) _menhir_cell1_LP, 'r) _menhir_cell1_AS, 'r) _menhir_state
    (** State 126.
        Stack shape : LP AS.
        Start symbol: <undetermined>. *)

  | MenhirState127 : (('s, 'r) _menhir_cell1_LP, 'r) _menhir_state
    (** State 127.
        Stack shape : LP.
        Start symbol: <undetermined>. *)

  | MenhirState128 : (((('s, 'r) _menhir_cell1_LP, 'r) _menhir_cell1_AS, 'r) _menhir_cell1_identifier, 'r) _menhir_state
    (** State 128.
        Stack shape : LP AS identifier.
        Start symbol: <undetermined>. *)

  | MenhirState129 : (('s, 'r) _menhir_cell1_LP, 'r) _menhir_state
    (** State 129.
        Stack shape : LP.
        Start symbol: <undetermined>. *)

  | MenhirState130 : ((('s, 'r) _menhir_cell1_LP, 'r) _menhir_cell1_identifier, 'r) _menhir_state
    (** State 130.
        Stack shape : LP identifier.
        Start symbol: <undetermined>. *)

  | MenhirState131 : (('s, 'r) _menhir_cell1_sort, 'r) _menhir_state
    (** State 131.
        Stack shape : sort.
        Start symbol: <undetermined>. *)

  | MenhirState139 : ((('s, 'r) _menhir_cell1_LP, 'r) _menhir_cell1_LET _menhir_cell0_LP, 'r) _menhir_state
    (** State 139.
        Stack shape : LP LET LP.
        Start symbol: <undetermined>. *)

  | MenhirState140 : (((('s, 'r) _menhir_cell1_LP, 'r) _menhir_cell1_LET _menhir_cell0_LP, 'r) _menhir_cell1_RP, 'r) _menhir_state
    (** State 140.
        Stack shape : LP LET LP RP.
        Start symbol: <undetermined>. *)

  | MenhirState143 : (('s, 'r) _menhir_cell1_LP, 'r) _menhir_state
    (** State 143.
        Stack shape : LP.
        Start symbol: <undetermined>. *)

  | MenhirState144 : ((('s, 'r) _menhir_cell1_LP, 'r) _menhir_cell1_symbol, 'r) _menhir_state
    (** State 144.
        Stack shape : LP symbol.
        Start symbol: <undetermined>. *)

  | MenhirState147 : (('s, 'r) _menhir_cell1_varbinding, 'r) _menhir_state
    (** State 147.
        Stack shape : varbinding.
        Start symbol: <undetermined>. *)

  | MenhirState150 : (((('s, 'r) _menhir_cell1_LP, 'r) _menhir_cell1_LET _menhir_cell0_LP, 'r) _menhir_cell1_nonempty_list_varbinding_ _menhir_cell0_RP, 'r) _menhir_state
    (** State 150.
        Stack shape : LP LET LP nonempty_list(varbinding) RP.
        Start symbol: <undetermined>. *)

  | MenhirState154 : ((('s, 'r) _menhir_cell1_LP, 'r) _menhir_cell1_FORALL _menhir_cell0_LP, 'r) _menhir_state
    (** State 154.
        Stack shape : LP FORALL LP.
        Start symbol: <undetermined>. *)

  | MenhirState155 : (('s, 'r) _menhir_cell1_LP, 'r) _menhir_state
    (** State 155.
        Stack shape : LP.
        Start symbol: <undetermined>. *)

  | MenhirState156 : ((('s, 'r) _menhir_cell1_LP, 'r) _menhir_cell1_symbol, 'r) _menhir_state
    (** State 156.
        Stack shape : LP symbol.
        Start symbol: <undetermined>. *)

  | MenhirState159 : (('s, 'r) _menhir_cell1_sorted_var, 'r) _menhir_state
    (** State 159.
        Stack shape : sorted_var.
        Start symbol: <undetermined>. *)

  | MenhirState162 : (((('s, 'r) _menhir_cell1_LP, 'r) _menhir_cell1_FORALL _menhir_cell0_LP, 'r) _menhir_cell1_nonempty_list_sorted_var_ _menhir_cell0_RP, 'r) _menhir_state
    (** State 162.
        Stack shape : LP FORALL LP nonempty_list(sorted_var) RP.
        Start symbol: <undetermined>. *)

  | MenhirState166 : ((('s, 'r) _menhir_cell1_LP, 'r) _menhir_cell1_EXISTS _menhir_cell0_LP, 'r) _menhir_state
    (** State 166.
        Stack shape : LP EXISTS LP.
        Start symbol: <undetermined>. *)

  | MenhirState168 : (((('s, 'r) _menhir_cell1_LP, 'r) _menhir_cell1_EXISTS _menhir_cell0_LP, 'r) _menhir_cell1_nonempty_list_sorted_var_ _menhir_cell0_RP, 'r) _menhir_state
    (** State 168.
        Stack shape : LP EXISTS LP nonempty_list(sorted_var) RP.
        Start symbol: <undetermined>. *)

  | MenhirState171 : ((('s, 'r) _menhir_cell1_LP, 'r) _menhir_cell1_EXCLIMATIONPT, 'r) _menhir_state
    (** State 171.
        Stack shape : LP EXCLIMATIONPT.
        Start symbol: <undetermined>. *)

  | MenhirState172 : (((('s, 'r) _menhir_cell1_LP, 'r) _menhir_cell1_EXCLIMATIONPT, 'r) _menhir_cell1_term, 'r) _menhir_state
    (** State 172.
        Stack shape : LP EXCLIMATIONPT term.
        Start symbol: <undetermined>. *)

  | MenhirState174 : (('s, 'r) _menhir_cell1_PATTERN _menhir_cell0_LP, 'r) _menhir_state
    (** State 174.
        Stack shape : PATTERN LP.
        Start symbol: <undetermined>. *)

  | MenhirState175 : (('s, 'r) _menhir_cell1_term, 'r) _menhir_state
    (** State 175.
        Stack shape : term.
        Start symbol: <undetermined>. *)

  | MenhirState179 : (('s, 'r) _menhir_cell1_NAMED, 'r) _menhir_state
    (** State 179.
        Stack shape : NAMED.
        Start symbol: <undetermined>. *)

  | MenhirState183 : (('s, 'r) _menhir_cell1_key_term, 'r) _menhir_state
    (** State 183.
        Stack shape : key_term.
        Start symbol: <undetermined>. *)

  | MenhirState185 : ((('s, 'r) _menhir_cell1_LP, 'r) _menhir_cell1_qualidentifier, 'r) _menhir_state
    (** State 185.
        Stack shape : LP qualidentifier.
        Start symbol: <undetermined>. *)

  | MenhirState197 : ((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_GETOPTION, _menhir_box_commands) _menhir_state
    (** State 197.
        Stack shape : LP GETOPTION.
        Start symbol: commands. *)

  | MenhirState202 : ((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_GETINFO, _menhir_box_commands) _menhir_state
    (** State 202.
        Stack shape : LP GETINFO.
        Start symbol: commands. *)

  | MenhirState211 : ((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_ECHO, _menhir_box_commands) _menhir_state
    (** State 211.
        Stack shape : LP ECHO.
        Start symbol: commands. *)

  | MenhirState214 : ((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DEFINESORT, _menhir_box_commands) _menhir_state
    (** State 214.
        Stack shape : LP DEFINESORT.
        Start symbol: commands. *)

  | MenhirState216 : (((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DEFINESORT, _menhir_box_commands) _menhir_cell1_symbol _menhir_cell0_LP, _menhir_box_commands) _menhir_state
    (** State 216.
        Stack shape : LP DEFINESORT symbol LP.
        Start symbol: commands. *)

  | MenhirState217 : (('s, _menhir_box_commands) _menhir_cell1_symbol, _menhir_box_commands) _menhir_state
    (** State 217.
        Stack shape : symbol.
        Start symbol: commands. *)

  | MenhirState220 : ((((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DEFINESORT, _menhir_box_commands) _menhir_cell1_symbol _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_list_symbol_ _menhir_cell0_RP, _menhir_box_commands) _menhir_state
    (** State 220.
        Stack shape : LP DEFINESORT symbol LP list(symbol) RP.
        Start symbol: commands. *)

  | MenhirState224 : ((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DEFINEFUNSREC _menhir_cell0_LP, _menhir_box_commands) _menhir_state
    (** State 224.
        Stack shape : LP DEFINEFUNSREC LP.
        Start symbol: commands. *)

  | MenhirState225 : (('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_state
    (** State 225.
        Stack shape : LP.
        Start symbol: commands. *)

  | MenhirState227 : (('s, _menhir_box_commands) _menhir_cell1_symbol _menhir_cell0_LP, _menhir_box_commands) _menhir_state
    (** State 227.
        Stack shape : symbol LP.
        Start symbol: commands. *)

  | MenhirState229 : ((('s, _menhir_box_commands) _menhir_cell1_symbol _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_PAR _menhir_cell0_LP, _menhir_box_commands) _menhir_state
    (** State 229.
        Stack shape : symbol LP PAR LP.
        Start symbol: commands. *)

  | MenhirState232 : (((('s, _menhir_box_commands) _menhir_cell1_symbol _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_PAR _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_nonempty_list_symbol_ _menhir_cell0_RP _menhir_cell0_LP, _menhir_box_commands) _menhir_state
    (** State 232.
        Stack shape : symbol LP PAR LP nonempty_list(symbol) RP LP.
        Start symbol: commands. *)

  | MenhirState233 : (('s, _menhir_box_commands) _menhir_cell1_sorted_var, _menhir_box_commands) _menhir_state
    (** State 233.
        Stack shape : sorted_var.
        Start symbol: commands. *)

  | MenhirState236 : ((((('s, _menhir_box_commands) _menhir_cell1_symbol _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_PAR _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_nonempty_list_symbol_ _menhir_cell0_RP _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_list_sorted_var_ _menhir_cell0_RP, _menhir_box_commands) _menhir_state
    (** State 236.
        Stack shape : symbol LP PAR LP nonempty_list(symbol) RP LP list(sorted_var) RP.
        Start symbol: commands. *)

  | MenhirState240 : ((('s, _menhir_box_commands) _menhir_cell1_symbol _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_list_sorted_var_ _menhir_cell0_RP, _menhir_box_commands) _menhir_state
    (** State 240.
        Stack shape : symbol LP list(sorted_var) RP.
        Start symbol: commands. *)

  | MenhirState246 : (((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DEFINEFUNSREC _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_list_fun_defs_ _menhir_cell0_RP _menhir_cell0_LP, _menhir_box_commands) _menhir_state
    (** State 246.
        Stack shape : LP DEFINEFUNSREC LP list(fun_defs) RP LP.
        Start symbol: commands. *)

  | MenhirState250 : (('s, _menhir_box_commands) _menhir_cell1_fun_defs, _menhir_box_commands) _menhir_state
    (** State 250.
        Stack shape : fun_defs.
        Start symbol: commands. *)

  | MenhirState252 : ((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DEFINEFUNREC, _menhir_box_commands) _menhir_state
    (** State 252.
        Stack shape : LP DEFINEFUNREC.
        Start symbol: commands. *)

  | MenhirState253 : (((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DEFINEFUNREC, _menhir_box_commands) _menhir_cell1_fun_def, _menhir_box_commands) _menhir_state
    (** State 253.
        Stack shape : LP DEFINEFUNREC fun_def.
        Start symbol: commands. *)

  | MenhirState256 : ((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DEFINEFUN, _menhir_box_commands) _menhir_state
    (** State 256.
        Stack shape : LP DEFINEFUN.
        Start symbol: commands. *)

  | MenhirState257 : (((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DEFINEFUN, _menhir_box_commands) _menhir_cell1_fun_def, _menhir_box_commands) _menhir_state
    (** State 257.
        Stack shape : LP DEFINEFUN fun_def.
        Start symbol: commands. *)

  | MenhirState260 : ((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DECLARESORT, _menhir_box_commands) _menhir_state
    (** State 260.
        Stack shape : LP DECLARESORT.
        Start symbol: commands. *)

  | MenhirState264 : ((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DECLAREFUN, _menhir_box_commands) _menhir_state
    (** State 264.
        Stack shape : LP DECLAREFUN.
        Start symbol: commands. *)

  | MenhirState266 : (((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DECLAREFUN, _menhir_box_commands) _menhir_cell1_symbol _menhir_cell0_LP, _menhir_box_commands) _menhir_state
    (** State 266.
        Stack shape : LP DECLAREFUN symbol LP.
        Start symbol: commands. *)

  | MenhirState268 : ((((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DECLAREFUN, _menhir_box_commands) _menhir_cell1_symbol _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_PAR _menhir_cell0_LP, _menhir_box_commands) _menhir_state
    (** State 268.
        Stack shape : LP DECLAREFUN symbol LP PAR LP.
        Start symbol: commands. *)

  | MenhirState271 : (((((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DECLAREFUN, _menhir_box_commands) _menhir_cell1_symbol _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_PAR _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_nonempty_list_symbol_ _menhir_cell0_RP _menhir_cell0_LP, _menhir_box_commands) _menhir_state
    (** State 271.
        Stack shape : LP DECLAREFUN symbol LP PAR LP nonempty_list(symbol) RP LP.
        Start symbol: commands. *)

  | MenhirState272 : (('s, _menhir_box_commands) _menhir_cell1_sort, _menhir_box_commands) _menhir_state
    (** State 272.
        Stack shape : sort.
        Start symbol: commands. *)

  | MenhirState275 : ((((((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DECLAREFUN, _menhir_box_commands) _menhir_cell1_symbol _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_PAR _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_nonempty_list_symbol_ _menhir_cell0_RP _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_list_sort_ _menhir_cell0_RP, _menhir_box_commands) _menhir_state
    (** State 275.
        Stack shape : LP DECLAREFUN symbol LP PAR LP nonempty_list(symbol) RP LP list(sort) RP.
        Start symbol: commands. *)

  | MenhirState279 : ((((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DECLAREFUN, _menhir_box_commands) _menhir_cell1_symbol _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_list_sort_ _menhir_cell0_RP, _menhir_box_commands) _menhir_state
    (** State 279.
        Stack shape : LP DECLAREFUN symbol LP list(sort) RP.
        Start symbol: commands. *)

  | MenhirState284 : ((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DECLAREDATATYPES _menhir_cell0_LP, _menhir_box_commands) _menhir_state
    (** State 284.
        Stack shape : LP DECLAREDATATYPES LP.
        Start symbol: commands. *)

  | MenhirState285 : (('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_state
    (** State 285.
        Stack shape : LP.
        Start symbol: commands. *)

  | MenhirState289 : (('s, _menhir_box_commands) _menhir_cell1_sort_dec, _menhir_box_commands) _menhir_state
    (** State 289.
        Stack shape : sort_dec.
        Start symbol: commands. *)

  | MenhirState293 : (((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DECLAREDATATYPES _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_nonempty_list_sort_dec_ _menhir_cell0_RP _menhir_cell0_LP, _menhir_box_commands) _menhir_state
    (** State 293.
        Stack shape : LP DECLAREDATATYPES LP nonempty_list(sort_dec) RP LP.
        Start symbol: commands. *)

  | MenhirState294 : (('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_state
    (** State 294.
        Stack shape : LP.
        Start symbol: commands. *)

  | MenhirState296 : ((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_PAR _menhir_cell0_LP, _menhir_box_commands) _menhir_state
    (** State 296.
        Stack shape : LP PAR LP.
        Start symbol: commands. *)

  | MenhirState299 : (((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_PAR _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_nonempty_list_symbol_ _menhir_cell0_RP _menhir_cell0_LP, _menhir_box_commands) _menhir_state
    (** State 299.
        Stack shape : LP PAR LP nonempty_list(symbol) RP LP.
        Start symbol: commands. *)

  | MenhirState300 : (('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_state
    (** State 300.
        Stack shape : LP.
        Start symbol: commands. *)

  | MenhirState301 : ((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_symbol, _menhir_box_commands) _menhir_state
    (** State 301.
        Stack shape : LP symbol.
        Start symbol: commands. *)

  | MenhirState302 : (('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_state
    (** State 302.
        Stack shape : LP.
        Start symbol: commands. *)

  | MenhirState303 : ((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_symbol, _menhir_box_commands) _menhir_state
    (** State 303.
        Stack shape : LP symbol.
        Start symbol: commands. *)

  | MenhirState306 : (('s, _menhir_box_commands) _menhir_cell1_selector_dec, _menhir_box_commands) _menhir_state
    (** State 306.
        Stack shape : selector_dec.
        Start symbol: commands. *)

  | MenhirState313 : (('s, _menhir_box_commands) _menhir_cell1_constructor_dec, _menhir_box_commands) _menhir_state
    (** State 313.
        Stack shape : constructor_dec.
        Start symbol: commands. *)

  | MenhirState320 : (('s, _menhir_box_commands) _menhir_cell1_datatype_dec, _menhir_box_commands) _menhir_state
    (** State 320.
        Stack shape : datatype_dec.
        Start symbol: commands. *)

  | MenhirState322 : ((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DECLAREDATATYPE, _menhir_box_commands) _menhir_state
    (** State 322.
        Stack shape : LP DECLAREDATATYPE.
        Start symbol: commands. *)

  | MenhirState323 : (((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DECLAREDATATYPE, _menhir_box_commands) _menhir_cell1_symbol, _menhir_box_commands) _menhir_state
    (** State 323.
        Stack shape : LP DECLAREDATATYPE symbol.
        Start symbol: commands. *)

  | MenhirState326 : ((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DECLARECONST, _menhir_box_commands) _menhir_state
    (** State 326.
        Stack shape : LP DECLARECONST.
        Start symbol: commands. *)

  | MenhirState327 : (((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DECLARECONST, _menhir_box_commands) _menhir_cell1_symbol, _menhir_box_commands) _menhir_state
    (** State 327.
        Stack shape : LP DECLARECONST symbol.
        Start symbol: commands. *)

  | MenhirState328 : ((((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DECLARECONST, _menhir_box_commands) _menhir_cell1_symbol, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_state
    (** State 328.
        Stack shape : LP DECLARECONST symbol LP.
        Start symbol: commands. *)

  | MenhirState330 : (((((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DECLARECONST, _menhir_box_commands) _menhir_cell1_symbol, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_PAR _menhir_cell0_LP, _menhir_box_commands) _menhir_state
    (** State 330.
        Stack shape : LP DECLARECONST symbol LP PAR LP.
        Start symbol: commands. *)

  | MenhirState332 : ((((((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DECLARECONST, _menhir_box_commands) _menhir_cell1_symbol, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_PAR _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_nonempty_list_symbol_ _menhir_cell0_RP, _menhir_box_commands) _menhir_state
    (** State 332.
        Stack shape : LP DECLARECONST symbol LP PAR LP nonempty_list(symbol) RP.
        Start symbol: commands. *)

  | MenhirState339 : ((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_CHECKSATASSUMING _menhir_cell0_LP, _menhir_box_commands) _menhir_state
    (** State 339.
        Stack shape : LP CHECKSATASSUMING LP.
        Start symbol: commands. *)

  | MenhirState340 : (('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_state
    (** State 340.
        Stack shape : LP.
        Start symbol: commands. *)

  | MenhirState341 : ((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_symbol, _menhir_box_commands) _menhir_state
    (** State 341.
        Stack shape : LP symbol.
        Start symbol: commands. *)

  | MenhirState345 : (('s, _menhir_box_commands) _menhir_cell1_prop_literal, _menhir_box_commands) _menhir_state
    (** State 345.
        Stack shape : prop_literal.
        Start symbol: commands. *)

  | MenhirState352 : ((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_CHECKENTAILMENT, _menhir_box_commands) _menhir_state
    (** State 352.
        Stack shape : LP CHECKENTAILMENT.
        Start symbol: commands. *)

  | MenhirState353 : (('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_state
    (** State 353.
        Stack shape : LP.
        Start symbol: commands. *)

  | MenhirState355 : ((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_PAR _menhir_cell0_LP, _menhir_box_commands) _menhir_state
    (** State 355.
        Stack shape : LP PAR LP.
        Start symbol: commands. *)

  | MenhirState357 : (((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_PAR _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_nonempty_list_symbol_ _menhir_cell0_RP, _menhir_box_commands) _menhir_state
    (** State 357.
        Stack shape : LP PAR LP nonempty_list(symbol) RP.
        Start symbol: commands. *)

  | MenhirState363 : ((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_CHECKALLSAT, _menhir_box_commands) _menhir_state
    (** State 363.
        Stack shape : LP CHECKALLSAT.
        Start symbol: commands. *)

  | MenhirState366 : ((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_ASSERT, _menhir_box_commands) _menhir_state
    (** State 366.
        Stack shape : LP ASSERT.
        Start symbol: commands. *)

  | MenhirState369 : ((('s, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_symbol, _menhir_box_commands) _menhir_state
    (** State 369.
        Stack shape : LP symbol.
        Start symbol: commands. *)

  | MenhirState374 : (('s, _menhir_box_commands) _menhir_cell1_command, _menhir_box_commands) _menhir_state
    (** State 374.
        Stack shape : command.
        Start symbol: commands. *)

  | MenhirState376 : ('s, _menhir_box_term) _menhir_state
    (** State 376.
        Stack shape : .
        Start symbol: term. *)

  | MenhirState378 : ('s, _menhir_box_term_list) _menhir_state
    (** State 378.
        Stack shape : .
        Start symbol: term_list. *)

  | MenhirState380 : (('s, _menhir_box_term_list) _menhir_cell1_term, _menhir_box_term_list) _menhir_state
    (** State 380.
        Stack shape : term.
        Start symbol: term_list. *)


and ('s, 'r) _menhir_cell1_command = 
  | MenhirCell1_command of 's * ('s, 'r) _menhir_state * (Smtlib_syntax.command)

and ('s, 'r) _menhir_cell1_constructor_dec = 
  | MenhirCell1_constructor_dec of 's * ('s, 'r) _menhir_state * (Smtlib_syntax.constructor_dec)

and ('s, 'r) _menhir_cell1_datatype_dec = 
  | MenhirCell1_datatype_dec of 's * ('s, 'r) _menhir_state * (Smtlib_syntax.symbol list * Smtlib_syntax.constructor_dec list)

and ('s, 'r) _menhir_cell1_fun_def = 
  | MenhirCell1_fun_def of 's * ('s, 'r) _menhir_state * (Smtlib_syntax.symbol * Smtlib_syntax.symbol list *
  Smtlib_syntax.sorted_var list * Smtlib_syntax.sort)

and ('s, 'r) _menhir_cell1_fun_defs = 
  | MenhirCell1_fun_defs of 's * ('s, 'r) _menhir_state * (Smtlib_syntax.symbol * Smtlib_syntax.symbol list *
  Smtlib_syntax.sorted_var list * Smtlib_syntax.sort)

and ('s, 'r) _menhir_cell1_identifier = 
  | MenhirCell1_identifier of 's * ('s, 'r) _menhir_state * (Smtlib_syntax.identifier) * Lexing.position * Lexing.position

and ('s, 'r) _menhir_cell1_index = 
  | MenhirCell1_index of 's * ('s, 'r) _menhir_state * (Smtlib_syntax.index) * Lexing.position

and ('s, 'r) _menhir_cell1_key_info = 
  | MenhirCell1_key_info of 's * ('s, 'r) _menhir_state * (Smtlib_syntax.key_info_aux Smtlib_syntax.data) * Lexing.position * Lexing.position

and ('s, 'r) _menhir_cell1_key_option = 
  | MenhirCell1_key_option of 's * ('s, 'r) _menhir_state * (Smtlib_syntax.key_option) * Lexing.position

and ('s, 'r) _menhir_cell1_key_term = 
  | MenhirCell1_key_term of 's * ('s, 'r) _menhir_state * (Smtlib_syntax.key_term)

and ('s, 'r) _menhir_cell1_list_fun_defs_ = 
  | MenhirCell1_list_fun_defs_ of 's * ('s, 'r) _menhir_state * ((Smtlib_syntax.symbol * Smtlib_syntax.symbol list *
   Smtlib_syntax.sorted_var list * Smtlib_syntax.sort)
  list)

and ('s, 'r) _menhir_cell1_list_sort_ = 
  | MenhirCell1_list_sort_ of 's * ('s, 'r) _menhir_state * (Smtlib_syntax.sort list)

and ('s, 'r) _menhir_cell1_list_sorted_var_ = 
  | MenhirCell1_list_sorted_var_ of 's * ('s, 'r) _menhir_state * (Smtlib_syntax.sorted_var list)

and ('s, 'r) _menhir_cell1_list_symbol_ = 
  | MenhirCell1_list_symbol_ of 's * ('s, 'r) _menhir_state * (Smtlib_syntax.symbol list)

and ('s, 'r) _menhir_cell1_match_case = 
  | MenhirCell1_match_case of 's * ('s, 'r) _menhir_state * (Smtlib_syntax.pattern * Smtlib_syntax.term)

and ('s, 'r) _menhir_cell1_nonempty_list_sort_dec_ = 
  | MenhirCell1_nonempty_list_sort_dec_ of 's * ('s, 'r) _menhir_state * (Smtlib_syntax.sort_dec list)

and ('s, 'r) _menhir_cell1_nonempty_list_sorted_var_ = 
  | MenhirCell1_nonempty_list_sorted_var_ of 's * ('s, 'r) _menhir_state * (Smtlib_syntax.sorted_var list)

and ('s, 'r) _menhir_cell1_nonempty_list_symbol_ = 
  | MenhirCell1_nonempty_list_symbol_ of 's * ('s, 'r) _menhir_state * (Smtlib_syntax.symbol list)

and ('s, 'r) _menhir_cell1_nonempty_list_varbinding_ = 
  | MenhirCell1_nonempty_list_varbinding_ of 's * ('s, 'r) _menhir_state * (Smtlib_syntax.varbinding list)

and ('s, 'r) _menhir_cell1_pattern = 
  | MenhirCell1_pattern of 's * ('s, 'r) _menhir_state * (Smtlib_syntax.pattern_aux Smtlib_syntax.data)

and ('s, 'r) _menhir_cell1_prop_literal = 
  | MenhirCell1_prop_literal of 's * ('s, 'r) _menhir_state * (Smtlib_syntax.prop_literal_aux Smtlib_syntax.data)

and ('s, 'r) _menhir_cell1_qualidentifier = 
  | MenhirCell1_qualidentifier of 's * ('s, 'r) _menhir_state * (Smtlib_syntax.qualidentifier) * Lexing.position * Lexing.position

and ('s, 'r) _menhir_cell1_selector_dec = 
  | MenhirCell1_selector_dec of 's * ('s, 'r) _menhir_state * (Smtlib_syntax.selector_dec)

and ('s, 'r) _menhir_cell1_sexpr = 
  | MenhirCell1_sexpr of 's * ('s, 'r) _menhir_state * (Smtlib_syntax.sexpr)

and ('s, 'r) _menhir_cell1_sort = 
  | MenhirCell1_sort of 's * ('s, 'r) _menhir_state * (Smtlib_syntax.sort)

and ('s, 'r) _menhir_cell1_sort_dec = 
  | MenhirCell1_sort_dec of 's * ('s, 'r) _menhir_state * (Smtlib_syntax.sort_dec)

and ('s, 'r) _menhir_cell1_sorted_var = 
  | MenhirCell1_sorted_var of 's * ('s, 'r) _menhir_state * (Smtlib_syntax.sorted_var)

and ('s, 'r) _menhir_cell1_symbol = 
  | MenhirCell1_symbol of 's * ('s, 'r) _menhir_state * (Smtlib_syntax.symbol) * Lexing.position * Lexing.position

and ('s, 'r) _menhir_cell1_term = 
  | MenhirCell1_term of 's * ('s, 'r) _menhir_state * (Smtlib_syntax.term)

and ('s, 'r) _menhir_cell1_varbinding = 
  | MenhirCell1_varbinding of 's * ('s, 'r) _menhir_state * (Smtlib_syntax.varbinding)

and ('s, 'r) _menhir_cell1_AS = 
  | MenhirCell1_AS of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_ASSERT = 
  | MenhirCell1_ASSERT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_CHECKALLSAT = 
  | MenhirCell1_CHECKALLSAT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_CHECKENTAILMENT = 
  | MenhirCell1_CHECKENTAILMENT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_CHECKSATASSUMING = 
  | MenhirCell1_CHECKSATASSUMING of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_DECLARECONST = 
  | MenhirCell1_DECLARECONST of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_DECLAREDATATYPE = 
  | MenhirCell1_DECLAREDATATYPE of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_DECLAREDATATYPES = 
  | MenhirCell1_DECLAREDATATYPES of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_DECLAREFUN = 
  | MenhirCell1_DECLAREFUN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_DECLARESORT = 
  | MenhirCell1_DECLARESORT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_DEFINEFUN = 
  | MenhirCell1_DEFINEFUN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_DEFINEFUNREC = 
  | MenhirCell1_DEFINEFUNREC of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_DEFINEFUNSREC = 
  | MenhirCell1_DEFINEFUNSREC of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_DEFINESORT = 
  | MenhirCell1_DEFINESORT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_ECHO = 
  | MenhirCell1_ECHO of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_EXCLIMATIONPT = 
  | MenhirCell1_EXCLIMATIONPT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_EXISTS = 
  | MenhirCell1_EXISTS of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_FORALL = 
  | MenhirCell1_FORALL of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_GETINFO = 
  | MenhirCell1_GETINFO of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_GETOPTION = 
  | MenhirCell1_GETOPTION of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_GETVALUE = 
  | MenhirCell1_GETVALUE of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LET = 
  | MenhirCell1_LET of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LP = 
  | MenhirCell1_LP of 's * ('s, 'r) _menhir_state * Lexing.position

and 's _menhir_cell0_LP = 
  | MenhirCell0_LP of 's * Lexing.position

and ('s, 'r) _menhir_cell1_MATCH = 
  | MenhirCell1_MATCH of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_NAMED = 
  | MenhirCell1_NAMED of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_PAR = 
  | MenhirCell1_PAR of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PATTERN = 
  | MenhirCell1_PATTERN of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_RP = 
  | MenhirCell1_RP of 's * ('s, 'r) _menhir_state * Lexing.position

and 's _menhir_cell0_RP = 
  | MenhirCell0_RP of 's * Lexing.position

and ('s, 'r) _menhir_cell1_SETINFO = 
  | MenhirCell1_SETINFO of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_SETLOGIC = 
  | MenhirCell1_SETLOGIC of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_SETOPTION = 
  | MenhirCell1_SETOPTION of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_STATUTS = 
  | MenhirCell1_STATUTS of 's * ('s, 'r) _menhir_state * Lexing.position

and ('s, 'r) _menhir_cell1_UNDERSCORE = 
  | MenhirCell1_UNDERSCORE of 's * ('s, 'r) _menhir_state * Lexing.position * Lexing.position

and _menhir_box_term_list = 
  | MenhirBox_term_list of (Smtlib_syntax.term list * bool) [@@unboxed]

and _menhir_box_term = 
  | MenhirBox_term of (Smtlib_syntax.term) [@@unboxed]

and _menhir_box_commands = 
  | MenhirBox_commands of (Smtlib_syntax.commands) [@@unboxed]

let _menhir_action_003 =
  fun _1 ->
    (
# 257 "src/lib/smtlib_parser.mly"
        ( [],_1 )
# 947 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.symbol list * Smtlib_syntax.term))

let _menhir_action_004 =
  fun _4 _6 ->
    (
# 259 "src/lib/smtlib_parser.mly"
        ( _4,_6 )
# 955 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.symbol list * Smtlib_syntax.term))

let _menhir_action_005 =
  fun _1 _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 106 "src/lib/smtlib_parser.mly"
               ( mk_data (_startpos,_endpos) (AttributeKey _1) )
# 965 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.attribute))

let _menhir_action_006 =
  fun _1 _2 _endpos__2_ _startpos__1_ ->
    let _endpos = _endpos__2_ in
    let _startpos = _startpos__1_ in
    (
# 108 "src/lib/smtlib_parser.mly"
        ( mk_data (_startpos,_endpos) (AttributeKeyValue(_1,_2)) )
# 975 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.attribute))

let _menhir_action_007 =
  fun _1 _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 101 "src/lib/smtlib_parser.mly"
               ( mk_data (_startpos,_endpos) (AttributeValSpecConst _1) )
# 985 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.attribute_value_aux Smtlib_syntax.data))

let _menhir_action_008 =
  fun _1 _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 102 "src/lib/smtlib_parser.mly"
             ( mk_data (_startpos,_endpos) (AttributeValSymbol _1) )
# 995 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.attribute_value_aux Smtlib_syntax.data))

let _menhir_action_009 =
  fun _2 _endpos__3_ _startpos__1_ ->
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    (
# 103 "src/lib/smtlib_parser.mly"
                        ( mk_data (_startpos,_endpos) (AttributeValSexpr _2) )
# 1005 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.attribute_value_aux Smtlib_syntax.data))

let _menhir_action_010 =
  fun _3 _endpos__4_ _startpos__1_ ->
    let _endpos = _endpos__4_ in
    let _startpos = _startpos__1_ in
    (
# 264 "src/lib/smtlib_parser.mly"
        (mk_data (_startpos,_endpos) (Cmd_Assert (_3)) )
# 1015 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.command))

let _menhir_action_011 =
  fun _endpos__3_ _startpos__1_ ->
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    (
# 266 "src/lib/smtlib_parser.mly"
        (mk_data (_startpos,_endpos) (Cmd_CheckSat) )
# 1025 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.command))

let _menhir_action_012 =
  fun _4 _endpos__6_ _startpos__1_ ->
    let _endpos = _endpos__6_ in
    let _startpos = _startpos__1_ in
    (
# 268 "src/lib/smtlib_parser.mly"
        (mk_data (_startpos,_endpos) (Cmd_CheckSatAssum _4) )
# 1035 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.command))

let _menhir_action_013 =
  fun _3 _endpos__4_ _startpos__1_ ->
    let _endpos = _endpos__4_ in
    let _startpos = _startpos__1_ in
    (
# 270 "src/lib/smtlib_parser.mly"
        (mk_data (_startpos,_endpos) (Cmd_CheckEntailment _3) )
# 1045 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.command))

let _menhir_action_014 =
  fun _3 _endpos__4_ _startpos__1_ ->
    let _endpos = _endpos__4_ in
    let _startpos = _startpos__1_ in
    (
# 272 "src/lib/smtlib_parser.mly"
        (mk_data (_startpos,_endpos) (Cmd_CheckAllSat _3) )
# 1055 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.command))

let _menhir_action_015 =
  fun _3 _4 _endpos__5_ _startpos__1_ ->
    let _endpos = _endpos__5_ in
    let _startpos = _startpos__1_ in
    (
# 274 "src/lib/smtlib_parser.mly"
        (mk_data (_startpos,_endpos) (Cmd_DeclareConst (_3,_4)) )
# 1065 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.command))

let _menhir_action_016 =
  fun _3 _4 _endpos__5_ _startpos__1_ ->
    let _endpos = _endpos__5_ in
    let _startpos = _startpos__1_ in
    (
# 276 "src/lib/smtlib_parser.mly"
        ( mk_data (_startpos,_endpos) (Cmd_DeclareDataType (_3,_4)) )
# 1075 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.command))

let _menhir_action_017 =
  fun _4 _7 _endpos__9_ _startpos__1_ ->
    let _endpos = _endpos__9_ in
    let _startpos = _startpos__1_ in
    (
# 279 "src/lib/smtlib_parser.mly"
        ( mk_data (_startpos,_endpos) (Cmd_DeclareDataTypes (_4,_7)) )
# 1085 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.command))

let _menhir_action_018 =
  fun _3 _4 _endpos__5_ _startpos__1_ ->
    let _endpos = _endpos__5_ in
    let _startpos = _startpos__1_ in
    (
# 281 "src/lib/smtlib_parser.mly"
        (mk_data (_startpos,_endpos) (Cmd_DeclareFun(_3, _4)) )
# 1095 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.command))

let _menhir_action_019 =
  fun _3 _4 _endpos__5_ _startpos__1_ ->
    let _endpos = _endpos__5_ in
    let _startpos = _startpos__1_ in
    (
# 283 "src/lib/smtlib_parser.mly"
        (mk_data (_startpos,_endpos) (Cmd_DeclareSort (_3, _4)) )
# 1105 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.command))

let _menhir_action_020 =
  fun _3 _4 _endpos__5_ _startpos__1_ ->
    let _endpos = _endpos__5_ in
    let _startpos = _startpos__1_ in
    (
# 285 "src/lib/smtlib_parser.mly"
        (mk_data (_startpos,_endpos) (Cmd_DefineFun (_3,_4)) )
# 1115 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.command))

let _menhir_action_021 =
  fun _3 _4 _endpos__5_ _startpos__1_ ->
    let _endpos = _endpos__5_ in
    let _startpos = _startpos__1_ in
    (
# 287 "src/lib/smtlib_parser.mly"
        (mk_data (_startpos,_endpos) (Cmd_DefineFunRec (_3,_4)) )
# 1125 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.command))

let _menhir_action_022 =
  fun _4 _7 _endpos__9_ _startpos__1_ ->
    let _endpos = _endpos__9_ in
    let _startpos = _startpos__1_ in
    (
# 289 "src/lib/smtlib_parser.mly"
        (mk_data (_startpos,_endpos) (Cmd_DefineFunsRec (_4,_7)) )
# 1135 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.command))

let _menhir_action_023 =
  fun _3 _5 _7 _endpos__8_ _startpos__1_ ->
    let _endpos = _endpos__8_ in
    let _startpos = _startpos__1_ in
    (
# 291 "src/lib/smtlib_parser.mly"
        (mk_data (_startpos,_endpos) (Cmd_DefineSort(_3, _5, _7)) )
# 1145 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.command))

let _menhir_action_024 =
  fun _3 _endpos__4_ _startpos__1_ ->
    let _endpos = _endpos__4_ in
    let _startpos = _startpos__1_ in
    (
# 293 "src/lib/smtlib_parser.mly"
        (mk_data (_startpos,_endpos) (Cmd_Echo _3) )
# 1155 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.command))

let _menhir_action_025 =
  fun _endpos__3_ _startpos__1_ ->
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    (
# 295 "src/lib/smtlib_parser.mly"
        (mk_data (_startpos,_endpos) (Cmd_Exit) )
# 1165 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.command))

let _menhir_action_026 =
  fun _endpos__3_ _startpos__1_ ->
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    (
# 297 "src/lib/smtlib_parser.mly"
        (mk_data (_startpos,_endpos) (Cmd_GetAssert) )
# 1175 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.command))

let _menhir_action_027 =
  fun _endpos__3_ _startpos__1_ ->
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    (
# 299 "src/lib/smtlib_parser.mly"
        (mk_data (_startpos,_endpos) (Cmd_GetAssign) )
# 1185 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.command))

let _menhir_action_028 =
  fun _3 _endpos__4_ _startpos__1_ ->
    let _endpos = _endpos__4_ in
    let _startpos = _startpos__1_ in
    (
# 301 "src/lib/smtlib_parser.mly"
        (mk_data (_startpos,_endpos) (Cmd_GetInfo _3) )
# 1195 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.command))

let _menhir_action_029 =
  fun _endpos__3_ _startpos__1_ ->
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    (
# 303 "src/lib/smtlib_parser.mly"
        (mk_data (_startpos,_endpos) (Cmd_GetModel) )
# 1205 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.command))

let _menhir_action_030 =
  fun _3 _endpos__4_ _startpos__1_ ->
    let _endpos = _endpos__4_ in
    let _startpos = _startpos__1_ in
    (
# 305 "src/lib/smtlib_parser.mly"
        (mk_data (_startpos,_endpos) (Cmd_GetOption _3) )
# 1215 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.command))

let _menhir_action_031 =
  fun _endpos__3_ _startpos__1_ ->
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    (
# 307 "src/lib/smtlib_parser.mly"
        (mk_data (_startpos,_endpos) (Cmd_GetProof) )
# 1225 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.command))

let _menhir_action_032 =
  fun _endpos__3_ _startpos__1_ ->
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    (
# 309 "src/lib/smtlib_parser.mly"
        (mk_data (_startpos,_endpos) (Cmd_GetUnsatAssumptions) )
# 1235 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.command))

let _menhir_action_033 =
  fun _endpos__3_ _startpos__1_ ->
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    (
# 311 "src/lib/smtlib_parser.mly"
        (mk_data (_startpos,_endpos) (Cmd_GetUnsatCore) )
# 1245 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.command))

let _menhir_action_034 =
  fun _4 _endpos__6_ _startpos__1_ ->
    let _endpos = _endpos__6_ in
    let _startpos = _startpos__1_ in
    (
# 313 "src/lib/smtlib_parser.mly"
        (mk_data (_startpos,_endpos) (Cmd_GetValue _4) )
# 1255 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.command))

let _menhir_action_035 =
  fun _3 _endpos__4_ _startpos__1_ ->
    let _endpos = _endpos__4_ in
    let _startpos = _startpos__1_ in
    (
# 315 "src/lib/smtlib_parser.mly"
        (mk_data (_startpos,_endpos) (Cmd_Push _3) )
# 1265 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.command))

let _menhir_action_036 =
  fun _3 _endpos__4_ _startpos__1_ ->
    let _endpos = _endpos__4_ in
    let _startpos = _startpos__1_ in
    (
# 317 "src/lib/smtlib_parser.mly"
        (mk_data (_startpos,_endpos) (Cmd_Pop _3) )
# 1275 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.command))

let _menhir_action_037 =
  fun _endpos__3_ _startpos__1_ ->
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    (
# 319 "src/lib/smtlib_parser.mly"
        (mk_data (_startpos,_endpos) (Cmd_Reset) )
# 1285 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.command))

let _menhir_action_038 =
  fun _endpos__3_ _startpos__1_ ->
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    (
# 321 "src/lib/smtlib_parser.mly"
        (mk_data (_startpos,_endpos) (Cmd_ResetAssert) )
# 1295 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.command))

let _menhir_action_039 =
  fun _3 _endpos__4_ _startpos__1_ ->
    let _endpos = _endpos__4_ in
    let _startpos = _startpos__1_ in
    (
# 323 "src/lib/smtlib_parser.mly"
        (mk_data (_startpos,_endpos) (Cmd_SetInfo _3) )
# 1305 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.command))

let _menhir_action_040 =
  fun _3 _endpos__4_ _startpos__1_ ->
    let _endpos = _endpos__4_ in
    let _startpos = _startpos__1_ in
    (
# 325 "src/lib/smtlib_parser.mly"
        (Options.set_logic true;
         mk_data (_startpos,_endpos) (Cmd_SetLogic _3) )
# 1316 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.command))

let _menhir_action_041 =
  fun _3 _endpos__4_ _startpos__1_ ->
    let _endpos = _endpos__4_ in
    let _startpos = _startpos__1_ in
    (
# 328 "src/lib/smtlib_parser.mly"
        (mk_data (_startpos,_endpos) (Cmd_SetOption _3) )
# 1326 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.command))

let _menhir_action_042 =
  fun _2 _3 _endpos__4_ _startpos__1_ ->
    let _endpos = _endpos__4_ in
    let _startpos = _startpos__1_ in
    (
# 329 "src/lib/smtlib_parser.mly"
                      (
         let { c = cmd; p; _ } = _2 in
         let t = _3 in
         match cmd with
         | "minimize" -> mk_data (_startpos,_endpos) (Cmd_Minimize t)
         | "maximize" -> mk_data (_startpos,_endpos) (Cmd_Maximize t)
         | _ ->
            let err = Format.sprintf "Unexpected command %S" cmd in
            raise Smtlib_error.(Error (Syntax_error err, p))
       )
# 1345 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.command))

let _menhir_action_043 =
  fun () ->
    (
# 342 "src/lib/smtlib_parser.mly"
                       ( [] )
# 1353 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.commands))

let _menhir_action_044 =
  fun _1 _2 ->
    (
# 343 "src/lib/smtlib_parser.mly"
                       ( _1::_2 )
# 1361 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.commands))

let _menhir_action_045 =
  fun _1 ->
    (
# 235 "src/lib/smtlib_parser.mly"
        ( [],_1 )
# 1369 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.symbol list * Smtlib_syntax.sort))

let _menhir_action_046 =
  fun _4 _6 ->
    (
# 237 "src/lib/smtlib_parser.mly"
        ( _4,_6 )
# 1377 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.symbol list * Smtlib_syntax.sort))

let _menhir_action_047 =
  fun _1 ->
    (
# 67 "src/lib/smtlib_parser.mly"
                  ( Const_Dec _1 )
# 1385 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.constant))

let _menhir_action_048 =
  fun _1 ->
    (
# 68 "src/lib/smtlib_parser.mly"
                  ( Const_Num _1 )
# 1393 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.constant))

let _menhir_action_049 =
  fun _1 ->
    (
# 69 "src/lib/smtlib_parser.mly"
                  ( Const_Str _1 )
# 1401 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.constant))

let _menhir_action_050 =
  fun _1 ->
    (
# 70 "src/lib/smtlib_parser.mly"
                  ( Const_Hex _1 )
# 1409 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.constant))

let _menhir_action_051 =
  fun _1 ->
    (
# 71 "src/lib/smtlib_parser.mly"
                  ( Const_Bin _1 )
# 1417 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.constant))

let _menhir_action_052 =
  fun _2 _3 ->
    (
# 221 "src/lib/smtlib_parser.mly"
                                      ( _2,_3 )
# 1425 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.constructor_dec))

let _menhir_action_053 =
  fun _2 ->
    (
# 225 "src/lib/smtlib_parser.mly"
        ( [],_2 )
# 1433 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.symbol list * Smtlib_syntax.constructor_dec list))

let _menhir_action_054 =
  fun _4 _7 ->
    (
# 227 "src/lib/smtlib_parser.mly"
        ( _4,_7 )
# 1441 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.symbol list * Smtlib_syntax.constructor_dec list))

let _menhir_action_055 =
  fun _2 _4 ->
    (
# 241 "src/lib/smtlib_parser.mly"
        ( [],_2,_4 )
# 1449 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.symbol list * Smtlib_syntax.sort list * Smtlib_syntax.sort))

let _menhir_action_056 =
  fun _4 _7 _9 ->
    (
# 243 "src/lib/smtlib_parser.mly"
        ( (_4,_7,_9) )
# 1457 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.symbol list * Smtlib_syntax.sort list * Smtlib_syntax.sort))

let _menhir_action_057 =
  fun _1 _3 _5 ->
    (
# 247 "src/lib/smtlib_parser.mly"
        ( _1,[],_3,_5 )
# 1465 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.symbol * Smtlib_syntax.symbol list *
  Smtlib_syntax.sorted_var list * Smtlib_syntax.sort))

let _menhir_action_058 =
  fun _1 _10 _5 _8 ->
    (
# 249 "src/lib/smtlib_parser.mly"
        ( _1,_5,_8,_10 )
# 1474 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.symbol * Smtlib_syntax.symbol list *
  Smtlib_syntax.sorted_var list * Smtlib_syntax.sort))

let _menhir_action_059 =
  fun _2 ->
    (
# 252 "src/lib/smtlib_parser.mly"
                    ( _2 )
# 1483 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.symbol * Smtlib_syntax.symbol list *
  Smtlib_syntax.sorted_var list * Smtlib_syntax.sort))

let _menhir_action_060 =
  fun _1 _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 82 "src/lib/smtlib_parser.mly"
             ( mk_data (_startpos,_endpos) (IdSymbol _1) )
# 1494 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.identifier))

let _menhir_action_061 =
  fun _3 _4 _endpos__5_ _startpos__1_ ->
    let _endpos = _endpos__5_ in
    let _startpos = _startpos__1_ in
    (
# 84 "src/lib/smtlib_parser.mly"
      ( mk_data (_startpos,_endpos) (IdUnderscoreSymNum(_3, _4)) )
# 1504 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.identifier))

let _menhir_action_062 =
  fun _1 _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 78 "src/lib/smtlib_parser.mly"
               ( mk_data (_startpos,_endpos) (IndexSymbol _1) )
# 1514 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.index))

let _menhir_action_063 =
  fun _1 _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 79 "src/lib/smtlib_parser.mly"
               ( mk_data (_startpos,_endpos) (IndexNumeral _1) )
# 1524 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.index))

let _menhir_action_064 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 197 "src/lib/smtlib_parser.mly"
               (mk_data (_startpos,_endpos) Allstats )
# 1534 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.key_info_aux Smtlib_syntax.data))

let _menhir_action_065 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 198 "src/lib/smtlib_parser.mly"
                        (mk_data (_startpos,_endpos) Assertionstacklvl )
# 1544 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.key_info_aux Smtlib_syntax.data))

let _menhir_action_066 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 199 "src/lib/smtlib_parser.mly"
              (mk_data (_startpos,_endpos) Authors )
# 1554 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.key_info_aux Smtlib_syntax.data))

let _menhir_action_067 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 200 "src/lib/smtlib_parser.mly"
             (mk_data (_startpos,_endpos) Authors )
# 1564 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.key_info_aux Smtlib_syntax.data))

let _menhir_action_068 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 201 "src/lib/smtlib_parser.mly"
                 (mk_data (_startpos,_endpos) Difficulty )
# 1574 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.key_info_aux Smtlib_syntax.data))

let _menhir_action_069 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 202 "src/lib/smtlib_parser.mly"
                 (mk_data (_startpos,_endpos) Errorbehav )
# 1584 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.key_info_aux Smtlib_syntax.data))

let _menhir_action_070 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 203 "src/lib/smtlib_parser.mly"
                  (mk_data (_startpos,_endpos) Incremental )
# 1594 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.key_info_aux Smtlib_syntax.data))

let _menhir_action_071 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 204 "src/lib/smtlib_parser.mly"
               (mk_data (_startpos,_endpos) Instance )
# 1604 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.key_info_aux Smtlib_syntax.data))

let _menhir_action_072 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 205 "src/lib/smtlib_parser.mly"
           (mk_data (_startpos,_endpos) Name )
# 1614 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.key_info_aux Smtlib_syntax.data))

let _menhir_action_073 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 206 "src/lib/smtlib_parser.mly"
                    (mk_data (_startpos,_endpos) Reasonunknown )
# 1624 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.key_info_aux Smtlib_syntax.data))

let _menhir_action_074 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 207 "src/lib/smtlib_parser.mly"
             (mk_data (_startpos,_endpos) Series )
# 1634 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.key_info_aux Smtlib_syntax.data))

let _menhir_action_075 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 208 "src/lib/smtlib_parser.mly"
              (mk_data (_startpos,_endpos) Version )
# 1644 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.key_info_aux Smtlib_syntax.data))

let _menhir_action_076 =
  fun _1 _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 209 "src/lib/smtlib_parser.mly"
              (mk_data (_startpos,_endpos) (Key_info _1) )
# 1654 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.key_info_aux Smtlib_syntax.data))

let _menhir_action_077 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 176 "src/lib/smtlib_parser.mly"
                       (mk_data (_startpos,_endpos) Diagnooutputchan )
# 1664 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.key_option))

let _menhir_action_078 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 177 "src/lib/smtlib_parser.mly"
                         (mk_data (_startpos,_endpos) Globaldeclarations )
# 1674 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.key_option))

let _menhir_action_079 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 178 "src/lib/smtlib_parser.mly"
                  (mk_data (_startpos,_endpos) Interactive )
# 1684 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.key_option))

let _menhir_action_080 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 179 "src/lib/smtlib_parser.mly"
                   (mk_data (_startpos,_endpos) Printsucces )
# 1694 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.key_option))

let _menhir_action_081 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 180 "src/lib/smtlib_parser.mly"
                        (mk_data (_startpos,_endpos) Produceassertions )
# 1704 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.key_option))

let _menhir_action_082 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 181 "src/lib/smtlib_parser.mly"
                         (mk_data (_startpos,_endpos) Produceassignement )
# 1714 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.key_option))

let _menhir_action_083 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 182 "src/lib/smtlib_parser.mly"
                    (mk_data (_startpos,_endpos) Producemodels )
# 1724 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.key_option))

let _menhir_action_084 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 183 "src/lib/smtlib_parser.mly"
                    (mk_data (_startpos,_endpos) Produceproofs )
# 1734 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.key_option))

let _menhir_action_085 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 185 "src/lib/smtlib_parser.mly"
      (mk_data (_startpos,_endpos) Produceunsatassumptions )
# 1744 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.key_option))

let _menhir_action_086 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 186 "src/lib/smtlib_parser.mly"
                        (mk_data (_startpos,_endpos) Produceunsatcores )
# 1754 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.key_option))

let _menhir_action_087 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 187 "src/lib/smtlib_parser.mly"
                 (mk_data (_startpos,_endpos) Randomseed )
# 1764 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.key_option))

let _menhir_action_088 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 188 "src/lib/smtlib_parser.mly"
                        (mk_data (_startpos,_endpos) Regularoutputchan )
# 1774 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.key_option))

let _menhir_action_089 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 189 "src/lib/smtlib_parser.mly"
                (mk_data (_startpos,_endpos) Verbosity )
# 1784 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.key_option))

let _menhir_action_090 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 190 "src/lib/smtlib_parser.mly"
                     (mk_data (_startpos,_endpos) Ressourcelimit )
# 1794 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.key_option))

let _menhir_action_091 =
  fun _3 _endpos__4_ _startpos__1_ ->
    let _endpos = _endpos__4_ in
    let _startpos = _startpos__1_ in
    (
# 213 "src/lib/smtlib_parser.mly"
      ( mk_data (_startpos,_endpos) (Pattern _3) )
# 1804 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.key_term))

let _menhir_action_092 =
  fun _2 _endpos__2_ _startpos__1_ ->
    let _endpos = _endpos__2_ in
    let _startpos = _startpos__1_ in
    (
# 214 "src/lib/smtlib_parser.mly"
                   ( mk_data (_startpos,_endpos) (Named _2) )
# 1814 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.key_term))

let _menhir_action_093 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 157 "src/lib/smtlib_parser.mly"
               (mk_data (_startpos,_endpos) Category )
# 1824 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.keyword))

let _menhir_action_094 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 158 "src/lib/smtlib_parser.mly"
                    (mk_data (_startpos,_endpos) Smtlibversion )
# 1834 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.keyword))

let _menhir_action_095 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 159 "src/lib/smtlib_parser.mly"
             (mk_data (_startpos,_endpos) Source )
# 1844 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.keyword))

let _menhir_action_096 =
  fun _2 _endpos__2_ _startpos__1_ ->
    let _endpos = _endpos__2_ in
    let _startpos = _startpos__1_ in
    (
# 161 "src/lib/smtlib_parser.mly"
        (Options.set_status _2.c;mk_data (_startpos,_endpos) (Statuts _2) )
# 1854 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.keyword))

let _menhir_action_097 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 162 "src/lib/smtlib_parser.mly"
              (mk_data (_startpos,_endpos) License )
# 1864 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.keyword))

let _menhir_action_098 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 163 "src/lib/smtlib_parser.mly"
            (mk_data (_startpos,_endpos) Notes )
# 1874 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.keyword))

let _menhir_action_099 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 164 "src/lib/smtlib_parser.mly"
             (mk_data (_startpos,_endpos) Axioms )
# 1884 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.keyword))

let _menhir_action_100 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 165 "src/lib/smtlib_parser.mly"
                (mk_data (_startpos,_endpos) Definitio )
# 1894 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.keyword))

let _menhir_action_101 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 166 "src/lib/smtlib_parser.mly"
                 (mk_data (_startpos,_endpos) Extensions )
# 1904 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.keyword))

let _menhir_action_102 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 167 "src/lib/smtlib_parser.mly"
           (mk_data (_startpos,_endpos) Funs )
# 1914 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.keyword))

let _menhir_action_103 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 168 "src/lib/smtlib_parser.mly"
                   (mk_data (_startpos,_endpos) FunsDescript  )
# 1924 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.keyword))

let _menhir_action_104 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 169 "src/lib/smtlib_parser.mly"
               (mk_data (_startpos,_endpos) Language )
# 1934 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.keyword))

let _menhir_action_105 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 170 "src/lib/smtlib_parser.mly"
            (mk_data (_startpos,_endpos) Sorts )
# 1944 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.keyword))

let _menhir_action_106 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 171 "src/lib/smtlib_parser.mly"
                       (mk_data (_startpos,_endpos) SortsDescr )
# 1954 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.keyword))

let _menhir_action_107 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 172 "src/lib/smtlib_parser.mly"
               (mk_data (_startpos,_endpos) Theories )
# 1964 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.keyword))

let _menhir_action_108 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 173 "src/lib/smtlib_parser.mly"
             (mk_data (_startpos,_endpos) Values )
# 1974 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.keyword))

let _menhir_action_109 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 1982 "src/lib/smtlib_parser.ml"
     : ((Smtlib_syntax.symbol * Smtlib_syntax.symbol list *
   Smtlib_syntax.sorted_var list * Smtlib_syntax.sort)
  list))

let _menhir_action_110 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 1992 "src/lib/smtlib_parser.ml"
     : ((Smtlib_syntax.symbol * Smtlib_syntax.symbol list *
   Smtlib_syntax.sorted_var list * Smtlib_syntax.sort)
  list))

let _menhir_action_111 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 2002 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.key_term list))

let _menhir_action_112 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 2010 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.key_term list))

let _menhir_action_113 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 2018 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.prop_literal list))

let _menhir_action_114 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 2026 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.prop_literal list))

let _menhir_action_115 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 2034 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.selector_dec list))

let _menhir_action_116 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 2042 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.selector_dec list))

let _menhir_action_117 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 2050 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.sexpr list))

let _menhir_action_118 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 2058 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.sexpr list))

let _menhir_action_119 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 2066 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.sort list))

let _menhir_action_120 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 2074 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.sort list))

let _menhir_action_121 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 2082 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.sorted_var list))

let _menhir_action_122 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 2090 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.sorted_var list))

let _menhir_action_123 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 2098 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.symbol list))

let _menhir_action_124 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 2106 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.symbol list))

let _menhir_action_125 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 2114 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.term list))

let _menhir_action_126 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 2122 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.term list))

let _menhir_action_127 =
  fun _2 _3 ->
    (
# 135 "src/lib/smtlib_parser.mly"
                         ( (_2,_3) )
# 2130 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.pattern * Smtlib_syntax.term))

let _menhir_action_128 =
  fun x ->
    (
# 228 "<standard.mly>"
    ( [ x ] )
# 2138 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.constructor_dec list))

let _menhir_action_129 =
  fun x xs ->
    (
# 231 "<standard.mly>"
    ( x :: xs )
# 2146 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.constructor_dec list))

let _menhir_action_130 =
  fun x ->
    (
# 228 "<standard.mly>"
    ( [ x ] )
# 2154 "src/lib/smtlib_parser.ml"
     : ((Smtlib_syntax.symbol list * Smtlib_syntax.constructor_dec list) list))

let _menhir_action_131 =
  fun x xs ->
    (
# 231 "<standard.mly>"
    ( x :: xs )
# 2162 "src/lib/smtlib_parser.ml"
     : ((Smtlib_syntax.symbol list * Smtlib_syntax.constructor_dec list) list))

let _menhir_action_132 =
  fun x ->
    (
# 228 "<standard.mly>"
    ( [ x ] )
# 2170 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.index list))

let _menhir_action_133 =
  fun x xs ->
    (
# 231 "<standard.mly>"
    ( x :: xs )
# 2178 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.index list))

let _menhir_action_134 =
  fun x ->
    (
# 228 "<standard.mly>"
    ( [ x ] )
# 2186 "src/lib/smtlib_parser.ml"
     : ((Smtlib_syntax.pattern * Smtlib_syntax.term) list))

let _menhir_action_135 =
  fun x xs ->
    (
# 231 "<standard.mly>"
    ( x :: xs )
# 2194 "src/lib/smtlib_parser.ml"
     : ((Smtlib_syntax.pattern * Smtlib_syntax.term) list))

let _menhir_action_136 =
  fun x ->
    (
# 228 "<standard.mly>"
    ( [ x ] )
# 2202 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.sort list))

let _menhir_action_137 =
  fun x xs ->
    (
# 231 "<standard.mly>"
    ( x :: xs )
# 2210 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.sort list))

let _menhir_action_138 =
  fun x ->
    (
# 228 "<standard.mly>"
    ( [ x ] )
# 2218 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.sort_dec list))

let _menhir_action_139 =
  fun x xs ->
    (
# 231 "<standard.mly>"
    ( x :: xs )
# 2226 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.sort_dec list))

let _menhir_action_140 =
  fun x ->
    (
# 228 "<standard.mly>"
    ( [ x ] )
# 2234 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.sorted_var list))

let _menhir_action_141 =
  fun x xs ->
    (
# 231 "<standard.mly>"
    ( x :: xs )
# 2242 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.sorted_var list))

let _menhir_action_142 =
  fun x ->
    (
# 228 "<standard.mly>"
    ( [ x ] )
# 2250 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.symbol list))

let _menhir_action_143 =
  fun x xs ->
    (
# 231 "<standard.mly>"
    ( x :: xs )
# 2258 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.symbol list))

let _menhir_action_144 =
  fun x ->
    (
# 228 "<standard.mly>"
    ( [ x ] )
# 2266 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.term list))

let _menhir_action_145 =
  fun x xs ->
    (
# 231 "<standard.mly>"
    ( x :: xs )
# 2274 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.term list))

let _menhir_action_146 =
  fun x ->
    (
# 228 "<standard.mly>"
    ( [ x ] )
# 2282 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.varbinding list))

let _menhir_action_147 =
  fun x xs ->
    (
# 231 "<standard.mly>"
    ( x :: xs )
# 2290 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.varbinding list))

let _menhir_action_148 =
  fun _1 _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 129 "src/lib/smtlib_parser.mly"
             ( mk_data (_startpos,_endpos) (MatchPattern (_1, [])) )
# 2300 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.pattern_aux Smtlib_syntax.data))

let _menhir_action_149 =
  fun _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 130 "src/lib/smtlib_parser.mly"
                 ( mk_data (_startpos,_endpos) MatchUnderscore )
# 2310 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.pattern_aux Smtlib_syntax.data))

let _menhir_action_150 =
  fun _2 _3 _endpos__4_ _startpos__1_ ->
    let _endpos = _endpos__4_ in
    let _startpos = _startpos__1_ in
    (
# 132 "src/lib/smtlib_parser.mly"
       ( mk_data (_startpos,_endpos) (MatchPattern (_2, _3)) )
# 2320 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.pattern_aux Smtlib_syntax.data))

let _menhir_action_151 =
  fun _1 _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 88 "src/lib/smtlib_parser.mly"
      ( mk_data (_startpos,_endpos) (PropLit _1) )
# 2330 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.prop_literal_aux Smtlib_syntax.data))

let _menhir_action_152 =
  fun _2 _3 _endpos__4_ _startpos__1_ ->
    let _endpos = _endpos__4_ in
    let _startpos = _startpos__1_ in
    (
# 90 "src/lib/smtlib_parser.mly"
      ( mk_data (_startpos,_endpos)
        (if _2.c <> "not" then failwith "Prop literal can only be literal and negated literal"
            ; PropLitNot _3) )
# 2342 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.prop_literal_aux Smtlib_syntax.data))

let _menhir_action_153 =
  fun _1 _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 124 "src/lib/smtlib_parser.mly"
                 ( mk_data (_startpos,_endpos) (QualIdentifierId _1) )
# 2352 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.qualidentifier))

let _menhir_action_154 =
  fun _3 _4 _endpos__5_ _startpos__1_ ->
    let _endpos = _endpos__5_ in
    let _startpos = _startpos__1_ in
    (
# 126 "src/lib/smtlib_parser.mly"
      ( mk_data (_startpos,_endpos) (QualIdentifierAs(_3, _4)) )
# 2362 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.qualidentifier))

let _menhir_action_155 =
  fun _2 _3 ->
    (
# 218 "src/lib/smtlib_parser.mly"
                        ( (_2,_3) )
# 2370 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.selector_dec))

let _menhir_action_156 =
  fun _1 _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 111 "src/lib/smtlib_parser.mly"
               ( mk_data (_startpos,_endpos) (SexprSpecConst _1) )
# 2380 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.sexpr))

let _menhir_action_157 =
  fun _1 _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 112 "src/lib/smtlib_parser.mly"
             ( mk_data (_startpos,_endpos) (SexprSymbol _1) )
# 2390 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.sexpr))

let _menhir_action_158 =
  fun _1 _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 113 "src/lib/smtlib_parser.mly"
              ( mk_data (_startpos,_endpos) (SexprKeyword _1) )
# 2400 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.sexpr))

let _menhir_action_159 =
  fun _2 _endpos__3_ _startpos__1_ ->
    let _endpos = _endpos__3_ in
    let _startpos = _startpos__1_ in
    (
# 114 "src/lib/smtlib_parser.mly"
                        ( mk_data (_startpos,_endpos) (SexprInParen _2) )
# 2410 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.sexpr))

let _menhir_action_160 =
  fun _1 _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 95 "src/lib/smtlib_parser.mly"
                 ( mk_data (_startpos,_endpos) (SortIdentifier _1) )
# 2420 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.sort))

let _menhir_action_161 =
  fun _2 _3 _endpos__4_ _startpos__1_ ->
    let _endpos = _endpos__4_ in
    let _startpos = _startpos__1_ in
    (
# 97 "src/lib/smtlib_parser.mly"
      ( mk_data (_startpos,_endpos) (SortIdMulti(_2, _3)) )
# 2430 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.sort))

let _menhir_action_162 =
  fun _2 _3 ->
    (
# 230 "src/lib/smtlib_parser.mly"
                           ( (_2,_3) )
# 2438 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.sort_dec))

let _menhir_action_163 =
  fun _2 _3 ->
    (
# 121 "src/lib/smtlib_parser.mly"
                        ( _2,_3 )
# 2446 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.sorted_var))

let _menhir_action_164 =
  fun _1 _2 _endpos__2_ _startpos__1_ ->
    let _endpos = _endpos__2_ in
    let _startpos = _startpos__1_ in
    (
# 193 "src/lib/smtlib_parser.mly"
                       (mk_data (_startpos,_endpos) (Option_key (_1,_2)) )
# 2456 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.option_aux Smtlib_syntax.data))

let _menhir_action_165 =
  fun _1 _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 194 "src/lib/smtlib_parser.mly"
                (mk_data (_startpos,_endpos) (Option_attribute _1) )
# 2466 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.option_aux Smtlib_syntax.data))

let _menhir_action_166 =
  fun _1 _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 74 "src/lib/smtlib_parser.mly"
               ( mk_data (_startpos,_endpos) (_1) )
# 2476 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.symbol))

let _menhir_action_167 =
  fun _1 _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 75 "src/lib/smtlib_parser.mly"
               ( mk_data (_startpos,_endpos) (_1) )
# 2486 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.symbol))

let _menhir_action_168 =
  fun _1 _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 138 "src/lib/smtlib_parser.mly"
               ( mk_data (_startpos,_endpos) (TermSpecConst _1) )
# 2496 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.term))

let _menhir_action_169 =
  fun _1 _endpos__1_ _startpos__1_ ->
    let _endpos = _endpos__1_ in
    let _startpos = _startpos__1_ in
    (
# 139 "src/lib/smtlib_parser.mly"
                     ( mk_data (_startpos,_endpos) (TermQualIdentifier _1) )
# 2506 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.term))

let _menhir_action_170 =
  fun _2 _3 _endpos__4_ _startpos__1_ ->
    let _endpos = _endpos__4_ in
    let _startpos = _startpos__1_ in
    (
# 141 "src/lib/smtlib_parser.mly"
       ( mk_data (_startpos,_endpos) (TermQualIdTerm (_2, _3)) )
# 2516 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.term))

let _menhir_action_171 =
  fun _4 _6 _endpos__7_ _startpos__1_ ->
    let _endpos = _endpos__7_ in
    let _startpos = _startpos__1_ in
    (
# 143 "src/lib/smtlib_parser.mly"
       ( mk_data (_startpos,_endpos) (TermLetTerm (_4, _6)) )
# 2526 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.term))

let _menhir_action_172 =
  fun _5 ->
    (
# 145 "src/lib/smtlib_parser.mly"
       ( _5 )
# 2534 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.term))

let _menhir_action_173 =
  fun _4 _6 _endpos__7_ _startpos__1_ ->
    let _endpos = _endpos__7_ in
    let _startpos = _startpos__1_ in
    (
# 147 "src/lib/smtlib_parser.mly"
       ( mk_data (_startpos,_endpos) (TermForAllTerm (_4, _6)) )
# 2544 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.term))

let _menhir_action_174 =
  fun _4 _6 _endpos__7_ _startpos__1_ ->
    let _endpos = _endpos__7_ in
    let _startpos = _startpos__1_ in
    (
# 149 "src/lib/smtlib_parser.mly"
       ( mk_data (_startpos,_endpos) (TermExistsTerm (_4, _6)) )
# 2554 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.term))

let _menhir_action_175 =
  fun _3 _5 _endpos__7_ _startpos__1_ ->
    let _endpos = _endpos__7_ in
    let _startpos = _startpos__1_ in
    (
# 151 "src/lib/smtlib_parser.mly"
       ( mk_data (_startpos,_endpos) (TermMatch (_3, _5)) )
# 2564 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.term))

let _menhir_action_176 =
  fun _3 _4 _endpos__5_ _startpos__1_ ->
    let _endpos = _endpos__5_ in
    let _startpos = _startpos__1_ in
    (
# 153 "src/lib/smtlib_parser.mly"
       ( mk_data (_startpos,_endpos) (TermExclimationPt (_3, _4)) )
# 2574 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.term))

let _menhir_action_177 =
  fun _1 ->
    (
# 64 "src/lib/smtlib_parser.mly"
              ( _1,true)
# 2582 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.term list * bool))

let _menhir_action_178 =
  fun _2 _3 ->
    (
# 118 "src/lib/smtlib_parser.mly"
                        ( _2,_3 )
# 2590 "src/lib/smtlib_parser.ml"
     : (Smtlib_syntax.varbinding))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | ALLSTATS ->
        "ALLSTATS"
    | AS ->
        "AS"
    | ASCIIWOR _ ->
        "ASCIIWOR"
    | ASSERT ->
        "ASSERT"
    | ASSERTIONSTACKLVL ->
        "ASSERTIONSTACKLVL"
    | AUTHOR ->
        "AUTHOR"
    | AUTHORS ->
        "AUTHORS"
    | AXIOMS ->
        "AXIOMS"
    | BINARY _ ->
        "BINARY"
    | CATEGORY ->
        "CATEGORY"
    | CHECKALLSAT ->
        "CHECKALLSAT"
    | CHECKENTAILMENT ->
        "CHECKENTAILMENT"
    | CHECKSAT ->
        "CHECKSAT"
    | CHECKSATASSUMING ->
        "CHECKSATASSUMING"
    | DECIMAL _ ->
        "DECIMAL"
    | DECLARECONST ->
        "DECLARECONST"
    | DECLAREDATATYPE ->
        "DECLAREDATATYPE"
    | DECLAREDATATYPES ->
        "DECLAREDATATYPES"
    | DECLAREFUN ->
        "DECLAREFUN"
    | DECLARESORT ->
        "DECLARESORT"
    | DEFINEFUN ->
        "DEFINEFUN"
    | DEFINEFUNREC ->
        "DEFINEFUNREC"
    | DEFINEFUNSREC ->
        "DEFINEFUNSREC"
    | DEFINESORT ->
        "DEFINESORT"
    | DEFINITIO ->
        "DEFINITIO"
    | DIAGNOOUTPUTCHAN ->
        "DIAGNOOUTPUTCHAN"
    | DIFFICULTY ->
        "DIFFICULTY"
    | ECHO ->
        "ECHO"
    | EOF ->
        "EOF"
    | ERRORBEHAV ->
        "ERRORBEHAV"
    | EXCLIMATIONPT ->
        "EXCLIMATIONPT"
    | EXISTS ->
        "EXISTS"
    | EXIT ->
        "EXIT"
    | EXTENSIONS ->
        "EXTENSIONS"
    | FORALL ->
        "FORALL"
    | FUNS ->
        "FUNS"
    | FUNSDESCRIPT ->
        "FUNSDESCRIPT"
    | GETASSERT ->
        "GETASSERT"
    | GETASSIGN ->
        "GETASSIGN"
    | GETINFO ->
        "GETINFO"
    | GETMODEL ->
        "GETMODEL"
    | GETOPTION ->
        "GETOPTION"
    | GETPROOF ->
        "GETPROOF"
    | GETUNSATASSUMPTIONS ->
        "GETUNSATASSUMPTIONS"
    | GETUNSATCORE ->
        "GETUNSATCORE"
    | GETVALUE ->
        "GETVALUE"
    | GLOBALDECLARATIONS ->
        "GLOBALDECLARATIONS"
    | HEXADECIMAL _ ->
        "HEXADECIMAL"
    | INCREMENTAL ->
        "INCREMENTAL"
    | INSTANCE ->
        "INSTANCE"
    | INTERACTIVE ->
        "INTERACTIVE"
    | LANGUAGE ->
        "LANGUAGE"
    | LET ->
        "LET"
    | LICENSE ->
        "LICENSE"
    | LP ->
        "LP"
    | MATCH ->
        "MATCH"
    | NAME ->
        "NAME"
    | NAMED ->
        "NAMED"
    | NOTES ->
        "NOTES"
    | NUMERAL _ ->
        "NUMERAL"
    | PAR ->
        "PAR"
    | PATTERN ->
        "PATTERN"
    | POP ->
        "POP"
    | PRINTSUCCESS ->
        "PRINTSUCCESS"
    | PRODUCEASSERTIONS ->
        "PRODUCEASSERTIONS"
    | PRODUCEASSIGNEMENT ->
        "PRODUCEASSIGNEMENT"
    | PRODUCEMODELS ->
        "PRODUCEMODELS"
    | PRODUCEPROOFS ->
        "PRODUCEPROOFS"
    | PRODUCEUNSATASSUMPTIONS ->
        "PRODUCEUNSATASSUMPTIONS"
    | PRODUCEUNSATCORES ->
        "PRODUCEUNSATCORES"
    | PUSH ->
        "PUSH"
    | RANDOMSEED ->
        "RANDOMSEED"
    | REASONUNKNOWN ->
        "REASONUNKNOWN"
    | REGULAROUTPUTCHAN ->
        "REGULAROUTPUTCHAN"
    | RESET ->
        "RESET"
    | RESETASSERTIONS ->
        "RESETASSERTIONS"
    | RESSOURCELIMIT ->
        "RESSOURCELIMIT"
    | RP ->
        "RP"
    | SERIES ->
        "SERIES"
    | SETINFO ->
        "SETINFO"
    | SETLOGIC ->
        "SETLOGIC"
    | SETOPTION ->
        "SETOPTION"
    | SMTLIBVERSION ->
        "SMTLIBVERSION"
    | SORTS ->
        "SORTS"
    | SORTSDESCRIPTION ->
        "SORTSDESCRIPTION"
    | SOURCE ->
        "SOURCE"
    | STATUTS ->
        "STATUTS"
    | STRINGLIT _ ->
        "STRINGLIT"
    | SYMBOL _ ->
        "SYMBOL"
    | THEORIES ->
        "THEORIES"
    | UNDERSCORE ->
        "UNDERSCORE"
    | VALUES ->
        "VALUES"
    | VERBOSITY ->
        "VERBOSITY"
    | VERSION ->
        "VERSION"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_run_377 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_term =
    fun _menhir_stack _v ->
      MenhirBox_term _v
  
  let _menhir_run_373 : type  ttv_stack. ttv_stack -> _ -> _menhir_box_commands =
    fun _menhir_stack _v ->
      MenhirBox_commands _v
  
  let rec _menhir_goto_commands : type  ttv_stack. ttv_stack -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _v _menhir_s ->
      match _menhir_s with
      | MenhirState374 ->
          _menhir_run_375 _menhir_stack _v
      | MenhirState000 ->
          _menhir_run_373 _menhir_stack _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_375 : type  ttv_stack. (ttv_stack, _menhir_box_commands) _menhir_cell1_command -> _ -> _menhir_box_commands =
    fun _menhir_stack _v ->
      let MenhirCell1_command (_menhir_stack, _menhir_s, _1) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_044 _1 _2 in
      _menhir_goto_commands _menhir_stack _v _menhir_s
  
  let _menhir_run_372 : type  ttv_stack. ttv_stack -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_s ->
      let _v = _menhir_action_043 () in
      _menhir_goto_commands _menhir_stack _v _menhir_s
  
  let rec _menhir_run_001 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v ->
          let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState001
      | SETOPTION ->
          let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
          let _menhir_stack = MenhirCell1_SETOPTION (_menhir_stack, MenhirState001) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VERSION ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState003
          | VERBOSITY ->
              let _startpos_0 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_menhir_s, _endpos__1_, _startpos__1_) = (MenhirState003, _endpos, _startpos_0) in
              let _v = _menhir_action_089 _endpos__1_ _startpos__1_ in
              _menhir_goto_key_option _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
          | VALUES ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState003
          | THEORIES ->
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState003
          | STATUTS ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState003
          | SOURCE ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState003
          | SORTSDESCRIPTION ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState003
          | SORTS ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState003
          | SMTLIBVERSION ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState003
          | SERIES ->
              _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState003
          | RESSOURCELIMIT ->
              let _startpos_1 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_menhir_s, _endpos__1_, _startpos__1_) = (MenhirState003, _endpos, _startpos_1) in
              let _v = _menhir_action_090 _endpos__1_ _startpos__1_ in
              _menhir_goto_key_option _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
          | REGULAROUTPUTCHAN ->
              let _startpos_2 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_menhir_s, _endpos__1_, _startpos__1_) = (MenhirState003, _endpos, _startpos_2) in
              let _v = _menhir_action_088 _endpos__1_ _startpos__1_ in
              _menhir_goto_key_option _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
          | REASONUNKNOWN ->
              _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState003
          | RANDOMSEED ->
              let _startpos_3 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_menhir_s, _endpos__1_, _startpos__1_) = (MenhirState003, _endpos, _startpos_3) in
              let _v = _menhir_action_087 _endpos__1_ _startpos__1_ in
              _menhir_goto_key_option _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
          | PRODUCEUNSATCORES ->
              let _startpos_4 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_menhir_s, _endpos__1_, _startpos__1_) = (MenhirState003, _endpos, _startpos_4) in
              let _v = _menhir_action_086 _endpos__1_ _startpos__1_ in
              _menhir_goto_key_option _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
          | PRODUCEUNSATASSUMPTIONS ->
              let _startpos_5 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_menhir_s, _endpos__1_, _startpos__1_) = (MenhirState003, _endpos, _startpos_5) in
              let _v = _menhir_action_085 _endpos__1_ _startpos__1_ in
              _menhir_goto_key_option _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
          | PRODUCEPROOFS ->
              let _startpos_6 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_menhir_s, _endpos__1_, _startpos__1_) = (MenhirState003, _endpos, _startpos_6) in
              let _v = _menhir_action_084 _endpos__1_ _startpos__1_ in
              _menhir_goto_key_option _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
          | PRODUCEMODELS ->
              let _startpos_7 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_menhir_s, _endpos__1_, _startpos__1_) = (MenhirState003, _endpos, _startpos_7) in
              let _v = _menhir_action_083 _endpos__1_ _startpos__1_ in
              _menhir_goto_key_option _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
          | PRODUCEASSIGNEMENT ->
              let _startpos_8 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_menhir_s, _endpos__1_, _startpos__1_) = (MenhirState003, _endpos, _startpos_8) in
              let _v = _menhir_action_082 _endpos__1_ _startpos__1_ in
              _menhir_goto_key_option _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
          | PRODUCEASSERTIONS ->
              let _startpos_9 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_menhir_s, _endpos__1_, _startpos__1_) = (MenhirState003, _endpos, _startpos_9) in
              let _v = _menhir_action_081 _endpos__1_ _startpos__1_ in
              _menhir_goto_key_option _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
          | PRINTSUCCESS ->
              let _startpos_10 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_menhir_s, _endpos__1_, _startpos__1_) = (MenhirState003, _endpos, _startpos_10) in
              let _v = _menhir_action_080 _endpos__1_ _startpos__1_ in
              _menhir_goto_key_option _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
          | NOTES ->
              _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState003
          | NAME ->
              _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState003
          | LICENSE ->
              _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState003
          | LANGUAGE ->
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState003
          | INTERACTIVE ->
              let _startpos_11 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_menhir_s, _endpos__1_, _startpos__1_) = (MenhirState003, _endpos, _startpos_11) in
              let _v = _menhir_action_079 _endpos__1_ _startpos__1_ in
              _menhir_goto_key_option _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
          | INSTANCE ->
              _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState003
          | INCREMENTAL ->
              _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState003
          | GLOBALDECLARATIONS ->
              let _startpos_12 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_menhir_s, _endpos__1_, _startpos__1_) = (MenhirState003, _endpos, _startpos_12) in
              let _v = _menhir_action_078 _endpos__1_ _startpos__1_ in
              _menhir_goto_key_option _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
          | FUNSDESCRIPT ->
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState003
          | FUNS ->
              _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState003
          | EXTENSIONS ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState003
          | ERRORBEHAV ->
              _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState003
          | DIFFICULTY ->
              _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState003
          | DIAGNOOUTPUTCHAN ->
              let _startpos_13 = _menhir_lexbuf.Lexing.lex_start_p in
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_menhir_s, _endpos__1_, _startpos__1_) = (MenhirState003, _endpos, _startpos_13) in
              let _v = _menhir_action_077 _endpos__1_ _startpos__1_ in
              _menhir_goto_key_option _menhir_stack _menhir_lexbuf _menhir_lexer _startpos__1_ _v _menhir_s _tok
          | DEFINITIO ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState003
          | CATEGORY ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState003
          | AXIOMS ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState003
          | AUTHORS ->
              _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState003
          | AUTHOR ->
              _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState003
          | ASSERTIONSTACKLVL ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState003
          | ALLSTATS ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState003
          | _ ->
              _eRR ())
      | SETLOGIC ->
          let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
          let _menhir_stack = MenhirCell1_SETLOGIC (_menhir_stack, MenhirState001) in
          let _menhir_s = MenhirState076 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SYMBOL _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ASCIIWOR _v ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | SETINFO ->
          let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
          let _menhir_stack = MenhirCell1_SETINFO (_menhir_stack, MenhirState001) in
          let _menhir_s = MenhirState079 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VERSION ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | VALUES ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | THEORIES ->
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STATUTS ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SOURCE ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SORTSDESCRIPTION ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SORTS ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SMTLIBVERSION ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SERIES ->
              _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | REASONUNKNOWN ->
              _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NOTES ->
              _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NAME ->
              _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LICENSE ->
              _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LANGUAGE ->
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INSTANCE ->
              _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INCREMENTAL ->
              _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FUNSDESCRIPT ->
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FUNS ->
              _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXTENSIONS ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ERRORBEHAV ->
              _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DIFFICULTY ->
              _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DEFINITIO ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CATEGORY ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | AXIOMS ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | AUTHORS ->
              _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | AUTHOR ->
              _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ASSERTIONSTACKLVL ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ALLSTATS ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | RESETASSERTIONS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | RP ->
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_startpos__1_, _endpos__3_) = (_startpos, _endpos) in
              let _v = _menhir_action_038 _endpos__3_ _startpos__1_ in
              _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | RESET ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | RP ->
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_startpos__1_, _endpos__3_) = (_startpos, _endpos) in
              let _v = _menhir_action_037 _endpos__3_ _startpos__1_ in
              _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | PUSH ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | NUMERAL _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | RP ->
                  let _endpos_15 = _menhir_lexbuf.Lexing.lex_curr_p in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let (_startpos__1_, _3, _endpos__4_) = (_startpos, _v, _endpos_15) in
                  let _v = _menhir_action_035 _3 _endpos__4_ _startpos__1_ in
                  _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | POP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | NUMERAL _v ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | RP ->
                  let _endpos_17 = _menhir_lexbuf.Lexing.lex_curr_p in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  let (_startpos__1_, _3, _endpos__4_) = (_startpos, _v, _endpos_17) in
                  let _v = _menhir_action_036 _3 _endpos__4_ _startpos__1_ in
                  _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | GETVALUE ->
          let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
          let _menhir_stack = MenhirCell1_GETVALUE (_menhir_stack, MenhirState001) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LP ->
              let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
              let _menhir_stack = MenhirCell0_LP (_menhir_stack, _startpos) in
              let _menhir_s = MenhirState093 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | SYMBOL _v ->
                  _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | STRINGLIT _v ->
                  _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | NUMERAL _v ->
                  _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | LP ->
                  _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | HEXADECIMAL _v ->
                  _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | DECIMAL _v ->
                  _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | BINARY _v ->
                  _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | ASCIIWOR _v ->
                  _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | GETUNSATCORE ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | RP ->
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_startpos__1_, _endpos__3_) = (_startpos, _endpos) in
              let _v = _menhir_action_033 _endpos__3_ _startpos__1_ in
              _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | GETUNSATASSUMPTIONS ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | RP ->
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_startpos__1_, _endpos__3_) = (_startpos, _endpos) in
              let _v = _menhir_action_032 _endpos__3_ _startpos__1_ in
              _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | GETPROOF ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | RP ->
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_startpos__1_, _endpos__3_) = (_startpos, _endpos) in
              let _v = _menhir_action_031 _endpos__3_ _startpos__1_ in
              _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | GETOPTION ->
          let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
          let _menhir_stack = MenhirCell1_GETOPTION (_menhir_stack, MenhirState001) in
          let _menhir_s = MenhirState197 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VALUES ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | THEORIES ->
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STATUTS ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SOURCE ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SORTSDESCRIPTION ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SORTS ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SMTLIBVERSION ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NOTES ->
              _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LICENSE ->
              _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LANGUAGE ->
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FUNSDESCRIPT ->
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FUNS ->
              _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXTENSIONS ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DEFINITIO ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CATEGORY ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | AXIOMS ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | GETMODEL ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | RP ->
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_startpos__1_, _endpos__3_) = (_startpos, _endpos) in
              let _v = _menhir_action_029 _endpos__3_ _startpos__1_ in
              _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | GETINFO ->
          let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
          let _menhir_stack = MenhirCell1_GETINFO (_menhir_stack, MenhirState001) in
          let _menhir_s = MenhirState202 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VERSION ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | VALUES ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | THEORIES ->
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | STATUTS ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SOURCE ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SORTSDESCRIPTION ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SORTS ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SMTLIBVERSION ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SERIES ->
              _menhir_run_015 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | REASONUNKNOWN ->
              _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NOTES ->
              _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | NAME ->
              _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LICENSE ->
              _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LANGUAGE ->
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INSTANCE ->
              _menhir_run_032 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | INCREMENTAL ->
              _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FUNSDESCRIPT ->
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | FUNS ->
              _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | EXTENSIONS ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ERRORBEHAV ->
              _menhir_run_038 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DIFFICULTY ->
              _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | DEFINITIO ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | CATEGORY ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | AXIOMS ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | AUTHORS ->
              _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | AUTHOR ->
              _menhir_run_045 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ASSERTIONSTACKLVL ->
              _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ALLSTATS ->
              _menhir_run_047 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | GETASSIGN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | RP ->
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_startpos__1_, _endpos__3_) = (_startpos, _endpos) in
              let _v = _menhir_action_027 _endpos__3_ _startpos__1_ in
              _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | GETASSERT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | RP ->
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_startpos__1_, _endpos__3_) = (_startpos, _endpos) in
              let _v = _menhir_action_026 _endpos__3_ _startpos__1_ in
              _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | EXIT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | RP ->
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_startpos__1_, _endpos__3_) = (_startpos, _endpos) in
              let _v = _menhir_action_025 _endpos__3_ _startpos__1_ in
              _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | ECHO ->
          let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
          let _menhir_stack = MenhirCell1_ECHO (_menhir_stack, MenhirState001) in
          let _menhir_s = MenhirState211 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SYMBOL _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ASCIIWOR _v ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | DEFINESORT ->
          let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
          let _menhir_stack = MenhirCell1_DEFINESORT (_menhir_stack, MenhirState001) in
          let _menhir_s = MenhirState214 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SYMBOL _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ASCIIWOR _v ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | DEFINEFUNSREC ->
          let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
          let _menhir_stack = MenhirCell1_DEFINEFUNSREC (_menhir_stack, MenhirState001) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LP ->
              let _startpos_19 = _menhir_lexbuf.Lexing.lex_start_p in
              let _menhir_stack = MenhirCell0_LP (_menhir_stack, _startpos_19) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LP ->
                  _menhir_run_225 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState224
              | RP ->
                  let _v = _menhir_action_109 () in
                  _menhir_run_244 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState224
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | DEFINEFUNREC ->
          let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
          let _menhir_stack = MenhirCell1_DEFINEFUNREC (_menhir_stack, MenhirState001) in
          let _menhir_s = MenhirState252 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SYMBOL _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ASCIIWOR _v ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | DEFINEFUN ->
          let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
          let _menhir_stack = MenhirCell1_DEFINEFUN (_menhir_stack, MenhirState001) in
          let _menhir_s = MenhirState256 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SYMBOL _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ASCIIWOR _v ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | DECLARESORT ->
          let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
          let _menhir_stack = MenhirCell1_DECLARESORT (_menhir_stack, MenhirState001) in
          let _menhir_s = MenhirState260 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SYMBOL _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ASCIIWOR _v ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | DECLAREFUN ->
          let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
          let _menhir_stack = MenhirCell1_DECLAREFUN (_menhir_stack, MenhirState001) in
          let _menhir_s = MenhirState264 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SYMBOL _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ASCIIWOR _v ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | DECLAREDATATYPES ->
          let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
          let _menhir_stack = MenhirCell1_DECLAREDATATYPES (_menhir_stack, MenhirState001) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LP ->
              let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
              let _menhir_stack = MenhirCell0_LP (_menhir_stack, _startpos) in
              let _menhir_s = MenhirState284 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LP ->
                  _menhir_run_285 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | DECLAREDATATYPE ->
          let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
          let _menhir_stack = MenhirCell1_DECLAREDATATYPE (_menhir_stack, MenhirState001) in
          let _menhir_s = MenhirState322 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SYMBOL _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ASCIIWOR _v ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | DECLARECONST ->
          let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
          let _menhir_stack = MenhirCell1_DECLARECONST (_menhir_stack, MenhirState001) in
          let _menhir_s = MenhirState326 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SYMBOL _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ASCIIWOR _v ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | CHECKSATASSUMING ->
          let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
          let _menhir_stack = MenhirCell1_CHECKSATASSUMING (_menhir_stack, MenhirState001) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LP ->
              let _startpos_21 = _menhir_lexbuf.Lexing.lex_start_p in
              let _menhir_stack = MenhirCell0_LP (_menhir_stack, _startpos_21) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | SYMBOL _v ->
                  _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState339
              | LP ->
                  _menhir_run_340 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState339
              | ASCIIWOR _v ->
                  _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState339
              | RP ->
                  let _v = _menhir_action_113 () in
                  _menhir_run_347 _menhir_stack _menhir_lexbuf _menhir_lexer _v
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | CHECKSAT ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | RP ->
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let (_startpos__1_, _endpos__3_) = (_startpos, _endpos) in
              let _v = _menhir_action_011 _endpos__3_ _startpos__1_ in
              _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | CHECKENTAILMENT ->
          let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
          let _menhir_stack = MenhirCell1_CHECKENTAILMENT (_menhir_stack, MenhirState001) in
          let _menhir_s = MenhirState352 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SYMBOL _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | STRINGLIT _v ->
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUMERAL _v ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | LP ->
              _menhir_run_353 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | HEXADECIMAL _v ->
              _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DECIMAL _v ->
              _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BINARY _v ->
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ASCIIWOR _v ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | CHECKALLSAT ->
          let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
          let _menhir_stack = MenhirCell1_CHECKALLSAT (_menhir_stack, MenhirState001) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SYMBOL _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState363
          | ASCIIWOR _v ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState363
          | RP ->
              let _v = _menhir_action_123 () in
              _menhir_run_364 _menhir_stack _menhir_lexbuf _menhir_lexer _v
          | _ ->
              _eRR ())
      | ASSERT ->
          let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
          let _menhir_stack = MenhirCell1_ASSERT (_menhir_stack, MenhirState001) in
          let _menhir_s = MenhirState366 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SYMBOL _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | STRINGLIT _v ->
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUMERAL _v ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | LP ->
              _menhir_run_353 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | HEXADECIMAL _v ->
              _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DECIMAL _v ->
              _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BINARY _v ->
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ASCIIWOR _v ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | ASCIIWOR _v ->
          let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState001
      | _ ->
          _eRR ()
  
  and _menhir_run_002 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_166 _1 _endpos__1_ _startpos__1_ in
      _menhir_goto_symbol _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_goto_symbol : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState001 ->
          _menhir_run_369 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState345 ->
          _menhir_run_344 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState339 ->
          _menhir_run_344 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState341 ->
          _menhir_run_342 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState340 ->
          _menhir_run_341 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState326 ->
          _menhir_run_327 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState322 ->
          _menhir_run_323 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState302 ->
          _menhir_run_303 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState300 ->
          _menhir_run_301 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState285 ->
          _menhir_run_286 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState264 ->
          _menhir_run_265 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState260 ->
          _menhir_run_261 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState256 ->
          _menhir_run_226 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState252 ->
          _menhir_run_226 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState225 ->
          _menhir_run_226 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState363 ->
          _menhir_run_217 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState217 ->
          _menhir_run_217 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState216 ->
          _menhir_run_217 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState214 ->
          _menhir_run_215 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState211 ->
          _menhir_run_212 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState179 ->
          _menhir_run_180 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | MenhirState155 ->
          _menhir_run_156 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState143 ->
          _menhir_run_144 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState378 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState380 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState376 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState369 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState366 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState352 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState353 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState357 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState327 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState328 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState332 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState303 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState279 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState266 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState275 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState272 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState271 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState257 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState253 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState246 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState240 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState236 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState220 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState093 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState185 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState094 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState171 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState174 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState175 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState168 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState162 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState156 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState150 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState144 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState140 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState128 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState131 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState130 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState129 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState126 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState101 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState113 ->
          _menhir_run_116 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState104 ->
          _menhir_run_112 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState355 ->
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState330 ->
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState296 ->
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState268 ->
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState229 ->
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState108 ->
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState107 ->
          _menhir_run_108 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState106 ->
          _menhir_run_107 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState095 ->
          _menhir_run_096 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState076 ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState055 ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState058 ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState064 ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState059 ->
          _menhir_run_063 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState099 ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState096 ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState051 ->
          _menhir_run_053 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState008 ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_369 : type  ttv_stack. ((ttv_stack, _menhir_box_commands) _menhir_cell1_LP as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_commands) _menhir_state -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_symbol (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v_0 ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState369
      | STRINGLIT _v_1 ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState369
      | NUMERAL _v_2 ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState369
      | LP ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState369
      | HEXADECIMAL _v_3 ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState369
      | DECIMAL _v_4 ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState369
      | BINARY _v_5 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState369
      | ASCIIWOR _v_6 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_6 MenhirState369
      | _ ->
          _eRR ()
  
  and _menhir_run_056 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_049 _1 in
      _menhir_goto_constant _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_goto_constant : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState378 ->
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState380 ->
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState376 ->
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState369 ->
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState366 ->
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState352 ->
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState357 ->
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState257 ->
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState253 ->
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState246 ->
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState093 ->
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState185 ->
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState171 ->
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState174 ->
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState175 ->
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState168 ->
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState162 ->
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState150 ->
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState144 ->
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState140 ->
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState101 ->
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState113 ->
          _menhir_run_119 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState055 ->
          _menhir_run_073 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | MenhirState058 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState059 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState064 ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_119 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_168 _1 _endpos__1_ _startpos__1_ in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_term : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState380 ->
          _menhir_run_380 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState378 ->
          _menhir_run_380 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState376 ->
          _menhir_run_377 _menhir_stack _v
      | MenhirState369 ->
          _menhir_run_370 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState366 ->
          _menhir_run_360 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState352 ->
          _menhir_run_360 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState357 ->
          _menhir_run_358 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState257 ->
          _menhir_run_258 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState253 ->
          _menhir_run_254 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState246 ->
          _menhir_run_175 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState093 ->
          _menhir_run_175 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState185 ->
          _menhir_run_175 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState175 ->
          _menhir_run_175 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState174 ->
          _menhir_run_175 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState171 ->
          _menhir_run_172 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState168 ->
          _menhir_run_169 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState162 ->
          _menhir_run_163 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState150 ->
          _menhir_run_151 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState144 ->
          _menhir_run_145 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState140 ->
          _menhir_run_141 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState113 ->
          _menhir_run_114 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState101 ->
          _menhir_run_102 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_380 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_term_list) _menhir_state -> _ -> _menhir_box_term_list =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v_0 ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState380
      | STRINGLIT _v_1 ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState380
      | NUMERAL _v_2 ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState380
      | LP ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState380
      | HEXADECIMAL _v_3 ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState380
      | DECIMAL _v_4 ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState380
      | BINARY _v_5 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState380
      | ASCIIWOR _v_6 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_6 MenhirState380
      | _ ->
          _eRR ()
  
  and _menhir_run_057 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_048 _1 in
      _menhir_goto_constant _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_094 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState094 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UNDERSCORE ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SYMBOL _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MATCH ->
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LP ->
          _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FORALL ->
          _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_165 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLIMATIONPT ->
          _menhir_run_171 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ASCIIWOR _v ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | AS ->
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_095 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LP as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _menhir_stack = MenhirCell1_UNDERSCORE (_menhir_stack, _menhir_s, _startpos, _endpos) in
      let _menhir_s = MenhirState095 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ASCIIWOR _v ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_009 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_167 _1 _endpos__1_ _startpos__1_ in
      _menhir_goto_symbol _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_101 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LP as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_MATCH (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState101 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | STRINGLIT _v ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUMERAL _v ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LP ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | HEXADECIMAL _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DECIMAL _v ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BINARY _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ASCIIWOR _v ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_060 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_050 _1 in
      _menhir_goto_constant _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_061 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_047 _1 in
      _menhir_goto_constant _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_062 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_051 _1 in
      _menhir_goto_constant _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_125 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LP as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState125 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UNDERSCORE ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | AS ->
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_126 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LP as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_AS (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState126 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LP ->
          _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ASCIIWOR _v ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_127 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState127 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UNDERSCORE ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_138 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LP as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LET (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LP ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _menhir_stack = MenhirCell0_LP (_menhir_stack, _startpos) in
          let _menhir_s = MenhirState139 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | RP ->
              let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
              let _menhir_stack = MenhirCell1_RP (_menhir_stack, _menhir_s, _endpos) in
              let _menhir_s = MenhirState140 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | SYMBOL _v ->
                  _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | STRINGLIT _v ->
                  _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | NUMERAL _v ->
                  _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | LP ->
                  _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | HEXADECIMAL _v ->
                  _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | DECIMAL _v ->
                  _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | BINARY _v ->
                  _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | ASCIIWOR _v ->
                  _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | LP ->
              _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_143 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState143 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ASCIIWOR _v ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_153 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LP as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_FORALL (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LP ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _menhir_stack = MenhirCell0_LP (_menhir_stack, _startpos) in
          let _menhir_s = MenhirState154 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LP ->
              _menhir_run_155 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_155 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState155 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ASCIIWOR _v ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_165 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LP as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_EXISTS (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LP ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _menhir_stack = MenhirCell0_LP (_menhir_stack, _startpos) in
          let _menhir_s = MenhirState166 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LP ->
              _menhir_run_155 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_171 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LP as 'stack) -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_EXCLIMATIONPT (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState171 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | STRINGLIT _v ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUMERAL _v ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LP ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | HEXADECIMAL _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DECIMAL _v ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BINARY _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ASCIIWOR _v ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_370 : type  ttv_stack. ((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_symbol -> _ -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RP ->
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_symbol (_menhir_stack, _, _2, _, _) = _menhir_stack in
          let MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_3, _endpos__4_) = (_v, _endpos) in
          let _v = _menhir_action_042 _2 _3 _endpos__4_ _startpos__1_ in
          _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_command : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_command (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LP ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState374
      | EOF ->
          _menhir_run_372 _menhir_stack MenhirState374
      | _ ->
          _eRR ()
  
  and _menhir_run_360 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _1 = _v in
      let _v = _menhir_action_003 _1 in
      _menhir_goto_assert_dec _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_assert_dec : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState366 ->
          _menhir_run_367 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState352 ->
          _menhir_run_361 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_367 : type  ttv_stack. ((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_ASSERT -> _ -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RP ->
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_ASSERT (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_3, _endpos__4_) = (_v, _endpos) in
          let _v = _menhir_action_010 _3 _endpos__4_ _startpos__1_ in
          _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_361 : type  ttv_stack. ((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_CHECKENTAILMENT -> _ -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RP ->
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_CHECKENTAILMENT (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_3, _endpos__4_) = (_v, _endpos) in
          let _v = _menhir_action_013 _3 _endpos__4_ _startpos__1_ in
          _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_358 : type  ttv_stack. (((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_PAR _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_nonempty_list_symbol_ _menhir_cell0_RP -> _ -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_RP (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_nonempty_list_symbol_ (_menhir_stack, _, _4) = _menhir_stack in
          let MenhirCell0_LP (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_PAR (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LP (_menhir_stack, _menhir_s, _) = _menhir_stack in
          let _6 = _v in
          let _v = _menhir_action_004 _4 _6 in
          _menhir_goto_assert_dec _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_258 : type  ttv_stack. (((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DEFINEFUN, _menhir_box_commands) _menhir_cell1_fun_def -> _ -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RP ->
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_fun_def (_menhir_stack, _, _3) = _menhir_stack in
          let MenhirCell1_DEFINEFUN (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_4, _endpos__5_) = (_v, _endpos) in
          let _v = _menhir_action_020 _3 _4 _endpos__5_ _startpos__1_ in
          _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_254 : type  ttv_stack. (((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DEFINEFUNREC, _menhir_box_commands) _menhir_cell1_fun_def -> _ -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RP ->
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_fun_def (_menhir_stack, _, _3) = _menhir_stack in
          let MenhirCell1_DEFINEFUNREC (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_4, _endpos__5_) = (_v, _endpos) in
          let _v = _menhir_action_021 _3 _4 _endpos__5_ _startpos__1_ in
          _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_175 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v_0 ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState175
      | STRINGLIT _v_1 ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState175
      | NUMERAL _v_2 ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState175
      | LP ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState175
      | HEXADECIMAL _v_3 ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState175
      | DECIMAL _v_4 ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState175
      | BINARY _v_5 ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState175
      | ASCIIWOR _v_6 ->
          let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_6 MenhirState175
      | RP ->
          let x = _v in
          let _v = _menhir_action_144 x in
          _menhir_goto_nonempty_list_term_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_nonempty_list_term_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState246 ->
          _menhir_run_247 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState093 ->
          _menhir_run_188 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState185 ->
          _menhir_run_186 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState174 ->
          _menhir_run_177 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState175 ->
          _menhir_run_176 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_247 : type  ttv_stack. (((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DEFINEFUNSREC _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_list_fun_defs_ _menhir_cell0_RP _menhir_cell0_LP -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | RP ->
          let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_LP (_menhir_stack, _) = _menhir_stack in
          let MenhirCell0_RP (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_list_fun_defs_ (_menhir_stack, _, _4) = _menhir_stack in
          let MenhirCell0_LP (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_DEFINEFUNSREC (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_7, _endpos__9_) = (_v, _endpos_0) in
          let _v = _menhir_action_022 _4 _7 _endpos__9_ _startpos__1_ in
          _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_188 : type  ttv_stack. ((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_GETVALUE _menhir_cell0_LP -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | RP ->
          let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_LP (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_GETVALUE (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_4, _endpos__6_) = (_v, _endpos_0) in
          let _v = _menhir_action_034 _4 _endpos__6_ _startpos__1_ in
          _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_186 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LP, ttv_result) _menhir_cell1_qualidentifier -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_qualidentifier (_menhir_stack, _, _2, _, _) = _menhir_stack in
      let MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_3, _endpos__4_) = (_v, _endpos) in
      let _v = _menhir_action_170 _2 _3 _endpos__4_ _startpos__1_ in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_177 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_PATTERN _menhir_cell0_LP -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell0_LP (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_PATTERN (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_3, _endpos__4_) = (_v, _endpos) in
      let _v = _menhir_action_091 _3 _endpos__4_ _startpos__1_ in
      _menhir_goto_key_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_key_term : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_key_term (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | PATTERN ->
          _menhir_run_173 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState183
      | NAMED ->
          _menhir_run_179 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState183
      | RP ->
          let _v_0 = _menhir_action_111 () in
          _menhir_run_184 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | _ ->
          _eRR ()
  
  and _menhir_run_173 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_PATTERN (_menhir_stack, _menhir_s, _startpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LP ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _menhir_stack = MenhirCell0_LP (_menhir_stack, _startpos) in
          let _menhir_s = MenhirState174 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SYMBOL _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | STRINGLIT _v ->
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUMERAL _v ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | LP ->
              _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | HEXADECIMAL _v ->
              _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DECIMAL _v ->
              _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BINARY _v ->
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ASCIIWOR _v ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_179 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_NAMED (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState179 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ASCIIWOR _v ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_184 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_key_term -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_key_term (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_112 x xs in
      _menhir_goto_list_key_term_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list_key_term_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState183 ->
          _menhir_run_184 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState172 ->
          _menhir_run_181 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_181 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_LP, ttv_result) _menhir_cell1_EXCLIMATIONPT, ttv_result) _menhir_cell1_term -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_term (_menhir_stack, _, _3) = _menhir_stack in
      let MenhirCell1_EXCLIMATIONPT (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_4, _endpos__5_) = (_v, _endpos) in
      let _v = _menhir_action_176 _3 _4 _endpos__5_ _startpos__1_ in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_176 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_term -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_term (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_145 x xs in
      _menhir_goto_nonempty_list_term_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_172 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_LP, ttv_result) _menhir_cell1_EXCLIMATIONPT as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | PATTERN ->
          _menhir_run_173 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState172
      | NAMED ->
          _menhir_run_179 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState172
      | RP ->
          let _v_0 = _menhir_action_111 () in
          _menhir_run_181 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | _ ->
          _eRR ()
  
  and _menhir_run_169 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_LP, ttv_result) _menhir_cell1_EXISTS _menhir_cell0_LP, ttv_result) _menhir_cell1_nonempty_list_sorted_var_ _menhir_cell0_RP -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RP ->
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_RP (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_nonempty_list_sorted_var_ (_menhir_stack, _, _4) = _menhir_stack in
          let MenhirCell0_LP (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_EXISTS (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_6, _endpos__7_) = (_v, _endpos) in
          let _v = _menhir_action_174 _4 _6 _endpos__7_ _startpos__1_ in
          _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_163 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_LP, ttv_result) _menhir_cell1_FORALL _menhir_cell0_LP, ttv_result) _menhir_cell1_nonempty_list_sorted_var_ _menhir_cell0_RP -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RP ->
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_RP (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_nonempty_list_sorted_var_ (_menhir_stack, _, _4) = _menhir_stack in
          let MenhirCell0_LP (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_FORALL (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_6, _endpos__7_) = (_v, _endpos) in
          let _v = _menhir_action_173 _4 _6 _endpos__7_ _startpos__1_ in
          _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_151 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_LP, ttv_result) _menhir_cell1_LET _menhir_cell0_LP, ttv_result) _menhir_cell1_nonempty_list_varbinding_ _menhir_cell0_RP -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RP ->
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_RP (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_nonempty_list_varbinding_ (_menhir_stack, _, _4) = _menhir_stack in
          let MenhirCell0_LP (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LET (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_6, _endpos__7_) = (_v, _endpos) in
          let _v = _menhir_action_171 _4 _6 _endpos__7_ _startpos__1_ in
          _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_145 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LP, ttv_result) _menhir_cell1_symbol -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_symbol (_menhir_stack, _, _2, _, _) = _menhir_stack in
          let MenhirCell1_LP (_menhir_stack, _menhir_s, _) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_178 _2 _3 in
          (match (_tok : MenhirBasics.token) with
          | LP ->
              let _menhir_stack = MenhirCell1_varbinding (_menhir_stack, _menhir_s, _v) in
              _menhir_run_143 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState147
          | RP ->
              let x = _v in
              let _v = _menhir_action_146 x in
              _menhir_goto_nonempty_list_varbinding_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_goto_nonempty_list_varbinding_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState139 ->
          _menhir_run_149 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState147 ->
          _menhir_run_148 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_149 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_LP, ttv_result) _menhir_cell1_LET _menhir_cell0_LP as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_nonempty_list_varbinding_ (_menhir_stack, _menhir_s, _v) in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _menhir_stack = MenhirCell0_RP (_menhir_stack, _endpos) in
      let _menhir_s = MenhirState150 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | STRINGLIT _v ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUMERAL _v ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LP ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | HEXADECIMAL _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DECIMAL _v ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BINARY _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ASCIIWOR _v ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_148 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_varbinding -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_varbinding (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_147 x xs in
      _menhir_goto_nonempty_list_varbinding_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_141 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_LP, ttv_result) _menhir_cell1_LET _menhir_cell0_LP, ttv_result) _menhir_cell1_RP -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_RP (_menhir_stack, _, _) = _menhir_stack in
          let MenhirCell0_LP (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LET (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LP (_menhir_stack, _menhir_s, _) = _menhir_stack in
          let _5 = _v in
          let _v = _menhir_action_172 _5 in
          _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_114 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LP, ttv_result) _menhir_cell1_pattern -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_pattern (_menhir_stack, _, _2) = _menhir_stack in
          let MenhirCell1_LP (_menhir_stack, _menhir_s, _) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_127 _2 _3 in
          (match (_tok : MenhirBasics.token) with
          | LP ->
              let _menhir_stack = MenhirCell1_match_case (_menhir_stack, _menhir_s, _v) in
              _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState123
          | RP ->
              let x = _v in
              let _v = _menhir_action_134 x in
              _menhir_goto_nonempty_list_match_case_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_104 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UNDERSCORE ->
          let _startpos_0 = _menhir_lexbuf.Lexing.lex_start_p in
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let (_menhir_s, _endpos__1_, _startpos__1_) = (MenhirState104, _endpos, _startpos_0) in
          let _v = _menhir_action_149 _endpos__1_ _startpos__1_ in
          _menhir_goto_pattern _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | SYMBOL _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState104
      | LP ->
          let _menhir_s = MenhirState104 in
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
          let _menhir_s = MenhirState106 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SYMBOL _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ASCIIWOR _v ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | ASCIIWOR _v ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState104
      | _ ->
          _eRR ()
  
  and _menhir_goto_pattern : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LP as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_pattern (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v_0 ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState113
      | STRINGLIT _v_1 ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState113
      | NUMERAL _v_2 ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState113
      | LP ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState113
      | HEXADECIMAL _v_3 ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState113
      | DECIMAL _v_4 ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState113
      | BINARY _v_5 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState113
      | ASCIIWOR _v_6 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_6 MenhirState113
      | _ ->
          _eRR ()
  
  and _menhir_goto_nonempty_list_match_case_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState123 ->
          _menhir_run_124 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState103 ->
          _menhir_run_120 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_124 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_match_case -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_match_case (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_135 x xs in
      _menhir_goto_nonempty_list_match_case_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_120 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_LP, ttv_result) _menhir_cell1_MATCH, ttv_result) _menhir_cell1_term _menhir_cell0_LP -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | RP ->
          let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_LP (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_term (_menhir_stack, _, _3) = _menhir_stack in
          let MenhirCell1_MATCH (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_5, _endpos__7_) = (_v, _endpos_0) in
          let _v = _menhir_action_175 _3 _5 _endpos__7_ _startpos__1_ in
          _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_102 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_LP, ttv_result) _menhir_cell1_MATCH as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_term (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LP ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _menhir_stack = MenhirCell0_LP (_menhir_stack, _startpos) in
          let _menhir_s = MenhirState103 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LP ->
              _menhir_run_104 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_073 : type  ttv_stack. (ttv_stack, _menhir_box_commands) _menhir_cell1_key_info -> _ -> _ -> _ -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_007 _1 _endpos__1_ _startpos__1_ in
      _menhir_goto_attribute_value _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _v _tok
  
  and _menhir_goto_attribute_value : type  ttv_stack. (ttv_stack, _menhir_box_commands) _menhir_cell1_key_info -> _ -> _ -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_key_info (_menhir_stack, _menhir_s, _1, _startpos__1_, _) = _menhir_stack in
      let (_endpos__2_, _2) = (_endpos, _v) in
      let _v = _menhir_action_006 _1 _2 _endpos__2_ _startpos__1_ in
      _menhir_goto_attribute _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__2_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_goto_attribute : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState079 ->
          _menhir_run_080 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState003 ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_080 : type  ttv_stack. ((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_SETINFO -> _ -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RP ->
          let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_SETINFO (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_3, _endpos__4_) = (_v, _endpos_0) in
          let _v = _menhir_action_039 _3 _endpos__4_ _startpos__1_ in
          _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_075 : type  ttv_stack. ((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_SETOPTION -> _ -> _ -> _ -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_165 _1 _endpos__1_ _startpos__1_ in
      _menhir_goto_src_lib_smtlib_parser_option _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_goto_src_lib_smtlib_parser_option : type  ttv_stack. ((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_SETOPTION -> _ -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RP ->
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_SETOPTION (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_3, _endpos__4_) = (_v, _endpos) in
          let _v = _menhir_action_041 _3 _endpos__4_ _startpos__1_ in
          _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_067 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_156 _1 _endpos__1_ _startpos__1_ in
      _menhir_goto_sexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_sexpr : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_sexpr (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | VALUES ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
      | THEORIES ->
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
      | SYMBOL _v_0 ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState064
      | STRINGLIT _v_1 ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState064
      | STATUTS ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
      | SOURCE ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
      | SORTSDESCRIPTION ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
      | SORTS ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
      | SMTLIBVERSION ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
      | NUMERAL _v_2 ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState064
      | NOTES ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
      | LP ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
      | LICENSE ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
      | LANGUAGE ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
      | HEXADECIMAL _v_3 ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState064
      | FUNSDESCRIPT ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
      | FUNS ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
      | EXTENSIONS ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
      | DEFINITIO ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
      | DECIMAL _v_4 ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState064
      | CATEGORY ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
      | BINARY _v_5 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState064
      | AXIOMS ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState064
      | ASCIIWOR _v_6 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_6 MenhirState064
      | RP ->
          let _v_7 = _menhir_action_117 () in
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _v_7
      | _ ->
          _eRR ()
  
  and _menhir_run_006 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
      let _v = _menhir_action_108 _endpos__1_ _startpos__1_ in
      _menhir_goto_keyword _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_goto_keyword : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState197 ->
          _menhir_run_198 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState058 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState059 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState064 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState202 ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState079 ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState003 ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_198 : type  ttv_stack. ((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_GETOPTION -> _ -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RP ->
          let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_GETOPTION (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_3, _endpos__4_) = (_v, _endpos_0) in
          let _v = _menhir_action_030 _3 _endpos__4_ _startpos__1_ in
          _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_066 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_158 _1 _endpos__1_ _startpos__1_ in
      _menhir_goto_sexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_050 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_076 _1 _endpos__1_ _startpos__1_ in
      _menhir_goto_key_info _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_goto_key_info : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState202 ->
          _menhir_run_203 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState079 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState003 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_203 : type  ttv_stack. ((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_GETINFO -> _ -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RP ->
          let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_GETINFO (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_3, _endpos__4_) = (_v, _endpos_0) in
          let _v = _menhir_action_028 _3 _endpos__4_ _startpos__1_ in
          _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_055 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v_0 ->
          let _menhir_stack = MenhirCell1_key_info (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState055
      | STRINGLIT _v_1 ->
          let _menhir_stack = MenhirCell1_key_info (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState055
      | NUMERAL _v_2 ->
          let _menhir_stack = MenhirCell1_key_info (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState055
      | LP ->
          let _menhir_stack = MenhirCell1_key_info (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          let _startpos_3 = _menhir_lexbuf.Lexing.lex_start_p in
          let _menhir_stack = MenhirCell1_LP (_menhir_stack, MenhirState055, _startpos_3) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | VALUES ->
              _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
          | THEORIES ->
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
          | SYMBOL _v_4 ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState058
          | STRINGLIT _v_5 ->
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState058
          | STATUTS ->
              _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
          | SOURCE ->
              _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
          | SORTSDESCRIPTION ->
              _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
          | SORTS ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
          | SMTLIBVERSION ->
              _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
          | NUMERAL _v_6 ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v_6 MenhirState058
          | NOTES ->
              _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
          | LP ->
              _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
          | LICENSE ->
              _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
          | LANGUAGE ->
              _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
          | HEXADECIMAL _v_7 ->
              _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v_7 MenhirState058
          | FUNSDESCRIPT ->
              _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
          | FUNS ->
              _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
          | EXTENSIONS ->
              _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
          | DEFINITIO ->
              _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
          | DECIMAL _v_8 ->
              _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v_8 MenhirState058
          | CATEGORY ->
              _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
          | BINARY _v_9 ->
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v_9 MenhirState058
          | AXIOMS ->
              _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState058
          | ASCIIWOR _v_10 ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_10 MenhirState058
          | RP ->
              let _v_11 = _menhir_action_117 () in
              _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v_11
          | _ ->
              _eRR ())
      | HEXADECIMAL _v_12 ->
          let _menhir_stack = MenhirCell1_key_info (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v_12 MenhirState055
      | DECIMAL _v_13 ->
          let _menhir_stack = MenhirCell1_key_info (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v_13 MenhirState055
      | BINARY _v_14 ->
          let _menhir_stack = MenhirCell1_key_info (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v_14 MenhirState055
      | ASCIIWOR _v_15 ->
          let _menhir_stack = MenhirCell1_key_info (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_15 MenhirState055
      | RP ->
          let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
          let _v = _menhir_action_005 _1 _endpos__1_ _startpos__1_ in
          _menhir_goto_attribute _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_007 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
      let _v = _menhir_action_107 _endpos__1_ _startpos__1_ in
      _menhir_goto_keyword _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_008 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_STATUTS (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState008 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ASCIIWOR _v ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_011 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
      let _v = _menhir_action_095 _endpos__1_ _startpos__1_ in
      _menhir_goto_keyword _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_012 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
      let _v = _menhir_action_106 _endpos__1_ _startpos__1_ in
      _menhir_goto_keyword _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_013 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
      let _v = _menhir_action_105 _endpos__1_ _startpos__1_ in
      _menhir_goto_keyword _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_014 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
      let _v = _menhir_action_094 _endpos__1_ _startpos__1_ in
      _menhir_goto_keyword _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_027 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
      let _v = _menhir_action_098 _endpos__1_ _startpos__1_ in
      _menhir_goto_keyword _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_059 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | VALUES ->
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState059
      | THEORIES ->
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState059
      | SYMBOL _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState059
      | STRINGLIT _v ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState059
      | STATUTS ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState059
      | SOURCE ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState059
      | SORTSDESCRIPTION ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState059
      | SORTS ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState059
      | SMTLIBVERSION ->
          _menhir_run_014 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState059
      | NUMERAL _v ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState059
      | NOTES ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState059
      | LP ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState059
      | LICENSE ->
          _menhir_run_029 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState059
      | LANGUAGE ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState059
      | HEXADECIMAL _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState059
      | FUNSDESCRIPT ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState059
      | FUNS ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState059
      | EXTENSIONS ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState059
      | DEFINITIO ->
          _menhir_run_041 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState059
      | DECIMAL _v ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState059
      | CATEGORY ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState059
      | BINARY _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState059
      | AXIOMS ->
          _menhir_run_043 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState059
      | ASCIIWOR _v ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v MenhirState059
      | RP ->
          let _v = _menhir_action_117 () in
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _eRR ()
  
  and _menhir_run_029 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
      let _v = _menhir_action_097 _endpos__1_ _startpos__1_ in
      _menhir_goto_keyword _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_030 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
      let _v = _menhir_action_104 _endpos__1_ _startpos__1_ in
      _menhir_goto_keyword _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_035 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
      let _v = _menhir_action_103 _endpos__1_ _startpos__1_ in
      _menhir_goto_keyword _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_036 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
      let _v = _menhir_action_102 _endpos__1_ _startpos__1_ in
      _menhir_goto_keyword _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_037 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
      let _v = _menhir_action_101 _endpos__1_ _startpos__1_ in
      _menhir_goto_keyword _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_041 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
      let _v = _menhir_action_100 _endpos__1_ _startpos__1_ in
      _menhir_goto_keyword _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_042 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
      let _v = _menhir_action_093 _endpos__1_ _startpos__1_ in
      _menhir_goto_keyword _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_043 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
      let _v = _menhir_action_099 _endpos__1_ _startpos__1_ in
      _menhir_goto_keyword _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_068 : type  ttv_stack. (ttv_stack, _menhir_box_commands) _menhir_cell1_LP -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos__3_, _2) = (_endpos, _v) in
      let _v = _menhir_action_159 _2 _endpos__3_ _startpos__1_ in
      _menhir_goto_sexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_070 : type  ttv_stack. ((ttv_stack, _menhir_box_commands) _menhir_cell1_key_info, _menhir_box_commands) _menhir_cell1_LP -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_LP (_menhir_stack, _, _startpos__1_) = _menhir_stack in
      let (_endpos__3_, _2) = (_endpos, _v) in
      let _v = _menhir_action_009 _2 _endpos__3_ _startpos__1_ in
      _menhir_goto_attribute_value _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__3_ _v _tok
  
  and _menhir_run_065 : type  ttv_stack. (ttv_stack, _menhir_box_commands) _menhir_cell1_sexpr -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_sexpr (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_118 x xs in
      _menhir_goto_list_sexpr_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list_sexpr_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState058 ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState059 ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState064 ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_344 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_151 _1 _endpos__1_ _startpos__1_ in
      _menhir_goto_prop_literal _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_prop_literal : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_prop_literal (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v_0 ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState345
      | LP ->
          _menhir_run_340 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState345
      | ASCIIWOR _v_1 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState345
      | RP ->
          let _v_2 = _menhir_action_113 () in
          _menhir_run_346 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2
      | _ ->
          _eRR ()
  
  and _menhir_run_340 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState340 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ASCIIWOR _v ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_346 : type  ttv_stack. (ttv_stack, _menhir_box_commands) _menhir_cell1_prop_literal -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_prop_literal (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_114 x xs in
      _menhir_goto_list_prop_literal_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list_prop_literal_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState339 ->
          _menhir_run_347 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState345 ->
          _menhir_run_346 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_347 : type  ttv_stack. ((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_CHECKSATASSUMING _menhir_cell0_LP -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | RP ->
          let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_LP (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_CHECKSATASSUMING (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_4, _endpos__6_) = (_v, _endpos_0) in
          let _v = _menhir_action_012 _4 _endpos__6_ _startpos__1_ in
          _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_342 : type  ttv_stack. ((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_symbol -> _ -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RP ->
          let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_symbol (_menhir_stack, _, _2, _, _) = _menhir_stack in
          let MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_3, _endpos__4_) = (_v, _endpos_0) in
          let _v = _menhir_action_152 _2 _3 _endpos__4_ _startpos__1_ in
          _menhir_goto_prop_literal _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_341 : type  ttv_stack. ((ttv_stack, _menhir_box_commands) _menhir_cell1_LP as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_commands) _menhir_state -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_symbol (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v_0 ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState341
      | ASCIIWOR _v_1 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState341
      | _ ->
          _eRR ()
  
  and _menhir_run_327 : type  ttv_stack. (((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DECLARECONST as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_commands) _menhir_state -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_symbol (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v_0 ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState327
      | LP ->
          let _menhir_s = MenhirState327 in
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
          let _menhir_s = MenhirState328 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | UNDERSCORE ->
              _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | SYMBOL _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | PAR ->
              let _menhir_stack = MenhirCell1_PAR (_menhir_stack, _menhir_s) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LP ->
                  let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                  let _menhir_stack = MenhirCell0_LP (_menhir_stack, _startpos) in
                  let _menhir_s = MenhirState330 in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | SYMBOL _v ->
                      _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | ASCIIWOR _v ->
                      _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | LP ->
              _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ASCIIWOR _v ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | ASCIIWOR _v_7 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_7 MenhirState327
      | _ ->
          _eRR ()
  
  and _menhir_run_323 : type  ttv_stack. (((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DECLAREDATATYPE as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_commands) _menhir_state -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_symbol (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | LP ->
          _menhir_run_294 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState323
      | _ ->
          _eRR ()
  
  and _menhir_run_294 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState294 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | PAR ->
          let _menhir_stack = MenhirCell1_PAR (_menhir_stack, _menhir_s) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LP ->
              let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
              let _menhir_stack = MenhirCell0_LP (_menhir_stack, _startpos) in
              let _menhir_s = MenhirState296 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | SYMBOL _v ->
                  _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | ASCIIWOR _v ->
                  _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | LP ->
          _menhir_run_300 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_300 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState300 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ASCIIWOR _v ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_303 : type  ttv_stack. ((ttv_stack, _menhir_box_commands) _menhir_cell1_LP as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_commands) _menhir_state -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_symbol (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v_0 ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState303
      | LP ->
          _menhir_run_129 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState303
      | ASCIIWOR _v_1 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState303
      | _ ->
          _eRR ()
  
  and _menhir_run_129 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState129 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UNDERSCORE ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SYMBOL _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LP ->
          _menhir_run_127 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ASCIIWOR _v ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_301 : type  ttv_stack. ((ttv_stack, _menhir_box_commands) _menhir_cell1_LP as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_commands) _menhir_state -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_symbol (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | LP ->
          _menhir_run_302 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState301
      | RP ->
          let _v_0 = _menhir_action_115 () in
          _menhir_run_308 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | _ ->
          _eRR ()
  
  and _menhir_run_302 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState302 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ASCIIWOR _v ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_308 : type  ttv_stack. ((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_symbol -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_symbol (_menhir_stack, _, _2, _, _) = _menhir_stack in
      let MenhirCell1_LP (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _3 = _v in
      let _v = _menhir_action_052 _2 _3 in
      match (_tok : MenhirBasics.token) with
      | LP ->
          let _menhir_stack = MenhirCell1_constructor_dec (_menhir_stack, _menhir_s, _v) in
          _menhir_run_300 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState313
      | RP ->
          let x = _v in
          let _v = _menhir_action_128 x in
          _menhir_goto_nonempty_list_constructor_dec_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_nonempty_list_constructor_dec_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState294 ->
          _menhir_run_315 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState313 ->
          _menhir_run_314 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState299 ->
          _menhir_run_310 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_315 : type  ttv_stack. (ttv_stack, _menhir_box_commands) _menhir_cell1_LP -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_LP (_menhir_stack, _menhir_s, _) = _menhir_stack in
      let _2 = _v in
      let _v = _menhir_action_053 _2 in
      _menhir_goto_datatype_dec _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_datatype_dec : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState323 ->
          _menhir_run_324 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState320 ->
          _menhir_run_320 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState293 ->
          _menhir_run_320 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_324 : type  ttv_stack. (((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DECLAREDATATYPE, _menhir_box_commands) _menhir_cell1_symbol -> _ -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RP ->
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_symbol (_menhir_stack, _, _3, _, _) = _menhir_stack in
          let MenhirCell1_DECLAREDATATYPE (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_4, _endpos__5_) = (_v, _endpos) in
          let _v = _menhir_action_016 _3 _4 _endpos__5_ _startpos__1_ in
          _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_320 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | LP ->
          let _menhir_stack = MenhirCell1_datatype_dec (_menhir_stack, _menhir_s, _v) in
          _menhir_run_294 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState320
      | RP ->
          let x = _v in
          let _v = _menhir_action_130 x in
          _menhir_goto_nonempty_list_datatype_dec_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_nonempty_list_datatype_dec_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState320 ->
          _menhir_run_321 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState293 ->
          _menhir_run_317 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_321 : type  ttv_stack. (ttv_stack, _menhir_box_commands) _menhir_cell1_datatype_dec -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_datatype_dec (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_131 x xs in
      _menhir_goto_nonempty_list_datatype_dec_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_317 : type  ttv_stack. (((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DECLAREDATATYPES _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_nonempty_list_sort_dec_ _menhir_cell0_RP _menhir_cell0_LP -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | RP ->
          let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_LP (_menhir_stack, _) = _menhir_stack in
          let MenhirCell0_RP (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_nonempty_list_sort_dec_ (_menhir_stack, _, _4) = _menhir_stack in
          let MenhirCell0_LP (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_DECLAREDATATYPES (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_7, _endpos__9_) = (_v, _endpos_0) in
          let _v = _menhir_action_017 _4 _7 _endpos__9_ _startpos__1_ in
          _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_314 : type  ttv_stack. (ttv_stack, _menhir_box_commands) _menhir_cell1_constructor_dec -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_constructor_dec (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_129 x xs in
      _menhir_goto_nonempty_list_constructor_dec_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_310 : type  ttv_stack. (((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_PAR _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_nonempty_list_symbol_ _menhir_cell0_RP _menhir_cell0_LP -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | RP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_LP (_menhir_stack, _) = _menhir_stack in
          let MenhirCell0_RP (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_nonempty_list_symbol_ (_menhir_stack, _, _4) = _menhir_stack in
          let MenhirCell0_LP (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_PAR (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LP (_menhir_stack, _menhir_s, _) = _menhir_stack in
          let _7 = _v in
          let _v = _menhir_action_054 _4 _7 in
          _menhir_goto_datatype_dec _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_286 : type  ttv_stack. (ttv_stack, _menhir_box_commands) _menhir_cell1_LP -> _ -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | NUMERAL _v_0 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | RP ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let MenhirCell1_LP (_menhir_stack, _menhir_s, _) = _menhir_stack in
              let (_3, _2) = (_v_0, _v) in
              let _v = _menhir_action_162 _2 _3 in
              (match (_tok : MenhirBasics.token) with
              | LP ->
                  let _menhir_stack = MenhirCell1_sort_dec (_menhir_stack, _menhir_s, _v) in
                  _menhir_run_285 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState289
              | RP ->
                  let x = _v in
                  let _v = _menhir_action_138 x in
                  _menhir_goto_nonempty_list_sort_dec_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_285 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState285 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ASCIIWOR _v ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_nonempty_list_sort_dec_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState284 ->
          _menhir_run_291 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState289 ->
          _menhir_run_290 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_291 : type  ttv_stack. (((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DECLAREDATATYPES _menhir_cell0_LP as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_nonempty_list_sort_dec_ (_menhir_stack, _menhir_s, _v) in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _menhir_stack = MenhirCell0_RP (_menhir_stack, _endpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LP ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _menhir_stack = MenhirCell0_LP (_menhir_stack, _startpos) in
          let _menhir_s = MenhirState293 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LP ->
              _menhir_run_294 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_290 : type  ttv_stack. (ttv_stack, _menhir_box_commands) _menhir_cell1_sort_dec -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_sort_dec (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_139 x xs in
      _menhir_goto_nonempty_list_sort_dec_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_265 : type  ttv_stack. (((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DECLAREFUN as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_commands) _menhir_state -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_symbol (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | LP ->
          let _startpos_0 = _menhir_lexbuf.Lexing.lex_start_p in
          let _menhir_stack = MenhirCell0_LP (_menhir_stack, _startpos_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SYMBOL _v_1 ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState266
          | PAR ->
              let _menhir_stack = MenhirCell1_PAR (_menhir_stack, MenhirState266) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LP ->
                  let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                  let _menhir_stack = MenhirCell0_LP (_menhir_stack, _startpos) in
                  let _menhir_s = MenhirState268 in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | SYMBOL _v ->
                      _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | ASCIIWOR _v ->
                      _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | LP ->
              _menhir_run_129 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState266
          | ASCIIWOR _v_5 ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState266
          | RP ->
              let _v_6 = _menhir_action_119 () in
              _menhir_run_278 _menhir_stack _menhir_lexbuf _menhir_lexer _v_6 MenhirState266
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_278 : type  ttv_stack. ((((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DECLAREFUN, _menhir_box_commands) _menhir_cell1_symbol _menhir_cell0_LP as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_list_sort_ (_menhir_stack, _menhir_s, _v) in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _menhir_stack = MenhirCell0_RP (_menhir_stack, _endpos) in
      let _menhir_s = MenhirState279 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LP ->
          _menhir_run_129 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ASCIIWOR _v ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_261 : type  ttv_stack. ((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DECLARESORT -> _ -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | NUMERAL _v_0 ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | RP ->
              let _endpos_3 = _menhir_lexbuf.Lexing.lex_curr_p in
              let _tok = _menhir_lexer _menhir_lexbuf in
              let MenhirCell1_DECLARESORT (_menhir_stack, _) = _menhir_stack in
              let MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
              let (_3, _4, _endpos__5_) = (_v, _v_0, _endpos_3) in
              let _v = _menhir_action_019 _3 _4 _endpos__5_ _startpos__1_ in
              _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_226 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_symbol (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | LP ->
          let _startpos_0 = _menhir_lexbuf.Lexing.lex_start_p in
          let _menhir_stack = MenhirCell0_LP (_menhir_stack, _startpos_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | PAR ->
              let _menhir_stack = MenhirCell1_PAR (_menhir_stack, MenhirState227) in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | LP ->
                  let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
                  let _menhir_stack = MenhirCell0_LP (_menhir_stack, _startpos) in
                  let _menhir_s = MenhirState229 in
                  let _tok = _menhir_lexer _menhir_lexbuf in
                  (match (_tok : MenhirBasics.token) with
                  | SYMBOL _v ->
                      _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | ASCIIWOR _v ->
                      _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
                  | _ ->
                      _eRR ())
              | _ ->
                  _eRR ())
          | LP ->
              _menhir_run_155 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState227
          | RP ->
              let _v_4 = _menhir_action_121 () in
              _menhir_run_239 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState227
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_239 : type  ttv_stack. ((ttv_stack, _menhir_box_commands) _menhir_cell1_symbol _menhir_cell0_LP as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_list_sorted_var_ (_menhir_stack, _menhir_s, _v) in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _menhir_stack = MenhirCell0_RP (_menhir_stack, _endpos) in
      let _menhir_s = MenhirState240 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LP ->
          _menhir_run_129 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ASCIIWOR _v ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_217 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_symbol (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v_0 ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState217
      | ASCIIWOR _v_1 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState217
      | RP ->
          let _v_2 = _menhir_action_123 () in
          _menhir_run_218 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2
      | _ ->
          _eRR ()
  
  and _menhir_run_218 : type  ttv_stack. (ttv_stack, _menhir_box_commands) _menhir_cell1_symbol -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_symbol (_menhir_stack, _menhir_s, x, _, _) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_124 x xs in
      _menhir_goto_list_symbol_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list_symbol_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState363 ->
          _menhir_run_364 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState216 ->
          _menhir_run_219 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState217 ->
          _menhir_run_218 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_364 : type  ttv_stack. ((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_CHECKALLSAT -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_CHECKALLSAT (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_3, _endpos__4_) = (_v, _endpos) in
      let _v = _menhir_action_014 _3 _endpos__4_ _startpos__1_ in
      _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_219 : type  ttv_stack. ((((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DEFINESORT, _menhir_box_commands) _menhir_cell1_symbol _menhir_cell0_LP as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_list_symbol_ (_menhir_stack, _menhir_s, _v) in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _menhir_stack = MenhirCell0_RP (_menhir_stack, _endpos) in
      let _menhir_s = MenhirState220 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LP ->
          _menhir_run_129 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ASCIIWOR _v ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_215 : type  ttv_stack. (((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DEFINESORT as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_commands) _menhir_state -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_symbol (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | LP ->
          let _startpos_0 = _menhir_lexbuf.Lexing.lex_start_p in
          let _menhir_stack = MenhirCell0_LP (_menhir_stack, _startpos_0) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SYMBOL _v_1 ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState216
          | ASCIIWOR _v_2 ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState216
          | RP ->
              let _v_3 = _menhir_action_123 () in
              _menhir_run_219 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState216
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_212 : type  ttv_stack. ((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_ECHO -> _ -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RP ->
          let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_ECHO (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_3, _endpos__4_) = (_v, _endpos_0) in
          let _v = _menhir_action_024 _3 _endpos__4_ _startpos__1_ in
          _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_180 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_NAMED -> _ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_NAMED (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos__2_, _2) = (_endpos, _v) in
      let _v = _menhir_action_092 _2 _endpos__2_ _startpos__1_ in
      _menhir_goto_key_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_156 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LP as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_symbol (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v_0 ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState156
      | LP ->
          _menhir_run_129 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState156
      | ASCIIWOR _v_1 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState156
      | _ ->
          _eRR ()
  
  and _menhir_run_144 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LP as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_symbol (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v_0 ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState144
      | STRINGLIT _v_1 ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState144
      | NUMERAL _v_2 ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState144
      | LP ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState144
      | HEXADECIMAL _v_3 ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState144
      | DECIMAL _v_4 ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState144
      | BINARY _v_5 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState144
      | ASCIIWOR _v_6 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_6 MenhirState144
      | _ ->
          _eRR ()
  
  and _menhir_run_116 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_060 _1 _endpos__1_ _startpos__1_ in
      _menhir_goto_identifier _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_goto_identifier : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState327 ->
          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState332 ->
          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState303 ->
          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState266 ->
          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState279 ->
          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState271 ->
          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState275 ->
          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState272 ->
          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState240 ->
          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState236 ->
          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState220 ->
          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState156 ->
          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState128 ->
          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState130 ->
          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState131 ->
          _menhir_run_133 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState328 ->
          _menhir_run_130 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState129 ->
          _menhir_run_130 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState126 ->
          _menhir_run_128 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState378 ->
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState380 ->
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState376 ->
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState369 ->
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState366 ->
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState352 ->
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState353 ->
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState357 ->
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState257 ->
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState253 ->
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState246 ->
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState093 ->
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState094 ->
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState185 ->
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState171 ->
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState174 ->
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState175 ->
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState168 ->
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState162 ->
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState150 ->
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState144 ->
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState140 ->
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState101 ->
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState113 ->
          _menhir_run_118 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_133 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_160 _1 _endpos__1_ _startpos__1_ in
      _menhir_goto_sort _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_sort : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState327 ->
          _menhir_run_335 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState332 ->
          _menhir_run_333 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState303 ->
          _menhir_run_304 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState279 ->
          _menhir_run_280 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState275 ->
          _menhir_run_276 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState266 ->
          _menhir_run_272 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState272 ->
          _menhir_run_272 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState271 ->
          _menhir_run_272 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState240 ->
          _menhir_run_241 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState236 ->
          _menhir_run_237 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState220 ->
          _menhir_run_221 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState156 ->
          _menhir_run_157 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState128 ->
          _menhir_run_136 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState131 ->
          _menhir_run_131 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState130 ->
          _menhir_run_131 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_335 : type  ttv_stack. (((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DECLARECONST, _menhir_box_commands) _menhir_cell1_symbol -> _ -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _1 = _v in
      let _v = _menhir_action_045 _1 in
      _menhir_goto_const_dec _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_goto_const_dec : type  ttv_stack. (((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DECLARECONST, _menhir_box_commands) _menhir_cell1_symbol -> _ -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RP ->
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_symbol (_menhir_stack, _, _3, _, _) = _menhir_stack in
          let MenhirCell1_DECLARECONST (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_4, _endpos__5_) = (_v, _endpos) in
          let _v = _menhir_action_015 _3 _4 _endpos__5_ _startpos__1_ in
          _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_333 : type  ttv_stack. ((((((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DECLARECONST, _menhir_box_commands) _menhir_cell1_symbol, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_PAR _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_nonempty_list_symbol_ _menhir_cell0_RP -> _ -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_RP (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_nonempty_list_symbol_ (_menhir_stack, _, _4) = _menhir_stack in
          let MenhirCell0_LP (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_PAR (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LP (_menhir_stack, _, _) = _menhir_stack in
          let _6 = _v in
          let _v = _menhir_action_046 _4 _6 in
          _menhir_goto_const_dec _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_304 : type  ttv_stack. ((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_symbol -> _ -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_symbol (_menhir_stack, _, _2, _, _) = _menhir_stack in
          let MenhirCell1_LP (_menhir_stack, _menhir_s, _) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_155 _2 _3 in
          let _menhir_stack = MenhirCell1_selector_dec (_menhir_stack, _menhir_s, _v) in
          (match (_tok : MenhirBasics.token) with
          | LP ->
              _menhir_run_302 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState306
          | RP ->
              let _v_0 = _menhir_action_115 () in
              _menhir_run_307 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_307 : type  ttv_stack. (ttv_stack, _menhir_box_commands) _menhir_cell1_selector_dec -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_selector_dec (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_116 x xs in
      _menhir_goto_list_selector_dec_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list_selector_dec_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState301 ->
          _menhir_run_308 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState306 ->
          _menhir_run_307 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_280 : type  ttv_stack. ((((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DECLAREFUN, _menhir_box_commands) _menhir_cell1_symbol _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_list_sort_ _menhir_cell0_RP -> _ -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_RP (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_list_sort_ (_menhir_stack, _, _2) = _menhir_stack in
      let MenhirCell0_LP (_menhir_stack, _) = _menhir_stack in
      let _4 = _v in
      let _v = _menhir_action_055 _2 _4 in
      _menhir_goto_fun_dec _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_goto_fun_dec : type  ttv_stack. (((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DECLAREFUN, _menhir_box_commands) _menhir_cell1_symbol -> _ -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RP ->
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_symbol (_menhir_stack, _, _3, _, _) = _menhir_stack in
          let MenhirCell1_DECLAREFUN (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_4, _endpos__5_) = (_v, _endpos) in
          let _v = _menhir_action_018 _3 _4 _endpos__5_ _startpos__1_ in
          _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_276 : type  ttv_stack. ((((((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DECLAREFUN, _menhir_box_commands) _menhir_cell1_symbol _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_PAR _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_nonempty_list_symbol_ _menhir_cell0_RP _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_list_sort_ _menhir_cell0_RP -> _ -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_RP (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_list_sort_ (_menhir_stack, _, _7) = _menhir_stack in
          let MenhirCell0_LP (_menhir_stack, _) = _menhir_stack in
          let MenhirCell0_RP (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_nonempty_list_symbol_ (_menhir_stack, _, _4) = _menhir_stack in
          let MenhirCell0_LP (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_PAR (_menhir_stack, _) = _menhir_stack in
          let MenhirCell0_LP (_menhir_stack, _) = _menhir_stack in
          let _9 = _v in
          let _v = _menhir_action_056 _4 _7 _9 in
          _menhir_goto_fun_dec _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_272 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_sort (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v_0 ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState272
      | LP ->
          _menhir_run_129 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState272
      | ASCIIWOR _v_1 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState272
      | RP ->
          let _v_2 = _menhir_action_119 () in
          _menhir_run_273 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2
      | _ ->
          _eRR ()
  
  and _menhir_run_273 : type  ttv_stack. (ttv_stack, _menhir_box_commands) _menhir_cell1_sort -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_sort (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_120 x xs in
      _menhir_goto_list_sort_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list_sort_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState266 ->
          _menhir_run_278 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState271 ->
          _menhir_run_274 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState272 ->
          _menhir_run_273 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_274 : type  ttv_stack. ((((((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DECLAREFUN, _menhir_box_commands) _menhir_cell1_symbol _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_PAR _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_nonempty_list_symbol_ _menhir_cell0_RP _menhir_cell0_LP as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_list_sort_ (_menhir_stack, _menhir_s, _v) in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _menhir_stack = MenhirCell0_RP (_menhir_stack, _endpos) in
      let _menhir_s = MenhirState275 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LP ->
          _menhir_run_129 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ASCIIWOR _v ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_241 : type  ttv_stack. ((ttv_stack, _menhir_box_commands) _menhir_cell1_symbol _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_list_sorted_var_ _menhir_cell0_RP -> _ -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell0_RP (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_list_sorted_var_ (_menhir_stack, _, _3) = _menhir_stack in
      let MenhirCell0_LP (_menhir_stack, _) = _menhir_stack in
      let MenhirCell1_symbol (_menhir_stack, _menhir_s, _1, _, _) = _menhir_stack in
      let _5 = _v in
      let _v = _menhir_action_057 _1 _3 _5 in
      _menhir_goto_fun_def _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_fun_def : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState256 ->
          _menhir_run_257 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState252 ->
          _menhir_run_253 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState225 ->
          _menhir_run_242 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_257 : type  ttv_stack. (((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DEFINEFUN as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_commands) _menhir_state -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_fun_def (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v_0 ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState257
      | STRINGLIT _v_1 ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState257
      | NUMERAL _v_2 ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState257
      | LP ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState257
      | HEXADECIMAL _v_3 ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState257
      | DECIMAL _v_4 ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState257
      | BINARY _v_5 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState257
      | ASCIIWOR _v_6 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_6 MenhirState257
      | _ ->
          _eRR ()
  
  and _menhir_run_253 : type  ttv_stack. (((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DEFINEFUNREC as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_commands) _menhir_state -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_fun_def (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v_0 ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState253
      | STRINGLIT _v_1 ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState253
      | NUMERAL _v_2 ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState253
      | LP ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState253
      | HEXADECIMAL _v_3 ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState253
      | DECIMAL _v_4 ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState253
      | BINARY _v_5 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState253
      | ASCIIWOR _v_6 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_6 MenhirState253
      | _ ->
          _eRR ()
  
  and _menhir_run_242 : type  ttv_stack. (ttv_stack, _menhir_box_commands) _menhir_cell1_LP -> _ -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LP (_menhir_stack, _menhir_s, _) = _menhir_stack in
          let _2 = _v in
          let _v = _menhir_action_059 _2 in
          let _menhir_stack = MenhirCell1_fun_defs (_menhir_stack, _menhir_s, _v) in
          (match (_tok : MenhirBasics.token) with
          | LP ->
              _menhir_run_225 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState250
          | RP ->
              let _v_0 = _menhir_action_109 () in
              _menhir_run_251 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_225 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState225 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ASCIIWOR _v ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_251 : type  ttv_stack. (ttv_stack, _menhir_box_commands) _menhir_cell1_fun_defs -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_fun_defs (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_110 x xs in
      _menhir_goto_list_fun_defs_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list_fun_defs_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState250 ->
          _menhir_run_251 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState224 ->
          _menhir_run_244 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_244 : type  ttv_stack. (((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DEFINEFUNSREC _menhir_cell0_LP as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_list_fun_defs_ (_menhir_stack, _menhir_s, _v) in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _menhir_stack = MenhirCell0_RP (_menhir_stack, _endpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LP ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _menhir_stack = MenhirCell0_LP (_menhir_stack, _startpos) in
          let _menhir_s = MenhirState246 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SYMBOL _v ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | STRINGLIT _v ->
              _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NUMERAL _v ->
              _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | LP ->
              _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | HEXADECIMAL _v ->
              _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | DECIMAL _v ->
              _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BINARY _v ->
              _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | ASCIIWOR _v ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_237 : type  ttv_stack. ((((ttv_stack, _menhir_box_commands) _menhir_cell1_symbol _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_PAR _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_nonempty_list_symbol_ _menhir_cell0_RP _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_list_sorted_var_ _menhir_cell0_RP -> _ -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_RP (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_list_sorted_var_ (_menhir_stack, _, _8) = _menhir_stack in
          let MenhirCell0_LP (_menhir_stack, _) = _menhir_stack in
          let MenhirCell0_RP (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_nonempty_list_symbol_ (_menhir_stack, _, _5) = _menhir_stack in
          let MenhirCell0_LP (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_PAR (_menhir_stack, _) = _menhir_stack in
          let MenhirCell0_LP (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_symbol (_menhir_stack, _menhir_s, _1, _, _) = _menhir_stack in
          let _10 = _v in
          let _v = _menhir_action_058 _1 _10 _5 _8 in
          _menhir_goto_fun_def _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_221 : type  ttv_stack. ((((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DEFINESORT, _menhir_box_commands) _menhir_cell1_symbol _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_list_symbol_ _menhir_cell0_RP -> _ -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RP ->
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell0_RP (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_list_symbol_ (_menhir_stack, _, _5) = _menhir_stack in
          let MenhirCell0_LP (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_symbol (_menhir_stack, _, _3, _, _) = _menhir_stack in
          let MenhirCell1_DEFINESORT (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_7, _endpos__8_) = (_v, _endpos) in
          let _v = _menhir_action_023 _3 _5 _7 _endpos__8_ _startpos__1_ in
          _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_157 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LP, ttv_result) _menhir_cell1_symbol -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RP ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_symbol (_menhir_stack, _, _2, _, _) = _menhir_stack in
          let MenhirCell1_LP (_menhir_stack, _menhir_s, _) = _menhir_stack in
          let _3 = _v in
          let _v = _menhir_action_163 _2 _3 in
          _menhir_goto_sorted_var _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_sorted_var : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState227 ->
          _menhir_run_233 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState233 ->
          _menhir_run_233 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState232 ->
          _menhir_run_233 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState166 ->
          _menhir_run_159 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState159 ->
          _menhir_run_159 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState154 ->
          _menhir_run_159 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_233 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_sorted_var (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | LP ->
          _menhir_run_155 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState233
      | RP ->
          let _v_0 = _menhir_action_121 () in
          _menhir_run_234 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | _ ->
          _eRR ()
  
  and _menhir_run_234 : type  ttv_stack. (ttv_stack, _menhir_box_commands) _menhir_cell1_sorted_var -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_sorted_var (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_122 x xs in
      _menhir_goto_list_sorted_var_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list_sorted_var_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState227 ->
          _menhir_run_239 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState232 ->
          _menhir_run_235 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState233 ->
          _menhir_run_234 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_235 : type  ttv_stack. ((((ttv_stack, _menhir_box_commands) _menhir_cell1_symbol _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_PAR _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_nonempty_list_symbol_ _menhir_cell0_RP _menhir_cell0_LP as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_list_sorted_var_ (_menhir_stack, _menhir_s, _v) in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _menhir_stack = MenhirCell0_RP (_menhir_stack, _endpos) in
      let _menhir_s = MenhirState236 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LP ->
          _menhir_run_129 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ASCIIWOR _v ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_159 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | LP ->
          let _menhir_stack = MenhirCell1_sorted_var (_menhir_stack, _menhir_s, _v) in
          _menhir_run_155 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState159
      | RP ->
          let x = _v in
          let _v = _menhir_action_140 x in
          _menhir_goto_nonempty_list_sorted_var_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_nonempty_list_sorted_var_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState166 ->
          _menhir_run_167 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState154 ->
          _menhir_run_161 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState159 ->
          _menhir_run_160 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_167 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_LP, ttv_result) _menhir_cell1_EXISTS _menhir_cell0_LP as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_nonempty_list_sorted_var_ (_menhir_stack, _menhir_s, _v) in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _menhir_stack = MenhirCell0_RP (_menhir_stack, _endpos) in
      let _menhir_s = MenhirState168 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | STRINGLIT _v ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUMERAL _v ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LP ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | HEXADECIMAL _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DECIMAL _v ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BINARY _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ASCIIWOR _v ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_161 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_LP, ttv_result) _menhir_cell1_FORALL _menhir_cell0_LP as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_nonempty_list_sorted_var_ (_menhir_stack, _menhir_s, _v) in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _menhir_stack = MenhirCell0_RP (_menhir_stack, _endpos) in
      let _menhir_s = MenhirState162 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | STRINGLIT _v ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUMERAL _v ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LP ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | HEXADECIMAL _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DECIMAL _v ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BINARY _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ASCIIWOR _v ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_160 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_sorted_var -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_sorted_var (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_141 x xs in
      _menhir_goto_nonempty_list_sorted_var_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_136 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_LP, ttv_result) _menhir_cell1_AS, ttv_result) _menhir_cell1_identifier -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RP ->
          let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_identifier (_menhir_stack, _, _3, _, _) = _menhir_stack in
          let MenhirCell1_AS (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_4, _endpos__5_) = (_v, _endpos) in
          let _v = _menhir_action_154 _3 _4 _endpos__5_ _startpos__1_ in
          _menhir_goto_qualidentifier _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__5_ _startpos__1_ _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_qualidentifier : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState353 ->
          _menhir_run_185 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState094 ->
          _menhir_run_185 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState378 ->
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState380 ->
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState376 ->
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState369 ->
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState366 ->
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState352 ->
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState357 ->
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState257 ->
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState253 ->
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState246 ->
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState093 ->
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState185 ->
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState171 ->
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState174 ->
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState175 ->
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState168 ->
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState162 ->
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState150 ->
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState144 ->
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState140 ->
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState101 ->
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | MenhirState113 ->
          _menhir_run_117 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_185 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LP as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_qualidentifier (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v_0 ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState185
      | STRINGLIT _v_1 ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState185
      | NUMERAL _v_2 ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState185
      | LP ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState185
      | HEXADECIMAL _v_3 ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v_3 MenhirState185
      | DECIMAL _v_4 ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v_4 MenhirState185
      | BINARY _v_5 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v_5 MenhirState185
      | ASCIIWOR _v_6 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_6 MenhirState185
      | _ ->
          _eRR ()
  
  and _menhir_run_117 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_169 _1 _endpos__1_ _startpos__1_ in
      _menhir_goto_term _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_131 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v_0 ->
          let _menhir_stack = MenhirCell1_sort (_menhir_stack, _menhir_s, _v) in
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState131
      | LP ->
          let _menhir_stack = MenhirCell1_sort (_menhir_stack, _menhir_s, _v) in
          _menhir_run_129 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState131
      | ASCIIWOR _v_1 ->
          let _menhir_stack = MenhirCell1_sort (_menhir_stack, _menhir_s, _v) in
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState131
      | RP ->
          let x = _v in
          let _v = _menhir_action_136 x in
          _menhir_goto_nonempty_list_sort_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_nonempty_list_sort_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState130 ->
          _menhir_run_134 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState131 ->
          _menhir_run_132 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_134 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LP, ttv_result) _menhir_cell1_identifier -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_identifier (_menhir_stack, _, _2, _, _) = _menhir_stack in
      let MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_3, _endpos__4_) = (_v, _endpos) in
      let _v = _menhir_action_161 _2 _3 _endpos__4_ _startpos__1_ in
      _menhir_goto_sort _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_132 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_sort -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_sort (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_137 x xs in
      _menhir_goto_nonempty_list_sort_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_130 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LP as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_identifier (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v_0 ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState130
      | LP ->
          _menhir_run_129 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState130
      | ASCIIWOR _v_1 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState130
      | _ ->
          _eRR ()
  
  and _menhir_run_128 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_LP, ttv_result) _menhir_cell1_AS as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_identifier (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v_0 ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState128
      | LP ->
          _menhir_run_129 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState128
      | ASCIIWOR _v_1 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState128
      | _ ->
          _eRR ()
  
  and _menhir_run_118 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_153 _1 _endpos__1_ _startpos__1_ in
      _menhir_goto_qualidentifier _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_112 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LP as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_148 _1 _endpos__1_ _startpos__1_ in
      _menhir_goto_pattern _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_108 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v_0 ->
          let _menhir_stack = MenhirCell1_symbol (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState108
      | ASCIIWOR _v_1 ->
          let _menhir_stack = MenhirCell1_symbol (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState108
      | RP ->
          let x = _v in
          let _v = _menhir_action_142 x in
          _menhir_goto_nonempty_list_symbol_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_nonempty_list_symbol_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState355 ->
          _menhir_run_356 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState330 ->
          _menhir_run_331 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState296 ->
          _menhir_run_297 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState268 ->
          _menhir_run_269 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState229 ->
          _menhir_run_230 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState107 ->
          _menhir_run_110 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState108 ->
          _menhir_run_109 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_356 : type  ttv_stack. (((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_PAR _menhir_cell0_LP as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_nonempty_list_symbol_ (_menhir_stack, _menhir_s, _v) in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _menhir_stack = MenhirCell0_RP (_menhir_stack, _endpos) in
      let _menhir_s = MenhirState357 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | STRINGLIT _v ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUMERAL _v ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LP ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | HEXADECIMAL _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DECIMAL _v ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BINARY _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ASCIIWOR _v ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_331 : type  ttv_stack. ((((((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DECLARECONST, _menhir_box_commands) _menhir_cell1_symbol, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_PAR _menhir_cell0_LP as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_nonempty_list_symbol_ (_menhir_stack, _menhir_s, _v) in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _menhir_stack = MenhirCell0_RP (_menhir_stack, _endpos) in
      let _menhir_s = MenhirState332 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LP ->
          _menhir_run_129 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ASCIIWOR _v ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_297 : type  ttv_stack. (((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_PAR _menhir_cell0_LP as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_nonempty_list_symbol_ (_menhir_stack, _menhir_s, _v) in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _menhir_stack = MenhirCell0_RP (_menhir_stack, _endpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LP ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _menhir_stack = MenhirCell0_LP (_menhir_stack, _startpos) in
          let _menhir_s = MenhirState299 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LP ->
              _menhir_run_300 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_269 : type  ttv_stack. (((((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_DECLAREFUN, _menhir_box_commands) _menhir_cell1_symbol _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_PAR _menhir_cell0_LP as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_nonempty_list_symbol_ (_menhir_stack, _menhir_s, _v) in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _menhir_stack = MenhirCell0_RP (_menhir_stack, _endpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LP ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _menhir_stack = MenhirCell0_LP (_menhir_stack, _startpos) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SYMBOL _v_0 ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState271
          | LP ->
              _menhir_run_129 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState271
          | ASCIIWOR _v_1 ->
              _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState271
          | RP ->
              let _v_2 = _menhir_action_119 () in
              _menhir_run_274 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState271
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_230 : type  ttv_stack. (((ttv_stack, _menhir_box_commands) _menhir_cell1_symbol _menhir_cell0_LP, _menhir_box_commands) _menhir_cell1_PAR _menhir_cell0_LP as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_nonempty_list_symbol_ (_menhir_stack, _menhir_s, _v) in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _menhir_stack = MenhirCell0_RP (_menhir_stack, _endpos) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LP ->
          let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
          let _menhir_stack = MenhirCell0_LP (_menhir_stack, _startpos) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LP ->
              _menhir_run_155 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState232
          | RP ->
              let _v_0 = _menhir_action_121 () in
              _menhir_run_235 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState232
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_110 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_LP, ttv_result) _menhir_cell1_LP, ttv_result) _menhir_cell1_symbol -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_symbol (_menhir_stack, _, _2, _, _) = _menhir_stack in
      let MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_3, _endpos__4_) = (_v, _endpos) in
      let _v = _menhir_action_150 _2 _3 _endpos__4_ _startpos__1_ in
      _menhir_goto_pattern _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_109 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_symbol -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_symbol (_menhir_stack, _menhir_s, x, _, _) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_143 x xs in
      _menhir_goto_nonempty_list_symbol_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_107 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_LP, ttv_result) _menhir_cell1_LP as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_symbol (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v_0 ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState107
      | ASCIIWOR _v_1 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState107
      | _ ->
          _eRR ()
  
  and _menhir_run_096 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_LP, ttv_result) _menhir_cell1_UNDERSCORE as 'stack) -> _ -> _ -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_symbol (_menhir_stack, _menhir_s, _v, _startpos, _endpos) in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v_0 ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState096
      | NUMERAL _v_1 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState096
      | ASCIIWOR _v_2 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState096
      | _ ->
          _eRR ()
  
  and _menhir_run_052 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_063 _1 _endpos__1_ _startpos__1_ in
      _menhir_goto_index _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _v _menhir_s _tok
  
  and _menhir_goto_index : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState099 ->
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
      | MenhirState096 ->
          _menhir_run_099 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok
      | MenhirState051 ->
          _menhir_run_054 _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_099 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v_0 ->
          let _menhir_stack = MenhirCell1_index (_menhir_stack, _menhir_s, _v, _endpos) in
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState099
      | NUMERAL _v_1 ->
          let _menhir_stack = MenhirCell1_index (_menhir_stack, _menhir_s, _v, _endpos) in
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState099
      | ASCIIWOR _v_2 ->
          let _menhir_stack = MenhirCell1_index (_menhir_stack, _menhir_s, _v, _endpos) in
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState099
      | RP ->
          let x = _v in
          let _v = _menhir_action_132 x in
          _menhir_goto_nonempty_list_index_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_goto_nonempty_list_index_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState099 ->
          _menhir_run_100 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState096 ->
          _menhir_run_097 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_100 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_index -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_index (_menhir_stack, _menhir_s, x, _) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_133 x xs in
      _menhir_goto_nonempty_list_index_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_run_097 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_LP, ttv_result) _menhir_cell1_UNDERSCORE, ttv_result) _menhir_cell1_symbol -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let MenhirCell1_symbol (_menhir_stack, _, _3, _, _) = _menhir_stack in
      let MenhirCell1_UNDERSCORE (_menhir_stack, _, _, _) = _menhir_stack in
      let MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_4, _endpos__5_) = (_v, _endpos) in
      let _v = _menhir_action_061 _3 _4 _endpos__5_ _startpos__1_ in
      _menhir_goto_identifier _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__5_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_054 : type  ttv_stack. (((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_SETOPTION, _menhir_box_commands) _menhir_cell1_key_option -> _ -> _ -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_key_option (_menhir_stack, _, _1, _startpos__1_) = _menhir_stack in
      let (_endpos__2_, _2) = (_endpos, _v) in
      let _v = _menhir_action_164 _1 _2 _endpos__2_ _startpos__1_ in
      _menhir_goto_src_lib_smtlib_parser_option _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
  
  and _menhir_run_077 : type  ttv_stack. ((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_SETLOGIC -> _ -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RP ->
          let _endpos_0 = _menhir_lexbuf.Lexing.lex_curr_p in
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_SETLOGIC (_menhir_stack, _) = _menhir_stack in
          let MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
          let (_3, _endpos__4_) = (_v, _endpos_0) in
          let _v = _menhir_action_040 _3 _endpos__4_ _startpos__1_ in
          _menhir_goto_command _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_072 : type  ttv_stack. (ttv_stack, _menhir_box_commands) _menhir_cell1_key_info -> _ -> _ -> _ -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _tok ->
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_008 _1 _endpos__1_ _startpos__1_ in
      _menhir_goto_attribute_value _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _v _tok
  
  and _menhir_run_063 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_157 _1 _endpos__1_ _startpos__1_ in
      _menhir_goto_sexpr _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_053 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _startpos _v _menhir_s _tok ->
      let (_endpos__1_, _startpos__1_, _1) = (_endpos, _startpos, _v) in
      let _v = _menhir_action_062 _1 _endpos__1_ _startpos__1_ in
      _menhir_goto_index _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _v _menhir_s _tok
  
  and _menhir_run_010 : type  ttv_stack. (ttv_stack, _menhir_box_commands) _menhir_cell1_STATUTS -> _ -> _ -> _ -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _endpos _v _tok ->
      let MenhirCell1_STATUTS (_menhir_stack, _menhir_s, _startpos__1_) = _menhir_stack in
      let (_endpos__2_, _2) = (_endpos, _v) in
      let _v = _menhir_action_096 _2 _endpos__2_ _startpos__1_ in
      _menhir_goto_keyword _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__2_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_004 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
      let _v = _menhir_action_075 _endpos__1_ _startpos__1_ in
      _menhir_goto_key_info _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_goto_key_option : type  ttv_stack. (((ttv_stack, _menhir_box_commands) _menhir_cell1_LP, _menhir_box_commands) _menhir_cell1_SETOPTION as 'stack) -> _ -> _ -> _ -> _ -> ('stack, _menhir_box_commands) _menhir_state -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _startpos _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_key_option (_menhir_stack, _menhir_s, _v, _startpos) in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v_0 ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState051
      | NUMERAL _v_1 ->
          _menhir_run_052 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState051
      | ASCIIWOR _v_2 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState051
      | _ ->
          _eRR ()
  
  and _menhir_run_015 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
      let _v = _menhir_action_074 _endpos__1_ _startpos__1_ in
      _menhir_goto_key_info _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_018 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
      let _v = _menhir_action_073 _endpos__1_ _startpos__1_ in
      _menhir_goto_key_info _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_028 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
      let _v = _menhir_action_072 _endpos__1_ _startpos__1_ in
      _menhir_goto_key_info _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_032 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
      let _v = _menhir_action_071 _endpos__1_ _startpos__1_ in
      _menhir_goto_key_info _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_033 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
      let _v = _menhir_action_070 _endpos__1_ _startpos__1_ in
      _menhir_goto_key_info _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_038 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
      let _v = _menhir_action_069 _endpos__1_ _startpos__1_ in
      _menhir_goto_key_info _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_039 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
      let _v = _menhir_action_068 _endpos__1_ _startpos__1_ in
      _menhir_goto_key_info _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_044 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
      let _v = _menhir_action_066 _endpos__1_ _startpos__1_ in
      _menhir_goto_key_info _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_045 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
      let _v = _menhir_action_067 _endpos__1_ _startpos__1_ in
      _menhir_goto_key_info _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_046 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
      let _v = _menhir_action_065 _endpos__1_ _startpos__1_ in
      _menhir_goto_key_info _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_047 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _endpos = _menhir_lexbuf.Lexing.lex_curr_p in
      let _tok = _menhir_lexer _menhir_lexbuf in
      let (_endpos__1_, _startpos__1_) = (_endpos, _startpos) in
      let _v = _menhir_action_064 _endpos__1_ _startpos__1_ in
      _menhir_goto_key_info _menhir_stack _menhir_lexbuf _menhir_lexer _endpos__1_ _startpos__1_ _v _menhir_s _tok
  
  and _menhir_run_353 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_commands) _menhir_state -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
      let _menhir_stack = MenhirCell1_LP (_menhir_stack, _menhir_s, _startpos) in
      let _menhir_s = MenhirState353 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | UNDERSCORE ->
          _menhir_run_095 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | SYMBOL _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | PAR ->
          let _menhir_stack = MenhirCell1_PAR (_menhir_stack, _menhir_s) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | LP ->
              let _startpos = _menhir_lexbuf.Lexing.lex_start_p in
              let _menhir_stack = MenhirCell0_LP (_menhir_stack, _startpos) in
              let _menhir_s = MenhirState355 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | SYMBOL _v ->
                  _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | ASCIIWOR _v ->
                  _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | MATCH ->
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LP ->
          _menhir_run_125 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_138 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | FORALL ->
          _menhir_run_153 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXISTS ->
          _menhir_run_165 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EXCLIMATIONPT ->
          _menhir_run_171 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ASCIIWOR _v ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | AS ->
          _menhir_run_126 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | _ ->
          _eRR ()
  
  let _menhir_run_000 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_commands =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState000 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LP ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | EOF ->
          _menhir_run_372 _menhir_stack _menhir_s
      | _ ->
          _eRR ()
  
  let _menhir_run_376 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_term =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState376 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | STRINGLIT _v ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUMERAL _v ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LP ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | HEXADECIMAL _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DECIMAL _v ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BINARY _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ASCIIWOR _v ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  let _menhir_run_378 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_term_list =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState378 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SYMBOL _v ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | STRINGLIT _v ->
          _menhir_run_056 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NUMERAL _v ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LP ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | HEXADECIMAL _v ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | DECIMAL _v ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BINARY _v ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | ASCIIWOR _v ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
end

let term_list =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_term_list v = _menhir_run_378 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

let term =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_term v = _menhir_run_376 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

let commands =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_commands v = _menhir_run_000 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

# 345 "src/lib/smtlib_parser.mly"
  

# 7464 "src/lib/smtlib_parser.ml"
