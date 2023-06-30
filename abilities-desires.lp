% absence of target

%%% means-end derivation

posdes(A) :- -negdes(C), -holds(C), holds(one_poscauses(A, C)).  %1 r
negdes(A) :- -posdes(C), -holds(C), holds(many_poscauses(A, C)). %2 r
posdes(A) :- -posdes(C), -holds(C), holds(one_negcauses(A, C)).  %3 a
negdes(A) :- -negdes(C), -holds(C), holds(many_negcauses(A, C)). %4 a

%%% creation of instrument

holds(some_poscauses(C)) :- holds(poscauses(_, C)).
holds(some_negcauses(C)) :- holds(negcauses(_, C)).

posdes(B) :- -holds(C), not holds(some_poscauses(C)), posdes(C), holds(poscauses(B, poscauses(A, C))). %5 rr
negdes(B) :- -holds(C), not holds(some_poscauses(C)), posdes(C), holds(negcauses(B, poscauses(A, C))). %6 rr
negdes(B) :- -holds(C), not holds(some_poscauses(C)), negdes(C), holds(poscauses(B, poscauses(A, C))). %7 ar
posdes(B) :- -holds(C), not holds(some_poscauses(C)), negdes(C), holds(negcauses(B, poscauses(A, C))). %8 ar

negdes(B) :- -holds(C), not holds(some_negcauses(C)), posdes(C), holds(poscauses(B, negcauses(A, C))). %9  ra
posdes(B) :- -holds(C), not holds(some_negcauses(C)), posdes(C), holds(negcauses(B, negcauses(A, C))). %10 aa
posdes(B) :- -holds(C), not holds(some_negcauses(C)), negdes(C), holds(poscauses(B, negcauses(A, C))). %11 ra
negdes(B) :- -holds(C), not holds(some_negcauses(C)), negdes(C), holds(negcauses(B, negcauses(A, C))). %12 aa

%%% protection of instrument

negdes(B) :- -holds(C), holds(poscauses(A, C)), posdes(C), holds(poscauses(B, neg(poscauses(A, C)))). %13 er
posdes(B) :- -holds(C), holds(poscauses(A, C)), posdes(C), holds(negcauses(B, neg(poscauses(A, C)))). %14 kr
posdes(B) :- -holds(C), holds(poscauses(A, C)), negdes(C), holds(poscauses(B, neg(poscauses(A, C)))). %15 er
negdes(B) :- -holds(C), holds(poscauses(A, C)), negdes(C), holds(negcauses(B, neg(poscauses(A, C)))). %16 kr

posdes(B) :- -holds(C), holds(negcauses(A, C)), posdes(C), holds(poscauses(B, neg(negcauses(A, C)))). %17 ea
negdes(B) :- -holds(C), holds(negcauses(A, C)), posdes(C), holds(negcauses(B, neg(negcauses(A, C)))). %18 ka
negdes(B) :- -holds(C), holds(negcauses(A, C)), negdes(C), holds(poscauses(B, neg(negcauses(A, C)))). %19 ea
posdes(B) :- -holds(C), holds(negcauses(A, C)), negdes(C), holds(negcauses(B, neg(negcauses(A, C)))). %20 ka

% presence of target

%%% means-end derivation

negdes(A) :- posdes(C), holds(C), holds(poscauses(A, neg(C))). %21 e
posdes(A) :- negdes(C), holds(C), holds(poscauses(A, neg(C))). %22 e
negdes(A) :- negdes(C), holds(C), holds(negcauses(A, neg(C))). %23 k
posdes(A) :- posdes(C), holds(C), holds(negcauses(A, neg(C))). %24 k

%%% creation of instrument

negdes(B) :- holds(C), not holds(some_poscauses(C)), posdes(C), holds(poscauses(B, poscauses(A, neg(C)))). %25 re
posdes(B) :- holds(C), not holds(some_poscauses(C)), posdes(C), holds(negcauses(B, poscauses(A, neg(C)))). %26 ae
posdes(B) :- holds(C), not holds(some_poscauses(C)), negdes(C), holds(poscauses(B, poscauses(A, neg(C)))). %27 re
negdes(B) :- holds(C), not holds(some_poscauses(C)), negdes(C), holds(negcauses(B, poscauses(A, neg(C)))). %28 ae

posdes(B) :- holds(C), not holds(some_negcauses(C)), posdes(C), holds(poscauses(B, negcauses(A, neg(C)))). %29 rk
negdes(B) :- holds(C), not holds(some_negcauses(C)), posdes(C), holds(negcauses(B, negcauses(A, neg(C)))). %30 ak
negdes(B) :- holds(C), not holds(some_negcauses(C)), negdes(C), holds(poscauses(B, negcauses(A, neg(C)))). %31 rk
posdes(B) :- holds(C), not holds(some_negcauses(C)), negdes(C), holds(negcauses(B, negcauses(A, neg(C)))). %32 ak

%%% protection of instrument

posdes(B) :- holds(C), holds(poscauses(A, neg(C))), posdes(C), holds(poscauses(B, neg(poscauses(A, neg(C))))). %33 ee
negdes(B) :- holds(C), holds(poscauses(A, neg(C))), posdes(C), holds(negcauses(B, neg(poscauses(A, neg(C))))). %34 ke
negdes(B) :- holds(C), holds(poscauses(A, neg(C))), negdes(C), holds(poscauses(B, neg(poscauses(A, neg(C))))). %35 ee
posdes(B) :- holds(C), holds(poscauses(A, neg(C))), negdes(C), holds(negcauses(B, neg(poscauses(A, neg(C))))). %36 ke

negdes(B) :- holds(C), holds(negcauses(A, neg(C))), posdes(C), holds(poscauses(B, neg(negcauses(A, neg(C))))). %37 ek
posdes(B) :- holds(C), holds(negcauses(A, neg(C))), posdes(C), holds(negcauses(B, neg(negcauses(A, neg(C))))). %38 kk
posdes(B) :- holds(C), holds(negcauses(A, neg(C))), negdes(C), holds(poscauses(B, neg(negcauses(A, neg(C))))). %39 ek
negdes(B) :- holds(C), holds(negcauses(A, neg(C))), negdes(C), holds(negcauses(B, neg(negcauses(A, neg(C))))). %40 kk

% relaxation

-negdes(C) :- posdes(C).
-posdes(C) :- negdes(C).
-negdes(C) :- nodes(C).
-posdes(C) :- nodes(C).

% constraints

-holds(C) :- holds(poscauses(A, C)), condition(C).
-holds(C) :- holds(negcauses(A, C)), condition(C).
holds(C) :- holds(poscauses(A, neg(C))), condition(C).
holds(C) :- holds(negcauses(A, neg(C))), condition(C).

% domains

condition(C) :- holds(C).
condition(C) :- -holds(C).
condition(C) :- holds(poscauses(_, C)).
condition(C) :- holds(negcauses(_, C)).
condition(C) :- holds(poscauses(_, neg(C))).
condition(C) :- holds(negcauses(_, neg(C))).

event(E) :- holds(poscauses(E, _)).
event(E) :- holds(negcauses(E, _)).

condition(X) :- posdes(X), not event(X).
condition(X) :- negdes(X), not event(X).
condition(X) :- -posdes(X), not event(X).
condition(X) :- -negdes(X), not event(X).

% closed world assumption

-holds(C) :- not holds(C), condition(C).

% allocation

{holds(C)} :- condition(C).