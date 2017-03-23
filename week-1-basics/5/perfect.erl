-module(perfect).
-export([perfect/1]).

perfect(N) when N > 0->
    perfect(N,N,0).
perfect(0,N,B)->
    B==N;
perfect(I,N,B) when ((I>0) and ((N /= I) or (N==1)) and (N rem I == 0))->
    perfect(I-1,N,B+I);
perfect(I,N,B)->
    perfect(I-1,N,B).