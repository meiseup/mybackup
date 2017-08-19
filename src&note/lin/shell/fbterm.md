-- 终端模拟器这个称呼实际上来源于某些古老的 Unix 参考文档，它们对此的解释是：真正的核心终端实际上都对应着一个物理设备文件，而终端模拟器没有与之对应的物理设备文件，因此，它还有另外一个称呼，那就是伪终端 pts ……

&nbsp;&nbsp;fbterm 和 jfbterm 运行在核心控制台上，是一种 shell 程序，依靠 freetype 和 fontconfig 来提供基本的字体渲染，不需要 X 服务也可以支持基本的中文显示。当然了，fbterm 的功能不仅仅只有这点，如果字体等配置好了的话搭配 tmux 能获得图形界面终端模拟器般的体验。不仅如此，如果需要的话，还可以在上面播放多媒体文件，输入中文等……

&nbsp;&nbsp;遗憾的是，运行在控制台上的网络浏览器还不提供某些图形界面的网络浏览器的某些功能，而且 Arch Linux 的官方源中已经不再包含它们了(可能是因为开发已经停止或者开发进度滞后了，这个项目貌似已经从 [google code][1] 上移除了，因此要使用它们只能选择从 AUR 上或者从其它地方获取源码后手动编译。

----------------
 &nbsp;&nbsp;尴尬的是：AUR 上的 fbterm 修改了代码（使得在 Linux Console 上运行了 fbterm 之后就会进行某些环境的自动配置，比如设定终端类型(即设置 TERM 变量)为 fbterm(理论上 fbterm 已经支持 256 色，而 Linux Console 仅支持 16 色)，但这并不是我想要的结果或者说是大多数基于 ncurses 库的伪图形界面程序(比如 mocp 和 alsamixer 以及 mc，偏偏它们又是我所喜欢的几个程序)不希望要的，它们都非常依赖于终端类型的设定，在没有 X 环境时它们通常希望终端类型是 linux，如果终端类型被设置成了 fbterm，它们虽然可以正常启动但是界面显得有些凌乱甚至不能正常响应键盘输入(尽管这可以通过临时设定 TERM 来更改，但每次都要这样让我觉得很厌烦)。除了 vim 之外。

&nbsp;&nbsp;幸运的是，尽管编译没有修改过的代码好像没有这个问题，但我发现了如果在 fbterm 上运行了 tmux 之后，终端类型会被置为 screen，不仅上面的几个问题直接迎刃而解，还多了一些特性，最初的问题其实也就无所谓了。

----------------------------------------------
## 如果你希望使用 [fbterm][0]，那么可以选择手动编译安装..... 
依赖: 
> + 必须依赖:freetype2 fontconfig
+ 可选依赖 libx86(vesa) gpm(mouse support)
+ gcc <= 5.4 

&nbsp;&nbsp;请注意：fbterm 在编译时不能使用版本太新( fbterm 1.7 及以下的版本用 6.1 及以上的 gcc,g++ 编译貌似会失败)，某些特性在新版本的编译器中已经被取消了。不过如果使用手动编译的话可以通过给 configure 脚本从命令行上传递变量给 make 来告诉 make 在编译时到底使用系统中的哪一个编译器来作为实际编译。允许传递的变量和所有的选项可以通过源码包下的 ./configure --help 来得到
> 
+ --enable-FEATURE[=ARG]  include FEATURE [ARG=yes] .......
+ --disable-gpm           disable gpm mouse support [[default=auto]]  是否禁用控制台鼠标功能支持，默认会自动检测，如果已经安装了 gpm 就启用否则就不启用。如果不需要，显式禁用(--disable-gpm=yes)
+ --disable-vesa          disable VESA video card support [[default=auto]] 是否禁用 vesa 支持

-----------------------------------
一些对 make 有效的环境变量:
> + CXX         C++ compiler command  # 指定 c++ 编译器的位置
+ CXXFLAGS    C++ compiler flags # 指定 c++ 编译器编译标志，比如头文件和库的路径
+ LDFLAGS     linker flags, e.g. -L<lib dir> if you have libraries in a anonstandard directory <lib dir>
+ LIBS        libraries to pass to the linker, e.g. -l<library>
+ CPPFLAGS    (Objective) C/C++ preprocessor flags, e.g. -I<include dir> If you have headers in a nonstandard directory <include dir>
+ CC          C compiler command  # 指定 C 编译器的位置
+ CFLAGS      C compiler flags # 指定 c 编译器编译标志，比如头文件和库的路径
+ PKG_CONFIG  path to pkg-config utility
+ .........

&nbsp;&nbsp;在我的系统上，gcc 版本已是 >= 6.1，因此编译 fbterm 1.7 没有成功。我尝试在编译过程指定了在其它系统上已经编译好的编译器，版本稍旧(如果是在 Arch Linux 上，你可以到它的存档库里下载旧版本的 gcc 及其依赖包然后尝试将 gcc 降级 1~2 个版本( < 6.1 >= 4.9)后再编译，但这种方式并不推荐，因为如果你没有在编译完成后及时恢复 gcc 的版本到原来的版本，那些依赖于特定编译器库的应用可能都无法启动而导致整个系统都无法启动……)。

```Bash
tmp=/usr/local/tmp-tools/gcc-4.9.2/bin CC=$tmp/gcc CXX=$tmp/g++ \
./configure && make -j5 && sudo make install 
```

## 配置 fbterm
&nbsp;&nbsp;安装好未做任何配置的 fbterm 直接用普通用户运行可能会失败(虽然可以使用根用户来运行，但这并不推荐)，fbterm 已经提供了解决方案并对其做出了解释：
> 
&nbsp;&nbsp;fbterm 在运行时需要临时具有根用户的权限来操作内核（仅仅只是为了映射某些键），就像 passwd 程序一样。给 fbterm 设置 uid 位也许是最简单的一种方式了(不然以普通用户运行 fbterm 会收到一个 can't change kernel keymap.....一样的消息，这时也用不了 fbterm 的快捷键，比如新建终端窗口的 Ctrl+Meta+C 和切换终端窗口的 Shift ←，Shift →)等。
> 
-------------------------
&nbsp;&nbsp;如果是编译的话，fbterm 的 terminfo 文件可能也要放到合适的位置(比如 /usr/share/terminfo/?/ $HOME/.terminfo/f/ )下，不然在 fbterm 下，vim 可能不会正常工作。
> 
+ 普通用户需要加入 video 组才能有打开 fbdev 的权限。
```Bash
gpasswd -a $USER video
```
+ fbterm 设置键盘映射时需要临时具有存取内核的权限。
```Bash
chmod u+s $(which fbterm)
```
+ fbterm 的 terminfo 文件 fbterm 需要放到合适的位置。


---------------------------------
### fbterm 运行时配置及基本快捷键
可以通过传递参数给 fbterm 或者在配置文件中定义选项来更改它的行为。注：配置文件不是 shell 脚本，shell 指令无效。

============ file ~/.fbtermrc ===========
```Bash
font-names=DejaVu\ Sans\ Mono\ for\ Powerline:Style=Bold
font-size=19
......
color-foreground=7
color-background=0
text-encodings=UTF-8
cursor-shape=1 # fbterm 光标形状
cursor-interval=0 # fbterm 光标闪烁时差，0 即为不闪烁
input-method=fcitx-fbterm # fbterm 输入法
.....
```
### 基本快捷键列表
> + Ctrl+Meta+C 新建一个窗口、
+ Shift <- 或者 Shfit -> 在窗口之间切换
+ ……

-----------------------
&nbsp;&nbsp;如果你觉得在 fbterm 上使用背景图片能增加一些点缀的话，那就给 fbterm 设置背景图片。不过在使用背景图片之前，你可能需要先安装 fbv（背景图片的文件路径可以使用位置参数的形式传递给 fbv 从而允许每次启动 fbterm 时使用不同的背景图片），如果写成了 shell 脚本又没有设置 fbterm 在登录 tty 时自动启动的话。如果 X 用的少，shell 又是 Bash，那么可以在登录 tty 时自动进入 fbterm，如果需要的话。
下面的技巧来源于 wiki：

============== file: ~/.bashrc ===============
```Bash
[ "$TERM" = "linux" ] && echo -en "\e]P7ffffff"
if [[ `tty` = \/dev\/tty[1-6]  ]] && type fbterm &> /dev/null;then 
  tmp=/home/external
  echo -en "\e[?25l" #hide cursor
  fbv -ciuker "$tmp/usr/share/backgrounds/fbterm.jpg" << EOF
q
EOF
  shift
  unset tmp
  export FBTERM_BACKGROUND_IMAGE=1
  LANG="zh_CN.UTF-8" fbterm
fi
```

## fbterm 中文输入法：fcitx-fbterm？yong？ibus-fbterm？
&nbsp;&nbsp;如果你希望在 fbterm 上输入中文，那么安装一个 fbterm 中文输入法并激活它就是必要的。据说 fcitx 框架的 [fcitx-fbterm][2] 已经停止开发了，但在 [git][3] 上还能找到。另外，部分 Linux 发行系统源中也还没有移除这个软件包。

&nbsp;&nbsp;fcitx-fbterm 是用 cmake 来配置的，因此在编译之前可能需要先安装 cmake。最简单的安装方法可以从 INSTALL 文档取得。

进入源码目录，开发者推荐在单独的目录中进行编译：

```Bash
mkdir build;cd build
cmake .. && make && sudo make install
```

&nbsp;&nbsp;如果侬已经运行桌面环境并且 fcitx 在桌面环境自动启动的条目中，那可以直接通过 Ctrl Space（这可以在 fcit 配置中更改)切换(如果不能运行，可以先尝试执行一遍 fcitx-fbterm-helper 脚本)了。没有运行 X 或者是没有安装 X 可能需要先后台启动 fcitx 然后直接使用 Ctrl Space 切换。然而不幸的是，搜狗拼音 for Linux 在 fbterm 上使用时出来的候选框文字全是乱码（其它的 fcitx 框架输入法(如 fcitx-googlepinyin,fcitx-sunpinyin 似乎并没有发现这个问题））的问题一直没有解决。

```Bash
LANG="zh_CN.UTF-8" fcitx &>/dev/null &  # 屏蔽输出与错误消息并在后台运行 fcitx，一些 Linux 发行要求同时启动 dbus。
```

&nbsp;&nbsp;另外一个候选是小小输入法(yong)。安装与配置都不是很难，虽然能正确显示候选文字也能输入汉字但还是存在 bug.

&nbsp;&nbsp;jfbterm 和 fbterm 类似，但无论是从 AUR 上构建还是手动编译都有点费劲（一个因为依赖而从网站上下载的内核包可能会通不过 gpg 检查导致 jfbterm 编译无法开始，而实际只用到了其中的部分代码)，而且使用起来也有些不习惯。

[0]: http://fbterm.googlecode.com/files
[1]: https://code.google.com/archive/p/fbterm

[2]: https://github.com/fcitx/fcitx-fbterm
[3]: https://github.com/fcitx/fcitx-fbterm

落尽尘埃&copy; 2017-？
