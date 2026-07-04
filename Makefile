build:
	chippy check all
	chippy combine

install: build
	install -m 755 out/dfn-mounter /usr/bin/dfn-mounter

uninstall:
	rm /usr/bin/dfn-mounter
