FROM ubuntu:14.04

MAINTAINER kiwenlau <kiwenlau@gmail.com>

WORKDIR /root

RUN apt-get update && apt-get install -y wget git

# install go
RUN wget https://storage.googleapis.com/golang/go1.5.3.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.5.3.linux-amd64.tar.gz && \
    rm -f go1.5.3.linux-amd64.tar.gz

ENV GOPATH=/root/work

ENV PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

RUN mkdir -p /root/work && \ 
    go get github.com/tools/godep && \ 
    go get github.com/golang/lint/golint

COPY compile.sh /root/compile.sh

RUN chmod +x /root/compile.sh