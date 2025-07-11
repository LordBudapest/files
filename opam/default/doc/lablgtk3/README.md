# LablGTK3 3.1.5 : an interface to the GIMP Tool Kit

## Dependencies

- ocaml >= 4.05.0  (including 5.0 and 5.1)
- gtk+ >= 3.18
- dune >= 1.8
- camlp5 (for developer build only)

## Info/upgrades

- https://garrigue.github.io/lablgtk/
- https://github.com/garrigue/lablgtk

## Status

LablGtk3 is still an experimental port of LablGtk2 to Gtk-3.
Currently it is more or less a subset of LablGtk2.

LablGtk uses unicode (utf8) for all strings. If you use non-ascii
strings, you must imperatively convert them to unicode. This can be
done with the `Glib.Convert.locale_to_utf8` function. If your input is
already in utf8, it is still a good idea to validate it with
`Glib.Utf8.validate`, as malformed utf8 strings may cause segmentation
faults.
The `setlocale` function is always called (except if you set
`GTK_SETLOCALE` to 0 in the environment), but `LC_NUMERIC` is reverted
to `"C"` to avoid problems with floating point conversion in OCaml.

Some widgets may be unsupported on your version of Gtk.
If you use them, you will get a runtime error:
```
Failure "Gobject.unsafe_create : type GtkActionGroup is not yet defined"
```
For unsupported methods, the error message is a bit clearer:
```
Failure "gdk_pixbuf_get_file_info unsupported in Gtk 2.x < 2.4"
```

## How to compile:

  To compile in developer mode type:
```
$ dune build
```
  this will compile all the public artifacts of all the included packages,
  and does require having developer tools installed [`camlp5` for instance].

  You *must not* use the developer mode to build `lablgtk3` packages,
  for that you should use

```
$ dune build -p $package
```
  where package is, as of today, one of `lablgtk3`, `lablgtk3-gtksourceview3`,
  `lablgtk3-gtkspell3`.

  LablGTK uses a standard Dune build setup, see the Dune documentation for
  more options.

## Contents

- `src/gdk.ml`              low-level interface to the General Drawing Kit
- `src/gtk.ml`              low-level interface to the GIMP Tool Kit
- `src/gtkThread.ml`        main loop for threaded version
- `src/g[A-Z]*.ml`          object-oriented interface to GTK
- `src/gdkObj.ml`           object-oriented interface to GDK
- `examples/*.ml`           various examples
- `applications/browser`    an ongoing port of ocamlbrowser
- `applications/camlirc`    an IRC client (by Nobuaki Yoshida)

### How to run the examples

The examples are compiled by calling `dune build @all`, you can build
`lablgtk3` applications using a standard Dune or `ocamlfind` workflow.

Remember to call `GMain.init ()` in your application, or it will fail
to properly initialize.

### How to use the threaded toplevel

You can start a thread session using utop:
```
$ dune utop src
# #thread;;
# let locale = GMain.init ();;
# let thread = GtkThread.start();;
# let w = GWindow.window ~show:true ();;
# let b = GButton.button ~packing:w#add ~label:"Hello!" ();;
```

You should at once see a window appear, and then a button.
The GTK main loop is running in a separate thread. Any command
is immediately reflected by the system.
For Windows and OSX/Quartz, there are restrictions on which
commands can be used in which thread. See the windows port section
lower for how to use them.

When using threads in a stand-alone application, you must link with
gtkThread.cmo and call GtkThread.main in place of GMain.main.

Since 2.16.0, busy waiting is no longer necessary with systems
threads. (I.e., CPU usage is 0% if nothing occurs.)
If you use VM threads, you have to enable busy waiting by hand,
otherwise other threads won't be executed (cf. gtkThread.mli).
Beware that with VM threads, you cannot switch threads within
a callback. The only thread related command you may use in a
callback is Thread.create. Calling blocking operations may cause
deadlocks. On the other hand, all newly created threads will be run
outside of the callback, so they can use all thread operations.

### Structure of the (raw) Gtk* modules

These modules are composed of one submodule for each class.
Signals specific to a widget are in a Signals inner module.
A setter function is defined to give access to set_param functions.

### Structure of the G[A-Z]* modules

These modules provide classes to wrap the raw function calls.
Here are the widget classes contained in each module:

- **GPango**        Pango font handling
- **GDraw**         Gdk pixmaps, etc...
- **GObj**          gtkobj, widget, style
- **GData**         data, adjustment, tooltips
- **GContainer**    container, item_container
- **GWindow**       window, dialog, color_selection_dialog, file_selection,
                    plug
- **GPack**         box, button_box, table, fixed, layout, packer, paned,
                    notebook
