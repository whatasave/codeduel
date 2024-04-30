include .$(PWD)/.env
DOCKER_IMAGE = test1

setup:
	powershell ./docker_setup.ps1

build:
	docker build -t $(DOCKER_IMAGE) .

start: stop
	docker run --privileged -v="/var/run/docker.sock:/var/run/docker.sock" \
		--env-file="./.env.docker" \
		--network="host" \
		-p=5000:5000 -p=5001:5001 -p=5010:5010 \
		--name="test1" \
		--env-file=".env" $(DOCKER_IMAGE)

stop:
	-docker stop $(DOCKER_IMAGE) && docker rm $(DOCKER_IMAGE)


