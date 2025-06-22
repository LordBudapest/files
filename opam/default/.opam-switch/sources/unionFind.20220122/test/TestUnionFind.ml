let postincrement r =
  let v = !r in
  r := v + 1;
  v

let time msg f =
  let start = Unix.gettimeofday() in
  let v = f() in
  let finish = Unix.gettimeofday() in
  Printf.fprintf stderr "%s: %.2f seconds.\n%!" msg (finish -. start);
  v

let skip () =
  Printf.fprintf stderr "\n%!"

let announce name =
  Printf.fprintf stderr "%s\n%!" name

let n, k =
  1000000, 10000000

(* We need [3 * k] random integers of amplitude [n]. *)

let integers =
  Random.self_init();
  time "Preparation of the random numbers" begin fun () ->
    Array.init (3 * k) (fun _ -> Random.int n)
  end

let () =
  Printf.printf "Running the UnionFind benchmarks...\n\n%!"

let new_random_stream () : unit -> int =
  let c = ref 0 in
  fun () ->
    integers.(postincrement c)

(* -------------------------------------------------------------------------- *)

(* Testing UnionFind, which uses primitive references. *)

let () =
  announce "UnionFind";
  let random : unit -> int = new_random_stream() in
  let point : int UnionFind.elem array =
    time "Initialization" (fun () -> Array.init n UnionFind.make)
  in
  time "Calling union and find" (fun () ->
    for _op = 1 to k do
      if random() mod 2 = 0 then begin
        (* Union. *)
        let i = random()
        and j = random() in
        if not (UnionFind.eq point.(i) point.(j)) then begin
          let vi = UnionFind.get point.(i)
          and vj = UnionFind.get point.(j) in
          let p = UnionFind.union point.(i) point.(j) in
          let v = vi + vj in
          UnionFind.set p v
        end
      end
      else begin
        (* Find. *)
        let i = random() in
        let _ = UnionFind.find point.(i) in
        ()
      end
    done
  );
  skip ()

(* -------------------------------------------------------------------------- *)

(* Also UnionFind, using [merge]. *)

let () =
  announce "UnionFind (with merge)";
  let random : unit -> int = new_random_stream() in
  let point : int UnionFind.elem array =
    time "Initialization" (fun () -> Array.init n UnionFind.make)
  in
  time "Calling merge and find" (fun () ->
    for _op = 1 to k do
      if random() mod 2 = 0 then begin
        (* Union. *)
        let i = random()
        and j = random() in
        let _ = UnionFind.merge (+) point.(i) point.(j) in
        ()
      end
      else begin
        (* Find. *)
        let i = random() in
        let _ = UnionFind.find point.(i) in
        ()
      end
    done
  );
  skip ()

(* -------------------------------------------------------------------------- *)

(* Testing UnionFind.Make(StoreVector). *)

let () =
  announce "UnionFind.Make(StoreVector)";
  let module Store = UnionFind.StoreVector in
  let module UnionFind = UnionFind.Make(Store) in
  let random : unit -> int = new_random_stream() in
  let s = Store.new_store() in
  let point : int UnionFind.rref array =
    time "Initialization" (fun () -> Array.init n (UnionFind.make s))
  in
  time "Calling union and find" (fun () ->
    for _op = 1 to k do
      if random() mod 2 = 0 then begin
        (* Union. *)
        let i = random()
        and j = random() in
        if not (UnionFind.eq s point.(i) point.(j)) then begin
          let vi = UnionFind.get s point.(i)
          and vj = UnionFind.get s point.(j) in
          let p = UnionFind.union s point.(i) point.(j) in
          let v = vi + vj in
          UnionFind.set s p v
        end
      end
      else begin
        (* Find. *)
        let i = random() in
        let _ = UnionFind.get s point.(i) in
        ()
      end
    done
  );
  skip ()

(* -------------------------------------------------------------------------- *)

(* Testing UnionFind.Make(StoreRef), which also uses primitive references. *)

let () =
  announce "UnionFind.Make(StoreRef)";
  let module Store = UnionFind.StoreRef in
  let module UnionFind = UnionFind.Make(Store) in
  let random : unit -> int = new_random_stream() in
  let s = Store.new_store() in
  let point : int UnionFind.rref array =
    time "Initialization" (fun () -> Array.init n (UnionFind.make s))
  in
  time "Calling union and find" (fun () ->
    for _op = 1 to k do
      if random() mod 2 = 0 then begin
        (* Union. *)
        let i = random()
        and j = random() in
        if not (UnionFind.eq s point.(i) point.(j)) then begin
          let vi = UnionFind.get s point.(i)
          and vj = UnionFind.get s point.(j) in
          let p = UnionFind.union s point.(i) point.(j) in
          let v = vi + vj in
          UnionFind.set s p v
        end
      end
      else begin
        (* Find. *)
        let i = random() in
        let _ = UnionFind.get s point.(i) in
        ()
      end
    done
  );
  skip ()

