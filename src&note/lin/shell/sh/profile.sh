#!/bin/bash -
#export PS1="\[\e[1;31m\]\$?\[\e[0m\]\[\e[1;36m\]:\[\e[0m\]\#\[\e[1;36m\]:\[\e[0m\]\[\e[1;31m\]\u\[\e[0m\]\[\e[1;36m\]:\[\e[0m\]\[\e[1;37m\]\w\[\e[0m\]\n\`if [ \$? != 0 ];then echo -e \"\[\e[1;36m\]:(\[\e[0m\]\";else echo -e \"\[\e[1;37m\]^_^\[\e[0m\]\";fi\`\[\e[0m\]\[\e[1;33m\]/=>\[\e[0m\] "

#if [[ -z $normal&&-z $red ]];then
#
normal="\[\e[0m\]"
black="\[\e[1;30m\]"
red="\[\e[1;31m\]"
green="\[\e[1;32m\]"
yellow="\[\e[1;33m\]"
blue="\[\e[1;34m\]"
pink="\[\e[1;35m\]"
cyan="\[\e[1;36m\]"
white="\[\e[1;37m\]"

#export PS1='\[\e[1;31m\]\!\[\e[0m\]\[\e[1;36m\]:\[\e[0m\]\#\[\e[1;36m\]:\[\e[0m\]\
	#\[\e[1;31m\]\u\[\e[0m\]\[\e[1;36m\]:\[\e[0m\]\[\e[1;37m\]\w\[\e[0m\]\n\
	#`echo $?`:\[\e[1;33m\]\$\[\e[0m\] '

#export PS1="${red}`echo $?`${normal}${color}:${normal}\#${color}:${normal}\
	#${red}\u${normal}${color}:${normal}${yellow}\w${normal}\n\
	#${color}\!${normal}${color}:${normal}${green}\\$ ${normal}"

#

export PS1="${red}\$?${normal}${yellow}:${normal}\
${green}\!${normal}${yellow}:${normal}\
${cyan}\#${normal}${yellow}:${normal}\
${pink}\u${normal}${yellow}:${normal}\
${white}\w${normal}\n\
\`if [ \$? -eq 0 ];then echo \"${white}^_^${normal}\";else echo \"${red}:(${normal}\";fi\`\
${pink}-${normal}${yellow}\\$ ${normal}"
export PS2="$pink>> $normal"

unset normal black red green yellow blue pink cyan white
#fi

#
export HISTSIZE=5000
export HISTFILESIZE=30720
export HISTCONTROL="ignoreboth:erasedups"
#export HISTTIMEFORMAT='%F %T '
#export HISTIGNORE="&:[ ]*"
#export HISTIGNORE='sync:history[ \t]*:du[ \t]*:df:free:ll:ll[ \t]*:ls:ls[ \t]*:top:ps:exit'
if [[ $OSTYPE = "msys" ]] ; then
	:
elif [[ $OSTYPE = cygwin ]] ; then
	:
elif [[ $OSTYPE = linux-gnu ]] ; then 
	:
fi

#
case $OSTYPE in
	msys|cygwin)
		[ -r "/usr/local/sh/bash_aliases" ] && source "/usr/local/sh/bash_aliases"
		[ -x /usr/bin/dircolors ] && [ -r /usr/local/sh/dircolors ] && eval "$(dircolors -b /usr/local/sh/dircolors)"
		CDPATH="$CDPATH:/i:/g:."
		back="/i/Backup/lin"
		;;
	# cygwin) 
		# [ -r "/usr/local/sh/bash_aliases" ] && source "/usr/local/sh/bash_aliases"
		# [ -x /usr/bin/dircolors ] && [ -r /usr/local/sh/dircolors ] && eval "$(dircolors -b /usr/local/sh/dircolors)"
		# ;;

		#
		linux-gnu)
		tmp=/home/external/sh
		[ -r "$tmp/bash_aliases" ] && source $tmp/bash_aliases
		[ -r /usr/bin/dircolors ] && [ -r $tmp/dircolors ] && eval "$(dircolors -b $tmp/dircolors)"
		[ -r $tmp/genary.sh ] && source $tmp/genary.sh
		[ -r $tmp/cowsay.sh ] && source $tmp/cowsay.sh
		[ -r $tmp/adb_completion/adb.bash ] && source $tmp/adb_completion/adb.bash
		[ -r $tmp/set_user_path.sh ] && source $tmp/set_user_path.sh
		#[ -x $tmp/java.sh ] && source $tmp/java.sh
		unset tmp
		CDPATH=".:~/Desktop:/media/Others:/media/Applications:/home/external"
		back="/media/Others/Backup/lin"
		;;
esac

export VISUAL="vim" EDITOR="vim"
export CDPATH back;

