-module(nub).

-export([nub/1, contains/2, test/0]).

% remove all the duplicate elements from a list
-spec nub(L :: list())->list().

nub(L)->
    Result = nub(L, []),
    lists:reverse(Result).
nub([], R) -> R;
nub([H|T], R)->
    case contains(R, H) of
        {ok, Value} when Value == false ->
            nub(T, [H|R]);
        {ok, Value} when Value == true ->
            nub(T, R)
    end.

% determine if the list contains the element
-spec contains(L :: list(), E :: integer()) -> boolean().

contains([], _E) ->
    {ok, false};
contains([H|T] = _L, E) ->
    if
        H==E -> {ok, true};
        true -> contains(T, E)
    end.

test()->
    [2,4,1,3] = nub([2,4,1,3,3,1]),
    ok.