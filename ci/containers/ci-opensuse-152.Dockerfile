# THIS FILE WAS AUTO-GENERATED
#
#  $ lcitool dockerfile opensuse-152 nbdkit
#
# https://gitlab.com/libvirt/libvirt-ci/-/commit/945dce80da3ebde4033bcf2bd4763ea472118fc9
FROM registry.opensuse.org/opensuse/leap:15.2

RUN zypper update -y && \
    zypper install -y \
           autoconf \
           ca-certificates \
           git \
           glibc-locale \
           libtool \
           make && \
    zypper clean --all && \
    rpm -qa | sort > /packages.txt

ENV LANG "en_US.UTF-8"
ENV MAKE "/usr/bin/make"
