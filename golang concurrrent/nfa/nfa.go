package nfa

// A nondeterministic Finite Automaton (NFA) consists of states,
// symbols in an alphabet, and a transition function.
import(
		"sync"
)
type state uint
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
		var wg sync.WaitGroup
		ans:=make(chan bool,1)
		list2 := transitions(start, input[0])
			for i:=0;i<len(list2);i++{
				wg.Add(1)
				go func(temp state){
					defer wg.Done()
					if (Reachable(transitions,temp,final,input[1:])){
						ans <- true
					}
				}(list2[i])
			}
			wg.Wait()

			select {
			case final:= <-ans:
					return final
			default:
				return false
			}

		}
	}
