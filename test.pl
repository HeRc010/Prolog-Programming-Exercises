xappend([], X, X).
xappend([A|L1], L2, [A|L3]) :- xappend(L1,L2,L3).

xadd(X,Y,Z) :- Z is X + Y.
xsub(X,Y,Z) :- Z is X - Y.

xisempty([]).

xlast([X], X).
xlast([_|X],Y) :- xlast(X,Y).

xexcept_last([_],[]).
xexcept_last([F|L1],[F|L2]) :- xexcept_last(L1, L2).

xfirst([A|_],Y) :- Y == A.

xlists_equal([],[]).
xlists_equal([F1|L1],[F2|L2]) :- F1 == F2,xlists_equal(L1,L2).

xrest([_|L1],L2) :- xlists_equal(L1,L2).

xreverse([],[]).
xreverse([X],[X]).
xreverse(L1,[F2|L2]) :- xexcept_last(L1, X),xreverse(X,L2),xlast(L1,F2).

xcontains([],X) :- X \== X.
xcontains([F|_],X) :- F == X.
xcontains([_|L], X) :- xcontains(L,X).

xnot_contains([],_).
xnot_contains([F|L],X) :- F \== X,xnot_contains(L,X).

xcount([],0).
xcount([_|L],X) :- xcount(L,Y),X is 1 + Y.

xcount_instances([],_,0).
xcount_instances([F|L],X,Y) :- F == X,xcount_instances(L,X,Z),Y is Z + 1.
xcount_instances([F|L],X,Y) :- F \== X,xcount_instances(L,X,Y).

xappend_value([],X,[F|L]) :- X = F,xcount(L,Y),Y == 0.
xappend_value([F|L1], X, [F|L2]) :- xappend_value(L1,X,L2).
