-module(math_functions).
-export([event/1,odd/1,filter/2,filterB/2,split/1,split1/1]).

event(0) ->
    "numero diverso da 0";
event(N) when N rem 2 == 0 -> 
    "true";
event(N) when N rem 2 == 1 -> 
    "false".

odd(N) when N rem 2 == 1 -> 
    "true".
    
filter(F,[H|L]) ->
        case F(H) of
        true -> [H|filter(F, L)];
        false -> filter(F, L)
end;
filter(F, []) ->
    [].

filterB(F, [H|L]) ->
    filter1(F(H), H, F, L);
filterB(F, []) -> [].

filter1(true, H, F, L) -> [H |filterB(F, L)];
filter1(false, H, F, L) -> filterB(F, L).

fu(X) -> (X rem 2) =:= 0.

f(X) -> (X rem 2) =:= 1.

split(L) ->
    Odds = [X || X <- L, (X rem 2) =:= 1],
    Evens = [X || X <- L, (X rem 2) =:= 0],
{Odds, Evens}.


split1([X|L]) -> 
    Odds = [ filter(fu(X), L) ],
    Evens = [ filter(f(X), L) ],
{Odds, Evens}.


