SHELL := /bin/bash

all: build test
clean:
	docker images
build: clean
	docker-compose build
run:
	docker-compose up -d
