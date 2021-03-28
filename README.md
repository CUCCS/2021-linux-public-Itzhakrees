# 第二次实验

## 一、实验目的

熟悉掌握vimtutor基本用法

学会用asciinema录制视频

## 二、实验环境

ubuntu 20.04、asciinema

## 三、实验过程

#### 1、在asciinema注册一个账号，并在本地安装配置好asciinema

```
sudo apt-add-repository ppa:zanchey/asciinema
sudo apt-get update
sudo apt-get install asciinema
#验证安装完成与否
which asciinema
```

![asciinema](/EXP02/img/asciinema.png)

出现上图所示就证明asciinema下载安装成功了

#### 2.vimtutor使用

输入以下代码打开vimtutor

```
vimtutor
```

vimtutor是vim打开的一个临时文件，给初学者提供vim的操作方法

![vimtutor](/EXP02/img/tutor.png)



**vimtutor学习练习视频：**

```
https://asciinema.org/a/403480  #lesson01
https://asciinema.org/a/403484	#lesson02
https://asciinema.org/a/403486	#lesson03
https://asciinema.org/a/403487	#lesson04
https://asciinema.org/a/403489	#lesson05
https://asciinema.org/a/403492	#lesson06
https://asciinema.org/a/403494	#lesson07
```

**对vimtutor的简单总结在vimtutor(ver.cn).md当中**



## 四、自查清单：

### 你了解vim有哪几种工作模式？

normal insert visual 模式

### Normal模式下，从当前行开始，一次向下移动光标10行的操作方法？如何快速移动到文件开始行和结束行？如何快速跳转到文件中的第N行？

一次向下移动光标10行：`10j`

移动到文件开始行和结束行：`gg`，结束行：`G`

快速跳转到文件中的第num行：`[num]G`,

### Normal模式下，如何删除单个字符、单个单词、从当前光标位置一直删除到行尾、单行、当前行开始向下数N行？

删除单个字符：`x`

删除单个单词：`dw`

删除到行尾：`d$`

删除单行：`dd`

删除下num行：`[num]dd`

### 如何在vim中快速插入N个空行？如何在vim中快速输入80个-？

插入num个空行：`[num]o ESC` （O为在上插入，o为在下插入）

快速插入80个-：`80i ESC`

### 如何撤销最近一次编辑操作？如何重做最近一次被撤销的操作？

撤销最近一次编辑操作：`u`

重做最近一次被撤销的操作：`Ctrl+R`

### vim中如何实现剪切粘贴单个字符？单个单词？单行？如何实现相似的复制粘贴操作呢？

剪切单个字符：`x`

剪切单个单词：`dw`

剪切单行：`dd`

复制单个字符：`y`

复制单个单词：`yw`

复制单行：`yy`

粘贴操作都是：`P p`

也可以在Visual模式下选择好范围后 `d 剪切，y 复制，p 粘贴`

### 为了编辑一段文本你能想到哪几种操作方式（按键序列）

光标移动：`h,j,k,l,w,W,b,B,Ctrl+b,Ctrl+f,gg,G`

编辑操作（插入或替换）：`i,a,o,O,c`

删除操作：`x,dd,dw,D`

查询操作：`/[search]`

退出:  `:wq :q :q!`

### 查看当前正在编辑的文件名的方法？查看当前光标所在行的行号的方法？

`Ctrl-g`

## 在文件中进行关键词搜索你会哪些方法？如何设置忽略大小写的情况下进行匹配搜索？如何将匹配的搜索结果进行高亮显示？如何对匹配到的关键词进行批量替换？

关键词搜索：`/pattern`

设置忽略大小写：`:set ignorecase :set ic`

高亮显示搜索结果：`:set hlsearch :set hls`

关键词进行批量替换：`:%s/old/new/g`

### 在文件中最近编辑过的位置来回快速跳转的方法？

`Ctrl-o`

`Ctrl-i`

### 如何把光标定位到各种括号的匹配项？例如：找到(, [, or {对应匹配的),], or }

光标移至需要匹配的括号上，`%`

### 在不退出vim的情况下执行一个外部程序的方法？

`:![命令操作]，command为外部程序名称

### 如何使用vim的内置帮助系统来查询一个内置默认快捷键的使用方法？如何在两个不同的分屏窗口中移动光标？

查询一个内置默认快捷键 `:help w`，w为名称,ctrl-d 可显示可选项，tab 可补全

## 参考资料

[asciinema官方文档](https://asciinema.org/docs/usage)
