package smash

import (
	"io"
	"sync"
	 "strings"
	 "io/ioutil"
)

type word string

func Smash(r io.Reader, smasher func(word) uint32) map[uint32]uint {
	m := make(map[uint32]uint)
	var wg sync.WaitGroup
	var mux sync.Mutex

	b,_ := ioutil.ReadAll(r)
	temp :=strings.Fields(string(b))

	ch:=make(chan uint32,len(temp))

	for _,wrd := range temp{
		wg.Add(1)
	 go func(wrd string) {
		 ch <- smasher(word(wrd))
		 wg.Done()
	 }(wrd)
	}
	wg.Wait()
	close(ch)

	for numz := range ch{
		mux.Lock()
		m[numz]++
		mux.Unlock()
	}

	return m
}
