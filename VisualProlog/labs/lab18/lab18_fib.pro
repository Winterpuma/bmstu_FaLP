predicates	
	fib(integer, integer). %target, res
	fib(integer, integer, integer, integer, integer). %targer, current, prevRes, prevRes2, res
	sign(integer, integer).
	
clauses
	fib(0, 0) :- !.
	fib(1, 1) :- !.
	fib(N, Res) :- 
		N < 0, 
		NormalN = N * -1,
		fib(NormalN, PreRes),
		sign(NormalN, Sign),
		Res = PreRes * Sign, !.
	fib(N, Res) :- fib(N, 2, 0, 1, Res).
	
	fib(N, N, Prev1, Prev2, Res) :- Res = Prev1 + Prev2, !.
	fib(N, CurN, Prev1, Prev2, Res) :- 
		NewN = CurN + 1,
		Next = Prev1 + Prev2,
		fib(N, NewN, Prev2, Next, Res).
	
	sign(N, 1) :- (N mod 2) = 1, !.
	sign(_, -1).
	
goal
	%fib(-9, Res). % 34
	%fib(-8, Res). % -21
	%fib(-2, Res). % -1
	%fib(2, Res). % 1
	%fib(8, Res). % 21