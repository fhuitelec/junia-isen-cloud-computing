# Play with containers

## Hello world

```shell
docker run busybox echo "Hello world!"
docker run -it ubuntu /bin/bash
# Within the container
apt-get update
apt-get install -y figlet
figlet "Hello world!"
```

## Backgoound

```shell
docker run -ti jpetazzo/clock
docker ps # Get the container ID
docker kill -s SIGINT $CONTAINER_ID
# Detach
docker run -d jpetazzo/clock
```
