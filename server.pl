:- initialization main.

:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).

:- use_module(solve).

:- http_handler(root(.), sudoku_handler, []).

server(Port) :-
  http_server(http_dispatch, [port(Port)]).

sudoku_handler(Req) :-
  (member(method(post), Req)
    ->
      http_read_json_dict(Req, Data, []),
      solve(Data, Solution),
      reply_json(Solution)
    ;
      throw(http_reply(server_error('Method not supported. Only POST.')))
  ).

main :-
  server(5000).
