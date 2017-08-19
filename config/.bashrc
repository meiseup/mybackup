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

  # http://linuxgazette.net/137/anonymous.html
  # cursor_style_default=0 # hardware cursor (blinking)
  # cursor_style_invisible=1 # hardware cursor (blinking)
  # cursor_style_underscore=2 # hardware cursor (blinking)
  # cursor_style_lower_third=3 # hardware cursor (blinking)
  # cursor_style_lower_half=4 # hardware cursor (blinking)
  # cursor_style_two_thirds=5 # hardware cursor (blinking)
  # cursor_style_full_block_blinking=6 # hardware cursor (blinking)
  # cursor_style_full_block=16 # software cursor (non-blinking)

  # cursor_background_black=0 # same color 0-15 and 128-infinity
  # cursor_background_blue=16 # same color 16-31
  # cursor_background_green=32 # same color 32-47
  # cursor_background_cyan=48 # same color 48-63
  # cursor_background_red=64 # same color 64-79
  # cursor_background_magenta=80 # same color 80-95
  # cursor_background_yellow=96 # same color 96-111
  # cursor_background_white=112 # same color 112-127

  # cursor_foreground_default=0 # same color as the other terminal text
  # cursor_foreground_cyan=1
  # cursor_foreground_black=2
  # cursor_foreground_grey=3
  # cursor_foreground_lightyellow=4
  # cursor_foreground_white=5
  # cursor_foreground_lightred=6
  # cursor_foreground_magenta=7
  # cursor_foreground_green=8
  # cursor_foreground_darkgreen=9
  # cursor_foreground_darkblue=10
  # cursor_foreground_purple=11
  # cursor_foreground_yellow=12
  # cursor_foreground_white=13
  # cursor_foreground_red=14
  # cursor_foreground_pink=15

  #cursor_styles="\e[?${cursor_style_full_block};${cursor_foreground_black};${cursor_background_green};c" # only seems to work in tty
  #cursor_styles="\e[?${cursor_style_full_block};c" # only seems to work in tty
  cursor_styles="\e[?16;2;112;c" # only seems to work in tty

  # http://www.bashguru.com/2010/01/shell-colors-colorizing-shell-scripts.html
  # prompt_foreground_black=30
  # prompt_foreground_red=31
  # prompt_foreground_green=32
  # prompt_foreground_yellow=33
  # prompt_foreground_blue=34
  # prompt_foreground_magenta=35
  # prompt_foreground_cyan=36
  # prompt_foreground_white=37

  # prompt_background_black=40
  # prompt_background_red=41
  # prompt_background_green=42
  # prompt_background_yellow=43
  # prompt_background_blue=44
  # prompt_background_magenta=45
  # prompt_background_cyan=46
  # prompt_background_white=47

  # prompt_chars_normal=0
  # prompt_chars_bold=1
  # prompt_chars_underlined=4 # doesn't seem to work in tty
  # prompt_chars_blinking=5 # doesn't seem to work in tty
  # prompt_chars_reverse=7

  # prompt_reset=0

  # start_prompt_coloring="\e[${prompt_chars_bold};${prompt_foreground_black};${prompt_background_green}m"
  # start_prompt_styles="\e[${prompt_chars_bold}m" # just use default background and foreground colors
  # end_prompt_styles="\e[${prompt_reset}m"

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
  LANG="zh_CN.UTF-8" exec fbterm
fi
#fbterm;fi #

