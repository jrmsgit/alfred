#!/usr/bin/env bash
set -eu
BUILDDIR=${GOPATH}/pkg/alfred/build
go clean -i -cache -testcache ./...
rm -vf coverage.out coverage.html \
	version_info.go
rm -vrf ${BUILDDIR} ${BUILDDIR}.*
exit 0
