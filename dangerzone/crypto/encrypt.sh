#!/bin/bash

openssl rand -hex 32 > key1.txt
openssl rand -hex 32 > key2.txt
openssl rand -hex 32 > key3.txt

openssl enc -aes-256-cbc -salt -pbkdf2 -iter 100000 -in nuclear_launch_codes.txt -out encrypted1.bin -pass file:key1.txt
openssl enc -aes-256-cbc -salt -pbkdf2 -iter 100000 -in encrypted1.bin -out encrypted2.bin -pass file:key2.txt
openssl enc -aes-256-cbc -salt -pbkdf2 -iter 100000 -in encrypted2.bin -out nuclear_launch_codes.enc -pass file:key3.txt


rm encrypted1.bin
rm encrypted2.bin
rm nuclear_launch_codes.txt
