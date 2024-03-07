FROM debian:latest
RUN apt-get update && apt-get --no-install-recommends install -y wget libgl-dev alsa-utils dbus* pulseaudio sox libgtk-3-0
RUN dbus-uuidgen --ensure
WORKDIR /root/.vendetta
RUN bash
