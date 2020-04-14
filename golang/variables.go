package main

import "fmt"

func main() {
	var age int 
	fmt.Println("my age is", age)
	age = 29
	fmt.Println("my age is", age)

	var age2 = 22
	fmt.Println("my age is ", age2)

	var width, height int = 40 ,55
	fmt.Println("Width is", width,"height is",height)

	var (
		name = "aaaa"
		age3 = 20
		height2 int
	)
	fmt.Println("my name is ",name,"Age: ",age3, "height: ",height2)

	//short hand declaration
	test1, test2 := 1,2
	fmt.Println(test1,test2)
}