# hasura-kt-demo_6_26_2020

Refer to Hasura docs to learn about Hasura and its features: https://hasura.io/docs/1.0/graphql/manual/index.html

## Prerequisites

### Install Docker Desktop

Install and start Docker Desktop:
https://www.docker.com/products/docker-desktop

### Install Hasura CLI

**(Mac/Linux):**

`curl -L https://github.com/hasura/graphql-engine/raw/stable/cli/get.sh | bash`

**(Windows):**

Click link to download:
https://github.com/hasura/graphql-engine/releases/download/v1.2.2/cli-hasura-windows-amd64.exe

Rename the downloaded file to hasura.exe .
You can add the path to the environment variable PATH for making hasura accessible globally.

## Start Hasura Server Locally

### Start Hasura locally using Docker Compose:

`docker-compose up -d`

Go to http://localhost:8080 if console is enabled (Not a recommended way to access console)

Run the console via the Hasura CLI while in top level directory to track metadata and migrations (Recommended way to access console):

`hasura console`

## Create Schema and Load Data
Copy from the following files and paste into the Hasura console Raw SQL text box and hit run in order to build the schema and load data: schema.sql and data.sql.

## Stop Hasura Server Locally

### Stop Hasura locally using Docker Compose:

`docker-compose down -v`
