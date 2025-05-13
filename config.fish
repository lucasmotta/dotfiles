# ===============================
# PATH MANAGEMENT
# ===============================

# Python (pyenv)
set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths
pyenv init - fish | source

# System paths
set -g -x PATH /usr/local/bin $PATH

# React Native / Android paths
set -g -x ANDROID_HOME $HOME/Library/Android/sdk
set -g -x PATH $ANDROID_HOME/emulator $ANDROID_HOME/tools $ANDROID_HOME/tools/bin $ANDROID_HOME/platform-tools $PATH
set -g -x JAVA_HOME /opt/homebrew/opt/openjdk

# Fastlane
set -g -x PATH $HOME/.fastlane/bin $PATH

# Deno
set -g -x DENO_INSTALL $HOME/.deno
set -g -x PATH $DENO_INSTALL/bin $PATH

# PNPM
set -g -x PNPM_HOME "$HOME/Library/pnpm"
set -g -x PATH $PNPM_HOME $PATH

# Volta
set -g -x VOLTA_HOME "$HOME/.volta"
set -g -x PATH $VOLTA_HOME/bin $PATH

# Ruby
set fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths

# Bun
set -g -x BUN_INSTALL "$HOME/.bun"
set -g -x PATH $BUN_INSTALL/bin $PATH

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
set -Ux EDITOR vim

# ===============================
# SHELL CONFIGURATION
# ===============================

# Disable default fish greeting
set -g -x fish_greeting ''

# ===============================
# ALIASES
# ===============================

alias g="git"

# ===============================
# FUNCTIONS
# ===============================

# Twitch streaming alias
function twitch
  open -a "QuickTime Player" (streamlink --twitch-disable-ads --http-header "Authorization=OAuth vfvjwyh88a3ax80fhf7r4xe1p5qxdy" --stream-url "twitch.tv/$argv" best)
end

# YouTube streaming alias
function youtube
  streamlink "$argv" best
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
