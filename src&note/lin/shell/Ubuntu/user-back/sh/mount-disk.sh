#! /bin/bash
others="/media/Others"
a=`ls -a $others | wc -l`
if [ ! -d "$others" ] ; then
  sudo mkdir -v $others
fi

if [[ -d $others && $a -eq 2 ]] ; then
  sudo mount -vw -t ntfs /dev/sda8 $others
fi

