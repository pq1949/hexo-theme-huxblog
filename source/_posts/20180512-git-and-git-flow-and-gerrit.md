---
title: git-flow和gerrit使用总结
date: 2018-05-12 23:11:46
categories: 笔记
catalog: true
header-img: post-bg-js-module.jpg
tags: [git,git-flow,gerrit,sourcetree]
---

> 总结一下git使用的积累

# 图形化软件使用
 
 只用过[sourcetree](https://www.sourcetreeapp.com/) 确实很方便，pc,mac端都有客户端，每次提交前看一下提交的文件状态，可以很方便的看到自己对哪些文件进行了改动，另外文件对比功能，我选择的是[Beyond Compare](https://www.scootersoftware.com/download.php) ，选中某个文件改动的文件 `ctrl + d` 就可以方便的启动beyond compare进行查看。 另外`sourcetree`还可以很方便的查看一个文件的历史提交记录，并且可以查看他们之间的差异。有了这两个软件，就不用记那么多git的命令了，懒人必备。

 `sourecetree`这个软件使用的时候需要登录一个账户，尴尬的是这个账户注册的页面是需要梯子才可以方法的，pc端有一个绕过去的方法，很容易搜到，mac端就没那么教程了，很难解决，好在最后我学会了搭梯子，顺利的解决了这个问题，关于如何搭梯子，我在这里也做了记录。

 `beyond compare`很好用，但是是收费的，破解也不是很好破解，网上可以找一些方法，先用一段时间，不能用的时候在想办法，目前还没有找到一个可以完全破解的方法。


# git-flow 简介

![git-flow](git-flow.png)
 git鼓励开发者多利用分支进行开发，但是如何更加规范的创建和管理分支是需要开发团队提前约定好的，git-flow就是做这个事情的，按照git-flow打开发流程能够很好的协调好团队的开发流程，大家都遵守这个流程的话互相配合起来就会更加高效不容易出错了。
 具体可以参考下面的[文章](https://www.cnblogs.com/lcngu/p/5770288.html)

 摘抄一些命令如下
 ```bash
 # 初始化
 git flow init

 # 开始新Feature
 git flow feature start MYFEATURE

 # Publish一个Feature(也就是push到远程)
 git flow feature publish MYFEATURE

 # 获取Publish的Feature
 git flow feature pull origin MYFEATURE

 # 完成一个Feature
 git flow feature finish MYFEATURE

 # 开始一个Release
 git flow release start RELEASE [BASE]

 # Publish一个Release
 git flow release publish RELEASE

 # 发布Release
 git flow release finish RELEASE
 git push --tags

 # 开始一个Hotfix
 git flow hotfix start VERSION [BASENAME]

 # 发布一个Hotfix
 git flow hotfix finish VERSION
 
 ```




# gerrit 简介
gerrit 是一个用来做code review的工具，对于开发团队来说CR也是非常重要的，比如线上改动的bug，如果需要进行CR的话可以很方便的在gerrit上进行，gerrit其实和私有的git服务器很类似，需要搭建一个gerrit服务器，每次check out 代码直接在gerrit上进行，然后提交代码也到gerrit上，gerrit会自动把自己的代码同步到绑定的git上去，前提是和gerrit和git上没有冲突，冲突出现的原因一般是有人不按照规范直接把代码提交打git上去了。
gerrit具体搭建过程可以在网上搜一下，很多。
[gerrit搭建](https://blog.csdn.net/tq08g2z/article/details/78627653)
 # git常用命令

![git-work-flow](git.png)
虽然git有上面很好用的命令。但是一些简单的git命令，还是需要记住的。

## 我的常用命令

```bash
# 查看当前git仓库状态
status

# 查看分支
git branch [-a]

# 查看当前远程仓库地址  这个很实用 提交前可以用来确认一下提交的仓库地址对不对
git remote -v

# 暂存本地的改动的文件，用来切换到另一个分支时，避免切换到分支后出现冲突文件
git stash

# 恢复现场  还有一个 git stash  list  查看储藏记录 一般工作记住两个就差不多够用了
git stash pop

# 显示今天你写了多少行代码
git diff --shortstat "@{0 day ago}"

# 显示提交记录
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git lg
git lg -p

# 上面的这个显示代码函数命令太长 也可以设置一个alias
git config --global alias.wc "diff --shortstat '@{0 day ago}'"
git wc

```

下面是从[阮老师](http://www.ruanyifeng.com/blog/2015/12/git-cheat-sheet.html)那copy过来做备份的


## 新建代码库
```bash
# 在当前目录新建一个Git代码库
$ git init

# 新建一个目录，将其初始化为Git代码库
$ git init [project-name]

# 下载一个项目和它的整个代码历史
$ git clone [url]
```

## 配置

```bash
# 显示当前的Git配置
$ git config --list

# 编辑Git配置文件
$ git config -e [--global]

# 设置提交代码时的用户信息
$ git config [--global] user.name "[name]"
$ git config [--global] user.email "[email address]"
```

## 增加/删除文件
```bash
# 添加指定文件到暂存区
$ git add [file1] [file2] ...

# 添加指定目录到暂存区，包括子目录
$ git add [dir]

# 添加当前目录的所有文件到暂存区
$ git add .

# 添加每个变化前，都会要求确认
# 对于同一个文件的多处变化，可以实现分次提交
$ git add -p

# 删除工作区文件，并且将这次删除放入暂存区
$ git rm [file1] [file2] ...

# 停止追踪指定文件，但该文件会保留在工作区
$ git rm --cached [file]

# 改名文件，并且将这个改名放入暂存区
$ git mv [file-original] [file-renamed]
```

## 代码提交
```bash
# 提交暂存区到仓库区
$ git commit -m [message]

# 提交暂存区的指定文件到仓库区
$ git commit [file1] [file2] ... -m [message]

# 提交工作区自上次commit之后的变化，直接到仓库区
$ git commit -a

# 提交时显示所有diff信息
$ git commit -v

# 使用一次新的commit，替代上一次提交
# 如果代码没有任何新变化，则用来改写上一次commit的提交信息
$ git commit --amend -m [message]

# 重做上一次commit，并包括指定文件的新变化
$ git commit --amend [file1] [file2] ...
```

## 分支
```bash
# 列出所有本地分支
$ git branch

# 列出所有远程分支
$ git branch -r

# 列出所有本地分支和远程分支
$ git branch -a

# 新建一个分支，但依然停留在当前分支
$ git branch [branch-name]

# 新建一个分支，并切换到该分支
$ git checkout -b [branch]

# 新建一个分支，指向指定commit
$ git branch [branch] [commit]

# 新建一个分支，与指定的远程分支建立追踪关系
$ git branch --track [branch] [remote-branch]

# 切换到指定分支，并更新工作区
$ git checkout [branch-name]

# 切换到上一个分支
$ git checkout -

# 建立追踪关系，在现有分支与指定的远程分支之间
$ git branch --set-upstream [branch] [remote-branch]

# 合并指定分支到当前分支
$ git merge [branch]

# 选择一个commit，合并进当前分支
$ git cherry-pick [commit]

# 删除分支
$ git branch -d [branch-name]

# 删除远程分支
$ git push origin --delete [branch-name]
$ git branch -dr [remote/branch]
```

## 标签
```bash
# 列出所有tag
$ git tag

# 新建一个tag在当前commit
$ git tag [tag]

# 新建一个tag在指定commit
$ git tag [tag] [commit]

# 删除本地tag
$ git tag -d [tag]

# 删除远程tag
$ git push origin :refs/tags/[tagName]

# 查看tag信息
$ git show [tag]

# 提交指定tag
$ git push [remote] [tag]

# 提交所有tag
$ git push [remote] --tags

# 新建一个分支，指向某个tag
$ git checkout -b [branch] [tag]
```

## 查看信息
```bash
# 显示有变更的文件
$ git status

# 显示当前分支的版本历史
$ git log

# 显示commit历史，以及每次commit发生变更的文件
$ git log --stat

# 搜索提交历史，根据关键词
$ git log -S [keyword]

# 显示某个commit之后的所有变动，每个commit占据一行
$ git log [tag] HEAD --pretty=format:%s

# 显示某个commit之后的所有变动，其"提交说明"必须符合搜索条件
$ git log [tag] HEAD --grep feature

# 显示某个文件的版本历史，包括文件改名
$ git log --follow [file]
$ git whatchanged [file]

# 显示指定文件相关的每一次diff
$ git log -p [file]

# 显示过去5次提交
$ git log -5 --pretty --oneline

# 显示所有提交过的用户，按提交次数排序
$ git shortlog -sn

# 显示指定文件是什么人在什么时间修改过
$ git blame [file]

# 显示暂存区和工作区的差异
$ git diff

# 显示暂存区和上一个commit的差异
$ git diff --cached [file]

# 显示工作区与当前分支最新commit之间的差异
$ git diff HEAD

# 显示两次提交之间的差异
$ git diff [first-branch]...[second-branch]

# 显示今天你写了多少行代码
$ git diff --shortstat "@{0 day ago}"

# 显示某次提交的元数据和内容变化
$ git show [commit]

# 显示某次提交发生变化的文件
$ git show --name-only [commit]

# 显示某次提交时，某个文件的内容
$ git show [commit]:[filename]

# 显示当前分支的最近几次提交
$ git reflog
```

## 远程同步
```bash
# 下载远程仓库的所有变动
$ git fetch [remote]

# 显示所有远程仓库
$ git remote -v

# 显示某个远程仓库的信息
$ git remote show [remote]

# 增加一个新的远程仓库，并命名
$ git remote add [shortname] [url]

# 取回远程仓库的变化，并与本地分支合并
$ git pull [remote] [branch]

# 上传本地指定分支到远程仓库
$ git push [remote] [branch]

# 强行推送当前分支到远程仓库，即使有冲突
$ git push [remote] --force

# 推送所有分支到远程仓库
$ git push [remote] --all
```

## 撤销
```bash
# 恢复暂存区的指定文件到工作区
$ git checkout [file]

# 恢复某个commit的指定文件到暂存区和工作区
$ git checkout [commit] [file]

# 恢复暂存区的所有文件到工作区
$ git checkout .

# 重置暂存区的指定文件，与上一次commit保持一致，但工作区不变
$ git reset [file]

# 重置暂存区与工作区，与上一次commit保持一致
$ git reset --hard

# 重置当前分支的指针为指定commit，同时重置暂存区，但工作区不变
$ git reset [commit]

# 重置当前分支的HEAD为指定commit，同时重置暂存区和工作区，与指定commit一致
$ git reset --hard [commit]

# 重置当前HEAD为指定commit，但保持暂存区和工作区不变
$ git reset --keep [commit]

# 新建一个commit，用来撤销指定commit
# 后者的所有变化都将被前者抵消，并且应用到当前分支
$ git revert [commit]

# 暂时将未提交的变化移除，稍后再移入
$ git stash
$ git stash pop
```

## 其他
```bash
# 生成一个可供发布的压缩包
$ git archive
```
