DOCKER_RUN=sudo docker run -t
DOCKER_ALICE=$(DOCKER_RUN) -v /data/namecoin:/data/namecoin  -p 8336:8336 -p 8334:8334 --name=alice-mainnet --hostname=alice-mainnet
DOCKER_BOB  =$(DOCKER_RUN) -v /data/namecoin2 -p 18336:8336 -p 18334:8334 --name=bob-mainnet --hostname=bob-mainnet

IMG=inspiraluna/namecoin
RUN_DAEMON=namecoind -rpcallowip=::/0 -daemon -server -printtoconsole
RUN_SHELL=bash

build:
	sudo docker build -t inspiraluna/namecoin namecoin

alice_rm:
	-sudo docker rm -f alice-mainnet

bob_rm:
	-sudo docker rm -f bob-mainet

alice_daemon: build alice_rm
	$(DOCKER_ALICE) -d=true $(IMG) $(RUN_DAEMON)

alice_shell: build alice_rm
	$(DOCKER_ALICE) -i $(IMG) $(RUN_SHELL)

bob_daemon: build bob_rm
	$(DOCKER_BOB) -d=true $(IMG) $(RUN_DAEMON)

bob_shell: build bob_rm
	$(DOCKER_BOB) -i $(IMG) $(RUN_SHELL)

