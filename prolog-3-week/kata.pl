%my
binary_search(List, Target, Index) :-
    get_middle(List, Middle),
    dif(Middle, Target),
    split_list(List, Left, Right),
    (Middle > Target -> binary_search(Left, Target, Index); binary_search(Right, Target, Index)).

binary_search(List, Target, _) :-
    get_middle(List, Middle),
    Middle = Target.

%Stack Overflow
get_middle(List, Middle) :-
    List = [_|_],           % at least one element
    length(List, Len),
    divmod(Len, 2, Q, R),   % if not available do in two separate steps
    N is Q + R,
    nth1(N, List, Middle).

%chat gpt
split_list(List, List1, List2) :-
    append(List1, List2, List),
    length(List1, N),
    length(List2, M),
    (N =:= M; N + 1 =:= M).

split_list([], [], []).    % Base case: If the input list is empty, both output lists are also empty.
split_list([X], [X], []).  % Special case for a list with a single element: X is added to the first output list, and the second output list remains empty.

%['kata.pl'].
%binary_search([-1, 0, 3, 5, 9, 12], 9, What).
