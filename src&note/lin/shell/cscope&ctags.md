## vim 插件 cscope&ctags

### ctags ###
First,only run ctags -R <dir> genarite ctags's index.
```bash
ctags -R .
```

and then edit vim profiles
~/.vimrc or ~/.vim/vimrc or /etc/vimrc

add following the line
set ctags += path(abslote)



### cscope ###
If you want using cscope,First：
1. Generate the cscope cross refrences file *cscope.out*
```bash
# this is simple ways
cscope -Rbq
```

If using quickly index with -b 
```bash
find . -type f -name "*.c" -o -name "*.h" -name "*.ch" > cscope.files
cscope -bq
```
and then edit vim profiles,add this line

========== ~/.vim/vimrc ========== 
```vim
if has("cscope")
	set cscopequickfix=s-,c-,d-,i-,t-,e-
	set cscopetag 
	set csto=0
	if filereadable("cscope.out")
		cs add cscope.out
  elseif filereadable("../cscope.out")
		cs add ../cscope.out ..
	"elseif $CSCOPE_DB != ""
	"	cs add $CSCOPE_DB
	endif
  set cscopeverbose
endif
```

