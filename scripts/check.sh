#!/usr/bin/env bash

set -euo pipefail

SKIP_GITLEAKS=false
for arg in "$@"; do
  case "$arg" in
    --skip-gitleaks)
      SKIP_GITLEAKS=true
      ;;
    *)
      echo "Unknown argument: $arg" >&2
      echo "Usage: $0 [--skip-gitleaks]" >&2
      exit 1
      ;;
  esac
done

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

require_command() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "Missing required command: $1" >&2
    exit 1
  fi
}

require_command fish
require_command shellcheck
require_command shfmt
if [ "$SKIP_GITLEAKS" = false ]; then
  require_command gitleaks
fi

SHELL_FILES=(install.sh scripts/*.sh raycast/*.sh)

echo "== Bash syntax checks =="
for file in "${SHELL_FILES[@]}"; do
  bash -n "$file"
done

echo "== Fish syntax checks =="
fish --no-execute config.fish

echo "== shellcheck =="
shellcheck "${SHELL_FILES[@]}"

echo "== shfmt diff =="
shfmt --diff --indent 2 --case-indent "${SHELL_FILES[@]}"

if [ "$SKIP_GITLEAKS" = false ]; then
  echo "== gitleaks =="
  gitleaks git --redact --verbose
fi

echo "All checks passed."
