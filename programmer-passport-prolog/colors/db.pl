different(yellow, red).
different(red, yellow).
different(yellow, blue).
different(blue, yellow).
different(blue, red).
different(red, blue).

coloring(Chilie, Argentina, Bolivia, Uruguay, Paraguay, Peru) :-
    different(Chilie, Argentina),
    different(Chilie, Bolivia),
    different(Chilie, Peru),
    different(Argentina, Bolivia),
    different(Argentina, Paraguay),
    different(Uruguay, Argentina),
    different(Uruguay, Paraguay),
    different(Bolivia, Paraguay),
    different(Bolivia, Peru).