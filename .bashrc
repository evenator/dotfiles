# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

#Fancy prompt for git repos
BLUE="\[\033[1;34m\]"
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
DEFCOLOR="\[\033[0m\]"

force_color_prompt=yes

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: $(echo $PWD | sed "s:^$HOME:~:")\007"'
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -halF'
alias la='ls -A'
alias l='ls -CF'

alias quit='exit'
alias less='less -R'

if [ -n `which caja` ]; then
  open_browser(){
    if [ $# -lt 1 ]; then
      caja . 1>/dev/null 2>/dev/null &
    else
      caja "$1" 1>/dev/null 2>/dev/null &
    fi
  }
else
  open_browser(){
    if [ $# -lt 1 ]; then
      nautilus . 1>/dev/null 2>/dev/null &
    else
      nautilus "$1" 1>/dev/null 2>/dev/null &
    fi
  }
fi
export -f open_browser
alias open='open_browser'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

EDITOR=vim
GIT_EDITOR=$EDITOR

export GIT_PS1_SHOWDIRTYSTATE=1
export PS1="$PS1$YELLOW\$(__git_ps1)$DEFCOLOR \$ "

#ROS Workspace
export ROSLAUNCH_SSH_UNKNOWN=1
export ROS_IP=$(ip addr show eth0 | grep -e "[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*" -o | head -n1)
if [ -z "$ROS_IP" ]
then
    export ROS_IP=$(ip addr show wlan0 | grep -e "[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*" -o | head -n1)
fi
export ROS_MASTER_URI="http://$ROS_IP:11311"

export PATH="$HOME/scripts:$HOME/.cabal/bin:$PATH"

#For Gitlab access
source ~/.keys.sh

#For April Toolkit
export CLASSPATH=$CLASSPATH:/usr/share/java/gluegen-rt.jar:/usr/local/share/java/lcm.jar:$HOME/april/java/april.jar:./
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/april/lib
alias java='java -ea -server'

source ~/.bash_prompt

export ROSCONSOLE_CONFIG_FILE=/home/evenator/.ros/config/rosconsole.config

source ~/.workspace
