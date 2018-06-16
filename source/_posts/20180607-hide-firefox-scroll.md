---
layout:     post
title:      巧妙隐藏firefox滚动条
date:       2018-06-10
catalog:    true
author:     leo
header-img: "roll.jpg"
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
最外层包一个box，用于hidden子元素超出的部分。内部在用一个元素使用overflow:scroll使滚动条显示，然后在使用margin负值使其隐藏。[demo](./raws/test.html)可以看这里，能够起到隐藏的滚动条的目的，但是这个margin的数值15px是个经验数值，不是很靠谱的样子，所以这个方法不是很建议使用。获取填充字符可以在word中新建一个文档输入 `=rand()` 或者 `=lorem()`就可以得到填充字符了。
```css
.box {
      overflow: hidden;
      background: #ddd;
      height: 200px;
      width:200px
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
              视频提供了功能强大的方法帮助您证明您的观点。当您单击联机视频时，可以在想要添加的视频的嵌入代码中进行粘贴。您也可以键入一个关键字以联机搜索最适合您的文档的视频。
        为使您的文档具有专业外观，Word 提供了页眉、页脚、封面和文本框设计，这些设计可互为补充。例如，您可以添加匹配的封面、页眉和提要栏。单击“插入”，然后从不同库中选择所需元素。
        主题和样式也有助于文档保持协调。当您单击设计并选择新的主题时，图片、图表或 SmartArt 图形将会更改以匹配新的主题。当应用样式时，您的标题会进行更改以匹配新的主题。
        使用在需要位置出现的新按钮在 Word 中保存时间。若要更改图片适应文档的方式，请单击该图片，图片旁边将会显示布局选项按钮。当处理表格时，单击要添加行或列的位置，然后单击加号。
        在新的阅读视图中阅读更加容易。可以折叠文档某些部分并关注所需文本。如果在达到结尾处之前需要停止读取，Word 会记住您的停止位置 - 即使在另一个设备上。
    </div>
</div>
```
### 方法三

就是在方法二基础上在用一个div包一下，具体可以这个例子，这样就不存在经验数字了 [demo](./raws/test2.html)

```css
.element,.outer-container {
      width: 200px;
      height: 200px;
    }

.outer-container {
  border: 5px solid purple;
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
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vehicula quam nibh, eu tristique tellus dignissim quis.
          Integer condimentum ultrices elit ut mattis. Praesent rhoncus tortor metus, nec pellentesque enim mattis nec. Nulla
          vitae turpis ut dui consectetur pellentesque quis vel est. Curabitur rutrum, mauris ut mollis lobortis, sem est congue
          lectus, ut sodales nunc leo a libero. Cras quis sapien in mi fringilla tempus condimentum quis velit. Aliquam id
          aliquam arcu. Morbi tristique aliquam rutrum. Duis tincidunt, orci suscipit cursus molestie, purus nisi pharetra
          dui, tempor dignissim felis turpis in mi. Vivamus ullamcorper arcu sit amet mauris egestas egestas. Vestibulum turpis
          neque, condimentum a tincidunt quis, molestie vel justo. Sed molestie nunc dapibus arcu feugiat, ut sollicitudin
          metus sagittis. Aliquam a volutpat sem. Quisque id magna ultrices, lobortis dui eget, pretium libero. Curabitur aliquam
          in ante eu ultricies. Quisque vitae tincidunt purus. Vivamus feugiat bibendum erat, nec interdum urna porta sed.
          Nunc lobortis neque orci, ut suscipit nisl congue feugiat. Vivamus feugiat tellus quis cursus sollicitudin. Curabitur
          dolor massa, dictum ut ipsum in, porttitor pellentesque ante. Aenean egestas cursus tempor. Maecenas semper tortor
          sit amet egestas cursus. Mauris porttitor quis nisi ut tincidunt. Curabitur adipiscing eleifend nibh. Praesent mauris
          leo, consequat vitae orci eget, vestibulum bibendum nisi. Aliquam tempus diam ut tortor cursus, eget sodales augue
          adipiscing. Nulla at dignissim libero.
      </div>
    </div>
  </div>
```

## 参考

https://segmentfault.com/a/1190000012800450

https://blogs.msdn.microsoft.com/kurlak/2013/11/03/hiding-vertical-scrollbars-with-pure-css-in-chrome-ie-6-firefox-opera-and-safari/

https://css-tricks.com/custom-scrollbars-in-webkit/


