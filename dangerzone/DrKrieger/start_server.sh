#!/bin/bash
PROGRAM="/home/DrKrieger/kill_bang_marry.exe"
while true; do
	socat TCP-LISTEN:4321,reuseaddr,fork EXEC:"$PROGRAM",pty,raw,echo=0
	sleep 1
done
