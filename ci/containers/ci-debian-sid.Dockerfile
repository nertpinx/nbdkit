# THIS FILE WAS AUTO-GENERATED
#
#  $ lcitool dockerfile debian-sid nbdkit
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

ENV LANG "en_US.UTF-8"
ENV MAKE "/usr/bin/make"
