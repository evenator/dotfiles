# Path
if [[ $PATH != *"$HOME/scripts"* ]]; then
  export PATH="$HOME/scripts:$PATH"
fi
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

#unset color_prompt force_color_prompt

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

# Path
export PATH="$HOME/scripts:$HOME/.cabal/bin:$PATH"

# DistCC Color GCC and ccache
#export PATH=/usr/lib/colorgcc/bin:$PATH  # Disabled because g++ is going to gcc for some reason
#export CGCC_FORCE_COLOR=yes  # Should force color output, even to pipe
export CCACHE_PREFIX="distcc"

if [[ $PATH != *"/usr/lib/distcc"* ]]; then
    export PATH="/usr/lib/ccache:/usr/lib/distcc:$PATH"
fi

# Set up workspace
if [ -f ~/.workspace ]; then
  . ~/.workspace
elif [ -f /opt/ros/indigo/setup.bash ]; then
  . /opt/ros/indigo/setup.bash
fi

# Alias definitions. These go after the workspace setup script
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Editor settings
export EDITOR=vim
export GIT_EDITOR=$EDITOR

# ROS Stuff
export ROSCONSOLE_CONFIG_FILE=/home/evenator/.ros/config/rosconsole.config
export ROS_IP=$(ip addr show eth0 | grep -oP "(?<=inet )[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*")
if [ -z "$ROS_IP" ]
  then 
  export ROS_IP=$(ip addr show wlan0 | grep -oP "(?<=inet )[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*")
fi
if [ -z "$ROS_IP" ]
  then 
  export ROS_IP="127.0.0.1"
fi
#export ROS_HOSTNAME=`hostname`
export ROSLAUNCH_SSH_UNKNOWN=1

export ROS_MASTER_URI="http://localhost:11311"
#export ROS_MASTER_URI="http://$ROS_IP:11311"
#export ROS_MASTER_URI="http://192.168.10.100:11311"  # Marti 1
#export ROS_MASTER_URI="http://192.168.20.100:11311"  # DSAT HMMWV
#export ROS_MASTER_URI="http://swri-1165:11311"  # SWRI 1165
#export ROS_MASTER_URI="http://am1:11312"  # AMAS MTV
#export ROS_MASTER_URI="http://dsat-hmmwv:11311"
#export ROS_MASTER_URI="http://freightliner-ranger:11311"
#export ROS_MASTER_URI="http://marti-zotac:11311"
#export ROS_MASTER_URI="http://marti-1:11311"
#export ROS_MASTER_URI="http://marti-ranger:11311"
#export ROS_MASTER_URI="http://martixe-perception-2:11311"
#export ROS_MASTER_URI="http://mrzr-8801:11311"
#export ROS_MASTER_URI="http://mrzr-8803:11311"
#export ROS_MASTER_URI="http://mrzr-8787:11311"
#export ROS_MASTER_URI="http://mrzr-8789:11311"
#export ROS_MASTER_URI="http://rubicon-c11:11311"
#export ROS_MASTER_URI="http://rubicon-c12:11311"
#export ROS_MASTER_URI="http://192.168.70.100:11311"  # Acura 1
#export ROS_MASTER_URI="http://192.168.15.100:11311"  # Golfcart
#ulimit -c 0 #unlimited

export ROSDISTRO_INDEX_URL=https://ivs-git.dyn.datasys.swri.edu/external/rosdistro/raw/swri/index.yaml

echo "ROS IP:        $ROS_IP"
echo "ROS Hostname:  $ROS_HOSTNAME"
echo "ROS Workspace: $(roscd && pwd)"
echo "ROS Master:    $ROS_MASTER_URI"
