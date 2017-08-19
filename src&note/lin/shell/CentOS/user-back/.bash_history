 su 
 sudo groupmod 
 sudo groupmod -g 501 kyzs 
 source /etc/profile
 sudo -E vim /etc/bashrc 
 sudo -E vim /etc/profile.d/lang.sh 
 sudo -E vim /etc/sysconfig/i18n 
 vim ~/.bashrc
 sudo -s
 sudo vim colorls.sh
sudo mount -t vboxsf -o rw Others /media/Others 
sudo mount -t vboxsf  Others /media/Others 
sudo mount -t vboxsf  Others /media/Others 
sudo mount -t vboxsf -o rw,uid=$UID,gid=500 Others /media/others 
sudo mount -t vboxsf Others /media/others/
sudo mount -t vboxsf lin /mnt/
sudo mount -t vboxsf Others /mnt/
sudo mount -t vboxsf Others /media/others
sudo mount -t vboxsf -o rw,uid=$UID,gid=500 Others /media/others
sudo wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-6.repo
sudo mount -t vboxsf -o rw,uid=$UID,gid=500 Others /media/others
sudo mdadm -C /dev/md0 -a yes -l 0 -n 4 /dev/sdb{1,2,3,5} 
sudo mkfs.ext4 -L "Raid0" /dev/md0 
sudo mdadm -D /dev/md0 
sudo mount -t ext4 -v -o rw /dev/md0 /media/raid
sudo mdadm -D /dev/md0 
sudo mdadm -C /dev/md0 -a yes -l0 -n2 /dev/sdb{3,4} 
sudo dmsetup status
sudo mount -t ext4 -v -o rw /dev/md0 /media/raid
cat /proc/mdstat 
exit
sudo mdadm -C /dev/md0 -v -a yes -l0 -n2 /dev/sdb[1-4]
sudo mdadm -C /dev/md0 -v -a yes -l0 -n2 /dev/sdb{1..4} 
sudo mdadm -C /dev/md0 -v -a yes -l0 -n2 /dev/sdb{1,2,3,4} 
sudo mdadm -C /dev/md0 -v -a yes -l0 -n4 /dev/sdb{1..4} 
sudo mdadm -C /dev/md0 -v -a yes -l0 -n4 /dev/sdb{1..4} 
sudo mdadm -A /dev/md0 /dev/sdb{1..4} 
sudo mount -t ext4 -v /dev/md0 /media/raid 
sudo mount -t ext4 /dev/md0 /media/raid 
sudo mount /dev/md0 /media/raid 
sudo mount -t ext4 -v -o rw /dev/md0 /media/raid 
sudo yum install dos2unix
sudo yum install zsh
wget -P ~/back   wget http://mirrors.yun-idc.com/epel/6/i386/epel-release-6-8.noarch.rpm
wget -P ~/back  http://mirrors.yun-idc.com/epel/6/i386/epel-release-6-8.noarch.rpm
wget -P ~/back http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm 
sudo wget http://mirrors.aliyun.com/repo/epel-6.repo
sudo yum install bash-completion gromacs-bash  python-argcomplete python-optcomplete
sudo yum install autojump-zsh gromacs-zsh
sudo yum install autojump-zsh gromacs-zsh
sudo mdadm -A /dev/md0 /dev/sdb{1..4} 
sudo mount -t ext4 -v -o rw /dev/md0 /media/raid 
sudo chkconfig --level=2345 mdmonitor off 
sudo mount -t vboxsf -o rw,uid=$UID,gid=500 Others /media/others
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/Vundle
git clone https://github.com/terryma/vim-multiple-cursors.git
vim ~/.vimrc
sudo mount -t vboxsf -o rw,uid=$UID,gid=500 Others /media/others
git clone git://github.com/majutsushi/tagbar
git clone https://github.com/samlaudev/ConfigurationFiles
sudo mount -t vboxsf -o rw,uid=$UID,gid=500 Others /media/others
git clone https://github.com/eugeii/consolas-powerline-vim
sudo mount -t vboxsf -o rw,uid=$UID,gid=500 Others /media/others
git clone  https://github.com/edkolev/promptline.vim
sudo mount -t vboxsf -o rw,uid=$UID,gid=500 Others /media/others
git clone  https://github.com/edkolev/promptline.vim
git clone https://github.com/itchyny/lightline.vim
git clone https://github.com/Valloric/YouCompleteMe
sudo yum install automake gcc gcc-c++ kernel-devel cmake pythone-devel pythone3-devel 
sudo yum install python-devel python3-devel 
sudo python34-devel 
sudo yum install python34-devel 
git submodule update --init --recursive 
sudo yum install clang clang-devel 
./install.py --clang-completer
cd ~/.vim/bundle/YouCompleteMe/third_party/ycmd/clang_archives
sudo mount -t vboxsf -o rw,uid=$UID,gid=500 Others /media/others
sudo mount -t vboxsf -o rw,uid=$UID,gid=500 Others /media/others
./install.py --clang-completer
./install.py --clang-completer
sudo mount -t vboxsf -o rw,uid=$UID,gid=500 Others /media/others
yum install clang clang-devel cmake llvm llvm-devel llvm-libs 
sudo yum install clang clang-devel cmake llvm llvm-devel llvm-libs 
sudo yum install mysql mysql-devel mysql-libs mysql-server qt-mysql qt3-mysql qt5-mysql mysql++-devel  mysql++-manuals  mysql-utilities
sudo yum install qt-MySQL qtqt5-qtbase-mysql
mysql_secure_installation 
mysql
mysql -uroot 
cmake -G "Unix Makefiles" -DPATH_TO_LLVM_ROOT=/var/tmp/clang+llvm-3.9.0-i586-opensuse13.2 . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
cmake -G "Unix Makefiles" -DUSE_SYSTEM_LIBCLANG=ON . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
cmake --build . --target ycm_core --config Release 
./install.py --clang-completer
cd ~/.vim/bundle/YouCompleteMe/third_party/ycmd/clang_archives
./install.py --clang-completer
sudo mount -t vboxsf -o rw,uid=$UID,gid=500 Others /media/others
yum install clang clang-devel cmake llvm llvm-devel llvm-libs 
sudo yum install clang clang-devel cmake llvm llvm-devel llvm-libs 
sudo yum install mysql mysql-devel mysql-libs mysql-server qt-mysql qt3-mysql qt5-mysql mysql++-devel  mysql++-manuals  mysql-utilities
sudo yum install qt-MySQL qtqt5-qtbase-mysql
mysql_secure_installation 
mysql
mysql -uroot 
cmake -G "Unix Makefiles" -DPATH_TO_LLVM_ROOT=/var/tmp/clang+llvm-3.9.0-i586-opensuse13.2 . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
cmake -G "Unix Makefiles" -DUSE_SYSTEM_LIBCLANG=ON . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
cmake --build . --target ycm_core --config Release 
./contrib/download_prerequisites 
ABI=32 ./configure --prefix=/usr/local --enable-cxx --dordir=/usr/local/share/doc/gmp-6.0a
ABI=32 ./configure --prefix=/usr/local --enable-cxx --docdir=/usr/local/share/doc/gmp-6.0a
SED=sed ../gcc-4.9.2/configure --prefix=/usr/local --enable-languages=c,c++ --disable-bootstrap --with-system-zlib --enable-c++11
wget http://ftp.gnu.org/gnu/libc/glibc-2.17.tar.xz
tar -xf /media/others/Temp/lfs_sr/lfs-package/sources/glibc-2.17.tar.xz
wget ftp://ftp.vim/org/pub/vim/unix/vim-7.4.tar.bz2
sudo yum install python34 
sudo yum install python-devel
../configure --prefix=/usr --disable-profile --enable-add-ons --with-headers=/usr/include --with-binutils=/usr/bin 
make 
 su - root 
