# Path
export PATH="$HOME/scripts:$HOME/.cabal/bin:$PATH"
export PYTHONPATH="$PYTHONPATH:~/.python/lib/python2.7/site-packages:$HOME/ivs_conf/python"

# Alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Set up workspace
if [ -f ~/.workspace ]; then
    source ~/.workspace
fi

# If not running interactively, stop here
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
if [ -f ~/.bash_prompt ]; then
    source ~/.bash_prompt
fi

# Color GCC and ccache
#export PATH=/usr/lib/colorgcc/bin:$PATH  # Disabled because g++ is going to gcc for some reason
export CCACHE_PATH="/usr/bin"  # So ccache doesn't recursively invoke colorgcc
# export CGCC_FORCE_COLOR=yes  # Should force color output, even to pipe

# Editor settings
export EDITOR=vim
export GIT_EDITOR=$EDITOR

# ROS Stuff
export ROSCONSOLE_CONFIG_FILE=/home/evenator/.ros/config/rosconsole.config

#export ROS_MASTER_URI="http://rubicon-c11:11311"
#export ROS_MASTER_URI="http://mrzr-8789:11311"
export ROS_MASTER_URI="http://localhost:11311"

export ROS_IP=$(ip addr show ppp0 | grep -e "[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*" -o | head -n1)
if [ -z ROS_IP ]; then
  export ROS_IP=$(ip addr show eth0 | grep -e "[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*" -o | head -n1)
fi
export ROS_HOSTNAME=boomer.dyn.datasys.swri.edu
export ROSLAUNCH_SSH_UNKNOWN=1

echo "ROS IP:        $ROS_IP"
echo "ROS Hostname:  $ROS_HOSTNAME"
echo "ROS Workspace: $(roscd && pwd)"
echo "ROS Master:    $ROS_MASTER_URI"

SSH_ENV=$HOME/.ssh/environment
   
# start the ssh-agent
function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add
}
if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
      start_agent;
    }
else
    start_agent;
fi
