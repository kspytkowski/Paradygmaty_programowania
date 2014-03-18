usun3ostatnie(L,L1) :-
	sklej([_,_,_],L1,L).
	
usun3pierwsze(L,L1) :-
	sklej(L1,[_,_,_],L).
	
usun33(L,L2) :-
	usun3pierwsze(L,L1),
	usun3ostatnie(L1,L2).

usunOstatni(L,L1) :-
	sklej([_],L1,L).
	
usunPierwszy(L,L1) :-
	sklej(L1,[_],L).
	
nieparzysta(L) :-
	L=[_|[]].	
	
nieparzysta(L) :-
	usunPierwszy(L,L1),
	usunOstatni(L1,L2),
	nieparzysta(L2).

parzysta(L) :-
	L=[_|Reszta],
	nieparzysta(Reszta).
	
palindrom(L) :-
	odwroc(L,L).
	
przesun(L1,L2) :-
	ostatniZSKLEJ(Element,L1),
	usunPierwszy(L1,L3),
	dodaj(Element,L3,L2).
	
znaczy(0,zero).   
znaczy(1,jeden).
znaczy(2,dwa).    
znaczy(3,trzy).
znaczy(4,cztery).
znaczy(5,piec).
znaczy(6,szesc).  
znaczy(7,siedem).
znaczy(8,osiem).  
znaczy(9,dziewiec).

przeloz([],[]).
przeloz(L1,L2) :-
	L1=[A|Reszta],
	znaczy(A,B),
	przeloz(Reszta,L3),
	dodaj(B,L3,L2).

