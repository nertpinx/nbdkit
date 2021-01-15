# THIS FILE WAS AUTO-GENERATED
#
#  $ lcitool dockerfile centos-7 nbdkit
#
# https://gitlab.com/libvirt/libvirt-ci/-/commit/945dce80da3ebde4033bcf2bd4763ea472118fc9
FROM docker.io/library/centos:7

RUN yum update -y && \
    echo 'skip_missing_names_on_install=0' >> /etc/yum.conf && \
    yum install -y epel-release && \
    yum install -y \
        autoconf \
        ca-certificates \
        git \
        glibc-common \
        libtool \
        make && \
    yum autoremove -y && \
    yum clean all -y && \
    rpm -qa | sort > /packages.txt

ENV LANG "en_US.UTF-8"
ENV MAKE "/usr/bin/make"
