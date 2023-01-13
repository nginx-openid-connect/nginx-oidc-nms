.PHONY: build start ps watch down stop clean

build:
	docker-compose build --no-cache nms_oidc_keycloak
	docker-compose build --no-cache nms_oidc_azuread

start-keycloak:
	docker-compose up -d postgres
	docker-compose up -d keycloak

start:
	docker-compose up -d nms_oidc_keycloak
	docker-compose up -d nms_oidc_azuread
	docker exec nms-oidc-keycloak bash -c ". /etc/nms/nginx/oidc/config-oidc-var.sh bash"
	docker exec nms-oidc-azuread  bash -c ". /etc/nms/nginx/oidc/config-oidc-var.sh bash"

ps:
	docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Ports}}\t{{.Names}}"

watch:
	watch 'docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Ports}}\t{{.Names}}"'

down-keycloak:
	docker-compose down postgres
	docker-compose down keycloak

down:
	docker-compose down -s nms_oidc_keycloak
	docker-compose down -s nms_oidc_azuread

kill:
	docker kill nms-oidc-keycloak
	docker kill nms-oidc-azuread

stop:
	docker-compose stop

clean-all: 
	docker kill $$(docker ps -q) 2> /dev/null || true
	docker system prune -a
	docker volume rm $(docker volume ls -qf dangling=true)

clean: 
	docker kill nms-oidc-azuread  2> /dev/null || true
	docker kill nms-oidc-keycloak 2> /dev/null || true
	docker system prune -a
	docker volume rm $(docker volume ls -qf dangling=true)
