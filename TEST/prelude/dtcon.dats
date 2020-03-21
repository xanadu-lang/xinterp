(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS\
/Xint/runtime.dats"
(* ****** ****** *)
(*
//
val xs =
list_cons
( 0
, list_cons
  (1, list_nil()))
//
val x0 = xs.0
val x1 = xs.1
val () = xs.0 := 1
//
*)
(* ****** ****** *)

fun
double
( xs0
: !list_vt(int)): void =
(
case+ xs0 of
|list_vt_nil() => ()
|
@list_vt_cons(x0, xs1) =>
(x0 := 2*x0; double(xs1); $fold(xs0))
)

(* ****** ****** *)
//
val xs =
list_vt_cons
( 1
, list_vt_cons(2, list_vt_nil((*void*))))
//
val () = double(xs)
//
(* ****** ****** *)

(* end of [dtcon.dats] *)
