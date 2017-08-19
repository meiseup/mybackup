# Linux Shell脚本学习笔记
Shell脚本不仅可以完成很多重复而又复杂的系统任务，还可以实现一些很有意思的发明。曾发现，有人使用它还可以实现了我认为比较高端的东西，比如我曾见过的shell版俄罗斯方块
########## Shell脚本元素：变量 ##########
########## Shell脚本元素：注释 ##########
shell脚本可以使用#号来注释单行或者多行，但并没有提供类似于高级编程语言如C,C++,Java等的多行注释，只能用#号一行一行的注释，允许出现的位置是行首或者指令的尾部，如果是在尾部应该使用空格隔开  
但在vim中,却提供了一组快捷键可以在多行相同的地方插入相同的字符，可以使用这个来同时注释多行。当然,vim也提供了类似与subtext的多光标编辑(就是同时修改出现在多个地方的相同文本)插件。
注：特殊建或者组合建使用尖括号扩起来了。比如<C-v>表示Ctrl和v键一起键入。
正常模式下，键入快捷键 <C-v>I<Esc><Esc>
  > <C-v> 块可视，上下或者左右与移动选择多行
  > 键入行首插入命令I(大写的i)
  > 键入需要同时插入的字符（跨越单词插入影响最后结果)
  > 按两次Esc。  
它的作用是在选中的行的相同位置插入相同的字符.
########## Shell脚本元素：指令 ##########
########## test指令 ##########
test命令文件测试，比较选项：
-f
-e
-d
-r
-w
-x
-s
-S
-c
-b
字符串测试，比较：
-n
-z
注：字符串测试使用了标准的数学比较运算符，而数学运算使用了字符运算符。
=或者与Unix兼容的==
!=
>
<
>=
<=
数字结果比较，测试：
-eq
-ne
-gt
-lt
-ge
-le
##### 多条件测试：-a和-o ######
######## [和[[：简化的test ########



########## Shell脚本元素：控制结构 ##########
  ## if和if-else分支
if command|test expression|[ expression ];then 
	command
[ elif command|test expression|[ expression ];then
	command;
else command; ]
fi
  ## case分支
case var in
	mode|mode..)
	command;;
	.....
esac [> file]
  ## select
select 单词 in mode...;do
	command;[break]
done
REPLY变量
  ## until
  ## while
  ## for 
#
########## Shell脚本元素：函数(function) ##########
########## 指令连接：;、|、&&、|| ##########
#
