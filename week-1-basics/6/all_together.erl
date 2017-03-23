% Functional programming Erlang 1 - Assignment
%
% Author: Rowinson G.

-module(all_together).
-export([perimeter/1, area/1, enclose/1, bits/1, bits_tail/1]).

%%%%%% Shapes %%%%%%%
% We are not dealing with negative numbers yet

perimeter({circle, R}) ->
    2*math:pi()*R;
perimeter({rectangle, B, H}) ->
    2*(B+H);
perimeter({right_triangle, A, B, Hypotenuse}) ->
    A+B+Hypotenuse.

area({circle, R}) ->
    math:pi()*R*R;
area({rectangle, B, H}) ->
    B*H;
area({right_triangle, A, B, _Hypotenuse}) ->
    (A*B)/2.

enclose({circle, R}) ->
    {rectangle, R, R};
enclose({rectangle, _B, _H} = Figure) ->
    Figure;
enclose({right_triangle, A, B, _Hypotenuse}) ->
    {rectangle, A, B}.

%%%%%% Summing bits %%%%%%

% Recursive

bits(N) when (is_integer(N) and (N >= 0)) ->
    BitsList = integer_to_list(N,2),
    bits(BitsList);
bits([H|T]) ->
    {I, _} = string:to_integer([H]),
    I + bits(T);
bits([]) ->
    0.

% Recursive tail

bits_tail(N) when (is_integer(N) and (N >= 0)) ->
    BitsList = integer_to_list(N,2),
    bits_tail(length(BitsList), BitsList, 0).
bits_tail(0, _L, R) ->
    R;
bits_tail(Acc, [H|T], R)->
    {I, _} = string:to_integer([H]),
    bits_tail(Acc-1, T, R+I).