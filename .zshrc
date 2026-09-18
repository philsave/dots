#
# ~/.zshrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# History in cache directory
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/history
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS

# Tab autocompletion
autoload -Uz compinit 
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION
_comp_options+=(globdots) # Include dotfiles
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion*' menu select

# Vi mode
bindkey -v

# Disable annoying beeping
unsetopt beep

# Change directory given just path 
setopt autocd

# Use additional pattern matching features
setopt extendedglob

# Enable colors
autoload -U colors && colors

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats " %F{008}(%b)%f"

# Custom prompt
setopt PROMPT_SUBST
PS1="%B%F{blue}%n%f%b@%M %B%~%b\${vcs_info_msg_0_} %# "

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'

alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -I'
alias c='clear'
alias h='history'
alias v='vim'
alias untar='tar -zxvf'
alias docs='cd ~/Documents'
alias dl='cd ~/Downloads'
alias zconfig='vim ~/.zshrc'
alias zreload='source ~/.zshrc'
alias pacman-orphans='sudo pacman -Qtdq'
alias pacman-remove-orphans='sudo pacman -Rns $(pacman -Qtdq)'
alias pacman-mirror-update='sudo reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'

# Load Plugins
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
