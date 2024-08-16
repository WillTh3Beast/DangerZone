# DangerZone
An Archer themed CTF challenge

Difficulty: Medium

This CTF challenge focuses on basic hacking techniques. 
If you can handle challenges on sites like TryHackMe, HackTheBox, and picoCTF you this challenge is for you!


# MISSION

Your goal in this CTF challenge is to hack into the docker container and get the root account. 

On the target there are two files we want you to grab. 
- agent_dossier.txt
- nuclear_launch_codes.txt

Now it is quite possible the files will be encrypted, and if they are, they will end with the .enc file extension. 

The two files each have a flag in them. 

## Dependencies
- Docker

You should look up how to set up docker on your machine, but here is the general command on linux
```
$ sudo apt-get update
$ sudo apt-get install docker-ce docker-ce-cli containerd.io
```

## Run

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
