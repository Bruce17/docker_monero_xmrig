#!/bin/sh

sysctl vm.nr_hugepages=128

if [ -z "$numthreads" ]; then
    echo "\$numthreads is empty"
    numthreads=$(expr $(nproc) / 2)
else
    echo "\$numthreads is NOT empty"
fi
echo "     Using --- $numthreads"

if [ -z "$startport" ] ;then
    echo "\$startport is empty"
    startport=3333
else
    echo "\$startport is NOT empty"
fi
echo "     Using --- $startport"

if [ -z "$xmrpool" ]; then
    echo "\$xmrpool is empty"
    xmrpool=stratum+tcp://pool.supportxmr.com
else
    echo "\$xmrpool is NOT empty"
fi
echo "     Using --- $xmrpool"

if [ -z "$password" ]; then
    echo "\$password is empty"
    password=docker
    echo "     Using --- $password"
else
    echo "\$password is NOT empty"
fi

if [ -z "$donate" ]; then
    echo "\$donate is empty"
    donate=5
else
    echo "\$donate is NOT empty"
fi
echo "     Using --- $donate"

if [ -z "$coin" ]; then
    echo "\$coin is empty"
    coin=monero
else
    echo "\$coin is NOT empty"
fi
echo "     Using --- $coin"

echo "xmrig command arguments:"
echo "-o $xmrpool:$startport -u $username -p $password -t $numthreads --donate-level=$donate $OPTIONS"

/usr/local/bin/xmrig -o $xmrpool:$startport \
  -u $username \
  -p $password \
  -t $numthreads \
  --coin=$coin \
  --donate-level=$donate \
  $OPTIONS
