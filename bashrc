# ~/.bashrc: executed by bash(1) for non-login shells.

#bash history
shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000
HISTCONTROL=ignoreboth
HISTTIMEFORMAT='%d/%m/%y %T | '

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# prompt settings
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/ '
}

if [ "$color_prompt" = yes ]; then
    # User
    # PS1='[\[\e[01;35m\]\t\[\e[00m\]][ ${debian_chroot:+($debian_chroot)}\[\e[01;32m\]\u#\[\e[00m\]\[\e[01;37m\]\h\[\e[00m\] \[\e[01;34m\]\w\[\e[00m\] ] \e[33m$(parse_git_branch)\e[00m \n$ '
    # Root
    PS1='[ ${debian_chroot:+($debian_chroot)}\[\e[01;31m\]\u#\[\e[00m\]\[\e[01;90m\]\h\[\e[00m\] \[\e[01;34m\]\w\[\e[00m\] ] \n$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\n$ '
fi

# Change the number of folders displayed in the path
PROMPT_DIRTRIM=2

# some python alias
alias python='python3'
alias createvenv='python3 -m venv'
alias run-venv='source .venv/bin/activate'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
    alias ip='ip --color=auto'
fi

set -o vi
