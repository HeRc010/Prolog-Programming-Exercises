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

xappend_value_to_front(L1, X, [F2|L2]) :- X = F2,xlists_equal(L1,L2).

xremove_all([],_,[]).
xremove_all([F|L1],X,L2) :- xremove_all(L1,X,Y),F \== X,xappend_value_to_front(Y,F,Z),L2=Z.
xremove_all([F|L1],X,L2) :- xremove_all(L1,X,Y),F == X,L2=Y.

xunique([],[]).
xunique([F|L1],L2) :- xunique(L1,X),xremove_all(X,F,Y),xappend_value_to_front(Y,F,Z),L2=Z.

%-----------------------------------------------------------------------------------------------------------------------

xappend([], X, X).
xappend([A|L1], L2, [A|L3]) :- xappend(L1,L2,L3).

xremove_all_from_list([],_,[]).
xremove_all_from_list(X,[],X).
xremove_all_from_list(L1,[F2|L2],L3) :- xremove_all_from_list(L1,L2,X),xremove_all(X,F2,Y),L3=Y.

xunion([],[],[]).
xunion(L1,L2,L3) :- xunique(L1,X),xunique(L2,Y),xremove_all_from_list(Y,X,Z),xappend(X,Z,A),L3=A.

%-----------------------------------------------------------------------------------------------------------------------

removeLast([X],[],X).
removeLast([F|L1],[F|L2],L3) :- removeLast(L1,L2,L3).

%-----------------------------------------------------------------------------------------------------------------------

edge(X,Y) :- edge(Y,X).

allConnected([]).

maxclique(_,[]).
