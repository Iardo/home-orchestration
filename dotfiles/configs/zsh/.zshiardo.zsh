#!/bin/zsh
# ~/.zshiardo

# CONFIGS
ZSH_THEME="uaihu"

# ---------------------------------------------------------------------------- #
# HISTORY
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt SHARE_HISTORY
setopt appendhistory

# ---------------------------------------------------------------------------- #
# PLUGINS

# NAVI
# https://github.com/denisidoro/navi
# source <(navi widget zsh)

# ---------------------------------------------------------------------------- #
# INCLUDES
if [ -e ~/.profile ]; then source ~/.profile; fi
if [ -e ~/.zshnvm.zsh ]; then source ~/.zshnvm.zsh; fi
if [ -e ~/.zshdev.zsh ]; then source ~/.zshdev.zsh; fi
ACTUAL_DIR=$(pwd)

# ---------------------------------------------------------------------------- #
# ALIAS
alias clrhistory="rm -f ~/.zsh_history"
alias cfgreload="source ~/.zshrc"
alias cfgeditor="$EDITOR ~/.zshrc"

# ---------------------------------------------------------------------------- #
# OhMyPosh
eval "$(oh-my-posh init zsh --config ~/.ohmyposh.json)"
