if [ -t 0 ]; then
  test -r /home/bhaskar/.opam/opam-init/complete.sh && . /home/bhaskar/.opam/opam-init/complete.sh > /dev/null 2> /dev/null || true

  test -r /home/bhaskar/.opam/opam-init/env_hook.sh && . /home/bhaskar/.opam/opam-init/env_hook.sh > /dev/null 2> /dev/null || true
fi

test -r /home/bhaskar/.opam/opam-init/variables.sh && . /home/bhaskar/.opam/opam-init/variables.sh > /dev/null 2> /dev/null || true
