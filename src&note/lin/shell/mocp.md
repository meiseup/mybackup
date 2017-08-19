-- 假如（我是说假如），你对图形界面音频播放器的高内存占用真的觉得不爽，在 Linux 世界又喜欢折腾不息，生命不止，那你不妨鼓起勇气，试试命令行音乐播放器。

-- 我没有别的意思。也无意鼓励别人去学什么 Geek 精神，虽然在某些时刻，我也是很喜欢 Unix 哲学的。

-- 也许，命令行音乐播放器不具备许多图形界面音乐播放器的某些功能，但请相信我，如果你需要的仅仅是一个可以播放本地音乐的音乐播放器，那么，那些图形界面的音乐播放器所具备的功能，在你将它们配置完成了之后也是会有的，真的。最重要的是：它们对内存的要求真的比图形界面音乐播放器少太多了。

*如果你喜欢遨游在 Linux 世界的话：*

&nbsp;&nbsp;moc 是一款运行在 Linux 终端（终端和伪终端 pts )上的音乐播放器（据我所知，cmus 是另外一款有名的命令行音乐播放器，它的功能貌似要比 mocp 强一些，配置也稍简单一点。虽然不知道 cmus 是否可以支持使用 osdlyrics 加载桌面歌词，但毫无疑问，moc 是可以的），假如有 gpm 的话貌似还可以在终端上使用鼠标。

> &nbsp;&nbsp;事实上，由 moc 软件包所提供的 *mocp* 程序才是真正的音乐播放器程序。因为是基于 ncurses 库的，所以它在黑乎乎的 Linux 核心控制台(字符界面)上也能工作的很好，然而，Linux 核心控制台默认是没有中文支持的，但假如你是在 fbterm (因为 fbterm 是直接从核心控制台启动的，不需要运行 X 服务)上运行的，字体又配置好了的话却能获得不错的体验（需要一番手动配置才行，如果你的全是英文歌曲的话就不用太在意这些小细节了）。


--------------------
## 1. Install moc from system mirrorlist ##
+ 基本上很多 Linux 发行的官方源中已经包含了这个软件包，因此安装的话直接使用默认的软件包管理工具安装就行了。Arch Linux 的是 pacman。
+ 然而，要启动 mocp 却必须已经在 Linux 系统上正确安装和配置了声卡固件（可能一些系统和计算机并不需要安装和配置，我这里指的仅是我的系统和计算机）和驱动，否则你可能会和我的系统一样无法启动 mocp（^_^）。而播放音频也需要启用多媒体解码器插件支持，关于多媒体解码器，可以参考 [Arch Linux 的多媒体解码器条目](https://wiki.archlinux.org/index.php/Codecs)。

> &nbsp;&nbsp;假如你希望 mocp 可以像某些应用程序一样能有一个图标停靠在面板上并能通过这个图标对播放器进行控制的话，那就安装 tray 版本的 moc（只是一个封装），可以在启动时直接启动 mocp 服务和播放器并停靠在面板上，支持在停止/播放/暂停/退出、下一首/上一首等动作中切换，不过其中的一些动作需要在 mocp 中配置播放列表才能得到正确响应。 

## 2. mocp Configure ##
> &nbsp;&nbsp;mocp 默认会读取音频文件元信息(包括标题，歌手，专辑等信息)并显示在播放列表，这当然没有任何问题。
然而，因为 Windows 中的音频文件元信息(ID 标签)所使用的 GBK 字符编码集和 Linux 使用的 UTF-8 字符编码集在编码方式存在很大的差异。因此，从 windows 下载的音频文件可能在播放列表中某些元信息显示为乱码。也许不读取这些确实可以让 moc 的播放列表的文件元信息不显示为乱码，但这并不能从根本上解决音频文件元信息显示为乱码的问题！如果你有让元信息正常显示的想法，可以在 [Arch wiki 中文化条目][0] 找到解决方案。

！在配置 mocp 之前，从 moc 的 man 手册页或者 info 页获取更多的信息(比如基本使用方式，配置文件是什么，应该放到什么位置，格式应该是什么样的......) 也许是一个不错的做法。`mocp --help` `man mocp` `info mocp`

### 2.1 mocp 配置文件 ###
  
&nbsp;&nbsp;拷贝 mocp 示例配置文件(这在 moc 的 man 或者 info 页有更详细的介绍)到 ~/.moc (没有就创建)，参数配置可以从示例文件 config.example (可以运行 locate config.example)中找到 。也许 mocp 的示例配置文件使用了英文，看起来有些晦涩难懂，但作者解释的很清楚)。 

```Bash
 mkdir ~/.moc 
 cp $(locate config.example) ~/.moc/config 
```
 
