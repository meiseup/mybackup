# Install Arch Linux Base System  from USB 2017-1-21 16:40:00 #
-- 本次安装的 Arch Linux 从 UEFI 启动，使用 grub2 引导加载器，init 使用的是 systemd
+ 首先无论你使用什么样的方式都应该：准备 Arch Linux 光盘镜像（除了选择从网络引导）。
DownLoad ArchLinux20160301 ISO Image，检验md5校验和及sha1值，确认无误之后，挂载它。

-- 如果你不打算在 windows 上使用光盘来刻录，而是打算在 Linux 上使用 U 盘，那么你可以……
+ 直接使用 dd 或者 cat 来制作启动盘。确认系统已经准备就绪，以根用户执行：
``` Bash
dd if=./arch....iso of=/dev/sdb
```

或者如果你希望被用作启动盘后的 U 盘仍然可以当作普通的磁盘读写，那么可以尝试：
 + 转换 U 盘分区表为 GPT（这种方式同样支持 windows 8），并创建一个 fat32 的首分区（如果你有给 U 盘创建多分区的打算的话）。然后挂载 U 盘首分区和 Arch Linux iso 并复制 iso 里的所有文件到 U 盘首分区。

> &nbsp;&nbsp;如果U盘是MBR分区表，则应该将它转换U盘分区表为gpt。这样做有一个好处，那就是无需对U盘重新格式化。
复制ISO镜像中的所有目录和文件到U盘根目录下(最好备份U盘文件，也可以将之前文件和目录集中放到一个临时目录下避免与Arch系统文件和目录出现混淆)，这种方式支持直接在UEFI下启动，但不支持老式的Leng...启动方式。如果U盘卷标是中文的，则应该重设卷标为英文，最好直接改成与镜像文件挂载上的卷标一样
制作启动盘的方式是多样的。可以在Linux环境下使用命令来完成也可以在windows使用第三方工具(大名鼎鼎的软碟通制作出来的启动盘并不支持UEFI方式启动)来完成启动盘的制作

或者如果你有一个 Linux 系统使用的是 UEFI 和 grub2 引导，那么可以尝试：
 + 直接从 iso（iso 文件放在 ntfs 分区会有问题)文件启动。方法是：在 /etc/grub.d/40-custom 脚本中添加自定义菜单项并更新 grub 配置文件。

