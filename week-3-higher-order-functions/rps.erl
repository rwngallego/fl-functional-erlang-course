-module(rps).

-export([beat/1, lose/1, result/2, tournament/2]).


-spec beat(Choice :: atom()) -> atom().

beat(rock)      -> paper;
beat(paper)     -> scissors;
beat(scissors)  -> rock;
beat(_)         -> undefined.


-spec lose(Choise :: atom) -> atom().

lose(rock)      -> scissors;
lose(paper)     -> rock;
lose(scissors)  -> paper;
lose(_)         -> undefined.


-spec result(Choice1 :: atom(), Choice2 :: atom()) ->
    Result :: atom().

result(Choice1, Choice2) ->
    Beat = beat(Choice2),
    case lose(Choice1) of
        Result when Result == Choice2 ->
            win;
        _Result when Choice1 == Choice2 ->
            draw;
        Result when Result ==  Beat->
            lose;
        _ -> 
            undefined
    end.


-spec zip(L1 :: list(), L2 :: list()) -> Zipped :: list().

zip([], _L2) -> [];
zip(_L1, []) -> [];
zip([H1 | T1] = _List1, [H2 | T2] = _List2) ->
    [{H1,H2} | zip(T1, T2)].

-spec result_number(Game :: tuple(), Acc :: integer()) ->
    Result :: integer().

result_number({Choice1, Choice2} = _Game, Acc) ->
    case result(Choice1, Choice2) of
        win -> Acc + 1;
        lose        -> Acc -1;
        draw        -> Acc;
        undefined   -> throw("Invalid argument")
    end.

tournament(List1, List2) ->
    Zipped = zip(List1, List2),
    lists:foldr(fun result_number/2, 0, Zipped).