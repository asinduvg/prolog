border(Country1, Country2) :-
    color(Country1),
    color(Country2),
    dif(Country1, Country2).

color(Color) :-
    member(Color, [red, yellow, blue, green]).

coloring(Chilie, Argentina, Bolivia, Uruguay, Paraguay, Peru, Brazil) :-
    border(Chilie, Argentina),
    border(Chilie, Bolivia),
    border(Chilie, Peru),
    border(Argentina, Bolivia),
    border(Argentina, Paraguay),
    border(Uruguay, Argentina),
    border(Uruguay, Paraguay),
    border(Bolivia, Paraguay),
    border(Bolivia, Peru),
    border(Brazil, Peru),
    border(Brazil, Paraguay),
    border(Brazil, Bolivia),
    border(Brazil, Uruguay).