DOCKER_RUN=sudo docker run -t
DOCKER_ALICE=$(DOCKER_RUN) -p 18445:18445 -p 18332:18332 --name=alice --hostname=alice
DOCKER_BOB  =$(DOCKER_RUN) -p 19445:18445 -p 19332:18332 --name=bob --hostname=bob

IMG=inspiraluna/namecoin-regtest
RUN_DAEMON=namecoind -regtest -rpcallowip=::/0 -daemon -printtoconsole
#namecoind -regtest -rpcallowip=0.0.0.0/0 -rpcbind=18332 -daemon -printtoconsole 
#namecoind -regtest -rpcbind=18332 -daemon -printtoconsole
#namecoind -regtest -rpcallowip=0.0.0.0/0 -rpcbind=18332 -rpcuser=test -rpcpassword=test -daemon -server -printtoconsole
RUN_SHELL=bash

build:
	sudo docker build -t inspiraluna/namecoin-regtest namecoin-regtest

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

