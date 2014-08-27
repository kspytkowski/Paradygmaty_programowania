:- dynamic(cyfra/1).

% Definicja cyfr
cyfra(0).
cyfra(1).
cyfra(2).
cyfra(3).
cyfra(4).
cyfra(5).
cyfra(6).
cyfra(7).
cyfra(8).
cyfra(9).

% M  P3 P2 P1 0
%    S  E  N  D
% +  M  O  R  E
% -------------
% M  O  N  E  Y
% gdzie 0,P1,P2,P3,M to mozliwe przeniesienia (0 lub 1)

% 4 predykaty opisujące 4 możliwości podczas dodawania cyfr składowych danych liczb
% Składnia: wynikJednostkowy(Cyfra1, Cyfra2, OtrzymanePrzeniesienie, GenerowanePrzeniesienie, WynikDodawaniaCyfr).

% Dodawanie 2 cyfr gdy otrzymane przeniesienie wynosi 0 i generowane nowe przeniesienie wynosi 0 
wynikJednostkowy(A,B,0,0,C) :-
	A + B < 10,
	C is A + B.
	
% Dodawanie 2 cyfr gdy otrzymane przeniesienie wynosi 0 i generowane nowe przeniesienie wynosi 1 
wynikJednostkowy(A,B,0,1,C) :-
	A + B > 9,
	C is A + B - 10.
	
% Dodawanie 2 cyfr gdy otrzymane przeniesienie wynosi 1 i generowane nowe przeniesienie wynosi 0 
wynikJednostkowy(A,B,1,0,C) :-
	1 + A + B < 10,
	C is A + B + 1.
	
% Dodawanie 2 cyfr gdy otrzymane przeniesienie wynosi 1 i generowane nowe przeniesienie wynosi 1 
wynikJednostkowy(A,B,1,1,C) :-
	1 + A + B > 9,
	C is A + B + 1 - 10.

% Rozwiązuje podany układ równań
rozwiaz(S,E,N,D,M,O,R,Y) :-
	wynikJednostkowy(0,0,M,0,M), M\=0, 
	cyfra(S), S\=0, S\=M,
	wynikJednostkowy(S,M,P3,M,O), O\=M, O\=S, 
	cyfra(E), E\=M, E\=S, E\=O, 
	wynikJednostkowy(E,O,P2,P3,N), N\=M, N\=S, N\=O, N\=E,
	cyfra(R), R\=M, R\=S, R\=O, R\=E, R\=N,
	wynikJednostkowy(N,R,P1,P2,E),
	cyfra(D), D\=M, D\=S, D\=O, D\=E, D\=N, D\=R,
	wynikJednostkowy(D,E,0,P1,Y), Y\=M, Y\=S, Y\=O, Y\=E, Y\=N, Y\=R, Y\=D, !.
