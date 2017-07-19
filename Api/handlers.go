package main

import (
	"encoding/json"
	"fmt"
	"net/http"

	"github.com/gorilla/mux"
)

func Index(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w, "Welcome!\n")
}

func LolylIndex(w http.ResponseWriter, r *http.Request) {
	lolyls := Lolyls{
		Lolyl{Name: "Write presentation"},
		Lolyl{Name: "Host meetup"},
	}

	if err := json.NewEncoder(w).Encode(lolyls); err != nil {
		panic(err)
	}
}

func LolylShow(w http.ResponseWriter, r *http.Request) {
	vars := mux.Vars(r)
	lolylId := vars["lolylId"]
	fmt.Fprintf(w, "Lolyl show: %s\n", lolylId)
}
