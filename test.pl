:- consult(work).

% tests test
xadd(X,Y,Z) :- Z is X + Y.

:- begin_tests(xadd).
test(xadd) :- xadd(1,2,3).
test(xadd,fail) :- xadd(1,2,2).
test(xadd,true(X == 3)) :- xadd(1,2,X).
test(xadd,all(X == [3])) :- xadd(1,2,X).
:- end_tests(xadd).

% xreverse
%:- begin_tests(xreverse).
%test(xreverse) :- xreverse([7,3,4],[4,3,7]).
%test(xreverse, fail) :- xreverse([7,3,4],[4,3,5]).
%test(xreverse,true(R == [4,3,7])) :- xreverse([7,3,4], R).
%:- end_tests(xreverse).

% xunique
:- begin_tests(xunique).
test(xunique,true(L == [a,c,d])) :- xunique([a,c,a,d],L).
test(xunique) :- xunique([a,c,a,d], [a,c,d]).
test(xunique,fail) :- xunique([a,c,a,d], [c,a,d]).
test(xunique,true(L == [a,b,c])) :- xunique([a,a,a,a,a,b,b,b,b,b,c,c,c,c,b,a], L).
test(xunique,true(L == [])) :- xunique([], L).
:- end_tests(xunique).

% xunion
%:- begin_tests(xunion).
%test(xunion,true(L=[a,c,d,b])) :- xunion([a,c,a,d],[b,a,c],L).
%test(xunion) :- xunion([a,c,d], [b,a,c], [a,c,d,b]).
%test(xunion, fail) :- xunion([a,c,d], [b,a,c], [a,c,d,b,a]).
%:- end_tests(xunion).

% removeLast
%:- begin_tests(removeLast).
%test(removeLast,true(L1 == [a,c,a])) :- removeLast([a,c,a,d], L1, Last).
%test(removeLast,true(Last == d)) :- removeLast([a,c,a,d], L1, Last).

%test(removeLast,true(L1 == [a,c,a])) :- removeLast([a,c,a,d], L1, d).

%test(removeLast,fail) :- removeLast([a,c,a,d], L1, [d]).

%test(removeLast,true(L1 == [])) :- removeLast([a], L1, Last).
%test(removeLast,true(Last == a)) :- removeLast([a], L1, Last).

%test(removeLast,true(L1 == [])) :- removeLast([[a,b,c]], L1, Last).
%test(removeLast,true(Last == [a,b,c])) :- removeLast([[a,b,c]], L1, Last).
%:- end_tests(removeLast).

:- run_tests.
