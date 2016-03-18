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

xcontains_clique([], _).
xcontains_clique([F1|Clique1], Clique2) :- xcount_instances(Clique2,F1,X),X == 1,xcontains_clique(Clique1,Clique2).

%:- begin_tests(xcontains_clique).
%test(xcontains_clique) :- xcontains_clique([a,b],[a,b,c]).
%test(xcontains_clique,fail) :- xcontains_clique([a,e],[a,b,c]).
%:- end_tests(xcontains_clique).
