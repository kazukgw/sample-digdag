FROM openjdk:8-alpine

ARG APKPKGS
ARG EMBULK_VERSION
ARG EMBULK_GEMS
ARG DIGDAG_VERSION
ARG PIP_PKGS
ARG HOST_DOCKER_GROUP

RUN adduser digdag -g 'digdag user' -s /bin/bash -D

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

RUN if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python2.7 /usr/bin/python; fi \
    && if [[ ! -e /usr/bin/easy_install ]]; then ln -sf /usr/bin/easy_install-2.7 /usr/bin/easy_install; fi \
    && if [[ ! -e /usr/bin/pip ]]; then ln -sf /usr/bin/pip2.7 /usr/bin/pip; fi \
    && pip install --upgrade pip

RUN curl --create-dirs -o /home/digdag/.digdag/bin/digdag -L -k "https://dl.digdag.io/digdag-$DIGDAG_VERSION" && \
    chmod +x /home/digdag/.digdag/bin/digdag

RUN curl --create-dirs -o /home/digdag/.embulk/bin/embulk -L -k "https://dl.embulk.org/embulk-$EMBULK_VERSION.jar" && \
    chmod +x /home/digdag/.embulk/bin/embulk

RUN if [[ -n "$APKPKGS" ]]; then apk add --no-cache $APKPKGS; fi \
    && if [[ -n "$PIP_PKGS" ]]; then pip install $PIP_PKGS; fi \
    && if [[ -n "$EMBULK_GEMS" ]]; then /home/digdag/.embulk/bin/embulk gem install $EMBULK_GEMS; fi

# RUN if [[ -n "$HOST_DOCKER_GROUP" ]]; then addgroup $HOST_DOCKER_GROUP && addgroup digdag $HOST_DOCKER_GROUP; fi
RUN if [[ -n "$HOST_DOCKER_GROUP" ]]; then addgroup digdag $HOST_DOCKER_GROUP; fi

USER digdag

ENV PATH /home/digdag/.embulk/bin:/home/digdag/.digdag/bin:$PATH

WORKDIR /home/digdag

EXPOSE 65432


