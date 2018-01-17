Advice: please use this repo according to the blog mentioned above.


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