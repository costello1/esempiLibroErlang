-module(geometry).
-export([area/1]).

area({rectangole, Width, Height}) -> 
    Width * Height;
area({square, Side}) ->
    Side * Side;
area({circle, R}) ->
    R * R * 3.14;
area({triangle, Width, Height}) ->
    (Width * Height) / 2.