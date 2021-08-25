-module(chapter).
-export([pippo/0]).

pippo() ->
   pippo(list_to_tuple(code:all_loaded())).

pippo(L) when is_list(L) ->
    L.