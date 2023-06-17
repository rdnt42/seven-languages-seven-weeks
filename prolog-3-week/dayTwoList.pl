%1
reverse_ist([], []).
reverse_ist([X], [X]).
reverse_ist([Head|Tail], ReverseList) :- reverse_ist(Tail, T), append(T, [Head], ReverseList).

%['dayTwoList.pl'].
%reverse_ist([1,2,3], What).

%2
min_value(Head, [Head]).
min_value(MinValue, [Head|Tail]) :-
    min_value(CurrMinVal, Tail),
    (Head < CurrMinVal -> MinValue = Head; MinValue = CurrMinVal).
%min_value(What, [3,2,5,1,4]).

%3 copy from github https://gist.github.com/kubek2k/1682480#file-quicksort-pl
pivot(_, [], [], []).
pivot(Pivot, [Head|Tail], [Head|LessOrEqualThan], GreaterThan) :-
    Pivot >= Head,
    pivot(Pivot, Tail, LessOrEqualThan, GreaterThan).
pivot(Pivot, [Head|Tail], LessOrEqualThan, [Head|GreaterThan]) :- pivot(Pivot, Tail, LessOrEqualThan, GreaterThan).

quicksort([], []).
quicksort([Head|Tail], Sorted) :-
    pivot(Head, Tail, List1, List2),
    quicksort(List1, SortedList1),
    quicksort(List2, SortedList2),
    append(SortedList1, [Head|SortedList2], Sorted).
%quicksort([4,1,3,7,5], What).