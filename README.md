# postgres-timescale

A replacement image for the official PostgreSQL based on `Debian` image with Timescale extension.

The official TimescaleDB image is based on `Alpine`.

Unfortunately there is an issue with sorting on `Alpine`.

See the issue:

[https://github.com/timescale/timescaledb/issues/448](https://github.com/timescale/timescaledb/issues/448)

An alternative would be to use the Timescale-HA image that is based on `Ubuntu`. However, that image is not compatible with the PostgreSQL image.

You can use this image, if:

- If you want a PostgreSQL image with the Timeline extension that has the same sorting behavior as the standard PostgreSQL image.

- If you are using the standard PostgreSQL image (not the `postgres:alpine` image) and want to keep your existing data volumes and just want to switch to a compatible image that just adds the Timescale extension.

## How to use

Use the `Dockerfile` from this repository to build the image yourself or download from the GitHub container registry:

```
docker pull ghcr.io/hoffmann-dsd/postgres-timescale:latest
```

or more specific (recommended)

```
docker pull ghcr.io/hoffmann-dsd/postgres-timescale:14.0.0
```

Hint: The major version is aligned with the major version of the PostgreSQL version.
