#! /bin/bash
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

#Use human-readable filesizes
alias du="du -h"
alias df="df -h"

# Cuz why not
alias quit='exit'

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

swri_rosmake(){
  special_args=`getopt -q -l "retry eclipse" -o "asr" -- $@`
  if [[ $special_args =~ "--retry" ]]; then
    file=`find ~/.ros/rosmake/ -iname buildfailures.txt -printf "%C@ %p\n" |
      sort -rn |
      head -n 1 |
      cut -d" " -f2`
    echo "Retrying packages listed in $file"
    packages="`tail -n+2 $file`"
    opts=`sed 's/--retry//' <<<$special_args`
    if [[ -n $packages ]]; then
      echo $opts $packages | xargs -t rosmake
    else
      echo "Nothing to build"
    fi
  elif [[ $special_args =~ "--eclipse" ]]; then
    if [[ $special_args =~ "-a" ]]; then
      echo "Making all eclipse projects..."threaded_segment_localizer
      package_paths=`rospack list | cut -d" " -f2`
    else
      echo "Making specified eclipse projects..."
      package_paths=`gawk -F" -- " '{print $2}' <<<$special_args |
        xargs -n1 rospack find`
    fi
    echo $package_paths | xargs -d" " -t -n1 -i{} make -C {} eclipse-project
  else
    rosmake $@
  fi
}
export -f swri_rosmake
alias rosmake='swri_rosmake'

rosrepodo(){
  for dir in `rosws info --pkg-path-only  | sed 's/\:/ /g'`
  do
     if [ -d "$dir/.git" ] &&
         git --work-tree="$dir" --git-dir="$dir/.git" remote -v | grep "datasys.swri.edu" -q ; then
       echo "cd $dir;" $@
       eval "cd $dir;" $@
     fi
  done
}

rosgit(){
  for dir in `rosws info --pkg-path-only  | sed 's/\:/ /g'`
  do
    if [ -d "$dir/.git" ] && 
        git --work-tree="$dir" --git-dir="$dir/.git" remote -v | grep "datasys.swri.edu" -q ; then
      echo `basename "$dir"`
      echo "========"
      echo ""
      git --work-tree="$dir" --git-dir="$dir/.git" "$@"
      echo ""
    fi
  done
}
export -f rosgit

repodo(){
  for dir in `rosws info --pkg-path-only  | sed 's/\:/ /g'`
  do
    if [ -d "$dir/.git" ] && 
        git --work-tree="$dir" --git-dir="$dir/.git" remote -v | grep "datasys.swri.edu" -q ; then
      echo `basename "$dir"`
      echo "========"
      echo ""
      (cd $dir; bash -c "$@")
      echo ""
    fi
  done
}
export -f repodo

my_rosws(){
  case "$1" in
    cd)
      shift
      LOCALNAME=$(rosws info --only=localname | awk "/$1/{print length, \$0}" | sort -n -s | cut -d' ' -f2- | head -1)
      echo $LOCALNAME
      cd `rosws info --only=path $LOCALNAME`
      ;;
    checkout)
      shift
        for dir in `rosws info --pkg-path-only  | sed 's/\:/ /g'`
        do
          if [ -d "$dir/.git" ] && 
              git --work-tree="$dir" --git-dir="$dir/.git" remote -v | grep "datasys.swri.edu" -q ; then
            echo `basename "$dir"`
            git --work-tree="$dir" --git-dir="$dir/.git" fetch
            if [ -n "$(git --work-tree="$dir" --git-dir="$dir/.git" branch --list -a | awk -F'[ /]' '{print $NF'} | grep "^$1\$")" ]
              then
                rosws set $dir -y -v $1 >/dev/null 2>/dev/null
                git --work-tree="$dir" --git-dir="$dir/.git" checkout "$1"
                echo "Changed to branch $1"
                git --work-tree="$dir" --git-dir="$dir/.git" merge --ff-only origin/$1
              else
                echo "Branch $1 does not exist"
            fi
            echo "---"
          fi
        done
      ;;
    *)
      rosws "$@"
      ;;
  esac
}
export -f my_rosws
alias rosws='my_rosws'

