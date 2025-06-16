module C = Configurator.V1

let () =
  let real_gcc = ref "" in
  let m = ref "" in
  let args = Arg.[
      ("--real-gcc", Set_string real_gcc, "");
      ("-m", Set_string m, "");
    ]
  in
  C.main ~name:"model" ~args (fun c ->
      let exe = "./machdep" ^ !m ^ "-ml.exe" in
      let {C.Process.exit_code; stdout; stderr} = C.Process.run c !real_gcc ["-D_GNUCC"; "-m" ^ !m; "machdep-ml.c"; "-o"; exe] in
      if exit_code = 0 then (
        let {C.Process.stdout; stderr; exit_code} = C.Process.run c exe [] in
        assert (exit_code = 0);
        Printf.printf "Some {%s}" stdout
      )
      else 
        Printf.printf "None"
    )
