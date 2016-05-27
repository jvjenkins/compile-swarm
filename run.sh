#!/bin/bash

rm -rf binary &> /dev/null

echo -e "\n\n\nbuild kiwenlau/compile-swarm image...\n\n\n"
sudo docker build -t kiwenlau/compile-swarm .


echo -e "\n\n\ncompile swarm within container...\n\n\n"
sudo docker run -v $(pwd)/binary:/binary kiwenlau/compile-swarm /root/compile.sh > /dev/null

