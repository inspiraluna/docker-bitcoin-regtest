from ubuntu
RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y build-essential git && \
	apt-get install automake -y && \
	apt-get install libtool -y && \
	apt-get install libtool pkg-config wget curl net-tools -y && \
	apt-get install bsdmainutils libboost-all-dev libssl-dev libevent-dev -y

workdir /tmp/build/bdb
	RUN wget http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz && tar xzvf db-4.8.30.NC.tar.gz && cd db-4.8.30.NC/build_unix/ && ../dist/configure --enable-cxx && make && make install && \
		ln -s /usr/local/BerkeleyDB.4.8 /usr/include/db4.8 && \
		ln -s /usr/include/db4.8/include/* /usr/include && \
		ln -s /usr/include/db4.8/lib/* /usr/lib
workdir /tmp/build/
	RUN git clone --branch 'doichain' https://github.com/namecoin/namecoin-core
workdir /tmp/build/namecoin-core
	RUN ./autogen.sh && \
		./configure --without-gui && \
		make && \
		make install
RUN  mkdir ~/.namecoin/
RUN printf "rpcuser=test\nrpcpassword=test\nrpcallowip=0.0.0.0\n" > ~/.namecoin/namecoin.conf
EXPOSE 8338 8339 18338 18339 
CMD ["/usr/local/bin/namecoind", "-printtoconsole"]
#CMD ["/tmp/build/namecoin-core/src/namecoind", "-server,"-daemon", "-printtoconsole", "-gen", "-noirc" -nodns" ]
#RUN ./src/namecoind -server -daemon -gen -printtoconsole -noirc -nodns
 
