module CI = Cstubs_internals

external yaml_stub_1_yaml_get_version_string : unit -> CI.voidp
  = "yaml_stub_1_yaml_get_version_string" 

external yaml_stub_2_yaml_get_version
  : _ CI.fatptr -> _ CI.fatptr -> _ CI.fatptr -> unit
  = "yaml_stub_2_yaml_get_version" 

external yaml_stub_3_yaml_token_delete : _ CI.fatptr -> unit
  = "yaml_stub_3_yaml_token_delete" 

external yaml_stub_4_yaml_parser_initialize : _ CI.fatptr -> int
  = "yaml_stub_4_yaml_parser_initialize" 

external yaml_stub_5_yaml_parser_delete : _ CI.fatptr -> unit
  = "yaml_stub_5_yaml_parser_delete" 

external yaml_stub_6_yaml_parser_set_input_string
  : _ CI.fatptr -> _ CI.fatptr -> Unsigned.size_t -> unit
  = "yaml_stub_6_yaml_parser_set_input_string" 

external yaml_stub_7_yaml_parser_parse : _ CI.fatptr -> _ CI.fatptr -> int
  = "yaml_stub_7_yaml_parser_parse" 

external yaml_stub_8_yaml_emitter_initialize : _ CI.fatptr -> int
  = "yaml_stub_8_yaml_emitter_initialize" 

external yaml_stub_9_yaml_emitter_delete : _ CI.fatptr -> unit
  = "yaml_stub_9_yaml_emitter_delete" 

external yaml_stub_10_yaml_emitter_set_output_string
  : _ CI.fatptr -> _ CI.fatptr -> Unsigned.size_t -> _ CI.fatptr -> unit
  = "yaml_stub_10_yaml_emitter_set_output_string" 

external yaml_stub_11_yaml_emitter_set_encoding
  : _ CI.fatptr -> Unsigned.uint32 -> unit
  = "yaml_stub_11_yaml_emitter_set_encoding" 

external yaml_stub_12_yaml_emitter_set_canonical
  : _ CI.fatptr -> bool -> unit = "yaml_stub_12_yaml_emitter_set_canonical" 

external yaml_stub_13_yaml_emitter_set_indent : _ CI.fatptr -> int -> unit
  = "yaml_stub_13_yaml_emitter_set_indent" 

external yaml_stub_14_yaml_emitter_set_width : _ CI.fatptr -> int -> unit
  = "yaml_stub_14_yaml_emitter_set_width" 

external yaml_stub_15_yaml_emitter_set_unicode : _ CI.fatptr -> bool -> unit
  = "yaml_stub_15_yaml_emitter_set_unicode" 

external yaml_stub_16_yaml_emitter_flush : _ CI.fatptr -> int
  = "yaml_stub_16_yaml_emitter_flush" 

external yaml_stub_17_yaml_emitter_emit : _ CI.fatptr -> _ CI.fatptr -> int
  = "yaml_stub_17_yaml_emitter_emit" 

external yaml_stub_18_yaml_stream_start_event_initialize
  : _ CI.fatptr -> Unsigned.uint32 -> int
  = "yaml_stub_18_yaml_stream_start_event_initialize" 

external yaml_stub_19_yaml_stream_end_event_initialize : _ CI.fatptr -> int
  = "yaml_stub_19_yaml_stream_end_event_initialize" 

external yaml_stub_20_yaml_document_start_event_initialize
  : _ CI.fatptr -> _ CI.fatptr -> _ CI.fatptr -> _ CI.fatptr -> bool -> int
  = "yaml_stub_20_yaml_document_start_event_initialize" 

external yaml_stub_21_yaml_document_end_event_initialize
  : _ CI.fatptr -> bool -> int
  = "yaml_stub_21_yaml_document_end_event_initialize" 

external yaml_stub_22_yaml_alias_event_initialize
  : _ CI.fatptr -> _ CI.fatptr -> int
  = "yaml_stub_22_yaml_alias_event_initialize" 

external yaml_stub_23_yaml_scalar_event_initialize
  : _ CI.fatptr -> _ CI.fatptr -> _ CI.fatptr -> _ CI.fatptr -> int ->
    bool -> bool -> Unsigned.uint32 -> int
  =
  "yaml_stub_23_yaml_scalar_event_initialize_byte8" "yaml_stub_23_yaml_scalar_event_initialize"
  

