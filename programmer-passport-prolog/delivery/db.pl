distance(austin, sanantonio, 80).
distance(austin, dallas, 200).
distance(austin, houston, 170).
distance(houston, sanantonio, 200).
distance(dallas, houston, 240).

edge(From, To, Distance) :-
    distance(From, To, Distance);
    distance(To, From, Distance).

path(From, To, Seen, [To|Seen], PartialDistance, Distance) :-
    edge(From, To, D),
    Distance is PartialDistance + D.
    
path(From, To, Seen, Path, PartialDistance, Distance) :-
    edge(From, B, D),
    B \== To,
    \+member(B, Seen),
    NewPartialDistance is PartialDistance + D,
    path(B, To, [B|Seen], Path, NewPartialDistance, Distance).

go(From, To, Path, Distance) :-
    path(From, To, [From], Result, 0, Distance),
    reverse(Path, Result).
    
shortest(From, To, Path, Distance) :-
    aggregate(
        min(Distance, Path), 
        go(From, To, Path, Distance), 
        min(Distance, Path)).

longest(From, To, Path, Distance) :-
    aggregate(
        max(Distance, Path), 
        go(From, To, Path, Distance), 
        max(Distance, Path)).

mpg(tesla, 140).
mpg(hummer, 20).

fuel(From, To, Vehicle, Path, Distance, Gallons) :-
    mpg(Vehicle, Mpg),
    go(From, To, Path, Distance),
    Gallons is Distance / Mpg.

