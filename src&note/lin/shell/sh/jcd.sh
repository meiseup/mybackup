#!/bin/bash -xv
#===============================================================================
#
#          FILE: jcd.sh
# 
#         USAGE: ./jcd.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2017年08月19日 10:37
#      REVISION:  ---
#===============================================================================

dir="`echo $PWD|sed 's/\// /g'`"
for i in `echo $PWD|sed 's/\// /g'`;do
  if [[ "x$1" == "x" ]];then echo "error,can not cd the dir.";exit;fi
  [[ "$1" == "$i" ]] && pushd "/$i";
done

unset $dir
