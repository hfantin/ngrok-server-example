package main

import (
	"fmt"
	"net/http"
)

func main() {
	fmt.Println("starting server on port 5000")
	http.HandleFunc("/", HelloServer)
	http.ListenAndServe(":5000", nil)
}

func HelloServer(w http.ResponseWriter, r *http.Request) {
	name := r.URL.Path[1:]
	fmt.Println("saying hello to", name)
	fmt.Fprintf(w, "Hello, %s!", name)
}
