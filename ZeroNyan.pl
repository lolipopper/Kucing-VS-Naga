/*Fakta*/
beside(bedroom,castle).
beside(castle,bedroom).
beside(castle,armory).
beside(armory,castle).
beside(armory,dragon_treasury).
beside(dragon_treasury,armory).

:- dynamic(item/2).
item(bedroom,[bed]).
item(castle,[armor,shield,maps]).
item(armory,[desk,sword]).
item(dragon_treasury,[princess]).

:- dynamic(position/1).


:- dynamic(inventory/1).
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
	write('--quit'),
	retract(position(X)),
	asserta(position(bedroom)).

look :- 
	position(X),write('You are located at '),write(X),nl,
	item(X,Y),write('You can see '),write(Y),nl,
	inventory(Z),write('Currently you have '),write(Z),!.
	
sleeping :-
	position(X),X==bedroom,write('You are sleeping').

readmap :-
	inventory(Z), \+ member(maps, Z), write('You can\'t read map because you don\'t have it'), fail.
readmap :-
	inventory(X),member(maps,X),
	write('._____________________________________________________________.'),nl,
	write('|            |            |             |                     |'),nl,
	write('|            |            |             |                     |'),nl,
	write('|   bedroom  |   castle   |   armory    |   dragon_treasury   |'),nl,
	write('|            |            |             |                     |'),nl,
	write('|____________|____________|_____________|_____________________|'), fail.

goto(X) :- position(Y), \+ beside(Y,X), write('You can\'t go there from here'), fail.
goto(X) :- position(Y),beside(Y,X),retract(position(Y)),asserta(position(X)),write(X), fail.

take(X) :- 
	inventory(L),position(Y),item(Y,Z),member(X,Z),
	append([X],L,Lout),retract(inventory(L)),asserta(inventory(Lout)),
	subtract(Z,[X],Litem),retract(item(Y,Z)),asserta(item(Y,Litem)),
	!,write('Tio took a '),write(X),write(' and put it in his bag.').




