FROM openjdk:8-alpine

ARG DIGDAG_VERSION=latest

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" > /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories

RUN apk update && apk add --no-cache \
    bash \
    musl \
    linux-headers \
    curl \
    wget \
    docker \
    jruby \
    tzdata \
    git \
    ca-certificates \
    python2 \
    python2-dev \
    py-setuptools \
    py2-pip

RUN curl --create-dirs -o /root/.digdag/bin/digdag -L -k "https://dl.digdag.io/digdag-$DIGDAG_VERSION" && \
    chmod +x /root/.digdag/bin/digdag

ENV PATH /root/.digdag/bin:$PATH

