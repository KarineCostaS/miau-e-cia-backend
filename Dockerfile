# Imagem base
FROM node:latest

# Defina o diretório de trabalho
WORKDIR /usr/src/app

# Copie o package.json e o package-lock.json
COPY package*.json ./

# Instale as dependências do projeto
RUN npm install

# Copie os arquivos do projeto
COPY . .

# Instale o json-server e o browser-sync
RUN npm install -g json-server && npm install -g browser-sync

# Exponha as portas que o browser-sync e o json-server estão ouvindo
EXPOSE 3000 

# Execute o json-server e o browser-sync
CMD ["sh", "-c", "npx json-server --watch db.json & browser-sync start --server --file . --host 0.0.0.0 --port 5000 --startPath index.html"]
