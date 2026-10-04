#
# ~/.bash_aliases
#

alias ls='ls --color=auto'
alias grep='grep --color=auto'

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
alias music-dl='yt-dlp -x -f bestaudio[ext=m4a] --add-metadata --embed-thumbnail' # Install atomicparsley

alias pacman-orphans='sudo pacman -Qtdq'
alias pacman-remove-orphans='sudo pacman -Rns $(pacman -Qtdq)'
alias pacman-mirror-update='sudo reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist'
