first(First, List) :- [First|_] = List.

final([Final], Final).
final([First|Rest], Final) :-
    final(Rest, Final).

total([], 0).
total([Number|Rest], Sum) :-
    total(Rest, PartialSum),
    Sum is PartialSum + Number.

sum(List, Total) :- sum(List, 0, Total).

sum([], Final, Final).
sum([Number|Rest], Acc, Final) :-
    PartialSum is Acc + Number,
    sum(Rest, PartialSum, Final).
