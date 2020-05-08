predicates	
	maxTwo(integer, integer, integer). 
	maxThree(integer, integer, integer, integer).
	
	maxTwo2(integer, integer, integer). 
	maxThree2(integer, integer, integer, integer).
	
clauses
	maxTwo(A, B, A) :- A >= B, !.
	maxTwo(_, B, B).
	
	maxThree(A, B, C, A) :- A >= B, A >= C, !.
	maxThree(_, B, C, Res) :- maxTwo(B, C, Res).
	
	maxTwo2(A, B, A) :- A >= B.
	maxTwo2(A, B, B) :- B > A.
	
	maxThree2(A, B, C, Res) :- maxTwo2(A, B, Tmp), maxTwo2(Tmp, C, Res).
	
goal
	% Test max of two
	%maxTwo(4, 10, Max).
	%maxTwo(5, 3, Max).
	%maxTwo(4, 4, Max).
	
	% Test max of three
	%maxThree(1, 2, 3, Max).
	%maxThree(1, 3, 2, Max).
	%maxThree(3, 2, 1, Max).