package main

import (
	"database/sql"
	"fmt"
	"log"
	"net/http"

	_ "github.com/go-sql-driver/mysql"
)

const (
	DB_HOST = "tcp(127.0.0.1:3306)"
	DB_NAME = "loyly"
	DB_USER = /*"root"*/ "root"
	DB_PASS = /*""*/ ""
)

func main() {
	fmt.Printf("hello, world\n")
	// http.ListenAndServe(":8080", nil)
	dsn := DB_USER + ":" + DB_PASS + "@" + DB_HOST + "/" + DB_NAME + "?charset=utf8"
	db, err := sql.Open("mysql", dsn)

	if err != nil {
		log.Fatal(err)
	}

	defer db.Close()

	err = db.Ping()
	if err != nil {
		panic(err.Error())
	}

	var str string
	q := "select * from Aufguss"
	err = db.QueryRow(q).Scan(&str)

	if err != nil {
		log.Fatal("Error: ", err)
	}
	log.Println("Response: ", str)

	// http.HandleFunc("/", homePage)
	// http.ListenAndServe(":8080", nil)
}

func homePage(res http.ResponseWriter, req *http.Request) {
	http.ServeFile(res, req, "index.html")
}
