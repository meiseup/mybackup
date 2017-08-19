#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return
echo $PATH|grep -io $HOME &>/dev/null || { [ -d $HOME/bin ] && export PATH="$PATH:$HOME/bin"; }
#[ -r /etc/bash.bashrc ]&&source /etc/bash.bashrc
#[ -r /home/tmp/sh/profile.sh ]&&source /home/tmp/sh/profile.sh
alias mysqld='mysqld --console >&/dev/null &'
type mysql_clo &> /dev/null || alias mysql_clo='mysqladmin -umysql -p shutdown'
ps aux|grep -v grep|grep X &> /dev/null || alias startx='startx 2>/dev/null '
#alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '

#source ~/.shell_prompt.sh

[ -f /usr/share/doc/pkgfile/command-not-found.bash ] && source /usr/share/doc/pkgfile/command-not-found.bash
[ "$TERM" = "linux" ] && {
  echo -en "\e]P7ffffff"
  #su -c 'echo -e "`dumpkeys|grep keymaps`\nkeycode 100 = Alt" | loadkeys'
  alias external_env='ps aux|grep -v grep|grep fcitx &>/dev/null || fcitx&>/dev/null& \
    exec tmux'
  # set the default text color. this only works in tty (eg $TERM == "linux"), not pts (eg $TERM == "xterm")
  #setterm -background black -foreground green -store

  #cursor_styles="\e[?${cursor_style_full_block};c" # only seems to work in tty
  cursor_styles="\e[?16;2;112;c" # only seems to work in tty


  PS1="\u:\W \\$ ${cursor_styles}"
  #PS1="$PS1${cursor_styles}"

  ##############
  # end pretty prompt and font colors
  ##############
} 

alias gcc="color_compile gcc"
alias g++="color_compile g++"
alias make="color_compile make"

#&& type fbterm &> /dev/null
if [[ `tty` = \/dev\/tty[1-6]  ]];then
  LANG="zh_CN.UTF-8" fbterm
fi
#fbterm;fi #

