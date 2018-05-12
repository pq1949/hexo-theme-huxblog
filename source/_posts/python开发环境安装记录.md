---
title: python开发环境安装记录
date: 2017-10-28 19:07:07
categories: 笔记
tags: [python,anaconda,pycharm]
---

第一个安装 anaconda ，去[官网](https://www.anaconda.com/download/)下载，我安装的时候是5.0.1版本，
直接选择python2，7版本的下载，但是安装完成后执行 conda  命令总是找不到，并且开放菜单anaconda中只有
anaconda prompt菜单，点开这个菜单打开的dos窗口也是提示找不到一个activate.bat的文件，在关闭杀毒软件，所有的安装选项都勾上
，环境变量也确定添加了的情况下，竟然还是找不到这个命令，在scripts目录下也确定是没有看到conda之类的文件。
反反复复安装了多次后还是这个样子

最好在这个[地址](https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/)找到之前的版本4.2安装后就好了。。。
。
```chef
# 添加Anaconda的TUNA镜像
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
# TUNA的help中镜像地址加有引号，需要去掉

# 设置搜索时显示通道地址
conda config --set show_channel_urls yes
```

设置完镜像后执行 
```chef
conda upgrade --all
```
更新所有的package，更新过程中有报错，后面在执行 conda 相关的命令也是报错。。
```chef
(D:\anaconda) C:\Users\leo>conda list
Traceback (most recent call last):
  File "D:\anaconda\lib\logging\__init__.py", line 872, in emit
    stream.write(ufs % msg)
LookupError: unknown encoding: cp65001
Logged from file exceptions.py, line 592
Traceback (most recent call last):
  File "D:\anaconda\lib\logging\__init__.py", line 872, in emit
    stream.write(ufs % msg)
LookupError: unknown encoding: cp65001
Logged from file exceptions.py, line 596
Traceback (most recent call last):
  File "D:\anaconda\lib\logging\__init__.py", line 872, in emit
    stream.write(ufs % msg)
LookupError: unknown encoding: cp65001
Logged from file exceptions.py, line 597
Traceback (most recent call last):
  File "D:\anaconda\lib\logging\__init__.py", line 872, in emit
    stream.write(ufs % msg)
LookupError: unknown encoding: cp65001
Logged from file exceptions.py, line 598
Traceback (most recent call last):
  File "D:\anaconda\lib\logging\__init__.py", line 872, in emit
    stream.write(ufs % msg)
LookupError: unknown encoding: cp65001
Logged from file exceptions.py, line 599
```

总之 anaconda 对新手来说一点都不友好，很多坑，还是nodejs简单，环境稳定。

又重新安装了5.0.0的python3版本好像一切正常，没遇到前面的问题，5.0.0的python2版本还是跟之前一样，安装不报错，但是不能正常使用。