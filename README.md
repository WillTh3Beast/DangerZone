# DangerZone
An Archer themed CTF challenge

Difficulty: Medium

This CTF challenge focuses on basic hacking techniques. 
If you can handle challenges on sites like TryHackMe, HackTheBox, and picoCTF you this challenge is for you!

## Dependencies
- Docker

You should look up how to set up docker on your machine, but here is the general command on linux
```
$ sudo apt-get update
$ sudo apt-get install docker-ce docker-ce-cli containerd.io
```

## RUN

Run the following to start the docker container. 
If the docker fails to start logs can be found in build.log and run.log. 
Also "docker ps -a" and "docker logs <ID>" can be useful for debugging. 
```
$ ./build_and_run.sh
```

Assuming docker is installed the build_and_run.sh script should start the container
and you should be good to start hacking it. 

## To get you started

Assuming the container started without error you can start the penetration test
running the following nmap command. 
```
$ nmap -sC 127.0.0.1 -p 22,80,445
```
