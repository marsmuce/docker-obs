FROM ghcr.io/linuxserver/baseimage-selkies:ubunturesolute

ENV TITLE="OBS STUDIO" \
    PIXELFLUX_WAYLAND=true

RUN add-apt-repository --yes --no-update ppa:obsproject/obs-studio && \
  apt-get update && \
  apt-get install -y obs-studio

COPY /root /

EXPOSE 3001
