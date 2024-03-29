# nbdkit
# Copyright (C) 2019-2021 Red Hat Inc.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
# * Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
#
# * Redistributions in binary form must reproduce the above copyright
# notice, this list of conditions and the following disclaimer in the
# documentation and/or other materials provided with the distribution.
#
# * Neither the name of Red Hat nor the names of its contributors may be
# used to endorse or promote products derived from this software without
# specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY RED HAT AND CONTRIBUTORS ''AS IS'' AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
# PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL RED HAT OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF
# USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
# OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.

include $(top_srcdir)/common-rules.mk

EXTRA_DIST = \
	Cargo.toml \
	CHANGELOG.md \
	examples/ramdisk.rs \
	LICENSE \
	nbdkit-rust-plugin.pod \
	README.md \
	src/lib.rs \
	test.sh \
	tests/bare_bones.rs \
	tests/common/mod.rs \
	tests/full_featured.rs \
	$(NULL)

if HAVE_RUST

noinst_SCRIPTS = \
	target/release/libnbdkit.rlib \
	target/release/examples/libramdisk.so \
	$(NULL)

target/release/libnbdkit.rlib: Cargo.toml src/lib.rs
	cargo build --release

target/release/examples/libramdisk.so: Cargo.toml examples/ramdisk.rs
	cargo build --release --example ramdisk

distclean-local:
	cargo clean

TESTS = test.sh

if HAVE_POD

man_MANS = nbdkit-rust-plugin.3
CLEANFILES += $(man_MANS)

nbdkit-rust-plugin.3: nbdkit-rust-plugin.pod \
		$(top_builddir)/podwrapper.pl
	$(PODWRAPPER) --section=3 --man $@ \
	    --html $(top_builddir)/html/$@.html \
	    $<

endif HAVE_POD

endif
