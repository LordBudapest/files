# Prefix of the current opam switch
set -gx OPAM_SWITCH_PREFIX '/home/bhaskar/.opam/4.14.2';
# Updated by package ocaml-base-compiler
set -gx CAML_LD_LIBRARY_PATH '/home/bhaskar/.opam/4.14.2/lib/stublibs';
# Updated by package ocaml
set -gx CAML_LD_LIBRARY_PATH '/home/bhaskar/.opam/4.14.2/lib/ocaml/stublibs:/home/bhaskar/.opam/4.14.2/lib/ocaml';
# Updated by package ocaml
set -gx CAML_LD_LIBRARY_PATH '/home/bhaskar/.opam/4.14.2/lib/stublibs':"$CAML_LD_LIBRARY_PATH";
# Updated by package ocaml
set -gx OCAML_TOPLEVEL_PATH '/home/bhaskar/.opam/4.14.2/lib/toplevel';
# Current opam switch man dir
if [ (count $MANPATH) -gt 0 ]; set -gx MANPATH $MANPATH '/home/bhaskar/.opam/4.14.2/man'; end;
# Binary dir for opam switch 4.14.2
set -gx PATH '/home/bhaskar/.opam/4.14.2/bin' $PATH;
