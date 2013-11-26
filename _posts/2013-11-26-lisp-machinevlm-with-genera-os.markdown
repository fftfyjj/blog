---
layout: post
title: "满足部分日常任务的Lisp Machine(VLM with Genera OS)"
category: ""
tags: []
date: 2013-11-26 21:01:26 +0800
---
经过两天的折腾与学习，现在已经学会一些日常操作了。下面将一一列举并配图。

**1. Dynamic Lisp Listener 下硬盘文件管理**

Lisp Listerner进入方式：

* 通过SELECT + L快捷键进入，
* 也可Lisp Listener中输入Select Activity Lisp进入，
* 通过鼠标选择进入

<img src="{{site.baseurl}}/assets/img/lisp.png" class="img-responsive"/>

基本文件操作：

+ 显示目录： show directory *wide:/home/negatlov/\**
+ 打开文件： show file *wide:/home/negatlov/somefile.txt*
+ 删除文件： delete file *wide:/home/negatlov/somefile.txt*
+ 编辑文件： edit file *wide:/home/negatlov/somefile.txt*
+ 压缩文件： compress file *wide:/home/negatlov/somefile.txt*
+ 编译文件：compile file *wide:/home/negatlov/somefile.lisp*

还有更多命令，可以利用Help健来发掘。


**2. Zmacs 类似 Emacs 的文本编辑器**
Zmacs开启方式：

* 通过SELECT + E快捷键进入，
* 也可Lisp Listener中输入Select Activity Zmacs进入，
* 通过鼠标选择进入

<img src="{{site.baseurl}}/assets/img/zmacs.png" class="img-responsive"/>

一般快捷键都和Emacs非常的类似，还没有仔细研究，会emacs的人上手很快。

**3. Document Examiner文档阅读器**

阅读器打开方式：

* 通过SELECT + D快捷键进入，
* 也可Lisp Listener中输入Select Activity Document Examiner进入，
* 通过鼠标选择进入

<img src="{{site.baseurl}}/assets/img/documntexaminer.png" class="img-responsive"/>

个人很喜欢这个阅读器，比Unix/Linux终端info工具好用。

**4. Terminal 虚拟终端**

开启方式：

* 通过SELECT + T快捷键进入，
* 也可Lisp Listener中输入Select Activity Terminal进入，
* 通过鼠标选择进入

<img src="{{site.baseurl}}/assets/img/terminal.png" class="img-responsive"/>

这个终端可以很好的扩展Lisp Machine，通过此终端，利用telnet协议，可以远程登录到别的机器中，例如VLM所在的宿主机。不过需要稍微在宿主机中设置下。

宿主机(Ubuntu 7.04)设置步骤如下：

1. 安装telnetd：`sudo apt-get install telnetd`
2. 修改telnet服务默认端口：`sudo nano /etc/services` 将telnet的端口有23修改为57。

在VLM的Terminal中设置登录和连接协议为telnet即可。

**5. 其他**

关于邮件程序Zmail、Notifications等等程序及功能，都待探索，可能部分功能已经无法使用，但是前面的4类功能已经能满足日常操作，特别是Terminal的运用，使得VLM可以登录到远程服务器完成它自己不能完成的操作。可以说，VLM现在是可以用来玩耍的，而不只是观赏。
另外，关于在VLM上编程，还待以后学习。期待～

**6.补充**

虽然是虚拟机模拟，但如何软关机也是个问题，正确的关机方法如下：

Lisp Listener下输入如下命令：
halt genera
然后回复两遍yes