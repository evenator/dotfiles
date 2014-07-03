# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

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
force_color_prompt=yes

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

unset color_prompt force_color_prompt

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Prompt
source ~/.bash_prompt

# Path
export PATH="$HOME/scripts:$HOME/.cabal/bin:$PATH"

#For Gitlab access
source ~/.keys.sh

# Set up workspace
source ~/.workspace

# Alias definitions. These go after the workspace setup script
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Editor settings
EDITOR=vim
GIT_EDITOR=$EDITOR

# ROS Stuff
export ROSCONSOLE_CONFIG_FILE=/home/evenator/.ros/config/rosconsole.config
export ROS_IP=$(ip addr show eth0 | grep -e "[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*" -o | head -n1)
export ROS_HOSTNAME=`hostname`
export ROSLAUNCH_SSH_UNKNOWN=1

export ROS_MASTER_URI="http://mrzr-8789:11311"
export ROS_MASTER_URI="http://dsat-hmmwv:11311"
#export ROS_MASTER_URI="http://rubicon-c11:11311"
#export ROS_MASTER_URI="http://192.168.70.100:11311"  # Acura 1
ulimit -c unlimited

echo "ROS Master is $ROS_MASTER_URI"
