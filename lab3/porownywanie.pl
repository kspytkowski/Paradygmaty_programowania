trzeci([A,B,C|Reszta],C).
czwarty([A,B,C,D|Reszta],D).

porownaj(A) :-
	trzeci(A,C),
	czwarty(A,D),
	C\=D,
	write('No').
	
porownaj(A) :-
	trzeci(A,C),
	czwarty(A,D),
	C=D,
	write('Yes').
	
zamien(A,X) :-
	trzeci(A,B),
	czwarty(A,C),
	[D,E|Reszta]=A,
	X=[D,E,C,B].	

