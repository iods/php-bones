
test: destroy build up

up:
	@docker-compose -p php-bones -f .docker/docker-compose.yml up


.PHONY: build
build:
	@docker-compose -p php-bones -f .docker/docker-compose.yml build --no-cache --force-rm


destroy:
	@docker-compose -p php-bones -f .docker/docker-compose.yml down --rmi all --volumes --remove-orphans