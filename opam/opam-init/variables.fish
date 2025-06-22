# Prefix of the current opam switch
set -gx OPAM_SWITCH_PREFIX '/home/bhaskar/.opam/default';
# Updated by package ocaml
set -gx CAML_LD_LIBRARY_PATH '/usr/local/lib/ocaml/4.14.1/stublibs:/usr/lib/ocaml/stublibs';
# Updated by package ocaml
set -gx CAML_LD_LIBRARY_PATH '/home/bhaskar/.opam/default/lib/stublibs':"$CAML_LD_LIBRARY_PATH";
# Updated by package ocaml
set -gx OCAML_TOPLEVEL_PATH '/home/bhaskar/.opam/default/lib/toplevel';
# Current opam switch man dir
if [ (count $MANPATH) -gt 0 ]; set -gx MANPATH $MANPATH '/home/bhaskar/.opam/default/man'; end;
# Binary dir for opam switch default
set -gx PATH '/home/bhaskar/.opam/default/bin' $PATH;
