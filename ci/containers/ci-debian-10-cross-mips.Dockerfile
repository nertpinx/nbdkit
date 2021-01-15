# THIS FILE WAS AUTO-GENERATED
#
#  $ lcitool dockerfile --cross mips debian-10 nbdkit
#
# https://gitlab.com/libvirt/libvirt-ci/-/commit/945dce80da3ebde4033bcf2bd4763ea472118fc9
FROM docker.io/library/debian:10-slim

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y eatmydata && \
    eatmydata apt-get dist-upgrade -y && \
    eatmydata apt-get install --no-install-recommends -y \
            autoconf \
            ca-certificates \
            git \
            libtool-bin \
            locales \
            make && \
    eatmydata apt-get autoremove -y && \
    eatmydata apt-get autoclean -y && \
    sed -Ei 's,^# (en_US\.UTF-8 .*)$,\1,' /etc/locale.gen && \
    dpkg-reconfigure locales && \
    dpkg-query --showformat '${Package}_${Version}_${Architecture}\n' --show > /packages.txt

RUN export DEBIAN_FRONTEND=noninteractive && \
    dpkg --add-architecture mips && \
    eatmydata apt-get update && \
    eatmydata apt-get dist-upgrade -y && \
    eatmydata apt-get install --no-install-recommends -y dpkg-dev && \
    eatmydata apt-get install --no-install-recommends -y \
            gcc-mips-linux-gnu && \
    eatmydata apt-get autoremove -y && \
    eatmydata apt-get autoclean -y && \
    mkdir -p /usr/local/share/meson/cross && \
    echo "[binaries]\n\
c = '/usr/bin/mips-linux-gnu-gcc'\n\
ar = '/usr/bin/mips-linux-gnu-gcc-ar'\n\
strip = '/usr/bin/mips-linux-gnu-strip'\n\
pkgconfig = '/usr/bin/mips-linux-gnu-pkg-config'\n\
\n\
[host_machine]\n\
system = 'linux'\n\
cpu_family = 'mips'\n\
cpu = 'mips'\n\
endian = 'big'" > /usr/local/share/meson/cross/mips-linux-gnu

ENV LANG "en_US.UTF-8"
ENV MAKE "/usr/bin/make"

ENV ABI "mips-linux-gnu"
ENV CONFIGURE_OPTS "--host=mips-linux-gnu"
