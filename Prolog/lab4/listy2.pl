usun3pierwsze(L,L1) :-
	sklej([_,_,_],L1,L).
	
usun3pierwsze2([_,_,_|L1],L1).
	
usun3ostatnie(L,L1) :-
	sklej(L1,[_,_,_],L).
	
usun33(L,L2) :-
	usun3pierwsze(L,L1),
	usun3ostatnie(L1,L2).

usunPierwszy(L,L1) :-
	sklej([_],L1,L).
	
usunOstatni(L,L1) :-
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
	
parzysta2([]).

parzysta2([_|T]) :- nieparzysta2(T).

nieparzysta2([_|T]) :- parzysta2(T).
	
palindrom(L) :-
	odwroc(L,L).
	
przesun(L1,L2) :-
	pierwszyZSKLEJ(Element,L1),
	usunPierwszy(L1,L3),
	dodaj(Element,L3,L2).
	
przesun2(L1,L2) :-
	L1=[A|R],
	sklej(R,[A],L2).
	
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
przeloz([A|Reszta],L2) :-
	znaczy(A,B),
	przeloz(Reszta,L3),
	dodaj(B,L3,L2).

przeloz2([],[]).
przeloz2([Liczba|T1],[Slownie|T2]) :-
	znaczy(Liczba,Slownie),
	przeloz2(T1,T2).
	
podzbior([], []).

podzbior(L,Z) :- 
	L=[_|Reszta],
	podzbior(Reszta,Z).
	
podzbior(L,Z) :- 
	L=[H|Reszta1],Z=[H|Reszta2],
	podzbior(Reszta1,Reszta2).

podziel([],[],[]).

podziel(L,L1,L2) :-
	podzbior(L,L1),
	podzbior(L,L2),
	dlugosc(L1,Dlugosc1),
	dlugosc(L2,Dlugosc2),
	(Dlugosc1 =:= Dlugosc2; Dlugosc1 =:= Dlugosc2 + 1),
	permutacja(L,L3),
	sklej(L1,L2,L3).
	
cyfra(1).
cyfra(2).
cyfra(3).
cyfra(4).
cyfra(5).
cyfra(6).
cyfra(7).
cyfra(8).
cyfra(9).

gorna(A,B,C) :-
	cyfra(A),
	cyfra(B),
	cyfra(C),
	A is B + C.
	
gorna(A,B,C) :-
	cyfra(A),
	cyfra(B),
	cyfra(C),
	A is B - C.
	
gorna(A,B,C) :-
	cyfra(A),
	cyfra(B),
	cyfra(C),
	A is C - B.
	
minJedenTakiSam(L) :-
	dlugosc(L,Dlugosc),
	\+wszystkieRozne(L,Dlugosc).
	
wszystkieRozne([],0).

wszystkieRozne([A|Reszta],Dlugosc) :-

	NowaDlugosc is Dlugosc - 1,
	wszystkieRozne(Reszta,NowaDlugosc),
	
	\+zawiera([A],Reszta).

piramida(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O) :-
	gorna(2,A,B),A\=B,
	gorna(A,C,D),
	gorna(B,D,E),
	gorna(C,5,F),
	gorna(D,F,G),
	gorna(E,G,4),
	minJedenTakiSam([C,D,E]),
	gorna(5,H,I),
	gorna(F,I,8),
	gorna(G,8,J),
	gorna(4,J,K),
	minJedenTakiSam([5,F,G,4]),
	gorna(H,L,1),
	gorna(I,1,M),
	gorna(8,M,N),
	gorna(J,N,6),
	gorna(K,6,O),
	minJedenTakiSam([H,I,8,J,K]),
	wszystkieRozne([L,1,M,N,6,O],6),
	write(2),nl,write(A),write(' '),write(B),nl,write(C),write(' '),write(D),write(' '),write(E),nl,
	write(5),write(' '),write(F),write(' '),write(G),write(' '),write(4),nl,
	write(H),write(' '),write(I),write(' '),write(8),write(' '),write(J),write(' '),write(K),nl,
	write(L),write(' '),write(1),write(' '),write(M),write(' '),write(N),write(' '),write(6),write(' '),write(O),nl.
	
piramida2(A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,R,S,T,U,V,W,X,Y,Z,A1,B1,C1,D1,E1,F1,G1) :-
	gorna(A,B,C),
	gorna(B,D,2),
	gorna(C,2,E),
	gorna(D,7,F),
	gorna(2,F,G),
	gorna(E,G,2),
	gorna(7,H,I),
	gorna(F,I,J),
	gorna(G,J,K),
	gorna(2,K,L),
	gorna(H,M,5),
	gorna(I,5,N),
	gorna(J,N,O),
	gorna(K,O,2),
	gorna(L,2,P),
	gorna(M,5,R),
	gorna(5,R,S),
	gorna(N,S,5),
	gorna(O,5,T),
	gorna(2,T,U),
	gorna(P,U,1),
	gorna(5,V,W),
	gorna(R,W,8),
	gorna(S,8,X),
	gorna(5,X,Y),
	gorna(T,Y,6),
	gorna(U,6,Z),
	gorna(1,Z,A1),
	gorna(V,6,B1),
	gorna(W,B1,C1),
	gorna(8,C1,D1),
	gorna(X,D1,5),
	gorna(Y,5,E1),
	gorna(6,E1,F1),
	gorna(Z,F1,G1),
	gorna(A1,G1,7),
	wszystkieRozne([6,B1,C1,D1,5,E1,F1,G1,7],9),
	write(A),nl,write(B),write(' '),write(C),nl,write(D),write(' '),write(2),write(' '),write(E),nl,
	write(7),write(' '),write(F),write(' '),write(G),write(' '),write(2),nl,
	write(H),write(' '),write(I),write(' '),write(J),write(' '),write(K),write(' '),write(L),nl,
	write(M),write(' '),write(5),write(' '),write(N),write(' '),write(O),write(' '),write(2),write(' '),write(P),nl,
	write(5),write(' '),write(R),write(' '),write(S),write(' '),write(5),write(' '),write(T),write(' '),write(U),write(' '),write(1),nl,
	write(V),write(' '),write(W),write(' '),write(8),write(' '),write(X),write(' '),write(Y),write(' '),write(6),write(' '),write(Z),write(' '),write(A1),nl,
	write(6),write(' '),write(B1),write(' '),write(C1),write(' '),write(D1),write(' '),write(5),write(' '),write(E1),write(' '),write(F1),write(' '),write(G1),write(' '),write(7),nl,fail.	


