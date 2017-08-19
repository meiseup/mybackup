addpart：

agetty：

blkdiscard：

blkid：

blockdev：

cal：

cfdisk：

chcpu：

chfn：

chrt：

chsh：

col：

colcrt：

colrm：

column：

ctrlaltdel：

delpart：

dmesg：

eject：

fallocate：

fdformat：

fdisk：

findfs：

findmnt：

flock：

fsck：

fsck.cramfs：

fsck.minix：

fsfreeze：

fstrim：

getopt：

hexdump：

hwclock：

i386：

ionice：

ipcmk：

ipcrm：

ipcs：

isosize：

kill：

last：

lastb：

ldattach：

linux32：

linux64：

logger：

login：

look：

losetup：

lsblk：

lscpu：

lsipc：

lslocks：

lslogins：

lsns：

mcookie：

mesg：

mkfs：

mkfs.bfs：

mkfs.cramfs：

mkfs.minix：

mkswap：

more：

mount：

+ mount挂载选项
> &nbsp;&nbsp;手动挂载一个磁盘或者分区是一件很繁琐的事儿，特别是文件系统还是vfat(exfat,fat16/fat32..)系列时。
在没有安装配置 gvfs 和所支持的文件系统驱动模块并启用系统默认文件管理器的`卷管理`之前，一些系统的文件管理器在检测到可移动磁盘插入之后不会自动挂载它.(即使已经在系统设置中勾选了，这也不会生效)。
> &nbsp;&nbsp;这时候只好手动挂载，但在挂载之前，还需要获取一些磁盘信息和挂载点信息.比如卷标或者块设备持久化设备名,要把磁盘或者分区挂到哪儿
如果需要在插入 移动磁盘后让系统的文件管理器自动挂载它，那就要：
 + 安装 gvfs 以及所需的文件系统工具和模块 
 + 启用默认文件管理器的`卷管理`并配置可移动驱动器。

Linux上已经有多个工具允许查看磁盘和分区信息。
lsblk可以以树型目录显示磁盘和分区。
lsblk的执行不需要超级用户权限.
$ lsblk  
blkid可以查看分区的信息，包括卷标，分区UUID和类型以及文件系统类型,但因为blkid指令允许直接查看分区UUID，因此这个指令要以根用户权限执行(不以根用户权限执行不会有任何问题也不会有任何显示,就像ip等可以操作配置网卡的工具一样)
`blkid`
fdisk工具可以直接操作系统磁盘分区，因此必须以根用户权限执行，即使仅仅使用fdisk -l来查看系统磁盘和分区信息也不行!
`fdisk -l`
除了这几个系统工具之外，还可以直接查看/dev(现代Linux使用的udev会在设备插入时自动检测并创建可用的持久化块设备文件和磁盘驱动信息)下的块设备文件
ll /dev/[s,h]d*
ll /dev/disk/by-{label,uuid,} 
 
> 而所谓的挂载点其实就是一个目录,理论上讲可以是除系统核心目录以外的任意位置(针对系统所谓的移动磁盘标准挂载点/media /mnt而言)，但这个目录最好应该是一个空目录。(不是空的其实也无所谓。如果将一个磁盘分区手动挂载到一个非空目录下，系统出于保护的原因，会让那个非空目录下原本的文件暂时隐藏而无法访问，直到挂载的分区被卸载时才会被系统释放).
man手册页提供的mount挂载参数太多太详细以至于竟有些理解不过来.
+ -o 选项
 > -o 可以说是`mount`最有用的一个参数了，但一旦带了这个参数，那整个命令就要以根用户权限执行。
一般格式是：
mount 选项 块设备 挂载点
除了-o选项允许使用逗号分隔多个选项之外
而块设备除了可以是获取的块设备持久化名外，还可以是卷标和UUID(当然得是以/dev/disk/by..开始的绝对路径)
 
Linux的文件权限控制是很严格的，因此除了自动挂载的vfat和ntfs系统之外，手动挂载vfat和ntfs的文件系统时都需要设置好挂载参数。
vfat系列文件系统挂载选项的中的uid选项是手动挂载时很有必要添加的，这个选项可以让普通用户正常使用磁盘而没有权限问题，iocharset和utf8选项使系统可以正常处理中文字符集。nouser选项允许任何用户卸载移动U盘。
尽管UUID对于磁盘和磁盘分区是唯一的标识符，但对于我来说仍然不习惯使用(那一串长长的由数字和字母组成的标识符让我望而生畏。），相较于UUID，卷标(volume)显然可读性更强，对于人类而言。而且更重要的是，一旦磁盘分区被重新格式化，分区的UUID就会重新被设置(这让我实在有点厌烦，因为如果没有及时更新系统的分区挂载表，启动系统就会进入一个所谓的安全shell。)，唯一变化不勤快的是卷标，我习惯格式化磁盘分区时也给一个卷标。

$ mkdir ./vfat -pv
# mount -t vfat -o rw,flush,utf8=1,iocharset=iso8859-1,uid=$UID /dev/sdb1 ./vfat
# mount -t vfat -o rw,utf8,uid=$UID /dev/disk/by-label/tmp ./vfat
/dev/sdb1         /media/TMP                vfat                   rw,nosuid,nodev,relatime,fmask=0022,dmask=0077,codepage=cp437,iocharset=ascii,shortname=mixed,utf8,flush,errors=remount-ro  0  0
/dev/sdb2         /media/xu_qiao_lin        ext4                   rw,seclabel,nosuid,nodev,relatime,barrier=1,data=ordered                                                                    0  0
/dev/sdb1 on /media/tmp type vfat (rw,nosuid,nodev,utf8=1,flush)
/dev/sdb1 /media/tmp vfat rw,nosuid,nodev,relatime,fmask=0022,dmask=0022,codepage=cp437,iocharset=ascii,shortname=mixed,utf8,flush,errors=remount-ro 0 0

mountpoint：

namei：

newgrp：

nologin：

nsenter：

partx：

pivot_root：

prlimit：

raw：

readprofile：

rename：

renice：

resizepart：

rev：

rtcwake：

runuser：

script：

记录终端会话的原始命令行工具：script
时序输出使用-t或者--timing=制定文件。如果不指定session_file，默认为itypescript
o如果使用了短的选项，时序信息会以标准错误的形式发送到终端，必须将它重定向为一个文件才能和session_file配合一起作为scriptreplay的输入文件才能产生播放一样的效果。
```bash
script -t 2>time_save [-a] [session_file]
```

像播放视频一样演示执行的指令及指令输出：scriptreplay
```bash
scriptreplay [-t] time [-s] session
```

尽管看起来很原始，而且还使用了两个文件来分别保存时序输出和命令输出。

一个很酷的选型是-f。 -f(--flush)选项可以用来同步一个终端窗口的输入和输出到另一个终端窗口。
在一个终端窗口中创建一个有名管道，并使用cat阻塞：
```bash
mkfifo fifo;cat fifo;
```

打开一个新的终端窗口，运行
```
script -f fifo
```

scriptreplay：

setarch：

setsid：

setterm：

sfdisk：

su：

sulogin：

swaplabel：

swapoff：

swapon：

switch_root：

taskset：

ul：

umount：

uname26：

unshare：

utmpdump：

uuidd：

uuidgen：

vigr：

vipw：

wall：

wdctl：

whereis：

wipefs：

write：

x86_64：

zramctl：

