:- use_module(library(aggregate)).

edge(a, b, 1).
edge(a, c, 3).
edge(b, c, 1).
edge(c, f, 2).
edge(d, e, 2).

connected(A, B, Weight) :-
    edge(A, B, Weight); edge(B, A, Weight).

go(From, To, Seen, [To|Seen], PartialWeight, Weight) :-
    connected(From, To, W),
    Weight is PartialWeight + W.
go(From, To, Seen, Path, PartialWeight, Weight) :-
    connected(From, Between, W),
    Between \== To,
    \+member(Between, Seen),
    IncrementalWeight is PartialWeight + W,
    go(Between, To, [Between|Seen], Path, IncrementalWeight, Weight).

path(From, To, Path, Weight) :-
    go(From, To, [From], Result, 0, Weight),
    reverse(Path, Result).

minimum_path(From, To, Path, Weight) :-
    aggregate(
        min(W, P), 
        path(From, To, P, W), 
        min(Weight, Path)).

maximum_path(From, To, Path, Weight) :-
    aggregate(
        max(W, P), 
        path(From, To, P, W), 
        max(Weight, Path)).
