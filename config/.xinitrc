#!/bin/sh

#xterm -geometry 80x20+494-0 &
#exec xterm -geometry 80x66+0+0 -name login
#exec compiz --replace
#twm &
#terminator &
#exec fvwm &> /dev/null
xfwm4&
ps aux|grep -v grep|grep fcitx || LANG="zh_CN.UTF-8" fcitx &>/dev/null &
#export LC_ALL=POSIX
export LANG="zh_CN.UTF-8"
#export LANGUAGE="zh_CN:en_US"
export XIM=fcitx
export XIM_PROGRAM=fcitx
export GTK_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export QT_IM_MODULE=fcitx
xfce4-terminal
