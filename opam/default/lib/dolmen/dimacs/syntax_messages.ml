
(* This file was auto-generated based on "syntax.messages". *)

(* Please note that the function [message] can raise [Not_found]. *)

let message =
  fun s ->
    match s with
    | 14 ->
        "008\na clause\na newline to properly finish the clause after the zero\n"
    | 33 ->
        "008\na clause\na newline to properly finish the clause after the zero\n"
    | 19 ->
        "006\na clause\nan integer, either zero to mark the end of the clause, or\na non-zero integer to add to the clause\n"
    | 7 ->
        "005\na p-cnf header\na newline character to end the header\n"
    | 28 ->
        "005\na p-cnf header\na newline character to end the header\n"
    | 6 ->
        "004\na p-cnf header\na non-zero integer for the number of clauses\n"
    | 27 ->
        "004\na p-cnf header\na non-zero integer for the number of clauses\n"
    | 5 ->
        "003\na p-cnf header\na non-zero integer for the number of variables\n"
    | 26 ->
        "003\na p-cnf header\na non-zero integer for the number of variables\n"
    | 4 ->
        "002\na p-cnf header\nthe keyword \"cnf\"\n"
    | 25 ->
        "002\na p-cnf header\nthe keyword \"cnf\"\n"
    | 0 ->
        "001\nan input sentence\na p-cnf header if there hasn't been one yet,\nor a clause starting with a non-zero integer\n"
    | 9 ->
        "001\nan input sentence\na p-cnf header if there hasn't been one yet,\nor a clause starting with a non-zero integer\n"
    | 10 ->
        "001\nan input sentence\na p-cnf header if there hasn't been one yet,\nor a clause starting with a non-zero integer\n"
    | 17 ->
        "001\nan input sentence\na p-cnf header if there hasn't been one yet,\nor a clause starting with a non-zero integer\n"
    | 1 ->
        "001\nan input sentence\na p-cnf header if there hasn't been one yet,\nor a clause starting with a non-zero integer\n"
    | 3 ->
        "001\nan input sentence\na p-cnf header if there hasn't been one yet,\nor a clause starting with a non-zero integer\n"
    | 23 ->
        "001\nan input sentence\na p-cnf header if there hasn't been one yet,\nor a clause starting with a non-zero integer\n"
    | _ ->
        raise Not_found