(* -------------------------------------------------------------------------- *)

(* Testing UnionFind.Make(StoreTransactionalRef), which uses transactional
   references implemented on top of primitive references. *)

let () =
  announce "UnionFind.Make(StoreTransactionalRef)";
  let module Store = UnionFind.StoreTransactionalRef in
  let module UnionFind = UnionFind.Make(Store) in
  let random : unit -> int = new_random_stream() in
  let s = Store.new_store() in
  let point : int UnionFind.rref array =
    time "Initialization" (fun () -> Array.init n (UnionFind.make s))
  in
  time "Calling union and find" (fun () ->
    for _op = 1 to k do
      if random() mod 2 = 0 then begin
        (* Union. *)
        let i = random()
        and j = random() in
        if not (UnionFind.eq s point.(i) point.(j)) then begin
          let vi = UnionFind.get s point.(i)
          and vj = UnionFind.get s point.(j) in
          let p = UnionFind.union s point.(i) point.(j) in
          let v = vi + vj in
          UnionFind.set s p v
        end
      end
      else begin
        (* Find. *)
        let i = random() in
        let _ = UnionFind.get s point.(i) in
        ()
      end
    done
  );
  skip ()

(* -------------------------------------------------------------------------- *)

(* Testing UnionFind.Make(StoreTransactionalRef), with [merge]. *)

let () =
  announce "UnionFind.Make(StoreTransactionalRef) (with merge)";
  let module Store = UnionFind.StoreTransactionalRef in
  let module UnionFind = UnionFind.Make(Store) in
  let random : unit -> int = new_random_stream() in
  let s = Store.new_store() in
  let point : int UnionFind.rref array =
    time "Initialization" (fun () -> Array.init n (UnionFind.make s))
  in
  time "Calling merge and find" (fun () ->
    for _op = 1 to k do
      if random() mod 2 = 0 then begin
        (* Union. *)
        let i = random()
        and j = random() in
        let _ = UnionFind.merge s (+) point.(i) point.(j) in
        ()
      end
      else begin
        (* Find. *)
        let i = random() in
        let _ = UnionFind.get s point.(i) in
        ()
      end
    done
  );
  skip ()

(* -------------------------------------------------------------------------- *)

(* Testing UnionFind.Make(StoreMap), which uses immutable maps. *)

let () =
  announce "UnionFind.Make(StoreMap)";
  let module Store = UnionFind.StoreMap in
  let module UnionFind = UnionFind.Make(Store) in
  let random : unit -> int = new_random_stream() in
  let s = Store.new_store() in
  let point : int UnionFind.rref array =
    time "Initialization" (fun () -> Array.init n (UnionFind.make s))
  in
  time "Calling union and find" (fun () ->
    for _op = 1 to k do
      if random() mod 2 = 0 then begin
        (* Union. *)
        let i = random()
        and j = random() in
        if not (UnionFind.eq s point.(i) point.(j)) then begin
          let vi = UnionFind.get s point.(i)
          and vj = UnionFind.get s point.(j) in
          let p = UnionFind.union s point.(i) point.(j) in
          let v = vi + vj in
          UnionFind.set s p v
        end
      end
      else begin
        (* Find. *)
        let i = random() in
        let _ = UnionFind.get s point.(i) in
        ()
      end
    done
  );
  skip ()

(* -------------------------------------------------------------------------- *)

(* Testing UnionFind.Make(StoreMap), with [merge]. *)

let () =
  announce "UnionFind.Make(StoreMap), with merge";
  let module Store = UnionFind.StoreMap in
  let module UnionFind = UnionFind.Make(Store) in
  let random : unit -> int = new_random_stream() in
  let s = Store.new_store() in
  let point : int UnionFind.rref array =
    time "Initialization" (fun () -> Array.init n (UnionFind.make s))
  in
  time "Calling merge and find" (fun () ->
    for _op = 1 to k do
      if random() mod 2 = 0 then begin
        (* Union. *)
        let i = random()
        and j = random() in
        let _ = UnionFind.merge s (+) point.(i) point.(j) in
        ()
      end
      else begin
        (* Find. *)
        let i = random() in
        let _ = UnionFind.get s point.(i) in
        ()
      end
    done
  );
  skip ()
