-module(day_two).
-export([get_value/2]).

%%1
get_value(Key, List) ->
  case lists:keyfind(Key, 1, List) of
    {_, Value} -> Value;
    false -> not_found
  end.
%% day_two:get_value(ruby, [{erlang,"afunctionallanguage"}, {ruby,"anOOlanguage"}]).