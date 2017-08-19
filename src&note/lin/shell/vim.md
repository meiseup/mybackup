vim安装与配置笔记
A：vim安装

已知某些系统源中的vim会和gvim冲突，二者只能有一个存在系统中。
同时安装vim和gvim可以尝试手动编译安装：
以下的configure选项允许VIM80支持所有特性,包括图形界面:
./configure \
		--with-features=huge \
		--enable-luainterp \
		--enable-perlinterp \
		--enable-cscope \
		--enable-multibyte \
		--enable-pythoninterp \
		--enable-python3interp \
		--enable-rubyinterp \
		--enable-xim \
		--disable-selinux \
		--enable-gui=yes \
		--prefix=/usr

sudo make -j8 VIMRUNTIMEDIR=/usr/share/vim/vim80

sudo make install

B：vim基本配置
B1：vim/gvim插件配置
windows上的vim/gvim可能使用了和Linux上不同位置不同名称的vim启动文件
windows gvim启动文件 $VIM\_vimrc $VIM\gvimrc %userprofile%\.vimrc

Linux vim启动文件:
/etc/vim/vimrc
~/.vimrc
~/.vim/vimrc

管理插件的插件 pathogen
git地址:https://git.com/tpope/vim-pathogen
Windows下的VIM(Vi Impls...)插件默认安装到$VIMRUNTIME和$VIM/vimfiles/或者~/vim/vimfiles下的一些特殊的目录中，所有插件都以一个可执行的vim或者vmp文件出现
这些目录中的插件在vim/gvim启动时会被自动载入，当然，这需要正确配置了vim/gvim启动文件
插件目录
autoload
ftplugin(filetypeplugin)
plugin
syntax
colors
doc
.....
可能需要花费很多的时间的到各个目录中查找vim脚本文件。而且也不便于管理
pathogen插件由to...编写，这个插件使用了另外一种方式来管理插件

每个插件都位于自身的目录下，而这些目录又都位于用户主目录的.vim/bundle目录下
vim/gvim在启动时，如果正确配置了pathogen插件，这个插件会自动递归查找~/.vim/bundle目录下(插件目录)的所有的用户插件并载入它
Vunble(Vim Bundle)
Vunble插件的安装并不难，但之后的vim插件安装则需要git|curl工具的支持
Vundle bundle插件安装位置：
%userprofile%\.vim\bundle
使用Vundle bundle安装插件默认安装位置: $VIM/vimfiles/bundle
使用Vundle bundle安装插件默认安装位置: ~/.vim/bundle
BundleInstall
BundleUninstall 
BundleList
插件下载地址:
https://github.com/ervandew/eclim/releases/

C：vim键盘映射
造成vim不易使用的几个可能原因是vim不仅存在多种工作模式，键盘映射(快捷键)也和大多数的文本编辑器不同，功能繁杂多样，不过vim提供了重新映射快捷键的方法。
C1：vim工作模式：
i[nsert]map(插入模式,当在正常模式键入i键之后)
n[ore]map(正常模式,当vim不以任何参数或者特殊参数启动或者打开一个文件时或者在插入、替换、可视模式下键入Esc键之后)
v[isual]n[ore]map(可视模式,当正常模式下键入v或者V)
可视行，可视，可视块
r[eplay]map(替换模式,当在正常模式之下键入R之后)
词替换，字母替换，行替换
搜索模式：当在正常模式下键入半角字符问号(?)或者正斜杠(/)
末行(命令)模式：当在正常模式下键入半角字符冒号(:)时
C2：vim键映射
正常模式键映射:
插入： 
i/I
o/O
a/A
替换插入
r/R
删除
x/X
d/D
删除并进入插入模式
s/S
c/C
复制/剪切/粘贴
yy/p
v/V/<c-v>
移动
j k l h <===> ↓ ↑ → ←
行定位
w/W e/E b/B
0/<S-$>
<c-u>/<c-b>
<c-d>/<c-f>
定位
J K L M H
f/F
撤销和undo
u/U
<c-r>
宏录制
q
块编辑
<c-o>
<c-v>I/C/A
插入模式下键映射:
选择一个剪贴板粘贴
<c-r>
末行(命令)模式键映射:
取得光标处的单词
<c-r><c-w>
插入模式键映射:
可视模式键映射:
替换模式键映射:

D：vim插件语法
vim插件元素：vim变量(variable)
vim变量、控制结构、函数等主要用于vim插件和vim脚本的编写。
经过自由配置之后，vim甚至可以具有所有IDE具有的功能，甚至比某些IDE功能更强，然而,即使加载的插件足够多，却仍是不占用操作系统多少内存和处理器资源的.因为vim插件是以文本文件形式存在的!只要有懂得足够的知识，甚至可以自己编写插件。
变量声明定义的一般语法：
let [g:] vari_name = 
！g:前缀表示该变量是全局的.
系统变量和vim自定义变量
$VIIMRUNTIME
$VIM
&filename
&filetype

vim插件元素：vim控制结构
if结构语法：
if expression 
....
elseif expression 
....
else 
....
endif

vim同样也有循环结构，
for expression
.....
endfor

while expression
....
endwhile

vim插件元素：vim函数
! 和大多数编程语言相同，vim函数也分vim已经定义好的和用户自定义的 ! 因此，在定义用户函数时需要将函数名大写或者添加s:前缀来覆盖替换掉已经定义好的函数,否则是无法正常调用的。
函数的调用和定义顺序并没有严格规定,
vim函数的一般定义语法:
func[tion][!] [s:]fun_name
......
endfunc[tion]

vim已经定义的函数：
echo
has()
expand()
line()
append()
setline()

特殊符号
%号在vim中表示文件名
%< 没有后缀的文件名

F：windows不在Vundle中管理的插件备份
..\plugin\a.vim
..\plugin\bufexplorer.vim
..\plugin\genutils.vim
..\plugin\grep.vim
..\plugin\jsbeautify.vim
..\plugin\lookupfile.vim
..\plugin\minibufexpl.vim
..\plugin\taglist.vim
..\plugin\vimcdoc.vim
..\plugin\visualmark.vim
..\plugin\vulkan1.0.vim
..\plugin\winfileexplorer.vim
..\plugin\winmanager.vim
..\plugin\wintagexplorer.vim
..\syntax\help_cn.vim


粘贴缩进错乱：
+ 粘贴前先在 vim 中启用粘贴模式 `set paste`再执行粘贴操作

然后粘贴完可选的取消这种状态 `set nopaste`



