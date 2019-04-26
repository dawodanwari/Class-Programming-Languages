package bug2

import (
	"sync"


)

func bug2(n int, foo func(int) int, out chan int) {
	var wg sync.WaitGroup
	ch := make(chan int,n)

	for i := 0; i < n; i++ {
		wg.Add(1)
		ch <-i
		go func() {
			out <- foo(<-ch)
			wg.Done()
		}()
	}
	wg.Wait()
	close(ch)
	close(out)
}
