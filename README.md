To build image use ```docker build https://github.com/FruitBoi/cuberite-docker.git```

Optionally, specify a tag ```docker build -t "cuberite:latest" https://github.com/FruitBoi/cuberite-docker.git```

Simple image usage example:
```docker run -it -d -p 25565:25565 -p 8080/8080 -v /opt/cuberite:/data cuberite:latest```

Server data is copied to /data from /cuberite on container start, /data is where all configurations and the server executables reside.
