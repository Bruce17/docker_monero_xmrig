FROM ubuntu AS build

ARG VERSION
ENV VERSION ${VERSION:-v6.10.0}

RUN apt update && \
    apt upgrade -y && \
    apt install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev

RUN cd /tmp && \
    git clone https://github.com/xmrig/xmrig.git && \
    cd xmrig && \
    git checkout $VERSION && \
    sed -i -e 's/constexpr const int kMinimumDonateLevel = 1;/constexpr const int  kMinimumDonateLevel = 0;/g' src/donate.h && \
    mkdir build && cd build
RUN cd /tmp/xmrig/build && \
    cmake ..
RUN cd /tmp/xmrig/build && \
    make -j$(nproc)

FROM ubuntu

COPY --from=build /tmp/xmrig/build/xmrig /usr/local/bin/xmrig
COPY entrypoint.sh /usr/local/bin/xmrig.sh

ENTRYPOINT ["xmrig.sh"]
