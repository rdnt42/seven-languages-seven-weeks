game() :-
    writeln('choose number between 1 and 10'),
    random(1, 10, RndVal),
    read(Number),
    game_loop(Number, RndVal).

game_loop(Number, RndVal) :-
    dif(Number, RndVal),
    (Number < RndVal ->
        writeln('Your number is lower than the answer');
        writeln('Your number is greater than the answer')
    ),
    read(NewNumber),
    game_loop(NewNumber, RndVal).

game_loop(Number, RndVal) :-
    Number = RndVal,
    writeln('You won!').