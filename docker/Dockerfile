FROM ubuntu:21.04
LABEL org.opencontainers.image.authors="Ian Hellström"

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
        python${PYTHON_VERSION}-distutils
RUN add-apt-repository -y universe && apt-get update && \
      apt-get install -y --no-install-recommends python3-pip && \
      ln -s /usr/bin/python${PYTHON_VERSION} /usr/bin/python && \
      rm -rf /var/lib/apt/lists/*
RUN wget -O - https://debian.neo4j.com/neotechnology.gpg.key | apt-key add - && \
    echo 'deb https://debian.neo4j.com stable 4.3' | tee -a /etc/apt/sources.list.d/neo4j.list && \
    apt-get update && apt-get install -y neo4j

WORKDIR /setup
COPY requirements.txt /setup/requirements.txt
RUN pip install -r /setup/requirements.txt

RUN jupyter contrib nbextension install && \
    jupyter nbextension install https://github.com/drillan/jupyter-black/archive/master.zip && \
    jupyter nbextensions_configurator enable && \
    jupyter nbextension enable cell_filter/cell_filter && \
    jupyter nbextension enable code_font_size/code_font_size && \
    jupyter nbextension enable code_folding/main && \
    jupyter nbextension enable --section edit codefolding/edit && \
    jupyter nbextension enable comment-uncomment/main && \
    jupyter nbextension enable highligher/highlighter && \
    jupyter nbextension enable init_cell/main && \
    jupyter nbextension enable python-markdown/main && \
    jupyter nbextension enable rubberband/main && \
    jupyter nbextension enable scratchpad/main && \
    jupyter nbextension enable snippets/main && \
    jupyter nbextension enable spellchecker/main && \
    jupyter nbextension enable toc2/main && \
    jupyter nbextension enable treefilter/index && \
    jupyter nbextension enable varInspector/main && \
    jupyter nbextension enable jupyter-black-master/jupyter-black

COPY neo4j.conf /etc/neo4j/neo4j.conf
COPY snippets.json /usr/local/share/jupyter/nbextensions/snippets/snippets.json

RUN mv /var/lib/neo4j/labs/apoc-4.3.0.0-core.jar /var/lib/neo4j/plugins/

EXPOSE 7473
EXPOSE 7474
EXPOSE 7687
EXPOSE 8888
COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
