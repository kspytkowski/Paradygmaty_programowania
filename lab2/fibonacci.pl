fibonacci(0,0).
fibonacci(1,1).

fibonacci(Number,Result) :-
	Number > 1,
	NewNumber1 is Number-1,
	NewNumber2 is Number-2,
	fibonacci(NewNumber1,Result1),
	fibonacci(NewNumber2,Result2),
	Result is Result1+Result2.
