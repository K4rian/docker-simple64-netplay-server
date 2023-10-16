# Build the server binary
FROM alpine:latest as builder

RUN apk update \
    && apk -U add --no-cache \
        git \
        go \
    && mkdir -p /server /tmp/simple64 \
    && cd /tmp/simple64 \
    && git clone "https://github.com/simple64/simple64-netplay-server.git" /tmp/simple64 \
    && go mod download \
    && CGO_ENABLED=0 go build -a -o simple64-netplay-server . \
    && cp /tmp/simple64/simple64-netplay-server /server/simple64-netplay-server \
    && chmod +x /server/simple64-netplay-server \
    && rm -R /tmp/simple64

# Set-up the server
FROM alpine:latest

ENV USERNAME simple64
ENV USERHOME /home/$USERNAME

ENV S64NS_NAME "simple64 Netplay Server"
ENV S64NS_PORT 45000
ENV S64NS_LOGPATH "simple64-netplay-server.log"
ENV S64NS_MOTD ""
ENV S64NS_MAXGAMES 10
ENV S64NS_DISABLEBROADCAST "false"
ENV S64NS_ENABLEAUTH "false"

RUN apk update \
    && adduser --disabled-password $USERNAME \
    && rm -rf /tmp/* /var/tmp/*

COPY --from=builder --chown=$USERNAME /server/* $USERHOME/
COPY --chown=$USERNAME ./container_files $USERHOME/

USER $USERNAME
WORKDIR $USERHOME

RUN chmod +x docker-entrypoint.sh

ENTRYPOINT ["./docker-entrypoint.sh"]