external yaml_stub_24_yaml_sequence_start_event_initialize
  : _ CI.fatptr -> _ CI.fatptr -> _ CI.fatptr -> bool -> Unsigned.uint32 ->
    int = "yaml_stub_24_yaml_sequence_start_event_initialize" 

external yaml_stub_25_yaml_sequence_end_event_initialize : _ CI.fatptr -> int
  = "yaml_stub_25_yaml_sequence_end_event_initialize" 

external yaml_stub_26_yaml_mapping_start_event_initialize
  : _ CI.fatptr -> _ CI.fatptr -> _ CI.fatptr -> bool -> Unsigned.uint32 ->
    int = "yaml_stub_26_yaml_mapping_start_event_initialize" 

external yaml_stub_27_yaml_mapping_end_event_initialize : _ CI.fatptr -> int
  = "yaml_stub_27_yaml_mapping_end_event_initialize" 

type 'a result = 'a
type 'a return = 'a
type 'a fn =
 | Returns  : 'a CI.typ   -> 'a return fn
 | Function : 'a CI.typ * 'b fn  -> ('a -> 'b) fn
let map_result f x = f x
let returning t = Returns t
let (@->) f p = Function (f, p)
let foreign : type a b. string -> (a -> b) fn -> (a -> b) =
  fun name t -> match t, name with
| Function (CI.Pointer _, Returns (CI.Primitive CI.Int)),
  "yaml_mapping_end_event_initialize" ->
  (fun x1 ->
    let CI.CPointer x2 = x1 in
    yaml_stub_27_yaml_mapping_end_event_initialize x2)
| Function
    (CI.Pointer _,
     Function
       (CI.View {CI.ty = CI.Pointer _; write = x6; _},
        Function
          (CI.View {CI.ty = CI.Pointer _; write = x10; _},
           Function
             (CI.Primitive CI.Bool,
              Function
                (CI.View {CI.ty = CI.Primitive CI.Uint32_t; write = x15; _},
                 Returns (CI.Primitive CI.Int)))))),
  "yaml_mapping_start_event_initialize" ->
  (fun x3 x5 x9 x13 x14 ->
    let CI.CPointer x12 = x10 x9 in
    let CI.CPointer x8 = x6 x5 in
    let CI.CPointer x4 = x3 in
    let x7 = x8 in
    let x11 = x12 in
    let x16 = x15 x14 in
    yaml_stub_26_yaml_mapping_start_event_initialize x4 x7 x11 x13 x16)
| Function (CI.Pointer _, Returns (CI.Primitive CI.Int)),
  "yaml_sequence_end_event_initialize" ->
  (fun x17 ->
    let CI.CPointer x18 = x17 in
    yaml_stub_25_yaml_sequence_end_event_initialize x18)
| Function
    (CI.Pointer _,
     Function
       (CI.View {CI.ty = CI.Pointer _; write = x22; _},
        Function
          (CI.View {CI.ty = CI.Pointer _; write = x26; _},
           Function
             (CI.Primitive CI.Bool,
              Function
                (CI.View {CI.ty = CI.Primitive CI.Uint32_t; write = x31; _},
                 Returns (CI.Primitive CI.Int)))))),
  "yaml_sequence_start_event_initialize" ->
  (fun x19 x21 x25 x29 x30 ->
    let CI.CPointer x28 = x26 x25 in
    let CI.CPointer x24 = x22 x21 in
    let CI.CPointer x20 = x19 in
    let x23 = x24 in
    let x27 = x28 in
    let x32 = x31 x30 in
    yaml_stub_24_yaml_sequence_start_event_initialize x20 x23 x27 x29 x32)
