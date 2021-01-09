(* ****** ****** *)
//
(*
HX-2020-09-19:
This is actually
for testing xats2js!
*)
//
(* ****** ****** *)
#include
"./../../..\
/share/xinterp_prelude.hats"
(* ****** ****** *)

datatype
mylist(a:type) =
| mylist_nil of ()
| mylist_cons of (a, mylist(a))

(* ****** ****** *)
#extern
fun
<a:type>
mylist_length
(xs: mylist(a)): int
(* ****** ****** *)
implement
<a>
mylist_length
  (xs) = length(xs) where
{
fun
length(xs): int =
(
case+ xs of
| mylist_nil() => 0
| mylist_cons
  (
  _
  ,
  mylist_cons(_, xs)
  ) => 2 + length(xs)
| mylist_cons(_, xs) => 1 + length(xs)
)
}
(* ****** ****** *)
#extern
fun
<a:type>
mylist_append
( xs: mylist(a)
, ys: mylist(a)): mylist(a)
(* ****** ****** *)
implement
<a>
mylist_append
  (xs, ys) =
(
  append(xs, ys)
) where
{
fun
append(xs, ys) = 
case+ xs of
| mylist_nil() => ys
| mylist_cons(x0, xs) =>
  mylist_cons(x0, append(xs, ys))
}
(* ****** ****** *)
val
mylist0 =
mylist_nil()
val
mylist123 =
mylist_cons
( 1
, mylist_cons
( 2, mylist_cons(3, mylist_nil())))
(* ****** ****** *)

val
length_mylist1230 =
mylist_length(mylist_append<int>(mylist123, mylist0))

(* ****** ****** *)

(* end of [test-2020-09-19.dats] *)
