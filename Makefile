DOCKER_RUN=sudo docker run -t
DOCKER_ALICE=$(DOCKER_RUN) -p 8338:8338 -p 8339:8339 --name=alice --hostname=alice
DOCKER_BOB  =$(DOCKER_RUN) -p 18339:8338 -p 18339:8339 --name=bob --hostname=bob

IMG=inspiraluna/namecoin-testnet
RUN_DAEMON=namecoind -rpcallowip=::/0 -daemon -port=8338 -rpcport=8339 -printtoconsole
#namecoind -regtest -rpcallowip=0.0.0.0/0 -rpcbind=18332 -daemon -printtoconsole 
#namecoind -regtest -rpcbind=18332 -daemon -printtoconsole
#namecoind -regtest -rpcallowip=0.0.0.0/0 -rpcbind=18332 -rpcuser=test -rpcpassword=test -daemon -server -printtoconsole
RUN_SHELL=bash

build:
	sudo docker build -t $(IMG) namecoin-owntestnet

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

