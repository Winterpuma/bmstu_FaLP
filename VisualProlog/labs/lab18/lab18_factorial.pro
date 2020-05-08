predicates	
	factorial(integer, integer).
	factorial(integer, integer, integer). 
	
clauses
	factorial(N, -1) :- N < 0, !. % error
	factorial(0, 1) :- !.
	factorial(N, Res) :- factorial(N, 1, Res).
	
	factorial(1, Res, Res) :- !.
	factorial(N, Cur, Res) :- 
		NewN = N - 1,
		NewMult = Cur * N,
		factorial(NewN, NewMult, Res).
	
goal
	%factorial(-10, Res).
	%factorial(0, Res).
	%factorial(5, Res).