# Step 4: connect to PostgreSQL from the HTTP API


## Update the Python application

Cf. [README.md](https://github.com/fhuitelec/junia-isen-cloud-computing--quotes-api/blob/main/README.md) & [v2.0.0](https://github.com/fhuitelec/junia-isen-cloud-computing--quotes-api/blob/main/v2.0.0/main.py).

```shell
# Install dependencies
uv uv add psycopg2-binary

# Run the app
uv run fastapi dev main.py
```

## Update the image in the App Service instance

- In the deployment center
- Registry: https://ghcr.io
- Image name & tag: `fhuitelec/quotes-api:2.0.0`

## Debug session

- timeout
- network & firewall rules
