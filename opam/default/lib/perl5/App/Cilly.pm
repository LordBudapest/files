#
#
# Copyright (c) 2001-2002,
#  George C. Necula    <necula@cs.berkeley.edu>
#  Scott McPeak        <smcpeak@cs.berkeley.edu>
#  Wes Weimer          <weimer@cs.berkeley.edu>
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
# 1. Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright
# notice, this list of conditions and the following disclaimer in the
# documentation and/or other materials provided with the distribution.
#
# 3. The names of the contributors may not be used to endorse or promote
# products derived from this software without specific prior written
# permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
# IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
# PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER
# OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#



# This module implements a compiler stub that parses the command line
# arguments of gcc and Microsoft Visual C (along with some arguments for the
# script itself) and gives hooks into preprocessing, compilation and linking.


$::cilbin = 'bin';

package App::Cilly;
@ISA = ();

use strict;
use File::Basename;
use File::Copy;
use File::Spec;
use Data::Dumper;
use Carp;
use Text::ParseWords;

use App::Cilly::KeptFile;
use App::Cilly::OutputFile;
use App::Cilly::TempFile;

$App::Cilly::savedSourceExt = "_saved.c";

$App::Cilly::m32model = "nogcc32model";
$App::Cilly::m64model = "short=2,2 int=4,4 long=8,8 long_long=8,8 pointer=8,8 alignof_enum=4 float=8,8 float32x=16,16 float64x=4,4 double=8,8 long_double=16,16 float128=16,16 float_complex=8,4 double_complex=16,8 long_double_complex=32,16 float128_complex=32,16 void=1 bool=1,1 fun=1,1 alignof_string=1 max_alignment=16 size_t=unsigned_long wchar_t=int char16_t=unsigned_short char32_t=unsigned_int char_signed=true big_endian=false __thread_is_keyword=true __builtin_va_list=true underscore_name=false";

our $VERSION;

BEGIN {
    $VERSION = '2.0.6';
}

# Pass to new a list of command arguments
sub new {
    my ($proto, @args) = @_;
    my $class = ref($proto) || $proto;

    my $ref =
    { ARGV => \@args,  # Arguments
      CFILES => [],    # C input files
      SFILES => [],    # Assembly language files
      OFILES => [],    # Other input files
      IFILES => [],    # Already preprocessed files
      EARLY_PPARGS => [], # Preprocessor args, first (pre-CIL) pass only
      PPARGS => [],    # Preprocessor args
      CCARGS => [],    # Compiler args
      LINKARGS => [],  # Linker args
      NATIVECAML => 1, # this causes the native code boxer to be used
      IDASHDOT => 1,   # if true, pass "-I." to gcc's preprocessor
      VERBOSE => 0,    # when true, print extra detail
      TRACE_COMMANDS => 0, # when true, echo commands being run
      SEPARATE => ! $::default_is_merge,
      LIBDIR => [],
      OPERATION => 'TOEXE', # This is the default for all compilers
    };

    my $self = bless $ref, $class;

    if(! @args) {
        print "No arguments passed\n";
        $self->printHelp();
        exit 0;
    }
    # Look for the --mode argument first. If not found it is GCC
    # Also parse the --gcc option which overrides the C compiler name
    # (currently only used in the gcc case)
    my $mode = $::default_mode;
    {
        my @args1 = ();
        foreach my $arg (@args) {
            if($arg =~ m|--mode=(.+)$|) {
                $mode = $1;
	    }
            elsif($arg =~ m|--gcc=(.+)$|) {
                $::cc = $1;
            } else {
                push @args1, $arg;
            }
        }
        @args = @args1; # These are the argument after we extracted the --mode

    }
    if(defined $self->{MODENAME} && $self->{MODENAME} ne $mode) {
        die "Cannot re-specify the compiler";
    }

    my $compiler;
    if($mode eq "GNUCC") {
        unshift @App::Cilly::ISA, qw(GNUCC);
        $compiler = GNUCC->new($self);
    } elsif($mode eq "AR") {
        unshift @App::Cilly::ISA, qw(AR);
        $compiler = AR->new($self);
    } else {
        die "Don't know about compiler $mode\n";
    }
    # Now grab the fields from the compiler and put them inside self
    my $key;
    foreach $key (keys %{$compiler}) {
        $self->{$key} = $compiler->{$key};
    }

    return $self;
}

sub processArguments {
    my ($self) = @_;
    my @args = @{$self->{ARGV}};

    # Scan and process the arguments
    $self->setDefaultArguments;
    collectArgumentList($self, @args);

    # sm: if an environment variable is set, then do not merge; this
    # is intended for use in ./configure scripts, where merging delays
    # the reporting of errors that the script is expecting
    if (defined($ENV{"CILLY_NOMERGE"})) {
      $self->{SEPARATE} = 1;
      if($self->{VERBOSE}) { print STDERR "Merging disabled by CILLY_NOMERGE\n"; }
    }

#    print Dumper($self);

    return $self;
}

# Hook to let subclasses set/override default arguments
sub setDefaultArguments {
}

# work through an array of arguments, processing each one
sub collectArgumentList {
    my ($self, @args) = @_;

    # Scan and process the arguments
    while($#args >= 0) {
        my $arg = $self->fetchNextArg(\@args);

        if(! defined($arg)) {
            last;
        }
        if($arg eq "") { next; }

        #print("arg: $arg\n");
#
#        my $arg = shift @args; # Grab the next one
        if(! $self->collectOneArgument($arg, \@args)) {
            print "Warning: Unknown argument $arg\n";
            push @{$self->{CCARGS}}, $arg;
        }
    }
}

# Grab the next argument
sub fetchNextArg {
    my ($self, $pargs) = @_;
    return shift @{$pargs};
}

