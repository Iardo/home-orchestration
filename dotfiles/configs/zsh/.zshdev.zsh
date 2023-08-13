#!/bin/zsh
# ~/.zshdev

# PATH
export PATH=$PATH:$HOME/Scripts/iardo/
export PATH=$PATH:$HOME/Scripts/third-party/
export S_BIN_PATH=$HOME/Scripts/iardo/
# export MANPATH=$MANPATH:/usr/local/man

# ---------------------------------------------------------------------------- #
# CONFIG

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ---------------------------------------------------------------------------- #
# ALIAS
alias uuid='uuidgen | tr "[:upper:]" "[:lower:]"'

alias npml='npm list -g --depth=0'
alias phpm='php -m'
alias pipl='pip freeze'
alias rubl='gem query --local'

# ---------------------------------------------------------------------------- #
# Golang
export GOPATH=$HOME/.go

# ---------------------------------------------------------------------------- #
# PHP
export COMPOSER_MEMORY_LIMIT=-1

# ---------------------------------------------------------------------------- #
# Python

# ensure brew to use the correct versions of python.
alias python=/usr/local/bin/python3
alias pip=/usr/local/bin/pip3
