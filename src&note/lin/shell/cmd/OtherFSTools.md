lvm和raid磁盘阵列卷标修改工具
软raid卷工具mdadm

gfdisk/gdisk/parted/

ntfs
xfs
jfs
resizefs
btrfs
hfs|hfs+

iso9660/UDF文件系统
mkisofs/genisoimage
eject

fat卷系列卷标修改工具mlabel
mlabel命令由mtools软件包提供，然而，并不是所有的Linux发行都会会默认安装mtools软件包
注：修改fat卷的卷标钱之前可能需要先行挂载fat卷，然后使用mlabel指令修改fat卷卷标。新卷标名前有两个冒号::
# mlabel /dev/sdb1 ::work
# mlabel ::"XU_QIAO_LIN" -i /dev/sdb1

