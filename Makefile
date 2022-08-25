postgres:
	docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=secret -d postgres:12-alpine
createdb:
	docker exec -it postgres12 createdb --username=root --owner=root dream_bank

dropdb:
	docker exec -it postgres12 dropdb dream_bank

migrateup: 
	migrate -path migration -database "postgresql://root:secret@localhost:5432/dream_bank?sslmode=disable" -verbose up

migratedown:
		migrate -path migration -database "postgresql://root:secret@localhost:5432/dream_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

.PHONY: postgres createdb dropdb migrateup sqlc test