-module(maximun).
-export([maximun/3, maximun_alt/3]).

maximun(A,B,C) ->
    max(max(A,B),C).

maximun_alt(A,B)->
    max(A,B).
maximun_alt(A,B,C)->
    maximun_alt(A, (maximun_alt(B,C))).