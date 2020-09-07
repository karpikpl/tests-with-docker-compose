FROM node:latest

WORKDIR /integration
# copy and install packages first so they stay in top layer
COPY package.json /integration/
RUN npm install

MOUNT 
VOLUME [ "/data" ]: ./Sample.App.Database:/code
COPY . /integration/

CMD [ "npm", "test" ]