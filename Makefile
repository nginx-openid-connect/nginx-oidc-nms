.PHONY: build start ps watch down stop clean

build:
	docker-compose build --no-cache nginxplus_oidc_keycloak_ubuntu18.04

start-keycloak:
	docker-compose up -d postgres
	docker-compose up -d keycloak

start:
	docker-compose up -d nms_oidc_keycloak
	docker-compose up -d nms_oidc_azuread

ps:
	docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Ports}}\t{{.Names}}"

watch:
	watch 'docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Ports}}\t{{.Names}}"'

down-keycloak:
	docker-compose down postgres
	docker-compose down keycloak

down:
	docker-compose down nms-oidc-keycloak
	docker-compose down nms-oidc-azuread

kill:
	docker kill nms-oidc-keycloak
	docker kill nms-oidc-azuread

stop:
	docker-compose down

clean-all: 
	docker kill $$(docker ps -q) 2> /dev/null || true
	docker system prune -a
	docker volume rm $(docker volume ls -qf dangling=true)

clean: 
	docker kill nms-oidc-azuread 2> /dev/null || true
	docker kill nms-oidc-keycloak 2> /dev/null || true
	docker system prune -a
