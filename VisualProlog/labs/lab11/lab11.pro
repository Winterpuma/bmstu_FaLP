domains
	phone, name = symbol.
	
predicates
	phone_book(phone, name).
	
clauses
	phone_book("+10000", "Moscow").
	phone_book("+10000", "NotMoscow").
	phone_book("+01000", "SPB").
	phone_book("+00100", "Sevastopol").
	phone_book("+00010", "Ufa").
	phone_book("+00001", "Simferopol").
	
goal
	phone_book("+10000", Name).