========================= file: /etc/grub.d/40-custom ======================
 ```Bash
#!/bin/sh
exec tail -n +3 $0
# This file provides an easy way to add custom menu entries.  Simply type the
# menu entries you want to add after this comment.  Be careful not to change
# the 'exec tail' line above.
#menuentry "Microsoft Windows BootMgr" {
#	echo "Loadding Microsoft Windows BootMgr...."
#	insmod part_gpt
#	insmod fat
#	#insmod search_fs_uuid
#	insmod chain
#	search --no-floppy --set=root --hint-bios=hd0,gpt1  --hint-bios=hd0,gpt1 --hint-efi=hd0,gpt1 --hint-baremetal=ahci0,gpt1 --label ESP
#	#search --set=root --no-floppy --hint-bios=hd0,gpt1 --hint-efi=hd0,gpt1 --hint-baremetal=ahci0,gpt1 --fs-uuid 0000-4823
#	chainloader /EFI/Microsoft/Boot/bootmgfw.efi;
}

submenu "Linux Live" {
set partition="6"
	menuentry "Arch_201701" --class iso { 
		set iso="/external/iso/archlinux-2017.06.01-x86_64.iso"
		loopback loop (hd0,$partition)$iso
		linux (loop)/arch/boot/x86_64/vmlinuz archisolabel=ARCH_201706 img_dev=/dev/sda$partition img_loop=$iso earlymodules=loop
		initrd (loop)/arch/boot/x86_64/archiso.img
	}

  menuentry "Ubuntu-16.04-dekstop"{
		set iso="/external/iso/ubuntu-16.04-desktop-amd64.iso"
		loopback loop (hd0,$partition)$iso
		linux (loop)/casper/vmlinuz.efi boot=casper iso-scan/filename=$iso noquiet noject splash --
		initrd (loop)/casper/initrd.lz
	}

  menuentry "XUbuntu-16.04.2-dekstop amd64"{
		set iso="/external/iso/xubuntu-16.04.2-desktop-amd64.iso"
		loopback loop (hd0,$partition)$iso
		linux (loop)/casper/vmlinuz.efi boot=casper iso-scan/filename=$iso noquiet noject splash --
		initrd (loop)/casper/initrd.lz
	}

	#menuentry "Fedora 23 Workstation"{
	#	insmod iso9660 
	#	insmod loopback
	#	set iso="/tmp/iso/Fedora-Live-Workstation-x86_64-23-10.iso"
	#	loopback loop (hd0,$partition)$iso
	#	linux (loop)/isolinux/vmlinuz0  iso-scan/filename=$iso rootfstype=auto root=live:CDLABEL=Fedora-Live-WS-x86_64-23-10 ro rd.live.image noquiet norhgb rd.luks=0 rd.md=0 rd.dm=0
	#	initrd (loop)/isolinux/initrd0.img
	#	}

	#menuentry  "Fedora 24 Workstation"{
	#	insmod iso9660 
	#	insmod loopback
	#	set iso="/tmp/iso/Fedora-Workstation-Live-x86_64-24-1.2.iso"
	#	#search -no-floppy --label --set=root 
	#	loopback loop (hd0,$partition)$iso
	#	linux (loop)/isolinux/vmlinuz  iso-scan/filename=$iso root=live:CDLABEL=Fedora-WS-Live-24-1-2 rootfstype=auto  ro rd.live.image noquiet norhgb rd.luks=0 rd.md=0 rd.dm=0
	#	initrd (loop)/isolinux/initrd.img
	#	}

	menuentry "Fedora 23 Workstatic_Xfce"{
		insmod iso9660 
		insmod loopback
		set iso="/external/iso/Fedora-Live-Xfce-x86_64-23-10.iso"
		#search -no-floppy --label --set=root 
		loopback loop (hd0,$partition)$iso
		linux (loop)/isolinux/vmlinuz0  iso-scan/filename=$iso rootfstype=auto root=live:CDLABEL=Fedora-Live-Xfce-x86_64-23-10 ro rd.live.image noquiet norhgb rd.luks=0 rd.md=0 rd.dm=0
		initrd (loop)/isolinux/initrd0.img
	}
}
```


> 准备ArchLinux分区，文件系统须为Linux文件系统(ext2...ext4,xfs,jfs,Btrfs....),这一步不是必须的。

- /
- home
- swap 即使我的系统有足够的内存，但我仍然决定启用交换分区，因为我没有休眠系统的习惯。

-- 如果已经准备好了启动盘和规划好了系统分区，则重启系统选择一个驱动器，或者将U盘设为第一启动

-- 如果一切顺利，则会出现Arch的引导菜单(如果使用自定义的制作启动盘的方式，并且没有将U盘卷标设为镜像文件挂载之后的卷标，则务必编辑引导菜单中的label的值部分,在这里，默认值为系统名称和发行时间。应该将lable值改为改为U盘卷标名)，然后回车引导系统
如果顺利，则会初始化多个虚拟控制台，并且在第一个控制台tty1出现一个命令提示符，否则会卡在挂载文件系统这一项系统任务上。

-- 后期版本的Arch系统并没有图形界面包括伪图形界面的安装引导程序，所以，所有安装任务都需要使用Linux命令完成。Live系统默认采用的shell是zsh,并且提供了bash，/root 目录下的 install.log 简要的叙述了安装步骤


+ 配置时区和更新系统本地时间。  
新的Arch Linux采用了systemd管理系统，一些旧的工具可能不能正常使用。
+ 使用`ntp`同步时间服务器更新系统时间。
+ 直接使用date工具来更改，然后写入BIOS
```Bash
date -s "2016-1-10 20:00:00"
```

+ 使用hwcolock或者clock工具。
```Bash
hwcolok --show|-r 显示硬件时间 -s 将硬件始终设置为当前时钟。
```

