%my
binary_search(List, Target, StartIndex, ResultIndex) :-
    get_middle(List, Middle, _),
    dif(Middle, Target),
    split_list(List, Left, Right),
    length(Left, N),
    (Middle > Target ->
        binary_search(Left, Target, StartIndex, ResultIndex);
        NewStartIndex is (StartIndex + N),
        binary_search(Right, Target, NewStartIndex, ResultIndex)
    ).

binary_search(List, Target, StartIndex, ResultIndex) :-
    get_middle(List, Middle, MiddleIndex),
    Middle = Target,
    ResultIndex is (StartIndex + MiddleIndex - 1).

%Stack Overflow
get_middle(List, Middle, Index) :-
    List = [_|_],           % at least one element
    length(List, Len),
    divmod(Len, 2, Q, R),   % if not available do in two separate steps
    Index is Q + R,
    nth1(Index, List, Middle).

%chat gpt
split_list(List, List1, List2) :-
    append(List1, List2, List),
    length(List1, N),
    length(List2, M),
    (N =:= M; N + 1 =:= M).

split_list([], [], []).    % Base case: If the input list is empty, both output lists are also empty.
split_list([X], [X], []).  % Special case for a list with a single element: X is added to the first output list, and the second output list remains empty.

%['kata.pl'].
%binary_search([-1, 0, 3, 5, 9, 12], 9, 1, What).