my_rosws(){
  case "$1" in
    checkout)
      shift
        for dir in `rosws info --pkg-path-only  | sed 's/\:/ /g'`
        do
          if [ -d "$dir/.git" ] && 
              git --work-tree="$dir" --git-dir="$dir/.git" remote -v | grep "datasys.swri.edu" -q ; then
            echo `basename "$dir"`
            git --work-tree="$dir" --git-dir="$dir/.git" fetch
            if [ -n "$(git --work-tree="$dir" --git-dir="$dir/.git" branch --list -a | awk -F'[ /]' '{print $NF'} | grep "^$1\$")" ]
              then
                rosws set $dir -y -v $1 >/dev/null 2>/dev/null
                git --work-tree="$dir" --git-dir="$dir/.git" checkout "$1"
                echo "Changed to branch $1"
                git --work-tree="$dir" --git-dir="$dir/.git" merge --ff-only origin/$1
              else
                echo "Branch $1 does not exist"
            fi
            echo "---"
          fi
        done
      ;;
    *)
      rosws "$@"
      ;;
  esac
}
export -f my_rosws
alias rosws='my_rosws'

convert_stamp(){
  date -d@$1
}
export -f convert_stamp

alias launchgrep="grep -r --include='*.launch' --include='*.xml'"
alias cppgrep="grep -r --include='*.cpp' --include='*.h' --include='*.hpp'"
alias msggrep="grep -r --include='*.msg' --include='*.srv'"

alias rosfind='find $(roscd && pwd)'

alias lsnodes='ps aux | grep "ros" | grep -v grep | awk -F" " \"/python/{print $12; next}{print $11}\" | sort'

alias bashrc='source ~/.bashrc'

pandoc-pdf(){
  PDF_FILE=`expr "${@: -1}" : '\(.*\.\)'`"pdf"
  pandoc -o "$PDF_FILE" -V geometry:margin=1.0in "$@" && echo "Created $PDF_FILE"
}
export -f pandoc-pdf

vpn(){
  echo -ne "\033]0;VPN\007"
  snx
  echo "VPN connected"
  echo "Press Ctrl+C to disconnect"
  ssh -N -D 1080 boomer 2>/dev/null
  echo "SSH proxy disconnected"
  snx -d 1>/dev/null 2>/dev/null
  echo "VPN disconnected"
}
alias ssh_proxy='ssh -f -N -D 1080 boomer.dyn.datasys.swri.edu'

alias speed_hud='rxplot /localization/near_field_odom/twist/twist/linear/x,/vehicle_interface/speed_setpoint/speed /localization/gps/speed,/localization/near_field_odom/twist/twist/linear/x /can/mototron_odometry/speed'
alias encoder_hud='rxplot /localization/semi_unified_localization_node/can_odom_elems/v_rear_driver,/localization/semi_unified_localization_node/can_odom_elems/v_rear_passenger /localization/semi_unified_localization_node/can_odom_elems/v_rear_driver /localization/semi_unified_localization_node/can_odom_elems/v_rear_passenger'

qotd(){
 curl -s http://bash.org/?random1|grep -oE "<p class=\"quote\">.*</p>.*</p>"|grep -oE "<p class=\"qt.*?</p>"|sed -e 's/<\/p>/\n/g' -e 's/<p class=\"qt\">//g' -e 's/<p class=\"qt\">//g'|perl -ne 'use HTML::Entities;print decode_entities($_),"\n"' | head -n1
}
export -f qotd

alias rosdep='rosdep --os=ubuntu:precise'

extended_catkin(){
  if [ $1 = 'cd' ]; then
    pkg_path=$(catkin locate "$2")
    if [ -n $pkg_path ]; then cd "$pkg_path"; fi
  else
    catkin "$@"
  fi
}
alias catkin='extended_catkin'

#TODO: Make this work recursively up the directory tree to the git root
#
alias rsync_git='rsync --exclude=".git" --filter=":- .gitignore"'

gitkin(){
  for dir in `wstool info --only=path  | sed 's/\:/ /g'`
  do
    if [ -d "$dir/.git" ] && 
        git --work-tree="$dir" --git-dir="$dir/.git" remote -v | grep "datasys.swri.edu" -q ; then
      echo `basename "$dir"`
      echo "========"
      echo ""
      git --work-tree="$dir" --git-dir="$dir/.git" "$@"
      echo ""
    fi
  done
}
export -f gitkin
alias catgit=gitkin
