FROM ghcr.io/rblaine95/alpine:edge

ARG VERSION
ENV VERSION ${VERSION:-6.10.0}

RUN apk --no-cache --update upgrade && \
    apk --no-cache --update add git make g++ cmake coreutils build-base \
        libuv-dev libmicrohttpd-dev openssl-dev \
        hwloc-dev && \
        # there is no NUMA support for ARM 32 bit
        # numactl && \
    rm -rf /var/cache/apk/

COPY entrypoint.sh /usr/local/bin/xmrig.sh

ENTRYPOINT ["xmrig.sh"]
