-module(fibonacci).
-export([fibonacci/1, rec/1]).

fibonacci(0)->
    0;
fibonacci(1)->
    1;
fibonacci(N) when N > 1 ->
    fibonacci(N-1)+fibonacci(N-2).



%0,1,2,3,4,5,6,7
%0,1,1,2,3,5,8,13

rec(N) ->
    rec(N, 0, 1).
rec(0, B1, _B2) ->
    B1;
rec(N, B1, B2) ->
    rec(N-1, B2, B1+B2).

% 0 > rec(4)
% 1 > rec(4,0,1)
% 2 > rec(3,1,1)
% 3 > rec(2,1,2)
% 4 > rec(1,2,3)
% 5 > rec(0,3,5)
% 6 > 3