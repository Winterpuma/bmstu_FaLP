domains
	id = integer.
	fname, lname = symbol.
	uni = symbol.

predicates
	student(id, fname, lname).
	study(id, uni).
	students_from_uni(fname, lname, uni).
	
clauses
	student(1, "Abc", "123").
	student(2, "Bca", "231").
	student(3, "Cab", "312").
	
	study(1, bmstu).
	study(1, msu).
	study(2, mfti).
	study(3, bmstu).
	
	students_from_uni(Fname, Lname, Uni) :- study(Id, Uni), student(Id, Fname, Lname).
	
goal
	% 1.Find all universities of student by id
	%study(1, Uni). % 1.1
	%study(2, Uni). % 1.2
	%study(4, Uni). % 1.3
	
	% 2. Find all students(id) from one uni
	%study(Id, bmstu). % 2.1
	%study(Id, msu). % 2.2
	%study(Id, no_uni). %2.3
	
	% 3. Find all students(name), from one uni
	%students_from_uni(Fname, Lname, bmstu). % 2.1
	%students_from_uni(Fname, Lname, msu). % 2.2
	%students_from_uni(Fname, Lname, no_uni). % 2.3