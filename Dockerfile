# syntax=docker/dockerfile:1@sha256:572cebbc2b15e6f84c077742952674889cb63cd5e9b80abdffcbe587b6f19183
FROM alpine@sha256:be2656061b536c1883c4034790e21d0a09c5aaaf51968b89368a3c0371ea2c9a as BUILD

# set version label
ARG BUILD_EXT_RELEASE="v2.37.0"
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
