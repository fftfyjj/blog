---
layout: post
title: "搭建Symbolics VLM on Linux"
category: "lisp"
tags: []
date: 2013-11-25 14:01:33 +0800
---

关于Virtual Lisp Machine实现在Linux x86_64平台上运行的原理可以参考[在 Linux 上运行 VLM 环境(Part 1)](http://tianchunbinghe.blog.163.com/blog/static/7001200781085957640/)中理论部分。这是一篇具体的指导文章，很基础，并且已经成功运行（于2013－11-25）。 


###需要的环境与文件
**宿主系统**  
既然实现在Linux上运行VLM，则需要的宿主机与操作系统必须是x86_64平台下运行的64位Linux系统，理论来说任何发行的Linux类型都可以。这里我采用的是Ubuntu 7.04的64位版本，
Ubuntu 7.04 [下载地址](http://old-releases.ubuntu.com/releases/)。  
**VLM系统文件**  
opengenera2.tar.bz2 和 snap4.tar.gz [下载地址](http://220.181.29.254/~binghe/VLM/)。
###宿主系统设置
在自己个人账号如（yijinjin）下开始如下操作：  
**第一步 更改source list，安装基本软件**  
由于7.04版本过老，apt-get的source list需要更新。  
打开/etc/apt/sources.list，注释或删除原有的list，粘贴如下list进去： 
<pre>
deb http://old-releases.ubuntu.com/ubuntu/ feisty-updates main restricted universe multiverse
deb http://old-releases.ubuntu.com/ubuntu/ feisty-security main restricted universe multiverse
deb http://old-releases.ubuntu.com/ubuntu/ feisty-backports main restricted universe multiverse
deb http://old-releases.ubuntu.com/ubuntu/ feisty-backports main/debian-installer
deb-src http://old-releases.ubuntu.com/ubuntu/ feisty-backports main restricted universe multiverse
</pre>
接下来在终端运行<code>sudo apt-get update</code>  
**第二步 创建lispm的特殊账号**  
此账号是为了给nfs使用。  
在终端输入：
<pre>sudo groupadd -g 4294967294 lispm
sudo useradd -g lispm -u 4294967294 -s /bin/false -d /tmp lispm</pre>
**第三步 安装设置nfs**   
命令行下运行`sudo apt-get install nfs-common nfs-user-server`。  
修改/etc/exports内容为:
<pre>
/       10.0.0.2(rw,no_root_squash)
</pre>
重启nfs服务，运行`sudo /etc/init.d/nfs-user-server restart`  
**第四步 安装inetd**  
在终端运行`sudo apt-get install netkit-inetd`安装inetd。  
修改/etc/inetd.conf文件内容为： 
<pre>
daytime stream  tcp     nowait  root    internal
daytime dgram   udp     wait    root    internal
time            stream  tcp     nowait  root    internal
time            dgram   udp     wait    root    internal
</pre>
运行`sudo /etc/init.d/inetd restart`重启服务。  
**第五步 安装 nis**  
终端运行`sudo apt-get install nis`安装程序。  
修改`/etc/default/nis`文件中相遇项为`NISSERVER=master`。   
注释或删除`/etc/pam.d/common-password`文件中md5加密认证：
<pre>password  required  pam_unix.so nullok obscure min=4 max=8 # md5</pre> 
终端运行:
<pre>sudo pwunconv
sudo grpunconv
cd /var/yp
sudo make</pre>
并重启服务：`sudo /etc/init.d/nis restart`  
**附加步骤**  
如果是虚拟机运行的Ubuntu 7.04，请安装好vmware tools，并修改到最大分辨率（如我的机器是1280x800，最好不要比这再小了，不然VLM运行后看不见或者显示不完全），这非常重要。  
###配置VLM
**第一步 解压文件**  
在个人账号的home目录下，解压opengenera2.tar.bz2 和 snap4.tar.gz。
<pre>
tar xvjf opengenera2.tar.bz2
tar xvzf snap4.tar.gz</pre>
**第二步 配置snap4中.VLM文件**
进入snap4文件夹，运行文本编辑器修改.VLM，如：`nano .VLM`。  
确保内容是如下:
<pre>
genera.network: 10.0.0.2;mask=255.255.255.0; gateway=10.0.0.1
genera.virtualMemory: 1024
genera.world: Genera-8-5.vlod
genera.debugger: VLM_debugger
genera.coldLoad.geometry: 800x600
</pre>
`genera.virtualMemory: 1024`这一项最好设定内存大小不超过宿主机的内存，大于512就行。 
###运行VLM
在终端输入:`sudo ./genera` 就OK！

如果没错，你就会看到上一篇文章中图所示的显示窗口。Good Luck! 你会有成就感的。下一篇会设置genera系统，新建一个自己的site（虽然我目前也还不清楚具体是啥含义），实现访问文档，以及其他功能。 


----
重大补充，发现github有个类似的项目，全自动帮安装一个open genera。利用virtual box虚拟机运行ubuntu 7.10，然后运行snap4。地址[https://github.com/ynniv/opengenera](https://github.com/ynniv/opengenera)。