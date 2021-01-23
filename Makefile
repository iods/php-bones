
test: destroy build up

up:
	@docker-compose up


.PHONY: build
build:
	@docker-compose build --no-cache --force-rm


destroy:
	@docker-compose down --rmi all --volumes --remove-orphans