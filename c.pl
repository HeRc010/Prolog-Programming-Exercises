:- use_module(library(clpfd)).
:- use_module(library(arithmetic)).

fourSquares(N,X) :- fourSquares_h(N,X),label(X).

fourSquares_h(N,[S1,S2,S3,S4]) :- N >= 0,
                                R is floor(sqrt(N)),
                                Vars = [S1, S2, S3],
                                Vars ins 0..R,
                                S4 in 1..R,
                                S1^2 + S2^2 + S3^2 + S4^2 #= N,
                                S1 #=< S2,
                                S2 #=< S3,
                                S3 #=< S4.

equal_strength([X],[X]).
equal_strength([X],[Y,Z]) :- X = W, W is Y + Z.
equal_strength([X,Y],[Z]) :- Z = W, W is X + Y.
equal_strength([W,X],[Y,Z]) :- U = V, U is W + X, V is Y + Z.

enumerate([]).
enumerate([_|L]) :- enumerate(L).

% buildPairs(+L, -P)
%
% Test Cases:
%
% buildPairs([],[[]]) -> true
% buildPairs([1, 2],[[1, 2]])
% buildPairs([1, 2, 3], [[1, 2], [1, 3], [2, 3]])
% buildPairs([1, 2, 3, 4], [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]])

buildPairs([_], _). % edge case
buildPairs([], [[]]).
%buildPairs(L, P) :- .

%buildPairs_h(X, L, P) :-

appendValue([],X,[F|L]) :- X = F,xcount(L,Y),Y == 0.
appendValue([F|L1], X, [F|L2]) :- appendValue(L1,X,L2).

pair(X, Y, Z) :- Z = [X, Y].
