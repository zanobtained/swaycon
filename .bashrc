#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
export PS1="\[\e[38;5;195m\]\u\[\e[38;5;8m\]@\[\e[38;5;74m\]\h\[\e[38;5;8m\](\W)\[\e[38;5;246m\]$\[\033[0m\] "
