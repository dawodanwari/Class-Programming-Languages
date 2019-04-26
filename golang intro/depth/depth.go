package depth

import (
    "fmt"
)
import "hw2/expr"

// Depth returns the maximum number of AST nodes between the
// root of the tree and any leaf (literal or variable) in the tree.
func Depth(e expr.Expr) uint {
	switch a := e.(type) {
	case expr.Literal:
		return 1
	case expr.Var:
		return 1
	case expr.Unary:
		return 1 + Depth(a.X)
	case expr.Binary:
		x:= Depth(a.X)
		y:= Depth(a.Y)
		if x>= y{
			return x+1
		}else{
			return y+1
		}
	default:
		panic(fmt.Sprintf("unknown Expr: %T", e))
	}





/*	a := expr.Format(e)
	b,_ := expr.Parse(a)
	counter :=0
for i:=0;i<len(a);i++{
	counter = 0
	first := -1
 fmt.Printf("%c ", a[i])

	if (first == -1 && a[i]== '(' ){
		first = i
		counter++
	}
}
	return uint(counter)
*/

}
