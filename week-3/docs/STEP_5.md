# Step 5: deploy the HTTP API locally

Let's deploy the HTTP API locally.

## Run locally

Go to [examples-api](../examples-api/) and follow the instructions from the [README.md](../examples-api/README.md).

## A few hints

- within GitHub Codespace or devcontainers, `uv` is already installed, no need to install it again
- use `tf output database` and `tf output storage` to help you declare the environment variables
- the "host" is interchangeable with "hostname" or "server": it means the PostgreSQL hostname/URL

## Try to access your `quotes.json` within the API

The HTTP API has an endpoint `/quotes` that returns the content of the file `quotes.json` you uploaded in the last step.

Go to your API on the `/quotes` and check out what happens.

Let's see [next](./STEP_6.md), what you can do to fix this issue.
