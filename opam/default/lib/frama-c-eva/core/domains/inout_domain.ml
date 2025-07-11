(**************************************************************************)
(*                                                                        *)
(*  This file is part of Frama-C.                                         *)
(*                                                                        *)
(*  Copyright (C) 2007-2024                                               *)
(*    CEA (Commissariat à l'énergie atomique et aux énergies              *)
(*         alternatives)                                                  *)
(*                                                                        *)
(*  you can redistribute it and/or modify it under the terms of the GNU   *)
(*  Lesser General Public License as published by the Free Software       *)
(*  Foundation, version 2.1.                                              *)
(*                                                                        *)
(*  It is distributed in the hope that it will be useful,                 *)
(*  but WITHOUT ANY WARRANTY; without even the implied warranty of        *)
(*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *)
(*  GNU Lesser General Public License for more details.                   *)
(*                                                                        *)
(*  See the GNU Lesser General Public License version 2.1                 *)
(*  for more details (enclosed in the file licenses/LGPLv2.1).            *)
(*                                                                        *)
(**************************************************************************)

open Locations

type inout = {
  (* over-approximation of the memory locations written by the function *)
  over_outputs: Zone.t;
  (* over-approximation of the memory locations read by the function *)
  over_inputs: Zone.t;
  (* under-approximation of the memory locations written by the function *)
  under_outputs: Zone.t;
  (* over-approximation of the memory locations parts read by the function
     that are parts of its inputs (i.e. that the function has not written
     previously) *)
  operational_inputs: Zone.t;
}


(* Lattice structure for the abstract state above *)
module LatticeInout = struct

  (* Frama-C "datatype" for type [inout] *)
  include Datatype.Make_with_collections(struct
      include Datatype.Serializable_undefined

      type t = inout
      let name = "inout"

      let reprs = [ {
          over_outputs = List.hd Zone.reprs;
          over_inputs = List.hd Zone.reprs;
          under_outputs = List.hd Zone.reprs;
          operational_inputs = List.hd Zone.reprs;
        } ]

      let structural_descr =
        Structural_descr.t_record [|
          Zone.packed_descr;
          Zone.packed_descr;
          Zone.packed_descr;
          Zone.packed_descr;
        |]

      let compare m1 m2 =
        let c = Zone.compare m1.over_outputs m2.over_outputs in
        if c <> 0 then c
        else
          let c = Zone.compare m1.over_inputs m2.over_inputs in
          if c <> 0 then c
          else
            let c = Zone.compare m1.under_outputs m2.under_outputs in
            if c <> 0 then c
            else Zone.compare m1.operational_inputs m2.operational_inputs

      let equal = Datatype.from_compare

      let pretty fmt c =
        Format.fprintf fmt
          "@[<v 2>Over outputs:@ @[<hov>%a@]@]@.\
           @[<v 2>Over inputs:@ @[<hov>%a@]@]@.\
           @[<v 2>Sure outputs:@ @[<hov>%a@]@]@.\
           @[<v 2>Operational inputs:@ @[<hov>%a@]@]"
          Zone.pretty c.over_outputs
          Zone.pretty c.over_inputs
          Zone.pretty c.under_outputs
          Zone.pretty c.operational_inputs

      let hash m =
        Hashtbl.hash (Zone.hash m.over_outputs,
                      Zone.hash m.over_inputs,
                      Zone.hash m.under_outputs,
                      Zone.hash m.operational_inputs)

      let copy c = c

    end)

  (* Initial abstract at the beginning of the computation: nothing written
     or read so far. *)
  let empty = {
    over_outputs = Zone.bottom;
    over_inputs = Zone.bottom;
    under_outputs = Zone.bottom;
    operational_inputs = Zone.bottom;
  }

  (* Top state: everything read or written, nothing written in a sure way *)
  let top = {
    over_outputs = Zone.top;
    over_inputs = Zone.top;
    under_outputs = Zone.bottom;
    operational_inputs = Zone.top;
  }

  (* Join: over-approximation are joined, under-approximation are met. *)
  let join c1 c2 = {
    over_outputs = Zone.join c1.over_outputs c2.over_outputs;
    over_inputs = Zone.join c1.over_inputs c2.over_inputs;
    under_outputs = Zone.meet c1.under_outputs c2.under_outputs;
    operational_inputs = Zone.join c1.operational_inputs c2.operational_inputs;
  }

  (* The memory locations are finite, so the ascending chain property is
     already verified. We simply use a join. *)
  let widen _ _ c1 c2 = join c1 c2

  let narrow c1 c2 =
    `Value
      { over_outputs = Zone.narrow c1.over_outputs c2.over_outputs;
        over_inputs = Zone.narrow c1.over_inputs c2.over_inputs;
        under_outputs = Zone.link c1.under_outputs c2.under_outputs;
        operational_inputs =
          Zone.narrow c1.operational_inputs c2.operational_inputs; }

  (* Inclusion testing: pointwise for over-approximations, counter-pointwise
     for under-approximations *)
  let is_included c1 c2 =
    Zone.is_included c1.over_outputs c2.over_outputs &&
    Zone.is_included c1.over_inputs c2.over_inputs &&
    Zone.is_included c2.under_outputs c1.under_outputs &&
    Zone.is_included c1.operational_inputs c2.operational_inputs

end

module Transfer = struct

  (* Approximations of two consecutive statements [s1; s2], respectively
     abstracted as [c1] and [c2]. The result is immediate, except for
     operational inputs. For those, we subtract from the inputs of [c2]
     the memory locations that have been written in a sure way in [c1],
     then perform the join. *)
  let catenate c1 c2 =
    { over_outputs = Zone.join c1.over_outputs c2.over_outputs;
      over_inputs = Zone.join c1.over_inputs c2.over_inputs;
      under_outputs = Zone.link c1.under_outputs c2.under_outputs;
      operational_inputs =
        Zone.join c1.operational_inputs
          (Zone.diff c2.operational_inputs c1.under_outputs);
    }

  (* Effects of a conditional [if (e)]. [to_z] converts the lvalues present
     in [e] into locations. Nothing is written, the memory locations
     present in [e] are read. *)
  let effects_assume to_z e =
    let inputs = Eva_ast.zone_of_exp to_z e in
    {
      over_outputs = Zone.bottom;
      over_inputs = inputs;
      under_outputs = Zone.bottom;
      operational_inputs = inputs;
    }

  (* Effects of an assigment [lv = e]. [to_z] converts the lvalues present
     in [lv] and [e] into locations. *)
  let effects_assign to_z lv e =
    let inputs_e = Eva_ast.zone_of_exp to_z e in
    let inputs_lv = Eva_ast.indirect_zone_of_lval to_z lv.Eval.lval in
    let inputs = Zone.join inputs_e inputs_lv in
    let outputs =
      Precise_locs.enumerate_valid_bits Locations.Write lv.Eval.lloc
    in
    let exact_outputs = Precise_locs.cardinal_zero_or_one lv.Eval.lloc in
    {
      over_outputs = outputs;
      over_inputs = inputs;
      under_outputs = if exact_outputs then outputs else Zone.bottom;
      operational_inputs = inputs;
    }

  (* Removes a list of variables from a state. Used to model exiting a
     scope. *)
  let remove_variables vars state =
    let bases =
      List.fold_left
        (fun acc v -> Base.Set.add (Base.of_varinfo v) acc)
        Base.Set.empty vars
    in
    let rm = Zone.filter_base (fun b -> not (Base.Set.mem b bases)) in {
      over_outputs = rm state.over_outputs;
      over_inputs = rm state.over_inputs;
      under_outputs = rm state.under_outputs;
      operational_inputs = rm state.operational_inputs;
    }

end

module Domain = struct

  type state = inout
  type value = Cvalue.V.t
  type location = Precise_locs.precise_location
  type origin

  let value_dependencies = Main_values.cval
  let location_dependencies = Main_locations.ploc

  include (LatticeInout: sig
             include Datatype.S_with_collections with type t = state
             include Abstract_domain.Lattice with type state := state
           end)

  include Domain_builder.Complete (LatticeInout)

  let enter_scope _kind _vars state = state
  let leave_scope _kf vars state = Transfer.remove_variables vars state

  let to_z valuation lv =
    match valuation.Abstract_domain.find_loc lv with
    | `Value loc -> loc.Eval.loc
    | `Top -> Precise_locs.loc_top (* should not occur *)

  let assign _ki lv e _v valuation state =
    let to_z = to_z valuation in
    let effects = Transfer.effects_assign to_z lv e in
    `Value (Transfer.catenate state effects)

  let assume _stmt e _pos valuation state =
    let to_z = to_z valuation in
    let effects = Transfer.effects_assume to_z e in
    `Value (Transfer.catenate state effects)

  let start_call _stmt _call _recursion _valuation _state =
    `Value LatticeInout.empty

  let finalize_call _stmt _call _recursion ~pre ~post =
    `Value (Transfer.catenate pre post)

  let update _valuation state = `Value state

  (* Memexec *)
  let relate _kf _bases _state = Base.SetLattice.empty

  (* Initial state. Initializers are singletons, so we store nothing. *)
  let empty () = LatticeInout.empty
  let initialize_variable _ _ ~initialized:_ _ state = state
  let initialize_variable_using_type _ _ state  = state

  (* TODO *)
  let logic_assign _assign _location _state = top

  let top_query = `Value (Cvalue.V.top, None), Alarmset.all

  let extract_expr ~oracle:_ _context _state _expr = top_query
  let extract_lval ~oracle:_ _context _state _lv _locs = top_query
end

include Domain

let registered =
  let name = "inout"
  and descr = "Infers the inputs and outputs of each function." in
  Abstractions.Domain.register ~name ~descr ~priority:5 ~experimental:true
    (module Domain)

(*
Local Variables:
compile-command: "make -C ../../.."
End:
*)
