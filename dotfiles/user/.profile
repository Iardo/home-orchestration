# ~/.profile

# PATH
# /usr/local/bin need to be before /usr/bin if you want to use the Homebrew version over the default system version.
export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.local/sbin"

# ---------------------------------------------------------------------------- #
# CONFIG
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# ---------------------------------------------------------------------------- #
# ALIAS
alias cls="clear"

alias l='ls -CF'
alias ll='ls -lahF'
alias la='ls -A'
alias ls='LC_COLLATE=C ls -lah --group-directories-first --color=auto'

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias gs='git status'
alias gp='git pull'
alias gph='git push'
alias gd='git diff | mate'
alias gau='git add --update'
alias gc='git commit -m'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcot='git checkout -t'
alias gcotb='git checkout --track -b'
alias glog='git log'
alias glogp='git log --pretty=format:"%h %s" --graph'
alias gfo='git fetch origin'

# https://hackernoon.com/handy-docker-aliases-4bd85089a3b8
alias dk='docker'
alias dkl='docker logs'
alias dklf='docker logs -f'
alias dkc="docker-compose"
alias dkf="docker-compose -f docker-compose.yml"
alias dki='docker images'
alias dks='docker service'
alias dkm='docker-machine'
alias dkmx='docker-machine ssh'
alias dkrm='docker rm'
alias dkflush='docker rm `docker ps --no-trunc -aq`'
alias dkflushforce='docker rmi $(docker images --filter "dangling=true" -q --no-trunc)'
alias dkt='docker stats --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.NetIO}}"'
alias dkps='docker ps --format "table {{.Names}}\t{{.Ports}}\t{{.Status}}"'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
