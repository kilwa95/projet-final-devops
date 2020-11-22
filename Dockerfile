FROM node:9-slim
WORKDIR /
COPY package.json /
RUN npm install
RUN sudo apt install redis-server
COPY . ./
CMD ["npm","start"]
