# Ubuntu focal = 20.04
FROM ubuntu:focal AS build

ARG VERSION
ENV VERSION ${VERSION:-6.10.0}

RUN apt install -y curl && \
    mkdir /tmp/xmrig && \
    cd /tmp/xmrig && \
    curl -o xmrig.tar.gz "https://github.com/xmrig/xmrig/releases/download/v${VERSION}/xmrig-${VERSION}-focal-x64.tar.gz" && \
    tar -xzf xmrig.tar.gz && \
    ls -ahl /tmp/xmrig

FROM ubuntu:focal

COPY --from=build /tmp/xmrig/xmrig /usr/local/bin/xmrig
COPY entrypoint.sh /usr/local/bin/xmrig.sh

ENTRYPOINT ["xmrig.sh"]
