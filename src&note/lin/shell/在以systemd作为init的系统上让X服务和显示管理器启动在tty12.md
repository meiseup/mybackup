Arch Linux：
lxdm服务配置文件：/etc/lxdm/lxdm.conf
[base]
......
[server]
# arg used to start xserver, not fully function,默认为vt1
arg=/usr/bin/X -background vt12

# 设置背景图片
bg=/usr/share/backgrounds/default.jpg

lxdm的systemd单元服务文件:  
locate lxdm.service
/usr/lib/systemd/system/lxdm.service  <- /etc/system/system/display-manager.service 
[Unit]
....
Conflicts=getty@tty12.service plymouth-quit.service
After=systemd-user-sessions.service getty@tty12.service plymouth-quit.service

ps aux|grep X 的输出：
root      3456  1.7  3.1 652304 123272 tty12   Ssl+ 11:32   2:21 /usr/lib/xorg-server/Xorg -background none :0 vt12 -nolisten tcp -novtswitch -auth /var/run/lxdm/lxdm-:0.auth
arch      3496  0.0  0.0  21188  3260 ?        Ss   11:32   0:00 /bin/sh /etc/xdg/xfce4/xinitrc -- /etc/X11/xinit/xserverrc
....

