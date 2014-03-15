rodzic(kasia,robert).
rodzic(kasia,eliza).
rodzic(tomek,robert).
rodzic(tomek,eliza).
rodzic(robert,anna).
rodzic(robert,magda).
rodzic(magda,jan).
 
kobieta(kasia).
kobieta(eliza).
kobieta(magda).
kobieta(anna).
 
mezczyzna(tomek).
mezczyzna(robert).
mezczyzna(jan).

famme(kasia).
homme(krzys).
parent(kasia,krzys).

matka(X,Y) :-
	rodzic(X,Y),
	kobieta(X).
 
ojciec(X,Y) :-
	rodzic(X,Y),
	mezczyzna(X).

brat(X,Y) :-
	rodzic(P,X),
	rodzic(P,Y),
	mezczyzna(X),
	X\=Y.

siostra(X,Y) :-
	rodzic(P,X),
	rodzic(P,Y),
	kobieta(X),
	X\=Y.

dziadek(X,Y) :-
	rodzic(X,P),
	rodzic(P,Y),
	mezczyzna(X),
	X\=Y.

siostra(X,Y) :-
	rodzic(X,P),
	rodzic(P,Y),
	kobieta(X),
	X\=Y.

przodek(X,Y) :-
	rodzic(X,Y).
 
przodek(X,Z) :-
	rodzic(X,Y),
	przodek(Y,Z).

potomek(X,Y) :-
	rodzic(Y,X).
 
potomek(X,Z) :-
	rodzic(Z,Y),
	potomek(X,Y).
	
krewny(X,Y) :-
	przodek(P,Y),
	przodek(P,X),
	X\=Y.
