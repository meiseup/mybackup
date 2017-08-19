# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

#export PS1="\[\033]0;$PWD\007\]\[\033[33m\][\D{%Y-%m-%d %H:%M.%S}]\[\033[0m\] \[\033[35m\]\w\[\033[0m\]\n\[\033[36m\][\u.\h]\[\033[0m\] \[\033(0\]b\[\033(B\] "
export PS1="\[\033]0;$PWD\007\]\[\033[40;1;32m\]\D{%Y-%m-%d %H:%M:%S}\[\033[0m\] \[\033[40;1;37m\]\u:\w\[\033[0m\]\n\[\033[1;33m\]\\$\[\033[0m\] "
# User specific aliases and functions
function public_alias()
{
  alias ls='ls -F --color=always'
  type l. &>/dev/null || alias l.='ls -d .[a-Z]*|grep  /'
  type ll &>/dev/null || alias ll='ls -alh'
  alias df='df -h'
  alias du='du -h'
  alias free='free -m'
}
  public_alias

	export CDPATH=".:/media/others:/home/tmp:/media/raid"
