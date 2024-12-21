#bash history
HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoreboth

# User
PS1='[ ${debian_chroot:+($debian_chroot)}\[\e[01;32m\]\u#\[\e[00m\]\[\e[01;90m\]\h\[\e[00m\] \[\e[01;34m\]\w\[\e[00m\] ] \n$ '
# Root
PS1='[ ${debian_chroot:+($debian_chroot)}\[\e[01;31m\]\u#\[\e[00m\]\[\e[01;90m\]\h\[\e[00m\] \[\e[01;34m\]\w\[\e[00m\] ] \n$ '
PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\n$ '

# some alias
alias ll='ls -l'
alias lla='ls -la'
alias lsa='ls -a'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias c='clear'
alias python='python3'
alias createvenv='python3 -m venv'
