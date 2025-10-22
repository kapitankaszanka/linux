# ~/.bashrc — interactive shells only
case $- in *i*) ;; *) return ;; esac

### --- History: smarter, timestamped, shared across shells ---
HISTCONTROL=ignoreboth:erasedups
HISTSIZE=1000
HISTFILESIZE=5000
HISTTIMEFORMAT='%F %T | '
shopt -s histappend cmdhist lithist histreedit histverify

### --- Terminal niceties ---
shopt -s checkwinsize autocd
# Recursive globbing with ** — uncomment if you like it
# shopt -s globstar

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
export TIME_STYLE=long-iso
export PAGER=less
export EDITOR=vim      # change if you prefer nano, micro, etc.

### --- Colors & commands ---
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi
alias ls='ls --color=auto'
alias ll='ls -la'
alias lla='ls -lah'
alias grep='grep --color=auto'
alias ip='ip --color=auto'

### --- Some alias helpers ---
alias ..='cd ..'
alias ...='cd ../..'

### --- Python helpers ---
alias python='python3'
alias createvenv='python3 -m venv'
alias run-venv='[ -d .venv ] && . .venv/bin/activate || echo ".venv not found"'

### --- Desktop alert for long jobs ---
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" \
"$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

### --- Prompt setup ---
__git_branch() {
  local b
  b=$(git rev-parse --abbrev-ref HEAD 2>/dev/null) || return
  printf ' (%s)' "$b"
}

case "$TERM" in xterm-color|*-256color) color_prompt=yes ;; esac

if [ "$color_prompt" = yes ] && tput setaf 1 >/dev/null 2>&1; then
    if [ "$EUID" -eq 0 ]; then
        # Root → username in red, # prompt
        PS1='[\[\e[01;35m\]\t\[\e[00m\]][ ${debian_chroot:+($debian_chroot)}\[\e[01;31m\]\u#\[\e[00m\]\[\e[01;90m\]\h\[\e[00m\] \[\e[01;34m\]\w\[\e[00m\] ] \[\e[33m\]$(__git_branch)\[\e[00m\]\n# '
    else
        # Normal user → username in green, $ prompt
        PS1='[\[\e[01;35m\]\t\[\e[00m\]][ ${debian_chroot:+($debian_chroot)}\[\e[01;32m\]\u#\[\e[00m\]\[\e[01;90m\]\h\[\e[00m\] \[\e[01;34m\]\w\[\e[00m\] ] \[\e[33m\]$(__git_branch)\[\e[00m\]\n$ '
    fi
else
  if [ "$EUID" -eq 0 ]; then
    PS1='[\u@\h \w]$(__git_branch) # '
  else
    PS1='[\u@\h \w]$(__git_branch) $ '
  fi
fi

PROMPT_DIRTRIM=2
unset color_prompt

# xterm/rxvt window title
case "$TERM" in
  xterm*|rxvt*) PS1="\[\e]0;\u@\h: \w\a\]$PS1" ;;
esac

### --- Bash completion ---
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

### --- Modes & local overrides ---
set -o vi
[ -f ~/.bashrc.local ] && . ~/.bashrc.local
