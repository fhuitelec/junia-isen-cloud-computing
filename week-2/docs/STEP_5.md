# Step 5: deploy a blob storage

## Click-click creation

Topics to discuss about:

- Redundancy
- Blob storage access tier
- Encryption and cloud service provider trust
- Install [Storage Explorer](https://azure.microsoft.com/en-us/products/storage/storage-explorer/)
- Create container `api`
- Upload `quotes.json` (credits to https://github.com/fortrabbit/quotes)

## Use blob from Python API application

- Check out Overview > Tools + SDKs > View documentation
  - [Python samples](https://learn.microsoft.com/fr-fr/python/api/overview/azure/storage?view=azure-python#samples)
  - [Quick start](https://learn.microsoft.com/en-us/azure/storage/blobs/storage-quickstart-blobs-python?tabs=managed-identity%2Croles-azure-portal%2Csign-in-azure-cli&pivots=blob-storage-quickstart-scratch#authenticate-to-azure-and-authorize-access-to-blob-data)

Cf. [README.md](https://github.com/fhuitelec/junia-isen-cloud-computing--quotes-api/blob/main/README.md) & [v3.0.0](https://github.com/fhuitelec/junia-isen-cloud-computing--quotes-api/blob/main/v3.0.0/main.py).

```shell
# Install dependencies
uv add azure-storage-blob azure-identity

# Run the app
uv run fastapi dev main.py
```

## Identity management

- error from the API
- user identity and roles
  - [docs](https://learn.microsoft.com/en-us/azure/storage/blobs/assign-azure-role-data-access?tabs=portal)
  - role: **Storage Blob Data Reader**
  - use **Check my access** on the storage account
- machine identity
  - [docs](https://learn.microsoft.com/en-us/entra/identity/managed-identities-azure-resources/overview)
  - enable
- ask someone for their machine identity
- enable anonymous access

## Update the image in the App Service instance

- In the deployment center
- Registry: https://ghcr.io
- Image name & tag: `fhuitelec/quotes-api:3.0.0` (authenticated)
- Image name & tag: `fhuitelec/quotes-api:3.1.0` (anonymous)
