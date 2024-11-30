# Solution

## Web

```shell
# Classic image
docker build --tag wordsmith/web:classic --file web/Dockerfile ../wordsmith/web

# Slim image
docker build --tag wordsmith/web:slim --file web/slim.Dockerfile ../wordsmith/web

# Check out built images
docker images wordsmith/web
```
