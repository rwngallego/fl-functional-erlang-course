-module(pieces).
-export([number/1]).

%1, 2, 3, 4
%2, 4, 7, 11
%1+1,2+2,4+3,7+4

number(0) -> 1;
number(N) when N > 0 ->
    number(N-1)+N.