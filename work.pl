%-----------------------------------------------------------------------------------------------------------------------

xlast([X], X).
xlast([_|X],Y) :- xlast(X,Y).

xexcept_last([_],[]).
xexcept_last([F|L1],[F|L2]) :- xexcept_last(L1, L2).

xreverse([],[]).
xreverse(L1,[F2|L2]) :- xexcept_last(L1, X),xreverse(X,L2),xlast(L1,F2).

%-----------------------------------------------------------------------------------------------------------------------

xlists_equal([],[]).
xlists_equal([F1|L1],[F2|L2]) :- F1 = F2,xlists_equal(L1,L2).

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

xappend_value_to_front(L1, X, [F2|L2]) :- X = F2,xlists_equal(L1,L2).

xunique_helper(_,[],[]).
%xunique_helper(L1,[F2|L2],X):-xunique_helper(L1,L2,Y),xcount_instances(L1,F2,C),C==1,xnot_contains(Y,F2),xappend_value_to_front(Y,F2,Z),X=Z.
%xunique_helper(L1,[F2|L2],X):-xunique_helper(L1,L2,Y),xcount_instances(L1,F2,C),C\==1,X=Y.

xunique_helper(L1,[F2|L2],X):-xunique_helper(L1,L2,Y),xnot_contains(Y,F2),xappend_value_to_front(Y,F2,Z),X=Z.
xunique_helper(L1,[F2|L2],X):-xunique_helper(L1,L2,Y),xcontains(Y,F2),X=Y.

xunique(L,X) :- xunique_helper(L,L,X).

%-----------------------------------------------------------------------------------------------------------------------

xunion(_,_,_).

%-----------------------------------------------------------------------------------------------------------------------

removeLast([X],[],X).
removeLast([F|L1],[F|L2],L3) :- removeLast(L1,L2,L3).

%-----------------------------------------------------------------------------------------------------------------------

clique(_).
