tar工具一些类Unix发行的默认归档工具tar与GNU项目提供的tar存在着差异
由GNU项目提供的tar允许参数组合(可以传递类似bsd风格(没有-)的命令行参数，GNU长参数(以--开始)，或者多个参数连在一个-之后，也允许在归档文件时根据传递的命令行参数自动调用压缩/展开工具来自动压缩或者展开归档文件，而某些类Unix(比如BSD)不允许这么做
tar --help
 
使用tar工具时，如果使用了多参数组合(多个参数使用一个-连接)，f(file)选项应该在其它参数的最后，GNU长参数在组合参数之前的顺序。
-f选项(等价与GNU长参数--file=)指定的参数是一个归档名，归档名之后可以同时指定多个文件或者目录。
tar [other options] -{<c|r|A|x|d>}f tar归档文件 文件1|目录1[...文件n|目录n]
创建归档文件的几个选项
-c 选项创建一个新的归档，可以调用压缩工具在归档的同时压缩归档。

尽管下列的这些选项在更新归档文件时非常有用，然后不幸的是这只对那些在归档之前没有调用任何压缩工具的tar归档有效
-r 选项用于增加文件到tar归档末尾，
-A 将一个tar归档增加另外的一个tar归档，同上。
-d --compare --diff
--delete 选项可以从一个tar归档文档中删除文件，
example：
tar --delete -cf test.tar test.txt
 
默认的归档扩展名是tar,调用了压缩工具的扩展可能是.tar.gz|.tgz,.tar.bz2,.tar.lzma,.tar.xz,.tar.Z.........
旧版本的tar压缩/展开一个不是默认扩展名的tar归档需要同时使用选项指定要调用那个压缩/解压工具来提取或者压缩一个归档........
而新版本的tar可以使用-xf选项直接展开/提取某个归档，而不需要刻意指定选项比如-j调用bz2压缩/解压工具来直接展开一个.tar.bz2归档

tar -xf test.tar.bz2
当然，需要文件同时归档和压缩却是需要显式指定选项来让tar在归档的同时调用某个压缩工具，几个可用的常用的压缩选项是：
-j
-J
--lzma
-z
-Z

tar -czf test.tar.gz test*.txt
在展开或者归档文件时，还可以对文件或者目录进行特殊处理，比如在将文件归档之后同时移除掉已经归档的文件。
tar --remove-files --xattrs -cJRf test.tar.xz test/
tar --xattrs -p -xf test.tar.xz
--remove-files 选项在将文件归档到一个归档文件中之后就会移除已经归档的文件。
--xattrs 选项在归档文件时保留用户权限等属性,归档文件时使用。--remove-files在展开归档文件时使用无效
-p 选项在展开归档时保留文件的用户权限，展开归档文件时使用


与归档相关的压缩/解压工具
zip/unzip
gzip/gunzip
squashfs
bzip2|unbzip2|bzcat
ar

xz|unxz

compress|uncpress

7z

rar/unrar

#  vim:expandtab tabstop=2 shifwidth=2 softtabstop=2
