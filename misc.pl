xappend([], X, X).
xappend([A|L1], L2, [A|L3]) :- xappend(L1,L2,L3).

xadd(X,Y,Z) :- Z is X + Y.
xsub(X,Y,Z) :- Z is X - Y.

xisempty([]).

xfirst([A|_],X) :- X = A.

xrest([_|L1],L2) :- xlists_equal(L1,L2).

xcontains([],X) :- X \== X.
xcontains([F|_],X) :- F == X.
xcontains([_|L], X) :- xcontains(L,X).
