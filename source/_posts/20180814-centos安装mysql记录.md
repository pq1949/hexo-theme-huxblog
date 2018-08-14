---
title: centos安装mysql记录
author: pq1949
catalog: true
header-img: ""
tags:
  - NoteBook
date: 2018-08-14 17:32:45
subtitle:
---

## 确认系统环境
```bash
cat /etc/redhat-release
```

## 更新环境
```
sudo yum update
```

## 检测系统是否自带安装mysql
```bash
yum list installed | grep mysql

rpm -qa|grep -i mysql
```

如果安装过需要卸载的话用`rpm -e `软件包名  来卸载
```
rpm -e mysql　　// 普通删除模式
rpm -e --nodeps mysql // 如果使用上面命令删除是失败，则用该命令可以对其进行强力删除
```

## 使用yum命令进行mysql的安装
```
yum list | grep mysql // 查看yum上提供下载的mysql的版本信息
```

## 安装MYSQL
  1. 安装对应仓库
```
wget http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
sudo rpm -ivh mysql-community-release-el7-5.noarch.rpm
yum update
```
  2. 开始安装
```
sudo yum install mysql-server
sudo systemctl start mysqld // 启动
ps -ef |grep mysql // 检查是否启动
netstat -anpl |grep 27524
```
需要切换到root用户才可以看到端口信息
![](/img/20180814-centos安装mysql记录/182303279.png)

## 使用MYSQL

### 查看版本
```
mysql --version
```
`mysql  Ver 14.14 Distrib 5.6.41, for Linux (x86_64) using  EditLine wrapper`

### 安全加固
```
sudo mysql_secure_installation
```

### 登录
```
mysql -u root -p // 输入密码登录
```
![](/img/20180814-centos安装mysql记录/183326707.png)

### 建库创建新用户
```
create databse testdb;
grant all on testdb.* to 'testuser' identified by 'password'; // 创建用户同时赋予啊testdb的访问权限
show databases;
flush privileges;
```
![](/img/20180814-centos安装mysql记录/183757772.png)

### 切换用户登录
```
mysql -u testuser -p
```
![](/img/20180814-centos安装mysql记录/184059751.png)

### 建表
```
use testdb;
show tables;
create table customers (customer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, first_name TEXT, last_name TEXT);
show tables;
```
![](/img/20180814-centos安装mysql记录/184237430.png)


## 忘记密码找回
```
sudo systemctl stop mysqld
sudo mysqld_safe --skip-grant-tables &

mysql -u root

use mysql;
update user SET PASSWORD=PASSWORD("new password") WHERE USER='root'; // 设置新密码
flush privileges;
exit

sudo systemctl start mysqld // 重启
```

## windows客户端访问
Workbench

https://dev.mysql.com/downloads/workbench/

![](/img/20180814-centos安装mysql记录/190106909.png)

![](/img/20180814-centos安装mysql记录/190512372.png)


上述方法创建的新用户 testuser是所有ip都可以访问的，如有需要可进行更改
```
 show databses;
 use mysql;
 show tables;
 select host, user from user;
```
![](/img/20180814-centos安装mysql记录/191326229.png)


 `tips`  `select * from sometable` 返回的数据列太长时没法看 可以在后面加上 `\G` 这样，查询语句使用 \G 结尾，不需要 ;了。

![](/img/20180814-centos安装mysql记录/191745506.png)


## 修改访问权限
```
 update user set host = '127.0.0.1' where user = 'testuser';
 flush privileges;
```
![](/img/20180814-centos安装mysql记录/192038251.png)
![](/img/20180814-centos安装mysql记录/192358047.png)

# 参考
 https://www.linode.com/docs/databases/mysql/how-to-install-mysql-on-centos-7/
 https://blog.csdn.net/lihao21/article/details/80692068

#END
