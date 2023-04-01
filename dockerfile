FROM node:14-alpine

WORKDIR app

COPY package*./JSON ./

RUN npm install

RUN npx json-server --watch db.json

RUN npm install -g browser-sync

RUN browser-sync start --server --file . --host --port 5000 --startPath index.html


COPY . .

EXPOSE 3000