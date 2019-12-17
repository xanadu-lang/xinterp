(* ****** ****** *)

fun
<a:type>
pswap
( p1: p2tr(a)
, p2: p2tr(a)): void =
let
val x1 = $eval(p1)
val x2 = $eval(p2)
in
  $eval(p1) := x2; $eval(p2) := x1
end

(* ****** ****** *)
//
var x1: int = 1
var x2: int = 2
//
val () =
pswap($addr(x1), $addr(x2))
//
val x1 = x1 and x2 = x2
//
(* ****** ****** *)
//
var
y01: (int, int) = (0, 1)
//
val () =
pswap
($addr(y01.0), $addr(y01.1))
//
val y0 = y01.0 and y1 = y01.1
//
(* ****** ****** *)

(* end of [pswap.dats] *)
