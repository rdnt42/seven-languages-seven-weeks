
-module(day_three).
-export([loop/0]).

%%1
loop() ->
  process_flag(trap_exit, true),
  receive
    new ->
      io:format("Creating and monitoring process.~n"),
      register(revolver, spawn_link(fun loop_translate/0)),
      loop();
    {'EXIT', From, Reason} ->
      io:format("The shooter ~p died with reason ~p.", [From, Reason]),
      io:format(" Restarting. ~n"),
      self() ! new,
      loop()
  end.

loop_translate() ->
  receive
    "casa" ->
      io:format("house~n"),
      loop_translate();

    "blanca" ->
      io:format("white~n"),
      loop_translate();

    _ ->
      io:format("I don't understand.~n"),
      exit({roulette,die,at,erlang:time()})
  end.

%%Translator = spawn(fun day_three:loop/0).
%%Translator ! new.
%%revolver ! "casa".