#!/bin/bash

# compile swarm 1.1.0 by default
version=${1:-1.1.0}

wget https://github.com/docker/swarm/archive/v$version.tar.gz 

tar -xzvf v$version.tar.gz 

rm -f v$version.tar.gz

mkdir -p /root/work/src/github.com/docker/ 

mv swarm-$version /root/work/src/github.com/docker/swarm 

cd /root/work/src/github.com/docker/swarm 

echo -e "\n\ncompile swarm $version..."
godep go install .

echo -e "\n\ncompile swarm $version success!\n"

mv /root/work/bin/swarm /binary 