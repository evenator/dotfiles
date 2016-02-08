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
      echo "Making all eclipse projects..."
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
#alias rosws='my_rosws'

convert_stamp(){
  date -d@$1
}
export -f convert_stamp

alias launchgrep="grep -r --include='*.launch' --include='*.xml' --exclude='manifest.xml' --exclude='package.xml'"
alias cppgrep="grep -r --include='*.cpp' --include='*.h' --include='*.hpp'"
alias msggrep="grep -r --include='*.msg' --include='*.srv'"

alias rosfind='find $ROS_WORKSPACE'

alias lsnodes='ps aux | grep "ros" | grep -v grep | awk -F" " \"/python/{print $12; next}{print $11}\" | sort'

alias rosdep='rosdep --os="ubuntu:precise"'

alias bashrc='source ~/.bashrc'

pandoc-pdf(){
  PDF_FILE=`expr "${@: -1}" : '\(.*\.\)'`"pdf"
  pandoc -o "$PDF_FILE" -V geometry:margin=1.0in "$@" && echo "Created $PDF_FILE"
}
export -f pandoc-pdf

qotd(){
 curl -s http://bash.org/?random1|grep -oE "<p class=\"quote\">.*</p>.*</p>"|grep -oE "<p class=\"qt.*?</p>"|sed -e 's/<\/p>/\n/g' -e 's/<p class=\"qt\">//g' -e 's/<p class=\"qt\">//g'|perl -ne 'use HTML::Entities;print decode_entities($_),"\n"' | head -n1
}
export -f qotd

alias rosdep='rosdep --os=ubuntu:trusty'

catking(){
   if [ $1 = 'cd' ]; then
     if [ -z "$2" ]; then echo -e 1>&2 "\e[31mERROR: You must specify a catkin package name\e[0m"; return 1; fi
     pkg="$(echo $2 | cut -d '/' -f 1)"
     sub_path="$(echo $2 | cut -d '/' -s -f 2- --output-delimiter='/')"
     pkg_path=$(catkin locate "$pkg")
     if [ -n "$pkg_path" ]; then cd "$pkg_path/$sub_path"; fi
   elif [ $1 = 'test' ]; then
     shift
     catkin build "$@" --catkin-make-args run_tests
   elif [ $1 = 'eclipse' ]; then
     shift
    if [ $# -lt "1" ]; then pkgs=$(catkin list -u); else pkgs="$@"; fi;
    parallel -I{} bash -lc 'extended_catkin cd {} && (cmake -G"Eclipse CDT4 - Unix Makefiles"; git clean -fx -- cmake catkin catkin_generated CMakeFiles devel gtest test_results CMakeCache.txt cmake_install.cmake CTestTestfile.cmake Makefile)' -- $pkgs
   else
     catkin "$@"
   fi
}

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

alias copy_amas_logs='rsync -avz amas@am1:/home/amas/.ros/log/ ~/Desktop/amas_bags/log'

try_git_rm(){
  err=$(git rm "$@" 3>&1 2>&3) 
  code=$?
  if [ $code == 128 ]; then
    command rm "$@"
  elif [ $code -gt 0 ]; then
    echo "$err" 1>&2
  fi
}
alias rm='try_git_rm'
