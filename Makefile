# Project Variable
PROJECT_NAME ?= todobackend
ORG_NAME ?= mengqingyang
REPO_NAME ?= todobackend

# File Variable
DEV_COMPOSE_FILE := docker/dev/docker-compose.yml
RELEASE_COMPOSE_FILE := docker/release/docker-compose.yml

# Docker Compose Project Name
REL_PROJECT := $(PROJECT_NAME)$(BUILD_ID)
DEV_PROJECT := $(REL_PROJECT)dev

.PHONY: test build release clean

test:
	docker-compose -p $(DEV_PROJECT) -f $(DEV_COMPOSE_FILE) build
	docker-compose -p $(DEV_PROJECT) -f $(DEV_COMPOSE_FILE) up agent
	docker-compose -p $(DEV_PROJECT) -f $(DEV_COMPOSE_FILE) up test

build:
	docker-compose -p $(DEV_PROJECT) -f $(DEV_COMPOSE_FILE) up builder

release:
	docker-compose -p $(REL_PROJECT) -f $(RELEASE_COMPOSE_FILE) build
	docker-compose -p $(REL_PROJECT) -f $(RELEASE_COMPOSE_FILE) up agent
	docker-compose -p $(REL_PROJECT) -f $(RELEASE_COMPOSE_FILE) run --rm app manage.py collectstatic --no-input
	docker-compose -p $(REL_PROJECT) -f $(RELEASE_COMPOSE_FILE) run --rm app manage.py migrate --no-input
	docker-compose -p $(REL_PROJECT) -f $(RELEASE_COMPOSE_FILE) up test

clean:
	docker-compose -p $(DEV_PROJECT) -f $(DEV_COMPOSE_FILE) kill
	docker-compose -p $(DEV_PROJECT) -f $(DEV_COMPOSE_FILE) rm -f -v
	docker-compose -p $(REL_PROJECT) -f $(RELEASE_COMPOSE_FILE) kill
	docker-compose -p $(REL_PROJECT) -f $(RELEASE_COMPOSE_FILE) rm -f -v
	docker images -q -f dangling=true -f label=application=$(REPO_NAME) | xargs -I ARGS docker rmi -f ARGS