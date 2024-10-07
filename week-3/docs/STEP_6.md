# Step 6: use IAM for a user account

## Add storage read permissions for your user

- find in the [README.md](../terraform/README.md), a variable that will allow you to enable the storage read permission for your user
- enable it in your `terraform.tfvars` file
- run `terraform apply`

Wait 2 to 3 minutes: permission change rollout generally takes a few time.

## Try to access your `quotes.json` within the API

Go again to your API on the `/quotes` and check out what happens.
