1. Install cscope & ctags.
```bash
pacman -S cscope ctags
```


Ctags Configure:
```bash
ctags -R
```

/etc/vimrc,~/.vim/vimrc,~/.vimrc
```vim
set tags+=
```

Cscope Configure:
```bash
cscope -Rbq
```
In /etc/vimrc、~/.vim/vimrc、~/.vimrc，Add
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

```bash
find . -type f -name "*.c" -o -name "*.h" >> cscope.files
cscope -bq
```
