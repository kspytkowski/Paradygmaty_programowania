kolor(czerwony).
kolor(zielony).
kolor(niebieski).

koloruj(A,B,C,D,E) :-
	kolor(X),
	kolor(Y),
	X\=Y,
	kolor(Z),
	Z\=X,
	Z\=Y,
	kolor(W),
	W\=X,
	W\=Z,
	kolor(T),
	T\=X,
	T\=W,
	write(X),write(', '),write(Y),write(', '),write(Z),
	write(', '),write(W),write(', '),write(T),nl,fail.


