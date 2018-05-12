---
title: ubuntu固定IP地址
date: 2017-10-22 20:58:44
categories: 笔记
tags: [ubuntu,ip]
---
```chef
sudo vi /etc/network/interfaces
```

```
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto ens33

#iface ens33 inet dhcp

iface ens33 inet static
address 192.168.1.8
netmask 255.255.255.0
gateway 192.168.1.1
```

```chef
sudo vi /etc/resolvconf/resolv.conf.d/base
```
```chef
nameserver 192.168.1.1
nameserver 220.170.64.68
```

```chef
sudo  vi /etc/resolv.conf
```
修改这个文件只是临时修改了一下 ，下次重启就又没有了，修改这个
/etc/resolvconf/resolv.conf.d/base 才会一直有效
