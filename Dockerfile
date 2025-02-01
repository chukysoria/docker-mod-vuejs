# syntax=docker/dockerfile:1@sha256:93bfd3b68c109427185cd78b4779fc82b484b0b7618e36d0f104d4d801e66d25
FROM alpine@sha256:56fa17d2a7e7f168a043a2712e63aed1f8543aeafdcee47c58dcffe38ed51099 as BUILD

# set version label
ARG BUILD_EXT_RELEASE="v2.22.0"
# extract vuetorrent
RUN \
  echo "***** install vuetorrent ****" && \
  mkdir /vuetorrent && \
  apk add curl && \
  curl -o \
    /tmp/vuetorrent.zip -L \
    "https://github.com/WDaan/VueTorrent/releases/download/${BUILD_EXT_RELEASE}/vuetorrent.zip" && \
  unzip \
    /tmp/vuetorrent.zip -d \
    /vuetorrent

FROM scratch as DEPLOY

COPY --from=BUILD /vuetorrent /vuetorrent
