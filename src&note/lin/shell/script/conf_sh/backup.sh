#!/bin/bash -
#####

local tmp=/home/external/sh

[ -f "${tmp}/check-os.sh" ] && source "${tmp}/check-os.sh"

case $OS in
	Arch*)
		tmp=/media/Others/Backup/lin/Arch/etc;;
	Fedora*)
		tmp=/media/Others/Backup/lin/fedora/etc;;
esac
[ ! -d $tmp ] && mkdir -p $tmp

case $OSTYPE in
	linux-gnu)
		cd /etc;
		for i in *.conf;do
			[ -f $i ] && \cp $i $tmp;
		done;;
	msys)
		:;;
	*)
		:;;
esac

#######

