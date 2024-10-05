# Step 4: provision an App Service and deploy the HTTP API

We are going to use the [Azure App Service](https://learn.microsoft.com/en-us/azure/app-service/overview).

## Create your instance

On the [Azure portal](https://portal.azure.com/), go create an App Service (use the search bar if needed).

Create an instance with the following characteristics (leave as is when unspecified):

### Basics

- **Web app**
- Publish: container
- Operating system: Linux
- Region: France central
- Pricing plan: Free F1

### Container

- Image source: Docker Hub or other registries
- Access type: Public
- Registry server URL: https://ghcr.io
- Image and tag: fhuitelec/examples-api:1.0.0

### Enable logging

- Go to your App server resource overview
- In the sidebar on the left go to **Monitoring** > **App Service logs**
- Declare the following:
  - Application logging: File system
  - Quota: 35MB
  - Retention period: 1
- Save the settings

### Add environment variables

- Go to your App server resource overview
- In the sidebar on the left go to **Settings** > **Environment variables**
- Add the 5 `DATABASE_` environment variables from the [README.md](../examples-api/README.md) like you did in [STEP_3](./STEP_3.md)

Note: no need to check **Deployment slot setting** when declaring environment variables.

### After the creation

Once your instance has been created, please on the **Overview** of your database server note the **Default domain** (end with `azurewebsites.net`).

Go to the **Default domain** on:
- `/`
- `/docs`
- `/examples`

You can check your **Log stream** on the sidebar.

### Troubleshooting

If you are having issues, you can read logs from 2 places on the App service sidebar:

- **Deployment** > **Deployment Center** > **Logs** tab: logs related to your container lifecycle
- **Log stream**: logs related to your application
