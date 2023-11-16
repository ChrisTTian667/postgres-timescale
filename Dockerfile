ARG PG_VERSION=14
ARG TS_VERSION=14
FROM postgres:${PG_VERSION}
RUN apt-get update && apt-get install -y lsb-release wget
RUN echo "deb https://packagecloud.io/timescale/timescaledb/debian/ $(lsb_release -c -s) main" | tee /etc/apt/sources.list.d/timescaledb.list
RUN wget --quiet -O - https://packagecloud.io/timescale/timescaledb/gpgkey | apt-key add -
RUN apt-get update && apt-get install -y timescaledb-2-postgresql-${TS_VERSION}
COPY init-timescaledb.sh /docker-entrypoint-initdb.d/init-timescaledb.sh