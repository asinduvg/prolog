% edge(a, b).
% edge(a, c).
% edge(a, d).
% edge(b, c).

edge(a, b).
edge(a, c).
edge(b, c).
edge(c, f).
edge(d, e).
% edge(c, a). % breaks when added cycles

sources(Destination, List) :-
    findall(Source, edge(Source, Destination), List).
    
destinations(Source, List) :-
    findall(Destination, edge(Source, Destination), List).

reachable(A, B) :-
    edge(A, B).

reachable(A, B) :-
    edge(A, C),
    reachable(C, B).
