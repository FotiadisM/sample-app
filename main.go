package main

import (
	"fmt"
	"net/http"
)

func Add(a, b int) int {
	return a + b
}

func main() {
	fmt.Println("running...")
	fmt.Printf("5 + 2 = %d\n", Add(5, 2))
	http.HandleFunc("/", func(rw http.ResponseWriter, r *http.Request) {
		fmt.Fprint(rw, "Hello to you!")
	})
	http.ListenAndServe(":8080", http.DefaultServeMux)
}
