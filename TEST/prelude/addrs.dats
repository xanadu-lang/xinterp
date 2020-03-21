(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS\
/Xint/runtime.dats"
(* ****** ****** *)
//
var x0: int = 0
val p0 = $addr(x0)
val x0 = $eval(p0)
//
val p1 =
  $addr($eval(p0))
val x1 =
  (!p1 := 1; $eval(p1))
//
(* ****** ****** *)
//
val xs =
list_cons
( 0
, list_cons(1, list_nil()))
//
val x0 = xs.0
val x1 = xs.1
val () = xs.0 := 1
val ys = $eval($addr(xs.1))
//
(* ****** ****** *)

(* end of [addrs.dats] *)
