/**************************************************************************/
/*                                                                        */
/*  This file is part of Frama-C.                                         */
/*                                                                        */
/*  Copyright (C) 2007-2024                                               */
/*    CEA (Commissariat à l'énergie atomique et aux énergies              */
/*         alternatives)                                                  */
/*                                                                        */
/*  you can redistribute it and/or modify it under the terms of the GNU   */
/*  Lesser General Public License as published by the Free Software       */
/*  Foundation, version 2.1.                                              */
/*                                                                        */
/*  It is distributed in the hope that it will be useful,                 */
/*  but WITHOUT ANY WARRANTY; without even the implied warranty of        */
/*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         */
/*  GNU Lesser General Public License for more details.                   */
/*                                                                        */
/*  See the GNU Lesser General Public License version 2.1                 */
/*  for more details (enclosed in the file licenses/LGPLv2.1).            */
/*                                                                        */
/**************************************************************************/

#ifndef __FC_FEATURES_H
#define __FC_FEATURES_H

// *** Definitions to improve compatibility with GCC-specific built-ins
// and GNU-based code ***

#ifdef __FRAMAC__
#define __PRAGMA(x) _Pragma(#x)
#define __PRAGMA_PUSH(f) __PRAGMA(fc_stdlib(push,f))
#define __PUSH_FC_STDLIB __PRAGMA_PUSH(__FILE__)
#define __POP_FC_STDLIB __PRAGMA(fc_stdlib(pop))
#else
#define __PUSH_FC_STDLIB
#define __POP_FC_STDLIB
#endif

#ifdef	__cplusplus
# define __BEGIN_DECLS	extern "C" {
# define __END_DECLS	}
#else
# define __BEGIN_DECLS
# define __END_DECLS
#endif

#undef __LEAF
#define __LEAF
#undef __LEAF_ATTR
#define __LEAF_ATTR

#undef __THROW
#undef __THROWNL
#undef __NTH
#if defined __cplusplus
# define __THROW	throw ()
# define __THROWNL	throw ()
# define __NTH(fct) fct throw ()
#else
# define __THROW
# define __THROWNL
# define __NTH(fct)	fct
#endif

// Frama-C does not support GCC's __builtin_object_size.
// To improve compatibility with some codebases,
// we define it anyway, but it always returns -1, as if
// the compiler were unable to statically determine
// the object size (we only consider the cases where type
// is either 0 or 1).
// Note that for some built-ins, we force them to our definition,
// while others we leave unmodified if they exist
#undef __builtin_object_size
#define __builtin_object_size (ptr, type) ((size_t)-1)
#undef __bos
#define __bos(ptr) __builtin_object_size (ptr, 0)
#undef __bos0
#define __bos0(ptr) __builtin_object_size (ptr, 0)

#undef __warndecl
#define __warndecl(name, msg) extern void name (void)
#undef __warnattr
#define __warnattr(msg)
#undef __errordecl
#define __errordecl(name, msg) extern void name (void)

#undef __nonnull
#define __nonnull(args...)

#ifndef __attribute_deprecated__
# define __attribute_deprecated__ __attribute__((__deprecated__))
#endif
#ifndef __attribute_format_arg__
# define __attribute_format_arg__(x) __attribute__((__format_arg__(x)))
#endif
#ifndef __attribute_const__
# define __attribute_const__ __attribute__((__const__))
#endif
#ifndef __attribute_malloc__
# define __attribute_malloc__ __attribute__((__malloc__))
#endif
#ifndef __attribute_artificial__
# define __attribute_artificial__ /* Ignore */
#endif
#ifndef __attribute_pure__
# define __attribute_pure__ /* Ignore */
#endif

#undef __attribute_warn_unused_result__
#define __attribute_warn_unused_result__ /* empty */
#ifndef __wur
# define __wur /* Ignore */
#endif

#define restrict __restrict
#define __restrict__ __restrict

#define __USE_ISOC99	1

// When linking code including Frama-C's libc, we avoid adding 'extern'
// to some variable declarations. In this case, __FC_EXTERN is defined to
// the empty string. Otherwise, define it to 'extern'.
#ifndef __FC_EXTERN
#define __FC_EXTERN extern
#endif

// C11 §6.10.8.3 Conditional feature macros: Frama-C does not support complex.h
#ifndef __STDC_NO_COMPLEX__
#define __STDC_NO_COMPLEX__
#endif

/* end __FC_FEATURES_H */
#endif
