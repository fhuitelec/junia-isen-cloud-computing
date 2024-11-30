# Solution

## Web

### Build

```shell
# Classic image
docker build --tag wordsmith/web:classic --file web/Dockerfile ../wordsmith/web

# Slim image
docker build --tag wordsmith/web:slim --file web/slim.Dockerfile ../wordsmith/web
```

### Compare size

```shell
# Check out built images
docker images wordsmith/web --format "table {{.Repository}}\t{{.Tag}}\t{{.Size}}"

# Compare compressed sizes
docker save wordsmith/web:classic -o wordsmith--web-classic.tar
docker save wordsmith/web:slim -o wordsmith--web-slim.tar
ls -lh wordsmith--web-*.tar | awk -v OFS='\t' '{print $NF,$5}' | column -t
rm wordsmith--web-*.tar
```

## Words

### Build

```shell
# Classic image
docker build --tag wordsmith/words:classic --file words/Dockerfile ../wordsmith/words

# Slim image
docker build --tag wordsmith/words:slim --file words/slim.Dockerfile ../wordsmith/words

# Ultra slim image using docker-slim
slim --report=off build --http-probe --tag=wordsmith/words:ultra-slim wordsmith/words:slim
```

### Compare size

```shell
# Check out built image sizes
docker images wordsmith/words --format "table {{.Repository}}\t{{.Tag}}\t{{.Size}}"

# Compare compressed sizes
docker save wordsmith/words:classic -o wordsmith--words-classic.tar
docker save wordsmith/words:slim -o wordsmith--words-slim.tar
docker save wordsmith/words:ultra-slim -o wordsmith--words-ultra-slim.tar
ls -lh wordsmith--words-*.tar | awk -v OFS='\t' '{print $NF, $5}' | column -t
rm wordsmith--words-*.tar
```

### Optimization resource

- [Using JLink to create smaller Docker images for your Spring Boot Java application](https://snyk.io/fr/blog/jlink-create-docker-images-spring-boot-java/)
- [eclipse-temurin docker image](https://hub.docker.com/_/eclipse-temurin)
- [Chérie, j'ai rétréci Docker - Jérôme Petazzoni](https://enix.io/fr/blog/cherie-j-ai-retreci-docker-part1/)
- [Slim Docker Images for Java](https://piotrminkowski.com/2023/11/07/slim-docker-images-for-java/)
- [slimtoolkit/slim](https://github.com/slimtoolkit/slim)
- [Caching Maven dependencies in a Docker build](https://nieldw.medium.com/caching-maven-dependencies-in-a-docker-build-dca6ca7ad612)
