if status is-interactive
  test -r '/home/bhaskar/.opam/opam-init/env_hook.fish' && source '/home/bhaskar/.opam/opam-init/env_hook.fish' > /dev/null 2> /dev/null; or true
end

test -r '/home/bhaskar/.opam/opam-init/variables.fish' && source '/home/bhaskar/.opam/opam-init/variables.fish' > /dev/null 2> /dev/null; or true
