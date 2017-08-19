# Fedora Xfce 23 桌面安装与配置指东 #
## 安装 ##
### grub2配置 ###
> 从iso启动的Linux Live系统的所在文件系统不能在Linux Live环境中被再次挂载(如果一定要挂载，可以传递--bind参数以绑定挂载的方式)
> 安装时也手动配置了这个分区，安装程序在应用更改时会失败并导致安装程序中断faild
> iso文件所在home分区已经以只读方式被挂载到Fedora live环境中,再次自动挂载到安装环境会失败

--------
## 配置 ##
### 源配置: ###
+ 备份系统源
  ``` Bash
  cd /etc/yum.repos.d
  mkdir bk
  mv *.repo bk
	```

+ 添加 Fedora Ustc 源:
+ 添加 rpmflusion 源:
fedora 21 及以上版本启用 rpmflusion 源
``` Bash
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
su -c 'dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm'
```

+ Fedora 中文源:
``` Bash
dnf config-manager --add-repo=http://repo.fdzh.org/FZUG/FZUG.repo
dnf install http://repo.fdzh.org/FZUG/free/23/x86_64/fzug-release-23-0.1.noarch.rpm
wget http://repo.fdzh.org/FZUG/FZUG.repo -P /etc/yum.repos.d/
```

+ 刷新软件源，建立源元数据，源缓存，更新系统
``` Bash
dnf clean all
dnf makecache
dnf update -y
```

+ 软件

+ 安装 vim
> 已知 vim 和系统 vim-minimal 有冲突,并且在卸载 vim-minimal 时会同时卸载 sudo，因此

-----
``` Bash
sudo -s
dnf erase vim-minimal
dnf install vim sudo
```

