package nfa

// A state in the NFA is labeled by a single integer.
type state uint

// TransitionFunction tells us, given a current state and some symbol, which
// other states the NFA can move to.
//
// Deterministic automata have only one possible destination state,
// but we're working with non-deterministic automata.
type TransitionFunction func(st state, act rune) []state

func Reachable(
	// `transitions` tells us what our NFA looks like
	transitions TransitionFunction,
	// `start` and `final` tell us where to start, and where we want to end up
	start, final state,
	// `input` is a (possible empty) list of symbols to apply.
	input []rune,
) bool {

	size:= len(input)//length of path
	if(size == 0){
			if(start == final){
				return true
			}else{
				return false
			}
		}else if (size == 1){
			list1 := transitions(start, input[0])
			for i:=0;i< len(list1); i++{
					if (list1[i]==final){
						return true
					}
		}
		return false
		}else{ //size is 2 or more
		list2 := transitions(start, input[0])
			for i:=0;i< len(list2);i++{
				if (Reachable(transitions,list2[i],final,input[1:])){
					return true
				}
			}
			return false
		}
}
	// TODO Write the Reachable function,
	// return true if the nfa accepts the input,
	// return true if it doesn't reach to the final state with that input
	//panic("TODO: implement this!")
