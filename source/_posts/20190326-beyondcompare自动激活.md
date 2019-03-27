---
title: 20190326-beyondcompare自动激活
author: pq1949
catalog: true
header-img: ''
tags:
  - NoteBook
date: 2019-03-26 18:34:23
subtitle:
---


1、安装 beyondcompare https://www.scootersoftware.com/download.php

2、新建下面的文件

activeBeyond.vbs

```vbs
Set ws = CreateObject("Wscript.Shell")
ws.run "cmd /c activeBeyond.bat",vbhide
'Set objFSO = CreateObject("Scripting.FileSystemObject")
'objFSO.DeleteFile("C:\Users\Administrator\AppData\Roaming\Scooter Software\Beyond Compare 4\BCState.xml")
'objFSO.DeleteFile("C:\Users\Administrator\AppData\Roaming\Scooter Software\Beyond Compare 4\BCState.xml.bak")
msgbox "Beyond Compare 4 Active Success!"
```
activeBeyond.bat
```bat
:loop
del "C:\Users\Administrator\AppData\Roaming\Scooter Software\Beyond Compare 4\BCState.xml"
del "C:\Users\Administrator\AppData\Roaming\Scooter Software\Beyond Compare 4\BCState.xml.bak"
@ping 127.0.0.1 -n 1 >nul
goto loop
```

3、 添加到开机启动项

```bash
shell:startup
```

复制 activeBeyond.vbs 的快捷方式到打开的目录中去


https://gist.github.com/pq1949/522c09c4597287baff07e1981cac0df4
