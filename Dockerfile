FROM node:8.4.0
EXPOSE 8081
WORKDIR pizza-express
COPY . ./
RUN npm i
RUN npm i express --save
ENTRYPOINT ["node", "server.js"]

