package db

import (
	"database/sql"
	"log"
	"os"
	"testing"

	_ "github.com/lib/pq"
)

// Declaring Queries object for testing

var testQueries *Queries

const (
	dbDriver = "postgres"
	dbSource = "postgresql://root:secret@localhost:5432/dream_bank?sslmode=disable"
)

//Build connection to db

func TestMain(m *testing.M) {
	conn, err := sql.Open(dbDriver, dbSource)
	if err != nil {
		log.Fatal("Not able to connect Database")
	}
	testQueries = New(conn)

	os.Exit(m.Run())
}
