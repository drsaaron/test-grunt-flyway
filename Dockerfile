# modeled on https://nodejs.org/en/docs/guides/nodejs-docker-webapp/

FROM node:boron

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json .

# For npm@5 or later, copy package-lock.json as well
# COPY package.json package-lock.json ./

RUN npm install

# install grunt
RUN npm install -g grunt-cli

# Bundle app source
COPY . .

# install java (see https://hackernoon.com/install-java-in-docker-container-1d361e2e027e)
#RUN apt-get update -y && apt-get install openjdk-8-jre-headless -y
RUN set -ex && \
    echo 'deb http://deb.debian.org/debian jessie-backports main' \
      > /etc/apt/sources.list.d/jessie-backports.list && \
    apt update -y && \
    apt install -t \
      jessie-backports \
      openjdk-8-jre-headless \
        ca-certificates-java -y

# command
CMD [ "grunt", "flyway:migrate" ]
