xappend([], X, X).
xappend([A|L1], L2, [A|L3]) :- xappend(L1,L2,L3).

xadd(X,Y,Z) :- Z is X + Y.
xsub(X,Y,Z) :- Z is X - Y.

xisempty([]).

xlast([X], X).
xlast([_|X],Y) :- xlast(X,Y).

xlast_n_minus_one([_],[]).
xlast_n_minus_one([F|L1],[F|L2]) :- xlast_n_minus_one(L1, L2).

xfirst([A|_],Y) :- Y == A.

xreverse([],[]).
xreverse([X],[X]).
xreverse(L1,[F2|L2]) :- xlast_n_minus_one(L1, X),xreverse(X,L2),xlast(L1,F2).
