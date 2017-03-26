-module(composition).

-export([double/1, plus_one/1, compose/1, compose_bif/1, twice/1, iterate/1, test/0]).

double(X)   -> 2*X.
plus_one(X) -> X+1.

% composition

compose([HF|TF]) ->
    compose(TF, fun(X) -> HF(X) end).
compose([], FResult) ->
    FResult;
compose([HF|TF], FResult) ->
    compose(TF, fun(X) -> HF(FResult(X)) end).

% composition using built-in functions

compose_basic(F, Acc) ->
    fun(X) -> Acc(F(X)) end.
compose_bif(L) ->
    lists:foldr(fun compose_basic/2, fun(X) -> X end, L).

% twice

twice(F) ->
    compose([F,F]).

% iteration

identity(X) -> X.

iterate(0) -> fun identity/1;
iterate(N) ->
    fun(F) -> iterate(F, N, 1, F) end.
iterate(_, N, N, Acc) ->
    Acc;
iterate(F, N, Count, Acc) ->
    iterate(F, N, Count+1, fun(X) -> F(Acc(X)) end).

% test

test() ->
    Computed1 = plus_one(double(4)),
    Computed2 = double(double(4)),
    Computed3 = double(double(double(double(double(4))))),
    Iterated5Times = iterate(5),
    A = compose([fun double/1, fun plus_one/1]),
    B = compose_bif([fun double/1, fun plus_one/1]),
    C = twice(fun double/1),
    D = Iterated5Times(fun double/1),
    Computed1 = A(4),
    Computed1 = B(4),
    Computed2 = C(4),
    Computed3 = D(4),
    ok.