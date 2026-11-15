#!/usr/bin/env bash
# Installs the xynolog launcher from xynolog/cli's newest release, checked
# against the release's checksums and its build provenance.
set -euo pipefail

case "$(uname -m)" in
  x86_64) arch=amd64 ;;
  aarch64 | arm64) arch=arm64 ;;
  *) echo "xynolog/cli publishes no Linux build for $(uname -m)" >&2; exit 1 ;;
esac

download=/tmp/xynolog-release
mkdir -p "$download"
gh release download --repo xynolog/cli --dir "$download" --clobber \
  --pattern "xynolog_*_linux_${arch}.tar.gz" --pattern checksums.txt
cd "$download"
sha256sum --check --ignore-missing checksums.txt
archive="$(ls xynolog_*_linux_"${arch}".tar.gz)"
gh attestation verify --repo xynolog/cli "$archive"
tar -xzf "$archive" xynolog
sudo install -m 0755 xynolog /usr/local/bin/xynolog
xynolog --version
