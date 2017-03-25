-module(consolidation).

-export([join/2, concat/1, test/0, member/2]).


% joins two lists into one
-spec join(L1 :: list(), L2 :: list()) -> list().

join([], L) ->
    L;
join([H1|T1] = _L1, L2) ->
    [H1 | join(T1, L2)].

%concats the elements from the list
-spec concat(L :: list()) -> list().

concat([H]) ->
    H;
concat([H|T] = _L) ->
    join(H, concat(T)).

% check if the element is a member of the list
-spec member(E :: integer(), L :: list()) -> boolean().

member(_E, []) ->
    false;
member(E, [E|_T] = _L) ->
    true;
member(E, [_H|T]) ->
    member(E, T).

test() ->
    "hello" = join("he", "llo"),
    "hello" = concat(["h", "el", "lo", []]),
    true = member(3,[1,2,3,4]),
    false = member(5,[1,2,3,4]),
    ok.