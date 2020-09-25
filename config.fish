set PATH /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# Setup React Native / Android paths
set -g -x ANDROID_HOME $HOME/Library/Android/sdk
set -g -x PATH $ANDROID_HOME/emulator $PATH
set -g -x PATH $ANDROID_HOME/tools $PATH
set -g -x PATH $ANDROID_HOME/tools/bin $PATH
set -g -x PATH $ANDROID_HOME/platform-tools $PATH
set -g -x JAVA_HOME /Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home

# Fastlane
set -g -x PATH $HOME/.fastlane/bin $PATH

# rbenv
source (rbenv init -|psub)

# Fish config
set -g -x fish_greeting ''
set -g fish_color_autosuggestion 7259a0
set SPACEFISH_CHAR_SYMBOL "↳"
set pure_symbol_prompt "↳ "
set pure_color_gray (set_color white)

set -Ux EDITOR vim

alias g="git"

status --is-interactive


# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish ]; and . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish ]; and . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.fish ]; and . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.fish

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/lucasmotta/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/lucasmotta/Downloads/google-cloud-sdk/path.fish.inc'; end
