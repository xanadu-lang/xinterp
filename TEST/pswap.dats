(* ****** ****** *)
#staload
"./../xanadu\
/prelude/DATS\
/CATS/Xint/runtime.dats"
(* ****** ****** *)

fun
<a:type>
pswap
( p1: p2tr(a)
, p2: p2tr(a)): void =
let
val x1 = !p1
and x2 = !p2
in
  !p1 := x2; !p2 := x1
end

(* ****** ****** *)
//
var x1: int = 1
var x2: int = 2
//
val () = pswap(&x1,&x2)
//
val x1 = x1 and x2 = x2
//
(* ****** ****** *)
//
var
y01: (int, int) = (0, 1)
//
val () = pswap(&y01.0,&y01.1)
//
val y0 = y01.0 and y1 = y01.1
//
(* ****** ****** *)

(* end of [pswap.dats] *)
