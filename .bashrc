#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Add ~/bin and ~/.local/bin to PATH
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# Use (Neo)vim as default editor and manpager
if command -v nvim >/dev/null 2>&1; then
    export EDITOR="nvim"
    export VISUAL="$EDITOR"
    export MANPAGER="nvim +Man!"
    alias vim='nvim'
    alias vi='nvim'
elif command -v vim >/dev/null 2>&1; then
    export EDITOR="vim"
    export VISUAL="$EDITOR"
    alias vi='vim'
fi

# Enable vi style keybindings
set -o vi

# don't put duplicate lines or lines starting with space in the history.
export HISTCONTROL=erasedups:ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

HISTSIZE=2000
HISTFILESIZE=2000
HISTTIMEFORMAT="%F %T " # add timestamp

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# case-insensitive auto-completion
bind 'set completion-ignore-case on'

# Use extended pattern matching
shopt -s extglob

# Enter a directory by just typing its name
shopt -s autocd

# Useful aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'

alias tree='tree --dirsfirst -F'
alias mkdir='mkdir -pv'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -I --preserve-root'

alias c='clear'
alias h='history'
alias untar='tar -xzvf'
alias py='python3'
alias youtube-dl='yt-dlp'
alias music-dl='yt-dlp -x -f bestaudio[ext=m4a] --add-metadata --embed-thumbnail' # Install atomicparsley

alias pacman-clean-cache='paccache -r' # Install pacman-contrib
alias pacman-orphans='sudo pacman -Qtdq'
alias pacman-remove-orphans='sudo pacman -Rns $(pacman -Qtdq)'
alias pacman-mirror-update='sudo reflector --country Germany --latest 10 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'

function compress_pdf() {
    ghostscript -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/prepress \
    -dNOPAUSE -dQUIET -dBATCH -sOutputFile="${2:-compressed_$1}" "$1"
}

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

# cd and ls in one
function cl() {
	local dir="$1"
	local dir="${dir:=$HOME}"
	if [[ -d "$dir" ]]; then
		cd "$dir" >/dev/null; ls
	else
		echo "bash: cl: $dir: Directory not found"
	fi
}

# Create a directory and navigate to it
mkcd() {
    mkdir -p "$1" && cd "$1"
}

function ipif() {
    if grep -P "(([1-9]\d{0,2})\.){3}(?2)" <<< "$1"; then
	 curl ipinfo.io/"$1"
    else
	ipawk=($(host "$1" | awk '/address/ { print $NF }'))
	curl ipinfo.io/${ipawk[1]}
    fi
    echo
}

# Colorize manpages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# Add git branch information to prompt
. /usr/share/git/completion/git-prompt.sh
PS1='[\[\e[32;1m\]\u@\h\[\e[0m\] \[\e[34;1m\]\W\[\e[0m\]\[\e[31;1m\]$(__git_ps1 " (%s)")\[\e[0m\]]\$ '     # Colour
#PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '                                                                   # No colour
