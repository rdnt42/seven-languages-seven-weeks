book(dune, frankHerbert).
book(hyperion, simmons).
book(hyperionFalling, simmons).
book(foundation, asimov).
book(endOfEternity, asimov).
book(underTheDome, king).
book(stand, king).
book(runningMan, king).

author(X, Y) :- book(X, Y).

%author(What, king).
%;

