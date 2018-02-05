#                                 __                 __
#    __  ______  ____ ___  ____ _/ /____  ____  ____/ /
#   / / / / __ \/ __ `__ \/ __ `/ __/ _ \/ __ \/ __  /
#  / /_/ / /_/ / / / / / / /_/ / /_/  __/ /_/ / /_/ /
#  \__, /\____/_/ /_/ /_/\__,_/\__/\___/\____/\__,_/
# /____                     matthewdavis.io, holla!
#
NAME	    := appsoa/docker-alpine-htpasswd
ALIAS	    := nmap
VERSION	    := 1.0.0
USER_EMAIL  := $(shell git config --get user.email)
USER_NAME   := $(shell git config --get user.name)
AUTHOR      := "${USER_NAME} <${USER_EMAIL}>"
USERNAME    ?="user"
PASSWORD	?="$(shell openssl rand -base64 32)"
export

.PHONY:	all build test tag_latest release

all:	help

## Build local docker image using $NAME and $VERSION environment variables
build:

	@echo "Building an image with the current tag $(NAME):$(VERSION).."

	docker build    --rm \
                    --build-arg AUTHOR=$(AUTHOR) \
					--tag $(NAME):$(VERSION) \
					.

## Generate htpasswd outputs using $USERNAME and $PASSWORD environment variables
run:

	docker run --rm -it $(NAME):$(VERSION) $(USERNAME) $(PASSWORD)

# Help Outputs
GREEN  		:= $(shell tput -Txterm setaf 2)
YELLOW 		:= $(shell tput -Txterm setaf 3)
WHITE  		:= $(shell tput -Txterm setaf 7)
RESET  		:= $(shell tput -Txterm sgr0)
help:

	@echo "Deploy & Manage Kibana in Kubernetes."
	@echo "\nUsage:\n\n  ${YELLOW}make${RESET} ${GREEN}<target>${RESET}\n\nTargets:\n"
	@awk '/^[a-zA-Z\-\_0-9]+:/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = substr($$1, 0, index($$1, ":")-1); \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			printf "  ${YELLOW}%-20s${RESET} ${GREEN}%s${RESET}\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST)
