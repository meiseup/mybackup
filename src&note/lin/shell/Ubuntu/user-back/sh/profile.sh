#!/bin/bash
export PS1='\[\033[1;33m\]\u&\w\$\[\033[0m\] '
export HISTSIZE=1500
export HISTFILESIZE=1500
export HISTCONTROL=ignoreboth:erasedups
export HISTTIMEFORMAT='%F %T '
export HISTIGNORE='sync:history[ \t]*:du[ \t]*:df:free:ll:ll[ \t]*:ls:ls[ \t]*:top:ps:exit'
export Back=/media/Others/Backup/Linux
export Logs=/media/Others/Logs
export Doc=/media/Others/Document
if [ -x /usr/bin/dircolors ] ; then 
	[ -r /usr/local/sh/dircolors ] && eval "`dircolors -b /usr/local/sh/dircolors`"
fi
