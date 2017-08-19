sudo passwd root
sudo apt-get update && sudo apt-get upgrade
sudo apt-get -fy install mc docky tasksel vim gdm
sudo gedit /etc/default/apport
sudo gedit /etc/default/grub && sudo update-grub
sudo dpkg -i linux-headers-4.2.0-*.deb linux-image-4.2.0-*.deb && sudo update-grub
sudo apt-get -y install pepperflashplugin-nonfree && sudo update-pepperflashplugin-nonfree --install 
sudo apt-get -y purge libreoffice? && sudo apt-get -y autoremove && sudo add-apt-repository -y ppa:libreoffice/ppa
sudo apt-get -y update && sudo apt-get -y dist-upgrade
sudo apt-get -y install libreoffice libreoffice-l10n-zh-cn && skill -u kyzs
dmesg | pager
sudo pwunconv
sudo pwconv
sudo apt-get -y autoremove && sudo apt-get autoclean
df -alh --sync
du -ahS
lsattr -a
enable -a
echo $?
sync && shutdown -h now 
chfn
finger
sudo apt-get -y install finger
chroot --help
chsh -l
chsh -s
finger -l kyzs
finger -lpms kyzs
free -tm | pager
who
w
cal
uptime
finger root
ps aux | pager
umask
runlevel
last -ad
last -x
pstree -auh
sync && halt -ip
cat /etc/shadow
sudo cat /etc/shadow
grep '^Memory' /var/log/dmesg
dmesg | grep '^Memory'
echo $PS1
ls -sail
sync && sudo shutdown -hF now
sudo add-apt-repository ppa:ubuntu-wine/ppa && sudo apt-get -y update && sudo apt-get -y install wine
sudo add-apt-repository ppa:ubuntu-wine/ppa
sudo apt-get update && sudo apt-get upgrade
sudo rm -f jayatana.conf
wget http://cn.download.nvidia.com/XFree86/Linux-x86_64/355.11/NVIDIA-Linux-x86_64-355.11.run
wget http://cn.download.nvidia.com/XFree86/Linux-x86_64/352.41/NVIDIA-Linux-x86_64-352.41.run
ll
mv *.run ~/tmp/
sudo dpkg -i linux-headers-4.3.0-*.deb linux-image-4.3.0-040300rc4-generic_4.3.0-*.deb
sudo apt-get -y install compiz-plugins-extra compiz-plugins compizconfig-settings-manager unity-tweak-tool  tweak gnome-tweak-tool
sudo apt-get autoremove
kill %1
sudo apt-get -y install tcsh
stty ek
sudo umount -a
sudo vim /etc/fstab
sudo mount -a
sudo umount -a
tar -xzivf cmus-2.7.1.tar.gz 
rar x LoveWallpaper4Linux.rar 
ll
sync && poweroff 
suco cp -v /etc/apt/sources.list /etc/apt/sources.list.bak && sudo gedit /etc/apt/sources.list
 Ubuntu降温方案
sudo add-apt-repository -y ppa:jfi/ppa 
sudo apt-get -y update && sudo apt-get -y install install lm-sensors hddtemp psensor
sudo apt-get -y install lm-sensors hddtemp psensor laptop-mode-tools
sudo laptop_mode start
cat /proc/sys/vm/laptop_mode 
sudo laptop_mode status
sudo hdparm -I /dev/sda | grep Advanced
sudo gedit /etc/default/acpi-support 
sudo gedit /etc/laptop-mode/laptop-mode.conf
sudo vim /etc/laptop-mode/laptop-mode.conf
 
 
 
ll
vim .bashrc
pwd
cp /home/kyzs/.dircolors /home/kyzs/.bashrc /home/kyzs/.bash_aliases ./
ll
