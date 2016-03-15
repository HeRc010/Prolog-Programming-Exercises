xappend([], X, X).
xappend([A|L1], L2, [A|L3]) :- xappend(L1,L2,L3).

xadd(X,Y,Z) :- Z is X + Y.
xsub(X,Y,Z) :- Z is X - Y.

xisempty([]).

xlast([],_).
xlast([X],X).
xlast([_|X],Y) :- xlast(X,Y).

xfirst([A|_],Y) :- Y = A.

xreverse([],[]).
xreverse([X],[X]).
xreverse([_|L],[A|X]) :- xreverse(L,X),xlast(L,A).
