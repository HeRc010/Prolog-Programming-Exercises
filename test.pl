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

xunique([],_).
%xunique(L1,[F|L2]) :- xunique(L1,L2),xcount(L2,X),X == 0,xcount(L1,Y),Y == 1.
%xunique(L1,[F|L2]) :- xunique(L1,L2),xnot_contains(L1,F),xcontains(L2,F).
%xunique([F|L1],L2) :- xunique(L1,L2),xnot_contains(L1,F),xcontains(L2,F).
