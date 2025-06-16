if [[ -o interactive ]]; then
  [[ ! -r /home/bhaskar/.opam/opam-init/complete.zsh ]] || source /home/bhaskar/.opam/opam-init/complete.zsh  > /dev/null 2> /dev/null

  [[ ! -r /home/bhaskar/.opam/opam-init/env_hook.zsh ]] || source /home/bhaskar/.opam/opam-init/env_hook.zsh  > /dev/null 2> /dev/null
fi

[[ ! -r /home/bhaskar/.opam/opam-init/variables.sh ]] || source /home/bhaskar/.opam/opam-init/variables.sh  > /dev/null 2> /dev/null
