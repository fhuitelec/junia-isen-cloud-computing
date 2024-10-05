# Step 1: discover the terraform stack

In this step, we'll be getting familiar with a quite complex Terraform stack. Buckle up!

## The basics

First things first, let's initialize the Terraform stack:

```shell
cd terraform
terraform init -upgrade
```

## Try an apply

Let's see if we can run an apply:

```shell
terraform apply

# Terraform should ask you to enter a few things
# Let's follow its lead
```

After the apply, you should have a few not very interesting resources: some random passwords, a resource group, etc. No worries, the complex resources will come a bit later.

## `terraform.tfvars`

To avoid repeating yourself every time you run `terraform apply`:

- create a file named `terraform.tfvars`
- add the exact same variables Terraform asked you earlier:
  - `email_address   = "xxx"`
  - `github_handle   = "yyy"`
  - `subscription_id = "zzz"`

```shell
terraform apply
# It should not ask you anything
# and the plan should indicate no changes
```

## Read the docs

Read the Terraform stack [README.md](../terraform/README.md).

The best form and up-to-date documentation is the code itself: browse the `.tf` source code and try to grasp what the code is doing.

You are greatly encouraged to go to the [Terraform registry](https://registry.terraform.io/browse/providers) and to read the documentation for all Terraform resource you encounter.
