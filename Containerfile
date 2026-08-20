FROM ghcr.io/containerpak/gtk3:main

LABEL org.opencontainers.image.source="https://github.com/Containerpak/opera"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    gnupg libcups2t64 libcurl4t64 libnss3 \
    libqt5core5t64 libqt5gui5t64 libqt5widgets5t64 && \
    cpak-clean-junk

COPY icon.png /usr/share/icons/hicolor/128x128/apps/opera.png
COPY opera.desktop /usr/share/applications/opera.desktop
