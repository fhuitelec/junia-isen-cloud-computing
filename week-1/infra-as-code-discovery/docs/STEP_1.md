# Step 1: install Terraform & Azure CLIs

> [!warning]
> You might be tempted to just run `apt install azure-cli` or some equivalent for Terraform.
>
> Please don't 😬 You might either:
> - install unsupported versions
> - miss the point of this practical session!

## Install Terraform

- Go to [HashiCorp's documentation](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/install-cli#install-terraform) to install Terraform
- Go on the **Linux** tab
- Follow the documentation

## Install Azure CLI

- Go to [Azure's documentation](https://learn.microsoft.com/fr-fr/cli/azure/install-azure-cli-linux?pivots=apt) to install Azure CLI
- Make sure you're on the **apt (Ubuntu, Debian)** tab
- Follow the documentation

> [!note]
> For what it's worth, `lsb_release -a` will let you know you're on **Ubuntu 22.04**

## Log in with the Azure CLI

- Run `az login --use-device-code`
- Follow the instructions you're given
- Select the only subcription (Azure for Students)
- Observe the concept of subscription and read on:
  - about [subcriptions](https://learn.microsoft.com/fr-fr/azure/cloud-adoption-framework/ready/azure-setup-guide/organize-resources)
  - about [resource groups](https://learn.microsoft.com/fr-fr/azure/azure-resource-manager/management/manage-resource-groups-portal)

## Next

Go to [step 2](./docs/STEP_2.md).
