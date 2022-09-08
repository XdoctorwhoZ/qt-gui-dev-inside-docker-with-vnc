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

ENV DISPLAY :1
CMD Xvfb :1 -screen 0 1280x1024x16 & \
    fluxbox & \
    x11vnc -forever & \
    mkdir -p build && \
    cd build && \
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=/opt/Qt/6.2.4/gcc_64/ .. && \
    make && \
    /app/build/example-app
