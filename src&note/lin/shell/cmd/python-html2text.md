htmltotext工具:
$ pacman -Ss html2text2
$ pacman -Qo `which html2text2`
安装python-html2text或python2-html2text 
$ pacman -S --needed python2-html2text
html2text2没有提供-o输出文件,默认会将结果打印到标准输出上
基本用法：
html2text [options] file|url [encoding]
可以是一个本地文件或者url路径,其后的编码项是可选的
选项:
--ignore-links
--ignore-images
$ for i in *.html;do html2text2 --ignore-images $i > `echo $i|cut -d. -f1`.logs && mv $i bk;done
