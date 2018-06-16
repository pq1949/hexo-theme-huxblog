---
layout:     post
title:      巧妙隐藏firefox滚动条
date:       2018-06-07 22:15:11
header-img: roll.jpg
catalog:    true
author:     leo
tags:
    - 前端开发
    - CSS
---

> 浏览器默认的滚动条样式不好看，用`-webkit-scrollbar{display: none;}`隐藏一下，但是兼容性又不太好...

## 需求
  在工作中遇到一个需求，把浏览器的滚动条给隐藏起来。

### 方法一
  网上一搜，有一个`webkit-scrollbar{display: none;}`属性即可完成这个需求，但是在firefox中打开的时候，这个属性没有效果。在[caniuse](https://caniuse.com/#search=scrollbar)上搜了一下这个`scrollbar`属性firefox果然是不支持的。scrollbar支持的一些滚动条的样式效果可以在这个页面[查看](http://www.xuanfengge.com/demo/201311/scroll/css3-scroll.html)。基于Gecko内核的firefox暂时没有发布支持自定义滚动条样式的css属性，所以只能另想他法来兼容这个样式。

### 方法二
最外层包一个box，用于hidden子元素超出的部分。内部在用一个元素使用overflow:scroll使滚动条显示，然后在使用margin负值使其隐藏。可以看这个[demo](/demo/20180607-hide-firefox-scroll/test.html)，能够起到隐藏的滚动条的目的，但是这个margin的数值15px是个经验数值，不是很靠谱的样子，所以这个方法不是很建议使用。获取填充字符可以在word中新建一个文档输入 `=rand()` 或者 `=lorem()`就可以得到填充字符了。

```css
.box {
      overflow: hidden;
      border: 2px solid purple;
      height: 200px;
      width:  500px;
      margin: 0 auto;
      }
.container {
    overflow-x: hidden;
    overflow-y: scroll;
    margin-right: -15px;
    height: 200px;
}
```

```html
<div class="box">
    <div class="container">
        ......
    </div>
</div>
```

### 方法三
就是在方法二基础上在用一个div包一下，具体可以这个例子，这样就不存在经验数字了。 [demo](/demo/20180607-hide-firefox-scroll/test2.html)

```css
.element,.outer-container {
      width: 500px;
      height: 200px;
      margin: 0 auto;
    }

.outer-container {
  border: 2px solid purple;
  position: relative;
  overflow: hidden;
}

.inner-container {
  position: absolute;
  left: 0;
  overflow-x: hidden;
  overflow-y: scroll;
}

.inner-container::-webkit-scrollbar {
  display: none;
}
```

```html
  <div class="outer-container">
    <div class="inner-container">
      <div class="element">
        ......
      </div>
    </div>
  </div>
```

## 参考

https://segmentfault.com/a/1190000012800450

https://blogs.msdn.microsoft.com/kurlak/2013/11/03/hiding-vertical-scrollbars-with-pure-css-in-chrome-ie-6-firefox-opera-and-safari/

https://css-tricks.com/custom-scrollbars-in-webkit/


