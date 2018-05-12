---
title: JS常见问题汇总
date: 2018-05-11 14:58:36
tags:
---
## 函数参数的默认值
ES6 函数允许默认参数，当调用函数时不传参数时会使用默认参数，但是当传的参数是*null* 就可能会得到与预期不一样的结果，一般预期传*null*这个参数等效于不传的，但实际上*null*是有值的  typeof null  返回的是 objec

```

function test(a = {qq:11}){
  const zz = a || {}
  console.log(a)
  console.log(zz)
}

test(null)
============output=============
null
{}
```

```
console.log(null || 0)   // 0
console.log(Boolean(null || 0)) // false
console.log(!!null)  // false
````