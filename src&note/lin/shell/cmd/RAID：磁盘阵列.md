CentOS 6.5

# RAID磁盘阵列其实就是磁盘组，从类型上分，可以分成硬RAID和软RAID。
# 硬RAID就是依据经过特殊设计的硬件架构，将多个物理硬盘使用特殊的结构组合到一起让操作系统认为是单个硬盘；软RAID就是使用软件来模拟真正的物理RAID。磁盘阵列多用作处理运算和备份。然而磁盘阵列由于存在设计上的缺陷，据说会降低CPU的工作效率.
# 软raid有多个级别，从0开始到15都有,raid0是安全高速的。
# 软RAID的创建方法：
# 准备软RAID成员,可以是分区，也可以是单个磁盘
sudo cfdisk /dev/sdb

# 接下来使用mdadm工具来创建RAID卷组
sudo mdadm -C|--create /dev/md0 --level=|-l 0 -v|--verbose -x 0 --number=|-n 4 /dev/sdb{1..4}

# 查看详情
sudo mdadm -D|--detail /dev/md0
cat /proc/mdstat

Create filesystem with raid:
sudo mkfs -t ext4 -L "Raid0" /dev/md0 

Mount Raid:
sudo mkdir /media/raid0
sudo mount -t ext4 -v /dev/md0 /media/md0

# 卸载RAID卷
sudo umount /dev/md0

# 停掉RAID设备
sudo mdadm -S|--stop /dev/md0 

# 重新分配RAID卷
如果系统内存中已经存在了RAID卷，应该先停掉之后再重新分配RAID卷组
cat /proc/mdstat
sudo mdadm -A /dev/md0 /dev/sdb{1..4}

service:mdmonitor 

# if this system reboot, the raid device is default: /dev/md127,execute fllowing command :
# 如果首次RAID配置状态没有写入配置文件/etc/mdadm.conf，mdadm服务在运行级2345上是也是启动的，那么系统重启后默认设备名称为/dev/md127.通过查看/proc/mdstat的信息可以验证这个结果。
cat /proc/mdstat

# 如果不希望这样，首先停掉RAID设备.默认的为/dev/md127
sudo mdadm -S /dev/md127
# remake raid device, current stat writed to /etc/mdadm.conf as root
# 重新配置raid设备并以root用户写入配置文件/etec/mdadm.conf中
sudo mdadm -A /dev/md0 /dev/sdb{1..4}
sudo -s
mdadm -Ds >> /etc/mdadm.conf

