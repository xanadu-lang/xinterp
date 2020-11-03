(* ****** ****** *)
#staload _ =
"prelude/DATS/gbas.dats"
(* ****** ****** *)
#staload _ =
"prelude/DATS/gint.dats"
#staload _ =
"prelude/DATS/char.dats"
#staload _ =
"prelude/DATS/string.dats"
(* ****** ****** *)
#staload _ =
"prelude/DATS/tuple.dats"
(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS/Xint/basics.dats"
(* ****** ****** *)

var x0 = $(0, 1)
val x1 = x0
val () = x0.0 := 1
val () = x0.1 := 2
val x2 = x0
val () =
(gl_print1(x1); g_print('\n'))
val () =
(gl_print1(x2); g_print('\n'))

(* ****** ****** *)

var y0 = @(0, 1)
val y1 = y0
val p0 = $addr(y0)
val () =
($eval(p0)).0 := 1
val () =
($eval(p0)).1 := 2
val y2 = y0
val () =
(gl_print1(y1); g_print('\n'))
val () =
(gl_print1(y2); g_print('\n'))

(* ****** ****** *)

(*
var z0 = $(0, @(1, 2))
val z1 = z0
val () = z0.0 := 1
val () = z0.1 := (2, 3)
val z2 = z0
*)
var z0 = @(0, $(1, 2))
val z1 = z0
val () = z0.0 := 1
val () = (z0.1).0 := 2
val () = (z0.1).1 := 3
val z2 = z0
val () =
(gl_print1(z1); g_print('\n'))
val () =
(gl_print1(z2); g_print('\n'))

(* ****** ****** *)
//
val uv = $(10, 20)
val $(!u1, !v2) = uv
val ((*void*)) = u1 := v2
val ((*void*)) = v2 := u1
//
(* ****** ****** *)

(* end of [tuple.dats] *)
