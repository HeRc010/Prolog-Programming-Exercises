:- use_module(library(clpfd)).
:- use_module(library(arithmetic)).

fourSquares(N,X) :- fourSquares_h(N,X),label(X).

fourSquares_h(N,[S1,S2,S3,S4]) :- R is floor(sqrt(N)),
                                Vars = [S1, S2, S3],
                                Vars ins 0..R,
                                S4 in 1..R,
                                S1^2 + S2^2 + S3^2 + S4^2 #= N,
                                S1 #=< S2,
                                S2 #=< S3,
                                S3 #=< S4.

puzzle([S,E,N,D] + [M,O,R,E] = [M,O,N,E,Y]) :-
        Vars = [S,E,N,D,M,O,R,Y],
        Vars ins 0..9,
        all_different(Vars),
                  S*1000 + E*100 + N*10 + D +
                  M*1000 + O*100 + R*10 + E #=
        M*10000 + O*1000 + N*100 + E*10 + Y,
        M #\= 0, S #\= 0.
