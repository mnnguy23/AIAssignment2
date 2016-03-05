connect(a, b, 5).
connect(a, c, 8).
connect(a, d, 10).
connect(b, d, 2).
connect(b, e, 9).
connect(c, d, 4).
connect(c, f, 5).
connect(d, e, 6).
connect(d, f, 11).
connect(d, g, 4).
connect(e, g, 2).
connect(f, g, 1).

pathLength([_],0).
pathLength([S,F|T],Length):- %Seperate first two elements. This allows us to grab Distance from connect
	connect(S,F,Distance),
	pathLength([F|T], L1),%Remove S from list and do recursive call to pathLength
	Length is L1 + Distance.

path(Start,End,Length,Path):-
	path(Start, End, Length, [Start], Path).
path(End, End, Length, RPath, Path):-
	pathLength(Path, Length),%Pass the path constructed into pathLength
	reverse(RPath, Path).%Check both paths to ensure they are =
path(Start, End, Length, Visited, Path):-
	connect(Start,Next,_),
	\+ memberchk(Next,Visited),%Check Next and Visited are !=
	path(Next,End,Length,[Next|Visited], Path). %Adds Next onto Visited. Constructs a list connecting Start and End.