- **GBin**          scrolled_window, event_box, handle_box, frame,
                    aspect_frame, viewport, socket
- **GButton**       button, toggle_button, check_button, radio_button, toolbar
- **GMenu**         menu_item, tearoff_item, check_menu_item, radio_menu_item,
                    menu_shell, menu, option_menu, menu_bar, factory
- **GMisc**         separator, statusbar, calendar, drawing_area,
                    misc, arrow, image, pixmap, label, tips_query,
                    color_selection, font_selection
- **GTree**         tree_item, tree, view (also tree/list_store, model)
- **GList**         list_item, liste, clist
- **GEdit**         editable, entry, spin_button, combo
- **GRange**        progress, progress_bar, range, scale, scrollbar
- **GText**         view (also buffer, iter, mark, tag, tagtable)

While subtyping follows the Gtk widget hierarchy, you cannot always
use width subtyping (i.e. `#super` is not unifiable with all the
subclasses of super). Still, it works for some classes, like
`#widget` and `#container`, and allows subtyping without coercion towards
these classes (cf. `#container` in **examples/pousse.ml** for instance).

Practically, each widget class is composed of:
- a coerce method, returning the object coerced to the type widget.
- an as_widget method, returning the raw Gtk widget used for packing, etc...
- a destroy method, sending the destroy signal to the object.
- a get_oid method, the equivalent of Oo.id for Gtk objects.
- a connect sub-object, allowing one to widget specific
    signals (this is what prevents width subtyping in subclasses.)
- a misc sub-object, giving access to miscellanous functionality of
    the basic gtkwidget class, and a misc#connect sub-object.
- an event sub-object, for Xevent related functions (only if the widget
    has an Xwindow), and an event#connect sub-object.
- a drag  sub-object, containing drag and drop functions,
    and a drag#connect sub-object.
- widget specific methods.

Here is a diagram of the structure (- for methods, + for sub-objects)
```
        - coerce : widget
        - as_widget : Gtk.widget obj
        - destroy : unit -> unit
        - get_oid : int
        - ...
        + connect : mywidget_signals
        |   - after
        |   - signal_name : callback:(... -> ...) -> GtkSignal.id
        + misc : misc_ops
        |   - show, hide, disconnect, ...
        |   + connect : misc_signals
        + drag : drag_ops
        |   - ...
        |   + connect : drag_signals
        + event : event_ops
        |   - add, ...
        |   + connect : event_signals
```

You create a widget by `<Module>.<widget name> options ... ()`.
Many optional arguments are admitted. The last two of them, packing:
and show:, allow you respectively to call a function on your newly
created widget, and to decide wether to show it immediately or not.
By default all widgets except toplevel windows (**GWindow** module) are
shown immediately.

### Default arguments

For many constructor or method arguments, default values are provided.
Generally, this default value is defined by GTK, and you must refer
to GTK's documentation.
For ML defined defaults, usually default values are either `false`, `0`, `None`
or `NONE`, according to the expected type.
Important exceptions are `~show`, which defaults to true in all widgets
except those in **GWindow**, and `~fill`, which defaults to true or `BOTH`.

Note about unit as method argument:

OCaml introduces no distinction between methods having side-effects
and methods simply returning a value. In practice, this is
confusing, and awkward when used as callbacks. For this reason all
methods having noticeable side-effects should take arguments, and
unit if they have no argument.

### ML-side signals

The **GUtil** module provides two kinds of utilities: a memo table, to be
able to dynamically cast widgets to their original class, and more
interesting ML-side signals.
With ML-side signals, you can combine LablGTK widgets into your own
components, and add signals to them. Later you can connect to these
signals, just like GTK signals. This proved very efficient to
develop complex applications, abstracting the plumbing between
various components. Explanations are provided in GUtil.mli.

### Contributed components

The **GToolbox** module contains contributed components to help you build
your applications.

### Memory management

Important efforts have been dedicated to cooperate with Gtk's
reference counting mechanism. As a result you should generally be
able to use Gdk/Gtk data structures without caring about memory
management. They will be freed when nobody points to them any more.
This also means that you do not need to pay too much attention to
whether a data structure is still alive or not. If it is not, you
should get an error rather than a core dump.
The case of Gtk objects deserves special care. Since they are
interactive, we cannot just destroy them when they are no longer
referenced. They have to be explicitely destroyed. If a widget was
added to a container widget, it will automatically be destroyed when
its last container is destroyed. For this reason you need only
destroy toplevel widgets.

Since too frequent GC can severely degrade performance, since 2.18.4
it is possible to change the contribution of custom blocks to the
GC cycle, using the function `GMain.Gc.set_speed`. The default is 10%
of what it was in 2.18.3. If you set it to 0, custom block allocation
has no impact, and you should consider running the Gc by hand.

