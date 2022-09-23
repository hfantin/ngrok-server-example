package main

import (
	"fmt"
	"runtime"
	"net/http"
)

func main() {
	port := ":5000"
	fmt.Println("starting server on port ", port, " - GOOS", runtime.GOOS, "GOARCH", runtime.GOARCH)
	http.HandleFunc("/", HelloServer)
	http.ListenAndServe(port, nil)
}

func HelloServer(w http.ResponseWriter, r *http.Request) {
	name := r.URL.Path[1:]
	fmt.Println("saying hello to", name)
	fmt.Fprintf(w, "Hello, %s!", name)
}
