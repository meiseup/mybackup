# Lfs
LFS(Linux From S...)  
源码构建Linux基本系统  
构建必备环境
工具链  
主机必须已经安装以下软件包  
texinfo  
开发软件包*-devel  
c/c++库  
libstdcxx  
libstd*  
gcc/g++  
bison
  
具备以下条件  
/bin/sh -&gt; /bin/bash  
/usr/bin/awk -&gt; /usr/bin/gawk  
/usr/bin/yacc -&gt; /usr/bin/bison  
/usr/bin/cc -&gt; /usr/bin/gcc  
binutils ldd --version  
glibc ld--version  
gcc --version  
g++ --version  
coreutils chown  
util-linux  
sed  
makeinfo  
find --version  
bzip2  
gzip  
xz
第一遍  
binutils-2.25  
gcc4.9.2  
gcc4.9.2-deepends:mpfr,gmp,mpc,isl-0.10|0.11|0.12,cloog-0.17|0.18  
linux3.19头文件  
glibc(C语言库)
第二遍  
binutils-2.25-depends  
需要isl0.10|0.11|0.12,cloog0.17|0.18一同编译  
编译isl需要gmp,找不到gmp.h头文件
gcc-4.9.2
  
coreutils
  
工具链调整
构建基系统  
gcc-deepens: gmp mprf mpc cloog isl
perl
XML::Pars
kmod-depends  
gtk-doc
python-2.27-{,doc}+  
docbook-xml  
docbook-xsl-{,doc}  
libffi  
libxml2  
xstl
grub  
systemd
