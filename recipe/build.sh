#!/usr/bin/env bash

set -o xtrace -o nounset -o pipefail -o errexit

go build -buildmode=pie -trimpath -o=${PREFIX}/bin/gosh -ldflags="-s -w -X main.version=v${PKG_VERSION}" ./cmd/gosh
go build -buildmode=pie -trimpath -o=${PREFIX}/bin/shfmt -ldflags="-s -w -X main.version=v${PKG_VERSION}" ./cmd/shfmt
go-licenses save ./cmd/gosh --save_path=license-files_gosh
go-licenses save ./cmd/shfmt --save_path=license-files_shfmt
