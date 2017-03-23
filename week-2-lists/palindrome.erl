-module(palindrome).

-export([check/1, check/2, just_letters/1, invert/1, test/0]).

% check if the text is palindrome
-spec check(Text1 :: list()) -> boolean().

check(Text1) ->
    Text2 = just_letters(Text1),
    Text3 = invert(Text2),
    check(Text2, Text3).
check([H1|T1], [H1|T2]) ->
    check(T1,T2);
check([_H1|_T1], [_H2|_T2]) ->
    false;
check([], []) ->
    true.

% inverts the text
-spec invert(L :: list()) -> list().

invert(L) ->
    invert(L, []).
invert([], R) ->
    R;
invert([H|T], R)->
    invert(T, [H|R]).

% get just the letters
-spec just_letters(Text :: list()) -> list().

just_letters([]) -> [];
just_letters([H|T] = _Text) ->
    case H of
        H when H >= 65 andalso H =< 90 ->
            Lowercase = H+32, % to lower case
            [Lowercase|just_letters(T)];
        H when H >= 97 andalso H =< 122 ->
            [H|just_letters(T)];
        _ ->
            just_letters(T)
    end.

test() ->
    true = check("Madam I\'m Adam"),
    false = check("Madame I\'m Adam"),
    ok.