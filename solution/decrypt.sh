#!/bin/bash
openssl enc -d -aes-256-cbc -pbkdf2 -iter 100000 -in nuclear_launch_codes.enc -out decrypted2.bin -pass file:key3.txt
openssl enc -d -aes-256-cbc -pbkdf2 -iter 100000 -in decrypted2.bin -out decrypted1.bin -pass file:key2.txt
openssl enc -d -aes-256-cbc -pbkdf2 -iter 100000 -in decrypted1.bin -out nuclear_launch_codes.txt -pass file:key1.txt

rm decrypted1.bin
rm decrypted2.bin
rm nuclear_launch_codes.enc


