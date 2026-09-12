%this is the name of the room
room(kitchen).
room(diningRoom).
room(room1).
room(room2).
room(hallway).
room(livingRoom).
room(garage).

%what are the things found in the room
location(fridge, kitchen).
location(stove, kitchen).
location(utensils, kitchen).
location(oven, kitchen).
location(table, diningRoom).
location(chair, diningRoom).
location(chandelier, diningRoom).
location(bigbed, room1).
location(laptop, room1).
location(aircon, room1).
location(bigdrawer, room1).
location(fan, room2).
location(bed, room2).
location(notebook, room2).
location(drawer, room2).
location(lamp, hallway).
location(paintings, hallway).
location(clock, hallway).
location(tv, livingRoom).
location(couch, livingRoom).
location(coffeeTable, livingRoom).
location(pc, livingRoom).
location(ps3, livingRoom).
location(car, garage).
location(tools, garage).
location(bike, garage).
location(coffee, coffeeTable).
location(nani, fridge).
location(food, stove).
location(menu, table).

%the door determines if two rooms are connected or not
door(livingRoom, hallway).
door(livingRoom, diningRoom).
door(livingRoom, garage).
door(hallway, livingRoom).
door(hallway, room1).
door(hallway, room2).
door(garage, livingRoom).
door(room1, hallway).
door(room2, hallway).
door(diningRoom, livingRoom).
door(diningRoom, kitchen).
door(kitchen, diningRoom).

%rules
connected(X, Y):-
	door(X, Y).

%iterate over using failure driven loop
list_connections(X):- 
	door(X, Z), write(Z), nl, fail.

list_things(X):-
	location(Z, X), write(Z), nl, fail.