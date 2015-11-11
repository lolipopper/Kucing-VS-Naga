/*Fakta*/
beside(bedroom,castle).
beside(castle,bedroom).
beside(castle,armory).
beside(armory,castle).
beside(armory,dragon_treasury).
beside(dragon_treasury,armory).

item(bedroom,[bed]).
item(castle,[armor,shield,maps]).
item(armory,[desk,sword]).
item(dragon_treasury,[princess]).

position(bedroom).


start :- 
	write('Tio the Shining Armor'),nl,
	write('Welcome to Tio\'s World where nothing is important!'),nl,
	write('Find the princess for Tio the Knight by exploring this nonsense world!'),nl,
	write('You can explore by using these command'),nl,
	write('--look'),nl,
	write('--sleeping'),nl,
	write('--readmap'),nl,
	write('--goto(place)'),nl,
	write('--take(object)'),nl,
	write('--sharpen(object)'),nl,
	write('--quit').
	
look :-
	position(X),write(X).
	



