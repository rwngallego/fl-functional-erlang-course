-module(second).
-export([hypotenuse/2,area/2,perimeter/2]).

hypotenuse(X,Y) ->
    math:sqrt(first:square(X)+first:square(Y)).

area(X,Y)->
    (X*Y)/2.

perimeter(X,Y)->
    X+Y+hypotenuse(X,Y).