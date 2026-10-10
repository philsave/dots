#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# don't put duplicate lines or lines starting with space in the history.
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000
HISTTIMEFORMAT="%F %T "

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# useful aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias egrep='grep -E --color=auto'
alias fgrep='grep -F --color=auto'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gd='git diff'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias c='clear'
alias h='history'
alias v='vim'
alias tree='tree --dirsfirst -F'
alias mkdir='mkdir -pv'
alias cp='cp -iv'
alias rm='rm -I'
alias mv='mv -iv'
alias docs='cd ~/Documents'
alias dl='cd ~/Downloads'
alias untar='tar -xzvf'
alias py='python3'
alias neofetch='fastfetch --config neofetch.jsonc'
alias music-dl='yt-dlp -x -f bestaudio[ext=m4a] --add-metadata --embed-thumbnail' # Install atomicparsley

alias pacman-clean-cache='paccache -r' # Install pacman-contrib
alias pacman-orphans='sudo pacman -Qtdq'
alias pacman-remove-orphans='sudo pacman -Rns $(pacman -Qtdq)'
alias pacman-mirror-update='sudo reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'

function find_largest_files() {
    du -h -x -s -- * | sort -r -h | head -20;
}

function extract() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# colorize Manpages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

. /usr/share/git/completion/git-prompt.sh
PS1='[\[\e[32;1m\]\u@\h\[\e[0m\] \[\e[35;1m\]\W\[\e[0m\]\[\e[33;1m\]$(__git_ps1 " (%s)")\[\e[0m\]]> '
