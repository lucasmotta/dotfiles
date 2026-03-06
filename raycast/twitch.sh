#!/bin/bash -l

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open twitch on quicktime
# @raycast.mode silent
#
# Optional parameters:
# @raycast.packageName Watch twitch
# @raycast.icon twitch.png
# @raycast.iconDark twitch.png
# @raycast.argument1 { "type": "text", "placeholder": "handle", "percentEncoded": true }

channel="${1:-}"
if [ -z "$channel" ]; then
  echo "Usage: twitch.sh <channel>" >&2
  exit 1
fi

streamlink_args=(--twitch-disable-ads --stream-url "twitch.tv/$channel" best)
if [ -n "${TWITCH_OAUTH_TOKEN:-}" ]; then
  streamlink_args=(--twitch-disable-ads --http-header "Authorization=OAuth ${TWITCH_OAUTH_TOKEN}" --stream-url "twitch.tv/$channel" best)
fi

stream_url="$(streamlink "${streamlink_args[@]}")"
open -a "QuickTime Player" "$stream_url"
