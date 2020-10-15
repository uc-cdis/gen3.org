#  An Amazing Gen3.org

The Gen3.org website for describing the Gen3 platform.

## Local Development

```bash
# Install hugo
brew install hugo
# Build site and start Hugo server locally
hugo server -D -b localhost
```

## Dockerfile

Features a Dockerfile for easier local testing in a clean environment.
The docker build command builds an image from a Dockerfile and a context 
The build is run by the Docker daemon, not by the CLI 

You can specify a repository and tag at which to save the new iamge if the build succeds:

$ docker build -t shykes/myapp .
