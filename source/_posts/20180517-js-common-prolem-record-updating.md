---
title: JS常见问题汇总
date: 2018-05-17 14:58:36
catalog: true
header-img: post-bg-js-version.jpg
categories: 笔记
tags: [javascript]
---

# 函数参数的默认值
ES6 函数允许默认参数，当调用函数时不传参数时会使用默认参数，但是当传的参数是*null* 就可能会得到与预期不一样的结果，一般预期传*null*这个参数等效于不传的，但实际上*null*是有值的  typeof null  返回的是 object

```javascript

function test(a = {qq:11}){
  const zz = a || {}
  console.log(a)
  console.log(zz)
}

test(null)
============output=============
null
{}

test()
============output=============
{ qq: 11 }
{ qq: 11 }

```

```javascript
console.log(null || 0)   // 0
console.log(Boolean(null || 0)) // false
console.log(!!null)  // false
```

# 查询字符串

```javascript
    function getQuery (name) {
      var reg = new RegExp('(^|&)' + name + '=([^&]*)(&|$)')
      var r = window.location.search.substr(1).match(reg)
      if (r != null) return unescape(r[2])
      return ''
    }
```
有一个[query-string](https://www.npmjs.com/package/query-string) 用这个兼容性更好些，可以学习一下源码


# 获取IP地址

```javascript


const os = require('os')

function getIPAdress () {
   // 获取本地 IP 地址，参（ctrl+c）考（ctrl+v）：http://zhangyaochun.iteye.com/blog/2028335
   const interfaces = os.networkInterfaces()
   for ( let devName in interfaces ) {
     const iface = interfaces[devName]
     for( let i = 0; i < iface.length; i++){
       const alias = iface[i]
       if (alias.family === 'IPv4' && alias.address !== '127.0.0.1' && !alias.internal) {
         return alias.address
       }
     }
   }
   return 'localhost'
 }

 console.log(getIPAdress())

```

# 文件选择框最大文件个数

在使用文件个数选择框的时候文件个数超过限制的时候会出现无响应的的现象，可以打开百度网盘文件选择框同时选中大概1000个文件，会出现无反应的现象，这个是浏览器自己限制的
原因可以看[这里](https://stackoverflow.com/questions/15851751/what-is-the-max-number-of-files-to-select-in-an-html5-multiple-file-input)，chrome大概支持的文件长度是32k
