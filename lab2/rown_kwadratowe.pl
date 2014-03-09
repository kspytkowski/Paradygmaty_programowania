% Aby wyliczyć pierwiatki posłuż się poleceniem:
% kwadrat(1,1,-6,Wynik),write('Pierwiastek: '),write(Wynik),nl,fail.
% lub po prostu kwadrat(1,1,-6).

delta(A,B,C,Wynik) :-
	Wynik is B*B-4*A*C.

kwadrat(A,B,C,Wynik) :- 
	delta(A,B,C,Wynik2),
	Wynik2 > 0,
	Wynik is (-B+sqrt(Wynik2))/(2*A).	

kwadrat(A,B,C,Wynik) :- 
	delta(A,B,C,Wynik2),
	Wynik2 > 0,
	Wynik is (-B-sqrt(Wynik2))/(2*A).
	
kwadrat(A,B,C,Wynik) :- 
	delta(A,B,C,Wynik2),
	Wynik2 =:= 0,
	Wynik is (-B)/(2*A).
