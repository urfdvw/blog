# 隔着两层SSH怎么用Python

## 背景

之前说过，Python界最好的科学计算IDE没有之一是VScode。
其中一个方便的地方在于，不用一行代码，就可以实现SSH远程开发。

结果我在的实验室有个诡异的设定，
就是要先SSH进一个被称为Access Point的机器，
再SSH进自己的服务器。
这个两层SSH的设定我就不知道如何在VScode里面实现了。

摸索了一把无果，于是我退而求其次，
研究一下能不能先连上Jupyter，将就着用一下。
之所以选Jupyter，是因为这家伙和VScode一样不需要传递UI图像。
远程的时候传UI能卡死。

## 方法

根据[这个](https://fizzylogic.nl/2017/11/06/edit-jupyter-notebooks-over-ssh/)博客，
我发现最关键的就是SSH tunnel。
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