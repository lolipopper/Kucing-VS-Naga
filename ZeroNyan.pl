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

:- dynamic position/1.
position(bedroom).


:- dynamic inventory/1.
inventory([]).

/* RULES */
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
	position(X),write('You are located at '),write(X),nl,
	item(X,Y),write('You can see '),write(Y),nl,
	inventory(Z),write('Currently you have'),write(Z),nl.
	
sleeping :-
	position(X),X==bedroom,write('You are sleeping').
readmap :-
	inventory(X),member(X,maps),
	write('._____________________________________________________________.'),nl,
	write('|            |            |             |                     |'),nl,
	write('|            |            |             |                     |'),nl,
	write('|   bedroom  |   castle   |   armory    |   dragon_treasury   |'),nl,
	write('|            |            |             |                     |'),nl,
	write('|____________|____________|_____________|_____________________|').

goto(X) :- retract(position(Y)),room(X),assert(position(X)),write(X).

take(X) :- position(X),item(X,Y),write(Y).




