## 2.0.6
* Optimize `Pretty.text` (#169, #177).
* Remove dynlink and findlib dependencies from library (#170).

## 2.0.5
* Add enumerator attributes (#172).
* Generate 32bit and 64bit `Machdep` if possible (#173).

## 2.0.4
* Add `Return` statement expression location (#167).
* Add `availability` attribute support (#168, #171).
* Remove unused `Libmaincil` module (#165).
* Fix some synthetic locations (#166, #167).

## 2.0.3
* Add `asm inline` parsing (#151).
* Ignore top level qualifiers in `__builtin_types_compatible_p` (#157).
* Add attribute `goblint_cil_nested` to local variables in inner scopes (#155).
* Expose `Cil.typeSigAddAttrs`.
* Add option to suppress `long double` warnings (#136, #156).
* Fix syntactic search (#147).

## 2.0.2
* Rename `Rmtmps` to `RmUnused` (#135).
* Add option to add return statement to `noreturn` functions (#129).
* Fix empty `if`s being removed (#140).
* Fix `_Float128` support (#118, #119).
* Fix C11 `_Alignas` computation (#130).
* Fix renaming and merging of `inline` functions based on C standard (#120, #124).
* Fix `Pretty` not resetting all global state between calls (#133, #134).
* Fix `fundec` location in merger (#139).
* Fix `cilly` patcher (#128).
* Disable basename by default in parser.

## 2.0.1
* Fix scope of enum definition in return type (#112, #113).
* Fix signed integer left shift constant folding overflow (#122, #123).
* Fix `fitsInInt` for booleans (#111).
* Mark more loop statement locations synthetic (#125).
* Optimize integer truncation (#115).
* Fix FrontC and Cabs2cil partial application (#116).
* Fix external usage of `freshLabel` (#121).

## 2.0.0
* Wrap library into `GoblintCil` module (#107).
* Remove all MSVC support (#52, #88).
* Port entire build process from configure/make to dune (#104).
* Add C11 `_Generic` support (#48).
* Add C11 `_Noreturn` support (#58).
* Add C11 `_Static_assert` support (#62).
* Add C11 `_Alignof` support (#66).
* Add C11 `_Alignas` support (#93, #108).
* Add partial C11 `_Atomic` support (#61).
* Add `_Float32`, `_Float64`, `_Float32x` and `_Float64x` type support (#8, #60).
* Add Universal Character Names, `char16_t` and `char32_t` type support (#80).
* Change locations to location spans and add additional expression locations (#51).
* Add synthetic marking for CIL-inserted statement locations (#98).
* Expose list of files from line control directives (#73).
* Add parsed location transformation hook (#89).
* Use Zarith for integer constants (#47, #53).
* Fix constant folding overflows (#59).
* Add option to disable constant branch removal (#103).
* Add standalone expression parsing and checking (#97, #96).
* Improve inline function merging (#72, #85, #84, #86).
* Fix some attribute parsing cases (#71, #75, #76, #77).
* Fix global NaN initializers (#78, #79).
* Fix `cilly` binary installation (#99, #100, #102).
* Remove batteries dependency to support OCaml 5 (#106).

## Older versions

18 November 2021: goblint-cil-1.8.2

    * Add columns to locations.
    * Add support for __int128, __int128_t and __uint128_t.

18 May 2021: goblint-cil-1.8.0

    * Proper support for C99, (#9) and VLAs in particular (#5, #7)
    * It uses [Zarith][zarith] instead of the deprecated [Num][num]
    * Support for more recent OCaml versions (≥ 4.06)
    * Large integer constants that do not fit in an OCaml `int` are represented as a `string` instead of getting truncated
    * Syntactic search extension (#21)
    * Some warnings were made optional
    * Unmaintained extensions (#30) were removed
    * Many bug fixes
    
24 July 2013: cil-1.7.3

    * Fix installation of CIL library.
    * Fix machine-independant flags in cilly (eg. -fPIC).

27 June 2013: cil-1.7.2

    * Fix building and installation of CIL library (#138).

18 June 2013: cil-1.7.1

    Improve build system, including:
    * Fix make uninstall.
    * Add a FORCE_PERL_PREFIX to ease installation in home directory.
    * Detect OCaml native compilers automatically.
    * Switch to ocamlbuild.
    * Infer files to install for ocamlfind, and generate missing
      interfaces automatically.
    * Cleanup autoconf scripts.

4 June 2013: cil-1.7.0

    New features:
    * Support for C99 flexible array members.
    * Support for GCC’s “case range” extension (--useCaseRange).
    * Add a “regtest” make target to run regression tests.
    * cilly is now installed as a proper perl script.

    Bug fixes:

    * Preserve cases in switch block with attribute (thanks to Edmund
      Grimley-Evans).
    * Fix computation of __builtin_type_compatible_p.
    * Do not hardcode size_t as unsigned for offsetof.
    * Allow cast of functions to function pointers.
    * Avoid name clashes for introduced __constr_expr.
    * Handle trailing empty initializers inside arrays.
    * Use correct integer kind for zero enum initializer.
    * Allow symlinks to cilly (#120).
    * Fix log message going to the wrong channel.
    * Cleanup code, documentation and build system.

22 March 2013: cil-1.6.0

    New features:

    * Support for static local variables.
    * Support for GCC’s “computed gotos” (or “labels as values”).
    * See http://article.gmane.org/gmane.comp.compilers.cil.user/744/
      for more details.

    Bug fixes:

    * cilly: use -include only on first preprocessor run.
    * Allow large arrays (#3604915).
    * Fix caller list in EasyCallGraph.
    * Use actual prime numbers in function checksum.
    * Make breakString tail recursive.
    * Fix parsing of char_signed with --envmachine (thanks to Haihao
      Shen).
    * Fix MSVC build parameters for MSys (thanks to Jim Grundy).
    * Various other fixes to Makefiles.

14 July 2012: cil-1.5.1

    New features:

    * Native versions of OCaml tool (thanks to Oliver Schwahn).

    Bug fixes:

    * Fixed bug in which pointer difference operations were
      incorrectly typed (#3538514, thanks to Jim Grundy).
    * Merger: fix integer overflow in pragma.
    * Fix various regression tests and doc generation.

* 14 June 2012: cil-1.5.0

    New features:

    * Incompatible change: introduce a Question variant for the
      Cil.exp type (thanks to Elnatan Reisner). Enabled by the flag
      --useLogicalOperators.
    * Add support for new GCC attributes and builtins (thanks to Ben
      Liblit).
    * Remove trivial gotos and associated labels in useless variables
      elimination.

    Bug fixes:

    * Preserve const in function parameters.
    * Handle array initialization of arbitrary length.
    * Allow single character output file names in Cilly (#3499163).
    * Mitigate stack-overflow issues for large case-range in switch
      statements (#3480417).
    * Explicit casting for return value of va_arg (#3463364).
    * Avoid spurious warnings in loadBinaryFile (thanks to Jesse
      Draper).
    * Add -WX flag to CFLAGS when using the MSVC compiler (thanks to
      Jim Grundy).
    * Fix name collisions in global scope (#3532283, thanks to Ed
      Schwartz).
    * Fix types in switch statements (#3481303, thanks to Boris
      Yakobowski).
    * Minor build improvements (MacOS portability).

4 November 2011: cil-1.4.0

    * Includes many bug fixes and a cleanup of obsolete files and Makefile
      rules. Also fix support for OCaml 3.12, add support of some gcc
      builtins.

    * 28 May 2009: Improved 64-bit int support (large constants no longer
        cause a CIL failure). There’s a new cilint type that should be used
        to handle integer C values - cilint is essentially a big_int so will
        be able to handle future expansion. To get the value represented by
        a CInt64(n, ik, _) constant, call mkCilint ik n — this will give you
        the correct value for unsigned 64-bit C constants stored in a signed
        OCaml int64.

        In a related move, the already deprecated unbox_int_exp,
        box_int_to_exp and cil_to_ocaml_int functions have been removed. And
        convertInts, isInteger, truncateInteger64 are now deprecated and
        will be removed in a future release.

24 April 2009: cil-1.3.7

    Includes change below and other miscellaneous bug fixes.

    * 22 April 2009: ocamlbuild make target added (thanks to Gabriel
        Kerneis).

    * 21 April 2009: __builtin_va_arg_pack support: calls to this builtin
        need to remain as the last argument to a function call. So to
        prevent CIL’s usual rewriting, we internally represent calls to
        __builtin_va_arg_pack as sizeof(__builtin_va_arg_pack)…

    * 21 April 2009: _Bool support, thanks to patches from Christopher
        Ian Stern (Sourceforge bug #1497763).

        This leads to the addition of a new integer kind, IBool which you
        might have to handle in some of your patterns. Note also, for those
        not familiar with _Bool, that casts/conversion to _Bool give the
        value 1 for non-zero values, and 0 otherwise (i.e. (_Bool)x behaves
        like x \!= 0).

    * 20 April 2009: Update builtin support, including __builtin_strlen
        (Sourceforge bug #1873374), __builtin_choose_expr,
        __builtin_types_compatible_p (Sourceforge bug #1852730). For the
        latter two, we evaluate them in CIL (in line with the earlier
        handling of __builtin_constant_p).

        Note that as part of these fixes, mkAddrOf no longer replaces &a[0]
        with a, as this can break typeof (Sourceforge bug #1852730 involves
        a use of typeof(&a[0])).

        Typo fixes from Gabriel Kerneis.

    * 17 April 2009: Update extern inline handling to match current gcc
        versions (Sourceforge bug #1689503): the actual definition is always
        preferred over the extern inline one. CIL handles this by
        suppressing the extern inline definition (replacing it by a
        declaration) if it sees a real definition. However, if no real
        definition exists, you will get a CIL varinfo for an inline function
        with storage class extern…

        You can revert to CIL’s previous handling of extern inline by
        setting oldstyleExternInline to true.

    * 16 April 2009: Add allStmts function to cfg.ml, and remove public
        visibility of nodeList and numNodes (Sourceforge bug #1819746).

    * 15 April 2009: Fix Sourceforge bugs #2265867 (bad constant folding
        of unary minus), #2134504 (truncation warning), #1811676 (typo).

    * 13 April 2009: Recognize gcc’s -m32 and -m64 flags that select
        between 32 and 64 bit targets.

    * 8 April 2009: Rename libcil.a to libcil.o (ocaml 3.11 forces us to
        use the correct extension).

    * 7 April 2009: Add LLVM bitcode generator (partial C support, target
        32-bit x86 only).

    * 7 April 2009: Support enums over greater-than-int types (gcc
        extension).

    * 19 September 2008: Remove excess newlines in warnings and errors.

    * 30 August 2008: Added an install-findlib Make target for ocamlfind.
        Thanks to ploc for the patch.

    * 28 May 2008: Cross-compilation support: ability to select a machine
        model specified in an environment variable (CIL_MACHINE). See for
        details.

    * 2 July 2008: Add a --gcc option to cilly to tell it to use a
        particular version of gcc (useful for cross-compilation
        environments).

    * 14 February 2008: Fixed a bug in temporary file creation. Thanks to
        J. Aaron Pendergrass for the patch.

    * 30 November 2007: Fixed a bug in assignment to lvalues that depend
        on themselves.

    * 4 April 2007: Benjamin Monate fixed a bug in Cfg for empty loop bodies.

    * 29 March 2007: Polyvios Pratikakis fixed a bug in
        src/ext/pta/uref.ml.

    * 15 March 2007: Added support for __attribute__((aligned)) and
        __attribute__((packed)).

    * 7 March 2007: typeOf(StartOf _) now preserves the attributes of the
        array.

    * 22 February 2007: Added an inliner (ext/inliner.ml)

    * 21 February 2007: We now constant-fold bitfield expressions. Thanks
        to Virgile Prevosto for the patch.

    * 13 February 2007: gcc preprocessor arguments passed using -Wp are
        now used only during initial preproccessing, not for the
        preprocessing after CIL. This fixes problems in the Linux makefiles
        with dependency generation.

    * 6 February 2007: Fixed parseInt for non-32 bit architectures.

5 February 2007: cil-1.3.6

    * 2 February 2007: Improved the way CIL gets configured for the
        actual definitions of size_t and wchar_t.

    * 1 February 2007: Fixed the parser to support the unused attribute
        on labels. For now, we just drop this attribute since Rmtmps will
        remove unused labels anyways. Thanks to Peter Hawkins for the patch.

    * 18 January 2007: Require the destination of a Call to have the same
        type as the function’s return type, even if it means inserting a
        temporary. To get the old behavior, set Cabs2cil.doCollapseCallCast
        to true as described in .

    * 17 January 2007: Fix for __builtin_offsetof when the field name is
        also a typedef name.

    * 17 January 2007: Fixed loadBinaryFile (Sourceforge bug #1548894).
        You should only use loadBinaryFile if no other code has been
        loaded or generated in the current CIL process, since
        loadBinaryFile needs to load some global state.

    * 18 December 2006: The --stats flag now gets the CPU speed at
        runtime rather than configure-time, so binary executables can be
        moved to different computers.

    * 14 December 2006: Fixed various warnings and errors on 64-bit
        architectures.

    * 26 November 2006: Christoph Spiel added “--no” options to many of
        CIL’s command-line flags.

    * 21 November 2006: Merged gccBuiltins and msvcBuiltins into a single
        table builtinFunctions that is initialized by initCIL.

    * 28 October 2006: Added the field vdescr to the varinfo struct to
        remember what value is stored in certain CIL-introduced
        temporary variables.  For example, if CIL adds a temporary to
        store the result of foo(a,b), then the description will be
        “foo(a,b)”. The new printer descriptiveCilPrinter will
        substitute descriptions for the names of temporaries. The result
        is not necessarily valid C, but it may let you produce more
        helpful error messages in your analysis tools: “The value
        foo(a,b) may be tainted” vs. “The value __cil_tmp29 may be
        tainted.”

    * 27 October 2006: Fixed a bug with duplicate entries in the
        statement list of Switch nodes, and forbade duplicate default cases.

    * 12 October 2006: Added a new function expToAttrParam that attempts
        to convert an expression into a attribute parameter.

    * 12 October 2006: Added an attribute with the length of the array,
        when array types of formal arguments are converted to pointer types.

    * 29 September 2006: Benjamin Monate fixed a bug in compound local
        initializers that was causing duplicate code to be added.

    * 9 August 2006: Changed the patcher to print “#line nnn” directives
        instead of “# nnn”.

    * 6 August 2006: Joseph Koshy patched ./configure for FreeBSD on
        amd64.

    * 27 July 2006: CIL files now include the prototypes of builtin
        functions (such as __builtin_va_arg). This preserves the invariant
        that every function call has a corresponding function or function
        prototype in the file. However, the prototypes of builtins are not
        printed in the output files.

    * 23 July 2006: Incorporated some fixes for the constant folding for
        lvalues, and fixed grammatical errors. Thanks to Christian Stork.

    * 23 July 2006: Changed the way ./configure works. We now generate
        the file Makefile.features to record the configuration features.
        This is because autoconf does not work properly with multiline
        substitutions.

    * 21 July 2006: Cleaned up the printing of some Lvals. Things that
        were printed as “(*i)” before are now printed simply as “*i” (no
        parentheses). However, this means that when you use pLval to print
        lvalues inside expressions, you must take care about parentheses
        yourself. Thanks to Benjamin Monate for pointing this out.

    * 21 July 2006: Added new hooks to the Usedef and
        Dataflow.BackwardsTransfer APIs. Code that uses these will need to
        be changed slightly. Also, updated the Cfg code to handle noreturn
        functions.

    * 17 July 2006: Fix parsing of attributes on bitfields and empty
        attribute lists. Thanks to Peter Hawkins.

    * 10 July 2006: Fix Makefile problem for FreeBSD. Thanks to Joseph
        Koshy for the patch.

    * 25 June 2006: Extended the inline assembly to support named
        arguments, as added in gcc 3.0. This changes the types of the input
        and output lists from “(string * lval) list” to
        “(string option * string * lval) list”. Some existing code will need
        to be modified accordingly.

    * 11 June 2006: Removed the function Cil.foldLeftCompoundAll. Use
        instead foldLeftCompound with ~implicit:true.

    * 9 June 2006: Extended the definition of the cilVisitor for
        initializers to pass more information around. This might result in
        backward incompatibilities with code that uses the visitor for
        initializers.

    * 2 June 2006: Added --commPrintLnSparse flag.

    * 1 June 2006: Christian Stork provided some fixes for the handling
        of variable argument functions.

    * 1 June 2006: Added support for x86 performance counters on 64-bit
        processors. Thanks to tbergen for the patch.

    * 23 May 2006: Benjamin Monate fixed a lexer bug when a preprocessed
        file is missing a final newline.

    * 23 May 2006: Fix for typeof(e) when e has type void.

20 May 2006: cil-1.3.5

    * 19 May 2006: Makefile.cil.in/Makefile.cil have been renamed
        Makefile.in/Makefile. And maincil.ml has been renamed main.ml.

    * 18 May 2006: Added a new module Cfg to compute the control-flow
        graph.  Unlike the older computeCFGInfo, the new version does
        not modify the code.

    * 18 May 2006: Added several new analyses: reaching definitions,
        available expressions, liveness analysis, and dead code
        elimination.  See .

    * 2 May 2006: Added a flag --noInsertImplicitCasts. When this flag
      is used, CIL code will only include casts inserted by the
      programmer.  Implicit coercions are not changed to explicit casts.

    * 16 April 2006: Minor improvements to the --stats flag (). We now
        use Pentium performance counters by default, if your processor
        supports them.

    * 10 April 2006: Extended machdep.c to support microcontroller
        compilers where the struct alignment of integer types does not
        match the size of the type. Thanks to Nathan Cooprider for the
        patch.

    * 6 April 2006: Fix for global initializers of unions when the union
        field being initialized is not the first one, and for missing
        initializers of unions when the first field is not the largest
        field.

    * 6 April 2006: Fix for bitfields in the SFI module.

    * 6 April 2006: Various fixes for gcc attributes. packed, section,
        and always_inline attributes are now parsed correctly. Also
        fixed printing of attributes on enum types.

    * 30 March 2006: Fix for rmtemps.ml, which deletes unused inline
        functions. When in gcc mode CIL now leaves all inline functions
        in place, since gcc treats these as externally visible.

    * 3 March 2006: Assume inline assembly instructions can fall through
        for the purposes of adding return statements. Thanks to Nathan
          Cooprider for the patch.

    * 27 February 2006: Fix for extern inline functions when the output
        of CIL is fed back into CIL.

    * 30 January 2006: Fix parsing of switch without braces.

    * 30 January 2006: Allow ‘$’ to appear in identifiers.

    * 13 January 2006: Added support for gcc’s alias attribute on
        functions. See , item 8.

    * 9 December 2005: Christoph Spiel fixed the Golf and Olf modules so
        that Golf can be used with the points-to analysis. He also added
        performance fixes and cleaned up the documentation.

    * 1 December 2005: Major rewrite of the ext/callgraph module.

    * 1 December 2005: Preserve enumeration constants in CIL. Default is
        the old behavior to replace them with integers.

    * 30 November 2005: Added support for many GCC __builtin functions.

    * 30 November 2005: Added the EXTRAFEATURES configure option, making
        it easier to add Features to the build process.

    * 23 November 2005: In MSVC mode do not remove any locals whose name
        appears as a substring in an inline assembly.

    * 23 November 2005: Do not add a return to functions that have the
        noreturn attribute.

22 November 2005: cil-1.3.4

    * 21 November 2005: Performance and correctness fixes for the
        Points-to Analysis module. Thanks to Christoph Spiel for the
        patches.

    * 5 October 2005: CIL now builds on SPARC/Solaris. Thanks to Nick
        Petroni and Remco van Engelen for the patches.

    * 26 September 2005: CIL no longer uses the ‘-I-’ flag by default
        when preprocessing with gcc.

    * 24 August 2005: Added a command-line option “--forceRLArgEval”
        that forces function arguments to be evaluated right-to-left.
        This is the default behavior in unoptimized gcc and MSVC, but
        the order of evaluation is undefined when using optimizations,
        unless you apply this CIL transformation. This flag does not
        affect the order of evaluation of e.g. binary operators, which
        remains undefined. Thanks to Nathan Cooprider for the patch.

    * 9 August 2005: Fixed merging when there are more than 20 input
        files.

    * 3 August 2005: When merging, it is now an error to declare the
        same global variable twice with different initializers.

    * 27 July 2005: Fixed bug in transparent unions.

    * 27 July 2005: Fixed bug in collectInitializer. Thanks to Benjamin
        Monate for the patch.

    * 26 July 2005: Better support for extended inline assembly in gcc.

    * 26 July 2005: Added many more gcc __builtin* functions to CIL.
        Most are treated as Call instructions, but a few are translated
        into expressions so that they can be used in global
        initializers. For example, “__builtin_offsetof(t, field)” is
        rewritten as “&((t*)0)->field”, the traditional way of
        calculating an offset.

    * 18 July 2005: Fixed bug in the constant folding of shifts when the
        second argument was negative or too large.

    * 18 July 2005: Fixed bug where casts were not always inserted in
        function calls.

    * 10 June 2005: Fixed bug in the code that makes implicit returns
        explicit. We weren’t handling switch blocks correctly.

1 June 2005: cil-1.3.3

    * 31 May 2005: Fixed handling of noreturn attribute for function
        pointers.

    * 30 May 2005: Fixed bugs in the handling of constructors in gcc.

    * 30 May 2005: Fixed bugs in the generation of global variable IDs.

    * 27 May 2005: Reimplemented the translation of function calls so
        that we can intercept some builtins. This is important for the
        uses of __builtin_constant_p in constants.

    * 27 May 2005: Export the plainCilPrinter, for debugging.

    * 27 May 2005: Fixed bug with printing of const attribute for
        arrays.

    * 27 May 2005: Fixed bug in generation of type signatures. Now they
        should not contain expressions anymore, so you can use
        structural equality. This used to lead to Out_of_Memory
        exceptions.

    * 27 May 2005: Fixed bug in type comparisons using TBuiltin_va_list.

    * 27 May 2005: Improved the constant folding in array lengths and
        case expressions.

    * 27 May 2005: Added the __builtin_frame_address to the set of gcc
        builtins.

    * 27 May 2005: Added the CIL project to SourceForge.

    * 23 April 2005: The cattr field was not visited.

    * 6 March 2005: Debian packaging support

    * 16 February 2005: Merger fixes.

    * 11 February 2005: Fixed a bug in --dopartial. Thanks to Nathan
        Cooprider for this fix.

    * 31 January 2005: Make sure the input file is closed even if a
        parsing error is encountered.

11 January 2005: cil-1.3.2

    * 11 January 2005: Fixed printing of integer constants whose integer
        kind is shorter than an int.

    * 11 January 2005: Added checks for negative size arrays and arrays
        too big.

    * 10 January 2005: Added support for GCC attribute “volatile” for
        tunctions (as a synonim for noreturn).

    * 10 January 2005: Improved the comparison of array sizes when
        comparing array types.

    * 10 January 2005: Fixed handling of shell metacharacters in the
        cilly command lione.

    * 10 January 2005: Fixed dropping of cast in initialization of local
        variable with the result of a function call.

    * 10 January 2005: Fixed some structural comparisons that were
        broken in the Ocaml 3.08.

    * 10 January 2005: Fixed the unrollType function to not forget
        attributes.

    * 10 January 2005: Better keeping track of locations of function
        prototypes and definitions.

    * 10 January 2005: Fixed bug with the expansion of enumeration
        constants in attributes.

    * 18 October 2004: Fixed a bug in cabsvisit.ml. CIl would wrap a
        BLOCK around a single atom unnecessarily.

7 August 2004: cil-1.3.1

    * 4 August 2004: Fixed a bug in splitting of structs using
        *-dosimplify

    * 29 July 2004: Minor changes to the type typeSig (type signatures)
        to ensure that they do not contain types, so that you can do
        structural comparison without danger of nontermination.

    * 28 July 2004: Ocaml version 3.08 is required. Numerous small
        changes while porting to Ocaml 3.08.

7 July 2004: cil-1.2.6

    * 2 July 2004: Character constants such as ’c’ should have type int,
        not char. Added a utility function Cil.charConstToInt that
        sign-extends chars greater than 128, if needed.

    * 2 July 2004: Fixed a bug that was casting values to int before
        applying the logical negation operator !. This caused problems
        for floats, and for integer types bigger than int.

    * 13 June 2004: Added the field sallstmts to a function description,
        to hold all statements in the function.

    * 13 June 2004: Added new extensions for data flow analyses, and for
        computing dominators.

    * 10 June 2004: Force initialization of CIL at the start of
        Cabs2cil.

    * 9 June 2004: Added support for GCC __attribute_used__

7 April 2004: cil-1.2.5

    * 7 April 2004: Allow now to run ./configure CC=cl and set the MSVC
        compiler to be the default. The MSVC driver will now select the
        default name of the .exe file like the CL compiler.

    * 7 April 2004: Fixed a bug in the driver. The temporary files are
        deleted by the Perl script before the CL compiler gets to them?

    * 7 April 2004: Added the - form of arguments to the MSVC driver.

    * 7 April 2004: Added a few more GCC-specific string escapes, (, [,
        {, %, E.

    * 7 April 2004: Fixed bug with continuation lines in MSVC.

    * 6 April 2004: Fixed embarassing bug in the parser: the precedence
        of casts and unary operators was switched.

    * 5 April 2004: Fixed a bug involving statements mixed between
        declarations containing initializers. Now we make sure that the
        initializers are run in the proper order with respect to the
        statements.

    * 5 April 2004: Fixed a bug in the merger. The merger was keeping
        separate alpha renaming talbes (namespaces) for variables and
        types.  This means that it might end up with a type and a
        variable named the same way, if they come from different files,
        which breaks an important CIL invariant.

    * 11 March 2004 : Fixed a bug in the Cil.copyFunction function. The
        new local variables were not getting fresh IDs.

    * 5 March 2004: Fixed a bug in the handling of static function
        prototypes in a block scope. They used to be renamed. Now we
        just consider them global.

20 February 2004: cil-1.2.4

    * 15 February 2004: Changed the parser to allow extra semicolons
        after field declarations.

    * 14 February 2004: Changed the Errormsg functions: error, unimp,
        bug to not raise an exception. Instead they just set
        Errormsg.hadErrors.

    * 13 February 2004: Change the parsing of attributes to recognize
        enumeration constants.

    * 10 February 2004: In some versions of gcc the identifier _{thread
        is an identifier and in others it is a keyword. Added code
        during configuration to detect which is the case.

7 January 2004: cil-1.2.3

    * 7 January 2004: Changed the alpha renamer to be less conservative.
        It will remember all versions of a name that were seen and will
        only create a new name if we have not seen one.

    * 30 December 2003 : Extended the cilly command to understand better
        linker command options -lfoo.

    * 5 December 2003: Added markup commands to the pretty-printer
        module. Also, changed the “@<” left-flush command into “@^”.

    * 4 December 2003: Wide string literals are now handled directly by
        Cil (rather than being exploded into arrays). This is apparently
        handy for Microsoft Device Driver APIs that use intrinsic
        functions that require literal constant wide-string arguments.

    * 3 December 2003: Added support for structured exception handling
        extensions for the Microsoft compilers.

    * 1 December 2003: Fixed a Makefile bug in the generation of the Cil
        library (e.g., cil.cma) that was causing it to be unusable.
        Thanks to KEvin Millikin for pointing out this bug.

    * 26 November 2003: Added support for linkage specifications (extern
        “C”).

    * 26 November 2003: Added the ocamlutil directory to contain some
        utilities shared with other projects.

25 November 2003: cil-1.2.2

    * 24 November 2003: Fixed a bug that allowed a static local to
        conflict with a global with the same name that is declared later
        in the file.

    * 24 November 2003: Removed the --keep option of the cilly driver
        and replaced it with --save-temps.

    * 24 November 2003: Added printing of what CIL features are being
        run.

    * 24 November 2003: Fixed a bug that resulted in attributes being
        dropped for integer types.

    * 11 November 2003: Fixed a bug in the visitor for enumeration
        definitions.

    * 24 October 2003: Fixed a problem in the configuration script. It
        was not recognizing the Ocaml version number for beta versions.

    * 15 October 2003: Fixed a problem in version 1.2.1 that was
        preventing compilation on OCaml 3.04.

17 September 2003: cil-1.2.1

    * 7 September 2003: Redesigned the interface for choosing #line
        directive printing styles. Cil.printLn and Cil.printLnComment
        have been merged into Cil.lineDirectiveStyle.

    * 8 August 2003: Do not silently pad out functions calls with
        arguments to match the prototype.

    * 1 August 2003: A variety of fixes suggested by Steve Chamberlain:
        initializers for externs, prohibit float literals in enum,
        initializers for unsized arrays were not working always, an
        overflow problem in Ocaml, changed the processing of attributes
        before struct specifiers

    * 14 July 2003: Add basic support for GCC’s "__thread" storage
        qualifier. If given, it will appear as a "thread" attribute at
        the top of the type of the declared object. Treatment is very
        similar to "__declspec(...)" in MSVC

    * 8 July 2003: Fixed some of the __alignof computations. Fixed bug
        in the designated initializers for arrays (Array.get error).

    * 8 July 2003: Fixed infinite loop bug (Stack Overflow) in the
        visitor for __alignof.

    * 8 July 2003: Fixed bug in the conversion to CIL. A function or
        array argument of the GCC __typeof() was being converted to
        pointer type. Instead, it should be left alone, just like for
        sizeof.

    * 7 July 2003: New Escape module provides utility functions for
        escaping characters and strings in accordance with C lexical
        rules.

    * 2 July 2003: Relax CIL’s rules for when two enumeration types are
        considered compatible. Previously CIL considered two enums to be
        compatible if they were the same enum. Now we follow the C99
        standard.

    * 28 June 2003: In the Formatparse module, Eric Haugh found and
        fixed a bug in the handling of lvalues of the form
        “lv->field.more”.

    * 28 June 2003: Extended the handling of gcc command lines arguments
        in the Perl scripts.

    * 23 June 2003: In Rmtmps module, simplified the API for customizing
        the root set. Clients may supply a predicate that returns true
        for each root global. Modifying various “referenced” fields
        directly is no longer supported.

    * 17 June 2003: Reimplement internal utility routine
        Cil.escape_char. Faster and better.

    * 14 June 2003: Implemented support for __attribute__s appearing
        between "struct" and the struct tag name (also for unions and
        enums), since gcc supports this as documented in section 4.30 of
        the gcc (2.95.3) manual

28 May 2003: cil-1.1.2

    * 26 May 2003: Add the simplify module that compiles CIL expressions
        into simpler expressions, similar to those that appear in a
        3-address intermediate language.

    * 26 May 2003: Various fixes and improvements to the pointer
        analysis modules.

    * 26 May 2003: Added optional consistency checking for
        transformations.

    * 25 May 2003: Added configuration support for big endian machines.
        Now little_endian can be used to test whether the machine is
        little endian or not.

    * 22 May 2003: Fixed a bug in the handling of inline functions. The
        CIL merger used to turn these functions into “static”, which is
        incorrect.

    * 22 May 2003: Expanded the CIL consistency checker to verify
        undesired sharing relationships between data structures.

    * 22 May 2003: Fixed bug in the oneret CIL module: it was
        mishandling certain labeled return statements.

5 May 2003: cil-1.0.11

    * 5 May 2003: OS X (powerpc/darwin) support for CIL. Special thanks
        to Jeff Foster, Andy Begel and Tim Leek.

    * 30 April 2003: Better description of how to use CIL for your
        analysis.

    * 28 April 2003: Fixed a bug with --dooneRet and --doheapify.
        Thanks, Manos Renieris.

    * 16 April 2003: Reworked management of temporary/intermediate
        output files in Perl driver scripts. Default behavior is now to
        remove all such files. To keep intermediate files, use one of
        the following existing flags:

        * --keepmerged for the single-file merge of all sources

        * --keep=<dir> for various other CIL and CCured output files

        * --save-temps for various gcc intermediate files; MSVC has no
          equivalent option

        As part of this change, some intermediate files have changed
        their names slightly so that new suffixes are always preceded by
        a period.  For example, CCured output that used to appear in
        “foocured.c” now appears in “foo.cured.c”.

    * 7 April 2003: Changed the representation of the GVar global
        constructor.  Now it is possible to update the initializer
        without reconstructing the global (which in turn it would
        require reconstructing the list of globals that make up a
        program). We did this because it is often tempting to use
        visitCilFileSameGlobals and the GVar was the only global that
        could not be updated in place.

    * 6 April 2003: Reimplemented parts of the cilly.pl script to make
        it more robust in the presence of complex compiler arguments.

10 March 2003: cil-1.0.9

    * 10 March 2003: Unified and documented a large number of CIL
        Library Modules: oneret, simplemem, makecfg, heapify,
        stackguard, partial.  Also documented the main client interface
        for the pointer analysis.

    * 18 February 2003: Fixed a bug in logwrites that was causing it to
        produce invalid C code on writes to bitfields. Thanks, David
        Park.

15 February 2003: cil-1.0.8

    * 15 February 2003: PDF versions of the manual and API are available
        for those who would like to print them out.

    * 14 February 2003: CIL now comes bundled with alias analyses.

    * 11 February 2003: Added support for adding/removing options from
        ./configure.

3 February 2003: cil-1.0.7

    * 1 February 2003: Some bug fixes in the handling of variable
        argument functions in new versions of gcc And glibc.

    * 29 January 2003: Added the logical AND and OR operators. Exapanded
        the translation to CIL to handle more complicated initializers
        (including those that contain logical operators).

28 January 2003: cil-1.0.6

    * 28 January 2003: Added support for the new handling of
        variable-argument functions in new versions of glibc.

    * 19 January 2003: Added support for declarations in interpreted
        constructors. Relaxed the semantics of the patterns for
        variables.

    * 17 January 2003: Added built-in prototypes for the gcc built-in
        functions. Changed the pGlobal method in the printers to print
        the carriage return as well.

    * 9 January 2003: Reworked lexer and parser’s strategy for tracking
        source file names and line numbers to more closely match typical
        native compiler behavior. The visible CIL interface is
        unchanged.

    * 9 January 2003: Changed the interface to the alpha convertor. Now
        you can pass a list where it will record undo information that
        you can use to revert the changes that it makes to the scope
        tables.

6 January 2003: cil-1.0.5

    * 4 January 2003: Changed the interface for the Formatcil module.
        Now the placeholders in the pattern have names. Also expanded
        the documentation of the Formatcil module. Now the placeholders
        in the pattern have names.

    * 3 January 2003: Extended the rmtmps module to also remove unused
        labels that are generated in the conversion to CIL. This reduces
        the number of warnings that you get from cgcc afterwards.

    * 17 December 2002: Fixed a few bugs in CIL related to the
        representation of string literals. The standard says that a
        string literal is an array. In CIL, a string literal has type
        pointer to character. This is Ok, except as an argument of
        sizeof. To support this exception, we have added to CIL the
        expression constructor SizeOfStr. This allowed us to fix bugs
        with computing sizeof("foo bar") and sizeof((char*)"foo bar")
        (the former is 8 and the latter is 4).

    * 8 December 2002: Fixed a few bugs in the lexer and parser relating
        to hex and octal escapes in string literals. Also fixed the
        dependencies between the lexer and parser.

    * 5 December 2002: Fixed visitor bugs that were causing some
        attributes not to be visited and some queued instructions to be
        dropped.

    * 3 December 2002: Added a transformation to catch stack overflows.
        Fixed the heapify transformation.

14 October 2002: cil-1.0.4

    * 14 October 2002: CIL is now available under the BSD license (see
        the License section or the file LICENSE).

9 October 2002: cil-1.0.3

    * 9 October 2002: More FreeBSD configuration changes, support for
        the GCC-ims __signed and __volatile. Thanks to Axel Simon for
        pointing out these problems.

    * 8 October 2002: FreeBSD configuration and porting fixes. Thanks to
        Axel Simon for pointing out these problems.

    * 10 September 2002: Fixed bug in conversion to CIL. Now we drop all
        “const” qualifiers from the types of locals, even from the
        fields of local structures or elements of arrays.

    * 7 September 2002: Extended visitor interface to distinguish
        visiting offsets inside lvalues from offsets inside initializer
        lists.

7 September 2002: cil-1.0.1

    * 6 September 2002: Extended the patcher with the ateof flag.

    * 4 September 2002: Fixed bug in the elaboration to CIL. In some
        cases constant folding of || and && was computed wrong.

    * 3 September 2002: Fixed the merger documentation.

29 August 2002: cil-1.0.0

    * 29 August 2002: Started numbering versions with a major nubmer,
        minor and revisions.

    * 25 August 2002: Fixed the implementation of the unique identifiers
        for global variables and composites. Now those identifiers are
          globally unique.

    * 24 August 2002: Added to the machine-dependent configuration the
        sizeofvoid. It is 1 on gcc and 0 on MSVC. Extended the
        implementation of Cil.bitsSizeOf to handle this (it was
        previously returning an error when trying to compute the size of
        void).

    * 24 August 2002: Changed the representation of structure and unions
        to distinguish between undefined structures and those that are
        defined to be empty (allowed on gcc). The sizeof operator is
        undefined for the former and returns 0 for the latter.

    * 22 August 2002: Apply a patch from Richard H. Y. to support
        FreeBSD installations. Thanks, Richard!

    * 12 August 2002: Fixed a bug in the translation of wide-character
        strings. Now this translation matches that of the underlying
        compiler. Changed the implementation of the compiler
        dependencies.

    * 25 May 2002: Added interpreted constructors and destructors.

    * 17 May 2002: Changed the representation of functions to move the
        “inline” information to the varinfo. This way we can print the
        “inline” even in declarations which is what gcc does.

    * 15 May 2002: Changed the visitor for initializers to make two
        tail-recursive passes (the second is a List.rev and only done if
        one of the initializers change). This prevents Stack_Overflow
        for large initializers. Also improved the processing of
          initializers when converting to CIL.

    * 15 May 2002: Changed the front-end to allow the use of MSVC mode
        even on machines that do not have MSVC. The machine-dependent
        parameters for GCC will be used in that case.

    * 11 May 2002: Changed the representation of formals in function
        types. Now the function type is purely functional.

    * 4 May 2002: Added the function visitCilFileSameGlobals and changed
        visitCilFile to be tail recursive.  This prevents stack overflow
        on huge files.

    * 28 February 2002: Changed the significance of the CompoundInit in
        init to allow for missing initializers at the end of an array
        initializer. Added the API function foldLeftCompoundAll.
