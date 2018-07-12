#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR=/bin/vim
export HISTFILESISZE=300000
export HISTCONTROL=ignoredups
export HISTSIZE=100000

shopt -s checkwinsize
shopt -s histappend

amixer -q set Master 100%
amixer -q set Headphone 100%
amixer -q set Speaker 100%

set -o vi
alias k=clear
export PS1='\n\u@\w\nReady\n'

alias ls='ls --color=none -F'
#PS1='[\u@\h \W]\$ '

#calendar

# turn off the damn blinking cursor
#echo -e '\033[?17;0;127c'
