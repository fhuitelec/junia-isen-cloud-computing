# Step 4: deploy a blob storage

Let's deploy a simple blob storage and try using it through our API.

## Create the storage

- find in the [README.md](../terraform/README.md) will allow you to enable the blob storage 
- enable it in your `terraform.tfvars` file
- run `terraform apply`

## Upload the `quotes.json` file

- go to portal.azure.com
- find your storage account
- within it, find the `api` container
- upload [`quotes.json`](../resources/storage/quotes.json)
