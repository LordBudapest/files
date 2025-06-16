# Prefix of the current opam switch
if ( ! ${?OPAM_SWITCH_PREFIX} ) setenv OPAM_SWITCH_PREFIX ""
setenv OPAM_SWITCH_PREFIX '/home/bhaskar/.opam/4.14.2'
# Updated by package ocaml-base-compiler
if ( ! ${?CAML_LD_LIBRARY_PATH} ) setenv CAML_LD_LIBRARY_PATH ""
setenv CAML_LD_LIBRARY_PATH '/home/bhaskar/.opam/4.14.2/lib/stublibs'
# Updated by package ocaml
if ( ! ${?CAML_LD_LIBRARY_PATH} ) setenv CAML_LD_LIBRARY_PATH ""
setenv CAML_LD_LIBRARY_PATH '/home/bhaskar/.opam/4.14.2/lib/ocaml/stublibs:/home/bhaskar/.opam/4.14.2/lib/ocaml'
# Updated by package ocaml
if ( ! ${?CAML_LD_LIBRARY_PATH} ) setenv CAML_LD_LIBRARY_PATH ""
setenv CAML_LD_LIBRARY_PATH '/home/bhaskar/.opam/4.14.2/lib/stublibs':"$CAML_LD_LIBRARY_PATH"
# Updated by package ocaml
if ( ! ${?OCAML_TOPLEVEL_PATH} ) setenv OCAML_TOPLEVEL_PATH ""
setenv OCAML_TOPLEVEL_PATH '/home/bhaskar/.opam/4.14.2/lib/toplevel'
# Current opam switch man dir
if ( ! ${?MANPATH} ) setenv MANPATH ""
setenv MANPATH "$MANPATH":'/home/bhaskar/.opam/4.14.2/man'
# Binary dir for opam switch 4.14.2
if ( ! ${?PATH} ) setenv PATH ""
setenv PATH '/home/bhaskar/.opam/4.14.2/bin':"$PATH"
