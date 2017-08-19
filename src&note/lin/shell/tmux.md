
<C-b>

c

翻页 
1. 使用 <C-b>[ 进入 Copy-in 模式 
    ……
   使用 <C-c> 退出 Copy-in 模式 

]


交换 panel
<C-b>{ 或者 <C-b>}

切换 panel
<C-b>q{0..9}

========== $HOME/.tmux.conf ========== 
```bash
#unbind C-b
#set -g prefix C-a

#set -g mode-mouse on

setw -g mode-keys vi

set -g status-bg black
set -g status-fg white
#set-option -g status-justify centre
#set-option -g status-left '#[bg=black,fg=green][#[fg=cyan]#S#[fg=green]]'

#set -g status-utf-8 on
set -g status-interval 5
set -g status-left-length 90
set -g status-right-length 60
#set -g status-left "#[fg=Green]#(whoami):#(hostname -s)#(curl ipecho.net/plain;echo)"
set -g status-left ""
#set -g status-right '#[fg=cyan]%c'
set -g status-right '#[fg=cyan]%Y-%m-%d %A %R'

unbind-key j
bind-key j select-pane -D
unbind-key k
bind-key k select-pane -U
unbind-key h
bind-key h select-pane -L
unbind-key l
bind-key l select-pane -R
```

<C-b>:

command:
select-pane -U  //up
select-pane -D  //down
select-pane -L  //left
select-pane -R  //right

