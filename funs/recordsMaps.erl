-module(recordsMaps).
-export([map_search_pred/2]).

map_search_pred(Map, Pred) when is_map(Map) ->
     map_search_pred(maps:to_list(Map), Pred);
map_search_pred([], _) ->
    error("is empty");
map_search_pred([{Key, Value}=H|L], Pred) ->
    case Pred(Key, Value) of
        true -> 
            {ok, H};
        false ->
            map_search_pred(L, Pred)
end.


