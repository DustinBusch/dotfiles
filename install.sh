#!/bin/bash

# Set default values for XDG_CONFIG_HOME and XDG_DATA_HOME if not set
: "${XDG_CONFIG_HOME:=$HOME/.config}"
: "${XDG_DATA_HOME:=$HOME/.local/share}"

# Check if DOTFILES is set
if [ -z "$DOTFILES" ]; then
    echo "DOTFILES environment variable is not set."
    exit 1
fi

if [ -z "$DOTFILES" ]; then
    echo "DOTFILES environment variable is not set. Please set it to the path of your dotfiles repository."
    exit 1
fi


########
# nvim #
########

mkdir -p "$XDG_CONFIG_HOME/nvim"
mkdir -p "$XDG_CONFIG_HOME/nvim/undo"

ln -sf "$DOTFILES/nvim/init.vim" "$XDG_CONFIG_HOME/nvim"
ln -sf "$DOTFILES/nvim/init.lua" "$XDG_CONFIG_HOME/nvim"
ln -sf "$DOTFILES/nvim/lua/" "$XDG_CONFIG_HOME/nvim"
ln -sf "$DOTFILES/lazy-lock.json" "$XDG_CONFIG_HOME/nvim"


rm -rf "$XDG_CONFIG_HOME/X11"
ln -s "$DOTFILES/X11" "$XDG_CONFIG_HOME"

######
# i3 #
######

rm -rf "$XDG_CONFIG_HOME/i3"
ln -s "$DOTFILES/i3" "$XDG_CONFIG_HOME"

#######
# Zsh #
#######

mkdir -p "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/.zshenv" "$HOME"
ln -sf "$DOTFILES/zsh/.zshrc" "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/aliases" "$XDG_CONFIG_HOME/zsh/aliases"
rm -rf "$XDG_CONFIG_HOME/zsh/external"
ln -sf "$DOTFILES/zsh/external" "$XDG_CONFIG_HOME/zsh"

#########
# Fonts #
#########

mkdir -p "$XDG_DATA_HOME"
cp -rf "$DOTFILES/fonts/" "$XDG_DATA_HOME"

#########
# dunst #
#########

mkdir -p "$XDG_CONFIG_HOME/dunst"
ln -sf "$DOTFILES/dunst/dunstrc" "$XDG_CONFIG_HOME/dunst/dunstrc"

########
# tmux #
########
mkdir -p "$XDG_CONFIG_HOME/tmux"
ln -sf "$DOTFILES/tmux/tmux.conf" "$XDG_CONFIG_HOME/tmux/tmux.conf"

[ ! -d "$XDG_CONFIG_HOME/tmux/plugins/tpm" ] \
	&& git clone https://github.com/tmux-plugins/tpm \
	"$XDG_CONFIG_HOME/tmux/plugins/tpm"
