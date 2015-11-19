/*Fakta*/
beside(bedroom,castle).
beside(castle,bedroom).
beside(castle,armory).
beside(armory,castle).
beside(armory,dragon_treasury).
beside(dragon_treasury,armory).

requirement([sharp_sword, armor, shield]).

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
	write('--quit'),nl,
	retractall(position(X)),
	retractall(item(Z, Y)),
	retractall(inventory(V)),
	asserta(inventory([])),
	asserta(item(bedroom,[bed])),
	asserta(item(castle,[armor,shield,maps])),
	asserta(item(armory,[desk,sword])),
	asserta(item(dragon_treasury,[princess])),
	asserta(position(castle)),
	repeat,
		nl, nl, write('> '), read(X), do(X),
		X == quit, !.

do(look) :- look, !.
do(sleeping) :- sleeping, !.
do(readmap) :- readmap, !.
do(goto(X)) :- goto(X), !.
do(take(X)) :- take(X), !.
do(sharpen(X)) :- sharpen(X), !.
do(quit) :- ! .
do(_) :- write('Invalid command.').


look :- 
	position(X),write('You are located at '),write(X),nl,
	item(X,Y),write('You can see : '),writeList(Y),nl,
	inventory(Z),write('Currently you have : '),writeList(Z),!.

sleeping :-
	position(X),X \== bedroom,write('You should go to the bedroom first.'), !.
sleeping :-
	position(X),X==bedroom, item(X,Y), \+ member(bed, Y), write('You\'re in the bedroom, but there\'s no bed'), !.
sleeping :-
	position(X),X==bedroom, item(X,Y), member(bed, Y), write('Have a good night O Tio, Knight in Shining Armor').

readmap :-
	inventory(Z), \+ member(maps, Z), write('You can\'t read map because you don\'t have it'), !.
readmap :-
	inventory(X),member(maps,X),
	write('._____________________________________________________________.'),nl,
	write('|            |            |             |                     |'),nl,
	write('|            |            |             |                     |'),nl,
	write('|   bedroom  |   castle   |   armory    |   dragon_treasury   |'),nl,
	write('|            |            |             |                     |'),nl,
	write('|____________|____________|_____________|_____________________|').

goto(X) :- position(Y), X == Y, write('You\'re currently in the '), write(Y), !.
goto(X) :- position(Y), X \== Y, \+ beside(Y,X), write('You can\'t go there from here'), !.
goto(X) :- position(Y),beside(Y,X),retract(position(Y)),asserta(position(X)),look.

take(X) :-
	position(Y), item(Y,Z), \+ member(X,Z), write('Sorry! No '),write(X), write(' in here.'), !.

take(X) :-
	X == princess, inventory(L), position(Y), item(Y,Z), member(X,Z),
	requirement(R), \+ isAllMember(R, L), write('You can\'t take the princess because you don\'t have the requirements : '),
	writeList(R), !.

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
	write('Your sword is now sharp'),
	!.

sharpen(X) :-
	X \== sword, write('It\'s not a sword.'), !.

sharpen(X) :-
	X == sword, inventory(Z), \+ member(X, Z),
	write('You don\'t have any sword.').

isAllMember([], _).
isAllMember([H|T], Z) :- member(H, Z), isAllMember(T, Z).

writeList([]).
writeList([H]) :- write(H), !.
writeList([H|T]) :- write(H), write(', '), writeList(T).
