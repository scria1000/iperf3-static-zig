#!/bin/bash

set -ex

ZIG_DIST_VERSION=${ZIG_DIST_VERSION:=0.13.0}
ZIG_DIST_NAME=zig-linux-x86_64-${ZIG_DIST_VERSION}
ZIG_DIST_SHA256_SUM=${ZIG_DIST_SHA256_SUM:=d45312e61ebcc48032b77bc4cf7fd6915c11fa16e4aad116b66c9468211230ea}

mkdir -p -v "$HOME/.local/bin"
cd "$HOME/.local/bin"

wget -t 3 https://ziglang.org/builds/${ZIG_DIST_NAME}.tar.xz
echo "$ZIG_DIST_SHA256_SUM ${ZIG_DIST_NAME}.tar.xz" | sha256sum --check --status || {
	echo "SHA-256 sum verification failed for: ${ZIG_DIST_NAME}.tar.xz"
	exit 1
}

tar -xoJf "${ZIG_DIST_NAME}.tar.xz"
rm "${ZIG_DIST_NAME}.tar.xz"
ln -s -v "${ZIG_DIST_NAME}/zig" zig

echo -n 'zig version: ' $(zig version)

log='set -ex\n'
echo -e '#!/bin/bash\n'"$log"'exec zig ar "$@"' >zig-ar
echo -e '#!/bin/bash\n'"$log"'flag_to_filter='"$FLAG_FILTER"'\nexec zig cc -target $ZIG_TARGET $ZIG_PIC $ZIG_FLAGS $ZIG_CPPFLAGS $ZIG_CFLAGS ${@/$flag_to_filter}' >zig-cc
echo -e '#!/bin/bash\n'"$log"'exec zig c++ -target $ZIG_TARGET $ZIG_PIC $ZIG_FLAGS $ZIG_CPPFLAGS $ZIG_CXXFLAGS "$@"' >zig-cxx
echo -e '#!/bin/bash\n'"$log"'exec zig ranlib "$@"' >zig-ranlib
chmod +x zig-ar zig-cc zig-cxx zig-ranlib
