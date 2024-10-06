# Examples API

Simple API that returns example records from a database.

## Prerequisites

- you need to install [uv](https://docs.astral.sh/uv/guides/install-python/)
- you must have a PostgreSQL instance available with an `example` table

## Installation

```shell
# Install Python in the right version
uv python install

# Install dependencies and create virtual env
uv sync
```

## Run

```shell
# Export environment variables to connect to the PostgreSQL database...
export DATABASE_HOST=
export DATABASE_PORT=
export DATABASE_NAME=
export DATABASE_USER=
export DATABASE_PASSWORD='' # Use single quotes to avoid shell interpolation with characters like $ or #
# ...and the storage account
export STORAGE_ACCOUNT_URL=

# Run the application
uv run fastapi dev main.py
```

They go on:

- http://localhost:8000/docs
- http://localhost:8000/
- http://localhost:8000/examples
