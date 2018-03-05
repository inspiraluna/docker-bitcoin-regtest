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
	RUN git clone --branch 'dc0.0.7' https://github.com/Le-Space/namecoin-core.git
workdir /tmp/build/namecoin-core
	RUN ./autogen.sh && \
		./configure --without-gui && \
		make && \
		make install

RUN mkdir -p /data/doichain/
RUN if test ! -f /data/doichain/namecoin.conf; then printf "rpcuser=test\nrpcpassword=test\nrpcallowip=::/0\nserver=1\n" > /data/doichain/namecoin.conf; fi
RUN ln -s /data/doichain ~/.namecoin
VOLUME ["/data/doichain"] #ignored when it conflicts with -v
EXPOSE 8338 8339 18338 18339 
CMD ["/usr/local/bin/namecoind", "-server", "-daemon"] #only excecuted when running without param 
