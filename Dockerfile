FROM node:14-alpine

WORKDIR /usr/app

COPY package*.json ./

RUN npm install

COPY . .


RUN npx json-server --watch db.json


EXPOSE 3000

RUN npm install -g browser-sync

CMD [ "browser-sync start --server --file . --host --port 5000 --startPath index.html" ] 

COPY . .

