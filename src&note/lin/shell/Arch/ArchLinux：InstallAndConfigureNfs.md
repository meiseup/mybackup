1.ssh
安装openssh-server openssh-client

profile:
/etc/ssh/ssh_config,/etc/ssh/sshd_config

ssh [options] [user@]host|ip [command]
+ options:
 * -p port:指定其它端口号.
 * -u user:指定用户名.
 * -c compression:指定是否需要将数据压缩之后在传输.

启动ssh服务：

 - cups
 systemctl start sshd.service

本机测试:
``` Bash
ssh -p port $USER@localhost 
```

sshfs允许将远程主机中的目录通过ssh的方式挂载或者映射到本地：
安装sshfs fuse软件包：
sshfs --help
一组选项使用逗号分隔:
sshfs user@ip|host:remount_dir local_mount_point [options]

+ options:
 * -o allowe_other 允许其它用户访问.
 * -o uid 指定用户uid
 * -o compression 允许数据在传输前压缩，节省带宽，网络流量
 * -o reconnect 允许断线自动重连

测试:

``` Bash
sshfs $USER@localhost:/tmp /mnt -o allow_other,compression=yes,uid=$UID
```

卸载可以使用常规卸载方式：
``` Bash
umount -v local_mount_point
```

或者:
``` Bash
fusermount -u local_mount_point
```


``` Bash
systemctl stop sshd.service
```


2.nfs
安装软件包:nfs-utils
profile:/etc/exports

exportfs工具允许修改了/etc/exports后不需重启nfs服务就可以应用更改.

挂载一个远程nfs系统到本地:
``` Bash
mount -vt nfs ip/host:dir local_mount_point
```

卸载:
``` Bash
umount -v local_mount_point
```

3.sambashare
