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
	own_type(Lname, car, Cost) :- own(Lname,  car(_, _ , Cost)).
		
	
goal
	%own("Winter", Property).
	% 1. Type of property by lastname
	%own_type("Winter", PropType, _).
	% 2. Type of property and cost by lastname
	%own_type("Winter", PropType, Cost).
	%own_type("Autumn", PropType, Cost).
	
