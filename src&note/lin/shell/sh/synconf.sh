#!/bin/bash -
#ps aux|grep -v grep|grep -iO 'i3' &>/dev/null && :
# 启用触摸板轻触功能
# 单指：点击，双指：双击，三指：中键单击……
synclient TapButton1=1 TapButton2=3 TapButton3=2
