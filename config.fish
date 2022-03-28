set -g -x PATH /usr/local/bin $PATH

# Setup React Native / Android paths
set -g -x ANDROID_HOME $HOME/Library/Android/sdk
set -g -x PATH $ANDROID_HOME/emulator $PATH
set -g -x PATH $ANDROID_HOME/tools $PATH
set -g -x PATH $ANDROID_HOME/tools/bin $PATH
set -g -x PATH $ANDROID_HOME/platform-tools $PATH
set -g -x JAVA_HOME /Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home

# Fastlane
set -g -x PATH $HOME/.fastlane/bin $PATH

# Postgres
set -gx NO_VENDORED_POSTGRES true

# Volta
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# Ruby
set fish_user_paths "/usr/local/opt/ruby/bin" $fish_user_paths

# Fish config
set -g -x fish_greeting ''

# Aliases
alias g="git"

# Generic
set -Ux EDITOR vim
status --is-interactive

# Twitch alias
function twitch
  streamlink "twitch.tv/$argv" best --player /usr/bin/open --player-args "-W -n -a 'Quicktime Player' {filename}" --player-passthrough hls --twitch-disable-ads
end
function youtube
  streamlink "$argv" best --player /usr/bin/open --player-args "-W -n -a 'Quicktime Player' {filename}" --player-passthrough hls
end