下面这些都是从示例配置文件拷过来的，以 # 号开始的行被视为注释。
命令行上的 -O 选项能覆盖任何配置文件中的选项
```Bash
mocp -O AutoNext=no -O messagelingertime=1 -O XTerms+=xxt:xwt 
```

========== ~/.moc/config ========== 
```Bash
 ReadTags = no # 不读取音频文件元信息

 MusicDir = /media/Others/Music # MusicDir？
 StartInMusicDir = yes # 启动时进入 MusicDir？
 #Sort = FileName # 排序方式，默认使用了文件名
  
 # Ignore CRC errors in MP3 files? Most players do that, so the default value is 'yes'. 
 MP3IgnoreCRCErrors = yes # 忽略音频文件 CRC 错误？
  
 # 设置播放标志 
 Repeat = yes #是否循环播放 
 Shuffle = yes #是否开启随机播放 
 AutoNext = yes #是否自动播放下一首 
  
 # 状态栏默认显示格式？
 # %n - Track number,%a - Artist,%A - Album,%t - Title,%(X:TRUE:FALSE) 
 # Ternary expression: if X exists, do TRUE,otherwise FALSE. The escape character must be doubled (i.e., '\\'). (See zshmisc documentation for more information.) 
 FormatString = "%t" 
 SoundDriver = ALSA:OSS:JACK # 声音驱动？现代默认都使用了 ALSA
 ALSAMixer2 = Master 
 Softmixer_SaveState = yes # 保存软件音效状态？
 #Equalizer_SaveState = yes # 保存 eq 音效？ 
  
 ShowHiddenFiles = yes # 显示隐藏文件？
 HideFileExtension = yes # 是否隐藏文件扩展名？
 ShowFormat = no # 在列表中显示文件格式？
 ShowTime = yes # 显示音频文件时间信息？
 ShowTimePercent = yes # 使用百分比显示播放进度？
 Theme = user_moca_theme # 主题？用户自定义主题位于 ~/.moc/themes
  
 AutoLoadLyrics = yes # 自动载入歌词？
 LyricsTimeout = 2 
  
 # Assume this encoding for ID3 version 1/1.1 tags (MP3 files). Unlike ID3v2, UTF-8 is not used here and MOC can't guess how tags are encoded.Another solution is using librcc (see the next option). This option is ignored if UseRCC is set to 'yes'. 
 ID3v1TagsEncoding = WINDOWS-1250 
  
 UseRCC = yes # Use librcc to fix ID3 version 1/1.1 tags encoding. 
  
 #UseRCCForFilesystem = yes # Use librcc to filenames and directory names encoding. 
  
 # When this option is set the player assumes that if the encoding of ID3v2 is set to ISO-8859-1 then the ID3v1TagsEncoding is actually that and applies appropriate conversion. 
 #EnforceTagsEncoding = no 
  
 # Enable the conversion of filenames from the local encoding to UTF-8.  
 FileNamesIconv = yes # 允许转换文件名本地编码到 UTF-8？
 SavePlaylist = yes # 退出后保存播放列表？
 SyncPlaylist = yes # 同步播放列表？
  
 # moc 键盘映射配置 
 ## 一个示例文件 keymap.example 在 $prefix/share/moc下 
 Keymap = keymap 
 Allow24bitOutput = no # 允许 24 位输出
 PlaylistNumbering = yes # 播放列表项编号？
 Layout1 = playlist(0,0,FILL,100%) # mocp 播放界面布局配置 
 FollowPlayedFile = yes  # 跟随正在播放的文件？
  
 # What to do if the interface was started and the server is already playing something from the playlist? If CanStartInPlaylist is set to 'yes', the interface will switch to the playlist. When set to 'no' it will start from the last directory. 
 CanStartInPlaylist = yes 
  
 PlaylistFullPaths = no # 是否显示播放列表文件全路径 
 ........... 
```
 
----------------------------------------------------------------------------------------------------
### 2.2 mocp 键盘映射配置 ###

！mocp 键盘映射自定义,示例键盘映射可以从 $prefix/share/moc/keymap.example（$prefix 一般是 /usr 或者 /usr/local）找到，mocp  的所有键映射可以直接在 mocp 界面按 h 或者 ? 获得。

========== ~/.moc/keymap ==========  
```bash
menu_up            = k UP 
menu_down        = j DOWN 
menu_page_up            = ^b PAGE_UP 
menu_page_down        = ^d PAGE_DOWN 
menu_first_item        = M-b HOME 
menu_last_item        = M-d END 
```

