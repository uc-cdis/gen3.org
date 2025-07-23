FROM quay.io/cdis/golang:1.18-bullseye as builder

ENV HUGO_VERSION 0.148.0
ENV PATH=/usr/local/hugo:${PATH}
ENV BASE_URL=

RUN set -x && \
    apt-get update && \
    apt-get install asciidoctor -y && \
    apt-get install curl -y git wget ca-certificates

RUN set -x && \
    curl -L https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.deb -o hugo_extended.deb && \
    apt install ./hugo_extended.deb && \
    hugo version

COPY . /gen3.org
WORKDIR /gen3.org
RUN sed -i "s|{BASE_URL}|${BASE_URL}|g" config.yaml \
    && hugo

FROM nginx
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /gen3.org/public /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d
