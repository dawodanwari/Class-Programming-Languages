package min

// Min returns the minimum value in the arr,
// and 0 if arr is nil.
func Min(arr []int) int {
		minimum:=0
	if (arr == nil) {
		return minimum
	}else{
	length := len(arr)
		if length == 0{
			return 0
		}
		if length == 1{
			return arr[0]
		}else{
			minimum=arr[0]
				length := len(arr)
				for i:=1;i< length; i++{
					if arr[i]<minimum{
						minimum=arr[i]

					}
				}
		}
	}
	return minimum
}
