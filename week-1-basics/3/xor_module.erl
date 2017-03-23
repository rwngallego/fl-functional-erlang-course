-module(xor_module).
-export([xor_1/2, xor_2/2, xor_3/2, xor_4/2]).

xor_1(true, false) ->
    true;
xor_1(false, true) ->
    true;
xor_1(_,_) ->
    false.

xor_2(A,B) ->
    ((A == true) and (B ==false)) or ((A == false) and (B == true)).

xor_3(true, B) ->
    B == false;
xor_3(false, B) ->
    B == true.

xor_4(false, false) ->
    false;
xor_4(true,true)->
    false;
xor_4(_,_) ->
    true.