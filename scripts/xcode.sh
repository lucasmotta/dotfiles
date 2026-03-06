#!/usr/bin/env bash

set -euo pipefail

############################################
echo "Xcode CLI Tools"
############################################

if xcode-select -p >/dev/null 2>&1; then
  echo "Xcode CLI Tools already installed"
else
  xcode-select --install || true
fi
