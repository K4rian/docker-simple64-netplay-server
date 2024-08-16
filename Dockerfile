FROM golang:alpine3.20 AS builder

WORKDIR /tmp/simple64

RUN apk update \
    && apk -U add --no-cache \
        git=2.45.2-r0 \
    && mkdir -p /server \
    && git clone "https://github.com/simple64/simple64-netplay-server.git" /tmp/simple64 \
    && go mod download \
    && CGO_ENABLED=0 go build -a -o simple64-netplay-server . \
    && cp /tmp/simple64/simple64-netplay-server /server/simple64-netplay-server \
    && chmod +x /server/simple64-netplay-server \
    && rm -R /tmp/simple64

FROM alpine:3.20

ENV USERNAME=simple64
ENV USERHOME=/home/$USERNAME

ENV S64NS_NAME="simple64 Netplay Server"
ENV S64NS_PORT=45000
ENV S64NS_LOGPATH="simple64-netplay-server.log"
ENV S64NS_MOTD=""
ENV S64NS_MAXGAMES=10
ENV S64NS_DISABLEBROADCAST="false"
ENV S64NS_ENABLEAUTH="false"

RUN apk update \
    && adduser --disabled-password $USERNAME \
    && rm -rf /tmp/* /var/tmp/*

COPY --from=builder --chown=$USERNAME /server/* $USERHOME/
COPY --chown=$USERNAME ./container_files $USERHOME/

USER $USERNAME
WORKDIR $USERHOME

RUN chmod +x docker-entrypoint.sh

ENTRYPOINT ["./docker-entrypoint.sh"]