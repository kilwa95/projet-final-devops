FROM node:9-slim
WORKDIR /
COPY package.json /
RUN npm install
RUN apt install redis-server
COPY . ./
CMD ["npm","start"]
