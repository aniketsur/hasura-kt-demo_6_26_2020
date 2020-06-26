# hasura-kt-demo_6_26_2020

## Initial Setup
Create a postgres database locally called Truckstop.

Then pick one of the following ways to start the Hasura server.

## Run locally with docker
### Mac
```bash
docker run -d -p 8080:8080 \
  -e HASURA_GRAPHQL_DATABASE_URL=postgres://username:password@host.docker.internal:5432/Truckstop \
  -e HASURA_GRAPHQL_ENABLE_CONSOLE=true \
  hasura/graphql-engine:v1.2.2
```
### Windows
```bash
docker run -d -p 8080:8080 \
  -e HASURA_GRAPHQL_DATABASE_URL=postgres://username:password@docker.for.win.localhost:5432/Truckstop \
  -e HASURA_GRAPHQL_ENABLE_CONSOLE=true \
  hasura/graphql-engine:v1.2.2
```
## Run locally with docker-compose
Change postgres connection string in docker-compose.yml then run the following:
```bash
docker-compose up -d
```
## Run locally with kubernetes
Change postgres connection string in deployment.yaml then run the following:
```bash
kubectl create -f deployment.yaml
kubectl create -f svc.yaml
```
## Access the Hasura console
Download the hasura CLI then type the following:
```bash
hasura console
```

## Create Schema and Load Data
Copy from the following files and paste into the Hasura console Raw SQL text box and hit run in order to build the schema and load data: schema.sql and data.sql.
