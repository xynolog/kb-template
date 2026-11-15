#!/usr/bin/env bash
# Starts this knowledge base's stack inside the codespace. The launcher
# outside it waits for `xynolog status` here to report every service healthy.
set -euo pipefail

cd "$(dirname "$0")/.."
xynolog start --runtime docker
