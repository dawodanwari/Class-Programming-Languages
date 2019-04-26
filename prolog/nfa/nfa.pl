

reachable(X,X,[]).
%reachable(X,Y,[]):-fail.

reachable(StartState, FinalState, [X|Input]) :-
transition(StartState,X,Tran),
%reachable(H,FinalState,Input);
repeater(Tran,FinalState,Input).

%repeater tests the alternate transition paths
repeater([H|T],FinalState,Input) :-
  reachable(H,FinalState,Input);
  repeater(T,FinalState,Input).
