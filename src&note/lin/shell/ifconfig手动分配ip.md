## 如果您在 Linux 上使用以太网并打算手动分配 IP
1. find network adapter interface name
```Bash
ifconfig -a # Or ip
```

-- Running this commands must be as root！

2. 给以太网适配器添加一个 IP，手动分配 IP,example：
```Bash
# ifconfig [dev] address [broadcase address] [netmask address]
ifconfig enp2s0f1 192.168.2.21 broadcast 192.168.2.255 netmask 255.255.255.0
```

3. add default GetWay,example：
```Bash
route add default gw 192.168.2.1
```

4. add defafult DNS Server,example

========== file /etc/resolv.conf ==========
> nameserver 192.168.0.1

## 动态分配 IP：
可选：open eth... adapter interface,example：
```Bash
ifconfig enp2s0f1 up # OR ip link set enp2s0f1 up
```

2. dhcpcd……
```Bash
dhcpcd enp2s0f1
```

