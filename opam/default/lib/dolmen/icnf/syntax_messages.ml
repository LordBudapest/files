
(* This file was auto-generated based on "syntax.messages". *)

(* Please note that the function [message] can raise [Not_found]. *)

let message =
  fun s ->
    match s with
    | 0 ->
        "006\nan input sentence\neither a non-zero integer to start a clause, the keyword\n'a' to start an assumption, or the keyword 'p' to start\na header\n"
    | 4 ->
        "008\na p-inccnf header\nthe 'inccnf' header'\n"
    | 5 ->
        "007\nan p-inccnf header\na newline character to end the p-inccnf header\n"
    | 7 ->
        "006\nan input sentence\neither a non-zero integer to start a clause, the keyword\n'a' to start an assumption, or the keyword 'p' to start\na header\n"
    | 8 ->
        "006\nan input sentence\neither a non-zero integer to start a clause, the keyword\n'a' to start an assumption, or the keyword 'p' to start\na header\n"
    | 19 ->
        "005\na clause\na newline character\n"
    | 21 ->
        "006\nan input sentence\neither a non-zero integer to start a clause, the keyword\n'a' to start an assumption, or the keyword 'p' to start\na header\n"
    | 13 ->
        "003\nan assumption\nthe newline character\n"
    | 25 ->
        "006\nan input sentence\neither a non-zero integer to start a clause, the keyword\n'a' to start an assumption, or the keyword 'p' to start\na header\n"
    | 11 ->
        "002\nan assumption\nan atom, i.e. a non-zero integer\n"
    | 1 ->
        "006\nan input sentence\neither a non-zero integer to start a clause, the keyword\n'a' to start an assumption, or the keyword 'p' to start\na header\n"
    | 29 ->
        "006\nan input sentence\neither a non-zero integer to start a clause, the keyword\n'a' to start an assumption, or the keyword 'p' to start\na header\n"
    | 30 ->
        "008\na p-inccnf header\nthe 'inccnf' header'\n"
    | 31 ->
        "007\nan p-inccnf header\na newline character to end the p-inccnf header\n"
    | 33 ->
        "006\nan input sentence\neither a non-zero integer to start a clause, the keyword\n'a' to start an assumption, or the keyword 'p' to start\na header\n"
    | 41 ->
        "005\na clause\na newline character\n"
    | 23 ->
        "004\na clause\neither another atom (i.e. non-zero integer), or the integer\nzero to close the clause\n"
    | 37 ->
        "003\nan assumption\nthe newline character\n"
    | 35 ->
        "002\nan assumption\nan atom, i.e. a non-zero integer\n"
    | 15 ->
        "001\nan assumption\neither another atom (i.e. non-zero integer), or the integer\nzero to close the assumption\n"
    | _ ->
        raise Not_found
