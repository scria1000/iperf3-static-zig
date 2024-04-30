# iperf3 static builds with Zig

This repo intends to provide static builds of iPerf3 for some platforms that were unsupported by the original [repo](https://github.com/userdocs/iperf3-static).

Static compilation with [Zig](https://ziglang.org/).

Binaries are available here: https://github.com/scria1000/iperf3-static-zig/releases/latest
  
### Supported platforms

| Architecture | Operating System |
| :---------:  | :--------------: |
|      mips    |       linux      |
|     mipsel   |       linux      |
|     mips64   |       linux      |
|    mips64el  |       linux      |
|    riscv64   |       linux      |

### Use the static binaries from this repo

Download and install to the bin directory of your local user (for root this may not be in the `$PATH`)

Pick the platform URL you need:

mips

```bash
mkdir -p ~/bin && source ~/.profile
wget -qO ~/bin/iperf3 https://github.com/scria1000/iperf3-static-zig/releases/latest/download/iperf3-mips-linux-musl
chmod 700 ~/bin/iperf3
```

mips build with openssl

```bash
mkdir -p ~/bin && source ~/.profile
wget -qO ~/bin/iperf3 https://github.com/scria1000/iperf3-static-zig/releases/latest/download/iperf3-mips-linux-musl_openssl
chmod 700 ~/bin/iperf3
```

mips little endian

```bash
mkdir -p ~/bin && source ~/.profile
wget -qO ~/bin/iperf3 https://github.com/scria1000/iperf3-static-zig/releases/latest/download/iperf3-mipsel-linux-musl
chmod 700 ~/bin/iperf3
```

mips little endian build with openssl

```bash
mkdir -p ~/bin && source ~/.profile
wget -qO ~/bin/iperf3 https://github.com/scria1000/iperf3-static-zig/releases/latest/download/iperf3-mipsel-linux-musl_openssl
chmod 700 ~/bin/iperf3
```

mips64

```bash
mkdir -p ~/bin && source ~/.profile
wget -qO ~/bin/iperf3 https://github.com/scria1000/iperf3-static-zig/releases/latest/download/iperf3-mips64-linux-musl
chmod 700 ~/bin/iperf3
```

mips64 build with openssl

```bash
mkdir -p ~/bin && source ~/.profile
wget -qO ~/bin/iperf3 https://github.com/scria1000/iperf3-static-zig/releases/latest/download/iperf3-mips64-linux-musl_openssl
chmod 700 ~/bin/iperf3
```

mips64 little endian

```bash
mkdir -p ~/bin && source ~/.profile
wget -qO ~/bin/iperf3 https://github.com/scria1000/iperf3-static-zig/releases/latest/download/iperf3-mips64el-linux-musl
chmod 700 ~/bin/iperf3
```

mips64 little endian build with openssl

```bash
mkdir -p ~/bin && source ~/.profile
wget -qO ~/bin/iperf3 https://github.com/scria1000/iperf3-static-zig/releases/latest/download/iperf3-mips64el-linux-musl_openssl
chmod 700 ~/bin/iperf3
```

riscv64

```bash
mkdir -p ~/bin && source ~/.profile
wget -qO ~/bin/iperf3 https://github.com/scria1000/iperf3-static-zig/releases/latest/download/iperf3-riscv64-linux-musl
chmod 700 ~/bin/iperf3
```

riscv64 build with openssl

```bash
mkdir -p ~/bin && source ~/.profile
wget -qO ~/bin/iperf3 https://github.com/scria1000/iperf3-static-zig/releases/latest/download/iperf3-riscv64-linux-musl_openssl
chmod 700 ~/bin/iperf3
```
