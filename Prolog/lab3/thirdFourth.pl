trzeci([A,B,C|Reszta],C).
czwarty([A,B,C,D|Reszta],D).

porownaj(A) :-
trzeci(A,C),
czwarty(A,D),
C=D,
write('Yes').

porownaj2(A) :-
trzeci(A,C),
czwarty(A,D),
C=:=D,
write('Yes').

zamien([A, B, C, D|Reszta], [A, B, D, C|Reszta]).
