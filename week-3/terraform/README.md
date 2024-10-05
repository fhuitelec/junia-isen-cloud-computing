# Terraform stack

This terraform stack provisions:

- a PostgreSQL server instance
- an HTTP API on App service

## Variables

| Variable                | Default                                 | Description                                                       |
| ----------------------- | --------------------------------------- | ----------------------------------------------------------------- |
| `location`              | `francecentral`                         | Location of the resources                                         |
| `resource_group_name`   | `week-3`                                | Name of the resource group in which all resource are grouped      |
| `enable_database`       | `false`                                 | Whether to deploy the PostgreSQL database or not                  |
| `enable_api`            | `false`                                 | Whether to deploy the HTTP API or not                             |
| `github_handle`         |                                         | Your GitHub username                                              |
| `subscription_id`       |                                         | Your Azure subscription ID                                        |
| `email_address`         |                                         | Your JUNIA email address. Example: firstname.lastname@*.junia.com |
| `database_server_name`  | `playground-computing-${github_handle}` | Name of the database server                                       |
| `database_name`         | `${github_handle}`                      | Name for the database within the server                           |
| `database_username`     | `${github_handle}`                      | Administrator username for the database                           |
| `database_password`     | Generated password                      | Administrator password for the database                           |
| `new_relic_licence_key` |                                         | Used by the app service container to publish logs & metrics.      |

## Output

| Variable   | Description                             |
| ---------- | --------------------------------------- |
| `database` | The connection details for the database |
| `api`      | The URL to access the API               |

## File structure

```
terraform/
├── terraform.tf     -> A file container the `terraform` block with required providers
├── main.tf          -> The main file declaring resources, data & modules
├── variables.tf     -> A file declaring variables the user has to provide or with sane defaults
├── output.tf        -> A file declaring variables to output to the user
├── terraform.tfvars -> A file containing user-defined variables to avoid manually entering them
└── modules
    ├── app_service  -> A module to provision an app service
    └── database     -> A module to provision a database instance
```

### Modules

Let's read [Terraform documentation about modules](https://developer.hashicorp.com/terraform/tutorials/modules/module).

| Module                                | Usage                                           |
| ------------------------------------- | ----------------------------------------------- |
| [app_service](./modules/app_service/) | Provision a container-based web-app             |
| [database](./modules/database/)       | Provision a PostgreSQL flexible server database |

Each module has this file structure:

```
module
├── main.tf      -> Contains the main Terraform logic
├── variables.tf -> The input variables the module needs
└── output.tf    -> The variables outputs to its consumers
```
