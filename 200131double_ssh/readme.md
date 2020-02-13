# 隔着两层SSH怎么用Python

## 背景

[之前说过，Python界最好的科学计算IDE没有之一是VScode。](200128env_setup/readme.md)
其中一个方便的地方在于，不用一行代码，就可以实现SSH远程开发。

结果我在的实验室有个诡异的设定，
就是要先SSH进一个被称为Access Point的机器，
再SSH进自己的服务器。
这个两层SSH的设定我就不知道如何在VScode里面实现了。

摸索了一把无果，于是我退而求其次，
研究一下能不能先连上Jupyter，将就着用一下。
之所以选Jupyter，是因为这家伙和VScode一样不需要传递UI图像。
远程的时候传UI能卡死。

## Jupyter Lab 的安装

Jupyter Lab有两版，
一个Py3的一个Py2的。
由于Py2已经被淘汰，
Jupyter Lab 的Py2版本就停在了预览版，
不再更新了。
所以安装时候一定要安装Py3版本的。
用Pip的话就是
```
pip3 install jupyterlab
```
用conda的话，只要你安装的conda是Py3的话
```
conda insatall jupyterlab
```
给你安装的就是Py3的版本。

## 建立连接

根据[这个](https://fizzylogic.nl/2017/11/06/edit-jupyter-notebooks-over-ssh/)博客，
我发现最关键的就是SSH Tunneling (Port Forwarding)。
虽然和博客里面的场景不太一样，不过也是大同小异。

首先打开windows 的 CMD。通过下面这些命令建立链接。

打开Access Point的tunnel
```
ssh -L 8080:localhost:8080 <user name>@<access point>
```
输入密码登录。
其中```-L```一个参数就表示了tunnel。

这时候我们已经身处Access Point了，
我们从这里打开通向自己服务器的tunnel
```
ssh -L 8080:localhost:8080 <user name>@<server>
```
输入密码登录。端口全是8080，前后一致。

这时候我们就已经在服务器里了，
那么我们在服务器里打开Jupyter Lab
```
jupyter lab --no-browser --port=8080
```
也强制端口8080。
复制生成的地址，例如
```
http://localhost:8080/?token=XXXXXXXXXXXXXXXXX
```

最后我们回到Windows。
打开浏览器，粘贴复制的地址，按回车就可以打开Jupyter Lab的IDE了。

## 使用 Jupyter Lab

Jupyter好的一点是它的interactive做的好，
不过这基本等同于说是iPython做的好。
Jupyter不好的地方，
就是它的variable inspector和Debugger的严重缺失。
但无论怎样，Jupyter Lab还是在Jupyter Notebook的基础上做了很大的改进。
从基本不是IDE进化成了一个凑活能使的IDE。

Jupyter Lab最推荐的使用方法，
是建立.py文件，
然后在编辑器的空白处鼠标右键，
选择"Create Console for Editor"，
就会打开一个iPython Console（不是Notebook）。
选中想要运行的代码，按Shift+Enter，
就可以把选中的文字推送到consol并且运行。
如果Ctrl+A 后 Shift+Enter就相当于运行全部代码。
这个和VScode的Run below是一个道理。
肯定会有人问（才怪，根本不会有人来这个blog看）
“为什么不直接在terminal里面运行？”
那是为了在运行之后，全部的结果和中间变量都留在了console里。
我可以在运行之后用其他代码检查运行的结果。
当然如果可以直接在variable inspector里面看就更好了。
如果在terminal里运行，
运行完别说中间变量，连结果都释放掉了。

可惜的是Jupyter不支持code cell，
然而我仍然要用`#%%`来分开代码段。
因为Jupyter毕竟是权宜之计，
能回VScode的时候我还是会回去的。

为啥不用notebook？
其实不是不行啦，
vscode的notebook编辑器都可以看variable了。
最终过然还是因为~~单纯的看不起~~notebook没那么通用吧。

## 20/02/05 的评论

刚刚用了一下vscode的Notebook编辑器。
还是挺香的。
其实也没有这么糟糕啦，
Variable inspector也是支持的，
只不过不能debug。
如果需要Markdown多一些的话NB还是挺好用的，
特别是要交报告的时候。
只可惜Git不能track，
不过Github可以预览结果倒是不错。