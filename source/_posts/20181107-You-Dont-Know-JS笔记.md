---
title: 20181107-You-Dont-Know-JS笔记
author: pq1949
catalog: true
header-img: ''
tags:
  - NoteBook
  - 读书笔记
date: 2018-11-07 17:55:16
subtitle:
---

> [原文地址 ](https://github.com/getify/You-Dont-Know-JS/tree/1ed-zh-CN),记录一些看到的知识点

### [入门与进阶](https://github.com/getify/You-Dont-Know-JS/blob/1ed-zh-CN/up%20&%20going/README.md#you-dont-know-js-up--going)

#### console tool
  推荐的一个关于console tool使用的教程[Mastering The Developer Tools Console](https://blog.teamtreehouse.com/mastering-developer-tools-console)，有空可以翻译一下
#### JS 可用的内建类型
  * `string`
  * `number`
  * `boolean`
  * `null` 和 `undefined`
  * `object`
  * `symbol` （ES6新增类型）
  `typeof` 的返回值(**类型为字符串**)有7个`"number", "boolean", "string", "undefined", "object", "function"`,另外还有ES6中新增的一个`"symbol"`([MDN](https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Operators/typeof))

  **注意:** `typeof null` 返回的是 `"object"`, YDK中描述这是JS的一个bug!,至今不修复的原因是:
  > 网络上有太多的代码依存于这个bug，因此修复它将会导致更多的bug！

  函数也是object的子类型, typeof返回"function"
  ```js
  function foo() {
	return 42;
  }

  foo.bar = "hello world";

  typeof foo;			// "function"
  typeof foo();		// "number"
  typeof foo.bar;		// "string"
  ```
#### Truthy 与 Falsy
  在JavaScript中“falsy”的明确列表如下：

  * `""` （空字符串）
  * `0`, `-0`, `NaN` （非法的`number`）
  * `null`, `undefined`
  * `false`

  任何不在这个“falsy”列表中的值都是“truthy”。这是其中的一些例子：

  * `"hello"`
  * `42`
  * `true`
  * `[ ]`, `[ 1, "2", 3 ]` （数组）
  * `{ }`, `{ a: 42 }` （对象）
  * `function foo() { .. }` （函数）

  重要的是要记住，一个非`boolean`值仅在实际上被强制转换为一个`boolean`时才遵循这个“truthy”/“falsy”强制转换。把你搞糊涂并不困难 —— 当一个场景看起来像是将一个值强制转换为`boolean`，可其实它不是。

#### == 和 ===
  array默认情况下会通过使用逗号（,）连接所有值来被强制转换为string。你可能认为两个内容相同的array将是==相等的，但它们不是
  ```js
  var a = [1,2,3];
  var b = [1,2,3];
  var c = "1,2,3";

  a == c;		// true
  b == c;		// true
  a == b;		// false
  ```

  特别小心\==和\===的比较规则。因为这些值实际上是通过引用持有的，\==和\===比较都将简单地检查这个引用是否相同，而不是它们底层的值。
  ```js
  var a = []
  var b = []
  var c = {}
  var d = {}
  var e = ''

  a == b //false
  c == d //false
  a == e //true
  c == e // false
  ```
#### 填补（Polyfilling）
  `NaN`是唯一可能使`x !== x`为`true`的值
  ```js
  if (!Number.isNaN) {
    Number.isNaN = function isNaN(x) {
      return x !== x;
    };
  }
  ```
#### this与对象原型
  > 渴望将类和继承的设计模式思想带入JavaScript只是你能做的最差劲儿的事情，因为虽然语法可能欺骗你，使你认为有类这样的东西存在，但实际上原型机制在行为上是根本相反的

  ```js
  var foo = {
    a: 42
  };

  // 创建 `bar` 并将它链接到 `foo`
  var bar = Object.create( foo );

  bar.b = "hello world";

  bar.b;		// "hello world"
  bar.a;		// 42 <-- 委托到 `foo`
  ```
  ![](/img/20181107-You-Dont-Know-JS笔记/191414553.png)

  将对象`foo`和`bar`以及它们的关系可视化也许会有所帮助：
  属性`a`实际上不存在于对象`bar`上，但是因为`bar`被原型链接到`foo`，JavaScript自动地退到对象`foo`上去寻找`a`，而且在这里找到了它。

  这种链接看起来是语言的一种奇怪的特性。这种特性最常被使用的方式 —— 我会争辩说这是一种滥用 —— 是用来模拟/模仿“类”机制的“继承”。

  使用原型的更自然的方式是一种称为“行为委托”的模式，在这种模式中你有意地将你的被链接的对象设计为可以从一个委托到另一个的部分所需的行为中。

  **注意：** 更多关于原型和行为委托的信息，参见本系列的 *this与对象原型* 的第四到六章。

### [作用域与闭包](https://github.com/getify/You-Dont-Know-JS/blob/1ed-zh-CN/scope%20&%20closures/README.md#you-dont-know-js-scope--closures)

#### 不要使用 `eval` 或 `with`
  ```js
  function foo(str, a) {
    eval( str ); // 作弊！
    console.log( a, b );
  }

  var b = 2;

  foo( "var b = 3;", 1 ); // 1 3
  ```
  ```js
  function foo(str) {
    "use strict";
    eval( str );
    console.log( a ); // ReferenceError: a is not defined
  }

  foo( "var a = 2" );
  ```
  ```js
  var obj = {
    a: 1,
    b: 2,
    c: 3
  };

  //  重复“obj”显得更“繁冗”
  obj.a = 2;
  obj.b = 3;
  obj.c = 4;

  // “更简单”的缩写
  with (obj) {
    a = 3;
    b = 4;
    c = 5;
  }
  ```
  ```js
  function foo(obj) {
    with (obj) {
      a = 2;
    }
  }

  var o1 = {
    a: 3
  };

  var o2 = {
    b: 3
  };

  foo( o1 );
  console.log( o1.a ); // 2

  foo( o2 );
  console.log( o2.a ); // undefined
  console.log( a ); // 2 -- 哦，全局作用域被泄漏了！
  ```
在代码的任何地方引入了一个了 eval(..) 或 with。无论 引擎 将在努力限制这些悲观臆测的副作用上表现得多么聪明，都没有任何办法可以绕过这个事实：没有优化，代码就运行的更慢。
[参考](https://github.com/getify/You-Dont-Know-JS/blob/1ed-zh-CN/scope%20%26%20closures/ch2.md)
