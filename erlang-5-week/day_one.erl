-module(day_one).
-export([another_factorial/1]).
-export([another_fib/1]).
-export([counter/1]).

another_factorial(0) -> 1;
another_factorial(N) -> N * another_factorial(N-1).

another_fib(0) -> 1;
another_fib(1) -> 1;
another_fib(N) -> another_fib(N-1) + another_fib(N-2).

%%1
counter(1) -> 1;
counter(N) -> io:fwrite("~w~n",[N]), counter(N-1).

