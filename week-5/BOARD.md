# Play with containers

```shell
docker run busybox echo "Hello world!"
docker run -it ubuntu /bin/bash
# Within the container
apt-get update
apt-get install -y figlet
figlet "Hello world!"
```
