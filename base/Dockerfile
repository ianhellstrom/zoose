FROM ubuntu:24.04

LABEL org.opencontainers.image.authors="Ian Hellström" \
      org.opencontainers.image.source="https://github.com/ianhellstrom/zoose" \
      org.opencontainers.image.vendor="ianhellstrom.org"

ENV PYTHON_VERSION="3.12"
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
        libzmq3-dev \
        libcurl4-openssl-dev \
        libssl-dev \
        libopenblas0-pthread \
        git \
        sudo \
        libgdal-dev 
RUN add-apt-repository -y universe && apt-get update && \
      apt-get install -y --no-install-recommends python3-pip && \
      ln -s /usr/bin/python${PYTHON_VERSION} /usr/bin/python && \
      rm -rf /var/lib/apt/lists/*

WORKDIR /setup
COPY requirements.txt /setup/requirements.txt
RUN pip install --no-cache-dir --break-system-packages --ignore-installed -r /setup/requirements.txt

COPY dictionaries /usr/local/share/jupyter/dictionaries/
COPY config/extensions.json /root/.jupyter/lab/user-settings/@jupyterlab/extensionmanager-extension/plugin.jupyterlab-settings
COPY config/completion.json /root/.jupyter/lab/user-settings/@krassowski/jupyterlab-lsp/completion.jupyterlab-settings
COPY config/lsp.json /root/.jupyter/lab/user-settings/@krassowski/jupyterlab-lsp/plugin.jupyterlab-settings
COPY config/spelling.json /root/.jupyter/lab/user-settings/@ijmbarr/jupyterlab_spellchecker/plugin.jupyterlab-settings
COPY config/format.json /root/.jupyter/lab/user-settings/@ryantam626/jupyterlab_code_formatter/plugin.jupyterlab-settings
COPY config/format.json /root/.jupyter/lab/user-settings/@ryantam626/jupyterlab_code_formatter/settings.jupyterlab-settings
COPY config/traceback.json /root/.jupyter/lab/user-settings/jupyterlab-skip-traceback/settings.jupyterlab-settings
COPY config/pycodestyle /root/.config/pycodestyle

RUN export CPLUS_INCLUDE_PATH=/usr/include/gdal
RUN export C_INCLUDE_PATH=/usr/include/gdal

EXPOSE 8888

COPY jupyter.sh /jupyter.sh
ENTRYPOINT ["/jupyter.sh"]
