# postgres-timescale

A PostgreSQL Docker image based on **Debian**, designed as a replacement for the official TimescaleDB image, which is based on Alpine, to address known sorting issues.

## Why This Image?

The official TimescaleDB Docker image is based on `Alpine`, but there is a **known issue with sorting** when using Alpine-based images in PostgreSQL, which can cause unexpected behavior in certain scenarios. This issue has been documented and discussed in the following issue report:

[Alpine sorting issue on TimescaleDB](https://github.com/timescale/timescaledb/issues/448)

### Why Not Use the Timescale-HA Image?
An alternative to the official TimescaleDB image is the **Timescale-HA** image, which is based on `Ubuntu`. However, this image is **not fully compatible with the standard PostgreSQL image**, which can lead to complications if you're trying to switch from a standard PostgreSQL setup to Timescale.

## Overview

To overcome these challenges, this image:
- **Uses a Debian base** to ensure sorting behavior remains consistent with the standard PostgreSQL image.
- **Includes the TimescaleDB extension** for time-series data support, without the issues introduced by Alpine-based builds.

## Use Cases

This image is ideal if:
- You need a PostgreSQL image with the TimescaleDB extension that avoids the sorting issues associated with Alpine.
- You are using the standard PostgreSQL image (not the `postgres:alpine` image) and want to seamlessly switch to an image with TimescaleDB, while maintaining compatibility with your existing data volumes.

## Features

- **Debian-Based Image**: Provides consistent sorting behavior and full compatibility with standard PostgreSQL images.
- **Preinstalled TimescaleDB Extension**: Add time-series capabilities to your PostgreSQL database without additional setup.
- **PostgreSQL Compatibility**: Designed to work seamlessly with existing PostgreSQL setups, ensuring an easy transition for users.

## How to Use

### Pull the Image

You can pull the prebuilt Docker image from the GitHub Container Registry:

```bash
docker pull ghcr.io/hoffmann-dsd/postgres-timescale:latest
```

For a specific version (recommended):

```bash
docker pull ghcr.io/hoffmann-dsd/postgres-timescale:14.0.0
```

### Build the Image Yourself

If you prefer to build the image from this repository:

```bash
git clone https://github.com/hoffmann-dsd/postgres-timescale.git
cd postgres-timescale
docker build -t postgres-timescale:latest .
```

### Run the Container

To run the container:

```bash
docker run -d \
    -p 5432:5432 \
    --name postgres-timescale \
    ghcr.io/hoffmann-dsd/postgres-timescale:latest
```

### Volumes and Data Persistence

For persistent storage, mount your data volume:

```bash
docker run -d \
    -p 5432:5432 \
    -v /path/to/your/data:/var/lib/postgresql/data \
    --name postgres-timescale \
    ghcr.io/hoffmann-dsd/postgres-timescale:latest
```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Known Issues

- Sorting behavior issues with Alpine-based PostgreSQL images: [https://github.com/timescale/timescaledb/issues/448](https://github.com/timescale/timescaledb/issues/448)

## Contributing

Contributions are welcome! Feel free to open an issue or submit a pull request.
