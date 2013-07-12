VERSION=0.9

PROJECTNAME=mga-treasurer
BINFILES=mktreasurer
CFGFILES=mga-treasurer.conf
TMPLFILES=tmpl/*.html tmpl/*.rss tmpl/*.json
STATICFILES=static/*

sysconfdir=/etc
bindir=/usr/bin
sharedir=/usr/share
projectdir=$(sharedir)/$(PROJECTNAME)
tmpldir=$(projectdir)/tmpl
staticdir=$(projectdir)/static

all:

install:
	install -d $(DESTDIR)$(projectdir) $(DESTDIR)$(tmpldir) \
	    $(DESTDIR)$(bindir) $(DESTDIR)$(sysconfdir) \
	    $(DESTDIR)$(staticdir)
	install -m 755 $(BINFILES) $(DESTDIR)$(bindir)
	install -m 644 $(CFGFILES) $(DESTDIR)$(sysconfdir)
	install -m 644 $(TMPLFILES) $(DESTDIR)$(tmpldir)
	install -m 644 $(STATICFILES) $(DESTDIR)$(staticdir)
	install -m 644 config_default $(DESTDIR)$(projectdir)/config

tar:
	git archive --format=tar --prefix $(PROJECTNAME)-$(VERSION)/ HEAD | \
	    xz > $(PROJECTNAME)-$(VERSION).tar.xz
