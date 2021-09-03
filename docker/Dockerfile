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
        r-base-* \
        r-base-dev-* \
        r-base-core-* \
		    r-recommended-*
RUN add-apt-repository -y universe && apt-get update && \
      apt-get install -y --no-install-recommends python3-pip && \
      ln -s /usr/bin/python${PYTHON_VERSION} /usr/bin/python && \
      rm -rf /var/lib/apt/lists/*
RUN wget -O - https://debian.neo4j.com/neotechnology.gpg.key | apt-key add - && \
    echo 'deb https://debian.neo4j.com stable 4.3' | tee -a /etc/apt/sources.list.d/neo4j.list && \
    apt-get update && apt-get install -y neo4j

WORKDIR /setup
COPY kernel.R /setup/kernel.R
RUN R --vanilla < /setup/kernel.R
COPY requirements.txt /setup/requirements.txt
RUN pip install -r /setup/requirements.txt

RUN jupyter contrib nbextension install && \
    jupyter nbextension install https://github.com/drillan/jupyter-black/archive/master.zip && \
    jupyter nbextensions_configurator enable && \
    jupyter nbextension enable code_font_size/code_font_size && \
    jupyter nbextension enable codefolding/main && \
    jupyter nbextension enable --section edit codefolding/edit && \
    jupyter nbextension enable comment-uncomment/main && \
    jupyter nbextension enable init_cell/main && \
    jupyter nbextension enable python-markdown/main && \
    jupyter nbextension enable rubberband/main && \
    jupyter nbextension enable scratchpad/main && \
    jupyter nbextension enable skip-traceback/main && \
    jupyter nbextension enable snippets/main && \
    jupyter nbextension enable spellchecker/main && \
    jupyter nbextension enable toc2/main && \
    jupyter nbextension enable jupyter-black-master/jupyter-black

COPY neo4j.conf /etc/neo4j/neo4j.conf
COPY snippets.json /usr/local/share/jupyter/nbextensions/snippets/snippets.json

RUN mv /var/lib/neo4j/labs/apoc-4.3.0.0-core.jar /var/lib/neo4j/plugins/

ARG zoose_version
ENV ZOOSE_VERSION $zoose_version

EXPOSE 7473
EXPOSE 7474
EXPOSE 7687
EXPOSE 8888
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
