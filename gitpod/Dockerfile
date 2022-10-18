ARG BASE

FROM ${BASE}
LABEL org.opencontainers.image.authors="Ian Hellström" \
      org.opencontainers.image.source="https://github.com/ianhellstrom/zoose" \
      org.opencontainers.image.vendor="Databaseline"

RUN useradd -l -u 33333 -G sudo -md /home/gitpod -s /bin/bash -p gitpod gitpod

RUN mkdir /home/gitpod/.jupyter
COPY jupyter_lab_config.py /home/gitpod/.jupyter/jupyter_lab_config.py

USER gitpod
