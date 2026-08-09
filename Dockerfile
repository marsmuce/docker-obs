# syntax=docker/dockerfile:1

FROM ghcr.io/linuxserver/baseimage-selkies:ubunturesolute

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="thelamer"

# title
ENV TITLE="OBS STUDIO" \
    PIXELFLUX_WAYLAND=true

RUN \
  echo "**** add icon ****" && \
  curl -o \
    /usr/share/selkies/www/icon.png \
    https://github.com/obsproject/obs-studio/blob/master/frontend/forms/images/obs.png?raw=true && \
  echo "**** install packages ****" && \
  add-apt-repository --yes --no-update ppa:obsproject/obs-studio && \
  apt-get update && \
  apt-get install -y obs-studio
# add local files
COPY /root /

# ports and volumes
EXPOSE 3001
