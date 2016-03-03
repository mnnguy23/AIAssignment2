connect(a,b,5).
connect(a,c,8).
connect(a,d,10).
connect(b,d,2).
connect(b,e,9).
connect(c,d,4).
connect(c,f,5).
connect(d,e,6).
connect(d,f,11).
connect(d,g,4).
connect(e,g,2).
connect(f,g,1).

path(Start,End,Path) :-
  path(Start, End, [Start], Path).
path(End, End, RPath, Path) :-
  reverse(RPath, Path).
path(Start,End,Visited,Path) :-
  connect(Start,Next,Length),
  \+ memberchk(Next,Visited),
  path(Next,End,[Next|Visited], Path).
  
pathLength([_], 0).
pathLength([Start, End | T], Length) :- connect(Start,End,L1), pathLength([End|T], L2), Length is L1 + L2.