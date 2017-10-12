#!/bin/bash - 
#===============================================================================
#
#          FILE: java.sh
# 
#         USAGE: ./java.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2017年02月27日 19:41
#      REVISION:  ---
#===============================================================================
#tmp=/home/external/usr/develop
tmp=$1
#[ -d $tmp ] && {
#	JAVA_HOME=$tmp/Java_Web/jdk7u80
#	JRE_HOME=$JAVA_HOME/jre
#	PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH
#	export JAVE_HOME JRE_HOME PATH
#	unset tmp
#}
[ -n $tmp ] && [ -d $tmp ] && {
	jdk=$tmp/Java_Web/jdk7u80
	jre=$jdk/jre
	dest=/usr/local/bin
  #for i in $jdk/bin/* $jre/bin/*;do SUDO ln -sv $i $dest/$i;done
  #for i in "$jdk/bin/*" "$jre/bin/*";do readlink $dest/`basename $i` &>/dev/null || SUDO ln -sv $i $dest/;done;
	for i in $jdk/bin/* $jre/bin/*;do [ -L $dest/${i##*/} ] || SUDO ln -sv $i $dest/;done;
	unset jdk jre dest
}
