FROM ubuntu:kinetic

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y curl make git build-essential unzip 	libsdl2-dev

RUN groupadd ioquake3 && \
    useradd -d /ioquake3 -m -s /bin/false -g ioquake3 ioquake3

USER ioquake3

ENV MAKEOPTS -j8

RUN git clone --depth 1 https://github.com/ioquake/ioq3.git /ioquake3/src
RUN cd /ioquake3/src && \
    make all && \
    mv /ioquake3/src/build/release-linux-x86_64/* /ioquake3/ && \
    rm -rf /ioquake3/src

COPY --chown=ioquake3:ioquake3 data/baseq3 /ioquake3/baseq3
COPY --chown=ioquake3:ioquake3 data/missionpack /ioquake3/missionpack

COPY --chown=ioquake3:ioquake3 quake3-latest-pk3s.zip /tmp
RUN unzip /tmp/quake3-latest-pk3s.zip -d /ioquake3 && \
    rm /tmp/quake3-latest-pk3s.zip && \
    mv /ioquake3/quake3-latest-pk3s/baseq3/* /ioquake3/baseq3/ && \
    mv /ioquake3/quake3-latest-pk3s/missionpack/* /ioquake3/missionpack/

COPY --chown=ioquake3:ioquake3 start_server.sh /ioquake3/

WORKDIR /ioquake3
EXPOSE 27960/udp

ENTRYPOINT ["/bin/sh", "/ioquake3/start_server.sh"]
