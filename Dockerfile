# syntax=docker/dockerfile:1@sha256:db1ff77fb637a5955317c7a3a62540196396d565f3dd5742e76dddbb6d75c4c5
FROM alpine@sha256:21dc6063fd678b478f57c0e13f47560d0ea4eeba26dfc947b2a4f81f686b9f45 as BUILD

# set version label
ARG BUILD_EXT_RELEASE="v2.19.0"
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
