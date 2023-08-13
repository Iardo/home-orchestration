#!/bin/zsh
# ~/.zshiardo

# CONFIGS
COMPLETION_WAITING_DOTS="true"
DISABLE_AUTO_TITLE="true"
HYPHEN_INSENSITIVE="true"
# ENABLE_CORRECTION="true"
# ZSH_CUSTOM=/path/to/new-custom-folderter

# export ZSH=$HOME/.oh-my-zsh
export ZSH=$HOME/.zsh
export LANG=en_US.UTF-8
export TERM=xterm-256color

# ---------------------------------------------------------------------------- #
# PLUGINS

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
)
# source $ZSH/oh-my-zsh.sh
source $ZSH/zsh-autosuggestions/zsh-autosuggestions.zsh

# ---------------------------------------------------------------------------- #
# HOOKABLE CONFIGS

# Iardo's Configuration
if [ -e ~/.zshiardo.zsh ]; then source ~/.zshiardo.zsh; fi
