ARG BASE

FROM ${BASE}
LABEL org.opencontainers.image.authors="Ian Hellström" \
      org.opencontainers.image.source="https://github.com/ianhellstrom/zoose" \
      org.opencontainers.image.vendor="Databaseline"

WORKDIR /setup
COPY requirements.txt /setup/requirements.txt
COPY unpinned-requirements.txt /setup/unpinned.txt
RUN pip install --no-cache-dir -r /setup/requirements.txt
RUN pip install --no-cache-dir -r /setup/unpinned.txt

ENTRYPOINT ["/jupyter.sh"]
