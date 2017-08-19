# 嵌入式第一课：Exynos4412开发板环境配置小结

# 嵌入式第一课：Exynos4412开发板环境配置小结

## 安装配置minicom

    
    
     ﻿​{content}nbsp;minicom -s

## 编译安装传输工具dnw

    
    
    {content}nbsp;tar -xf dnw-linux.tar.gz
    {content}nbsp;make && make install

## uboot烧写

$

$ ./sd_fusing.sh /dev/sdb  

## 安装/引导

### 查看分区

    
    
    TINY4412 # fdisk -p 1
    TINY4412 # fdisk -p 0

### 配置emmc分区

    
    
    TINY4412 # fdisk -c 1 320 809 524
    TINY4412 # fatformat mmc 1:1
    TINY4412 # ext3format mmc 1:2
    TINY4412 # ext3format mmc 1:3
    TINY4412 # ext3format mmc 1:4
    TINY4412 # emmc open 1
    TINY4412 # dnw 0x40000000  <==========> {content}nbsp;dnw E4412_N.bl1.bin
    TINY4412 # mmc write 1 0x40000000 0 0x10
    TINY4412 # dnw 0x40000000 <==========> {content}nbsp;dnw bl2.bin
    TINY4412 # mmc write 1 0x40000000 0x10 0x1C
    TINY4412 # dnw 0x40000000 <=======> {content}nbsp;dnw ../../u-boot.bin
    TINY4412 # mmc write 1 0x40000000 0x20c 0x21D
    TINY4412 # dnw 0x40000000 <=======> {content}nbsp;dnw E4412_tzsw.bin
    TINY4412 # mmc write 1 0x40000000 0x30 0xB8
    TINY4412 # emmc close 1
    

### 配置nfs文件系统

close iptables or add filter to iptables......

    
    
    {content}nbsp;service iptables stop
    {content}nbsp;chkconfig --level 235 iptables off //或者使用 setup停用iptables
    {content}nbsp;chkconfig --level 235 nfs on﻿​

Add rootfs abstract path to /etc/exports  and restart nfs server.

    
    
    {content}nbsp;vim /etc/exports
    # format: 
    /home/tmp/kernel *(rw)
    
    {content}nbsp;service nfs status
    {content}nbsp;service nfs start

### 测试

    
    
    TINY4412 # set bootargs console=ttySAC0 root=/dev/nfs rootfs=192.168.1.10 ip=192.168.1.20
    TINY4412 # set ipaddr 192.168.1.20
    TINY4412 # save
    TINY4412 # dnw 40008000 <===========> {content}nbsp;dnw zImage
    TINY4412 # bootm 4000800 //测试引导 
    {content}nbsp;ifconfig eth0 192.168.1.10

### 设置开发板引导参数

    
    
    TINY4412 # set bootargs console=ttySAC0 root=/dev/nfs nfsroot=192.168.1.10:/home/tmp/kernel ip=192.168.1.20
    TINY4412 # set bootcmd movi kernel 0 \;bootm 40008000
    TINY4412 # set ipaddr 192.168.1.20
    TINY4412 # save
    

### 刷写内核到开发板

    
    
    ﻿TINI4412 # fastboot <=========> ​{content}nbsp;./fastboot -w
    {content}nbsp;./fastboot flash kernel zImage
    TINY4412 # reset
    

### 引导系统

### 主机作为nfs server配置交叉编译工具  

### 交叉编译gcc

  

