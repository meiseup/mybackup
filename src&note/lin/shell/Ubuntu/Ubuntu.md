&nbsp;&nbsp;Ubuntu(确切的说是 Ubuntu 天朝定制版简称优麒麟)是我最早接触的一个 Linux 发行，它因为稳定和应用广泛被程序开发者所用，因为界面酷炫和 3D 桌面与窗口动画等被 Linuxer 得知。比较搞笑的是，那个时候我还坐在网吧玩星际 2。 刚开始玩的时候，尤其喜欢优麒麟那个窗口动画以及在切换的时候那些特效和 3D 桌面还有像苹果机上的 Docky，切来换去的骚包得很。当然，现在也还是喜欢 Docky。 

&nbsp;&nbsp;要启用 3D 桌面，过程其实是很简单的，就看怎么折腾了。注: 无论是 3D 桌面还是窗口扭曲的动画特效，kde 桌面环境都已提供，假如你不喜欢折腾而又想尝试一下这些花哨的东西，那么不妨试一下 KDE 桌面环境。而这些在 unity 桌面环境是需要手动配置的。

假如你想要体验 3D 桌面和更多的窗口动画，那么你可能需要：
## + 为了更好的折腾这些，切换到闭源（官方）显卡驱动(闭源驱动可以在设置的软件源部分找到)是有必要的。##
## + 安装 compiz，ccsm(compizconfig-settings-manager)，compiz-plugins……以及 unity-tweak(ubuntu tweak tool)，Ubuntu 主题……

&nbsp;&nbsp;使用软件包管理器 apt (这个是基于命令行的工具)，图形化的叫软件中心，还有一个 aptitude 是一个基于 apt 的使用 ncurser 库的的伪图形界面，也要在终端使用。但不管使用命令行还是图形软件包管理器，都要安装好 ccsm 软件套件及其插件包才能正常设置 3D 桌面。 

```Bash
apt-get -y install unity-tweak compizconfig-settings-manager  compiz-plugins-extra compiz-plugins
```
## + 配置 ccsm ##

&nbsp;&nbsp;运行 ccsm，并打开其中的一些基本特效。基本的 3D 桌面只需要打开 ccsm 设置里的 3D Desktop，旋转立方体等基本特效，还要配置虚拟桌面个数（一般是 4 个）就可以了。至于什么下雪、焰火、养鱼效果，玩玩就好，别太认真，如果硬件真的出了问题，可能无法承受。

&nbsp;&nbsp;不管怎样如果一切顺利的话，可以在配置的过程中尝试同时按下 ctrl+alt，并且按住鼠标左键拖曳；也可以按下 ctrl+alt，再按下键盘上的←键或者→键，你就能见到神秘的 3D 桌面。而关于窗口动画及主题等的更改，在 unity 优化工具中可以找到。

假如在这些过程中出现了问题而导致系统重启后无法顺利进入图形界面，那么可以尝试：
 + 在虚拟控制台登录，备份或者移除 ccsm 的配置文件（~/.config/compiz* ~/.gconf/apps/compiz*）
 + 重置 unity （以根用户执行）：

```Bash
unity --reset
```

接着尝试按下 ctrl+alt+F7，看看能否进入 Ubuntu 图形界面。

部分内容转载自这篇[博客][0]，感谢博主无私分享。假如你想要更多 3D 特效，请访问这个[帖子][1]，作者在里面介绍了更多更全的 3D 桌面及窗口动画配置……

[0]: https://
[1]: https://
