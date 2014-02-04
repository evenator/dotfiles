# Bash aliases file
# Author: Ed Venator (evenator@swri.org)

unalias -a

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

swri_rostopic(){
  if [ "$1" == "table" ]; then
    rostopic list -p --verbose | grep --invert-match "Published topics:" | awk '{print $2 " " $3 " " $4}' | sort --key=2 --human-numeric-sort | column -t
  else
    rostopic $@
  fi
}
export -f swri_rostopic
alias rostopic='swri_rostopic'
