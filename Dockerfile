# Ubuntu focal = 20.04
FROM ubuntu:focal AS build

ARG VERSION
ENV VERSION ${VERSION:-6.10.0}

RUN apt update && \
    apt upgrade -y && \
    apt install -y curl
RUN mkdir /tmp/xmrig && \
    cd /tmp/xmrig && \
    curl -o xmrig.tar.gz -L "https://github.com/xmrig/xmrig/releases/download/v${VERSION}/xmrig-${VERSION}-focal-x64.tar.gz" && \
    tar -xf xmrig.tar.gz && \
    echo "ls -ahl /tmp/xmrig" && \
    ls -ahl /tmp/xmrig && \
    echo "ls -ahl /tmp/xmrig/xmrig-*" && \
    ls -ahl /tmp/xmrig/xmrig-*

FROM ubuntu:focal

COPY --from=build /tmp/xmrig/xmrig-*/xmrig /usr/local/bin/xmrig
COPY entrypoint.sh /usr/local/bin/xmrig.sh

ENTRYPOINT ["xmrig.sh"]
