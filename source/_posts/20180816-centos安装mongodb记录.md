---
title: centos安装mongodb记录
author: pq1949
catalog: true
header-img: ''
tags:
  - NoteBook
date: 2018-08-16 19:33:20
subtitle:
---

## 更新环境
```
yum update
```

## 添加mongodb仓库
```
vi /etc/yum.repos.d/mongodb-org-3.2.repo
```

添加下面的内容到上面的文件中
```
[mongodb-org-3.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/3.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-3.2.asc
```

## 安装
```
yum install mongodb-org
```

## 安全加固
```
-----/etc/mongod.conf-------
security:
  authorization: enabled
----------------------------
```

## 启停
```
sudo systemctl start mongod
sudo systemctl restart mongod
sudo systemctl stop mongod
```
## 开机自启
```
systemctl enable mongod
```


## 建库建表

```
mongo
```


# 用户相关操作

```
use admin
db.auth('mongo-admin','123456.a')
db.createUser({user: "mongo-admin", pwd: "password", roles:[{role: "userAdminAnyDatabase", db: "admin"}]})

db.createUser({user: "testuser", pwd: "123456", roles:[{role: "readWrite", db: "testdb"}]})


db.system.users.find()
```
参考这里
https://www.jianshu.com/p/f5afc6488f9e

http://forum.foxera.com/mongodb/topic/273/%E5%B8%90%E5%8F%B7%E7%AE%A1%E7%90%86?un=jerry


https://www.linode.com/docs/databases/mongodb/install-mongodb-on-centos-7/
