
禁止Arch Linux启动时清除启动信息：
/etc/systemd/system/getty@tty1.service.d/
And Then,Touch file: noclear.conf
Add:
[Service]
TTYVTDisallocate=no

在systemd上,禁止tmp分区自动挂载为tmpfs
# systemctl mask tmp.mount
这会在/etc/systemd/system下创建一个指向/dev/null的符号链接tmp.mount

核心控制台滚动缓冲区大小设置：
传递内核参数：fbcon:scrollback=Nk,默认为32K
