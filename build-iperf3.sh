#!/bin/bash

set -ex

IPERF3_DIST_VERSION=${IPERF3_DIST_VERSION:=3.17.1}
IPERF3_DIST_NAME=iperf-${IPERF3_DIST_VERSION}
IPERF3_DIST_SHA256_SUM=${IPERF3_DIST_SHA256_SUM:=84404ca8431b595e86c473d8f23d8bb102810001f15feaf610effd3b318788aa}

ZIG_TARGET=${ZIG_TARGET:=x86_64-linux-musl}

wget -t 3 https://github.com/esnet/iperf/releases/download/${IPERF3_DIST_VERSION}/iperf-${IPERF3_DIST_VERSION}.tar.gz

echo "$IPERF3_DIST_SHA256_SUM ${IPERF3_DIST_NAME}.tar.gz" | sha256sum --check --status || {
	echo "SHA-256 sum verification failed for: ${IPERF3_DIST_NAME}.tar.gz"
	exit 1
}

mkdir -p iperf3
tar -axf "${IPERF3_DIST_NAME}.tar.gz" --strip-components=1 -C iperf3
rm "${IPERF3_DIST_NAME}.tar.gz"
cd iperf3

if [ -z "$OPENSSL_TARGET" ]; then
    openssl_option="--without-openssl"
else
    openssl_option="--with-openssl=$HOME/openssl" 
fi

CC=${CC:=zig-cc} \
CXX=${CXX:=zig-cxx} \
LD=${LD:=zig-cc} \
AR=${AR:=zig-ar} \
RANLIB=${RANLIB:=zig-ranlib} \
./configure --build=$ZIG_TARGET \
            --host=x86_64-linux-musl \
            --disable-shared \
            --enable-static \
            --enable-static-bin \
            $openssl_option \
	    --prefix="$HOME/iperf3" &&
	    make
make install
