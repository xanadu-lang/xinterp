(* ****** ****** *)

#symload
nil_vt with strmcon_vt_nil
#symload
cons_vt with strmcon_vt_cons

(* ****** ****** *)

fun
sieve
( xs
: stream_vt(int)) =
$llazy
(
let
val xs = $eval(xs)
in
case- xs of
|
cons_vt(x0, xs) =>
cons_vt(x0, sieve(filter(xs, x0)))
end
) (* end of [sieve] *)

and
filter
( xs
: stream_vt(int)
, x0: int
)
: stream_vt(int) =
$llazy
(
let
val xs = $eval(xs)
in
case- xs of
|
cons_vt(x1, xs) =>
(
  if
  (x1%x0=0)
  then $eval(filter(xs, x0))
  else cons_vt(x1, filter(xs, x0))
)
end // end of [filter]

(* ****** ****** *)

val
xs =
sieve(from(2)) where
{
fun
from(n) = $llazy(cons_vt(n, from(n+1)))
}

(* ****** ****** *)

val-
cons_vt(x0, xs) = $eval(xs) // x0 = 2
val-
cons_vt(x1, xs) = $eval(xs) // x1 = 3

(* ****** ****** *)

(* end of [sieve_vt.dats] *)
