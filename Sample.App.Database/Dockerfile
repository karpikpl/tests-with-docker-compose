FROM mcr.microsoft.com/dotnet/core/sdk:3.1

WORKDIR  /app
COPY *.csproj /app/
RUN dotnet restore
COPY Program.cs /app/
RUN dotnet publish --no-restore --configuration Release -o out
CMD dotnet out/Sample.App.Database.dll