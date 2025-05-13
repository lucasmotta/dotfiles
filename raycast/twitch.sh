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

open -a "QuickTime Player" $(streamlink --twitch-disable-ads --http-header "Authorization=OAuth vfvjwyh88a3ax80fhf7r4xe1p5qxdy" --stream-url "twitch.tv/$1" best)
