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

# Cuz why not
alias quit='exit'

# Less with color
alias less='less -R'

# Add an "open" command to open a file using the file browser (caja or nautilus)
# Apparently the OSX terminal can do this. It's handy.
# Usage:
#   open                # Opens the current directory
#   open [file [file] ] # Open the file(s) or directories in the browser
if [ -n `which caja` ]; then
  open(){
    if [ $# -lt 1 ]; then
      caja . 1>/dev/null 2>/dev/null &
    else
      caja "$1" 1>/dev/null 2>/dev/null &
    fi
  }
else
  open(){
    if [ $# -lt 1 ]; then
      nautilus . 1>/dev/null 2>/dev/null &
    else
      nautilus "$1" 1>/dev/null 2>/dev/null &
    fi
  }
fi
export -f open

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

swri_rostopic(){
  if [ "$1" == "table" ]; then
    shift
    rostopic list $@ --verbose | awk '!/(Published topics:)|(Subscribed topics:)/{print $2 " " $3 " " $4 " " substr($5,0,1)}' | sort --key=2 --human-numeric-sort | column -t
  elif [ "$1" == nopub ]; then
    comm -13 <(rostopic list -p) <(rostopic list -s) # subscribed, but not published
  elif [ "$1" == nosub ]; then
    comm -23 <(rostopic list -p) <(rostopic list -s) # published, but not subscribed  
  else
    rostopic $@
  fi
}
export -f swri_rostopic
alias rostopic='swri_rostopic'

swri_rosmake(){
  if [ "$1" == "retry" ]; then
    file=`find ~/.ros/rosmake/ -iname buildfailures.txt -printf "%C@ %p\n" |
      sort -rn |
      head -n 1 |
      cut -d" " -f2`

    echo $file
    if [[ -n `tail -n+2 $file` ]]
      then
      tail -n+2 $file | xargs -t rosmake -sr
    else
      echo "Nothing to build"
    fi
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
      git --work-tree="$dir" --git-dir="$dir/.git" $@
      echo "---"
    fi
  done
}
