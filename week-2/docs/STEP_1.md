# Step 1: provision a database

We are going to use the [Azure Database for PostgreSQL - Flexible Server](https://learn.microsoft.com/en-us/azure/postgresql/flexible-server/overview).

## Create your instance

On the [Azure portal](https://portal.azure.com/), go create a Database for PostgreSQL - Flexible Server (use the search bar if needed).

Create an instance with the following characteristics (leave as is when unspecified):

### Basics

- Region: France central
- Workload type: Development
- Compute + storage (configure server):
  - Computer tier: burstable
  - Compute size: Standard B1ms
  - Storage size: 32GiB
  - Performance tier: 500iops
- High availibility: disabled
- Authentication: PostgreSQL + Entra
- Click **Set admin**, search for your name and select yourself as an admin
- admin user & password of your choosing (note them for later)

### Network

- Connectivity method: Public access
- Firewall rules: Add 0.0.0.0 - 255.255.255.255

### After the creation

Once your instance has been created, please on the **Overview** of your database server note the **Server name**.

## A few explanation

- we have disabled high availibity on our instance, for a production setup, this is bad. To know more, read:
  - https://learn.microsoft.com/en-us/azure/reliability/availability-zones-overview
  - https://en.wikipedia.org/wiki/High_availability (summary & sections Resilience, Principles & See also)
  - https://en.wikipedia.org/wiki/Availability_zone
- we have enabled public access and in the firewall rules, we have authorized incoming trafic from everywhere: this is very bad.
  - in cloud architecture, we **never, ever, ever** expose resources unnecessarily: databases should never be accessed from the internet
  - we'll talk about this later on when we'll address network exposure

## Connect

### Through Azure's dashboard

You added yourself in Entra as an admin of this instance so let's connect.

Usually, you will never use a cloud provider "connect" feature from their dashboard: it's impractical.

You generally use this kind of feature as a last resort because you "locked the door" by mistake and cannot access your resource any other way.

- Go to your instance **Overview**
- On the toolbox at the top, click **Connect** and connect to the `postgres` database
- The command might fail because of a bug, if so, run the following:

```shell
TOKEN=$(az account get-access-token --resource-type oss-rdbms --output tsv --query accessToken)
psql "host=hello-there.postgres.database.azure.com port=5432 dbname=postgres user=fabien.huitelec@ext.junia.com password=$TOKEN sslmode=require"
```

Then run the command `\conninfo` to see your identity.

### Through SQLTools in Visual Studio Code

On the VSCode sidebar (on the left usually), click the database icon at the bottom and Add a new connection:

- select PostgreSQL
- server address: the server name (finishing with `database.azure.com`) you noted earlier
- port: 5432 (default PostgreSQL port)
- database: postgre
- user & password you chose and noted earlier
- SSL: enabled

Once connected, in the prompt file, run the content of the file [resources/database/script.sql](../resources/database/script.sql), this will:
- create a table `examples`
- add a simple record to the table
- you can add more records if you'd like
