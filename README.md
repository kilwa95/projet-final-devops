# hello-container

Sample application to play with containers!

## Disclaimer

This is not a _real_ project. I use this application to illustrate some training or talks.

## Versions

This project has been tested with NodeJS v8.4.0 and NPM v5.3.0.

## Structure

```
The application contains three parts: a frontend, a server and a redis database, interacting like this :

[ Frontend (web application)] --> [ Backend (nodeJs server)] --> [ Database (redis server)]


The frontend can run without server or database, in a mode called Offline mode.

```

## Frontend build

``` bash
# install dependencies
npm install

# build for production with minification
npm run build

# You can now serve through a web server like nginx the content of the dist/ folder
```

## Backend build

```
npm install --production
```

You can then run the server by running:
```
node ./server.js
```

The backend requires a redis server.
You can pass the host running the redis server through the REDIS_HOST environment variable.

```
npm install --production
REDIS_HOST=redis.example.net node ./server.js
```
