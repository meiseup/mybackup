#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
echo $PATH|grep -io $HOME &>/dev/null || { [ -d $HOME/bin ] && export PATH="$HOME/bin:$PATH"; }
#[ -r /etc/bash.bashrc ]&&source /etc/bash.bashrc
#[ -r /home/tmp/sh/profile.sh ]&&source /home/tmp/sh/profile.sh
alias mysqld='mysqld --console >&/dev/null &'
type mysql_clo &> /dev/null||alias mysql_clo='mysqladmin -umysql -p shutdown'
alias startx='startx 2>/dev/null '
#alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '

#source ~/.shell_prompt.sh

[ -f /usr/share/doc/pkgfile/command-not-found.bash ] && source /usr/share/doc/pkgfile/command-not-found.bash
[ "$TERM" = "linux" ] && echo -en "\e]P7ffffff"
#&& type fbterm &> /dev/null
if [[ `tty` = \/dev\/tty[1-6]  ]];then LANG="zh_CN.uTF-8" fbterm;fi #fbterm_bg;fi

