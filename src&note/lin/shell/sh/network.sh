#!/bin/bash -xv
#===============================================================================
#
#          FILE: network.sh
# 
#         USAGE: ./network.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 10/19/2016 00:42
#      REVISION:  ---
#===============================================================================

[ -z "${dhcp}" ] && dhcp=

{ [ -s "$OS" ] && ping -c 2 www.baidu.com >&/dev/null; } &&
{ echo "network is ok....."; } ||
{
	 case $OS in
    Arch*)
      dhcp=dhcpcd;;
    Fedora*)
      dhcp=dhclient;;
      *)
      dhcp=dhcpcd;;
  esac

	for i in `ps aux|grep -v grep|grep wlp3s0|awk '{print $2}'`;do 
		${SUDO} kill $i &>/dev/null;unset i
	done


	${SUDO} rm -f /var/run/wpa_supplicant/wlp3s0 >& /dev/null
	${SUDO}  kill `cat /run/dhcpcd-wlp3s0.pid 2>/dev/null` &>/dev/null
  ${SUDO} ip link set wlp3s0 up
	${SUDO} wpa_supplicant -iwlp3s0 -c /etc/wpa_supplicant/wpa_supplicant.conf -B &&${SUDO} $dhcp wlp3s0
  unset dhcp

	#SUDO wpa_supplicant -iwlp3s0 -c <(wpa_passphrase "BUNFLY_01" "bunfly.com") -B&&SUDO dhcpcd wlp3s0
}

#
