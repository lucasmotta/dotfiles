# ===============================
# PATH MANAGEMENT
# ===============================

# Volta
set -gx VOLTA_HOME "$HOME/.volta"
set -gx VOLTA_FEATURE_NODE_INSTALL true

# Python (pyenv)
set -gx PYENV_ROOT $HOME/.pyenv

# User paths
fish_add_path /opt/homebrew/bin
fish_add_path /usr/local/opt/ruby/bin
fish_add_path $PYENV_ROOT/bin

# System path
fish_add_path /usr/local/bin

# React Native / Android paths
set -g -x ANDROID_HOME $HOME/Library/Android/sdk
fish_add_path $ANDROID_HOME/emulator
fish_add_path $ANDROID_HOME/tools
fish_add_path $ANDROID_HOME/tools/bin
fish_add_path $ANDROID_HOME/platform-tools
set -g -x JAVA_HOME /opt/homebrew/opt/openjdk

# Fastlane
fish_add_path $HOME/.fastlane/bin

# Deno
set -g -x DENO_INSTALL $HOME/.deno
fish_add_path $DENO_INSTALL/bin

# PNPM
set -g -x PNPM_HOME "$HOME/Library/pnpm"
fish_add_path $PNPM_HOME

# Bun
set -g -x BUN_INSTALL "$HOME/.bun"
fish_add_path $BUN_INSTALL/bin

# Volta (must come last to win over pnpm/bun node shims)
fish_add_path --move --prepend $VOLTA_HOME/bin

# pyenv init (after pyenv is on PATH)
pyenv init - fish | source

# WorkOS
set -gx NODE_EXTRA_CA_CERTS /usr/local/share/ca-certificates/workos/workos-local-ca.crt


# ===============================
# ENVIRONMENT VARIABLES
# ===============================

# Postgres
set -g -x NO_VENDORED_POSTGRES true

# Slack
set -g -x SLACK_DEVELOPER_MENU true

# Editor
set -gx EDITOR "zed --wait"

# Node.js
set -g -x NODE_OPTIONS "--max-old-space-size=4096"

# ===============================
# SHELL CONFIGURATION
# ===============================

# Disable default fish greeting
set -g -x fish_greeting ''

# ===============================
# ALIASES
# ===============================

alias g="git"
alias jsonpretty="prettyjson"

# ===============================
# FUNCTIONS
# ===============================

# Twitch streaming alias
function twitch
  if test (count $argv) -lt 1
    echo "Usage: twitch <channel>" >&2
    return 1
  end

  set -l channel $argv[1]
  set -l streamlink_args --twitch-disable-ads --stream-url "twitch.tv/$channel" best

  if set -q TWITCH_OAUTH_TOKEN; and test -n "$TWITCH_OAUTH_TOKEN"
    set streamlink_args --twitch-disable-ads --http-header "Authorization=OAuth $TWITCH_OAUTH_TOKEN" --stream-url "twitch.tv/$channel" best
  end

  set -l stream_url (streamlink $streamlink_args)
  open -a "QuickTime Player" $stream_url
end

# YouTube streaming alias
function youtube
  streamlink "$argv" best
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

alias claude="/Users/lucasmotta/.claude/local/claude"

# Added by Antigravity
fish_add_path /Users/lucasmotta/.antigravity/antigravity/bin
