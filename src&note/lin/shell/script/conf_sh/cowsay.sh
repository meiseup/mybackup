#!/bin/bash -
#===============================================================================
#
#          FILE: cowsay.sh
# 
#         USAGE: ./cowsay.sh 
# 
#   DESCRIPTION: 
#
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 2017年02月23日 20:51
#      REVISION:  ---
#===============================================================================
cow_dir=
app_install=

[ -f /home/external/sh/check-os.sh ] && source /home/external/sh/check-os.sh
case $OS in
  Arch*)
    cow_dir=/usr/share/cows
    app_install="sudo pacman -S --needed";;
  Fed*)
    cow_dir=/usr/share/cowsay
    app_install="sudo dnf install -y";;
esac

function check_cowsay()
{
  which cowsay >& /dev/null || { echo "cowsay has not install,install it." && $app_install cowsay; }
}

function check_lolcat()
{
  which lolcat &> /dev/null || { echo "lolcat has not install,install it.";[ ${OS} == "Arch Linux" ] && $app_install lolcat || echo "Use manany way(for example:git )install lolcat!"; }
}

check_cowsay;check_lolcat

[ $? -eq 0 ] && {
echo -en "\e[1;33mDid you know that？\e[0m"
echo -en "\e[1;36m`whatis $(\ls /usr/bin /usr/sbin /bin /sbin 2>/dev/null|shuf -n1) 2>&1`\e[0m\n"|cowsay -f $(\ls ${cow_dir}|shuf -n1)|lolcat;
#[[ $? -eq 0 ]] && echo suceccess!|pv -qL 50 || echo failed
#[[ $? -eq 0 ]] && echo suceccess!|cowsay -f $(\ls /usr/share/cows|shuf -n1)|lolcat || echo failed
 #|cut -d. -f1)
 } || echo "The application has not executeable sucecessd,return."

unset cow_dir app_install
unset -f check_cowsay check_lolcat