## Update system date and timezone
```Bash
timedatectl set-ntp true
timedatectl set-time "" 
timedatectl set-localtime-rtc true
# Or
date -s "" && hwcolock -w --localtime
hwcolock -w --localtime
```

### set network(only wifi and  used wpa2)
```Bash
# 如果你使用的以太网工作不正常
systemctl restart dhcpcd@enp2s0.service
# 或者
systemctl stop dhcpcd@enp2s0.service
ifconfig enp2s0f1 up
dhcpcd enp2s0f1 
```

```Bash
# If 你使用的 wifi 而且 SSID 使用的是 wpa 及更高加密方式，only run：
wifi-menu
# Or
# 确认并打开网络接口准备扫描无线网络：
ifconfig -a
ip link set wlp3s0 up # ifconfig wlp3s0 up
iw [dev] wlp3s0 scan[|grep -i ssid]
# if ... already knowned ssid and psk,use 
wpa_supplicant -iwlp3s0 -c<(wpa_passphare "ssid" "psk") -B && dhcpcd wlp3s0
```

### Set mirrorlist
```Bash
cd /etc/pacman.d
grep -i -A1 "china" mirrorlist | vim -
# 编辑软件源配置文件之后需要初始化源和软件源钥匙环文件(gpg)
pacman-key --init && pacman-key --populate archlinux
pacman -Syy
```

-- 如果你打算使用 UEFI 来引导系统，并且第一分区因为已经存在其它操作系统而已经是启动分区，则不应该格式化这个分区，这个分区是UEFI的启动分区。通常它位于第一分区，如果磁盘上不存在什么恢复分区的话。

-- 如果你不打算使用 UEFI，那么以下的磁盘分区方案和 grub 安装引导方式不适合您的计算机，你可能需要再次查看 Arch Linux wiki.

-- boot目录下用于安装系统内核和初始化文件系统，这个目录名称最好不要随意更改,为了不将引导和内核混在一起，/boot/efi

Set partitions
```Bash
cfdisk /dev/sda
mkfs -t ext4 -L "Arch" /dev/sda2 
mkfs -t xfs -L "Home" /dev/sda3
# 
mkswap -L Swap /dev/sda9
swapon /dev/sda9
# 
mkdir -pv /mnt/{home,boot/efi} /media/tmp
mount /dev/disk/by-label/Arch /mnt
mount -t xfs /dev/disk/by-label/Home /mnt/home
mount /dev/sda1 /mnt/boot/efi
mount -v --bind /media/Others /mnt/media/tmp
```

```Bash
mkdir -pv /mnt/boot/efi
mount -vw -t vfat /dev/sda1 /mnt/boot/efi #将系统efi分区挂载到/mnt/boot/efi目录下
# 如果没有 EFI 分区而又打算使用 UEFI 启动：
mkfs.vfat -F32 -s1/-s2 -v esp /dev/sdab1
```

## Install the base system
```Bash
pacstrap [-i] /mnt base base-devel net-tools
```

## Chroot 
### Chroot 之前必要的准备工作:  
+ 安装iw iproute2 wpa_supplicant dialog 和软件包组 net-tools & 复制 /etc/resolv.conf 到新系统    
```Bash
pastrap -i --needed iproute2 iw wpa_supplicant dialog wireless_tools
cp -Libv /etc/resolv.conf /mnt/etc/
pacstrap -i --needed vim
```

+ 配置更新文件系统挂载表/etc/fstab  
```Bash
# genfstab脚本从指定的根生成文件挂载表文件/etc/fstab ：
# create fstab use volume label
genfstab -p -L /mnt >> /mnt/etc/fstab
less /mnt/etc/fstab
```

+ 准备 chroot，arch-chroot 脚本已经正确配置了chroot环境。  
```Bash
arch-chroot /mnt /bin/bash
```
 
