import os
import psycopg2

from fastapi import FastAPI, HTTPException


app = FastAPI()


@app.get("/")
def read_root():
    return {"Hello": "World"}


@app.get("/examples")
def read_examples():
    try:
        conn = psycopg2.connect(
            host=get_environment_variable("DATABASE_HOST"),
            port=get_environment_variable("DATABASE_PORT", "5432"),
            database=get_environment_variable("DATABASE_NAME"),
            user=get_environment_variable("DATABASE_USER"),
            password=get_environment_variable("DATABASE_PASSWORD"),
            connect_timeout=1,
        )

        cur = conn.cursor()
        cur.execute("SELECT * FROM examples")
        examples = cur.fetchall()
        return {"examples": examples}
    except psycopg2.OperationalError as error:
        raise HTTPException(status_code=500, detail=str(error))


def get_environment_variable(key, default=None):
    value = os.environ.get(key, default)

    if value is None:
        raise RuntimeError(f"{key} does not exist")

    return value
