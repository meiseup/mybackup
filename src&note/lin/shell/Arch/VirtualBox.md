2017年 02月 16日 星期四 19:20:34 CST
VirtualBox的设置:
ssh登录到virtualbox虚拟机上安装的Linux系统，可能需要做几步设置
如果是windows，虚拟主机网络界面可能已经被设置好，而在Linux系统中的virtualbox可能仍需手动设置才能通过ssh登录到virtualbox中的Linux
管理 -> 全局设定 -> 网络
  ---> 仅主机(Host-Only)网络
  ---> 点击添加按钮之后virtualbox会自动设置好主机虚拟网络界面的ipv4地址(这个地址就是用来ssh到的virtualbox中的系统地址(如果已经开启了ssh服务的话))及掩码,还可以点击编辑按钮手动设置主机虚拟网络界面的ipv4地址及网络掩码

	端口转发设置：
选中一台虚拟机，单击工具栏设置
--> 网络 --> 展开高级
端口转发 --> 增加一个转发规则
设置主机端口和子系统端口
子系统端口是虚拟机中的系统的端口，主机端口可以和子系统端口一样

虚拟机中的系统设置:
初次安装的系统，可能还要允许sshd服务在开机时启动和配置防火墙规则以允许网络数据流量传递

init 使用SysV方式的系统比如centos 6.5
# chkconfig --level 2345 sshd on
或者手动将sshd链接到/etc/init.d目录下

init 使用systemd的系统:
# systemctl enable sshd

测试：
	$ ssh [-p port] [user@]192.168.56.1
VirtualBox虚拟机中CentOS挂载共享文件

虚拟机中添加共享文件夹

注：如果选择了自动挂载，系统会在开机时挂载共享文件夹.共享文件夹名称是随意的
设置-> 共享文件夹-> 单击添加共享文件夹按钮->  设置共享文件夹路径(物理磁盘路径)-> 设置共享文件夹名称，不能和共享文件夹路径名相同 

安装增强功能

挂载,以根用户权限挂载Virtualbox增强包镜像
# ll /dev/cdrom 
/dev/cdrom -> /dev/sr0
# mount -t iso9660 -r /dev/cdrom /mnt
# cd /mnt;./VBoxLinuxAdditions.run
# reboot

测试共享文件夹：
# mkdir /media/others
# mount -t vboxsf -o rw,uid=$UID,utf8=1 others /media/others


https://wiki.archlinux.org/index.php/File_systems_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)
vdfuse - Mounting VirtualBox disk images (VDI/VMDK/VHD).
挂载virtualbox
安装vdfuse(aur)
Dependencies:
fuse (fuse2)
virtualbox (virtualbox-bin, virtualbox-bin-5.0, virtualbox-headless)
virtualbox-sdk
pkgconfig (pkgconf-git, pkg-config) (make)
安装virtualbox fuse pkgcofig
# pacman -S --needed base-devel VirtualBox fuse

$ cd;mkdir build;pushd build;
$ git clone https://aur.archlinux.org/vdfuse.git
$ pushd vdfuse
$ makepkg -sr 
# pacman -U vdfuse-82a-11-x86_64.pkg.tar.xz

测试:
$ mkdir -pv /tmp/{Freebsd,Centos/disk{1,2}}
# vdfuse -t VHD -awv -f FreeBSD-11.0-RELEASE-amd64.vhd /tmp/Freebsd
# vdfuse -t VHD -awv -f Centos.vhd /tmp/Centos/disk1
# vdfuse -t VHD -awv -f home.vhd /tmp/Centos/disk2

$ pushd /tmp/Centos/disk1
$ ll -ha
$ file *
挂载虚拟卷
# mount Partition3 /media/Centos
# mount Partition1 /media/Centos/boot
# mount Partition2 /media/Centos/usr
# mount Partition4 /media/Centos/var
# mount ../disk2/Partition1 /media/Centos/home

# umount -v /media/Centos/{boot,usr,var,home,}

# umount /tmp/{Freebsd,Centos/disk{1,2}}

