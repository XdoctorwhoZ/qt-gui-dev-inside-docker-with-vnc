FROM ubuntu:22.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive TZ=Europe/Paris \
    apt-get -y install tzdata xvfb x11vnc fluxbox \
    unzip git wget python3 python3-pip cmake libgl1-mesa-dev libdbus-1-dev libxkbcommon-dev \
    libxkbcommon-x11-0 libxcb-xinerama0

RUN pip install py7zr requests semantic_version lxml

RUN git clone https://github.com/engnr/qt-downloader.git /opt/Qt

WORKDIR /opt/Qt
RUN ./qt-downloader linux desktop 6.2.4 gcc_64 --opensource

WORKDIR /app

RUN apt-get install -y qt6-base-dev

COPY vnc.start.sh /bin/vnc.start.sh
COPY container-entrypoint.sh /bin/container-entrypoint.sh

RUN chmod +x /bin/vnc.start.sh
RUN chmod +x /bin/container-entrypoint.sh

ENV DISPLAY :1
ENTRYPOINT [ "/bin/container-entrypoint.sh" ]
