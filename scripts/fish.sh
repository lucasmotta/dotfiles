#!/usr/bin/env bash

############################################
title "Fish Shell"
############################################

# add fish to the list of acceptable shells (if not already present)
grep -q /usr/local/bin/fish /etc/shells
if [ $? -ne 0 ]; then
	echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
fi

# change current shell to fish
chsh -s /usr/local/bin/fish

# install fisherman
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# install fisherman plugins
fisher install pure-fish/pure

