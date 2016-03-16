% doesn't work at present

:-begin_tests(test).
test(A) :- A is 2^3,assertion(float(A)),assertion(A==9).
:-end_tests(test).
