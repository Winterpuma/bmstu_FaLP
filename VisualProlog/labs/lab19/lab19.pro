domains
	list = integer*. 

predicates	
	listLen(list, integer).
	listLen(list, integer, integer).
	listSum(list, integer).
	listSum(list, integer, integer).
	sumOdd(list, integer).
	sumOdd(list, integer, integer).
	
clauses
	listLen(List, Len) :- listLen(List, 0, Len).
	listLen([], Len, Len).
	listLen([_|T], CurLen, Len) :- 
		NewLen = CurLen + 1,
		listLen(T, NewLen, Len).

	listSum(List, Sum) :- listSum(List, 0, Sum).
	listSum([], Sum, Sum).
	listSum([H|T], CurSum, Sum) :- 
		NewSum = CurSum + H,
		listSum(T, NewSum, Sum).
		
	sumOdd(List, Sum) :- sumOdd(List, 0, Sum).
	sumOdd([], Sum, Sum).
	sumOdd([_], Sum, Sum).
	sumOdd([_|[H|T]], CurSum, Sum) :- 
		NewSum = CurSum + H,
		sumOdd(T, NewSum, Sum).
	
goal
	%listLen([0, 1, -2, 10], Len).
	%listSum([0, -2, 10], Sum).
	%sumOdd([1, 2, 1, 2, 1], Sum).
	%sumOdd([1, 2, 1, 2], Sum).