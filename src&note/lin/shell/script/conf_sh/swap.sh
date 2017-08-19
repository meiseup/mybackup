#!/bin/bash 
#
function swap_on()
{
  df -h|grep sda|column -t -o" "|cut -d" " -f4,5;return;
  swap="/swap/swapfile"
  [ ! -d "${swap%/*}" ]&&sudo mkdir ${swap%/*}
  if [ ! -f ${swap} ];then sudo dd if=/dev/zero of=${swap} bs=1024 count=512000&&sudo chmod 600 ${swap}&&sudo mkswap -L "swap" ${swap};fi
  if cat /proc/swaps|grep "${swap}";then echo 'memory already exists swapfile.';return;fi
  [ -f ${swap} ]&&if file ${swap}|grep swap;then sudo swapon ${swap};else sudo mkswap -L "swap" ${swap}&&sudo swapon ${swap};fi
unset swap
}
swap_on;
unset -f swap_on;
