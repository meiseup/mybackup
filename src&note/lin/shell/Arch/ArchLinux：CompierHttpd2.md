# Arch Linux上编译安装Apache-httpd-2.4.0笔记  
#  
必须的编译环境  
gcc  
make  
texinfo  
autoconf  
....  
软件包组base-devel包含了大多数的开发环境软件包。
查询软件包组base-devel中包含的的软件包：  
$ pacman -Qg base-devel
apache-httpd软件包httpd-2.4.0.tar.gz以及其依赖  
httpd对其依赖有版本检查。过低的软件版本会让configure脚本调用失败。  
这些依赖包可以单独分开编译或者直接放到httpd展开后的目录下的srclib目录下让httpd在编译时自动调用。  
apr  
apr-util  
pcre-8.10+
httpd configure选项很多很多，但是一般只需要其中的少许选项，编译安装成功之后，还可以在配置文件中手动启用和禁用某些模块。  
./configure --prefix= --with-apr= --with-apr-util= --with-pcre= --sysconfdir=
\  
\--enable-cgi --enable-ssl --enable-deflate --enable-rewrite --enable-so \  
\--enable-mpm-shared= --with-mpm=event|worker|proworker.... --enable-
modules=most|all...
  
选项解释  
\--prefix= &lt;!-- 用于将软件安装到不同位置，如果安装目录不存在则在make
install阶段会自动被创建，如果不指定，则会默认安装到/usr/local目录下 --&gt;  
\--sysconfdir= &lt;!-- 配置文件安装目录，--&gt;  
\--with-apr  
\--with-apr-util  
\--with-pcre  
\--enable-cgi  
\--enable-ssl  
\--enable-deflate  
\--enable-rewrite  
\--enable-so  
\--enable-mpm= &lt;!-- apache-httpd-2.4.0以上版本支持特性，--&gt;
更多选项可见configure --help
如果./configure被成功执行，那么则会生成一个MakeFile文件。make会根据MakeFile中的指令顺序编译。否则  
应该检查调用configure脚本时产生的configure
warning和error,那些未通过的软件版本和依赖检查可能会导致调用configure脚本或者是make失败。
  
make [-j num]  
-j选项指定编译时是否使用多线程来编译，多线程编译或许会提高编译速度，但是一些软件包可能会编译失败。  
-j选项后跟一个正整数，这个数字取决于系统中的逻辑CPU数量(可以通过cat /proc/cpuinfo|grep 来查看)，它的最优数字等于系统的逻辑cpu总数+1  
如果make执行成功了，但是make install执行失败了，那么可能需要重新make或者重新以更高权限执行make install
重新make务必执行make distclean|make clean命令，这会清除掉make过程中产生的临时编译文件  
make distclean 可以清除./configure和make过程产生的所有临时文件。  
make clean 只会清除make过程产生的临时文件  
更多make选项可见make --help
如果在调用configure脚本时指定了将配置文件安装到/etc目录下，那么需要以根用户的权限运行make install命令:  
$ sudo make install
apache-httpd安装完的配置:  
如果在调用configure脚本时手动指定配置文件路径,即选项--sysconfdir=  
否则，应该到它的安装目录的下的conf目录中查找apache-httpd主配置文件httpd.conf
  
