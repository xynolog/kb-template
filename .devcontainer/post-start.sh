#!/usr/bin/env bash
# Starts this knowledge base's stack inside the codespace. The launcher
# outside it waits for `xynolog status` here to report every service healthy.
# A new codespace has no recorded config, so the hook names the one this
# knowledge base carries.
set -euo pipefail

cd "$(dirname "$0")/.."
xynolog start --runtime docker --config anthropic
