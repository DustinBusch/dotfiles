source "$XDG_CONFIG_HOME/zsh/aliases"
autoload -Uz compinit; compinit

# Autocomplete hidden files
_comp_options+=(globdots)
source ~/dotfiles/zsh/external/completion.zsh
fpath=($ZDOTDIR/external $fpath)
autoload -Uz prompt_purification_setup; prompt_purification_setup

# Push the current directory visited on to the stack.
setopt AUTO_PUSHD
# Do not store duplicate directories in the stack.
setopt PUSHD_IGNORE_DUPS
# Do not print the directory stack after using pushd or popd.
setopt PUSHD_SILENT

# enable vim mode
bindkey -v
export KEYTIMEOUT=1

# changing cursor vim modes
autoload -Uz cursor_mode && cursor_mode
zmodload zsh/complist
bindkey -M menuselect "h" vi-backward-char
bindkey -M menuselect "k" vi-up-line-or-history
bindkey -M menuselect "l" vi-forward-char
bindkey -M menuselect "j" vi-down-line-or-hisoryy
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh