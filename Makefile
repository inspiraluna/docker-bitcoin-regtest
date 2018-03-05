DOCKER_RUN=sudo docker run -t
DOCKER_ALICE=$(DOCKER_RUN) -v /data/doichain:/data/doichain -p 8338:8338 -p 8339:8339 --name=alice-doichain --hostname=alice-doichain
DOCKER_BOB  =$(DOCKER_RUN) -v /data/doichain:/data/doichain -p 18338:8338 -p 18339:8339 --name=bob-doichain --hostname=bob-doichain

IMG=inspiraluna/doichain
RUN_DAEMON=/tmp/build/namecoin-core/src/namecoind -server -daemon -gen -printtoconsole -noirc -nodns
RUN_SHELL=bash

build:
	sudo docker build -t $(IMG) doichain

alice_rm:
	-sudo docker rm -f alice

bob_rm:
	-sudo docker rm -f bob

alice_daemon: build alice_rm
	$(DOCKER_ALICE) -d=true $(IMG) $(RUN_DAEMON)

alice_shell: build alice_rm
	$(DOCKER_ALICE) -i $(IMG) $(RUN_SHELL)

bob_daemon: build bob_rm
	$(DOCKER_BOB) -d=true $(IMG) $(RUN_DAEMON)

bob_shell: build bob_rm
	$(DOCKER_BOB) -i $(IMG) $(RUN_SHELL)