| Function
    (CI.Pointer _,
     Function
       (CI.View {CI.ty = CI.Pointer _; write = x36; _},
        Function
          (CI.View {CI.ty = CI.Pointer _; write = x40; _},
           Function
             (CI.View {CI.ty = CI.Pointer _; write = x44; _},
              Function
                (CI.Primitive CI.Int,
                 Function
                   (CI.Primitive CI.Bool,
                    Function
                      (CI.Primitive CI.Bool,
                       Function
                         (CI.View
                            {CI.ty = CI.Primitive CI.Uint32_t; write = x51;
                             _},
                          Returns (CI.Primitive CI.Int))))))))),
  "yaml_scalar_event_initialize" ->
  (fun x33 x35 x39 x43 x47 x48 x49 x50 ->
    let CI.CPointer x46 = x44 x43 in
    let CI.CPointer x42 = x40 x39 in
    let CI.CPointer x38 = x36 x35 in
    let CI.CPointer x34 = x33 in
    let x37 = x38 in
    let x41 = x42 in
    let x45 = x46 in
    let x52 = x51 x50 in
    yaml_stub_23_yaml_scalar_event_initialize x34 x37 x41 x45 x47 x48 x49 x52)
| Function
    (CI.Pointer _,
     Function
       (CI.View {CI.ty = CI.Pointer _; write = x56; _},
        Returns (CI.Primitive CI.Int))),
  "yaml_alias_event_initialize" ->
  (fun x53 x55 ->
    let CI.CPointer x58 = x56 x55 in
    let CI.CPointer x54 = x53 in
    let x57 = x58 in yaml_stub_22_yaml_alias_event_initialize x54 x57)
| Function
    (CI.Pointer _,
     Function (CI.Primitive CI.Bool, Returns (CI.Primitive CI.Int))),
  "yaml_document_end_event_initialize" ->
  (fun x59 x61 ->
    let CI.CPointer x60 = x59 in
    yaml_stub_21_yaml_document_end_event_initialize x60 x61)
| Function
    (CI.Pointer _,
     Function
       (CI.Pointer _,
        Function
          (CI.Pointer _,
           Function
             (CI.Pointer _,
              Function (CI.Primitive CI.Bool, Returns (CI.Primitive CI.Int)))))),
  "yaml_document_start_event_initialize" ->
  (fun x62 x64 x66 x68 x70 ->
    let CI.CPointer x69 = x68 in
    let CI.CPointer x67 = x66 in
    let CI.CPointer x65 = x64 in
    let CI.CPointer x63 = x62 in
    yaml_stub_20_yaml_document_start_event_initialize x63 x65 x67 x69 x70)
| Function (CI.Pointer _, Returns (CI.Primitive CI.Int)),
  "yaml_stream_end_event_initialize" ->
  (fun x71 ->
    let CI.CPointer x72 = x71 in
    yaml_stub_19_yaml_stream_end_event_initialize x72)
| Function
    (CI.Pointer _,
     Function
       (CI.View {CI.ty = CI.Primitive CI.Uint32_t; write = x76; _},
        Returns (CI.Primitive CI.Int))),
  "yaml_stream_start_event_initialize" ->
  (fun x73 x75 ->
    let CI.CPointer x74 = x73 in
    let x77 = x76 x75 in
    yaml_stub_18_yaml_stream_start_event_initialize x74 x77)
| Function
    (CI.Pointer _, Function (CI.Pointer _, Returns (CI.Primitive CI.Int))),
  "yaml_emitter_emit" ->
  (fun x78 x80 ->
    let CI.CPointer x81 = x80 in
    let CI.CPointer x79 = x78 in yaml_stub_17_yaml_emitter_emit x79 x81)
| Function (CI.Pointer _, Returns (CI.Primitive CI.Int)),
  "yaml_emitter_flush" ->
  (fun x82 ->
    let CI.CPointer x83 = x82 in yaml_stub_16_yaml_emitter_flush x83)
| Function (CI.Pointer _, Function (CI.Primitive CI.Bool, Returns CI.Void)),
  "yaml_emitter_set_unicode" ->
  (fun x84 x86 ->
    let CI.CPointer x85 = x84 in
    yaml_stub_15_yaml_emitter_set_unicode x85 x86)
| Function (CI.Pointer _, Function (CI.Primitive CI.Int, Returns CI.Void)),
  "yaml_emitter_set_width" ->
  (fun x87 x89 ->
    let CI.CPointer x88 = x87 in yaml_stub_14_yaml_emitter_set_width x88 x89)
