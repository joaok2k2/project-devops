FROM node:18.11.0

WORKDIR /app

COPY /src/package*.json /app/

RUN npm install

COPY /src/ .

EXPOSE 8080

CMD ["npm", "start"]