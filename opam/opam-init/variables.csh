# Prefix of the current opam switch
if ( ! ${?OPAM_SWITCH_PREFIX} ) setenv OPAM_SWITCH_PREFIX ""
setenv OPAM_SWITCH_PREFIX '/home/bhaskar/.opam/default'
# Updated by package ocaml
if ( ! ${?CAML_LD_LIBRARY_PATH} ) setenv CAML_LD_LIBRARY_PATH ""
setenv CAML_LD_LIBRARY_PATH '/usr/local/lib/ocaml/4.14.1/stublibs:/usr/lib/ocaml/stublibs'
# Updated by package ocaml
if ( ! ${?CAML_LD_LIBRARY_PATH} ) setenv CAML_LD_LIBRARY_PATH ""
setenv CAML_LD_LIBRARY_PATH '/home/bhaskar/.opam/default/lib/stublibs':"$CAML_LD_LIBRARY_PATH"
# Updated by package ocaml
if ( ! ${?OCAML_TOPLEVEL_PATH} ) setenv OCAML_TOPLEVEL_PATH ""
setenv OCAML_TOPLEVEL_PATH '/home/bhaskar/.opam/default/lib/toplevel'
# Current opam switch man dir
if ( ! ${?MANPATH} ) setenv MANPATH ""
setenv MANPATH "$MANPATH":'/home/bhaskar/.opam/default/man'
# Binary dir for opam switch default
if ( ! ${?PATH} ) setenv PATH ""
setenv PATH '/home/bhaskar/.opam/default/bin':"$PATH"
