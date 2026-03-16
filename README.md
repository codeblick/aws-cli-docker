# AWS CLI Docker

Minimales Docker-Image mit der AWS CLI, basierend auf `python:alpine`. Wird in unseren Shopware-Projekten für das lokale Entwicklungssetup verwendet, um z. B. MySQL-Dumps aus einem S3-Bucket herunterzuladen.

**Docker Hub:** [codeblick/aws-cli](https://hub.docker.com/r/codeblick/aws-cli)

**Plattformen:** `linux/amd64`, `linux/arm64`

## Verwendung

### Direkter Aufruf

```bash
docker run --rm \
  -e AWS_ACCESS_KEY_ID=<dein-key> \
  -e AWS_SECRET_ACCESS_KEY=<dein-secret> \
  codeblick/aws-cli \
  s3 cp s3://mein-bucket/dump.sql.gz ./dump.sql.gz
```

### In `docker-compose.yml`

```yaml
services:
  aws-cli:
    image: codeblick/aws-cli
    environment:
      AWS_ACCESS_KEY_ID: ${AWS_ACCESS_KEY_ID}
      AWS_SECRET_ACCESS_KEY: ${AWS_SECRET_ACCESS_KEY}
    volumes:
      - .:/data
    working_dir: /data
```

### Typischer Einsatz im `update.sh`-Skript

Das `./update.sh`-Skript nutzt dieses Image, um MySQL-Dumps aus einem S3-Bucket herunterzuladen und in die lokale Datenbank zu importieren:

```bash
docker run --rm \
  -e AWS_ACCESS_KEY_ID \
  -e AWS_SECRET_ACCESS_KEY \
  -v $(pwd):/data \
  codeblick/aws-cli \
  s3 cp s3://mein-bucket/dump.sql.gz /data/dump.sql.gz
```

## Eigenes Image bauen

```bash
docker build -t aws-cli .
```
