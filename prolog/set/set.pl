isUnion([],X,X).
isUnion(X,[],X).

isUnion([H|T],Set2,[H|Union]) :-
  isUnion(T,Set2,Union).

isUnion([H|T],Set2,Union) :-
    member(H,Set2),
    isUnion(T,Set2,Union).

    isEqual([],[]).
    isEqual([],X).
    isEqual([X|Set1],Set2) :-
        member(X,Set2),
        isEqual(Set1,Set2).

isIntersection([],Set2,[]).
isIntersection(Set1,[],[]).

isIntersection([H|Set1],Set2,[H|Intersection]) :-
    member(H,Set2),
    isIntersection(Set1,Set2,Intersection).

isIntersection([H|Set1],Set2,Intersection) :-
    isIntersection(Set1,Set2,Intersection).




repeater(_,[],[]).
repeater(E,[X|Y],[[E|X]|Z]) :-
     repeater(E, Y, Z).


     powerSet([],[[]]).
     powerSet([H|X],Y):-
      powerSet(X,Z),
      repeater(H,Z,Temp),
      append(Z,Temp,Y).
