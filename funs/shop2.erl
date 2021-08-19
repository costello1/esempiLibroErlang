-module(shop2).
-export([total/1, total1/1]).
-import(list, [map/2, sum/1]).

total(L) ->
    sum(map(fun({What, N}) -> shop:cost(What) * N end, L)).

total1(L) ->
    sum([shop:cost(A) * B || {A, B} <- L]).