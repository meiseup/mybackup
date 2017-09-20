#!/bin/bash - 
#===============================================================================
#
#          FILE: pm_mem.sh
# 
#         USAGE: ./pm_mem.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2017年09月19日 23:50
#      REVISION:  ---
#===============================================================================


#xset dpms force off;
su -c 'echo mem > /sys/power/state' ;sleep 2 ;xtrlock &
# sleep 1


