FROM ubuntu:latest

WORKDIR /srv/app

ENV VERSION=0.12.7
ENV DOMAIN="releases.hashicorp.com"
ENV URL=https://${DOMAIN}/terraform/${VERSION}/terraform_${VERSION}_linux_amd64.zip

RUN apt-get update

RUN apt-get -yq install \
    unzip \
    wget

RUN wget -O /tmp/terraform.zip ${URL} \
    && unzip /tmp/terraform.zip -d /tmp \
    && mv /tmp/terraform /usr/bin

RUN apt install -yq \
    python3-pip

RUN pip3 install awscli

RUN apt clean -yq
