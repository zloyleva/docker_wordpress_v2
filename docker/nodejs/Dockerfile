FROM node:6

WORKDIR /app

COPY package.json .
RUN npm install --quiet
COPY . .

EXPOSE 4200

CMD tail -f /etc/hosts