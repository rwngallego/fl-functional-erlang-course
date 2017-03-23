-module(take).

-export([take/2, test/0]).

% takes the first N elements from a list
-spec take(integer(), [T]) -> [T].

take(Limit, L) ->
    take(L, Limit, []).
take(L, N, R) when L == [] orelse N == 0->
    lists:reverse(R);
take([H|T], N, R) ->
    take(T, N-1, [H|R]).

test()->
    Text = "Hello",
    "Hello" = take(9, Text),
    [] = take(0, Text),
    "Hel" = take(3, Text),
    ok.