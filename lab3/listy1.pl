nalezy(X,[X|_]).

nalezy(X,[_|Yogon]) :-
	nalezy(X,Yogon).
	
dlugosc([],0).

dlugosc([_|Ogon],Dlug) :-
	dlugosc(Ogon,X),
	Dlug is X+1.
	
a2b([],[]).
a2b([a|Ta],[b|Tb]) :- 
   a2b(Ta,Tb).
