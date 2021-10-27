# CircuitPython：小白都能学会的单片机开发语言

# 什么是 CircuitPython
[CircuitPython](https://circuitpython.org/) 是一种可以在单片机上运行的 Python3 版本。
目前支持 SAMD21、SAMD51、RP2040、ESP32-S2、nRF52840 等主流单片机的[上百款开发板](https://circuitpython.org/downloads)。
它是由教育公司 Adafruit 开发的，目前已经到 7.0.0 版本。

CircuitPython 的核心概念就是“简单”。
很多专业的功能都被淡化或者回避了。
这使得非相关专业的 DIY 玩家也可以轻松入门上手。

同样因为“简单”，
中低年级的学生不需要太多背景知识就可以进行单片机的实验，
所以特别适合用作 STEM（科学，技术，工程，数学） 的启蒙教育，
特别是电子，计算机，软件等方向。

# 从哪里玩起

## 首先我们要入手一块开发板。

如果你要大而全的开发板，首推还是 Adafruit 家的 Circuit Playground Express
(注意不是 Classic)。
虽然他的单片机是入门款的 SAMD21，
但是板载非常丰富的外设，RGB 和各种传感器非常齐备，
即使不购买其他外设也可以玩出很多花样来。

比较便宜的选项可以选择 Seeed 公司出的 Seeedurino Xiao。 
也是 SAMD21，除了一个 led 以外没有任何外设。
推荐的原因除了价格便宜以外，
还因为它真的很小（Xiao），
所以非常适合做面包板实验。
如果日后想自己画 PCB 的话，
也可以将它像邮票一样直接贴片在PCB上。

其他的[开发板](https://circuitpython.org/downloads)，如果你能买到，也都是不错的选择。

## 安装 CircuitPython

既然 CircuitPython 是运行在单片机上的，
就需要将它安装在单片机上。

安装的过程非常简单。
首先到 [CircuitPython 官网]((https://circuitpython.org/downloads))上找到你的开发板型号。
下载 `.uf2` 文件。
然后把开发板用 USB 线插在电脑上，
然后根据下载页面的说明进入 BOOT 模式。
这时候电脑会把开发板识别为一个U盘，
把下载的 `.uf2` 文件拷贝进那个U盘就大功告成了。
安装完毕后电脑里面会多一个叫做 `CIRCUITPY` 的新U盘。

如果你买的是 Adafruit 自家的板子，
CircuitPython 都会预装好的，
但建议用上述方法升级到最近的 CircuitPython 版本。

## 开发环境（IDE）

简单讲，开发 CircuitPython 不需要安装开发环境。

这也是 CircuitPython 最优雅的一点。
开发 CircuitPython 只需要一个文本编辑器和一个串口控制台 (Serial Console) 就可以了，
并不需要任何驱动程序和在本地运行的软件。
所以小生我开发了一个基于浏览器的 CircuitPython 在线开发环境。
你只需要访问我的网站，就可以开始你的项目了。
即使你用的是 Chromebook 也没有问题。

在线开发环境的地址是: https://urfdvw.github.io/CircuitPython-online-IDE/

欢迎大家使用和反馈意见。

# Hello, World!

# 开始你的折腾之旅

## 从哪里获取学习资源

CircuitPython 作为 Adafruit 的亲儿子，
Adafruit 真的是在不遗余力得推广。
在其网站上可以找到非常多的官方教程。[link]（）
他们也会时不时得发一些博客介绍有意思的 DIY 项目。
详细的技术文档和源码也都可以在 CircuitPython 的官网上找到。
可谓应有尽有。

## 使用配件和扩展库

单片机的项目当然少不了各种配件，
比如传感器，显示器，电机，舵机等。
这些配件都可以以模块的形式买到，
方便用面包板或者杜邦线链接。

针对这些配件，
Adafruit 预先写好了完备的驱动 module，
可以在 CircuitPython 网站上下载。
相关的教程和文档也是一应俱全。

## 更大的项目

当你开始尝试更大的项目的时候，
基础款的芯片可能已经满足不了你的需求。
你可以升级到性能更强的芯片，
比如树莓派的 pi pico 就是不错的选择。

# 祝玩得开心！