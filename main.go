package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprint(w, "<h1>Yo Anurag!</h1>")
	})
	log.Fatal(http.ListenAndServe(":3000", nil))
}
