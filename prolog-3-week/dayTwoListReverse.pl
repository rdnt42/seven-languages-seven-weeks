reverse_ist([], []).
reverse_ist([X], [X]).
reverse_ist([Head|Tail], ReverseList) :- reverse_ist(Tail, T), append(T, [Head], ReverseList).

%['dayTwoListReverse.pl'].
%reverse_ist([1,2,3], What).