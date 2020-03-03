(* ****** ****** *)
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
(* ****** ****** *)

(* end of [addrs.dats] *)
