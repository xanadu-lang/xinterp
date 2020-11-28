(* ****** ****** *)
(*
extern char **environ;
int main(void)
{
int i;
for (i = 0; environ[i] != NULL; i++)
printf("%s\n", environ[i]);
exit(EXIT_SUCCESS);
}
*)
(* ****** ****** *)
#staload _ =
"prelude\
/DATS/CATS\
/Xint/basics.dats"
(* ****** ****** *)
#staload
"prelude/DATS/gbas.dats"
#staload
"prelude/DATS/gnum.dats"
#staload
"prelude/DATS/gord.dats"
(* ****** ****** *)
#staload
"prelude/DATS/gfor.dats"
#staload
"prelude/DATS/gfun.dats"
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
"prelude/DATS/gflt.dats"
#staload
"prelude/DATS/string.dats"
//
(* ****** ****** *)
#staload
"prelude/DATS/unsafe.dats"
(* ****** ****** *)
//
#staload
"prelude/DATS/list.dats"
#staload
"prelude/DATS/array.dats"
#staload
"prelude/DATS/stream.dats"
//
#staload
"prelude/DATS/list_vt.dats"
#staload
"prelude/DATS/stream_vt.dats"
//
(* ****** ****** *)
#extern
fun
<a:vt>
p2tr_succ
(p0: p2tr(a)): p2tr(a)

#extern
fun
<a:vt>
p2tr_get_at
(p0: p2tr(a), i0: nint): (a)
#extern
fun
<a:vt>
p2tr_set_at
(p0: p2tr(a), i0: nint, x0: a): void

(* ****** ****** *)

abstype argv_tbox
typedef argv = argv_tbox
abstype environ_tbox
typedef environ = environ_tbox

(* ****** ****** *)

local

typedef xs = argv
typedef x0 = string

#extern
fun<>
the_argc_get(): nint

in

impltmp
gseq_forall<xs><x0>(xs) =
(
loop(0(*i0*))
) where
{
val
argc =
the_argc_get<>()
val
arg0 = 
$UN.cast10{p2tr(string)}(xs)
fun
loop
( i0: nint ): bool =
if
(i0 >= argc)
then true else let
in
let
  val
  test =
  forall$test<x0>
  (p2tr_get_at(arg0, i0))
in
  if test then loop(succ(i0)) else false
end // end of [else] // end of [if]
end
} (* end of [gseq_forall<argv><string>] *)

end // end of [local]

(* ****** ****** *)

local

typedef x0 = string
typedef xs = environ

in

impltmp
gseq_forall<xs><x0>(xs) =
(
loop
($UN.cast10{p2tr(stropt)}(xs))
) where
{
fun
loop
( p0
: p2tr(stropt)): bool =
let
val opt = $UN.p2tr_get(p0)
in
if
stropt_nilq(opt)
then true else let
  val
  test =
  forall$test<x0>(stropt_unsome(opt))
in
  if test then loop(p2tr_succ(p0)) else false
end // end of [else] // end of [if]
end
} (* end of [gseq_forall<environ><string>] *)

end // end of [local]

(* ****** ****** *)

(* end of [test-2020-07-26.dats] *)
