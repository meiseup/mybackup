#!/bin/bash -xv
# Some applications aliases and functions……

# File Browser 1
function fb1()
{
  pcmanfm $1 &>/dev/null&
}

# File Browser 2
function fb2()
{
  thunar $1 &>/dev/null&
}

# Pdf Browser
type pdfb &>/dev/null || alias pdfb='masterpdfeditor3 &>/dev/null&'

# Web Browser
type webb &>/dev/null || alias webb='firefox &>/dev/null&'

# Music Player 
type msp &>/dev/null || alias msp='RhythmCat &>/dev/null &'

# Picture Browser
type picb &>/dev/null || alias picb='ristretto &>/dev/null&'


# ffmpeg split video
function vsplit()
{
  # test filetype $1

  local arg=

  if
    [ $# -eq 4 ];then
    if [[ "x$2" != "x-s" && "x$2" != "x-t" ]];then
      arg="-ss $2 -to $3"
    else
      case $2 in
        -s) arg="-ss $3";;
        -t) arg="-to $3";;
      esac;
    fi;

  elif [ $# -eq 3 ];then
    set $1 $2 $3 new_$1
    case $2 in
      -s) arg="-ss $3";;
      -t) arg="-to $3";;
      #[0-9]\+:[0-9]\+:[0-9]\+) arg=-ss $2;;
      *) arg="-ss $2 -to $3";;
    esac;

  elif [ $# -eq 2 ];then
    set $1 $2 "" new_$1
    arg="-ss $2" # default

  else
    echo -e "Usage:\n $FUNCNAME <input_file> {start_time end_time | -s start_time | -t end_time} [output_file] |\n $FUNCNAME <input_file> start_time";
    return 2;

  fi;

  #echo "$arg"
  #echo "\$1=$1 \$2=$2 \$3=$3 \$4=$4"; #$1 $2 $3 $4
  ffmpeg -i $1 -c copy $arg $4 
  unset arg
}

