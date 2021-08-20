-module(convertToubleList).
-export([my2tuple/1]).


my2tuple(Tuple) -> my2tuple(Tuple, 1, tuple_size(Tuple)).

my2tuple(Tuple, Pos, Size) when Pos =< Size ->
    [element(Pos, Tuple) | my2tuple(Tuple, Pos+1, Size)];
my2tuple(_Tuple, _Pos, _Size) -> [].    