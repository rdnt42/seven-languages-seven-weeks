-module(kata).
-export([binary_search/2]).

binary_search(Target, Nums) ->
  get_index(0, length(Nums) - 1, Target, Nums).

get_index(Start, End, Target, Nums) ->
  case Start > End of
    true -> -1;
    false ->
      Half = (End - Start) div 2 + Start,
      Value = lists:nth(Half, Nums),
      if
        Value == Target -> Half;
        Value > Target -> get_index(Start, Half - 1, Target, Nums);
        true -> get_index(Half + 1, End, Target, Nums)
      end
  end.

%%
%%kata:binary_search(9, [-1, 0, 3, 5, 9, 12]).
