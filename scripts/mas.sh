#!/usr/bin/env bash

set -euo pipefail

XCODE_APP_PATH="/Applications/Xcode.app"
XCODEBUILD_BIN="$XCODE_APP_PATH/Contents/Developer/usr/bin/xcodebuild"

############################################
echo "App Store"
############################################

install_app_store_app() {
  local app_id="$1"
  local app_name="$2"

  if ! mas install "$app_id"; then
    echo "Skipping $app_name: mas install failed (likely not signed in to the App Store)"
  fi
}

initialize_xcode() {
  if [ ! -x "$XCODEBUILD_BIN" ]; then
    return 0
  fi

  if "$XCODEBUILD_BIN" -checkFirstLaunchStatus >/dev/null 2>&1; then
    echo "Xcode first launch already complete"
    return 0
  fi

  echo "Initializing Xcode first launch tasks"
  if sudo "$XCODEBUILD_BIN" -runFirstLaunch; then
    echo "Xcode first launch complete"
  else
    echo "Warning: Xcode first launch did not complete"
    echo "Run this later to finish setup: sudo \"$XCODEBUILD_BIN\" -runFirstLaunch"
  fi
}

if ! command -v mas >/dev/null 2>&1; then
  echo "Skipping App Store apps: mas is not installed"
  exit 0
fi

install_app_store_app 937984704 "Amphetamine"
install_app_store_app 1287239339 "ColorSlurp"
install_app_store_app 310633997 "WhatsApp"
install_app_store_app 497799835 "Xcode"
initialize_xcode
