-module(chapter12).
-export([start/2,stop/1]).


start(Atom, Fun) ->
            Pid = spawn(fun() -> doSomething(Atom, Fun)end),
            register(Atom, Pid).
        
    

stop(Atom) ->
        io:format("Stopped."), Atom ! stop.


doSomething(Atom, Fun) ->
    receive
        stop -> void
after 5000 ->
    Fun(),
    doSomething(Atom,Fun)
end.

