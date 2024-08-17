# DangerZone
An Archer themed CTF challenge

Difficulty: Medium

This CTF challenge focuses on basic hacking techniques. 

If you can handle challenges on sites like TryHackMe, HackTheBox, and picoCTF then this challenge is for you!


# MISSION

Your goal in this CTF challenge is to hack into the docker container and get the root account. 

On the target there are two files we want you to grab. 
- agent_dossier.txt
- nuclear_launch_codes.txt

Now it is quite possible the files will be encrypted, and if they are, they will end with the .enc file extension. 

The two files each have a flag in them. 

# Setup Instructions
I assume you will be running this box on the linux VM your normally use for hacking. 
In my case I run a Kali Linux VM using VMware. 

If you don't have a Linux VM I reccommend you set one up on either VMware or VirtualBox. 
There are plenty of tutorials online that can help you set that up. 

Kali Linux and Parrot OS are good for hacking boxes on sites like TryHackMe and HackTheBox
- Kali Linux VM : https://www.kali.org/get-kali/#kali-platforms
- Parrot OS : https://parrotsec.org/download/


## Dependencies
- Docker

You should look up how to set up docker on your machine, but here is the general command on linux
```
$ sudo apt-get update
$ sudo apt-get install docker.io
```

## Download The Git Repo
```
$ git clone <url for this repo>
```
CD into the repo
```
$ cd DangerZone
```
Make sure the build_and_run.sh script is executable
```
$ chmod +x build_and_run.sh 
```

## Run
To start the challenge all you should have to do is run the build_and_run.sh script.
On my machine I have to run the script is root for it to work. 


```
$ sudo ./build_and_run.sh
```

If the docker fails to start logs can be found in build.log and run.log. 
Also "docker ps -a" and "docker logs <ID>" can be useful for debugging. 

If the build_and_run.sh script was successful you should see a docker container
up and running. 


## To get you started

Assuming the container started without error you can start the penetration test
running the following nmap command. 
```
$ nmap -sC 127.0.0.1 -p 22,80,445
```

## Clean up

When you are done hacking and want to shut down the container you can do the following.

```
$ sudo docker ps -a     # to view docker containers
$ sudo docker stop <ID> # to stop the container
$ sudo docker rm <ID>   # to delete the container
```

## Solution
This repo comes with a writeup and my solution code in the solution directory. 
If you get super stuck and want to see how I solved the box you can see
see what I did. 

# Further Learning Resources 

### Useful Resources For Learning Hacking & Practicing
- ctfhandbook : https://ctf101.org/
- pwn.college : https://pwn.college/
- HackTheBox  : https://www.hackthebox.com/
- TryHackMe   : https://tryhackme.com/
- picoCTF     : https://picoctf.org/
- ringZer0    : https://ringzer0ctf.com/challenges
- war games   : https://overthewire.org/wargames/
- googleCTF   : https://capturetheflag.withgoogle.com/


## Useful Tools
- Cutter          : https://cutter.re/
- Ghidra          : https://ghidra-sre.org/
- Wappalyzer      : https://www.wappalyzer.com/apps/
- pwntools        : https://pypi.org/project/pwntools/
- winpeas/linpeas : https://github.com/peass-ng/PEASS-ng/releases/tag/20240811-aea595a1
- kali linux      : https://www.kali.org/get-kali/#kali-platforms
- CyberChef       : https://gchq.github.io/CyberChef/
- Reverse Shell   : https://www.revshells.com/
- GTFObins        : https://gtfobins.github.io/

## Other cool resources
- HackTricks : https://book.hacktricks.xyz/
- Smashing The Stack For Fun And Profit : https://insecure.org/stf/smashstack.html
- VX-Undergound : https://vx-underground.org/
