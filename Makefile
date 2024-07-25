ci: clean lint test

clean:
	cd examples/static-redirect/ && \
	  make -f ../../src/Makefile-knut-haugland clean

lint:
	checkmake src/Makefile-knut-haugland

test:
	cd examples/static-redirect/ && \
	  make -f ../../src/Makefile-knut-haugland ci
	cd examples/static-content/ && \
	  make -f ../../src/Makefile-knut-haugland ci

release-major:
	rtk release --release-increment-type major

release-minor:
	rtk release --release-increment-type minor

release-patch:
	rtk release --release-increment-type patch

release: release-minor

.PHONY: ci clean lint test release-major release-minor release-patch release
