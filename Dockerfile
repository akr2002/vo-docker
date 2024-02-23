FROM debian:latest
RUN apt-get update && apt-get install -y wget libgl-dev alsa-utils dbus* pulseaudio sox
RUN dbus-uuidgen --ensure
WORKDIR /root/.vendetta
RUN bash
