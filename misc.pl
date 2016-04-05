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

power(_,0,1).
power(X,Y,Z) :- V is Y - 1,
                power(X,V,W),
                Z is X * W.

sum([], 0).
sum([F|L], X) :- sum(L,Y),
                X is F + Y.

xnot_maximal_h(X,[]) :- X \== X. % ensure the result is false
xnot_maximal_h(Clique,[F|_]) :- xcontains_clique(Clique,F).
xnot_maximal_h(Clique,[F|L]) :- xnot_contains_clique(Clique,F),xnot_maximal_h(Clique,L).

xnot_maximal(Clique,Cliques) :- xremove_all(Cliques,Clique,L),xnot_maximal_h(Clique,L).

%:- begin_tests(xcontains_clique).
%test(xcontains_clique) :- xcontains_clique([a,b],[a,b,c]).
%test(xcontains_clique,fail) :- xcontains_clique([a,e],[a,b,c]).
%:- end_tests(xcontains_clique).
