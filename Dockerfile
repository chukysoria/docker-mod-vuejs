# syntax=docker/dockerfile:1@sha256:93bfd3b68c109427185cd78b4779fc82b484b0b7618e36d0f104d4d801e66d25
FROM alpine@sha256:a8560b36e8b8210634f77d9f7f9efd7ffa463e380b75e2e74aff4511df3ef88c as BUILD

# set version label
ARG BUILD_EXT_RELEASE="v2.23.0"
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
