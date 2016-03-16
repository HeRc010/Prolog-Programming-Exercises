xadd(X,Y,Z) :- Z is X + Y.
xsub(X,Y,Z) :- Z is X - Y.

xisempty([]).

xfirst([A|_],X) :- X = A.

xrest([_|L1],L2) :- xlists_equal(L1,L2).

xcontains([],X) :- X \== X.
xcontains([F|_],X) :- F == X.
xcontains([_|L], X) :- xcontains(L,X).

xcount_instances([],_,0).
xcount_instances([F|L],X,Y) :- F == X,xcount_instances(L,X,Z),Y is Z + 1.
xcount_instances([F|L],X,Y) :- F \== X,xcount_instances(L,X,Y).

xcontains([],X) :- X \== X.
xcontains([F|_],X) :- F == X.
xcontains([_|L], X) :- xcontains(L,X).

xnot_contains([],_).
xnot_contains([F|L],X) :- F \== X,xnot_contains(L,X).

xcount([],0).
xcount([_|L],X) :- xcount(L,Y),X is 1 + Y.

xappend_value([],X,[F|L]) :- X = F,xcount(L,Y),Y == 0.
xappend_value([F|L1], X, [F|L2]) :- xappend_value(L1,X,L2).
