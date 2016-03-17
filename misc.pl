xadd(X,Y,Z) :- Z is X + Y.
xsub(X,Y,Z) :- Z is X - Y.

xisempty([]).

xfirst([A|_],X) :- X = A.

xrest([_|L1],L2) :- xlists_equal(L1,L2).

xcontains([],X) :- X \== X.
xcontains([F|_],X) :- F == X.
xcontains([_|L], X) :- xcontains(L,X).

xcontains([],X) :- X \== X.
xcontains([F|_],X) :- F == X.
xcontains([_|L], X) :- xcontains(L,X).

xappend_value([],X,[F|L]) :- X = F,xcount(L,Y),Y == 0.
xappend_value([F|L1], X, [F|L2]) :- xappend_value(L1,X,L2).
