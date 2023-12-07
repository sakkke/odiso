#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\[\e[1;32m\]\u@\h\[\e[m\] \[\e[1;34m\]\W\[\e[m\]]\$ '
