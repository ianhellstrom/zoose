FROM databaseline/zoose-base

LABEL org.opencontainers.image.authors="Ian Hellström" \
      org.opencontainers.image.source="https://github.com/ianhellstrom/zoose" \
      org.opencontainers.image.vendor="ianhellstrom.org"

WORKDIR /setup
COPY requirements.txt /setup/requirements.txt
RUN pip install --no-cache-dir --break-system-packages -r /setup/requirements.txt

# HACK for cirq and related libraries
RUN pip install --no-cache-dir --break-system-packages cirq openfermion pennylane-cirq

ENTRYPOINT ["/jupyter.sh"]