-- 如果没有 arch-chroot 脚本，则需要手动(正常的chroot环境包括根 /  其它的分区,比如home分区(这并不是必须的)以及(Live系统环境)挂载必需的虚拟文件系统，这些虚拟文件系统需要使用绑定挂载选项来挂载到目标系统中。它们包括 

+ devtmps     
```Bash
mount --bind -v /dev /mnt/dev
```
+ dev/pts   
```Bash
mount -vt devpts devpts /mnt/dev/pts
```
+ proc    
```Bash
mount -vt proc none /mnt/proc
```
+ sys       
```Bash
mount -vt tmpfs tmpfs /mnt/sys
```
+ run   
```Bash
mount -vt tmpfs tmpfs /mnt/run
```
+ 然后手动chroot    
```Bash
chroot /mnt /bin/bash
```

## Configure System ##
+ set date and timezone
```Bash
ln -sfv /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
date -s ""
hwcolock -w --localtime
```

+ Install 常用 Program
```Bash
.....
```

+ Set Hostname and Host Langugaes And native charset：
```Bash
echo LANG='"en_US.UTF-8"' > /etc/locale.conf
vim /etc/locale.gen && locele-gen
echo 'Arch' > /etc/hostname
vim /etc/hosts
```

+ 生成内核镜像和系统初始化镜像
```Bash
mkinitcpio -p linux
```

+ Set root password And Configure Users
```Bash
passswd
groupadd kyzs
useradd  -g kyzs -G wheel,audio,video -s /bin/bash -r -d /home/user/Ljca ljca 
passwd ljca
```

+ Install Grub to the Disk boot partition And Update Grub Configure
```Bash
pacman -S --needed os-prober grub efibootmgr dosfstools
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=Arch --boot-directory=/boot/efi/EFI/Arch --compress="xz" --debug
```

+ Then Update Grub Configure:
```Bash
grub-mkconfig -o /boot/efi/EFI/Arch/grub/grub.cfg
# Or grub-mkstandalone --directory="/usr/lib/grub/x86_64-efi" --format="x86_64-efi" --compress="xz" --output="arch_grub.efi" "boot/grub/grub.cfg=/tmp/grub.cfg"
```

+ sync disk
```Bash
sync;sync;sync;sync;sync;sync;sync;
```

+ Exit Chroot Enviroment
`exit` Or Ctrl D 

+ umount partition
```Bash
# 如果无法卸载文件系统，则需要使用-R选项来强行卸载文件系统，/media是系统挂载点
umount -R /mnt/{home,boot/efi,}
```

+ Reboot system and remove install media.
```Bash
reboot
```
## Install before

一键恢复从系统源中安装的软件：
pacman -S --needed `cat pacqnq.log`

xorg and nvidia drivers
 - xorg-drivers
 - nvidia{,-settings,-utils} nvidia-libgl bumleyee 
 - bbswitch

desktop enviraments
 - xfce4 lxdm xfce4-goodies
 - archlinuxcn-keyring
 - powerline-fonts
Screen Locker
 - xscreensaver
 - xtrlock

themes
 - xcursor-themes
 - arc-icon-theme mate-themes numix-themes 
 - mate-themes
 - humman(AUR)

Network Browser
 - lynx elinks chromium firefox firefox-i18n-zh-cn 
 - flashplugin pepper-flash
 - freshplayerplugin

Others Applications
 - mc docky 
 - medit mousepad leafpad
 - leanote
 - cowsay screenfetch pv lolcat
 - cowfortune{,-mod}
 - cowfortune fortune-mod

Terminal 
 - bash-completion bashdb bashrun 
 - bash-bats
 - zsh zsh-syntax-highlighting zsh-completions zsh-doc grml-zsh-config zshdb zsh-lovers oh-my-zsh-git
 - scrot 
 - guake,tilda
 - fbterm fbset fbv fbreader jfbview fbgrab fbcat 
 - cscope & ctags 

filesystem
 - ntfs-3g
 - linux-utils
 - linux-tools
 - squashfs-tools
 - gvfs
 - fatsort exfat-utils 
 - mtools
 - dosfstools
 - sshfs
 - nfs
 - iso-codes 

Input-method:
 - fcitx{,-configtool,-fbterm}
 - fcitx-libpinyin fcitx-sunpinyin
 - fcitx-{gtk2,gtk3}
 - fcitx-qt{4,5}

 - virtualbox
 
 Muilti codec coder decoder
 - alsa-lib: Advanced Linux Sound Arch. output
 - alsa-firmware alsa-plugins alsa-tools alsa-utils alsaplayer 

 - a52dec: liba52 is a free library for decoding ATSC A/52 streams
 - faac: FAAC is an AAC audio encoder
 - faad2: ISO AAC audio decoder
 - flac: Free Lossless Audio Codec,FLAC input, FileWriter FLAC output
 - jasper: A software-based implementation of the codec specified in the emerging JPEG-2000 Part-1 standard
 - lame: An MP3 encoder and graphical frame analyzer - lame: FileWriter MP3 output
 - mpg123: MP3 input
 - jack2: Jack Audio Connection Kit output
 - ffmpeg: ffaudio input
 - fluidsynth: MIDI FluidSynth backend input
 - x264: Free library for encoding H264/AVC video streams
 - x265
 - wavpack: Audio compression format with lossless, lossy, and hybrid compression modes - wavpack: WavPack input
 - xvidcore: XviD is an open source MPEG-4 video codec)
 - libcue: CUE playlist format
 - libdca: Free library for decoding DTS Coherent Acoustics streams
 - libdv: The Quasar DV codec (libdv) is a software codec for DV video
 - libmad: A high-quality MPEG audio decoder
 - libmpeg2: libmpeg2 is a library for decoding MPEG-1 and MPEG-2 video streams
 - libtheora: An open video codec developed by the Xiph.org
 - libvorbis: Vorbis codec library - libvorbis: Vorbis input, FileWriter Vorbis output
 - libxv: X11 Video extension library
 - libmodplug: modplug input

 - gst-transcoder gstreamermm  gst-plugins-bad
 - gst-plugins-base gst-plugins-good gst-libav
 - libcanberra-gstreamer libcanberra-pulse
 - pulseaudio: PulseAudio output
 - libcdio-paranoia: CD Digital Audio input
 - libsidplayfp: Commodore 64 audio input

 - audacious
 - audacious-plugins
 - dbus-glib: Gnome Shortcuts Plugin
 - libsamplerate: Speed and Pitch Plugin
 - libnotify: libnotify OSD
 - lirc: LIRC
 - curl: AudioScrobbler Client
 - libmtp: Upload to MTP device
 - neon: neon-based http transport
 - libmms: libmms-based mms transport

 - multimedia
 - audiofile libmikmod 
 - mplayer
 - smplayer{,-themes,-skins}
 - vlc
 - fluidsynth
 - simplescreenrecorder
 - moc
 - netease-cloud-music
 - RhythmCat(AUR)
 - deadbeef(AUR)
 - osdlyrics
 - audacious 
 - pulseaudio opusfile
 - pulseaudio-alsa


压缩/解压/打印/字典
 - p7zip
 - cups cups-pdf
 - stardict
 - espea


Build:
 - abs
 - yaourt(AUR)
 - aurvote customizepkg
 - git subversion 

 - tk perl-term-readkey perl-net-smtp-ssl perl-authen-sasl cvsps2
 - gnome-keyring-sharp
 - gnome-keyring

 - x11-ssh-askpass

System:
 - cpupower
 - acpid
 - hdparm sdparm ethtool python2-pyside
 - bluez-utils
 - openbsd-netcat
 - laptop-mode-tools(AUR)
 - alsaequal(AUR)

 - qtcurve-gtk1 qtcurve-gtk2 
 - driconf



> &nbsp;&nbsp;/etc/xprofile，~/.xprofile文件会被gdm,lightdm,lxdm等登录管理器读取，然而在~/.xprofile中export LANG="zh_CN.UTF-8"之后,xfce4-terminal终端字体如果是Monospace时，反引号字符'`'不能正常显示在xfce4-terminal终端上(反引号字符'`'始终显示为单引号字符'''),终端字体设置成其它的字体就可以正常显示。

```Bash
pacman -Ql systemd | grep '\.mount$'
```

