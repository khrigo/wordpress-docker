ROOT_DIR = $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

APP_NAME = Wordpress Docker

SHELL ?= /bin/bash

.SILENT: ;               # no need for @
.ONESHELL: ;             # recipes execute in same shell
.NOTPARALLEL: ;          # wait for this target to finish
.EXPORT_ALL_VARIABLES: ; # send all vars to shell
Makefile: ;              # skip prerequisite discovery

# Run make help by default
.DEFAULT_GOAL = help

.PHONY: env
env:  ## Copy .env
	cp env.example .env

.PHONY: up
up:  ## Starts and attaches to containers for a service
	docker-compose up -d

.PHONY: stop
stop: check-env ## Stop containers.
	docker-compose stop

.PHONY: bash
bash: ## Exec bash inside app container
	docker-compose exec wordpress bash

%:
	@:
