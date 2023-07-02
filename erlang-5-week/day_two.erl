-module(day_two).
-export([get_value/2]).
-export([get_total_prices/1]).

%%1
get_value(Key, List) ->
  case lists:keyfind(Key, 1, List) of
    {_, Value} -> Value;
    false -> not_found
  end.
%% day_two:get_value(ruby, [{erlang,"afunctionallanguage"}, {ruby,"anOOlanguage"}]).

%%2
get_total_prices(Cart) -> [{Item, Quantity * Price} || {Item, Quantity, Price} <- Cart].
%% [{pencil, 4, 0.25}, {pen, 1, 1.20}, {paper, 2, 0.20}]

%%3

