% module è come la classe nella programmazione ad oggetti
-module(afile_server).
% metodi publici che si possono richiamre all'esterno ([nomeMetodo/numeroParametri]).
-export([start/1, loop/1]).


% metodo start che prende 1 solo parametro 
% spaw = metodo che inizia un processo.
% che dice: al modulo afile_server prendi il metodo loop e applicagli il parametro Dir
start(Dir) ->
    spawn(afile_server, loop, [Dir]).


% il metodo loop è un ciclo in Erlang, i cicli devono smepre richiamare se stessi alla fine.
% il codice dice che se riceviamo un messaggio {Client, list_dir} rispondiamo con un elenco di file.
% se riceviamo {Client, {fett_file, File}} rispondiamo con il file
loop(Dir) ->
    receive
        % tutti i messaggi contengono la variabile Client.
        % Client indica il processo che ha inviato la richesta 
        % e al quale la risposta deve essere spedita.
        {Client, list_dir} ->
            Client ! {self(), file:list_dir(Dir)};
        {Client, {get_file, File}} ->
            Full = filename:join(Dir, File),
            Client ! {self(), file:read_file(Full)}
        % la risposta inviata dal server contiene l'argomento self()
        % indica il processo dedl server 
        % viene aggiunto all'interno del messaggio cosi che il Client riesca a vericaficare che il messaggio sia stato mandato del server e non da un altro processo
end,
loop(Dir).