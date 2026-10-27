ARG NODE_VERSION=22
ARG NODE_DISTRO=bookworm-slim

ARG NODE_DIGEST
FROM node:${NODE_VERSION}-${NODE_DISTRO}@${NODE_DIGEST}

ENV USER=container \
    HOME=/home/container \
    LANG=C.UTF-8 \
    DEBIAN_FRONTEND=noninteractive

RUN case "$NODE_VERSION" in \
        19|19.*) \
          printf '%s\n' \
            'deb [check-valid-until=no] http://archive.debian.org/debian bullseye main' \
            'deb [check-valid-until=no] http://archive.debian.org/debian-security bullseye-security main' \
            > /etc/apt/sources.list \
          ;; \
    esac \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get update \
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
