ARG BASE

FROM ${BASE}
LABEL org.opencontainers.image.authors="Ian Hellström" \
      org.opencontainers.image.source="https://github.com/ianhellstrom/zoose" \
      org.opencontainers.image.vendor="Databaseline"

WORKDIR /setup
COPY requirements.txt /setup/requirements.txt
RUN pip install --no-cache-dir -r /setup/requirements.txt

# HACK for cirq and related libraries
RUN pip install --no-cache-dir cirq openfermion pennylane-cirq

ENTRYPOINT ["/jupyter.sh"]
