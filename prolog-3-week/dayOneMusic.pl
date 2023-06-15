musician(gorshok).
musician(balu).
musician(knyaz).
musician(lindemann).
musician(kruspe).
musician(landers).
musician(lorenz).
musician(schneider).

instrument(vocals, gorshok).
instrument(vocals, knyaz).
instrument(giitar, balu).
instrument(vocals, lindemann).
instrument(giitar, kruspe).
instrument(keyboards, lorenz).
instrument(drums, schneider).

jenre(punk, gorshok).
jenre(punk, balu).
jenre(metall, lindemann).

plays(X, Y) :- musician(X), instrument(Y, X).

