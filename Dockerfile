FROM node:latest
MAINTAINER Chris Joakim

# Create app directory
RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

# Install app dependencies
COPY . /usr/src/app/

RUN npm install

# Bundle app source
COPY .  /usr/src/app

EXPOSE 80
CMD [ "node", "www" ]

# docker build -t cjoakim/nam1 . 
# docker run -d -p 80:3000 cjoakim/nam1:latest
# docker ps
# docker stop -t 2 86b125ed43e5
# docker push cjoakim/nam1:latest

# docker info cjoakim/nam1:latest
