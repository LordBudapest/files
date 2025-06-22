[@@@warning "-9-27"]
include Ctypes
let lift x = x
open Ctypes_static

let rec field : type t a. t typ -> string -> a typ -> (a, t) field =
  fun s fname ftype -> match s, fname with
  | Struct ({ tag = "yaml_parser_s"; _} as s'), "problem_value" ->
    let f = {ftype; fname; foffset = 24} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "yaml_parser_s"; _} as s'), "problem_offset" ->
    let f = {ftype; fname; foffset = 16} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "yaml_parser_s"; _} as s'), "problem" ->
    let f = {ftype; fname; foffset = 8} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "yaml_parser_s"; _} as s'), "error" ->
    let f = {ftype; fname; foffset = 0} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "yaml_event_s"; _} as s'), "end_mark" ->
    let f = {ftype; fname; foffset = 80} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "yaml_event_s"; _} as s'), "start_mark" ->
    let f = {ftype; fname; foffset = 56} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "yaml_event_s"; _} as s'), "data" ->
    let f = {ftype; fname; foffset = 8} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "yaml_event_s"; _} as s'), "type" ->
    let f = {ftype; fname; foffset = 0} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Union ({ utag = "event_data_u"; _} as s'), "mapping_start" ->
    let f = {ftype; fname; foffset = 0} in 
    (s'.ufields <- BoxedField f :: s'.ufields; f)
  | Union ({ utag = "event_data_u"; _} as s'), "sequence_start" ->
    let f = {ftype; fname; foffset = 0} in 
    (s'.ufields <- BoxedField f :: s'.ufields; f)
  | Union ({ utag = "event_data_u"; _} as s'), "scalar" ->
    let f = {ftype; fname; foffset = 0} in 
    (s'.ufields <- BoxedField f :: s'.ufields; f)
  | Union ({ utag = "event_data_u"; _} as s'), "alias" ->
    let f = {ftype; fname; foffset = 0} in 
    (s'.ufields <- BoxedField f :: s'.ufields; f)
  | Union ({ utag = "event_data_u"; _} as s'), "document_end" ->
    let f = {ftype; fname; foffset = 0} in 
    (s'.ufields <- BoxedField f :: s'.ufields; f)
  | Union ({ utag = "event_data_u"; _} as s'), "document_start" ->
    let f = {ftype; fname; foffset = 0} in 
    (s'.ufields <- BoxedField f :: s'.ufields; f)
  | Union ({ utag = "event_data_u"; _} as s'), "stream_start" ->
    let f = {ftype; fname; foffset = 0} in 
    (s'.ufields <- BoxedField f :: s'.ufields; f)
  | Struct ({ tag = "event_mapping_start_s"; _} as s'), "style" ->
    let f = {ftype; fname; foffset = 20} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "event_mapping_start_s"; _} as s'), "implicit" ->
    let f = {ftype; fname; foffset = 16} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "event_mapping_start_s"; _} as s'), "tag" ->
    let f = {ftype; fname; foffset = 8} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "event_mapping_start_s"; _} as s'), "anchor" ->
    let f = {ftype; fname; foffset = 0} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "event_sequence_start_s"; _} as s'), "style" ->
    let f = {ftype; fname; foffset = 20} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "event_sequence_start_s"; _} as s'), "implicit" ->
    let f = {ftype; fname; foffset = 16} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "event_sequence_start_s"; _} as s'), "tag" ->
    let f = {ftype; fname; foffset = 8} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "event_sequence_start_s"; _} as s'), "anchor" ->
    let f = {ftype; fname; foffset = 0} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "event_scalar_s"; _} as s'), "style" ->
    let f = {ftype; fname; foffset = 40} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "event_scalar_s"; _} as s'), "quoted_implicit" ->
    let f = {ftype; fname; foffset = 36} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "event_scalar_s"; _} as s'), "plain_implicit" ->
    let f = {ftype; fname; foffset = 32} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "event_scalar_s"; _} as s'), "length" ->
    let f = {ftype; fname; foffset = 24} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "event_scalar_s"; _} as s'), "value" ->
    let f = {ftype; fname; foffset = 16} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "event_scalar_s"; _} as s'), "tag" ->
    let f = {ftype; fname; foffset = 8} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "event_scalar_s"; _} as s'), "anchor" ->
    let f = {ftype; fname; foffset = 0} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "event_alias_s"; _} as s'), "anchor" ->
    let f = {ftype; fname; foffset = 0} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "event_document_end_s"; _} as s'), "implicit" ->
    let f = {ftype; fname; foffset = 0} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "event_document_start_s"; _} as s'), "implicit" ->
    let f = {ftype; fname; foffset = 24} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "event_document_start_s"; _} as s'), "tag_directives" ->
    let f = {ftype; fname; foffset = 8} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "event_document_start_s"; _} as s'), "version_directive" ->
    let f = {ftype; fname; foffset = 0} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "event_tag_directives_s"; _} as s'), "end" ->
    let f = {ftype; fname; foffset = 8} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "event_tag_directives_s"; _} as s'), "start" ->
    let f = {ftype; fname; foffset = 0} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "event_stream_start_s"; _} as s'), "encoding" ->
    let f = {ftype; fname; foffset = 0} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "yaml_token_s"; _} as s'), "end_mark" ->
    let f = {ftype; fname; foffset = 56} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "yaml_token_s"; _} as s'), "start_mark" ->
    let f = {ftype; fname; foffset = 32} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "yaml_token_s"; _} as s'), "data" ->
    let f = {ftype; fname; foffset = 8} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "yaml_token_s"; _} as s'), "type" ->
    let f = {ftype; fname; foffset = 0} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Union ({ utag = "data_u"; _} as s'), "version_directive" ->
    let f = {ftype; fname; foffset = 0} in 
    (s'.ufields <- BoxedField f :: s'.ufields; f)
  | Union ({ utag = "data_u"; _} as s'), "scalar" ->
    let f = {ftype; fname; foffset = 0} in 
    (s'.ufields <- BoxedField f :: s'.ufields; f)
  | Union ({ utag = "data_u"; _} as s'), "anchor" ->
    let f = {ftype; fname; foffset = 0} in 
    (s'.ufields <- BoxedField f :: s'.ufields; f)
  | Union ({ utag = "data_u"; _} as s'), "alias" ->
    let f = {ftype; fname; foffset = 0} in 
    (s'.ufields <- BoxedField f :: s'.ufields; f)
  | Union ({ utag = "data_u"; _} as s'), "stream_start" ->
    let f = {ftype; fname; foffset = 0} in 
    (s'.ufields <- BoxedField f :: s'.ufields; f)
  | Struct ({ tag = "version_directive_s"; _} as s'), "minor" ->
    let f = {ftype; fname; foffset = 4} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "version_directive_s"; _} as s'), "major" ->
    let f = {ftype; fname; foffset = 0} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "scalar_s"; _} as s'), "style" ->
    let f = {ftype; fname; foffset = 16} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "scalar_s"; _} as s'), "length" ->
    let f = {ftype; fname; foffset = 8} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "scalar_s"; _} as s'), "value" ->
    let f = {ftype; fname; foffset = 0} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "anchor_s"; _} as s'), "value" ->
    let f = {ftype; fname; foffset = 0} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "alias_s"; _} as s'), "value" ->
    let f = {ftype; fname; foffset = 0} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "stream_start_s"; _} as s'), "encoding" ->
    let f = {ftype; fname; foffset = 0} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "yaml_mark_s"; _} as s'), "column" ->
    let f = {ftype; fname; foffset = 16} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "yaml_mark_s"; _} as s'), "line" ->
    let f = {ftype; fname; foffset = 8} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "yaml_mark_s"; _} as s'), "index" ->
    let f = {ftype; fname; foffset = 0} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "yaml_tag_directive_s"; _} as s'), "prefix" ->
    let f = {ftype; fname; foffset = 8} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "yaml_tag_directive_s"; _} as s'), "handle" ->
    let f = {ftype; fname; foffset = 0} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "yaml_version_directive_s"; _} as s'), "minor" ->
    let f = {ftype; fname; foffset = 4} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | Struct ({ tag = "yaml_version_directive_s"; _} as s'), "major" ->
    let f = {ftype; fname; foffset = 0} in 
    (s'.fields <- BoxedField f :: s'.fields; f)
  | View { ty; _ }, _ ->
    let { ftype; foffset; fname } = field ty fname ftype in
    { ftype; foffset; fname }
  | _ -> failwith ("Unexpected field "^ fname)

let rec seal : type a. a typ -> unit = function
  | Struct ({ tag = "yaml_emitter_s"; spec = Incomplete _; _ } as s') ->
    s'.spec <- Complete { size = 432; align = 8 }
  | Struct ({ tag = "yaml_parser_s"; spec = Incomplete _; _ } as s') ->
    s'.spec <- Complete { size = 480; align = 8 }
  | Struct ({ tag = "yaml_event_s"; spec = Incomplete _; _ } as s') ->
    s'.spec <- Complete { size = 104; align = 8 }
  | Union ({ utag = "event_data_u"; uspec = None; _ } as s') ->
    s'.uspec <- Some { size = 48; align = 8 }
  | Struct ({ tag = "event_mapping_start_s"; spec = Incomplete _; _ } as s') ->
    s'.spec <- Complete { size = 24; align = 8 }
  | Struct ({ tag = "event_sequence_start_s"; spec = Incomplete _; _ } as s') ->
    s'.spec <- Complete { size = 24; align = 8 }
  | Struct ({ tag = "event_scalar_s"; spec = Incomplete _; _ } as s') ->
    s'.spec <- Complete { size = 48; align = 8 }
  | Struct ({ tag = "event_alias_s"; spec = Incomplete _; _ } as s') ->
    s'.spec <- Complete { size = 8; align = 8 }
  | Struct ({ tag = "event_document_end_s"; spec = Incomplete _; _ } as s') ->
    s'.spec <- Complete { size = 4; align = 4 }
  | Struct ({ tag = "event_document_start_s"; spec = Incomplete _; _ } as s') ->
    s'.spec <- Complete { size = 32; align = 8 }
  | Struct ({ tag = "event_tag_directives_s"; spec = Incomplete _; _ } as s') ->
    s'.spec <- Complete { size = 16; align = 8 }
  | Struct ({ tag = "event_stream_start_s"; spec = Incomplete _; _ } as s') ->
    s'.spec <- Complete { size = 4; align = 4 }
  | Struct ({ tag = "yaml_token_s"; spec = Incomplete _; _ } as s') ->
    s'.spec <- Complete { size = 80; align = 8 }
  | Union ({ utag = "data_u"; uspec = None; _ } as s') ->
    s'.uspec <- Some { size = 24; align = 8 }
  | Struct ({ tag = "version_directive_s"; spec = Incomplete _; _ } as s') ->
    s'.spec <- Complete { size = 8; align = 4 }
  | Struct ({ tag = "scalar_s"; spec = Incomplete _; _ } as s') ->
    s'.spec <- Complete { size = 24; align = 8 }
  | Struct ({ tag = "anchor_s"; spec = Incomplete _; _ } as s') ->
    s'.spec <- Complete { size = 8; align = 8 }
  | Struct ({ tag = "alias_s"; spec = Incomplete _; _ } as s') ->
    s'.spec <- Complete { size = 8; align = 8 }
  | Struct ({ tag = "stream_start_s"; spec = Incomplete _; _ } as s') ->
    s'.spec <- Complete { size = 4; align = 4 }
  | Struct ({ tag = "yaml_mark_s"; spec = Incomplete _; _ } as s') ->
    s'.spec <- Complete { size = 24; align = 8 }
  | Struct ({ tag = "yaml_tag_directive_s"; spec = Incomplete _; _ } as s') ->
    s'.spec <- Complete { size = 16; align = 8 }
  | Struct ({ tag = "yaml_version_directive_s"; spec = Incomplete _; _ } as s') ->
    s'.spec <- Complete { size = 8; align = 4 }
  | Struct { tag; spec = Complete _; _ } ->
    raise (ModifyingSealedType tag)
  | Union { utag; uspec = Some _; _ } ->
    raise (ModifyingSealedType utag)
  | View { ty; _ } -> seal ty
  | _ ->
    raise (Unsupported "Sealing a non-structured type")

type 'a const = 'a
let constant (type t) name (t : t typ) : t = match t, name with
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_MAPPING_END_EVENT" ->
    10L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_MAPPING_START_EVENT" ->
    9L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_SEQUENCE_END_EVENT" ->
    8L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_SEQUENCE_START_EVENT" ->
    7L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_SCALAR_EVENT" ->
    6L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_ALIAS_EVENT" ->
    5L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_DOCUMENT_END_EVENT" ->
    4L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_DOCUMENT_START_EVENT" ->
    3L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_STREAM_END_EVENT" ->
    2L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_STREAM_START_EVENT" ->
    1L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_NO_EVENT" ->
    0L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_SCALAR_TOKEN" ->
    21L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_TAG_TOKEN" ->
    20L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_ALIAS_TOKEN" ->
    18L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_VALUE_TOKEN" ->
    17L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_KEY_TOKEN" ->
    16L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_FLOW_ENTRY_TOKEN" ->
    15L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_BLOCK_ENTRY_TOKEN" ->
    14L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_FLOW_MAPPING_END_TOKEN" ->
    13L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_FLOW_MAPPING_START_TOKEN" ->
    12L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_FLOW_SEQUENCE_END_TOKEN" ->
    11L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_FLOW_SEQUENCE_START_TOKEN" ->
    10L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_BLOCK_END_TOKEN" ->
    9L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_BLOCK_MAPPING_START_TOKEN" ->
    8L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_BLOCK_SEQUENCE_START_TOKEN" ->
    7L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_DOCUMENT_END_TOKEN" ->
    6L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_DOCUMENT_START_TOKEN" ->
    5L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_TAG_DIRECTIVE_TOKEN" ->
    4L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_VERSION_DIRECTIVE_TOKEN" ->
    3L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_STREAM_END_TOKEN" ->
    2L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_STREAM_START_TOKEN" ->
    1L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_NO_TOKEN" ->
    0L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_FLOW_MAPPING_STYLE" ->
    2L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_BLOCK_MAPPING_STYLE" ->
    1L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_ANY_MAPPING_STYLE" ->
    0L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_FLOW_SEQUENCE_STYLE" ->
    2L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_BLOCK_SEQUENCE_STYLE" ->
    1L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_ANY_SEQUENCE_STYLE" ->
    0L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_FOLDED_SCALAR_STYLE" ->
    5L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_LITERAL_SCALAR_STYLE" ->
    4L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_DOUBLE_QUOTED_SCALAR_STYLE" ->
    3L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_SINGLE_QUOTED_SCALAR_STYLE" ->
    2L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_PLAIN_SCALAR_STYLE" ->
    1L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_ANY_SCALAR_STYLE" ->
    0L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_EMITTER_ERROR" ->
    7L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_WRITER_ERROR" ->
    6L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_COMPOSER_ERROR" ->
    5L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_PARSER_ERROR" ->
    4L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_SCANNER_ERROR" ->
    3L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_READER_ERROR" ->
    2L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_MEMORY_ERROR" ->
    1L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_NO_ERROR" ->
    0L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_UTF16BE_ENCODING" ->
    3L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_UTF16LE_ENCODING" ->
    2L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_UTF8_ENCODING" ->
    1L
  | Ctypes_static.Primitive Cstubs_internals.Int64_t, "YAML_ANY_ENCODING" ->
    0L
  | _, s -> failwith ("unmatched constant: "^ s)

let enum (type a) name ?typedef ?unexpected (alist : (a * int64) list) =
  match name with
  | "yaml_event_type_t" -> 
    Cstubs_internals.build_enum_type "yaml_event_type_t" Ctypes_static.Uint32 ?typedef ?unexpected alist
  | "yaml_token_type_t" -> 
    Cstubs_internals.build_enum_type "yaml_token_type_t" Ctypes_static.Uint32 ?typedef ?unexpected alist
  | "yaml_mapping_style_t" -> 
    Cstubs_internals.build_enum_type "yaml_mapping_style_t" Ctypes_static.Uint32 ?typedef ?unexpected alist
  | "yaml_sequence_style_t" -> 
    Cstubs_internals.build_enum_type "yaml_sequence_style_t" Ctypes_static.Uint32 ?typedef ?unexpected alist
  | "yaml_scalar_style_t" -> 
    Cstubs_internals.build_enum_type "yaml_scalar_style_t" Ctypes_static.Uint32 ?typedef ?unexpected alist
  | "yaml_error_type_t" -> 
    Cstubs_internals.build_enum_type "yaml_error_type_t" Ctypes_static.Uint32 ?typedef ?unexpected alist
  | "yaml_encoding_t" -> 
    Cstubs_internals.build_enum_type "yaml_encoding_t" Ctypes_static.Uint32 ?typedef ?unexpected alist
  | s ->
    failwith ("unmatched enum: "^ s)