+ 主题
 - gtk-thems：mate-themes
 - iocn 主题： humanity-icon-theme|numix-icon-theme
 - xfwm4-themes
 - emerald-themes
 - emerald-themes-extra
 - bluebird-metacity-theme
 - light-gtk2-theme
 - light-gtk3-theme
 - light-theme-gnome
 - light-metacity-theme
 - echo-icon-theme
 - mono-icon-theme
 - nimbus-icon-theme
 - fusion-icon
 - fusion-icon-gtk
 - humanity-icon-theme
 - numix-icon-theme
 - gtk-update-icon-cache
 - numix-icon-theme-circle
 - elementary-icon-theme
 - elementary-xfce-icon-theme
 - monochrome-icon-theme
 - emerald-themes-extra
 - emerald-themes


 - cursor 主题 [Arch Linux xcursor-themes 软件包](https://)

 ``` Bash
 tar -xf xcursor-themes.tar.pkg.xz
 cp -r usr/share/icon/* /usr/share/icon/
 cp -r usr/share/license /usr/share/license/
 ``` 

+ 窗口管理器
 - compiz-xfce
 - libcompizconfig
 - compiz-plugins-unsupported
 - compiz-plugins-experimental
 - compiz-plugins-extra
 - compiz-plugins-main
 - compiz-manager
 - compizconfig-python
 - compiz
 - simple-ccsm
 - ccsm

+ 字体配置
``` Bash
git clone https://github.com/FZUG/repo.wiki.git
dnf config-manager --add-repo=http://repo.fdzh.org/FZUG/FZUG.repo
dnfi freetype-infinality fontconfig-infinality cairo-infinality-tools cairo-infinality
dnfi --allowerasing freetype-infinality fontconfig-infinality cairo-infinality-tools cairo-infinality
sudo cp /usr/share/doc/freetype-infinality/infinality-settings-generic /etc/profile.d/infinality-settings-generic.sh
sudo cp /usr/share/doc/freetype-infinality/infinality-settings.sh /etc/X11/xinit/xinitrc.d/ -v
sudo chmod a+x /etc/X11/xinit/xinitrc.d/infinality-settings.sh 
```

> 多媒体解码器都包含在 rpm-flusion 源中，正确配置 rpm-flusion 源必不可少

--------
+ 多媒体及解码器:
 - `gstreamer1-plugins*`
 - `gstreamer-plugins-bad-free*  gstreamer1-plugins-base*`
 - `gstreamer-plugins-bad-free*  gstreamer1-plugins-base*  gstreamer-plugins-bad-nonfree`
 - `gstreamer-plugins-bad-free*  gstreamer1-plugins-base*  gstreamer-plugins-bad-nonfree`
 - `gstreamer-plugins-bad gstreamer-plugins-bad-free-extras gstreamer-plugins-ugly gstreamer-ffmpeg gstreamer1-libav gstreamer1-plugins-bad-free-extras gstreamer1-plugins-bad-freeworld gstreamer-plugins-base-tools gstreamer1-plugins-good-extras gstreamer1-plugins-ugly gstreamer1-plugins-bad-free gstreamer1-plugins-good gstreamer1-plugins-base gstreamer1`
 - `gstreamer-plugins*`
 - `flac h264enc x265 x265-libs x264 vo-aacenc mencoder vo-amrwbenc mppenc`
 - `lame lame-libs lame-mp3x`
 - `libogg liboggz`
 - `libvorbis`
 - `xvidcore xvid4conf`
 - `libdca`
 - `faad2 faad2-libs`
 - `audacious-plugins-freeworld-ffaudio`

```
dnf list | grep gstre|grep docs|cut -f1|cut -d. -f1|xargs)
```

+ 多媒体播放器
 - mpv
 - mpv-devel libmpv
 - mplayer mplayer-gui mplayer-tools 
 - `smplayer{,-themes}`
 - vlc vlc-extras vlc-plugin-jack 
 - moc
 - kwplayer netease-cloud-music [Fedora 中文源]()
 - [RhythmCat]() [编译]
 - easytag
 - osdlyrics
 - simplescreenrecorder

+ 词典
	- `stardict{,-*}`

+ 浏览器
 - lynx
 - elinks
 - links
 - opera
 - firefox 
 - [chromium 浏览器](https://repos.fedorapeople.org/repos/spot/chromium/fedora-chromium-stable.repo) 注：这个源似乎不能正常访问
``` Bash
wget https://repos.fedorapeople.org/repos/spot/chromium/fedora-chromium-stable.repo -P /etc/yum.repos.d/
dnf makecache
dnf install chromium
```

+ Develop Envraoment
 - bash-completion
 - gcc
 - gcc-c++
 - `libstdc++{,-devel}`
 - ctags

+ System Server
 - openssh-server openssh-clients  fuse-sshfs  
 - screenfetch
 - dnf-plugins-core fedora-repos-rawhide

+ FileSystem
 - ntfs-3g ntfsprogs
 - exfat-utils fuse-exfat

 - VirtualBox

+ Shell
 - csh
 - tcsh
 - zsh
  + Zsh 插件
  * autojump-zsh
  * gromacs-zsh
  * zsh-html
  * herbstluftwm-zsh
  * docker-zsh-completion
  * vim-syntastic-zsh
 - ksh

 - git git-gui subversion git-svn 
 - qconf
 - python-pyside 
 - git git-gui subversion git-svn 
 - qt3 qt3-config qt
 - npm
 - [mode-html-to-text](https://github.com/werk85/node-html-to-text.git) Install：`npm  install html-to-text -g`

+ Game
 - gnome-chess
 - lolcat[git](https://github.com/busyloop/lolcat) Install: `npm install lolcat`
 - pv
 - fortune
 - fortune-mod fortune-firefly
 - figlet
 - cowsay cowsay-beefymiracle xcowsay

+ Terminal
 - fbterm
 - fbterm-udevrules
 - terminology 
 - tmux
 - tilda
 - guake-terminal

+  工具
+ System's Tool
 - udev-browse
 - system-config-printer-udev
 - umockdev

+ Picture's Tool
 - feh
 - ImageMagick rubygem-rmagick  ImageMagick-libs 

+ Iconv Tools
 - emerald
 - driconf
 - volumeicon
 - uniconvertor
 - gtrayicon
 - icoutils
 - kiconedit

+ 桌面组件
 - docky
 - mc
 - gnome-epub-thumbnailer
 - axel 
 - evince&amp;evince-browser-plugin 
 - [tumbler]() [编译]
 - tumbler-extras
 - gnome-epub-thumbnailer

+ 输入法
 - fcitx fcitx-fbterm `fcitx-gtk* fcitx-qt*`
 - imsettings-info 
 - sogoupinyin
 - bsdtar

+ TextEditor
 - monodevelop
 - bluefish
 - retext
 - mousepad
 - leafpad
 - texstudio
 - lmms 
 - [medit](https://) [编译]

+ Android
 - android-tools

+ Fedora 上的 yaourt
> 安装 yaourt 注：yaourt 在 Arch Linux fr 源，但是在 Arch Linux 中文源中也有。因为系统架构类似,现在也被移植到了 Fedora 系统中，包含在了 Fedora 中文源中
 
--------
``` Bash
dnf install -y yaourt
```

+ 配置 pacman `/etc/pacman.conf` &amp; yaourt `/etc/pacman.d/mirrorlist`

+ 刷新软件源:
``` Bash
pacman -Syy
```

