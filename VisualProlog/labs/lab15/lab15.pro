domains
	lname, phone, city, street = symbol.
	building_n, apartment, amount = integer.
	model, color, bank, account = symbol.
	address = address(city, street, building_n, apartment).
	
	cost, size = integer.
	property = 
		building(cost, size); 
		sector(cost, size); 
		ship(cost, color); 
		car(model, color, cost).
	
predicates
	phone_book(lname, phone, address).
	investors(lname, bank, account, amount).
	%owner(model, color, lname, city, phone, bank).
	own(lname, property).
	own_type(lname, symbol, cost).
	own_cost(lname, symbol, cost).
	total_cost(lname, cost).
	
clauses
	phone_book("Winter", "+123", address("Moscow", "Postal", 1, 2)).
	phone_book("Winter", "+000", address("SPB", "Neva", 2, 4)).
	phone_book("Summer", "+345", address("Sevastopol", "Anotherstrt", 4, 8)).
	phone_book("Autumn", "+333", address("Moscow", "Postal", 8, 16)).
	
	investors("Winter", "RNCB", private, 999999999).
	investors("Autumn", "Sberbank", public, 10).
	investors("Summer", "Raiffeisen", public, 10000).
	
	own("Winter", building(12000, 40)).
	own("Winter", car("SmallOne", black, 150)).
	own("Summer", ship(1000, grey)).
	
	% Type of property by lastname
	own_type(Lname, building, Cost) :- own(Lname,  building(Cost, _)).
	own_type(Lname, sector, Cost) :- own(Lname,  sector(Cost, _)).
	own_type(Lname, ship, Cost) :- own(Lname,  ship(Cost, _)).	
	own_type(Lname, car, Cost) :- own(Lname,  car(_, _, Cost)).
	
	% Get cost or 0
	own_cost(Lname, building, Cost) :- own(Lname,  building(Cost, _)), !.
	own_cost(Lname, sector, Cost) :- own(Lname,  sector(Cost, _)), !.
	own_cost(Lname, ship, Cost) :- own(Lname,  ship(Cost, _)), !.	
	own_cost(Lname, car, Cost) :- own(Lname,  car(_, _, Cost)), !.
	own_cost(_, _, 0).
	
	% Total cost of all property
	% NOTE: owner CAN'T have more than one property of each type
	total_cost(Lname, Total) :- 
		own_cost(Lname, building, Cost1),
		own_cost(Lname, sector, Cost2),
		own_cost(Lname, ship, Cost3),
		own_cost(Lname, car, Cost4),
		Total = Cost1 + Cost2 + Cost3 + Cost4.
		
	
goal
	%own("Winter", Property).
	% 1. Type of property by lastname
	%own_type("Winter", PropType, _).
	
	% 2. Type of property and cost by lastname
	%own_type("Winter", PropType, Cost).
	%own_type("Autumn", PropType, Cost).
	
	%3. Total cost of property
	total_cost("Winter", TotalCost).
	
