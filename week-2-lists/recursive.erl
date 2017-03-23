-module(recursive).
-export([double/1, filtering/1, filtering_case/1, median/1, sort/1, maximum/1, filter_max/2]).

% double
double([]) ->
    [];
double([H|T]) ->
    [H*2 | double(T)].

% filtering
filtering([H|T]) when ((H rem 2) == 0) ->
    [H | filtering(T)];
filtering([H|T]) when ((H rem 2) =/= 0) ->
    filtering(T);
filtering([]) -> [].

% filtering using case
filtering_case([H|T]) ->
    case H of 
        H when ((H rem 2) == 0) ->
            [H | filtering_case(T)];
        _ ->
            filtering_case(T)
end;
filtering_case([]) ->
    [].

% median of the list
median(L) ->
    Ordered = lists:sort(L),
    Length = length(Ordered),
    case Length of
        Length when ((Length rem 2) == 0) ->
            median(Ordered, true, Length/2, 0);
        _ ->
            median(Ordered, false, trunc(Length/2), 0)
end.
median([], _, _, _) -> [];
median([H], _, _, _)->
    H;
median([H1|T], TakeTwo, Index, N) when (Index-1) == N ->
    [H2|_] = T,
    case TakeTwo of
        true ->
            (H2+H1)/2;
        false ->
            H2
end;
median([_H|T], TakeTwo, Index, N) when (Index-1) =/= N ->
    median(T, TakeTwo, Index, N+1).

% sorts recursively
% this is not well performant
sort(L) ->
    sort(L, []).
sort([_|_] = L, Ordered)->
    {V, I} = maximum(L),
    Filtered = filter_max(L,I),
    sort(Filtered, [V|Ordered]);
sort([],Ordered)->
    Ordered.

% get the maximum of the list
% returns the tuple {value, position}
maximum([_|_] = L) ->
    maximum(L, 0).
maximum([H], N) ->
    {H, N};
maximum([H1|T], N1) ->
    {H2, N2} = maximum(T, N1+1),
    Max = max(H1, H2),
    case Max of
        Max when (Max == H1) ->
            {H1, N1};
        _ ->
            {H2, N2}
end.

% returns the list without the value from the Index position
filter_max(L, Index) ->
    filter_max(L, Index, 0).
filter_max([_H|T], Index, N) when N == Index ->
    filter_max(T, Index, N+1);
filter_max([H|T], Index, N) when N =/= Index ->
    [H|filter_max(T, Index, N+1)];
filter_max([], _, _) ->
    [].