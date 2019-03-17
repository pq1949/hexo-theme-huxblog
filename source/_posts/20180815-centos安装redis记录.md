---
title: centos安装redis记录
author: pq1949
catalog: true
header-img: ''
tags:
  - NoteBook
date: 2018-08-15 00:13:50
subtitle:
---

# 环境检查和更新

```
sudo yum install epel-release
sudo yum update

sudo yum install redis
```

# 启动
```
systemctl start redis

systemctl enable redis // 可选  开机自启动
```

# 验证
```
redis-cli ping  // return PONG
```

# 配置
## 持久化
```
--------- /etc/redis.conf-----------
appendonly yes
appendfsync everysec
------------------------------------

sudo systemctl restart redis // 重启生效
```

## 外部访问

默认redis 是只允许本机访问的
把配置文件中的 bind 127.0.0.1 注释就放开全网访问了，但是不安全，切记要设置一个复杂度比较高的密码

eg `requirepass 1231231khkh@1khk1h31hk!2@&!^%&%@!&`

只做测试使用的话上面的配置就够了，其他主从，副本集的配置可另做研究

## 客户端访问

windows上使用  Redis Desktop Manager
官网 https://redisdesktop.com/
下载地址  https://github.com/uglide/RedisDesktopManager/releases
![](/img/20180815-centos安装redis记录/20180815-centos安装redis记录-010727529.png)
![](/img/20180815-centos安装redis记录/20180815-centos安装redis记录-010754297.png)

## 命令行访问

```bash
redis-cli -h {host} -p {port}
auth pass
ping
keys *
```
默认是 127.0.0.1 6379


# 参考

https://www.linode.com/docs/databases/redis/install-and-configure-redis-on-centos-7/
