(* This module was generated automatically by code in Makefile and machdep-ml.c *)
type mach = {
  version_major: int;     (* Major version number *)
  version_minor: int;     (* Minor version number *)
  version: string;        (* gcc version string *)
  underscore_name: bool;  (* If assembly names have leading underscore *)
  sizeof_short: int;      (* Size of "short" *)
  sizeof_int: int;        (* Size of "int" *)
  sizeof_bool: int;       (* Size of "_Bool" *)
  sizeof_long: int ;      (* Size of "long" *)
  sizeof_longlong: int;   (* Size of "long long" *)
  sizeof_ptr: int;        (* Size of pointers *)
  sizeof_float: int;      (* Size of "float" *)
  sizeof_float32x: int;   (* Size of "_Float32x" *)
  sizeof_float64x: int;   (* Size of "_Float64x" *)
  sizeof_double: int;     (* Size of "double" *)
  sizeof_longdouble: int; (* Size of "long double" *)
  sizeof_float128: int;   (* Size of "_Float128" *)
  sizeof_floatcomplex: int;      (* Size of "float _Complex" *)
  sizeof_doublecomplex: int;     (* Size of "double _Complex" *)
  sizeof_longdoublecomplex: int; (* Size of "long double _Complex" *)
  sizeof_float128complex: int; (* Size of "_Float128 _Complex" *)
  sizeof_void: int;       (* Size of "void" *)
  sizeof_fun: int;        (* Size of function *)
  size_t: string;         (* Type of "sizeof(T)" *)
  wchar_t: string;        (* Type of "wchar_t" *)
  char16_t: string;       (* Type of "char16_t" *)
  char32_t: string;       (* Type of "char32_t" *)
  alignof_short: int;     (* Alignment of "short" *)
  alignof_int: int;       (* Alignment of "int" *)
  alignof_bool: int;      (* Alignment of "_Bool" *)
  alignof_long: int;      (* Alignment of "long" *)
  alignof_longlong: int;  (* Alignment of "long long" *)
  alignof_ptr: int;       (* Alignment of pointers *)
  alignof_enum: int;      (* Alignment of enum types *)
  alignof_float: int;     (* Alignment of "float" *)
  alignof_float32x: int;  (* Alignment of "_Float32x" *)
  alignof_float64x: int;  (* Alignment of "_Float64x" *)
  alignof_double: int;    (* Alignment of "double" *)
  alignof_longdouble: int;  (* Alignment of "long double" *)
  alignof_float128: int;  (* Alignment of "_Float128" *)
  alignof_floatcomplex: int;     (* Alignment of "float _Complex" *)
  alignof_doublecomplex: int;    (* Alignment of "double _Complex" *)
  alignof_longdoublecomplex: int;  (* Alignment of "long double _Complex" *)
  alignof_float128complex: int;  (* Alignment of "_Float128 _Complex" *)
  alignof_str: int;       (* Alignment of strings *)
  alignof_fun: int;       (* Alignment of function *)
  alignof_aligned: int;   (* Alignment of anything with the "aligned" attribute *)
  char_is_unsigned: bool; (* Whether "char" is unsigned *)
  little_endian: bool; (* whether the machine is little endian *)
  __thread_is_keyword: bool; (* whether __thread is a keyword *)
  __builtin_va_list: bool; (* whether __builtin_va_list is builtin (gccism) *)
}

let gcc = {
#ext machdep
#endext
}

let gcc32 =
#include "machdep32"

let gcc64 =
#include "machdep64"

let theMachine : mach ref = ref gcc
