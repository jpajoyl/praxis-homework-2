#!/usr/bin/env bash
echo "Hello from backend!"

#go to shared folder
cd /shared

#put env variables
export PORT=4001

#command for run compilated file
nohup ./server > server.out 2>&1 &

echo $PORT