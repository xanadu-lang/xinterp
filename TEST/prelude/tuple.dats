(* ****** ****** *)
#staload
"prelude\
/DATS/CATS\
/Xint/runtime.dats"
(* ****** ****** *)

var x0 = $(0, 1)
val x1 = x0
val () = x0.0 := 1
val () = x0.1 := 2
val x2 = x0

(* ****** ****** *)

var y0 = @(0, 1)
val y1 = y0
val p0 = $addr(y0)
val () =
($eval(p0)).0 := 1
val () =
($eval(p0)).1 := 2
val y2 = y0

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

(* ****** ****** *)

(* end of [tuple.dats] *)
