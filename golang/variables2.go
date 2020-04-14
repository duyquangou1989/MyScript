package main

import (
	"fmt"
	"math"
)
func main() {
	a,b := 145.8, 222.2
	c := math.Min(a,b)
	fmt.Println("Min value is ", c)

}