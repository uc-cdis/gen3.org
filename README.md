# Gen3.org

The Gen3.org website for describing the Gen3 platform.

## Local Development

```bash
# Install hugo
brew install hugo asciidoctor
# Build site and start Hugo server locally
hugo server -D -b localhost
``` 

## Dockerfile

Features a Dockerfile for easier local testing in a clean environment.

```bash
# Build image
docker build -t gen3.org .
# Run container
docker run -p 1313:80 gen3.org
```
