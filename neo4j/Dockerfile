FROM databaseline/zoose-base

LABEL org.opencontainers.image.authors="Ian Hellström" \
      org.opencontainers.image.source="https://github.com/ianhellstrom/zoose" \
      org.opencontainers.image.vendor="ianhellstrom.org"

RUN set -o pipefail && \
    wget -q -O - https://debian.neo4j.com/neotechnology.gpg.key | apt-key add - && \
    echo 'deb https://debian.neo4j.com stable 4.4' | tee -a /etc/apt/sources.list.d/neo4j.list && \
    apt-get update && apt-get install -y --no-install-recommends neo4j && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /setup
COPY requirements.txt /setup/requirements.txt
RUN pip install --no-cache-dir -r /setup/requirements.txt

COPY config/neo4j.conf /etc/neo4j/neo4j.conf

EXPOSE 7473
EXPOSE 7474
EXPOSE 7687

COPY neo4j.sh /neo4j.sh
ENTRYPOINT ["/neo4j.sh"]
