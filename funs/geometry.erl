-module(geometry).
-export([area/1, perimeter/1]).

area({rectangole, Width, Height}) -> 
    Width * Height;
area({square, Side}) ->
    Side * Side;
area({circle, R}) ->
    R * R * 3.14;
area({triangle, Width, Height}) ->
    (Width * Height) / 2.

% il triangolo a tutti i lati diversi e lo calcolo solo per quello 
% è un esempio facile
perimeter({triangle, A, B, C}) ->
    A + B + C;
perimeter({rectangole, Width, Height}) ->
    2*(Width + Height);
perimeter([square, Side]) ->
    Side * 4;
perimeter([circle, R]) ->
    2*3.14*R.
    