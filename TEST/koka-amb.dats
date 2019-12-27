(* ****** ****** *)

#include
"./../xanadu\
/prelude/DATS/list.dats"

(* ****** ****** *)

fun
bxor(p: bool, q: bool): bool =
if (p)
then q
else (if q then false else true)

(* ****** ****** *)

fun
<a:type>
append
( xs: list(a)
, ys: list(a)): list(a) =
(
case+ xs of
| list_nil() => ys
| list_cons(x0, xs) =>
  list_cons(x0, append(xs, ys))
)

(* ****** ****** *)

#extern
fun
<ans:type>
kflip
(k0: bool -<cref> ans): ans

(* ****** ****** *)

fun
<ans:type>
kxor
( k0
: bool -<cref> ans): ans =
kflip
(lam(p) => kflip(lam(q) => k0(bxor(p, q))

fun
kxor0
(
// nothing
) : list(bool) =
(
kxor<ans>
(
lam(x) =>
list_cons(x, list_nil()
)
) where
{
  typedef ans = list(bool)
  implement
  kflip<ans>(k0) = append(k0(false), k0(true))
} (* kxor0 *)

(* ****** ****** *)

val ans = kxor0()

(* ****** ****** *)

(* end of [koka-amb.dats] *)
