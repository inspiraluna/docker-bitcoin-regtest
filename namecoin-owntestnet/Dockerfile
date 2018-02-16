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
	#RUN git clone https://github.com/Le-Space/namecoin-core.git
	# cpu-mining-test
	RUN git clone --branch 'cpu-mining-test-v0.22' --depth=1 https://github.com/Le-Space/namecoin-core.git
	# RUN git clone --branch 'nc0.3.24.64' https://github.com/Le-Space/namecoin-core.git
	#RUN git clone --branch 'nc0.13.0rc1' https://github.com/Le-Space/namecoin-core.git
workdir /tmp/build/namecoin-core
#	RUN ./autogen.sh && \
#		./configure --without-gui && \
#		make && \
#		make install

RUN apt-get install -y libglib2.0-dev 

# make for early branch nc0.3.24.64
RUN which cp
RUN		cd src && \ 
		/bin/cp makefile.unix makefile && \
		make 	

RUN  mkdir ~/.namecoin/
RUN printf "rpcuser=test\nrpcpassword=test\nrpcallowip=*\n" > ~/.namecoin/bitcoin.conf
EXPOSE 8338 8339 18338 18339 
#CMD ["/usr/local/bin/namecoind", "-port=8338,"-rpcport=8339", "-printtoconsole"]

#scp nico@le-space.de:/tmp/*.dat /root/.namecoin/wallet.dat
#CMD ["/tmp/build/namecoin-core/src/namecoind", "-server,"-daemon", "-printtoconsole", "-gen", "-noirc" -nodns" ]
RUN ./src/namecoind -server -daemon -gen -printtoconsole -noirc -nodns
 
