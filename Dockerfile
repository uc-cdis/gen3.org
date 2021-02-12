FROM golang:1.8.3-alpine as builder

ENV HUGO_VERSION 0.80.0
# get extended version of hugo for SASS/SCSS support
ENV HUGO_BINARY hugo_extended_${HUGO_VERSION}_Linux-64bit
ENV PATH=/usr/local/hugo:${PATH}
ENV BASE_URL=

ENV GLIBC_VERSION 2.27-r0

RUN set -x && \
  apk add --update wget ca-certificates libstdc++

# Install glibc: This is required for HUGO-extended (including SASS) to work.

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
&&  wget "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/$GLIBC_VERSION/glibc-$GLIBC_VERSION.apk" \
&&  apk --no-cache add "glibc-$GLIBC_VERSION.apk" \
&&  rm "glibc-$GLIBC_VERSION.apk" \
&&  wget "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/$GLIBC_VERSION/glibc-bin-$GLIBC_VERSION.apk" \
&&  apk --no-cache add "glibc-bin-$GLIBC_VERSION.apk" \
&&  rm "glibc-bin-$GLIBC_VERSION.apk" \
&&  wget "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/$GLIBC_VERSION/glibc-i18n-$GLIBC_VERSION.apk" \
&&  apk --no-cache add "glibc-i18n-$GLIBC_VERSION.apk" \
&&  rm "glibc-i18n-$GLIBC_VERSION.apk"

RUN set -x \
    && apk upgrade --update \
    && apk add --update bash curl wget \
    && rm -rf /var/cache/apk/* \
    && mkdir /usr/local/hugo \
    && wget https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}.tar.gz -O /usr/local/hugo/${HUGO_BINARY}.tar.gz \
    && tar xzf /usr/local/hugo/${HUGO_BINARY}.tar.gz -C /usr/local/hugo/ \
    && rm /usr/local/hugo/${HUGO_BINARY}.tar.gz \
    && rm -rf /tmp/* /var/cache/apk/*

COPY . /gen3.org
WORKDIR /gen3.org
RUN sed -i "s|{BASE_URL}|${BASE_URL}|g" config.yaml \
    && hugo

FROM nginx

COPY --from=builder /gen3.org/public /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d
