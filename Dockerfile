FROM mcr.microsoft.com/azure-functions/node:3.0-node12-slim
ARG LOCAL

ENV AzureWebJobsScriptRoot=/home/site/wwwroot \
    AzureFunctionsJobHost__Logging__Console__IsEnabled=true

COPY ["package.json", "package-lock.json", "host.json", "/home/site/wwwroot/"]
RUN cd /home/site/wwwroot && \
    npm ci --only=production

COPY src/ /home/site/wwwroot

# this is required to change authorization to Anonymous when runnign the container locally
# "authLevel": "function" -> "authLevel": "anonymous"
RUN if [ "$LOCAL" = "true" ] ; then find . \( -type f -name .git -prune \) -o -type f -name "function.json" -print0 | xargs -0 sed -i 's/authLevel\": \"function/authLevel\": \"anonymous/g' ; fi