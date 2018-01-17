#FROM ubuntu:xenial
#RUN apt-get -y update
#RUN apt-get install -y python-software-properties
#RUN apt-get install -y software-properties-common

#RUN add-apt-repository ppa:bitcoin/bitcoin
#RUN apt-get update
#RUN apt-get install -y bitcoind

#RUN mkdir ~/.bitcoin
#RUN echo "rpcuser=test\nrpcpassword=test\n" > ~/.bitcoin/bitcoin.conf

#RUN echo "alias rt='bitcoin-cli -regtest'" >> ~/.bashrc

from ubuntu
RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y build-essential git && \
	apt-get install automake -y && \
	apt-get install libtool -y && \
	apt-get install libtool pkg-config wget -y && \
	apt-get install bsdmainutils libboost-all-dev libssl-dev libevent-dev -y
workdir /tmp/build/bdb
	RUN wget http://download.oracle.com/berkeley-db/db-4.8.30.NC.tar.gz && tar xzvf db-4.8.30.NC.tar.gz && cd db-4.8.30.NC/build_unix/ && ../dist/configure --enable-cxx && make && make install && \
		ln -s /usr/local/BerkeleyDB.4.8 /usr/include/db4.8 && \
		ln -s /usr/include/db4.8/include/* /usr/include && \
		ln -s /usr/include/db4.8/lib/* /usr/lib
workdir /tmp/build/
	RUN git clone --branch 'nc0.13.0rc1' https://github.com/namecoin/namecoin-core
#	RUN git clone --depth 1 --branch 'nc0.13.0rc1' https://github.com/namecoin/namecoin-core
workdir /tmp/build/namecoin-core
	RUN ./autogen.sh && \
		./configure --without-gui && \
		make && \
		make install
#VOLUME ["/data/namecoin"]
RUN  mkdir ~/.namecoin/
#RUN printf "rpcuser=test\nrpcpassword=test\n" > /data/namecoin/namecoin.conf
RUN printf "rpcuser=test\nrpcpassword=test\n" > ~/.namecoin/namecoin.conf
#COPY namecoin.conf /data/namecoin/namecoin.conf
EXPOSE 8336 8334
CMD ["/usr/local/bin/namecoind", "regtest", "-printtoconsole"]
