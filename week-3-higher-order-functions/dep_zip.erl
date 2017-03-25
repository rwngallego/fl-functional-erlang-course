-module(dep_zip).

-export([doubleAll/1, evens/1, product/1, zip/2, zip_with/3, zip_with_hof/3, zip_r/2]).

% double, evens and product

double(A) ->
    A*2.
doubleAll(List) ->
    lists:map(fun double/1, List).

even(X) when X rem 2 == 0 ->
    true;
even(X) when X rem 2 =/= 0 ->
    false.
evens(List) ->
    lists:filter(fun even/1, List).

product(List)->
    lists:foldr(fun(X,Y) -> X*Y end, 1, List).

% zip

% a.
zip(L1, L2) ->
    lists:reverse(zip(L1, L2,[])).
zip([], _L2, Result) ->
    Result;
zip(_L1, [], Result) ->
    Result;
zip([H1|T1], [H2|T2], Result) ->
    zip(T1, T2, [{H1, H2} | Result]).

% b.  - you can use this:
%       for testing: translate:zip_with(fun(X,Y) -> X+Y end, [1,3,5,7], [2,4]).
zip_with(_F, [], _L2) ->
    [];
zip_with(_F, _L1, []) ->
    [];
zip_with(F, [H1 | T1], [H2 | T2]) ->
    [F(H1, H2) | zip_with(F, T1, T2)].

% c.
zip_hof({F, X, Y}) ->
    F(X,Y).

zip_with_hof(F, L1, L2) ->
    Zipped = zip(L1, L2),
    ZippedHof = lists:map(fun({X, Y}) -> {F, X, Y} end, Zipped),
    lists:map(fun zip_hof/1, ZippedHof).
% d.
zip_r(L1, L2) ->
    zip_with_hof(fun(X,Y) -> {X, Y} end, L1, L2).