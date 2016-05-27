FROM ubuntu:14.04

MAINTAINER kiwenlau <kiwenlau@gmail.com>

WORKDIR /root

RUN apt-get update && apt-get install -y wget git

# 安装go
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

# 编译swarm
# RUN wget https://github.com/docker/swarm/archive/v1.1.0.tar.gz && \ 
#     tar -xzvf v1.1.0.tar.gz && \ 
#     rm -f v1.1.0.tar.gz && \
#     mkdir -p /root/work/src/github.com/docker/ && \ 
#     mv swarm-1.1.0 /root/work/src/github.com/docker/swarm && \ 
#     cd /root/work/src/github.com/docker/swarm && godep go install . 

# sudo docker build -t kiwenlau/compile-swarm .