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

sklej([],X,X).
sklej([X|L1],L2,[X|L3]) :-
	sklej(L1,L2,L3).
	
nalezy1(X,L) :-
	sklej(_,[X|_],L).
	
ostatniZSKLEJ(Element,[Element]).
ostatniZSKLEJ(Element,Lista) :-
	sklej(_,[_|[Element]],Lista).
	
ostatniBEZSKLEJ(A,[A]).
ostatniBEZSKLEJ(Element,[_|Lista]) :-
	ostatniBEZSKLEJ(Element,Lista).

dodaj(X,L,[X|L]).

usun(X,[X|Reszta],Reszta).
usun(X,[Y|Ogon],[Y|Reszta]) :-
	usun(X,Ogon,Reszta).
	
wstaw(X,L,Duza) :-
	usun(X,Duza,L).
	
nalezy2(X,L) :-
	usun(X,L,_).
	
zawiera(S,L) :-
	sklej(_,L2,L),
	sklej(S,_,L2).
	
permutacja([],[]).
permutacja([X|L],P) :-
	permutacja(L,L1),
	wstaw(X,L1,P).
 
permutacja2([],[]).
permutacja2(L,[X|P]) :-
	usun(X,L,L1),
	permutacja2(L1,P).
	
odwroc([],[]).
odwroc([H|T],L) :-
	odwroc(T,R),
	sklej(R,[H],L).
	
wypisz([H|T]) :-
	put(H), wypisz(T).
wypisz([]).

plural(Noun, PL) :- 
	name(Noun, L), 
	name(s,T), 
	append(L,T, NL), 
	name(PL, NL).
	
odwroc2(L,R) :-
     odwr2(L,[],R).
odwr2([H|T],A,R) :-
     odwr2(T,[H|A],R).
odwr2([],A,A).
