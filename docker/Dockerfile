FROM ubuntu:21.04
LABEL org.opencontainers.image.authors="Ian Hellström" \
      org.opencontainers.image.source="https://github.com/ianhellstrom/zoose" \
      org.opencontainers.image.vendor="Databaseline"

ENV PYTHON_VERSION="3.9"
ARG DEBIAN_FRONTEND="noninteractive"
ARG TZ="Europe/Berlin"

SHELL ["/bin/bash", "-cu"]

RUN apt-get update && apt-get -y upgrade && \
      apt-get install -y --no-install-recommends \
        apt-transport-https \
        ca-certificates \
        build-essential \
        software-properties-common \
        curl \
        wget \
        gpg gpg-agent \
        openjdk-11-jre \
        python${PYTHON_VERSION} \
        python${PYTHON_VERSION}-dev \
        python${PYTHON_VERSION}-distutils \
        libzmq3-dev \
        libcurl4-openssl-dev \
        libssl-dev \
        libopenblas0-pthread \
        jupyter-core \
        jupyter-client \
        git \
        r-base-* \
        r-base-dev-* \
        r-base-core-* \
        r-recommended-*
RUN add-apt-repository -y universe && apt-get update && \
      apt-get install -y --no-install-recommends python3-pip && \
      ln -s /usr/bin/python${PYTHON_VERSION} /usr/bin/python && \
      rm -rf /var/lib/apt/lists/*
RUN set -o pipefail && \
    wget -q -O - https://debian.neo4j.com/neotechnology.gpg.key | apt-key add - && \
    echo 'deb https://debian.neo4j.com stable 4.3' | tee -a /etc/apt/sources.list.d/neo4j.list && \
    apt-get update && apt-get install -y --no-install-recommends neo4j && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /setup
COPY kernel.R /setup/kernel.R
ENV LIBARROW_MINIMAL="false"
RUN R --vanilla < /setup/kernel.R
COPY requirements.txt /setup/requirements.txt
RUN pip install --no-cache-dir -r /setup/requirements.txt

COPY config/neo4j.conf /etc/neo4j/neo4j.conf
COPY dictionaries /usr/local/share/jupyter/dictionaries/
COPY config/extensions.json /root/.jupyter/lab/user-settings/@jupyterlab/extensionmanager-extension/plugin.jupyterlab-settings
COPY config/completion.json /root/.jupyter/lab/user-settings/@krassowski/jupyterlab-lsp/completion.jupyterlab-settings
COPY config/lsp.json /root/.jupyter/lab/user-settings/@krassowski/jupyterlab-lsp/plugin.jupyterlab-settings
COPY config/spelling.json /root/.jupyter/lab/user-settings/@ijmbarr/jupyterlab_spellchecker/plugin.jupyterlab-settings
COPY config/format.json /root/.jupyter/lab/user-settings/@ryantam626/jupyterlab_code_formatter/plugin.jupyterlab-settings
COPY config/format.json /root/.jupyter/lab/user-settings/@ryantam626/jupyterlab_code_formatter/settings.jupyterlab-settings
COPY config/traceback.json /root/.jupyter/lab/user-settings/jupyterlab-skip-traceback/settings.jupyterlab-settings
COPY config/pycodestyle /root/.config/pycodestyle

ARG zoose_version
ENV ZOOSE_VERSION $zoose_version

EXPOSE 7473
EXPOSE 7474
EXPOSE 7687
EXPOSE 8888
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
