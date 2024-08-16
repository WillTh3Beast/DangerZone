#!/bin/bash

sudo docker build -t my_ctf_image . > build.log
sudo docker run -d -p 80:80 -p 22:22 -p 445:445 --name dangerzone my_ctf_image > run.log

echo "check if the container started fine"

sudo docker ps -a

echo ""
echo "Docker Container IP address"
ifconfig | grep -i docker -A3

echo ""
echo "Since it's docker you can just target 127.0.0.1 for the IP"
echo ""
echo "Docker Container should be running! Ready to hack!"
echo "When finished hacking run the following to shut down the container:"
echo "$ docker stop <ID> ; docker rm <ID>"