sudo mount -t vboxsf -o rw,uid=$UID,gid=500 Others /media/others
sudo yum install mysql mysql-devel mysql-libs mysql-server qt-mysql qt3-mysql qt5-mysql mysql++-devel  mysql++-manuals  mysql-utilities;sudo yum install qt-MySQL qtqt5-qtbase-mysql]
sudo yum install mysql mysql-devel mysql-libs mysql-server qt-mysql qt3-mysql qt5-mysql mysql++-devel  mysql++-manuals  mysql-utilities;sudo yum install qt-MySQL qtqt5-qtbase-mysql
mysql_secure_installation 
mysql
mysql -uroot
mysql -uroot 
mysql -uroot -p
sudo yum install bash-completion gromacs-bash  python-argcomplete python-optcomplete;sudo yum install autojump-zsh gromacs-zsh;sudo yum install autojump-zsh gromacs-zsh
sudo yum install libotf 
sudo mount -t vboxsf -o rw,uid=$UID,gid=500 Others /media/others
sudo yum update 
sudo yum install mysql mysql-devel mysql-libs mysql-server qt-mysql qt3-mysql qt5-mysql mysql++-devel  mysql++-manuals  mysql-utilities;sudo yum install qt-MySQL qtqt5-qtbase-mysql]
sudo yum install mysql mysql-devel mysql-libs mysql-server qt-mysql qt3-mysql qt5-mysql mysql++-devel  mysql++-manuals  mysql-utilities;sudo yum install qt-MySQL qtqt5-qtbase-mysql
mysql_secure_installation 
mysql
mysql -uroot
mysql -uroot 
mysql -uroot -p
sudo yum install bash-completion gromacs-bash  python-argcomplete python-optcomplete;sudo yum install autojump-zsh gromacs-zsh;sudo yum install autojump-zsh gromacs-zsh
sudo yum install libotf 
sudo mount -t vboxsf -o rw,uid=$UID,gid=500 Others /media/others
sudo yum update 
ABI=32 ./configure --prefix=/usr/local --enable-cxx --docdir=/usr/local/share/doc/gmp-6.0
make html
tar -xf mpfr-3.1.2.tar.xz 
cd mpfr-3.1.2/
patch -Np1 -i ../mpfr-3.1.2-upstream_fixes-3.patch 
./configure --prefix=/usr/local --enable-thread-safe --docdir=/usr/local/share/doc/mpfr-3.1.2
tar -xf mpc-1.0.2.tar.gz 
cd mpc-1.0.2/
./configure --prefix=/usr/local --docdir=/usr/local/share/doc/mpc-1.0.2 
./configure --prefix=/usr/local --with-isl-prefix=/usr/local 
cd isl-0.12/
./configure --prefix=/usr/local  
tar -xf cloog-0.18.0.tar.gz 
./configure --prefix=/usr/local --docdir=/usr/local/share/doc/cloog-0.18.0 --with-isl=system
make 
tar -xf gcc-4.9.2.tar.bz2 
cd gcc-4.9.2/
mkdir -pv ../gcc-build
cd ../gcc-build/
SED=sed ../gcc-4.9.2/configure --prefix=/usr/local --enable-languages=c,c++ --disable-bootstrap --with-system-zlib 
make -j2 
sudo make install 
sudo yum install tftp{,-server}
/lib/libc.so.6 
ldd /bin/ls|grep glibc
ldd /bin/ls|grep libc
yum install bash-completion
sudo yum install bash-completion
paci zsh tcsh mc
sudo yum install -y zsh tcsh mc
sudo umount /media/others/
sudoe /etc/grub.conf 
sudo mount -t vboxsf -o rw,uid=$UID Others /media/others
sudo mount -t vboxsf -o rw,uid=$UID,gid=500 Others /media/others
