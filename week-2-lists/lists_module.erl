-module(lists_module).

-export([product/1, maximum/1, product_t/1, maximum_t/1]).

% direct

product([]) ->
    1;
product([H|T]) ->
    H*product(T).

maximum([H|[]]) ->
    H;
maximum([H|T]) ->
    max(H, maximum(T)).

% tail

product_t([_|_]=L)  -> product_t(L, 1).
product_t([], N)    -> N;
product_t([H|T], N) -> product_t(T, N*H).

maximum_t([_|_]=L) ->
    maximum_t(L, 0).
maximum_t([], N) ->
    N;
maximum_t([H|T], N) ->
    maximum_t(T, max(H, N)).