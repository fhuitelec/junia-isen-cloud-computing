# Step 7: use IAM for a service account

## Try to access your `quotes.json` on your App service HTTP API

Remember, your API URL is available on the `api` Terraform output.

Like when you ran the API locally, the HTTP API has an endpoint `/quotes`.

Go to your API on the `/quotes` and check out what happens.

You are facing the same issue as you did previously but this time, it's not you that have the issue, it's your App service.

## Add storage read permissions for your app service

- find in the [README.md](../terraform/README.md), a variable that will allow you to enable the storage read permission for your app service
- enable it in your `terraform.tfvars` file
- run `terraform apply`

Like last time, wait 2 to 3 minutes.

And try to access your API on App service again, you should see the quotes.

## What to do next?

- read all the terraform code and the modules
- read about the modules:
  - [syntax](https://developer.hashicorp.com/terraform/language/modules/syntax)
  - [create a module](https://developer.hashicorp.com/terraform/language/modules/develop)
- read about [resources](https://developer.hashicorp.com/terraform/language/resources) & [data sources](https://developer.hashicorp.com/terraform/language/data-sources)
- you are invited to go to the [Azure Terraform provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs) and check out the resources used in the code
