# THIS FILE WAS AUTO-GENERATED
#
#  $ lcitool dockerfile --cross mingw64 fedora-rawhide nbdkit
#
# https://gitlab.com/libvirt/libvirt-ci/-/commit/945dce80da3ebde4033bcf2bd4763ea472118fc9
FROM registry.fedoraproject.org/fedora:rawhide

RUN dnf install -y nosync && \
    echo -e '#!/bin/sh\n\
if test -d /usr/lib64\n\
then\n\
    export LD_PRELOAD=/usr/lib64/nosync/nosync.so\n\
else\n\
    export LD_PRELOAD=/usr/lib/nosync/nosync.so\n\
fi\n\
exec "$@"' > /usr/bin/nosync && \
    chmod +x /usr/bin/nosync && \
    nosync dnf update -y --nogpgcheck fedora-gpg-keys && \
    nosync dnf update -y && \
    nosync dnf install -y \
        autoconf \
        ca-certificates \
        git \
        glibc-langpack-en \
        libtool \
        make && \
    nosync dnf autoremove -y && \
    nosync dnf clean all -y && \
    rpm -qa | sort > /packages.txt

RUN nosync dnf install -y \
        mingw64-gcc && \
    nosync dnf clean all -y

ENV LANG "en_US.UTF-8"
ENV MAKE "/usr/bin/make"

ENV ABI "x86_64-w64-mingw32"
ENV CONFIGURE_OPTS "--host=x86_64-w64-mingw32"
