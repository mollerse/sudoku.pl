:- initialization (main).
:- set_prolog_flag(verbose, silent).

:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).
:- use_module(library(http/http_cors)).

:- use_module(solve).

:- http_handler(root(.), sudoku_handler, []).

:- set_setting(http:cors, [*]).

server(Port) :-
  http_server(http_dispatch, [port(Port)]).

sudoku_handler(Req) :-
  option(method(options), Req), !,
  cors_enable(Req, [ methods([post]) ]),
  format('~n').

sudoku_handler(Req) :-
  option(method(post), Req), !,
  http_read_json_dict(Req, Data, []),
  solve(Data, Solution),
  cors_enable,
  reply_json(Solution).

sudoku_handler(_) :- throw(http_reply(server_error('Method not supported. Only POST.'))).

main:-
  server(5000).
