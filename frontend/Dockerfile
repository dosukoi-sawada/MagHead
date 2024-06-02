FROM node:22.2.0

WORKDIR /usr/src/app/frontend

COPY package*.json ./
RUN npm install

EXPOSE 3000

CMD ["npm", "run", "start"]
