#!/bin/sh

mkdir -p /data

cp -Lr /cuberite/* /data

chmod +x /data/Cuberite

cd /data

sh -c "./Cuberite"

