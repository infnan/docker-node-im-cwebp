FROM node:latest

ENV CWEBP_URL "https://storage.googleapis.com/downloads.webmproject.org/releases/webp"
ENV CWEBP_VERSION 1.0.2

RUN gpg --keyserver pool.sks-keyservers.net --recv-keys B8232B5D \
  && cd /tmp \
  && curl -SLO "${CWEBP_URL}/libwebp-${CWEBP_VERSION}.tar.gz" \
  && curl -SLO "${CWEBP_URL}/libwebp-${CWEBP_VERSION}.tar.gz.asc" \
  && gpg --verify "libwebp-${CWEBP_VERSION}.tar.gz.asc" "libwebp-${CWEBP_VERSION}.tar.xz" \
  && tar -xf "libwebp-${CWEBP_VERSION}.tar.gz" \
  && cd libwebp-${CWEBP_VERSION} \
  && ./configure \
  && make \
  && make install \
  && ldconfig /usr/local/lib
  && rm -rf /tmp/*
