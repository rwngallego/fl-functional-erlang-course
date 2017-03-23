%% This is from David Deren

-module(shapesAndBits).
-export([area/1, perimeter/1, enclose/1, bits/1, bits/2, directBits/1]).
 
area({circle, {_X, _Y}, R}) ->
  math:pi()*R*R;
area({rectangle, {_X, _Y}, H, W}) ->
  H * W;
area({triangle, {_X, _Y}, Height, Base, _A, _B, _C}) ->
  Height * Base / 2.
 
perimeter({circle, {_X, _Y}, R}) ->
  2 * math:pi() * R;
 
perimeter({rectangle, {_X, _Y}, H, W}) ->
  H*2 + W*2;
 
perimeter({triangle, {_X, _Y}, _Height, _Base, A, B, C}) ->
  A + B + C.
 
enclose({circle, {X, Y}, R}) ->
  {rectangle, {X, Y}, 2 * R, 2 * R};
 
enclose({rectangle, {X, Y}, H, W}) ->
  {rectangle, {X, Y}, H, W};
 
enclose({triangle, {X, Y}, Height, Base, _A, _B, _C}) ->
  {rectangle, {X, Y}, Height, Base}.
 
% The tail recursive version
 
bits(X) when X > 0 ->
  bits(hd(io_lib:format("~.2B", [X])), 0).
 
bits([], Acc) ->
  Acc;
 
bits([H|T], Acc) when H == 49 ->
  bits(T, Acc + 1);
 
bits([_|T], Acc) ->
  bits(T, Acc).
 
% The direct recursive version
 
directBits(X) when X > 0 ->
  sumBits(hd(io_lib:format("~.2B", [X]))).
 
sumBits([]) ->
  0;
 
sumBits([H|T]) when H == 49 ->
  1 + sumBits(T);
 
sumBits([_|T]) ->
  sumBits(T).
 
%The tail recursive version should be faster, as it doesn't stack calls to the sumBits function