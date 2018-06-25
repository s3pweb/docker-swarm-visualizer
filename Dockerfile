#Latest version of node tested on.
FROM node:8.2.1-alpine AS dist

WORKDIR /app

# Only run npm install if these files change.
ADD ./package.json /app/package.json

# Install dependencies
RUN npm install

# Add the rest of the sources
ADD . /app

RUN npm run dist

# MS : Number of milliseconds between polling requests. Default is 1000.
# CTX_ROOT : Context root of the application. Default is /
ENV MS=1000 CTX_ROOT=/

EXPOSE 8080

CMD ["npm","start"]
