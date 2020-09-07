# Build
Built using Avanade Beef https://github.com/Avanade/Beef

## Running project during development
```bash
docker-compose up
```
Will start DB server, create the DB and populate it with data.

# Example Run:

```bash
dotnet run all -cs "Server= ;Database= ;User id= ;Password= "
```

Server=localhost; Database=TM3; User id=sa; Password=yourStrong(!)Password

# TODO
Currently test data files - `*-data-*.sql` are part of the migrations, they should be moved to TestData directory and only loaded when specifically requested - during development or integration testing.