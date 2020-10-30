(* ****** ****** *)
#staload _ =
"prelude/DATS/gbas.dats"
(* ****** ****** *)
#staload _ =
"prelude/DATS/gint.dats"
(* ****** ****** *)
#staload _ =
"prelude/DATS/stream.dats"
#staload _ =
"prelude/DATS/stream_vt.dats"
(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS/Xint/basics.dats"
(* ****** ****** *)

#symload
nil with strmcon_nil
#symload
cons with strmcon_cons

(* ****** ****** *)

val
xs =
stream_sieve_vt(from(2)) where
{
//
fun
from(n) = $lazy(cons(n, from(n+1)))
//
impltmp
sieve$test<int>(x1, x2) = (x2 % x1 > 0)
//
} (*end of [val]*)

(* ****** ****** *)

val () =
stream_vt_print<int>(xs)

(* ****** ****** *)

(*
val-
cons(x0, xs) = $eval(xs) // x0 = 2
val-
cons(x1, xs) = $eval(xs) // x1 = 3
val-
cons(x2, xs) = $eval(xs) // x2 = 5
val-
cons(x3, xs) = $eval(xs) // x3 = 7
val-
cons(x4, xs) = $eval(xs) // x4 = 11
val-
cons(x5, xs) = $eval(xs) // x5 = 13
*)

(* ****** ****** *)

(* end of [strms.dats] *)
