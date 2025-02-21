FROM databaseline/zoose-base

LABEL org.opencontainers.image.authors="Ian Reppel" \
      org.opencontainers.image.source="https://github.com/ianreppel/zoose" \
      org.opencontainers.image.vendor="ianreppel.org"

WORKDIR /setup
COPY requirements.txt /setup/requirements.txt
RUN pip install --no-cache-dir --break-system-packages gdal=="$(gdal-config --version).*" --no-build-isolation
RUN pip install --no-cache-dir --break-system-packages -r /setup/requirements.txt

ENTRYPOINT ["/jupyter.sh"]
