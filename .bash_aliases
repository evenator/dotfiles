# Bash aliases file
# Author: Ed Venator (evenator@gmail.com)

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

# Cuz why not
alias quit='exit'

alias launchgrep="grep -r --include='*.launch' --include='*.xml' --exclude='manifest.xml' --exclude='package.xml'"

alias cppgrep="grep -r --include='*.cpp' --include='*.h' --include='*.hpp'"

alias msggrep="grep -r --include='*.msg' --include='*.srv'"

alias rosfind='find $ROS_WORKSPACE'

alias lsnodes='ps aux | grep "ros" | grep -v grep | awk -F" " \"/python/{print $12; next}{print $11}\" | sort'

alias rosdep='rosdep --os="ubuntu:trusty"'

alias bashrc='source ~/.bashrc'

# Less with color and line numbers
alias less='less -NR'

# Add an "open" command to open a file using the file browser
# Apparently the OSX terminal can do this. It's handy.
# Usage:
#   open       # Opens the current directory
#   open file  # Open the file or directory in the browser
# Add an "open" command to open a file using the file browser
open(){
if [ $# -lt 1 ]; then
  gnome-open . 1>/dev/null 2>/dev/null
else
  for FILE in $@; do
    gnome-open "$FILE" 1>/dev/null 2>/dev/null
  done
fi
}
export -f open

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

swri_rostopic() {
  case "$1" in
    table)
      shift

      pub_text='Published topics:'
      sub_text='Subscribed topics:'
      print_cmd='print $2 " " $3 " " $4 " " substr($5, 0, 1)'

      rostopic list "$@" --verbose | \
      awk "!/(${pub_text})|(${sub_text})/{${print_cmd}}" | \
      sort --key=2 --human-numeric-sort | \
      column -t -c 120
      ;;

    nopub)
      # subscribed, but not published
      comm -13 --nocheck-order <(rostopic list -p) <(rostopic list -s)
      ;;

    nosub)
      # published, but not subscribed
      comm -23 --nocheck-order <(rostopic list -p) <(rostopic list -s)
      ;;

    *)
      rostopic "$@"
      ;;
  esac
}
export -f swri_rostopic
alias rostopic='swri_rostopic'

