#! /bin/sh 
swapf=/swap/swapfile
swap="/swap"
if [ ! -d "$swap" ] ; then
  sudo mkdir $swap
fi

if [ ! -f $swapf ] ; then
  sudo dd if=/dev/zero of=$swapf bs=1024 count=4000000 && chmod 600 $swapf
fi 
cat /proc/swaps | grep "swap"
tmp2=`echo $?`

if [ $tmp2 != 0 ] ; then 
  if [ -f $swapf ] ; then
  sudo mkswap $swapf && sudo swapon $swapf
  fi
fi
