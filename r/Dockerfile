ARG BASE

FROM ${BASE}
LABEL org.opencontainers.image.authors="Ian Hellström" \
      org.opencontainers.image.source="https://github.com/ianhellstrom/zoose" \
      org.opencontainers.image.vendor="Databaseline"

RUN apt-get update && apt-get install -y --no-install-recommends \
      r-base-* \
      r-base-dev-* \
      r-base-core-* \
      r-recommended-*
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /setup
COPY kernel.R /setup/kernel.R
ENV LIBARROW_MINIMAL="false"
RUN R --vanilla < /setup/kernel.R

ENTRYPOINT ["/jupyter.sh"]