# Collecting arguments. Take a look at one argument. If we understand it then
# we return 1. Otherwise we return 0. Might pop some more arguments from pargs.
sub collectOneArgument {
    my($self, $arg, $pargs) = @_;
    my $res;
    # Maybe it is a compiler option or a source file
    if($self->compilerArgument($self->{OPTIONS}, $arg, $pargs)) { return 1; }

    if($arg eq "--help" || $arg eq "-help") {
        $self->printVersion();
        $self->printHelp();
        exit 1;
    }
    if($arg eq "--version" || $arg eq "-version") {
        $self->printVersion(); exit 0;
    }
    if($arg eq "--verbose") {
        $self->{VERBOSE} = 1; return 1;
    }
    if($arg eq "--flatten_linker_scripts") {
        $self->{FLATTEN_LINKER_SCRIPTS} = 1; return 1;
    }
    if($arg eq '--nomerge') {
        $self->{SEPARATE} = 1;
        return 1;
    }
    if($arg eq '--merge') {
        $self->{SEPARATE} = 0;
        return 1;
    }
    if($arg =~ "--ccargs=(.+)\$") {
        push @{$self->{CCARGS}}, $1;
        return 1;
    }
    if($arg eq '--trueobj') {
        $self->{TRUEOBJ} = 1;
        return 1;
    }
    # zf: force curing when linking to a lib
    if ($arg eq '--truelib') {
	$self->{TRUELIB} = 1;
	return 1;
    }
    if($arg eq '--keepmerged') {
        $self->{KEEPMERGED} = 1;
        return 1;
    }
    if($arg eq '--stdoutpp') {
        $self->{STDOUTPP} = 1;
        return 1;
    }
    if($arg =~ m|--save-temps=(.+)$|) {
        if(! -d $1) {
            die "Cannot find directory $1";
        }
        $self->{SAVE_TEMPS} = $1;
        return 1;
    }
    if($arg eq '--save-temps') {
        $self->{SAVE_TEMPS} = '.';
        return 1;
    }
    if($arg =~ m|--leavealone=(.+)$|)  {
        push @{$self->{LEAVEALONE}}, $1;
        return 1;
    }
    if($arg =~ m|--includedir=(.+)$|)  {
        push @{$self->{INCLUDEDIR}}, $1; return 1;
    }
    if($arg =~ m|--stages|) {
        $self->{SHOWSTAGES} = 1;
        push @{$self->{CILARGS}}, $arg;
        return 1;
    }
    if($arg eq "--bytecode") {
        $self->{NATIVECAML} = 0; return 1;
    }
    if($arg eq "--no-idashdot") {
        $self->{IDASHDOT} = 0; return 1;
    }

    # sm: response file
    if($arg =~ m|-@(.+)$|) {
        my $fname = $1;         # name of response file
        &classifyArgDebug("processing response file: $fname\n");

        # read the lines into an array
        if (!open(RF, "<$fname")) {
            die("cannot open response file $fname: $!\n");
        }
        my @respArgs = ();
        while(<RF>) {
            # Drop spaces and empty lines
            my ($middle) = ($_ =~ m|\s*(\S.*\S)\s*|);
            if($middle ne "") {
                # Sometimes we have multiple arguments in one line :-()
                if($middle =~ m|\s| &&
                   $middle !~ m|[\"]|) {
                      # Contains spaces and no quotes
                    my @middles = split(/\s+/, $middle);
                    push @respArgs, @middles;
                } else {
                    push @respArgs, $middle;
                }
#                print "Arg:$middle\n";
            }
        }
        close(RF) or die;


        # Scan and process the arguments
        collectArgumentList($self, @respArgs);

        #print("done with response file: $fname\n");
        return 1;      # argument undestood
    }
    if($arg eq "-@") {
        # sm: I didn't implement the case where it takes the next argument
        # because I wasn't sure how to grab add'l args (none of the
        # cases above do..)
        die("For ccured/cilly, please don't separate the -@ from the\n",
            "response file name.  e.g., use -@", "respfile.\n");
    }

    # Intercept the --out argument
    if($arg =~ m|^--out=(\S+)$|) {
        $self->{CILLY_OUT} = $1;
        push @{$self->{CILARGS}}, "--out", $1;
        return 1;
    }
    # All other arguments starting with -- are passed to CIL
    if($arg =~ m|^--|) {
        # Split the ==
        if($arg =~ m|^(--\S+)=(.+)$|) {
            push @{$self->{CILARGS}}, $1, $2; return 1;
        } else {
            push @{$self->{CILARGS}}, $arg; return 1;
        }
    }
    return 0;
}


sub printVersion {
    system ($App::Cilly::CilCompiler::compiler, '--version');
}

sub printHelp {
    my($self) = @_;
    $self->usage();
    my $nomergeisDefault = "";
    my $mergeisDefault = "";
    if ($::default_is_merge) {
        $mergeisDefault = "\n               This is the default.";
    } else {
        $nomergeisDefault = "\n               This is the default.";
    }
    print <<EOF;

Options:
  --mode=xxx   What tool to emulate:
                GNUCC   - GNU gcc
                AR      - GNU ar
               This option must be the first one! If it is not found there
               then GNUCC mode is assumed.
  --cstd=xxx   What C standard / GNU dialect to emulate:
                c90 (also used for c89, iso9899:1990, iso9899:199409, gnu90, gnu89)
                c99 (also used for c9x, iso9899:1999, iso9899:199x, gnu99, gnu9x)
                c11 (c1x, iso9899:2011, c17, c18, iso9899:2017, iso9899:2018, c2x, gnu11, gnu1x, gnu17, gnu18, gnu2x)
  --gnu89inline gnu89 semantic for inline functions
  --help (or -help) Prints this help message.
  --verbose    Prints a lot of information about what is being done.
  --save-temps Keep temporary files in the current directory.
  --save-temps=xxx Keep temporary files in the given directory.

  --nomerge    Apply CIL separately to each source file as they are compiled.$nomergeisDefault
  --merge      Apply CIL to the merged program.$mergeisDefault
  --keepmerged  Save the merged file. Only useful if --nomerge is not given.
  --trueobj          Do not write preprocessed sources in .obj/.o files but
                     create some other files (e.g. foo.o_saved.c).
  --truelib          When linking to a library (with -r or -i), output real
                     object files instead of preprocessed sources. This only
		     works for GCC right now.
  --leavealone=xxx   Leave alone files whose base name is xxx. This means
                     they are not merged and not processed with CIL.
  --includedir=xxx   Adds a new include directory to replace existing ones
  --bytecode         Invoke the bytecode (as opposed to native code) system

EOF
    $self->helpMessage();
}

# For printing the first line of the help message
sub usage {
    my ($self) = @_;
    print "<No usage is defined>";
}

# The rest of the help message
sub helpMessage {
    my ($self) = @_;
    print <<EOF;
Send bugs to necula\@cs.berkeley.edu.
EOF
}


#
# Normalize a file name to always use slashes
#
sub normalizeFileName {
    my($f) = @_;
    $f =~ s|\\|/|g;
    return $f;
}

#
# The basic routines: for ech source file preprocess, compile, then link
# everything
#
#


# LINKING into a library (with COMPILATION and PREPROCESSING)
sub straight_linktolib {
    my ($self, $psrcs, $dest, $ppargs, $ccargs, $ldargs) = @_;
    my @sources = ref($psrcs) ? @{$psrcs} : ($psrcs);
    my @dest = $dest eq "" ? () : ($self->{OUTLIB} . $dest);
    # Pass the linkargs last because some libraries must be passed after
    # the sources
    my @cmd = (@{$self->{LDLIB}}, @dest, @{$ppargs}, @{$ccargs}, @sources, @{$ldargs});
    return $self->runShell(@cmd);
}

# Customize the linking into libraries
sub linktolib {
    my($self, $psrcs, $dest, $ppargs, $ccargs, $ldargs) = @_;
    if($self->{VERBOSE}) { print STDERR "Linking into library $dest\n"; }

    # Now collect the files to be merged
    my ($tomerge, $trueobjs, $ccargs) =
        $self->separateTrueObjects($psrcs, $ccargs);

    if($self->{SEPARATE} || @{$tomerge} == 0) {
        # Not merging. Regular linking.

        return $self->straight_linktolib($psrcs, $dest,
                                         $ppargs, $ccargs, $ldargs);
    }
    # We are merging. Merge all the files into a single one

    if(@{$trueobjs} > 0) {
        # We have some true objects. Save them into an additional file
        my $trueobjs_file = "$dest" . "_trueobjs";
        if($self->{VERBOSE}) {
            print STDERR
                "Saving additional true object files in $trueobjs_file\n";
        }
        open(TRUEOBJS, ">$trueobjs_file") || die "Cannot write $trueobjs_file";
        foreach my $true (@{$trueobjs}) {
            my $abs = File::Spec->rel2abs($true);
            print TRUEOBJS "$abs\n";
        }
        close(TRUEOBJS);
    }
    if(@{$tomerge} == 1) { # Just copy the file over
        (!system('cp', '-f', ${$tomerge}[0], $dest))
            || die "Cannot copy ${$tomerge}[0] to $dest\n";
        return ;
    }
    #
    # We must do real merging
    #
    # Prepare the name of the CIL output file based on dest
    my ($base, $dir, $ext) = fileparse($dest, "(\\.[^.]+)");

    # Now prepare the command line for invoking cilly
    my ($aftercil, @cmd) = $self->MergeCommand ($psrcs, $dir, $base);
    die unless $cmd[0];

    if($self->{VERBOSE}) {
        push @cmd, "--verbose";
    }
    if(defined $self->{CILARGS}) {
        push @cmd, @{$self->{CILARGS}};
    }
    # Eliminate duplicates

    # Add the arguments
    if(@{$tomerge} > 20) {
        my $extraFile = "___extra_files";
        open(TOMERGE, ">$extraFile") || die $!;
        #FRANJO added the following on February 15th, 2005
        #REASON: extrafiles was TempFIle=HASH(0x12345678)
        # instead of actual filename
        my @normalized = @{$tomerge} ;
        $_ = (ref $_ ? $_->filename : $_) foreach @normalized;
        foreach my $fl (@normalized) {
            print TOMERGE "$fl\n";
        }
        close(TOMERGE);
        push @cmd, '--extrafiles', $extraFile;
    } else {
        push @cmd, @{$tomerge};
    }
    push @cmd, "--mergedout", $dest;
    # Now run cilly
    return $self->runShell(@cmd);
}

############
############ PREPROCESSING
############
#
# All flavors of preprocessing return the destination file
#

# THIS IS THE ENTRY POINT FOR COMPILING SOURCE FILES
sub preprocess_compile {
    my ($self, $src, $dest, $early_ppargs, $ppargs, $ccargs) = @_;
    &mydebug("preprocess_compile(src=$src, dest=$dest)\n");
    Carp::confess "bad dest: $dest" unless $dest->isa('App::Cilly::OutputFile');

    my ($base, $dir, $ext) = fileparse($src, "\\.[^.]+");
    if($ext eq ".c" || $ext eq ".cpp" || $ext eq ".cc") {
        if($self->leaveAlone($src)) {
            print "Leaving alone $src\n";
            # We leave this alone. So just compile as usual
            return $self->straight_compile($src, $dest, [@{$early_ppargs}, @{$ppargs}], $ccargs);
        }
        my $out    = $self->preprocessOutputFile($src);
        $out = $self->preprocess($src, $out,
                                 [@{$early_ppargs}, @{$ppargs},
                                  "$self->{DEFARG}CIL=1"]);
        return $self->compile($out, $dest, $ppargs, $ccargs);
    }
    if($ext eq ".i") {
        return $self->compile($src, $dest, $ppargs, $ccargs);
    }
    if($ext eq ".$::cilbin") {
        return $self->compile($src, $dest, $ppargs, $ccargs);
    }
}

# THIS IS THE ENTRY POINT FOR JUST PREPROCESSING A FILE
sub preprocess {
    my($self, $src, $dest, $ppargs) = @_;
    Carp::confess "bad dest: $dest" unless $dest->isa('App::Cilly::OutputFile');
    return $self->preprocess_before_cil($src, $dest, $ppargs);
}

# Find the name of the preprocessed file before CIL processing
sub preprocessOutputFile {
    my($self, $src) = @_;
    return $self->outputFile($src, 'i');
}

# Find the name of the preprocessed file after CIL processing
sub preprocessAfterOutputFile {
    my($self, $src) = @_;
    return $self->outputFile($src, 'cil.i');
}

# When we use CIL we have two separate preprocessing stages. First is the
# preprocessing before the CIL sees the code and the is the preprocessing
# after CIL sees the code

sub preprocess_before_cil {
    my ($self, $src, $dest, $ppargs) = @_;
    Carp::confess "bad dest: $dest" unless $dest->isa('App::Cilly::OutputFile');
    my @args = @{$ppargs};

    # See if we must force some includes
    if(defined $self->{INCLUDEDIR} && !defined($ENV{"CILLY_NOCURE"})) {
        # And force the other includes. Put them at the begining
        if(($self->{MODENAME} eq 'GNUCC') &&
           # sm: m88k doesn't work if I pass -I.
           $self->{IDASHDOT}) {
            unshift @args, "-I.";
        }
        if(! defined($self->{CVERSION})) {
            $self->setVersion();
        }
        unshift @args,
            map { my $dir = $_;
                  $self->{INCARG} . $dir . "/" . $self->{CVERSION} }
            @{$self->{INCLUDEDIR}};
        #matth: include the main include dir as well as the compiler-specific directory
        unshift @args,
            map { my $dir = $_;
                  $self->{INCARG} . $dir }
            @{$self->{INCLUDEDIR}};
        if($self->{MODENAME} eq 'GNUCC') {
            # sm: this is incompatible with wu-ftpd, but is apparently needed
            # for apache.. more investigation is needed
            # update: now when I try it, apache works without -I- also.. but
            # I'll make this into a switchable flag anyway
            # matth: this breaks other tests.  Let's try without.
#             if ($self->{IDASHI}) {
#                 unshift @args, "-I-";
#             }
        }
    }

    return $self->straight_preprocess($src, $dest, \@args);
}

# Preprocessing after CIL
sub preprocess_after_cil {
    my ($self, $src, $dest, $ppargs) = @_;
    Carp::confess "bad dest: $dest" unless $dest->isa('App::Cilly::OutputFile');
    return $self->straight_preprocess($src, $dest, $ppargs);
}

#
# This is intended to be the true invocation of the underlying preprocessor
# You should not override this method
sub straight_preprocess {
    my ($self, $src, $dest, $ppargs) = @_;
    Carp::confess "bad dest: $dest" unless $dest->isa('App::Cilly::OutputFile');
    if($self->{VERBOSE}) {
	my $srcname = ref $src ? $src->filename : $src;
	print STDERR "Preprocessing $srcname\n";
    }

#        print Dumper($self);
    my @cmd = (@{$self->{CPP}}, @{$ppargs},
        $src, $self->makeOutArguments($self->{OUTCPP}, $dest));
    $self->runShell(@cmd);

    return $dest;
}


#
#
#
# COMPILATION
#
#

sub compile {
    my($self, $src, $dest, $ppargs, $ccargs) = @_;
    &mydebug("Cilly.compile(src=$src, dest=$dest->{filename})\n");
    Carp::confess "bad dest: $dest->{filename}"
        unless $dest->isa('App::Cilly::OutputFile');

    if($self->{SEPARATE}) {
        # Now invoke CIL and compile afterwards
        return $self->applyCilAndCompile([$src], $dest, $ppargs, $ccargs);
    }
    # We are merging
    # If we are merging then we just save the preprocessed source
    my ($mtime, $res, $outfile);
    if(! $self->{TRUEOBJ}) {
        $outfile = $dest->{filename}; $mtime = 0; $res   = $dest;
    } else {
        # Do the real compilation
        $res = $self->straight_compile($src, $dest, $ppargs, $ccargs);
        # Now stat the result
        my ($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,
            $atime,$mtime_1,$ctime,$blksize,$blocks) = stat($dest->{filename});
        if(! defined($mtime_1)) {
            die "Cannot stat the result of compilation $dest->{filename}";
        }
        $mtime = $mtime_1;
        $outfile = $dest->{filename} . $App::Cilly::savedSourceExt;
    }
    my $srcname = ref $src ? $src->filename : $src;
    if($self->{VERBOSE}) {
        print STDERR "Saving source $srcname into $outfile\n";
    }
    open(OUT, ">$outfile") || die "Cannot create $outfile";
    my $toprintsrc = $srcname;
    $toprintsrc =~ s|\\|/|g;
    print OUT "#pragma merger(\"$mtime\",\"$toprintsrc\",\"" .
              join(',', @{$ccargs}), "\")\n";
    open(IN, '<', $srcname) || die "Cannot read $srcname";
    while(<IN>) {
        print OUT $_;
    }
    close(OUT);
    close(IN);
    return $res;
}

sub makeOutArguments {
    my ($self, $which, $dest) = @_;
    $dest = $dest->{filename} if ref $dest;
    return ($which, $dest);
}
# This is the actual invocation of the underlying compiler. You should not
# override this
sub straight_compile {
    my ($self, $src, $dest, $ppargs, $ccargs) = @_;
    if($self->{VERBOSE}) {
        print STDERR 'Compiling ', ref $src ? $src->filename : $src, ' into ',
        $dest->filename, "\n";
    }
    my @dest =
        $dest eq "" ? () : $self->makeOutArguments($self->{OUTOBJ}, $dest);
    my @forcec = @{$self->{FORCECSOURCE}};
    my @cmd = (@{$self->{CC}}, @{$ppargs}, @{$ccargs},
	       @dest, @forcec, $src);
    return $self->runShell(@cmd);
}

# This is compilation after CIL
sub compile_cil {
    my ($self, $src, $dest, $ppargs, $ccargs) = @_;
    return $self->straight_compile($src, $dest, $ppargs, $ccargs);
}



# THIS IS THE ENTRY POINT FOR JUST ASSEMBLING FILES
sub assemble {
    my ($self, $src, $dest, $ppargs, $ccargs) = @_;
    if($self->{VERBOSE}) { print STDERR "Assembling $src\n"; }
    my @dest =
        $dest eq "" ? () : $self->makeOutArguments($self->{OUTOBJ}, $dest);
    my @cmd = (@{$self->{CC}}, @{$ppargs}, @{$ccargs},
	       @dest, $src);
    return $self->runShell(@cmd);
}



#
# This is intended to be the true invocation of the underlying linker
# You should not override this method
sub straight_link {
    my ($self, $psrcs, $dest, $ppargs, $ccargs, $ldargs) = @_;
    my @sources = ref($psrcs) ? @{$psrcs} : ($psrcs);
    my @dest =
        $dest eq "" ? () : $self->makeOutArguments($self->{OUTEXE}, $dest);
    # Pass the linkargs last because some libraries must be passed after
    # the sources
    my @cmd = (@{$self->{LD}}, @dest,
	       @{$ppargs}, @{$ccargs}, @sources, @{$ldargs});
    return $self->runShell(@cmd);
}

#
# See if some libraries are actually lists of files
sub expandLibraries {
    my ($self) = @_;

    my @tolink = @{$self->{OFILES}};

    # Go through the sources and replace all libraries with the files that
    # they contain
    my @tolink1 = ();
    while($#tolink >= 0) {
        my $src = shift @tolink;
#        print "Looking at $src\n";
        # See if the source is a library. Then maybe we should get instead the
        # list of files
        if($src =~ m|\.$self->{LIBEXT}$| && -f "$src.files") {
            open(FILES, "<$src.files") || die "Cannot read $src.files";
            while(<FILES>) {
                # Put them back in the "tolink" to process them recursively
                while($_ =~ m|[\r\n]$|) {
                    chop;
                }
                unshift @tolink, $_;
            }
            close(FILES);
            next;
        }
        # This is not for us
        push @tolink1, $src;
        next;
    }
    $self->{OFILES} = \@tolink1;
}

# Go over a list of object files and separate them into those that are
# actually sources to be merged, and the true object files
#
sub separateTrueObjects {
    my ($self, $psrcs, $ccargs) = @_;

    my @sources = @{$psrcs};
#    print "Sources are @sources\n";
    my @tomerge = ();
    my @othersources = ();

    my @ccmerged = @{$ccargs};
    foreach my $src (@sources) {
        my ($combsrc, $combsrcname, $mtime);
	my $srcname = ref $src ? $src->filename : $src;
        if(! $self->{TRUEOBJ}) {
            # We are using the object file itself to save the sources
            $combsrcname = $srcname;
            $combsrc = $src;
            $mtime = 0;
        } else {
            $combsrcname = $srcname . $App::Cilly::savedSourceExt;
            $combsrc = $combsrcname;
            if(-f $combsrcname) {
                my ($dev,$ino,$mode,$nlink,$uid,$gid,$rdev,$size,
                    $atime,$mtime_1,$ctime,$blksize,$blocks) = stat($srcname);
                $mtime = $mtime_1;
            } else {
                $mtime = 0;
            }
        }
        # Look inside and see if it is one of the files created by us
        open(IN, "<$combsrcname") || die "Cannot read $combsrcname";
        my $fstline = <IN>;
        close(IN);
        if($fstline =~ m|CIL|) {
            goto ToMerge;
        }
        if($fstline =~ m|^\#pragma merger\(\"(\d+)\",\".*\",\"(.*)\"\)$|) {
            my $mymtime = $1;
            # Get the CC flags
            my @thisccargs = split(/,/, $2);
            foreach my $arg (@thisccargs) {
                # print "Looking at $arg\n  ccmerged=@ccmerged\n";
                if(! grep(/$arg/, @ccmerged)) {
                    # print " adding it\n";
                    push @ccmerged, $arg
                }
            }
          ToMerge:
            if($mymtime == $mtime) { # It is ours
                # See if we have this already
                if(! grep { $_ eq $srcname } @tomerge) { # It is ours
                    push @tomerge, $combsrc;
                    # See if there is a a trueobjs file also
                    my $trueobjs = $combsrcname . "_trueobjs";
                    if(-f $trueobjs) {
                        open(TRUEOBJS, "<$trueobjs")
                            || die "Cannot read $trueobjs";
                        while(<TRUEOBJS>) {
                            chop;
                            push @othersources, $_;
                        }
                        close(TRUEOBJS);
                    }
                }
                next;
            }
        }
        push @othersources, $combsrc;
    }
    # If we are merging, turn off "warnings are errors" flag
    if(grep(/$self->{WARNISERROR}/, @ccmerged)) {
        @ccmerged = grep(!/$self->{WARNISERROR}/, @ccmerged);
        print STDERR "Turning off warn-is-error flag $self->{WARNISERROR}\n";
    }

    return (\@tomerge, \@othersources, \@ccmerged);
}


# Customize the linking
sub link {
    my($self, $psrcs, $dest, $ppargs, $ccargs, $ldargs) = @_;
    my $destname = ref $dest ? $dest->filename : $dest;
    if($self->{SEPARATE}) {
        if (!defined($ENV{CILLY_DONT_LINK_AFTER_MERGE})) {
          if($self->{VERBOSE}) { print STDERR "Linking into $destname\n"; }
          # Not merging. Regular linking.
          return $self->link_after_cil($psrcs, $dest,
                                       $ppargs, $ccargs, $ldargs);
        }
        else {
          return 0;   # sm: is this value used??
        }
    }
    my $outname = ($self->{OPERATION} eq "TOASM") ? $destname
        : "${destname}_comb.$self->{OBJEXT}";
    my $mergedobj = new App::Cilly::OutputFile($destname, $outname);

    # We must merge
    if($self->{VERBOSE}) {
        print STDERR "Merging saved sources into $mergedobj->{filename} (in process of linking $destname)\n";
    }

    # Now collect the files to be merged

    my ($tomerge, $trueobjs, $ccargs) =
        $self->separateTrueObjects($psrcs, $ccargs);

    if($self->{VERBOSE}) {
        print STDERR "Will merge the following: ",
                         join(' ', @{$tomerge}), "\n";
        print STDERR "Will just link the genuine object files: ",
                         join(' ', @{$trueobjs}), "\n";
        print STDERR "After merge compile flags: @{$ccargs}\n";
    }
    # Check the modification times and see if we can just use the combined
    # file instead of merging all over again
    if(@{$tomerge} > 1 && $self->{KEEPMERGED}) {
        my $canReuse = 1;
        my $combFile = new App::Cilly::OutputFile($destname,
                                      "${destname}_comb.c");
        my @tmp = stat($combFile);
        my $combFileMtime = $tmp[9] || 0;
        foreach my $mrg (@{$tomerge}) {
            my @tmp = stat($mrg); my $mtime = $tmp[9];
            if($mtime >= $combFileMtime) { goto DoMerge; }
        }
        if($self->{VERBOSE}) {
            print STDERR "Reusing merged file $combFile\n";
        }
        $self->applyCilAndCompile([$combFile], $mergedobj, $ppargs, $ccargs);
    } else {
      DoMerge:
        $self->applyCilAndCompile($tomerge, $mergedobj, $ppargs, $ccargs);
    }

    if ($self->{OPERATION} eq "TOASM") {
        if (@{$trueobjs} != ()) {
            die "Error: binary file passed as input when assembly desired".
                " for the output."
        }
        # Don't use ld on assembly files.  The -S in CCARGS has already
        # generated the right format of output.
	return;
     }

    # Put the merged OBJ at the beginning because maybe some of the trueobjs
    # are libraries which like to be at the end
    unshift @{$trueobjs}, $mergedobj;

    # And finally link
    # zf: hack for linking linux stuff
    if ($self->{TRUELIB}) {
	my @cmd = (@{$self->{LDLIB}}, ($dest),
		   @{$ppargs}, @{$ccargs}, @{$trueobjs}, @{$ldargs});
	return $self->runShell(@cmd);
    }

    # sm: hack: made this conditional for dsw
    if (!defined($ENV{CILLY_DONT_LINK_AFTER_MERGE})) {
      $self->link_after_cil($trueobjs, $dest, $ppargs, $ccargs, $ldargs);
    }

}

sub applyCil {
    my ($self, $ppsrc, $dest) = @_;

    # The input files
    my @srcs = @{$ppsrc};

    # Now prepare the command line for invoking cilly
    my ($aftercil, @cmd) = $self->CillyCommand ($ppsrc, $dest);
    Carp::confess "$self produced bad output file: $aftercil"
        unless $aftercil->isa('App::Cilly::OutputFile');

    if($self->{VERBOSE}) {
        push @cmd, '--verbose';
    }
    if(defined $self->{CILARGS}) {
        push @cmd, @{$self->{CILARGS}};
    }

    # Add the arguments
    if(@srcs > 20) {
        my $extraFile = "___extra_files";
        open(TOMERGE, ">$extraFile") || die $!;
        foreach my $fl (@srcs) {
            my $fname =  ref $fl ? $fl->filename : $fl;
            print TOMERGE "$fname\n";
        }
        close(TOMERGE);
        push @cmd, '--extrafiles', $extraFile;
    } else {
        push @cmd, @srcs;
    }
    if(@srcs > 1 && $self->{KEEPMERGED}) {
	my ($base, $dir, undef) = fileparse($dest->filename, qr{\.[^.]+});
        push @cmd, '--mergedout', "$dir$base" . '.c';
    }
    # Now run cilly
    $self->runShell(@cmd);

    # Tell the caller where we put the output
    return $aftercil;
}


sub applyCilAndCompile {
    my ($self, $ppsrc, $dest, $ppargs, $ccargs) = @_;
    Carp::confess "$self produced bad destination file: $dest"
	unless $dest->isa('App::Cilly::OutputFile');

    # The input files
    my @srcs = @{$ppsrc};
    &mydebug("Cilly.PM.applyCilAndCompile(srcs=[",join(',',@{$ppsrc}),"])\n");

    # Now run cilly
    my $aftercil = $self->applyCil($ppsrc, $dest);
    Carp::confess "$self produced bad output file: $aftercil"
        unless $aftercil->isa('App::Cilly::OutputFile');

    # Now preprocess
    my $aftercilpp = $self->preprocessAfterOutputFile($aftercil);
    $self->preprocess_after_cil($aftercil, $aftercilpp, $ppargs);

    if (!defined($ENV{CILLY_DONT_COMPILE_AFTER_MERGE})) {
      # Now compile
      return $self->compile_cil($aftercilpp, $dest, $ppargs, $ccargs);
    }
}

# Linking after CIL
sub link_after_cil {
    my ($self, $psrcs, $dest, $ppargs, $ccargs, $ldargs) = @_;
    if (!defined($ENV{CILLY_DONT_COMPILE_AFTER_MERGE})) {
      return $self->straight_link($psrcs, $dest, $ppargs, $ccargs, $ldargs);
    }
}

# See if we must merge this one
sub leaveAlone {
    my($self, $filename) = @_;
    my ($base, $dir, $ext) = fileparse($filename, "(\\.[^.]+)");
    if(grep { $_ eq $base } @{$self->{LEAVEALONE}}) {
        return 1;
    } else {
        return 0;
    }
}


# DO EVERYTHING
sub doit {
    my ($self) = @_;
    my $file;
    my $out;

    $self->processArguments();

#    print Dumper($self);

    # Maybe we must preprocess only
    if($self->{OPERATION} eq "TOI" || $self->{OPERATION} eq 'SPECIAL') {
        # Then we do not do anything
	my @cmd = (@{$self->{CPP}},
		   @{$self->{EARLY_PPARGS}},
		   @{$self->{PPARGS}}, @{$self->{CCARGS}},
		   @{$self->{CFILES}}, @{$self->{SFILES}});
	push @cmd, @{$self->{OUTARG}} if defined $self->{OUTARG};

        return $self->runShell(@cmd);
    }
    # We expand some libraries names. Maybe they just contain some
    # new object files
    $self->expandLibraries();

    # Try to guess whether to run in the separate mode. In that case
    # we can go ahead with the compilation, without having to save
    # files
    if(! $self->{SEPARATE} && # Not already separate mode
       $self->{OPERATION} eq "TOEXE" &&  # We are linking to an executable
       @{$self->{CFILES}} + @{$self->{IFILES}} <= 1) { # At most one source
        # If we have object files, we should keep merging if at least one
        # object file is a disguised source
        my $turnOffMerging = 0;
        if(@{$self->{OFILES}}) {
            my ($tomerge, $trueobjs, $mergedccargs) =
                $self->separateTrueObjects($self->{OFILES}, $self->{CCARGS});
            $self->{CCARGS} = $mergedccargs;
            $turnOffMerging = (@{$tomerge} == 0);
        } else {
            $turnOffMerging = 1;
        }
        if($turnOffMerging) {
            if($self->{VERBOSE}) {
                print STDERR
                    "Turn off merging because the program contains one file\n";
            }
            $self->{SEPARATE} = 1;
        }
    }

    # Turn everything into OBJ files
    my @tolink = ();

    foreach $file (@{$self->{IFILES}}, @{$self->{CFILES}}) {
        $out = $self->compileOutputFile($file);
        $self->preprocess_compile($file, $out,
				  $self->{EARLY_PPARGS},
                                  $self->{PPARGS}, $self->{CCARGS});
        push @tolink, $out;
    }
    # Now do the assembly language file
    foreach $file (@{$self->{SFILES}}) {
        $out = $self->assembleOutputFile($file);
        $self->assemble($file, $out,
                        $self->{EARLY_PPARGS},
                        $self->{PPARGS}, $self->{CCARGS});
        push @tolink, $out;
    }
    # Now add the original object files. Put them last because libraries like
    # to be last.
    push @tolink, @{$self->{OFILES}};

    # See if we must stop after compilation
    if($self->{OPERATION} eq "TOOBJ") {
        return;
    }
    if(($self->{OPERATION} eq "TOASM") && $self->{SEPARATE}) {
        return;
    }

    # See if we must create a library only
    if($self->{OPERATION} eq "TOLIB") {
	if (!$self->{TRUELIB}) {
	    # zf: Creating a library containing merged source
	    $out = $self->linkOutputFile(@tolink);
	    $self->linktolib(\@tolink,  $out,
			     $self->{PPARGS}, $self->{CCARGS},
			     $self->{LINKARGS});
	    return;
	} else {
	    # zf: Linking to a true library. Do real curing.
	    # Only difference from TOEXE is that we use "partial linking" of the
	    # underlying linker
	    if ($self->{VERBOSE}) {
	        print STDERR "Linking to a true library!";
	    }
	    push @{$self->{CCARGS}}, "-r";
	    $out = $self->linkOutputFile(@tolink);
	    $self->link(\@tolink,  $out,
			$self->{PPARGS}, $self->{CCARGS}, $self->{LINKARGS});
	    return;
	}

    }

    # Now link all of the files into an executable
    if($self->{OPERATION} eq "TOEXE" || $self->{OPERATION} eq "TOASM") {
        $out = $self->linkOutputFile(@tolink);
        $self->link(\@tolink,  $out,
                    $self->{PPARGS}, $self->{CCARGS}, $self->{LINKARGS});
        return;
    }

    die "I don't understand OPERATION:$self->{OPERATION}\n";
}

sub classifyArgDebug {
    if(0) { print @_; }
}

sub mydebug {
    if(0) { print @_; }
}

sub compilerArgument {
    my($self, $options, $arg, $pargs) = @_;
    &classifyArgDebug("Classifying arg: $arg\n");
    my $idx = 0;
    for($idx=0; $idx < $#$options; $idx += 2) {
        my $key = ${$options}[$idx];
        my $action = ${$options}[$idx + 1];
        &classifyArgDebug("Try match with $key\n");
        if($arg =~ m|^$key|) {
          &classifyArgDebug(" match with $key\n");
          my @fullarg = ($arg);
          my $onemore;
          if(defined $action->{'ONEMORE'}) {
              &classifyArgDebug("  expecting one more\n");
              # Maybe the next arg is attached
              my $realarg;
              ($realarg, $onemore) = ($arg =~ m|^($key)(.+)$|);
              if(! defined $onemore) {
                  # Grab the next argument
                  $onemore = $self->fetchNextArg($pargs);
                  $onemore = &quoteIfNecessary($onemore);
                  push @fullarg, $onemore;
              } else {
                  $onemore = &quoteIfNecessary($onemore);
              }
              &classifyArgDebug(" onemore=$onemore\n");
          }
          # Now see what action we must perform
          my $argument_done = 1;
          if(defined $action->{'RUN'}) {
              &{$action->{'RUN'}}($self, @fullarg, $onemore, $pargs);
              $argument_done = 1;
          }
          if(defined $action->{'TYPE'}) {
              &classifyArgDebug("  type=$action->{TYPE}\n");
              if($action->{TYPE} eq 'EARLY_PREPROC') {
                  push @{$self->{EARLY_PPARGS}}, @fullarg; return 1;
              }
              elsif($action->{TYPE} eq "PREPROC") {
                  push @{$self->{PPARGS}}, @fullarg; return 1;
              }
              elsif($action->{TYPE} eq 'SPECIAL') {
                  push @{$self->{PPARGS}}, @fullarg;
		  $self->{OPERATION} = 'SPECIAL';
		  return 1;
              }
              elsif($action->{TYPE} eq "CC") {
                  push @{$self->{CCARGS}}, @fullarg; return 1;
              }
              elsif($action->{TYPE} eq "LINKCC") {
                  push @{$self->{CCARGS}}, @fullarg;
                  push @{$self->{LINKARGS}}, @fullarg; return 1;
              }
              elsif($action->{TYPE} eq "ALLARGS") {
                  push @{$self->{PPARGS}}, @fullarg;
                  push @{$self->{CCARGS}}, @fullarg;
                  push @{$self->{LINKARGS}}, @fullarg; return 1;
              }
              elsif($action->{TYPE} eq "LINK") {
                  push @{$self->{LINKARGS}}, @fullarg; return 1;
              }
              elsif($action->{TYPE} eq "CSOURCE") {
                App::Cilly::OutputFile->protect(@fullarg);
                  $fullarg[0] = &normalizeFileName($fullarg[0]);
                  push @{$self->{CFILES}}, @fullarg; return 1;
              }
              elsif($action->{TYPE} eq "ASMSOURCE") {
                App::Cilly::OutputFile->protect(@fullarg);
                  $fullarg[0] = &normalizeFileName($fullarg[0]);
                  push @{$self->{SFILES}}, @fullarg; return 1;
              }
              elsif($action->{TYPE} eq "OSOURCE") {
                App::Cilly::OutputFile->protect(@fullarg);
                  $fullarg[0] = &normalizeFileName($fullarg[0]);
                  push @{$self->{OFILES}}, @fullarg; return 1;
              }
              elsif($action->{TYPE} eq "ISOURCE") {
                App::Cilly::OutputFile->protect(@fullarg);
                  $fullarg[0] = &normalizeFileName($fullarg[0]);
                  push @{$self->{IFILES}}, @fullarg; return 1;
              }
              elsif($action->{TYPE} eq 'OUT') {
                  if(defined($self->{OUTARG})) {
                      print "Warning: output file is multiply defined: @{$self->{OUTARG}} and @fullarg\n";
                  }
                  $fullarg[0] = &normalizeFileName($fullarg[0]);
                  $self->{OUTARG} = [@fullarg]; return 1;
              }
              print "  Do not understand TYPE\n"; return 1;
          }
          if($argument_done) { return 1; }
          print "Don't know what to do with option $arg\n";
          return 0;
      }
   }
   return 0;
}


sub runShell {
    my ($self, @cmd) = @_;

    foreach (@cmd) {
	$_ = $_->filename if ref;
        # If we are on cygwin then we need to convert the files
        # from cygwin names to the actual Windows names
        if($^O eq "cygwin") {
            my $arg = $_;
            if ($arg =~ m|^/| && -f $arg) {
                my $mname = `cygpath -m $arg`;
                chop $mname;
                if($mname ne "") { $_ = $mname; }
            }
        }
    }

    # sm: I want this printed to stderr instead of stdout
    # because the rest of 'make' output goes there and this
    # way I can capture to a coherent file
    # sm: removed conditional on verbose since there's already
    # so much noise in the output, and this is the *one* piece
    # of information I *always* end up digging around for..
    if($self->{TRACE_COMMANDS}) { print STDERR "@cmd\n"; }

    # weimer: let's have a sanity check
    my $code = system { $cmd[0] } @cmd;
    if ($code != 0) {
        # sm: now that we always print, don't echo the command again,
        # since that makes the output more confusing
        #die "Possible error with @cmd!\n";
        if ($code & 0x7f) {
            print STDERR
                "The command\n@cmd\nreceived signal ", ($code &0x7f), "\n";
        }
        $code >>= 8;    # extract exit code portion

        exit $code;
    }
    return $code;
}

sub quoteIfNecessary {
    my($arg) = @_;
    # If it contains spaces or "" then it must be quoted
    if($arg =~ m|\s| || $arg =~ m|\"|) {
        return "\'$arg\'";
    } else {
        return $arg;
    }
}


sub cilOutputFile {
    Carp::croak 'bad argument count' unless @_ == 3;
    my ($self, $basis, $suffix) = @_;

    if (defined $self->{SAVE_TEMPS}) {
	return new App::Cilly::KeptFile($basis, $suffix, $self->{SAVE_TEMPS});
    } else {
	return $self->outputFile($basis, $suffix);
    }
}


sub outputFile {
    Carp::confess 'bad argument count' unless @_ == 3;
    my ($self, $basis, $suffix) = @_;

    if (defined $self->{SAVE_TEMPS}) {
	return new App::Cilly::KeptFile($basis, $suffix,  $self->{SAVE_TEMPS});
    } else {
	return new App::Cilly::TempFile($basis, $suffix);
    }
}


########################################################################
##
##  GNU ar specific code
##
###
package AR;

use strict;

use File::Basename;
use Data::Dumper;

sub new {
    my ($proto, $stub) = @_;
    my $class = ref($proto) || $proto;
    # Create $self

    my $self =
    { NAME => 'Archiver',
      MODENAME => 'ar',
      CC => ['no_compiler_in_ar_mode'],
      CPP => ['no_compiler_in_ar_mode'],
      LDLIB => ['ar', 'crv'],
      DEFARG  => "??DEFARG",
      INCARG  => '??INCARG',
      DEBUGARG => ['??DEBUGARG'],
      OPTIMARG => [],
      OBJEXT => "o",
      LIBEXT => "a",   # Library extension (without the .)
      EXEEXT => "",  # Executable extension (with the .)
      OUTOBJ => "??OUTOBJ",
      OUTLIB => "",  # But better be first
      LINEPATTERN => "",

      OPTIONS =>
          ["^[^-]" => { RUN => \&arArguments } ]

      };
    bless $self, $class;
    return $self;
}

# We handle arguments in a special way for AR
sub arArguments {
    my ($self, $arg, $onemore, $pargs) = @_;
    # If the first argument starts with -- pass it on
    if($arg =~ m|^--|) {
        return 0;
    }
    # We got here for the first non -- argument.
    # Will handle all arguments at once
    if($self->{VERBOSE}) {
        print "AR called with $arg @{$pargs}\n";
    }

    #The r flag is required:
    if($arg !~ m|r| || $#{$pargs} < 0) {
	die "Error: CCured's AR mode implements only the r and cr operations.";
    }
    if($arg =~ /[^crvus]/) {
	die "Error: CCured's AR mode supports only the c, r, u, s, and v flags.";
    }
    if($arg =~ /v/) {
	$self->{VERBOSE} = 1;
    }

    if($arg =~ /c/)
    {
	# Command is "cr":
        # Get the name of the library
	my $out = shift @{$pargs};
        $self->{OUTARG} = [$out];
        unlink $out;
    }
    else
    {
	# if the command is "r" alone, we should add to the current library,
        # not replace it, unless the library does not exist

        # Get the name of the library
	my $out = shift @{$pargs};
        $self->{OUTARG} = [$out];

        #The library is both an input and an output.
        #To avoid problems with reading and writing the same file, move the
        #current version of the library out of the way first.
        if(-f $out) {

            my $temp_name = $out . "_old.a";
            if($self->{VERBOSE}) {
        	print "Copying $out to $temp_name so we can add "
                    . "to it.\n";
            }
            if(-f $temp_name) {
                unlink $temp_name;
            }
            rename $out, $temp_name;

            #now use $temp_name as the input.  $self->{OUTARG} will,
            # as usual, be the output.
            push @{$self->{OFILES}}, $temp_name;
        } else {
            warn "Library $out not found; creating.";
        }

    }

    # The rest of the arguments must be object files
    push @{$self->{OFILES}}, @{$pargs};
    $self->{OPERATION} = 'TOLIB';
    @{$pargs} = ();
#    print Dumper($self);
    return 1;
}

sub linkOutputFile {
    my($self, $src) = @_;
    if(defined $self->{OUTARG}) {
        return "@{$self->{OUTARG}}";
    }
    die "I do not know what is the link output file\n";
}

sub setVersion {
    # sm: bin/cilly wants this for all "compilers"
}


#########################################################################
##
## GNUCC specific code
##
package GNUCC;

use strict;

use File::Basename;

# The variable $::cc is inherited from the main script!!

sub new {
    my ($proto, $stub) = @_;
    my $class = ref($proto) || $proto;
    # Create $self

    my @native_cc = Text::ParseWords::shellwords($ENV{CILLY_NATIVE_CC} || $::cc);

    my $self =
    { NAME => 'GNU CC',
      MODENAME => 'GNUCC',  # do not change this since it is used in code
      # sm: added -O since it's needed for inlines to be merged instead of causing link errors
      # sm: removed -O to ease debugging; will address "inline extern" elsewhere
      CC => [@native_cc, '-D_GNUCC', '-c'],
      LD => [@native_cc, '-D_GNUCC'],
      LDLIB => ['ld', '-r', '-o'],
      CPP =>  [@native_cc, '-D_GNUCC', '-E'],
      DEFARG  => "-D",
      INCARG => "-I",
      DEBUGARG => ['-g', '-ggdb'],
      OPTIMARG => ['-O4'],
      CPROFILEARG => '-pg',
      LPROFILEARG => '-pg',
      OBJEXT => "o",
      LIBEXT => "a",
      EXEEXT => "",
      OUTOBJ => '-o',
      OUTEXE => '-o',
      OUTCPP => '-o',
      WARNISERROR => "-Werror",
      FORCECSOURCE => [],
      LINEPATTERN => "^#\\s+(\\d+)\\s+\"(.+)\"",

      OPTIONS =>
          [ # Files
            "[^-].*\\.($::cilbin|c|cpp|cc)\$" => { TYPE => 'CSOURCE' },
            "[^-].*\\.(s|S)\$" => { TYPE => 'ASMSOURCE' },
            "[^-].*\\.i\$" => { TYPE => 'ISOURCE' },
            # .o files can be linker scripts
            "[^-]" => { RUN => sub { &GNUCC::parseLinkerScript(@_); }},

	    # Overall Options
            "-c" => { RUN => sub { $stub->{OPERATION} = "TOOBJ"; }},
            "-S" => { RUN => sub { $stub->{OPERATION} = "TOASM";
                                   push @{$stub->{CCARGS}}, $_[1]; }},
            "-E"   => { RUN => sub { $stub->{OPERATION} = "TOI"; }},
            "-o" => { ONEMORE => 1, TYPE => 'OUT' },
	    "-combine\$" => { TYPE => 'ALLARGS' },
	    "-pipe\$" => { TYPE => 'ALLARGS' },
            "-x" => { ONEMORE => 1, TYPE => "CC" },
	    "-v" => { TYPE => 'ALLARGS',
		      RUN => sub { $stub->{TRACE_COMMANDS} = 1; } },
	    # skipping -###, --help, --target-help, --version

	    # C Language Options
      "-ansi" => {
            TYPE => 'ALLARGS',
            RUN => sub {
                push @{$stub->{CILARGS}}, "--cstd", "c90";
            }},
      "-std=(c90|c89|iso9899:1990|iso9899:199409|gnu90|gnu89)" => {
            TYPE => 'ALLARGS',
            RUN => sub {
                push @{$stub->{CILARGS}}, "--cstd", "c90";
            }},
      "-std=(c99|c9x|iso9899:1999|iso9899:199x|gnu99|gnu9x)" => {
            TYPE => 'ALLARGS',
            RUN => sub {
                push @{$stub->{CILARGS}}, "--cstd", "c99";
            }},
      "-std=(c1x|iso9899:2011|c17|c18|iso9899:2017|iso9899:2018|c2x|gnu11|gnu1x|gnu17|gnu18|gnu2x)" => {
            TYPE => 'ALLARGS',
            RUN => sub {
                push @{$stub->{CILARGS}}, "--cstd", "c11";
            }},
      "-fgnu89-inline" => {
            RUN => sub {
                push @{$stub->{CILARGS}}, "--gnu89inline";
            }},
	    "-aux-info\$" => { TYPE => 'CC', ONEMORE => 1 },
            # GCC might define some more macros, eg. for -fPIC, so pass
            # the -f to the preprocessor and the compiler
      "-f" => { TYPE => 'ALLARGS' },

	    # -Wx,blah options (placed before general -W warning options)
            #matth: the handling of -Wp may be wrong.  We may need to
            # break up the argument list and invoke the map on each argument,
            # so that some are classified as PREPROC and others as
            # EARLY_PREPROC
	    '-Wp,' => { TYPE => 'EARLY_PREPROC' },
	    '-Wl,--(no-)?whole-archive$' => { TYPE => 'OSOURCE' },
            '-Wl,' => { TYPE => 'LINK' },

	    # Warning Options
            "-pedantic\$" => { TYPE => 'ALLARGS' },
            "-pedantic-errors\$" => { TYPE => 'ALLARGS' },
            "-Wall" => { TYPE => 'CC',
			 RUN => sub { push @{$stub->{CILARGS}},"--warnall";}},
            "-W[-a-z0-9=]*\$" => { TYPE => 'CC' },
            "-w\$" => { TYPE => 'ALLARGS' },

	    # Debugging Options
            '-g' => { TYPE => 'ALLARGS' },
	    "-save-temps" => { TYPE => 'ALLARGS',
			       RUN => sub { if(! defined $stub->{SAVE_TEMPS}) {
                                                $stub->{SAVE_TEMPS} = '.'; } }},
	    '--?print-' => { TYPE => 'SPECIAL' },
	    '-dump' => { TYPE => 'SPECIAL' },
            "-p\$" => { TYPE => 'LINKCC' },
            "-pg" => { TYPE => 'LINKCC' },

	    # Optimization Options
             # GCC defines some more macros if the optimization is On so pass
             # the -O to the preprocessor and the compiler
            '-O' => { TYPE => 'ALLARGS' },
	    '--param$' => { TYPE => 'CC', ONEMORE => 1 },

	    # Preprocessor Options
            "-A" => { ONEMORE => 1, TYPE => "PREPROC" },
	    '-C$' =>  { TYPE => 'EARLY_PREPROC'}, # zra
	    '-CC$' =>  { TYPE => 'EARLY_PREPROC'},
	    '-d[DIMN]$' => { TYPE => 'EARLY_PREPROC' },
            "-[DIU]" => { ONEMORE => 1, TYPE => "PREPROC" },
	    '-H$' =>  { TYPE => 'EARLY_PREPROC'},
            '-idirafter$' => { ONEMORE => 1, TYPE => "PREPROC" },
            '-include$' => { ONEMORE => 1, TYPE => "EARLY_PREPROC" },
            '-imacros$' => { ONEMORE => 1, TYPE => "PREPROC" },
            '-iprefix$' => { ONEMORE => 1, TYPE => "PREPROC" },
            '-iquote$' => { ONEMORE => 1, TYPE => "PREPROC" },
            '-iwithprefix$' => { ONEMORE => 1, TYPE => "PREPROC" },
            '-iwithprefixbefore$' => { ONEMORE => 1, TYPE => "PREPROC" },
            '-isystem$' => { ONEMORE => 1, TYPE => "PREPROC" },
	    '-M$' => { TYPE => 'SPECIAL' },
	    '-MM$' => { TYPE => 'SPECIAL' },
	    '-MF$' => { TYPE => 'EARLY_PREPROC', ONEMORE => 1 },
	    '-MG$' => { TYPE => 'EARLY_PREPROC' },
	    '-MP$' => { TYPE => 'EARLY_PREPROC' },
	    '-MT$' => { TYPE => 'EARLY_PREPROC', ONEMORE => 1 },
	    '-MQ$' => { TYPE => 'EARLY_PREPROC', ONEMORE => 1 },
	    '-MD$' => { TYPE => 'EARLY_PREPROC' },
	    '-MMD$' => { TYPE => 'EARLY_PREPROC' },
	    '-P$' =>  { TYPE => 'EARLY_PREPROC'},
            '-nostdinc$' => { TYPE => 'PREPROC' },
            '-remap$' => { TYPE => 'PREPROC' },
            '-traditional$' => { TYPE => 'PREPROC' },
            '-tradtional-cpp$' => { TYPE => 'PREPROC' },
            '-trigraphs$' => { TYPE => 'PREPROC' },
            '-undef$' => { TYPE => 'PREPROC' },
            '-Xpreprocessor$' => { ONEMORE => 1, TYPE => "PREPROC" },

            # Linker Options
            "-l" => { TYPE => "LINK" },
            '-nostartfiles$' => { TYPE => 'LINK' },
            '-nodefaultlibs$' => { TYPE => 'LINK' },
            '-nostdlib$' => { TYPE => 'LINK' },
            '-pie$' => { TYPE => 'LINK' },
            '-s$' => { TYPE => 'LINKCC' },
	    '-rdynamic$' => { TYPE => 'LINK' },
	    '-static$' => { TYPE => 'LINK' },
	    '-static-libgcc$' => { TYPE => 'LINK' },
	    '-shared$' => { TYPE => 'LINK' },
	    '-shared-libgcc$' => { TYPE => 'LINK' },
	    '-symbolic$' => { TYPE => 'LINK' },
	    '-u' => { TYPE => 'LINK', ONEMORE => 1 },
            "-Xlinker\$" => { ONEMORE => 1, TYPE => 'LINK' },

            # Directory Options
	    "-B" => { ONEMORE => 1, TYPE => 'ALLARGS' },
	    "-specs=" => { TYPE => 'ALLARGS' },
            "-L" =>
            { RUN => sub {
                # Remember these directories in LIBDIR
                my ($dir) = ($_[1] =~ m|-L(.+)$|);
                push @{$stub->{LIBDIR}}, $dir;
                push @{$stub->{LINKARGS}}, $_[1];
            }},

	    # Target Options
	    "-V" => { ONEMORE => 1, TYPE => 'ALLARGS' },
	    "-b" => { ONEMORE => 1, TYPE => 'ALLARGS' },

	    # Machine Dependent Options
	    "-m32\$" => { TYPE => 'ALLARGS',
			  RUN => sub {
			      push @{$stub->{CILARGS}}, "--envmachine";
			      $ENV{CIL_MACHINE} = $App::Cilly::m32model;
			  }},
	    "-m64\$" => { TYPE => 'ALLARGS',
			  RUN => sub {
			      push @{$stub->{CILARGS}}, "--envmachine";
			      $ENV{CIL_MACHINE} = $App::Cilly::m64model;
			  }},
            "-m" => { TYPE => 'ALLARGS', ONEMORE => 1 },
	    "-pthread\$" => { TYPE => 'ALLARGS' },

	    # mysterious options
            "^-e\$" => { ONEMORE => 1, TYPE => 'LINK' },
            "^-T\$" => { ONEMORE => 1, TYPE => 'LINK' },
            "^-T(bss|data|text)\$" => { ONEMORE => 1, TYPE => 'LINK' },
            "^-N\$" => { TYPE => 'LINK' },
            "-a" => { TYPE => 'LINKCC' },
            "-r\$" => { RUN => sub { $stub->{OPERATION} = "TOLIB"; }},
            "-i\$" => { RUN => sub { $stub->{OPERATION} = "TOLIB"; }},

            "--start-group" => { RUN => sub { } },
            "--end-group" => { RUN => sub { }},
            ],

      };
    bless $self, $class;
    return $self;
}
# '

my $linker_script_debug = 0;
sub parseLinkerScript {
    my($self, $filename, $onemore, $pargs) = @_;

    if(! defined($self->{FLATTEN_LINKER_SCRIPTS}) ||
       $filename !~ /\.o$/) {
      NotAScript:
        warn "$filename is not a linker script\n" if $linker_script_debug;
        push @{$self->{OFILES}}, $filename;
        return 1;
    }
    warn "parsing OBJECT FILE:$filename ****************\n" if
        $linker_script_debug;
    open OBJFILE, $filename or die $!;
    my $line = <OBJFILE>;
    if ($line !~ /^INPUT/) {
        close OBJFILE or die $!;
        goto NotAScript;
    }
    warn "\tYES an INPUT file.\n" if $linker_script_debug;
    my @lines = <OBJFILE>; # Read it all and close it
    unshift @lines, $line;
    close OBJFILE or die $!;
    # Process recursively each line from the file
    my @tokens = ();
    my $incomment = 0; # Whether we are in a comment
    foreach my $line (@lines) {
        chomp $line;
        if($incomment) {
            # See where the comment ends
            my $endcomment = index($line, "*/");
            if($endcomment < 0) { # No end on this line
                next; # next line
            } else {
                $line = substr($line, $endcomment + 2);
                $incomment = 0;
            }
        }
        # Drop the comments that are on a single line
        $line =~ s|/\*.*\*/| |g;
        # Here if outside comment. See if a comment starts
        my $startcomment = index($line, "/*");
        if($startcomment >= 0) {
            $incomment = 1;
            $line = substr($line, 0, $startcomment);
        }
        # Split the line into tokens. Sicne we use parentheses in the pattern
        # the separators will be tokens as well
        push @tokens, split(/([(),\s])/, $line);
    }
    print "Found tokens:", join(':', @tokens), "\n"
        if $linker_script_debug;
    # Now parse the file
    my $state = 0;
    foreach my $token (@tokens) {
        if($token eq "" || $token =~ /\s+/) { next; } # Skip spaces
        if($state == 0) {
            if($token eq "INPUT") { $state = 1; next; }
            else { die "Error in script: expecting INPUT"; }
        }
        if($state == 1) {
            if($token eq "(") { $state = 2; next; }
            else { die "Error in script: expecting ( after INPUT"; }
        }
        if($state == 2) {
            if($token eq ")") { $state = 0; next; }
            if($token eq ",") { next; } # Comma could be a separator
            # Now we better see a filename
            if(! -f $token) {
               warn "Linker script mentions inexistent file:$token.Ignoring\n";
               next;
            }
            # Process it recursively because it could be a script itself
            warn "LISTED FILE:$token.\n" if $linker_script_debug;
            $self->parseLinkerScript($token, $onemore, $pargs);
            next;
        }
        die "Invalid linker script parser state\n";

    }
}

sub forceIncludeArg {
    my($self, $what) = @_;
    return ('-include', $what);
}


# Emit a line # directive
sub lineDirective {
    my ($self, $fileName, $lineno) = @_;
    return "# $lineno \"$fileName\"\n";
}

# The name of the output file
sub compileOutputFile {
    my($self, $src) = @_;

    die "objectOutputFile: not a C source file: $src\n"
	unless $src =~ /\.($::cilbin|c|cc|cpp|i|s|S)$/;

    if ($self->{OPERATION} eq 'TOOBJ'
        || ($self->{OPERATION} eq 'TOASM')) {
	if (defined $self->{OUTARG}
            && "@{$self->{OUTARG}}" =~ m|^-o\s*(\S.+)$|) {
	    return new App::Cilly::OutputFile($src, $1);
	} else {
	    return new App::Cilly::KeptFile($src, $self->{OBJEXT}, '.');
	}
    } else {
	return $self->outputFile($src, $self->{OBJEXT});
    }
}

sub assembleOutputFile {
    my($self, $src) = @_;
    return $self->compileOutputFile($src);
}

sub linkOutputFile {
    my($self, $src) = @_;
    if(defined $self->{OUTARG} && "@{$self->{OUTARG}}" =~ m|-o\s*(\S+)|) {
        return $1;
    }
    return "a.out";
}

sub setVersion {
    my($self) = @_;
    my $cversion = "";
    open(VER, "@{$self->{CC}} -dumpversion "
         . join(' ', @{$self->{PPARGS}}) ." |")
        || die "Cannot start GNUCC";
    while(<VER>) {
        if($_ =~ m|^(\d+\S*)|) {
            $cversion = "gcc_$1";
            close(VER) || die "Cannot start GNUCC\n";
            $self->{CVERSION} = $cversion;
            return;
        }
    }
    die "Cannot find GNUCC version\n";
}

1;


__END__
