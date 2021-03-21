FROM ghcr.io/rblaine95/alpine:edge

ENV VERSION 6.10.0

RUN apk --no-cache --update upgrade
RUN apk --no-cache --update add git
RUN apk --no-cache --update add make
RUN apk --no-cache --update add g++
RUN apk --no-cache --update add cmake
RUN apk --no-cache --update add coreutils
RUN apk --no-cache --update add build-base
RUN apk --no-cache --update add libuv-dev
RUN apk --no-cache --update add libmicrohttpd-dev
RUN apk --no-cache --update add openssl-dev
RUN apk --no-cache --update add hwloc-dev
RUN apk --no-cache --update add numactl
RUN rm -rf /var/cache/apk/

COPY entrypoint.sh /usr/local/bin/xmrig.sh

ENTRYPOINT ["xmrig.sh"]
