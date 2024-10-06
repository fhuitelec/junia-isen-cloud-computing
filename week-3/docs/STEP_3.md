# Step 3: real observability with New Relic

In [week 2](../..//week-2/), we used App Service's log stream, the poor man's logging.

Let's use a proper observability solution: New relic. There are a few solid alternative like Datadog or Honeycomb but New relic has a nice free tier.

## Log into New relic

- go to [login.newrelic.com](https://login.newrelic.com/login)
- retrieve the credentials from [there](https://send.bitwarden.com/#4Z_YcrtXnkOuNLIAAXceww/Z8ju7H8Ru0FDgaO-k18hug) and log in
  - the Bitwarden password will be displayed in class

You should see New relic's dashboard.

## Licence key

- find in the [README.md](../terraform/README.md), the licence key variable
- find out the value of the licence key from the [variables.tf](../terraform/variables.tf) source code
- set the variable in your `terraform.tfvars` file
- run `terraform apply`

## Monitor your HTTP API

- wait 1-2 minutes that your API gets redeployed
- access your API a few times to generate web trafic
- go to the New relic [entities dashboard](https://one.newrelic.com/nr1-core)
- find your API and on the sidebard, click on Logs

This will allow you to see in real-time your application logs.
