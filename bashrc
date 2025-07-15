#bash history
HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoreboth
HISTTIMEFORMAT='%d/%m/%y %T | '

parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/ '
}

if [ "$color_prompt" = yes ]; then
    # User
    PS1='[\[\e[01;35m\]\t\[\e[00m\]][ ${debian_chroot:+($debian_chroot)}\[\e[01;32m\]\u#\[\e[00m\]\[\e[01;37m\]\h\[\e[00m\] \[\e[01;34m\]\w\[\e[00m\] ] \e[33m$(parse_git_branch)\e[00m \n$ '
    # Root
    # PS1='[ ${debian_chroot:+($debian_chroot)}\[\e[01;31m\]\u#\[\e[00m\]\[\e[01;90m\]\h\[\e[00m\] \[\e[01;34m\]\w\[\e[00m\] ] \n$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\n$ '
fi

# Change the number of folders displayed in the path
PROMPT_DIRTRIM=2

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
