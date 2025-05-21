
FROM node:22




WORKDIR /app



COPY package*.json ./


RUN npm install


COPY . .

RUN chmod +x wait-for.sh


EXPOSE 9002



CMD ["./wait-for.sh", "node", "src/server.js"]


