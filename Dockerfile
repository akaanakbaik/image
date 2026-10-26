ARG NODE_VERSION=22
FROM node:${NODE_VERSION}-bookworm-slim

ENV USER=container \
    HOME=/home/container \
    LANG=C.UTF-8 \
    DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        bash \
        ca-certificates \
        curl \
        git \
        openssh-client \
        python3 \
        python3-pip \
        build-essential \
        pkg-config \
        unzip \
        zip \
        xz-utils \
        tini \
    && rm -rf /var/lib/apt/lists/* \
    && usermod --login container --home /home/container --move-home node \
    && mkdir -p /home/container \
    && chown -R container:1000 /home/container

WORKDIR /home/container

USER container

ENTRYPOINT ["/usr/bin/tini", "--", "/bin/bash", "-c"]

CMD ["exec ${STARTUP:-node --version}"]
