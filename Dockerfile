FROM node:alpine
LABEL "maintainer"="Adrian Gesto <adrian.gesto@gmail.com>"

RUN apk -v --update add --no-cache \
    python \
    py-pip \
    ca-certificates \
    openssl \
    groff \
    less \
    bash \
    curl \
    jq \
    git \
    zip \
    build-base

RUN pip install --upgrade awscli
RUN pip install --upgrade boto3

RUN npm i -g serverless@1.39.0

ADD scripts/* /usr/local/bin/

RUN pip install --no-cache-dir --upgrade pip awscli
