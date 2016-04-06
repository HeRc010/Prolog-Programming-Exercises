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

% matchStrength(+P, +L, -X)
matchStrength(_, [], X) :- X \== X.
matchStrength(P, [F|_], X) :- pairSum(P, Y),
                              Y == F,
                              X = F.
matchStrength(P, [F|L], X) :- pairSum(P, Y),
                              Y \== F,
                              matchStrength(P, L, Z),
                              X = Z.

% removeFirstInstances(+L1, +L2, -L3)
removeFirstInstances([], X, X).
removeFirstInstances([F|L1], L2, L3) :- removeFirstInstances(L1, L2, W),
                                        removeFirstInstance(W, F, X),
                                        L3 = X.

% removeFirstInstance(+L1, +X, -L2)
%
% Test Cases:
% removeFirstInstance([1,2],0,X). -> X = [1, 2]
% removeFirstInstance([1,2],1,X). -> X = [2]
% removeFirstInstance([1,2],2,X). -> X = [1]
% removeFirstInstance([1,2,2],2,X). -> X = [1, 2]
% removeFirstInstance([1,2,2,3,2],2,X). -> X = [1, 2, 3, 2]
% removeFirstInstance([1,2,2,3,2],3,X). -> X = [1, 2, 2, 2]
% removeFirstInstance([1,2,2,3,2],1,X). -> X = [2, 2, 3, 2]
removeFirstInstance(L1, X, L2) :- removeFirstInstance_h(L1, X, 0, Y),
                                  reverse(Y, Z),
                                  L2 = Z.

removeFirstInstance_h([], _, _, []).
removeFirstInstance_h([F|L1], X, Y, L2) :- F == X,
                                          W is Y + 1,
                                          removeFirstInstance_h(L1, X, W, Z),
                                          F == X,
                                          W == 1,
                                          L2 = Z.
removeFirstInstance_h([F|L1], X, Y, L2) :- F == X,
                                          W is Y + 1,
                                          removeFirstInstance_h(L1, X, W, Z),
                                          F \== X,
                                          appendValue(Z, F, A),
                                          L2 = A.
removeFirstInstance_h([F|L1], X, Y, L2) :- F == X,
                                          W is Y + 1,
                                          removeFirstInstance_h(L1, X, W, Z),
                                          F == X,
                                          W \== 1,
                                          appendValue(Z, F, A),
                                          L2 = A.
removeFirstInstance_h([F|L1], X, Y, L2) :- F \== X,
                                          removeFirstInstance_h(L1, X, Y, Z),
                                          F == X,
                                          Y == 1,
                                          L2 = Z.
removeFirstInstance_h([F|L1], X, Y, L2) :- F \== X,
                                          removeFirstInstance_h(L1, X, Y, Z),
                                          F \== X,
                                          appendValue(Z, F, A),
                                          L2 = A.
removeFirstInstance_h([F|L1], X, Y, L2) :- F \== X,
                                          removeFirstInstance_h(L1, X, Y, Z),
                                          F == X,
                                          Y \== 1,
                                          appendValue(Z, F, A),
                                          L2 = A.

% countInstances(+L, +X, -Y)
countInstances([], _, 0).
countInstances([F|L], X, Y) :- countInstances(L, X, W),
                              F == X,
                              Z is W + 1,
                              Y = Z.
countInstances([F|L], X, Y) :- countInstances(L, X, W),
                              F \== X,
                              Y = W.

% buildPairs(+L, -P)
%
% Test Cases:
%
% buildPairs([],[[]]).
% buildPairs([1, 2],[[1, 2]]).
% buildPairs([1, 2, 3], [[1, 2], [1, 3], [2, 3]]).
% buildPairs([1, 2, 3, 4], [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]]).
buildPairs([], [[]]). % edge case; may be uneeded
buildPairs([_], _).
buildPairs([F|L], P) :- buildPairs(L, W),
                        buildPairs_h(F, L, X),
                        append(W, X, Y),
                        P = Y.

buildPairs_h(_, [], []).
buildPairs_h(X, [F|L], P) :- buildPairs_h(X, L, W),
                            pair(X, F, Y),
                            appendValue(W,Y,Z),
                            P = Z.

% contains(+L, +X)
contains([], X) :- X \== X.
contains([X|_], X).
contains([_|L], X) :- contains(L, X).

% empty(+L)
empty([]).

% appendValue(+L, +V, -X)
%appendValue([],X,[F|L]) :- X = F,length(L,Y),Y == 0.
appendValue([],X,[X|L]) :- empty(L). %length(L,0).
appendValue([F|L1], X, [F|L2]) :- appendValue(L1,X,L2).

% append(+L1, +L2, -L)
append([], X, X).
append([A|L1], L2, [A|L3]) :- append(L1, L2, L3).

% pair(+X, +Y, -Z)
pair(X, Y, Z) :- Z = [X, Y].

% pairSum(+P, -X)
pairSum([],_).
pairSum([_],_).
pairSum([X, Y], Z) :- Z is X + Y.
