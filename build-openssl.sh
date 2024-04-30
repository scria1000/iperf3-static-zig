#!/bin/bash

set -ex

OPENSSL_DIST_VERSION=${OPENSSL_DIST_VERSION:=3.3.0}
OPENSSL_DIST_NAME=openssl-${OPENSSL_DIST_VERSION}
OPENSSL_DIST_SHA256_SUM=${OPENSSL_DIST_SHA256_SUM:=53e66b043322a606abf0087e7699a0e033a37fa13feb9742df35c3a33b18fb02}

wget -t 3 https://github.com/openssl/openssl/releases/download/${OPENSSL_DIST_NAME}/${OPENSSL_DIST_NAME}.tar.gz

echo "$OPENSSL_DIST_SHA256_SUM ${OPENSSL_DIST_NAME}.tar.gz" | sha256sum --check --status || {
	echo "SHA-256 sum verification failed for: ${OPENSSL_DIST_NAME}.tar.gz"
	exit 1
}

tar -axf ${OPENSSL_DIST_NAME}.tar.gz
rm ${OPENSSL_DIST_NAME}.tar.gz
cd ${OPENSSL_DIST_NAME}

CC=${CC:=zig-cc} \
CXX=${CXX:=zig-cxx} \
LD=${LD:=zig-cc} \
AR=${AR:=zig-ar} \
RANLIB=${RANLIB:=zig-ranlib} \
./config threads no-shared no-dso no-comp \
	$OPENSSL_FLAGS \
	--prefix="$HOME/openssl" --libdir=lib \
	$OPENSSL_TARGET &&
	make
make install_sw
