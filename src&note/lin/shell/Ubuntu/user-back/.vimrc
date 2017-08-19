set shortmess=atI
winpos 5 5

"设置编辑器初始大小
set columns=155 lines=100

"显示行号
set number
"set go=

"代码高亮
set syntax=on

"autocmd InsertLeave
"autocmd InsertEnter

"设置配色方案
colorscheme ron
"colorscheme murphy

"设置状态栏
set ruler

"显示命令
set showcmd

set cmdheight=1

set scrolloff=3
set novisualbell

set foldmethod=manual

"设置背景
set background=dark
set nocompatible

if version >= 603
    set helplang=cn
    set encoding=utf-8
endif

if (has("gui_running")) 
set guifont=Bitstream\ Vera\ Sans\ Mono\ 10 
endif
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8

"设置tab键宽度
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab

"不自动备份
set nobackup
set autoread

"与系统共享剪贴板
set clipboard+=unnamed

"自动缩进
set autoindent
set cindent

"突出显示当前行
"set cursorline

"文件为只读或者为保存时弹框
set confirm

"设置编码
set enc=utf-8
set langmenu=zh_CN.UTF-8
set helplang=cn
set laststatus=2
set linespace=2

"使退格键可用
set backspace=2

"使鼠标可用
set mouse=a
set selection=exclusive
set selectmode=mouse,key
set report=0

"括号自动配对
set showmatch

"自动格式化
set formatoptions=tcrqn

"括号自动配对
set showmatch
set matchtime=2

"查找忽略大小写
set ignorecase
set nowrapscan

"高亮显示搜索到的文本
set hlsearch
set incsearch

"开启折叠，并设置空格来开关折叠
set foldenable
set foldmethod=syntax
set foldcolumn=0
setlocal foldlevel=1
set foldclose=all
nnoremap <space> @=((foldclosed(line('.'))<0)?'zc':'zo')<CR>
"搜索和undo时不展开设置好的折叠
set foldopen-=search
set foldopen-=undo







