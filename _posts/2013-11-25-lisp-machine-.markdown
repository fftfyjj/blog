---
layout: post
title: "Lisp Machine 考古"
category: "Lisp"
tags: [Lisp Machine]
date: 2013-11-25 12:30:39 +0800
---
##前世今生[1](http://en.wikipedia.org/wiki/Lisp_machine)
在60s到70s年代时，人工智能研究过程中所运行的程序需要占用的资源超过了当时各种基于汇编或Fortan编程语言的多用户商业计算机所能提供的资源。于是，研究人员发明了一种新的计算机来解决这个问题：一种给Lisp编程语言量身定做的计算机，用来开发和运行各类大型的人工智能程序。这种机器也就是Lisp Machine。

于是，1973年Richard Greenblatt 和 Thomas Knight开始着手MIT Lisp Machine的设计，他们最开始制成了一种能直接运行基本Lisp指令的计算机硬件，接下来发布了第一款名为CONS的Lisp Machine，接着是名为CADR的第二版，该机器以$50000的价格卖出了25台。

Lisp Machine在实验室的成功促使了其向商业化的大众市场，在80年代，一些比较成功的Lisp Machine公司有以下几家：

* Symbolics (3600, 3640, XL1200, MacIvory and other models)
* Lisp Machines Incorporated (LMI Lambda)
* Texas Instruments (Explorer and MicroExplorer)
* Xerox (InterLisp-D workstations)

但是，很可惜的是，随着人工智能的研究“AI Winter”到来，以及PC革命开始。便宜并且可以不需要特定硬件，使用软件就能运行lisp程序的PC机迅速的挤占了Lisp Machine的市场。到90年代初期的时候， 大部分的Lisp Machine公司破产或转投其他行业。Lisp Machine走向了尽头~~~

##脉络骨架
本想在这讨论Lisp Machine的体系结构、操作系统和应用相关的问题。但是范围太大，内容挺深。待以后好好研究后再汇总成文章写出来。这里只列举一些不错的站点：  

* [lispmachine.net](http://www.lispmachine.net)  
* [c2 Lis Machine](http://c2.com/cgi/wiki?LispMachine)  
* [c2的Lisp Machine所有文章](http://c2.com/cgi/fullSearch)  
* [symbolics公司Lisp Machine手册](http://bitsavers.informatik.uni-stuttgart.de/pdf/symbolics/)  

##总结
如果真的只是纯考古，那根本意义有限，不能弄一台Lisp Machine实际操作真的是非常可惜的事情。奈何物理机根本买不到了，不过从[冰河](http://tianchunbinghe.blog.163.com)博客了解到还有Symbolics的Virtual Lisp Machine这个东西可以在x86_64平台下软件模拟一台Lisp Machine，好奇心瞬间被提升。经过一番折腾，终于是运行起来拉（07年文章，用的07年系统，13年再折腾起来还是纠结了一番）。
用一个图结束此文：
<img src="{{ site.baseurl }}/assets/img/lispmachin on linux.png" class="img-responsive">


