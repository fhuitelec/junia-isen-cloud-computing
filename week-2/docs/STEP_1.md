# Step 1: provision a database

> [!warning]
> The following steps will be done live by @fhuitelec and the whole class, follow along and take notes.
> 
> What follows will give us pointers on where to go next.

We are going to use the [Azure Database for PostgreSQL - Flexible Server](https://learn.microsoft.com/en-us/azure/postgresql/flexible-server/overview).

## Click-click creation

> [!note]
> Like we did last week, we want to get comfortable with the **Azure Database**.
>
> To do this, we'll create the database manually to discover its settings.
> We'll import it into Terraform later on.

Topics to discuss about:

- PostgreSQL version (cf. [releases](https://www.postgresql.org/docs/release/))
- High availability & replication
- see costs & mention calculator
- Authentication (cf. slides)
- Connect via the UI
  - Microsoft Entra: authority
  - broken command: decompose it & link with authentication
  - talk about bearer token
  - \conninfo
  - volunteer: add as an admin with JUNIA info
    - Security > Authentication
    - Connect via the UI

## Terraform import

- terraform state list
- terraform state show
- remove fields

## Connect

### Firewall rule

- use the SQLTools extension
- check firewall rules (v4.ident.me)
- declare resource
  - mention resource separations
- at the end: open to everyone

### Connection informations

Use the SQLTools extension.

- hostname: `playground-computing.postgres.database.azure.com`
- port: 5432
- dbname: `postgres`
- username: `cloudcomputing`
- password: `curious-GENTLEMAN-unusable`

### Create the table

Run [/resources/database/script.sql](../resources/database/script.sql)
