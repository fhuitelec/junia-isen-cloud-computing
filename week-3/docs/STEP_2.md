# Step 2: deploy all the things

Now that you are familiar, you are going to deploy real things.

## Read the docs again

- read the [README.md](../terraform/README.md)
- find the variables that will allow you to:
  - enable the database provisioning
  - enable the HTTP API provisioning
- set the variables you find to `true` in the file `terraform.tfvars`
- run `terraform apply`
- wait 5 to 10 minutes for Azure to provision all the cloud resources

## Discover your brand new resources

Go to the [Azure portal](https://portal.azure.com/#browse/all) and check your resources.

Now, let's do the same but with Terraform:

```
terraform output database
terraform output api
```

## Connect through SQLTools in Visual Studio Code

On the VSCode sidebar (on the left usually), click the database icon at the bottom and Add a new connection:

- select PostgreSQL
- use the `database` Terraform output to fill in the fields
- don't forget to enable SSL

Once connected, in the prompt file, run the content of the file [resources/database/script.sql](../resources/database/script.sql).

## Access your own HTTP API

Go to your web browser to the URL displayed by the `api` Terraform output.

Check the following paths:

- `/`
- `/docs`
- `/examples`