FROM ubuntu:latest
MAINTAINER 1017 <docker@1017consultants.nl>

RUN apt-get update \
    && apt-get install -y \
    npm \
    unzip \
    && apt-get clean \
    && mkdir -p /opt/adss \
    && ln -s /usr/bin/nodejs /usr/bin/node \
    && npm install graphene-pk11 --global

COPY config.json /usr/local/lib/node_modules/graphene-pk11/build/console/config.json

ADD ./signer.zip /opt/adss 

RUN unzip /opt/adss/signer.zip
    #&& ln -s /usr/bin/nodejs /usr/bin/node \
    #&& npm install graphene-pk11 --global

EXPOSE 8774
EXPOSE 8777
EXPOSE 8778
EXPOSE 8779