:- use_module(library(clpfd)).

% queen((Row, Col)) :-
%     in(Row, 1..8),
%     in(Col, 1..8).

% safe((R1, C1), (R2, C2)) :-
%     R1 =\= R2,
%     C1 =\= C2,
%     abs(R1-R2) =\= abs(C1-C2).

safe([]).
safe([Queen|Queens]) :-
    safe_queen(Queens, Queen, 1),
    safe(Queens).

queens(Queens) :-
    length(Queens, 8),
    Queens ins 1..8,
    all_different(Queens),
    safe(Queens).
    
different_diagonals(Queen1, Queen2, Distance) :- % Distance = column diff
    abs(Queen1 - Queen2) #\= Distance.

safe_queen([], _, _).
safe_queen([Queen|FollowingQueens], Target, Difference) :-
    different_diagonals(Queen, Target, Difference),
    safe_queen(FollowingQueens, Target, Difference + 1).