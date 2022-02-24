FROM alpine:latest as build
ENV HUGO_VERSION 0.92.2
ENV HUGO_DOWNLOAD https://github.com/spf13/hugo/releases/download
ENV HUGO_BINARY hugo_${HUGO_VERSION}_Linux-64bit.tar.gz
RUN set -x && \
  apk add --update wget ca-certificates && \
  wget ${HUGO_DOWNLOAD}/v${HUGO_VERSION}/${HUGO_BINARY} && \
  tar xzf ${HUGO_BINARY} && \
  rm -r ${HUGO_BINARY} && \
  mv hugo /usr/bin && \
  apk del wget ca-certificates && \
  rm /var/cache/apk/*
COPY ./site /site
WORKDIR /site
RUN /usr/bin/hugo -D

FROM nginx:alpine
COPY --from=build /site/public /usr/share/nginx/html
