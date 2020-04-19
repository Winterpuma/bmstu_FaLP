domains
	lname, phone, city, street = symbol.
	building, apartment = integer.
	model, color, bank, account = symbol.
	price, amount = integer.
	address = address(city, street, building, apartment).

predicates
	phone_book(lname, phone, address).
	car(lname, model, color, price).
	investors(lname, bank, account, amount).
	car_owner(model, color, lname, city, phone, bank).
	
clauses
	phone_book("Winter", "+123", address("Moscow", "Postal", 1, 2)).
	phone_book("Winter", "+000", address("SPB", "Neva", 2, 4)).
	phone_book("Summer", "+345", address("Sevastopol", "Anotherstrt", 4, 8)).
	phone_book("Autumn", "+333", address("Moscow", "Postal", 8, 16)).
	
	car("Winter", "IDK", red, 200000).
	car("Winter", "SmallOne", black, 150).
	car("Summer", "Apple", green, 1000000).
	
	investors("Winter", "RNCB", private, 999999999).
	investors("Autumn", "Sberbank", public, 10).
	investors("Summer", "Raiffeisen", public, 10000).
			
	car_owner(Model, Color, Lname, City, Phone, Bank) :- 
		car(Lname, Model, Color, _),
		phone_book(Lname, Phone, address(City, _, _, _)), 
		investors(Lname, Bank, _, _).
		
	
goal
	%car_owner("SmallOne", black, Last_name, City, Phone, Bank). % some
	%car_owner("Apple", green, Last_name, City, Phone, Bank). % one
	%car_owner("SmallOne", red, Last_name, City, Phone, Bank). % none