| Function (CI.Pointer _, Function (CI.Primitive CI.Int, Returns CI.Void)),
  "yaml_emitter_set_indent" ->
  (fun x90 x92 ->
    let CI.CPointer x91 = x90 in yaml_stub_13_yaml_emitter_set_indent x91 x92)
| Function (CI.Pointer _, Function (CI.Primitive CI.Bool, Returns CI.Void)),
  "yaml_emitter_set_canonical" ->
  (fun x93 x95 ->
    let CI.CPointer x94 = x93 in
    yaml_stub_12_yaml_emitter_set_canonical x94 x95)
| Function
    (CI.Pointer _,
     Function
       (CI.View {CI.ty = CI.Primitive CI.Uint32_t; write = x99; _},
        Returns CI.Void)),
  "yaml_emitter_set_encoding" ->
  (fun x96 x98 ->
    let CI.CPointer x97 = x96 in
    let x100 = x99 x98 in yaml_stub_11_yaml_emitter_set_encoding x97 x100)
| Function
    (CI.Pointer _,
     Function
       (CI.Pointer _,
        Function
          (CI.Primitive CI.Size_t, Function (CI.Pointer _, Returns CI.Void)))),
  "yaml_emitter_set_output_string" ->
  (fun x101 x103 x105 x106 ->
    let CI.CPointer x107 = x106 in
    let CI.CPointer x104 = x103 in
    let CI.CPointer x102 = x101 in
    yaml_stub_10_yaml_emitter_set_output_string x102 x104 x105 x107)
| Function (CI.Pointer _, Returns CI.Void), "yaml_emitter_delete" ->
  (fun x108 ->
    let CI.CPointer x109 = x108 in yaml_stub_9_yaml_emitter_delete x109)
| Function (CI.Pointer _, Returns (CI.Primitive CI.Int)),
  "yaml_emitter_initialize" ->
  (fun x110 ->
    let CI.CPointer x111 = x110 in yaml_stub_8_yaml_emitter_initialize x111)
| Function
    (CI.Pointer _, Function (CI.Pointer _, Returns (CI.Primitive CI.Int))),
  "yaml_parser_parse" ->
  (fun x112 x114 ->
    let CI.CPointer x115 = x114 in
    let CI.CPointer x113 = x112 in yaml_stub_7_yaml_parser_parse x113 x115)
| Function
    (CI.Pointer _,
     Function
       (CI.Pointer _, Function (CI.Primitive CI.Size_t, Returns CI.Void))),
  "yaml_parser_set_input_string" ->
  (fun x116 x118 x120 ->
    let CI.CPointer x119 = x118 in
    let CI.CPointer x117 = x116 in
    yaml_stub_6_yaml_parser_set_input_string x117 x119 x120)
| Function (CI.Pointer _, Returns CI.Void), "yaml_parser_delete" ->
  (fun x121 ->
    let CI.CPointer x122 = x121 in yaml_stub_5_yaml_parser_delete x122)
| Function (CI.Pointer _, Returns (CI.Primitive CI.Int)),
  "yaml_parser_initialize" ->
  (fun x123 ->
    let CI.CPointer x124 = x123 in yaml_stub_4_yaml_parser_initialize x124)
| Function (CI.Pointer _, Returns CI.Void), "yaml_token_delete" ->
  (fun x125 ->
    let CI.CPointer x126 = x125 in yaml_stub_3_yaml_token_delete x126)
| Function
    (CI.Pointer _,
     Function (CI.Pointer _, Function (CI.Pointer _, Returns CI.Void))),
  "yaml_get_version" ->
  (fun x127 x129 x131 ->
    let CI.CPointer x132 = x131 in
    let CI.CPointer x130 = x129 in
    let CI.CPointer x128 = x127 in
    yaml_stub_2_yaml_get_version x128 x130 x132)
| Function
    (CI.Void, Returns (CI.View {CI.ty = CI.Pointer x134; read = x135; _})),
  "yaml_get_version_string" ->
  (fun x133 ->
    x135 (CI.make_ptr x134 (yaml_stub_1_yaml_get_version_string x133)))
| _, s ->  Printf.ksprintf failwith "No match for %s" s


let foreign_value : type a. string -> a Ctypes.typ -> a Ctypes.ptr =
  fun name t -> match t, name with
| _, s ->  Printf.ksprintf failwith "No match for %s" s

