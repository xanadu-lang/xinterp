(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS\
/Xint/runtime.dats"
(* ****** ****** *)
#staload
"prelude/DATS/gbas.dats"
#staload
"prelude/DATS/gord.dats"
(* ****** ****** *)
#staload
"prelude/DATS/gseq.dats"
(* ****** ****** *)
//
#staload
"prelude/DATS/bool.dats"
#staload
"prelude/DATS/char.dats"
#staload
"prelude/DATS/gint.dats"
#staload
"prelude/DATS/string.dats"
//
#staload
"prelude/DATS/stream_vt.dats"
//
(* ****** ****** *)

typedef tvar = string

(* ****** ****** *)

datatype
term =
| TMvar of tvar
| TMlam of (tvar, term)
| TMapp of (term, term)

(* ****** ****** *)

val K =
let
val x = "x"
val y = "y" in
TMlam(x, TMlam(y, TMvar(x)))
end

(* ****** ****** *)

val S =
let
val x = "x"
val y = "y"
val z = "z" in
TMlam
( x
, TMlam
  ( y
  , TMlam
    ( z
    , TMapp
      ( TMapp(TMvar(x), TMvar(z))
      , TMapp(TMvar(y), TMvar(z))
      )
    )
  )
)
end

val SKK = TMapp(TMapp(S, K), K)

(* ****** ****** *)

fun
subst
( t0: term
, x0: tvar
, u0: term): term =
(
case+ t0 of
|
TMvar(x1) =>
if
(x0 = x1) then u0 else t0
|
TMlam(x1, t1) =>
if
(x0 = x1)
then t0 else TMlam(x1, subst(t1, x0, u0))
|
TMapp(t1, t2) =>
TMapp(subst(t1, x0, u0), subst(t2, x0, u0))
)

(* ****** ****** *)

fun
normalize
(t0: term): term =
(
case+ t0 of
| TMvar(x1) => t0
| TMlam(x1, u1) =>
  TMlam(x1, normalize(u1))
| TMapp(t1, t2) =>
  let
  val t1 = normalize(t1)
  in
  case+ t1 of
  |
  TMlam(x1, u1) =>
  let
    val t0 =
    subst(u1, x1, t2) in normalize(t0)
  end
  |
  _ (*non-TMlam*) => TMapp(t1, normalize(t2))
  end
)

(* ****** ****** *)

val SKK_nf = normalize(SKK)

(* ****** ****** *)

(* end of [test-2020-06-18.dats] *)
