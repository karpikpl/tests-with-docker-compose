# About
Azure functions node-js project generated using yeoman

# Azure functions node js reference
* [Source code](https://github.com/Azure/azure-functions-nodejs-worker)
* [Azure Functions JavaScript developer guide](https://docs.microsoft.com/en-us/azure/azure-functions/functions-reference-node)

# Setting up local development environment
Requirements:
- node 12
- NPM (installed together with node)
- azure-functions-core tools v3 - https://github.com/Azure/azure-functions-core-tools

Nice to have:
- docker and docker-compose

## Running the project
As with any other node project - install dependencies `npm i`, then `npm start` to run the function.

## Project setup
Project was setup with few opinionated tools from nodejs ecosystem.

### Eslint - checking syntax
Eslint can be executed directly via `npm run lint` or `yarn lint`. It's also executed during build and in pre-commit hook.

### Prettier - auto-formatting
Prettier can be executed directly via `npm run format` or `yarn format`. It's also executed during build and in pre-commit hook.

## Running tests
There are 4 pre-configured ways of running tests with JEST:
* `npm run test` - single execution of unit tests
* `npm run test:dev` - unit tests executed in watch mode (they run after each file change)
* `npm run test:all` - unit tests and integration tests executed in watch mode (they run after each file change). It requires function running locally at http://localhost:7071
* `npm run test:int` - only integration tests executed in watch mode (they run after each file change). It requires function running locally at http://localhost:7071

## Running sample function
Sample function will expose 1 HTTP trigger: `GET localhost:7071/api/contacts`

## Developing with docker
The easiest way is to run entire stack with docker-compose:
```bash
docker-compose up
```
It will run the function with SQL DB that's seeded with data.

> Note: this mode is not great for development as local file changes are not reflected live in docker containers.

### Running DB with data usign docker-compose
To run just the DB with seeded data, run this command from `Sample.App.Database` directory:
```bash
DB_PORT=1456 docker-compose up
```
If environment variable is not set, default port 1433 is used.

### Running tests with docker-compose
To run integration tests with azure function, SQL Server and seeded data, execute:
```
./test.sh
```
It will cleanup resources and execute docker-compose for you.
```bash
docker-compose -p ci -f docker-compose.yml -f docker-compose.tests.yml up
```

### Running function in docker container

First create `local.env.docker` file:

```yaml
AzureWebJobsStorage=UseDevelopmentStorage=true
FUNCTIONS_WORKER_RUNTIME=node
sqlServer=xxx.database.windows.net
sqlDatabase=sampleDB
sqlUsername=testUser
sqlPassword=XXXXX
```

Build the image:

```bash
docker build --build-arg LOCAL=true . -t node-fun
```

Run the container with local settings:

```bash
docker run --rm --name node-fun -p 7071:80 --env-file local.env.docker  node-fun
```

### Running SQL server in docker container

THis will run an empty SQL Server
```bash
docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=yourStrong(!)Password' -p 1433:1433 -d mcr.microsoft.com/mssql/server:2019-latest
```

