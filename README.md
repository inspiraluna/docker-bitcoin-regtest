This is a fork based which creates a namecoin regtest private testnet on your machine via docker. For details you can also read the original bitcoin based article by Gerald Kaszuba. (see http://geraldkaszuba.com/creating-your-own-experimental-bitcoin-network/) Beware some things might have changed in namecoin (see below)


# usefull commands
some commands described in the post are different in actually 
1. start namecoind inside docker image ``namecoind -regtest -rpcallowip=::/0 -daemon -printtoconsole``
2. getinfo command ``namecoin-cli -regtest getinfo``
3. getpeerinfo command ``namecoin-cli -regtest getpeerinfo``
4. addnode command (for alice) ``namecoin-cli -regtest addnode 172.17.0.2 onetry``
5. getbalance command ``namecoin-cli -regtest addnode 172.17.0.2 onetry``
6. getaccountaddress command ``namecoin-cli -regtest getaccountaddress ""``
7. generatetoaddress command ``namecoin-cli -regtest generatetoaddress 100 mgrGgK3gDCJp8osBUSPPC1ktRuKnxEBg93``
8. sendtoaddress command ``namecoin-cli -regtest sendtoaddress ...``
