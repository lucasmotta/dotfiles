set -g -x PATH /usr/local/bin $PATH

set -g -x fish_greeting ''

set -g fish_color_autosuggestion 776E9A

set pure_symbol_prompt "↳ "
set pure_color_gray (set_color white)

set -Ux EDITOR vim

alias g="git"