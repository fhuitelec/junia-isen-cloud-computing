# Step 2: manually connect to the database

## Connect through Azure's dashboard

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

## Connect through SQLTools in Visual Studio Code

On the VSCode sidebar (on the left usually), click the database icon at the bottom and Add a new connection:

- select PostgreSQL
- server address: the server name (finishing with `database.azure.com`) you noted earlier
- port: 5432 (default PostgreSQL port)
- database: postgre
- user & password you chose and noted earlier

Once connected, in the prompt file, run the content of the file [resources/database/script.sql](../resources/database/script.sql).
