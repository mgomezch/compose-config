.PHONY: up log rebuild down clean

up:
	docker-compose up --detach

log:
	docker-compose logs intermission-config

rebuild:
	docker-compose up --detach --build

down:
	docker-compose down

clean: down
	docker rmi busybox $$(yq -r < docker-compose.yaml '.services | keys | map((env.PWD | split("/") | .[-1]) + "-" + .) | join(" ")')
