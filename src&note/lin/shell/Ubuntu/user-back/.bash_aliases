 alias ll='ls -asilF --color=auto'
   alias la='ls -A'
   alias ld='ls -dl'
   alias l='ls -CF'
   alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
   alias Log='cd /media/Others/Log'
   alias Doc='cd /media/Others/Log/Document'
   alias G='cd /media/Application'
   alias F='cd /media/Fedora'
	alias O='cd /media/OpenSUSE'
   alias T='cd /media/tmp'
   alias sr='sync;sync;sync; sudo reboot now'
   alias st='sudo sync;sudo sync;sudo sync;sudo shutdown -hf now'
   alias sl='skill -u kyzs'
	alias du='du -h'
	alias df='df -h'
	alias cp='cp -iv'
	alias rm='rm -iv'
	alias mv='mv -iv'

 alias umt='sudo umount -v /media/tmp'
  alias uma='sudo umount -v /media/Application'
  alias ump='sudo umount -v /media/OpenSUSE'
  alias mf='sudo mount -t ext4 /dev/sda5 /media/Fedora'

  alias mp='sudo mount -t ext4 /dev/sda6 /media/OpenSUSE'
  alias umo='sudo umount -v /media/Others'
  alias umf='sudo umount -v /media/Fedora'
