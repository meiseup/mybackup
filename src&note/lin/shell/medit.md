# Fedora Xfce 23 安装 medit 指东 #
> 编译 medit 之前，需要：

-------
+ 在 Fedora 上安装 gcc 与 g++
`dnf install gcc gcc-c++`

+ medit 必须依赖：
 - gtk2 
 - libxml2 
 - python2
 - pygtk2

+ 以及某些可选依赖
 - automake
 - autoconf 
 - libtool 
 - intltool 
 - docbook 
 - xsltproc
 - txt2tags 
 - `gobject-introspection{,-devel}`
 - glib2-fam

+ 然后编译和安装：
```Bash
./configure --prefix=$HOME/.local --bindir=$HOME/bin 
```

！如果仅仅需要构建可以在其他程序中使用的`python`模块，才使用
`--enable-moo-module`和`--enable-shared` 选项

