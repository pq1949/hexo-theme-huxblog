---
title: hexo和github搭建个人博客
subtitle: 记录我的搭建过程
catalog: true
date: 2017-10-21 17:15:26
header-img: hexo.jpg
categories: 笔记
tags: [教程,hexo,github]
---
 
 > 你们为什么非要自己弄一个博客网址了？！
# 前言
一直以来都想弄一个博客来着，虽然现在有很多博客网站，博客园，CSDN，简书等，但总感觉这些网站不是我想要的，我想要一个专门属于自己的域名，这里面只有我存放的东西，这样可能会显得比较有逼格些。  

之前玩过360前端团队出的一个开源博客系统 [firekylin](https://github.com/firekylin/firekylin),中文名叫火麒麟，很厉害的样子！样例博客大致是这个样子 [屈屈的博客](https://imququ.com/)，和现在的这个风格有点接近，哈哈，然后就从github上安装了一下。安装过程对于新手来说还是有点复杂的，大概需要安装下面3个东西。
- 一台linux主机
- 一个mysql数据库
- 一个nginx服务器

linux 主机的安装是参看的这位大哥的文章[【图文】用虚拟机做专属服务器](http://www.jianshu.com/p/e863329d8757?utm_campaign=hugo&utm_medium=reader_share&utm_content=note&utm_source=weixin-friends) ,这篇文章写的很好，跟大多数安装虚拟机不同的是，只需在windows环境上通过一个shell工具连上后台启动的linux服务器即可，不要太方便，虽然win10官方自带了一个ubuntu的shell，但是用起来还是有些不方便。
另外shell工具最终我用的是[mobaxterm](https://mobaxterm.mobatek.net/),最赞的是这个工具可以直接远程编辑服务器上的文件，传文件也直接拖到左边的侧边栏即可，本来准备公司一直在用的securecrt的，正版的买不起，盗版的不敢用，就另寻他路了。
关于ip那块其实也没有文章里面说的那么麻烦，直接给vmare里面的虚拟机设置一个固定的ip就可以了，怎么设置，网上很多教程的，大致的过程可以看[这里](http://leostudy.top/2017/10/22/ubuntu%E5%9B%BA%E5%AE%9AIP%E5%9C%B0%E5%9D%80/)
linux主机折腾结束了，就开始安装mysql，对于没有安装的同学，就又得网上各种搜索，好在我之前在公司装过几次mysql，看着网上的例子很快也安装好了，然后就要安装配置nginx，这个很简单，安装文档一步步来就可以了。后面启动起来就算大功告成了。

后面如果想配合域名访问的话就得取买一个服务器，公网ip，域名等，这几年各种云平台的火爆，像这些东西只用在一个后台页面上填些东西，付钱很快就搞定了。最开始准备在**腾讯云**上弄的，主要感觉上面的教程挺详细的，但是在我挑选域名的时候多搜了几次竟然把我加名单了，后面怎么搜域名都是显示说你操作太频繁了，那又得另寻出路了，换到**阿里云**上折腾了下，算是折腾好了。
但是我只是想弄一个可以写博客记录文字的地方，这些东西都弄下来真是太麻烦了，后续还要关心服务器上跑的应用是不是还活着在，真是不省心。
另寻他路，看了下hexo加github搭建一个博客不就是我想要的吗，赶紧装起来！


# 开始安装
安装**hexo**前得先做好准备工作
把**nodejs**和**git**安装起来。
## 安装nodejs
 去[官网](http://nodejs.cn/download/)下载windows的版本，然后一路下一步应该装好了吧(映像中是这样的)，最多在设置一下环境变量
## 安装git
 首先你得有个[github](https://github.com/)(世界上最大的程序员交友网站)注册一下，在安装一个官方推荐的工具[git](https://git-scm.com/downloads),安装完成后你的鼠标右键会出现一个git bash here的东西，当然也可以在把这个小乌龟[TortoiseGit](https://tortoisegit.org/)装起来，这样你的git仓库的文件夹都会有一个明显的状态了，然后就要配置ssh免登录了，配置好了就可以用了，什么？不知道怎么配置，那就看看[这里](https://www.baidu.com/s?wd=git%20ssh%20%E9%85%8D%E7%BD%AE&rsv_spt=1&rsv_iqid=0xcb81f53700020ba4&issp=1&f=8&rsv_bp=1&rsv_idx=2&ie=utf-8&rqlang=cn&tn=baiduhome_pg&rsv_enter=0&oq=git%2520tortoisegit&rsv_t=7125%2FUs0eBqxmimX5hC8J7bP9bryo%2BKnuhfBtoCZsN%2FJbm49au%2BRnRlRl%2F2kr2WdkAK4&inputT=1915&rsv_pq=98bd0399000104f8&rsv_sug3=115&rsv_sug1=126&rsv_sug7=100&sug=git%2520ssh%2520%25E9%2585%258D%25E7%25BD%25AE&rsv_n=1&bs=git%20tortoisegit),随便找一个看看就可以了，

## 安装hexo
这个去hexo的[官网](https://hexo.io/)看看就知道了，官网首页的介绍语*A fast, simple & powerful blog framework*,真的是很简单很强大。对了，在国内npm不太好用，还得把cnpm[淘宝镜像](http://npm.taobao.org/)装起来
```$xslt
npm install -g cnpm --registry=https://registry.npm.taobao.org
```
后面涉及到安装npm install的地方都在npm前面加一个c就可以了。选择一个你的博客源文件准备安装的目录，比如D盘的 **D:/gitRes** ,进入这个目录后，右键 git bash here ，输入下面的命令
```$xslt
cnpm install hexo-cli -g
hexo init blog
cd blog
cnpm install
hexo server
```
### 本地预览
打开浏览器输入 **http://localhost:4000/** 正常的话就能见hexo的博客了，这个只是在本地能够预览了，怎么通过域名访问了，这就要在github上操作一番了。
### 域名访问
在github上新建立一个名字叫 **你的用户名的.github.io** 的仓库，比如我的就叫**pq1949.github.io**，新建的时候记得把readme勾选上，不选关系也不大，最好勾上
新建好后在setting里面 **GitHub Pages**选一个分支 一般选择 **master branch** ，点击save后 ，等一下就能看到  **Your site is published at http://pq1949.github.io/** 绿色的提示了
直接访问这个地址应该就能看到readme里面的内容，前面没有勾选的话，后面在按照提示新加一个也能看到，现在就要把hexo和这个仓库关联起来了。

在 **blog**目录里面的 **_config.yml**打开 在最下面的地方deploy改成下面的样子
```$xslt
deploy:
  type: git
  repo: https://github.com/pq1949/pq1949.github.io.git
  branch:  master
```
其中 repo的地方的地址填上前面你自己的地址，在 **clone or download**的按钮那点一下，复制里面的地址就好了，更详细的可以看[官网](https://hexo.io/zh-cn/docs/deployment.html)的说明

这个时候还得安装一个node 的modlues
```$xslt
cnpm install hexo-deployer-git --save
```
安装完成后在执行下面的两个命令
```$xslt
 hexo generate
 hexo deploy
```
如果提示你输入密码，就输入你的github的用户名和密码就好了，都执行完成后在去访问 **http://pq1949.github.io/**就可以通过域名看到你的博客了。
是不是很简单，后面只需要执行下面的命令就可以写新文章了，进到 blog 目录，右键git bash here，输入
```$xslt
hexo new “your article name”
```
然后就可以在 **blog/source/_posts/** 看到刚才创建的文件了，打开这个文件，使用[markdown](http://www.jianshu.com/p/q81RER) 语法开始写文章就可以了
,我使用的工具是webstorm，在里面安装一个markdown插件就可以变写边预览了，还有代码提示，写起来简直不要太爽。
写完了要发布新文章了，那就执行下面的命令
```$xslt
 hexo clean
 hexo generate
 hexo deploy
```
其实  **hexo new “your article name”** 这个命令就是创建了一个文件，然后在这个文件前面写了一下文本内容，你也可以选择手动创建文件，然后输入模版生成的内容。

**hexo clean** 这个命令就是把blog目录下面的publish目录删掉

**hexo generate** 就是把source的文件编译成html放在publish里面 命令也可以简写成 **hexo g**

**hexo deploy** 就是把 publish里面的文件合并到 **.deploy_git**目录里面，然后在自动提交到github上 简写形式 **hexo d**

**hexo server** 就是本地起一个服务器预览下你修改的内容

后面写文章你只需要知道上面的命令就可以满足需要了。

什么？默认博客长得太丑，不忍直视！那就在换一个主题!!

### hexo 安装主题

hexo官网提供了很多[主题](https://hexo.io/themes/s),我总共尝试了两个主题 [fexo](https://github.com/forsigner/fexo) 和 [indigo](https://github.com/yscoder/hexo-theme-indigo)，最终选的是indigo.
**indigo**的文档写的很详细，给作者点赞，安装上面的步骤一路安装和设置很快就可以把主题安装好了，具体安装过程看[这里](https://github.com/yscoder/hexo-theme-indigo/wiki)
下面摘抄一下主要步骤,在 Hexo 根目录，假设是hexo(前面的步骤假设的是blog)执行以下命令。
```$xslt
git clone git@github.com:yscoder/hexo-theme-indigo.git themes/indigo
```
```$xslt
下面两个命令我没执行，我安装的时候默认好像就是card
git checkout -b card origin/card
git checkout -b master origin/master
```
依赖安装
```$xslt
cnpm install hexo-generator-feed --save
cnpm install hexo-generator-json-content --save
```
开启标签页
```$xslt
hexo new page tags
```
修改 hexo/source/tags/index.md 文件，最上面添加下面的配置
```$xslt
layout: tags
comments: false
```
开启分类页,仅 card theme 支持。
```$xslt
hexo new page categories
```
修改 hexo/source/categories/index.md 文件，最上面添加下面的配置
```$xslt
layout: tags
comments: false
```
后面如果想加入新的about页面也是类似的操作

安装完成后就要开始配置了，编辑站点配置文件，hexo/_config.yml。
```$xslt
theme: indigo
```
下面的配置根据实际情况填写
```$xslt
title: your title
subtitle: your subtitle
description: your description
keywords: your keywords
author: your name
email: your email
url: your site url
```

feed配置,rss订阅的功能，还是hexo/_config.yml这个文件,在最后面加入即可
```$xslt
feed:
  type: atom
  path: atom.xml
  limit: 0
```
jsonContent配置
```$xslt
jsonContent:
  meta: false
  pages: false
  posts:
    title: true
    date: true
    path: true
    text: true
    raw: false
    content: false
    slug: false
    updated: false
    comments: false
    link: false
    permalink: false
    excerpt: false
    categories: false
    tags: true
```

剩下的配置就不摘抄了，太多了，我安装的时候多说的评论换成了[友言](http://www.uyan.cc/),站长统计我选的是cnzz的配置，这些都只需要取他们的网站上注册一下就可以了，不要太方便

什么？github.io这个域名不够酷炫！那就接着往下面看!!!
### 绑定域名
还是选择阿里云在上面买一个域名，在[这里](https://wanwang.aliyun.com/?spm=5176.8142029.388261.221.22449968XeGbas)搜索要买的域名，我找了一个很便宜的top后缀的域名 **leostudy.top** 
然后就去做实名认证，现在不做实名认证这些域名都用不了，可以先提交审核，上面的提示说要3到5个工作日，我只等了1个多小时就好了，等的时候我们可以去配置域名的解析地址，添加一个A记录和CNAME记录
![域名解析配置](https://ooo.0o0.ooo/2017/10/22/59ec6f6d3d942.png)

最后还有一个重要步骤，在hexo/source下面添加一个**CNAME**文件,注意这个文件没有任何后缀，区分大小写，文件里面写上刚才申请的域名，然后重新编译发布一下博客内容到github上

```$xslt
hexo clean
hexo g
hexo d
```
# 博客源文件怎么管理
   可以选择在github上在新建立一个分支，也可以在现有仓库的基础上在新建一个分支，活着通过百度云，配置一下自动同步的目录就可以了。
# 有用的工具
[图片在线编辑](http://www.fotor.com/cn/app.html#/editor/basic)

[图片压缩工具1](http://optimizilla.com/zh/)  [图片压缩工具2](http://www.tuhaokuai.com/)

[开源协议教程1](http://www.gcssloop.com/tips/choose-license) [开源协议教程2](http://tenfee.blog.51cto.com/6353835/1890709)

[图床](https://sm.ms/)


# 遇到的问题

换电脑部署的时候，可能会遇到下面的错误

```
  Permission denied (publickey)
```

  这个时候大多数说法是把部署的git地址换成https就可以解决或者使用windows自带的git bash 执行 hexo d  命令
  但是如果用的是mac，换成https这种做法不是一个好的做法，所以又Google了下，找到了下面的方法。输入下面的命令即可继续提交了

```$xslt
  ssh-add  ~/.ssh/id_rsa
```
  另外又学到一个测试ssh是否配置正确的命令

```$xslt
 ssh -T git@github.com
```
执行成功后会返回下面的结果

```$xslt
  Hi pq1949! You've successfully authenticated, but GitHub does not provide shell access.
```

# 补充

偶然看到[hux](https://huangxuan.me/)的博客，感觉很有设计感（懂设计的人美感真的是好，点赞），于是就拿来用了。
我选择的是一个大神改好的hexo模板，直接拿来用就可以了(感谢！)，地址在这里面 <https://github.com/kaijun/hexo-theme-huxblog/>
另外我自己加了域名，和修改了配置文件，全部改成了自己的内容，又加了个脚本，一建编译部署发布和备份博客源文件。  

博客中用到的背景图可以在这里选择素材 <https://www.pexels.com/> 这个网站的图片可以自定义图片尺寸大小，非常赞！更多图片网站请看[这里](https://www.zhihu.com/question/19619335) 
文章标题图的尺寸可以参照之前有的，大概2：1就可以，比如 `1900*870` 然后放到新建文章 `sh new_post.sh` 后的文件夹即可

关于 hexo的post知识，这篇[文章](http://oakland.github.io/2016/05/02/hexo-%E5%A6%82%E4%BD%95%E7%94%9F%E6%88%90%E4%B8%80%E7%AF%87%E6%96%B0%E7%9A%84post/)写的很好，这个作者写的文章质量看着还可以 ，可以收藏 。


[markdown 语法](http://itmyhome.com/markdown/index.html) 

# 参考博客

[怎么用github+hexo搭建博客--基础篇 | Hieeyh's blog](http://hyuhan.com/2016/08/10/How-to-build-a-personalwebsite1/)

[怎么用github+hexo搭建博客--优化篇 | Hieeyh's blog](http://hyuhan.com/2016/08/11/how-to-build-a-personalwebsite2/)

[安装 · yscoder/hexo-theme-indigo Wiki](https://github.com/yscoder/hexo-theme-indigo/wiki/%E5%AE%89%E8%A3%85)

[利用github page搭建博客完整版教程 ](http://greedyhao.cc/2017/08/11/%E5%B7%A5%E4%BD%9C-jekyll-2017-08-11-%E5%AE%8C%E6%95%B4%E7%89%88%E6%90%AD%E5%BB%BA%E5%8D%9A%E5%AE%A2%E6%95%99%E5%AD%A6/#前言)

[搭建Hexo博客进阶篇--API和一些小部件](https://segmentfault.com/a/1190000009478837)




