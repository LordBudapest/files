# Prefix of the current opam switch
$env:OPAM_SWITCH_PREFIX='/home/bhaskar/.opam/default'
# Updated by package ocaml
$env:CAML_LD_LIBRARY_PATH='/usr/local/lib/ocaml/4.14.1/stublibs:/usr/lib/ocaml/stublibs'
# Updated by package ocaml
$env:CAML_LD_LIBRARY_PATH='/home/bhaskar/.opam/default/lib/stublibs:' + "$env:CAML_LD_LIBRARY_PATH"
# Updated by package ocaml
$env:OCAML_TOPLEVEL_PATH='/home/bhaskar/.opam/default/lib/toplevel'
# Current opam switch man dir
$env:MANPATH="$env:MANPATH" + ':/home/bhaskar/.opam/default/man'
# Binary dir for opam switch default
$env:PATH='/home/bhaskar/.opam/default/bin:' + "$env:PATH"