IMPORTANT: Some Gtk data structures are allocated in the Caml heap,
and their use in signals (Gtk functions internally cally callbacks)
relies on their address being stable during a function call. For
this reason automatic compation is disabled in GtkMain. If you need
it, you may use compaction through `Gc.compact` where it is safe
(timeouts, other threads...), but do not enable automatic compaction.

### Libraries support

- GtkSourceView 3 support:
                This binding was contributed by Benjamin Monate, and
                adapted by Hugo Herbelin.
                It requires libgtksourceview-3.x.
                See examples in examples/sourceview/*3.ml
                The executable must be linked with lablgtksourceview3.cma.
- GtkSpell 3 support
- RSVG2 support:
                This binding was contributed by Olivier Andrieu.
                It requires librsvg-2.x (preferably 2.2.x).
                See an example in examples/rsvg.
                The executable must be linked with lablrsvg.cma.
- GooCanvas2 support:
                This binding was contributed by Maxence Guesdon.
                It requires libgoocanvas-2.x.
                See examples in examples/goocanvas2.
                The executable must be linked with lablgtk3_goocanvas2.cma.


#### Not available in Gtk3

- LibGlade support: not available in Gtk3 (replaced by GtkBuilder)
- GL extension: not available in Gtk3
- GnomeCanvas support: not available in Gtk3

### Running lablgtk3 in the toplevel

#### Windows port

If you want to use threads, you must be aware of windows specific
restrictions; see for instance:
 http://article.gmane.org/gmane.comp.video.gimp.windows.devel/314
I.e. all GTK related calls must occur in the same thread, the one
that runs the main loop. If you want to call them from other threads
you need to do some forwarding. Fortunately, with a functional
language this is easy. Two functions,

```ocaml
val async : ('a -> unit) -> 'a -> unit
val sync : ('a -> 'b) -> 'a -> 'b
```
are available in the **GtkThread** module to help you. They will forward
your call to the main thread (between handling two GUI events). This
can be either asynchronous or synchronous. In the synchronous case,
beware of deadlocks (the trivial case, when you are calling from the
same thread, is properly avoided). Note also that since callbacks
are always called from the main loop thread, you can freely use GTK
in them. Also, non-graphical operations are thread-safe.
Here is an example using the lablgtk toplevel with threads:
```
% dune utop src
# #thread;;
# GMain.init ();;
# open GtkThread;;
# let thread = start ();;
# let w = sync (GWindow.window ~show:true) ();;
# let b = sync (GButton.button ~packing:w#add ~label:"Hello!") ();;
# b#connect#clicked (fun () -> prerr_endline "Hello");;
```

#### OSX/Quartz port

Since Darwin is Unix, this port compiles as usual.
Note however that Quartz imposes even stronger restrictions than
Windows on threads: only the main thread of the application can do GUI
work. Just apply the same techniques as described in the Windows port,
being careful to ensure that your first call to `GtkThread.main`
occurs in the main thread. This can be done by issueing the following
commands

```
% dune utop src
# #thread;;
# GMain.init ();;
# let thread = Thread.create UTop_main.main () and () = GtkThread.main ();;
# open GtkThread;;
# let w = sync (GWindow.window ~show:true) ();;
# let b = sync (GButton.button ~packing:w#add ~label:"Hello!") ();;
# b#connect#clicked (fun () -> prerr_endline "Hello");;
```

This launches a toplevel thread, and runs main in the application thread.
This version utop-specific; `tool/gtkThTop.ml` has a version for the
ocaml vanilla toplevel.

## Authors
- Jacques Garrigue <garrigue@math.nagoya-u.ac.jp>
- Benjamin Monate  <benjamin.monate@free.fr>
- Olivier Andrieu  <oandrieu@nerim.net>
- Adrien Nader     <camaradetux@gmail.com>
- Jun Furuse       <jun.furuse@gmail.com>
- Maxence Guesdon  <maxence.guesdon@inria.fr>
- Stefano Zacchiroli  <zack@cs.unibo.it>
- Hugo Herbelin    <Hugo.Herbelin@inria.fr>
- Claudio Sacerdoti Coen <claudio.sacerdoticoen@inria.fr>
- Christophe Troestler <Christophe.Troestler@umons.ac.be>
- Emilio Jesús Gallego Arias <e@x80.org>

### For lablgtk1
- Hubert Fauque  <hubert.fauque@wanadoo.fr>
- Koji Kagawa    <kagawa@eng.kagawa-u.ac.jp>

## Bug reports

https://github.com/garrigue/lablgtk/issues
