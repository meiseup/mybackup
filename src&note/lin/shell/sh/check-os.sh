#!/bin/bash -
#===============================================================================
#
#          FILE: check-os.sh
# 
#         USAGE: ./check-os.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2017年05月04日 15:29
#      REVISION:  ---
#===============================================================================
function check-os()
{
	if [[ -z "${OS}" && "${SHELL}" == "/bin/bash" ]];then
	 OS= 
	 else 
		 unset -f check-os;return 1;
	fi
}

check-os

if [ "${OSTYPE}" == "linux-gnu" ];then
  if [[ -f /etc/redhat-release && `grep -io Fedora /etc/redhat-release` == "Fedora" ]];then
    OS="Fedora"
  elif [[ -f /etc/issue && `grep -io Arch /etc/issue` == "Arch" ]];then
    OS="Arch Linux"
  elif [[ -f /etc/issue && `grep -io Gentoo /etc/issue` == "Gentoo" ]];then
    OS="Gentoo Linux"
  else 
    OS="Other Linux"
  fi
	elif [ "$OSTYPE" == "msys" ];then
		OS="msys"
fi

export OS
unset -f check-os
