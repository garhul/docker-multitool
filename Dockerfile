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

RUN npm i -g serverless@1.39.0

ENV TERRAFORM_VERSION 0.11.14
RUN wget -O terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform.zip -d /tmp && rm -f terraform.zip && mv /tmp/terraform /usr/local/bin/tf_${TERRAFORM_VERSION}

ENV TERRAFORM_VERSION 0.11.13
RUN wget -O terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform.zip -d /tmp && rm -f terraform.zip && mv /tmp/terraform /usr/local/bin/tf_${TERRAFORM_VERSION}

ENV TERRAFORM_VERSION 0.12.8
RUN wget -O terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform.zip -d /tmp && rm -f terraform.zip && mv /tmp/terraform /usr/local/bin/tf_${TERRAFORM_VERSION}



RUN pip install --no-cache-dir --upgrade pip awscli
