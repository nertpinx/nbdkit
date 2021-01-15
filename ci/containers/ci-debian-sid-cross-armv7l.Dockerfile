# THIS FILE WAS AUTO-GENERATED
#
#  $ lcitool dockerfile --cross armv7l debian-sid nbdkit
#
# https://gitlab.com/libvirt/libvirt-ci/-/commit/945dce80da3ebde4033bcf2bd4763ea472118fc9
FROM docker.io/library/debian:sid-slim

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
    dpkg --add-architecture armhf && \
    eatmydata apt-get update && \
    eatmydata apt-get dist-upgrade -y && \
    eatmydata apt-get install --no-install-recommends -y dpkg-dev && \
    eatmydata apt-get install --no-install-recommends -y \
            gcc-arm-linux-gnueabihf && \
    eatmydata apt-get autoremove -y && \
    eatmydata apt-get autoclean -y && \
    mkdir -p /usr/local/share/meson/cross && \
    echo "[binaries]\n\
c = '/usr/bin/arm-linux-gnueabihf-gcc'\n\
ar = '/usr/bin/arm-linux-gnueabihf-gcc-ar'\n\
strip = '/usr/bin/arm-linux-gnueabihf-strip'\n\
pkgconfig = '/usr/bin/arm-linux-gnueabihf-pkg-config'\n\
\n\
[host_machine]\n\
system = 'linux'\n\
cpu_family = 'arm'\n\
cpu = 'armhf'\n\
endian = 'little'" > /usr/local/share/meson/cross/arm-linux-gnueabihf

ENV LANG "en_US.UTF-8"
ENV MAKE "/usr/bin/make"

ENV ABI "arm-linux-gnueabihf"
ENV CONFIGURE_OPTS "--host=arm-linux-gnueabihf"
