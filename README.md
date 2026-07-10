# Programming Languages 学习笔记

这是我在学习编程语言（PL）过程中的笔记整理。

## 目录
- [软件安装](#软件安装)
---

## 软件安装

请先从 [Software Download](./software-download/)  下载并安装两个程序。

### 配置 Emacs
安装完成后，按照以下步骤配置 `sml-mode`：

1. 打开 Emacs。
2. 输入 `C-x`，然后输入 `list-packages`。
3. 搜索 `sml-mode` 并点击安装。

### 关闭 Emacs
- 使用 `C-x` 然后 `C-c` 即可关闭。

### 测试
创建一个test.sml然后可以拖入Emacs, 应该会进入全空的页面可以输入.

### 补充
另外如果想的话,也可以在VScode上安装ML插件进行编写,但SML是必须要额外安装的
在VScode中运行sml文件,可以通过进入sml文件的地址,然后在终端输入sml,然后输入use "filename"; 来进行运行