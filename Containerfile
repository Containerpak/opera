FROM ubuntu:26.04 AS source

ADD --checksum=sha256:8da792bd27a70d9e91b463fe314a427a22ebdda1bfe98463bdce2807a492752b https://get.geo.opera.com/pub/opera/desktop/133.0.5932.60/linux/opera-stable_133.0.5932.60_amd64.deb /tmp/app.deb

FROM ghcr.io/containerpak/gtk3:main

LABEL org.opencontainers.image.source="https://github.com/Containerpak/opera"

RUN --mount=type=bind,from=source,source=/tmp/app.deb,target=/run/app.deb \
    apt-get update && \
    apt-get install -y --no-install-recommends /run/app.deb && \
    cpak-clean-junk

COPY icon.png /usr/share/icons/hicolor/128x128/apps/opera.png
COPY opera.desktop /usr/share/applications/opera.desktop
