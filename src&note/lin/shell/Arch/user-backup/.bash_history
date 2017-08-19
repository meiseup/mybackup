sync;sync;sync;sync;sync;sync;sync;sync;sync;cs
sync;sync;sync;sync;sync;sync;sync;sync;sync;rs
sudo mount /dev/disk/by-label/Others /media/Others
sudo mount --rbind -v /media/Others/Other/Share/lfs_sr /home/external/Lfs
sudo systemctl start NetworkManager
sudo systemctl start lxdm
sudo systemctl stop NetworkManager&&sudo ip link set wlp3s0 down
sudo umount -v /home/external/Lfs
paci poppler-qt4 zathura-pdf-poppler
paci zathura-pdf-mupdf zathura-ps zathura-djvu
paci zathura-ps zathura-djvu
paci libev
paci pidgin
paci fvwm{,-crystal}
paci perl-tk perl-x11-protocol 
pacr zathura-ps zathura-djvu
pacr hwloc
pacr systemdgenie
pacr avahi
pacr cheese
pacr alsa-tools
pacr vifm
pacr masterpdfeditor
pacr xfce4-dict
pacr gnome-online-accounts gvfs-goa libgdata gvfs-google
pacr v4l-utils
paci xloadimage
paci conky{,-manager}
paci pcmanfm
paci xarchiver
paci rox
paci uget
paci calc
paci lftp 
