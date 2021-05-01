%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%     Author: Ziad Alnagar     %%%
%%%   Last Updated: 1st May 21   %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% To-do: Uncle, Aunt, Grandparents.

male(tom).
male(harlan).
male(joel).
male(fred).
male(bobby).
male(krish).
male(mark).
male(jesson).
male(jhon).
male(ban).

female(may).
female(destiney).
female(reyna).
female(alina).
female(lorena).
female(celeste).
female(kirsten).
female(adalyn).
female(molly).
female(juliana).

parent(tom, juliana).
parent(may, juliana).
parent(tom, molly).
parent(may, molly).
parent(may, adalyn).
parent(harlan, ban).
parent(destiney, ban).
parent(joel, jhon).
parent(juliana, jhon).
parent(molly, jesson).
parent(ban, jesson).

% Lists
males(L) :- findall(X, male(X), L).
females(L) :- findall(X, female(X), L).
people(L) :- findall(X, (male(X) ; female(X)), L).
siblings(L) :- setof([X,Y], (parent(Z, X), parent(Z, Y), \+ X==Y), L).

% find_in_list(X) :- (males(L) ; females(L)), member(X, L).
is_person(X) :- (people(L)), member(X, L), write(X), write(' exists').

father(X, Y) :- parent(X, Y), male(X).
mother(X, Y) :- parent(X, Y), female(X).
% ex: has_children(may, L)
has_children(X, L) :- findall(Y, parent(X, Y), L), (father(X, _) -> write(X), write(' is father of '), write(L)) ;
findall(Y, parent(X, Y), L), (mother(X, _) -> write(X), write(' is mother of '), write(L)).

are_siblings(X,Y) :- siblings(L), member([X,Y], L).
brother(X, Y) :- sibling(X, Y), male(X), write(X), write(' is brother to '), write(Y).
sister(X, Y) :- sibling(X, Y), female(X), write(X), write(' is sister to '), write(Y).












