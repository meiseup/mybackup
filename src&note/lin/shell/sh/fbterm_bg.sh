#!/bin/bash - 
tmp=/home/external
echo -en "\e[?25l" #hide cursor
fbv -ciuker "${1:-$tmp/usr/share/backgrounds/fbterm.jpg}" << EOF
q
EOF
shift
unset tmp
export FBTERM_BACKGROUND_IMAGE=1
LANG="zh_CN.UTF-8" exec fbterm 
