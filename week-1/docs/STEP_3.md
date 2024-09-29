# Step 3: import your resource in your Terraform state

> [!note]
> You're here a bit early and are waiting for others?
> 
> Read on Terraform's [providers](https://developer.hashicorp.com/terraform/language/providers/configuration) & [resources](https://developer.hashicorp.com/terraform/language/resources/syntax)!

## `terraform init`

- Go to [./terraform](./terraform)
- Run `terraform init`
- Go find the latest version of the `azurerm` Terraform provider
- Replace `X.X.X` with the latest release you found

> [!note]
> **Hint:** It might be within a GitHub repository

## For real

- Run `terraform init`

You're good to go, congrats!

## Find the resource name to create

- To find a resource for a given provider, you can go to [Terraform's registry](https://registry.terraform.io/browse/providers)
- Search for **Azure**, then go to its documentation
- When found[1], go find the **resource group** resource in the documentation
- Go to the **argument reference** section[2]

There you have enough to declare the resource you created manually.

## Resource declaration

Using the **argument reference** section[2] declare the exact same resource you created

> [!note]
> **Hint:** the location is tricky: go to the Azure Portal inside the Resource group you created.
> There might be a JSON view link on the right, click on it.
> You should find, there, the exact ID of the location.

Also note that maps are declared like this in HCL:

```terraform
tags = {
  "hello" = "world"
}
```

## `terraform apply`

### First error: subscription_id

Run `terraform apply`.

> [!warning]
> You will be warned there's a missing `subscription_id`. Here are a few pointers:
> - the [provider docs](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs#subscription_id) tells you about this field
> - `az account list` will list your current subscription with its ID

### Second error: the resource already exist

Run `terraform apply` and say `yes`.

> [!warning]
> You might be getting an error about the resource already existing.
> This is perfectly normal, let's go on!

## `terraform import`

- Read carefully the command output, Terraform gives you everything:
  - the documentation to read[3]
  - the resource ID
- Write the exact `terraform import` command and run it

And voilà! 👏

---

[1] You're lost? [Go there](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
[2] Not finding anything? [Go here](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group#arguments-reference)
[3] Really not finding it? [Go there](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group#import)
