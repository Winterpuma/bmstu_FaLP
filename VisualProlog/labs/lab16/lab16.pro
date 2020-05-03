domains
	fig, space = symbol.
	
predicates	
	parFig(fig, fig).
	parSpace(space, symbol).
	grandfig(fig, symbol).
	grandspace(space, symbol).
	grandSpaceChildred(fig, symbol)
	
clauses
	parFig(dot, line).
	parFig(line, square).
	parFig(line, rectangle).	
	parFig(square, cube).
	parFig(square, cuboid).
	parFig(square, parallelepiped).
	parFig(rectangle, cuboid).
	parFig(rectangle, parallelepiped).
	parFig(cube, tesseract).
	parFig(cuboid, parallelotope).
	parFig(cube, parallelotope).
	parFig(parallelepiped, parallelotope).
	
	parSpace(oneD, line).
	parSpace(twoD, rectangle).
	parSpace(twoD, square).
	parSpace(threeD, cube).
	parSpace(threeD, cubeoid).
	parSpace(threeD, parallelepiped).
	parSpace(fourD, tesseract).
	parSpace(fourD, parallelotope).
	
	parSpace(threeD, sphere).
	
	parSpace(oneD, twoD).
	parSpace(twoD, threeD).
	parSpace(threeD, fourD).
	
	grandfig(Old, Young) :- parFig(Fig, Young), parFig(Old, Fig).
	grandspace(Old, Young) :- parSpace(Space, Young), parSpace(Old, Space).
	grandSpaceChildred(Fig, Young) :- parSpace(Space, Young), parSpace(ParSpace, Space), parSpace(ParSpace, Fig).
	
goal
	%grandfig(Granny, cube).
	%grandspace(Granny, cube).
	%grandfig(Granny, parallelotope); grandspace(Granny, parallelotope).
	%grandSpaceChildred(Fig, sphere).
	
	
	