----------------------------------------------------------------------------------------------------
### 2.3 mocp 主题：一个好的主题能产生不错的显示效果，假如真的需要的话。###
> &nbsp;&nbsp;mocp 主题默认安装到 $prefix/share/moc/themes 目录下，可以自定义主题只对用户生效(放到 ~/.moc/themes 目录下)。

> &nbsp;&nbsp;mocp 启动时指定的主题或者在用户级配置文件 ~/.moc/config 中指定的主题可以自动从 $prefix/share/moc/themes 和 ~/.moc/themes 中读取(没有就要在 ~/.moc/config 的 Theme 使用绝对路径来指定) 。

----------------------------------------------------------------------------------------------------
创建 ~/.moc/themes 目录以及拷贝主题骨架文件。
```Bash
 mkdir -pv ~/.moc/themes 
 cp /usr/share/moc/themes/moca_theme ~/.moc/themes/user_moca_theme  
```

========== ~/.moc/themes/user_moca_theme ========== 
```Bash
background        = white    default bold     
frame            = white    default bold     
window_title        = yellow    default    bold 
directory        = white        default 
selected_directory    = white        default bold 
playlist        = white default 
selected_playlist    = cyan        default    bold 
file            = green default bold 
selected_file        = white black bold 
....... 
```

----------------------------------------------------------------------------------------------------
> &nbsp;&nbsp;如果 mocp 是运行在 fbterm 上的，请不要随意将终端类型设为 fbterm，虽然这样理论上是可以支持 256 色显示（如果你真的需要，那就安装并运行 *tmux* 来得到真正的图形界面终端般的体验（应用程序可以在运行了 tmux 的 fbterm 上正常运行和绘制，最主要的实际内存占用也不算高）），因为这会让一些基于 ncursers 库的命令行程序（比如 mc 和 alsamixer，mocp）的界面变得凌乱。

虽然 vim 不是这样。

## 3. mocp 基本使用 ##
&nbsp;&nbsp;毫无疑问，如果你已经配置好了（哦，如果你只是听听音乐的话，这无所谓） mocp，那么它的使用是非常简单的。仅仅只需要在终端提示符后键入 mocp 就能启动 mocp 服务并进入 mocp 播放器界面。如果你想要：
 + 添加音乐到播放列表？按下制表符切换到文件列表面板，选好了的话 Shift A 添加整个目录或者按下 a 仅添加单个音频文件，还可以按下回车直接进行播放。
 + b/n 上一首与下一首，p/Space 播放与暂停
 + G 回到当前播放文件所在的地方，i 去往一个目录，U 回到上级目录
 + q/Q 退出 mocp 界面/退出 mocp 并停止 mocp 服务。

只要位于 mocp 界面，随时可以使用 h 或者 ? 来获取更多的播放控制键。

## 4. osdlyrics ##
> &nbsp;&nbsp;虽然 mocp 声称自己可以在控制台上加载歌词(但经过测试发现，这仅限于那些 utf-8 编码的 ascii 文本(纯英文)，而且不支持同步滚动)，假如你和我一样真的需要一个能加载歌词（包括桌面歌词）的软件的话，倒是可以尝试一下 osdlyrics（请注意：我不是在为它做广告。至于原因？以下会说明）。

（osdlyrics 是一个集下载，加载与显示音频歌词的 Linux 通用实现，它支持多种播放器，比如 smplayer，vlc，RhythmCat，moc 等，理论上，osdlyrics 是支持 moc 的，实际上也确实支持，但在加载歌词时却存在卡顿的问题。而且，假如某一首音频文件所对应或者关联的 *lrc* 文件存在问题的话，也会让 mocp 直接阻塞，这个时候点击 mocp 时是不会产生响应的）。

&nbsp;&nbsp;osdlyrics 有两种启动方式，一种是先启动一个 osdlyrics 所支持的播放器（关于它所支持的播放器，当未打开任何播放器时打开 osdlyrics 即可看到)，然后再启动 osdlyrics 时会自动加载音频文件的歌词。另外一种方式就是直接启动 osdlyrics 的同时启动想要启动的播放器，mocp 也支持被这样启动（这同样需要进行设置）。

## 5. moc 在 Fedora 上运行出现的一个错误...... ##
> WARNING: The following fatal error message may be bogus!
If you have an empty /etc/popt.d directory, try
adding an empty file to it.  If that does not fix
the problem then you have a genuine error.

FATAL_ERROR: Error reading default POPT config file: 没有那个文件或目录
这个错误很好解决，那就是可以直接创建一个空的文件到这个目录。以根用户权限执行：
``` Bash
 mkdir -pv /etc/popt.d
 touch /etc/popt.d/mocp.conf
```
[0]:  https://wiki.archlinux.org/index.php/Arch_Linux_Localization_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)
ljca&copy; 2017-?

