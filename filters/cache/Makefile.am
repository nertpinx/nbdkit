# nbdkit
# Copyright (C) 2018-2021 Red Hat Inc.
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

EXTRA_DIST = nbdkit-cache-filter.pod

# Requires hole-punching and other OS specific features which make
# this an effort to port to Windows.
if !IS_WINDOWS

filter_LTLIBRARIES = nbdkit-cache-filter.la

nbdkit_cache_filter_la_SOURCES = \
	blk.c \
	blk.h \
	cache.c \
	cache.h \
	lru.c \
	lru.h \
	reclaim.c \
	reclaim.h \
	$(top_srcdir)/include/nbdkit-filter.h \
	$(NULL)

nbdkit_cache_filter_la_CPPFLAGS = \
	-I$(top_srcdir)/include \
	-I$(top_srcdir)/common/bitmap \
	-I$(top_srcdir)/common/include \
	-I$(top_srcdir)/common/utils \
	$(NULL)
nbdkit_cache_filter_la_CFLAGS = $(WARNINGS_CFLAGS)
nbdkit_cache_filter_la_LDFLAGS = \
	-module -avoid-version -shared $(NO_UNDEFINED_ON_WINDOWS) \
	-Wl,--version-script=$(top_srcdir)/filters/filters.syms \
	$(NULL)
nbdkit_cache_filter_la_LIBADD = \
	$(top_builddir)/common/bitmap/libbitmap.la \
	$(top_builddir)/common/utils/libutils.la \
	$(IMPORT_LIBRARY_ON_WINDOWS) \
	$(NULL)

if HAVE_POD

man_MANS = nbdkit-cache-filter.1
CLEANFILES += $(man_MANS)

nbdkit-cache-filter.1: nbdkit-cache-filter.pod \
		$(top_builddir)/podwrapper.pl
	$(PODWRAPPER) --section=1 --man $@ \
	    --html $(top_builddir)/html/$@.html \
	    $<

endif HAVE_POD
endif !IS_WINDOWS
