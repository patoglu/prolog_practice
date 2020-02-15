flight(istanbul,izmir).
flight(istanbul,antalya).
flight(istanbul,gaziantep).
flight(istanbul,ankara).
flight(istanbul,van).
flight(istanbul,rize).

flight(edirne, edremit).

flight(edremit, erzincan).
flight(edremit, edirne).

flight(erzincan, edremit).

flight(izmir, istanbul).
flight(izmir, isparta).

flight(isparta, izmir).
flight(isparta, burdur).


flight(burdur, isparta).

flight(antalya, istanbul).
flight(antalya, konya).,
flight(antalya, gaziantep).

flight(konya, antalya).
flight(konya, ankara).

flight(gaziantep, istanbul).
flight(gaziantep, antalya).

flight(ankara, konya).
flight(ankara, istanbul).
flight(ankara, van).

flight(van, rize).
flight(van, istanbul).
flight(van, ankara).

flight(rize, van).
flight(rize, istanbul).





distance(istanbul,izmir, 328).
distance(istanbul,antalya, 482).
distance(istanbul,gaziantep, 847).
distance(istanbul,ankara, 351).
distance(istanbul,van, 1262).
distance(istanbul,rize, 967).

distance(edirne, edremit, 243).

distance(edremit, erzincan, 1026).
distance(edremit, edirne, 243).

distance(erzincan, edremit, 1026).

distance(izmir, istanbul, 328).
distance(izmir, isparta, 308).

distance(isparta, izmir, 308).
distance(isparta, burdur, 24).


distance(burdur, isparta, 24).

distance(antalya, istanbul, 482).
distance(antalya, konya, 192).,
distance(antalya, gaziantep, 592).

distance(konya, antalya, 192).
distance(konya, ankara, 227).

distance(gaziantep, istanbul, 847).
distance(gaziantep, antalya, 592).

distance(ankara, konya, 227).
distance(ankara, istanbul, 351).
distance(ankara, van, 920).

distance(van, rize, 373).
distance(van, istanbul, 1262).
distance(van, ankara, 920).

distance(rize, van, 373).
distance(rize, istanbul, 967).

%PART1

%https://www.cpp.edu/~jrfisher/www/prolog_tutorial/2_15.html
%I learned the way to handle cycles here and applied in my code.

connectedEdges(StartVertex,CurrentVertex,VisitedList) :-    
  flight(StartVertex,X),not(memberchk(X,VisitedList)),(CurrentVertex = X;connectedEdges(X,CurrentVertex,[StartVertex|VisitedList])).                 


route(StartVertex,CurrentVertex) :-   
  connectedEdges(StartVertex,CurrentVertex,[]).            

%PART2

sroute(StartVertex, CurrentVertex, DISTANCE):-
    flight(StartVertex,CurrentVertex),distance(StartVertex,CurrentVertex,DISTANCE);
    flight(StartVertex,Z),flight(Z,CurrentVertex), distance(StartVertex,Z,DIST_),
	distance(Z,CurrentVertex,DIST),
	DISTANCE is DIST_+DIST .



when(102,10).
when(108,12).
when(341,14).
when(455,16).
when(452,17).



enroll(a , 102).
enroll(a , 108).
enroll(b , 102).
enroll(c , 108).
enroll(d , 341).
enroll(e , 455).

where(102 , z23).
where(108 , z11).
where(341 , z06).
where(455 , 207).
where(452 , 207).



%PART3


schedule(Student,Place,Time):-
	enroll(Student,Course),
	where(Course,Place),when(Course,Time),
	nl.

usage(Place,Time):-
	where(Class,Place),when(Class,Time),
	nl.	



boolLeftSide(Course1,Course2):- where(Course1,A),
                where(Course2,B),
                A==B.

boolRightSide(Course1,Course2):-  when(Course1,A),when(Course2,B),
                 A == B.
%apply demorgans law.
conflict(Course1,Course2):- not((not(boolLeftSide(Course1,Course2)),not(boolRightSide(Course1,Course2)))).



%actually logical one is this because if there is a conflict we need to and the boolean values not or. Just in case I leave in comment
%conflict(Course1,Course2):- 
	%where(Course1,Class),
	%where(Course2,Class),
	%when(Course1,B),
	%when(Course2,B),
	%Course1\=Course2,
	%nl.


meet(Student1,Student2):-
	enroll(Student1,Course1),
	enroll(Student2,Course1).




% SOURCES FOR PART4:
% https://www.cs.nmsu.edu/~ipivkina/ECLIPSE/doc/bips/lib/lists/intersection-3.html
%I couldnt implement union.
% kti.ms.mff.cuni.cz/~bartak/prolog/sets.html


%Part 4.1
element(E, S) :- member(E, S).



%Part 4.3
intersect([], _, []).
intersect([HEAD|FRONT], TAIL, L3) :- memberchk(HEAD, TAIL),!,L3 = [HEAD|INTERSECT],
intersect(FRONT, TAIL, INTERSECT).
intersect([_|FRONT], TAIL, L3) :-
intersect(FRONT, TAIL, L3).

%4.4
%lists maybe containing same element but not in true order therefore sort them and "and " them
equivalent(SET1, SET2) :-
    subtract(SET1, SET2, []),
    subtract(SET2, SET1, []).


