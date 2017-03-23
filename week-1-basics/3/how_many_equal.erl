-module(how_many_equal).
-export([equals/3]).

equals(_A,_A,_A)->
    3;
equals(_A,_A,_B)->
    2;
equals(_A,_B,_A)->
    2;
equals(_B,_A,_A)->
    2;
equals(_A,_B,_C)->
    0.