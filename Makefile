PROJECT=issuei18n
CONFIG=compose/development.yaml
COMPOSE=docker compose --file $(CONFIG) --project-name $(PROJECT)
MANAGE=python issuei18n/manage.py

ifeq (shell, $(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(lastword $(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif


.PHONY: up
## Start Docker compose containers
up: export DOCKER_BUILDKIT := 1
up: export COMPOSE_DOCKER_CLI_BUILD=1
up:
	$(COMPOSE) up -d

.PHONY: stop
## Stop Docker compose containers
stop:
	$(COMPOSE) stop

.PHONY: rebuild
## Rebuild 'app' container in case something went wrong
rebuild: export DOCKER_BUILDKIT := 1
rebuild: export COMPOSE_DOCKER_CLI_BUILD=1
rebuild:
	$(COMPOSE) down
	$(COMPOSE) pull --include-deps
	$(COMPOSE) build

.PHONY: shell
## Enter shell of provided service
shell:
	$(COMPOSE) exec $(RUN_ARGS) /bin/bash

############################################################
# CORE COMMANDS
.PHONY: run
## Run Django server
run:
	$(MANAGE) runserver 0.0.0.0:8000

.PHONY: makemessages
## Django makemessages command for translation
makemessages:
	$(MANAGE) makemessages --all --add-location=file

.PHONY:compilemessages
## Django compilemessages
compilemessages:
	$(MANAGE) compilemessages

.PHONY:shell_plus
## Django compilemessages
shell_plus:
	$(MANAGE) shell_plus
