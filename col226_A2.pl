hastype(_, intT(N), intT).
hastype(_, boolT(true), boolT).
hastype(_, bootT(false), boolT).
hastype(G,varT(X),T) :- member((X,T),G), !.
hastype(_, N, intT).
hastype(_, true, boolT).
hastype(_, false, boolT).
hastype(G, X, T) :- member((X,T),G), !.
hastype(G, plus(E1, E2), intT) :- hastype(G, E1, intT), hastype(G, E2, intT).
hastype(G, times(E1, E2), intT) :- hastype(G, E1, intT), hastype(G, E2, intT).
hastype(G, and(E1, E2), boolT) :- hastype(G, E1, boolT), hastype(G, E2, boolT).
hastype(G, or(E1, E2), boolT) :- hastype(G, E1, boolT), hastype(G, E2, boolT).
hastype(G, not(E), boolT) :- hastype(G, E, boolT).
hastype(G, equal(E1, E2), boolT) :- hastype(G, E1, T), hastype(G, E2, T).
hastype(G, gt(E1, E2), boolT) :- hastype(G, E1, intT), hastype(G, E2, intT).
hastype(G, minus(E1, E2), intT) :- hastype(G, E1, intT), hastype(G, E2, intT).
hastype(G, divide(E1, E2), intT) :- hastype(G, E1, intT), hastype(G, E2, intT).
hastype(G, mod(E1, E2), intT) :- hastype(G, E1, intT), hastype(G, E2, intT).
hastype(G, lessThanOrEqual(E1, E2), boolT) :- hastype(G, E1, intT), hastype(G, E2, intT).
hastype(G, greaterThanOrEqual(E1, E2), boolT) :- hastype(G, E1, intT), hastype(G, E2, intT).
hastype(G, notEqual(E1, E2), boolT) :- hastype(G, E1, T), hastype(G, E2, T).
hastype(G, if(E1, E2, E3), T) :- hastype(G, E1, boolT), hastype(G, E2, T), hastype(G, E3, T).
hastype(G, not(E), boolT) :- hastype(G, E, boolT).


% Example usage:
% hastype([(x,intT)],varT(x),Type).
% Type = intT.
% hastype([(x,boolT),(y,boolT)], and(varT(x),varT(y)), boolT).
% true.
% hastype([], 5 + 3, Type).
% Type = intT.


%hastype([(a, intT), (b,intT)], plus(times(varT(a), intT(5)),times(varT(b), intT(3))), boolT).
% hastype([(a, intT), (b,intT)],plus(times(varT(a), intT(5)),times(var(b), intT(3))), intT).
%hastype([(a, intT), (b, intT)], not(gt(plus(times(varT(a), intT(5)), times(varT(b), intT(3))), intT(0))), boolT).
%hastype([(a, intT), (b,intT)], not(gt(plus(times(varT(a), intT(5)),times(var(b), intT(3)))), intT(0)), inT).
%hastype([(c,boolT)], varT(c), inT).
%hastype([(c,boolT)], varT(c), boolT).
%hastype([(a, boolT), (b, boolT)], and(or(boolT(false), varT(a)), and(varT(b), boolT(true))), boolT).
hastype([(a, boolT), (b, boolT)], and(or(false, varT(a)), and(varT(b), true)), inT).
%hastype([(a, boolT)], not(varT(a)), boolT).
%hastype([(a, intT), (b, intT)], equal(plus(varT(a), intT(5)), times(varT(b),intT(3))), boolT).