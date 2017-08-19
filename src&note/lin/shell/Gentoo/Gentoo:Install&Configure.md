    1  source /etc/profile
    2  export PS1="(chroot) $PS1"
    3   ls /boot/
    4   ls -a /boot/
    5   mkdir /boot/efi -vp
    6  mount /dev/disk/by-label/ESP /boot/efi
    7   df -h
    8   ping -c 2 www.baidu.com
    9  emerge-webrsync 
   10  emerge --sync --quiet
   11  eselect list
   12  eselect news list
   13  eselect news read
   14  eselect profile list
   15  eselect news list
   16  eselect profile set 8
   17  eselect profile list
   18  emerge --info|grep -i '^use'
   19  blkid
   20  swapon /dev/sda9
   21   vi /etc/portage/make.conf
   22  emerge --search vim
   23  emerge --search fbterm
   24  emerge --search freetype
   25   nano /etc/portage/make.conf
   26   ls
   27   cd
   28   ls
   29   dirs
   30  nano /etc/portage/make.conf
   31  export HISTCONTROL="ignoreboth:erasedups"
   32  emerge --config sys-libs/timezone-data
   33  emerge --ask app-editors/vim
   34  nano /etc/locale.gen 
   35  locale-gen 
   36  eselect locale list
   37  eselect locale set 3
   38  env-update && source /etc/profile && export PS1="(chroot) $PS1"
   39  emerge --ask vim
   40  emerge --ask sys-kernel/gentoo-sources
   41  cd /usr/src/linux
   42  make help
   43  make defconfig
   44  make menuconfig
   45  emerge --ask pciutils
   46  make -j4 && make modules_install
   47  make install 
   48  find / -type f -name ".keep" -exec rm -v '{}' ';'
   49  emerge --ask sys-kernel/genkernel
   50  emerge --ask iw 
   51  genkernel --install initramfs 
   52  emerge --ask sys-kernel/linux-firmware
   53  emerge --ask swig
   54  emerge --ask net-wireless/wpa_supplicant
   55  emerge --ask dhcpcd
   56  emerge --ask ip 
   57  emerge --ask --update --deep --newuse @world
   58  emerge --ask mc
   59  emerge --ask app-misc/mc
   60  emerge --ask fbterm
   61  emerge e2fsprogs 
   62  emerge --ask wireless-tools
   63  emerge --ask wpa_supplicant
   64  emerge --ask sys-boot/{grub:2,efibootmgr,os-prober}
   65  emerge --ask bash-completion
    1   cd
    2   ls
    3   ls -al
    4   history 
    5   cd -
    6   history 
    7   ll
    8   ls -al
    9   useradd 
   10   mount /dev/disk/by-label/Home /home
   11   groupadd kyzs
   12   useradd -m -d /home/user/Ootneg -g kyzs -G wheel -r -s /bin/bash ootneg
   13   passwd ootneg
   14   passwd 
   15   su - ootneg
   16   usermod 
   17   usermod -l ootng ootneg
   18   usermod -m -d /home/user/Ootng ootneg 
   19   usermod -m -d /home/user/Ootng ootng
   20   ls /home/user/
   21   rm -rf /home/user/tmp
   22    ls /home/user/
   23    vim
   24   ls
   25   pwd
   26   pwd
   27    mkdir /media/Others
   28   ls
   29   df 
   30   ls /
   31   df -h
   32    emerge --search ntfs
   33   cd /media/Others/Backup/lin/publicUser/config/
   34   ls
   35   ls -al
   36   id
   37   cd /home/external/sh
   38   ls
   39   ./profile.sh 
   40   source  profile.sh 
   41  emerge --ask app-admin/syslog-ng sys-process/cronie
   42  emerge --ask sys-apps/lsb-release
   43  emerge --ask sys-fs/{xfsprogs,jfsutils,dosfstools,btrfs-progs,reiserfsprogs}
