#!/bin/bash -
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
[ -f ./check-os.sh ] && source ./check-os.sh

{ [ -s "$OS" ] && ping -c 2 www.baidu.com >&/dev/null; } && { echo "network is ok....."; } || {
	 case $OS in
    Arch*)
      dhcp=dhcpcd;;
    Fedora*)
      dhcp=dhclient;;
  esac

	for i in `ps aux|grep -v grep|grep wlp3s0|awk '{print $2}'`;do 
		sudo kill $i &>/dev/null;unset i
	done


	sudo rm -f /var/run/wpa_supplicant/wlp3s0 >& /dev/null
	sudo  kill `cat /run/dhcpcd-wlp3s0.pid 2>/dev/null` &>/dev/null
	sudo wpa_supplicant -iwlp3s0 -c /etc/wpa_supplicant/wpa_supplicant.conf -B&&sudo $dhcp wlp3s0
  unset dhcp

	#sudo wpa_supplicant -iwlp3s0 -c <(wpa_passphrase "BUNFLY_01" "bunfly.com") -B&&sudo dhcpcd wlp3s0
}

unset -f check-net
#
