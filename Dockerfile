FROM alpine:latest

ENV USER_AGENT "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36"

RUN apk add --no-cache curl make git build-base unzip

RUN addgroup ioquake3 && \
    adduser -h /ioquake3 -s /bin/false -G ioquake3 -D ioquake3

COPY data/ /tmp
COPY quake3-latest-pk3s.zip /tmp
RUN  chown ioquake3.ioquake3 -R /tmp/*

USER ioquake3

RUN curl -A "${USER_AGENT}" https://raw.githubusercontent.com/ioquake/ioq3/master/misc/linux/server_compile.sh -o /ioquake3/server_compile.sh && \
    curl -A "${USER_AGENT}" https://raw.githubusercontent.com/ioquake/ioq3/master/misc/linux/start_server.sh -o /ioquake3/start_server.sh

RUN cd /ioquake3 && \
    yes | sh server_compile.sh

RUN mv /tmp/baseq3/* /ioquake3/ioquake3/baseq3/ && \
    mv /tmp/missionpack/* /ioquake3/ioquake3/missionpack/

RUN cd /tmp && \
    unzip quake3-latest-pk3s.zip && \
    mv quake3-latest-pk3s/baseq3/* /ioquake3/ioquake3/baseq3/ && \
    mv quake3-latest-pk3s/missionpack/* /ioquake3/ioquake3/missionpack/

EXPOSE 27960/udp

ENTRYPOINT ["/bin/sh", "/ioquake3/start_server.sh"]
