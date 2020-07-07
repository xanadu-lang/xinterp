(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)

fun
isprime(x: int): bool =
if
x >= 2
then isprime2(x, 2) else false

and
isprime2(x: int, y: int): bool =
if
y * y > x
then true
else
(
  if (x mod y) = 0
    then false else isprime2(x, y+1)
  // end of [if]
) (* isprime2 *)

(* ****** ****** *)

implement
main0() =
(
println!("isprime(97) = ", isprime(97));
println!("isprime(100) = ", isprime(100));
println!("isprime(101) = ", isprime(101));
println!("isprime(111) = ", isprime(111));
//
println!("isprime(2003) = ", isprime(2003));
println!("isprime(2^17-1) = ", isprime(2**17-1));
//
) (* end of [main0] *)

(* ****** ****** *)

(* end of [IsPrime.dats] *)
