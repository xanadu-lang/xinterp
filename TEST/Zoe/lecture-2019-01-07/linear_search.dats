#include
"share/atspre_staload.hats"

fun
search
( n: int
, p: int -> bool): int =
let
// this is a comment
fun
loop(i: int): int =
if
(i < n)
then (if p(i) then i else loop(i+1))
else ~1
// this is a comment
in
  loop(0)
end

implement
main0() = let
  val f0 =
  lam(x: int): bool =>
  (x*x + x - 100 * 101) = 0
  val r0 = search(1000000, f0)
in
  println! ("r0 = ", r0)
end

