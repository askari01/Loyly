package main

import "time"

type Lolyl struct {
	Name      string    `json:"name"`
	Completed bool      `json:"completed"`
	Due       time.Time `json:"due"`
}

type Lolyls []Lolyl
