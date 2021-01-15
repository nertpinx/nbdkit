# THIS FILE WAS AUTO-GENERATED
#
#  $ lcitool dockerfile centos-stream nbdkit
#
# https://gitlab.com/libvirt/libvirt-ci/-/commit/945dce80da3ebde4033bcf2bd4763ea472118fc9
FROM docker.io/library/centos:8

RUN dnf update -y && \
    dnf install -y centos-release-stream && \
    dnf install 'dnf-command(config-manager)' -y && \
    dnf config-manager --set-enabled -y Stream-PowerTools && \
    dnf install -y centos-release-advanced-virtualization && \
    dnf install -y epel-release && \
    dnf install -y \
        autoconf \
        ca-certificates \
        git \
        glibc-langpack-en \
        libtool \
        make && \
    dnf autoremove -y && \
    dnf clean all -y && \
    rpm -qa | sort > /packages.txt

ENV LANG "en_US.UTF-8"
ENV MAKE "/usr/bin/make"
