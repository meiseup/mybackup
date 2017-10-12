#!/bin/bash -
# 此函数用来调整和查看显示器背光……
function sl()
{
  local tmp=/sys/class/backlight/intel_backlight/brightness
  if [ -r $tmp ];then
    if [ $# -eq 1 ];then 
      echo $1|${SUDO} tee $tmp >/dev/null
    else echo "sys light: `cat $tmp`"
    fi
  else echo "Intel video card driver maied not loading...."
  fi
  unset tmp
}


