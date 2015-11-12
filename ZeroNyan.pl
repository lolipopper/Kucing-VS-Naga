/*Fakta*/
beside(bedroom,castle).
beside(castle,bedroom).
beside(castle,armory).
beside(armory,castle).
beside(armory,dragon_treasury).
beside(dragon_treasury,armory).

:- dynamic(item/2).

:- dynamic(position/1).

:- dynamic(inventory/1).

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
	retractall(position(X)),
	retractall(item(Z, Y)),
	retractall(inventory(V)),
	asserta(inventory([])),
	asserta(item(bedroom,[bed])),
	asserta(item(castle,[armor,shield,maps])),
	asserta(item(armory,[desk,sword])),
	asserta(item(dragon_treasury,[princess])),
	asserta(position(bedroom)).

look :- 
	position(X),write('You are located at '),write(X),nl,
	item(X,Y),write('You can see '),write(Y),nl,
	inventory(Z),write('Currently you have '),write(Z),!.

sleeping :-
	position(X),X \== bedroom,write('Kowe ora iso turu nang kene say <3!'), fail.
sleeping :-
	position(X),X==bedroom, item(X,Y), \+ member(bed, Y), write('Kowe nang kamar, nanging ora ono kasure'), fail.
sleeping :-
	position(X),X==bedroom, item(X,Y), member(bed, Y), write('Kowe saiki turu nang kasur ing kamar'), fail.

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

goto(X) :- position(Y), X == Y, write('Kowe saiki wis nang kono say <3!!'), fail.
goto(X) :- position(Y), X \== Y, \+ beside(Y,X), write('You can\'t go there from here'), fail.
goto(X) :- position(Y),beside(Y,X),retract(position(Y)),asserta(position(X)),write(X), fail.

take(X) :-
	position(Y), item(Y,Z), \+ member(X,Z), write('Sorry! No '),write(X), write(' in here.'), fail.

take(X) :- 
	X \== princess, inventory(L),position(Y),item(Y,Z),member(X,Z),
	append([X],L,Lout),retract(inventory(L)),asserta(inventory(Lout)),
	subtract(Z,[X],Litem),retract(item(Y,Z)),asserta(item(Y,Litem)),
	!,write('Tio took a '),write(X),write(' and put it in his bag.').

take(X) :- 
	X == princess, inventory(L), position(Y), item(Y,Z), member(X,Z),
	member(sharp_sword, L), member(armor, L), member(shield, L),
	append([X],L,Lout),retract(inventory(L)),asserta(inventory(Lout)),
	subtract(Z,[X],Litem),retract(item(Y,Z)),asserta(item(Y,Litem)),
	!,write('Tio took a '),write(X),write(' and put it in his bag.').

sharpen(X) :-
	X == sword, inventory(Z), member(X, Z),
	select(X, Z, Y),
	retract(inventory(Z)),
	asserta(inventory([sharp_sword|Y])),
	write('Your sword is now sharp'), nl,
	fail.

sharpen(X) :-
	X \== sword, write('Iku duduk pedang say <3!!'), fail.

sharpen(X) :-
	X == sword, inventory(Z), \+ member(X, Z),
	write('Kowe gak nduwe pedang say <3!'), fail.

