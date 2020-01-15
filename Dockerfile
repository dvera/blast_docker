FROM ubuntu:xenial
MAINTAINER Daniel Vera

COPY awsBatchHelper /usr/local/bin/

WORKDIR /root
RUN apt-get update
RUN apt-get install -y autotools-dev automake wget g++ fuse libfuse-dev libcurl3-gnutls libxml2-dev libssl-dev automake autotools-dev curl g++ git libcurl4-gnutls-dev libfuse-dev libssl-dev libxml2-dev make pkg-config
RUN wget -qO- https://github.com/s3fs-fuse/s3fs-fuse/archive/v1.85.tar.gz | tar -zx && cd s3fs-fuse-1.85 && ./autogen.sh && ./configure && make && make install
RUN wget -qO- ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-2.10.0+-x64-linux.tar.gz | tar zx && cp ncbi-blast-2.10.0+/bin/* /usr/local/bin/


