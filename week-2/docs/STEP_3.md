# Step 3: deploy an HTTP API

## Create the Python FastAPI application

Cf. [README.md](https://github.com/fhuitelec/junia-isen-cloud-computing--quotes-api/blob/main/README.md) & [v1.0.0](https://github.com/fhuitelec/junia-isen-cloud-computing--quotes-api/blob/main/v1.0.0/main.py).

```shell
# Initialize project
uv init quotes-api
mv hello.py main.py

# Install dependencies
uv add fastapi fastapi-cli

# Run the app
uv run fastapi dev main.py
```

Notes:

- [speak about Python versions](https://devguide.python.org/versions/)

## Update the image in the App Service instance

- In the deployment center
- Registry: https://ghcr.io
- Image name & tag: `fhuitelec/quotes-api:1.0.0`

## Debug session

- enable logging (cf. [docs](https://learn.microsoft.com/en-us/azure/app-service/troubleshoot-diagnostic-logs#enable-application-logging-linuxcontainer))
- issues:
  - port
    - ⚠️ very long warmup (everything is in the logs)
    - "azure app service port mapping" & Stack overflow
    - ChatGPT prompt : "dis-moi comment configurer le port d'une instance Azure App service"
    - `fhuitelec/quotes-api:1.1.0`
  - interface
    - `fhuitelec/quotes-api:1.2.0`
