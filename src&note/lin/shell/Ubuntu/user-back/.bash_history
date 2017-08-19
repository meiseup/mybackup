sudo apt-get install -y vim
sudo apt-get install -y chromium-browser pepperflashplugin-nonfree  adobe-flashplugin  chromium-browser-l10n 
s vim install-sun-java6.sh 
tar  --strip-components=3 -xf linux_tools.tgz
tar  --strip-components=3 -xvf linux_tools.tgz
sudo tar --strip-components=3 -xvf linux_tools.tgz -C /usr/local/bin
tar --recursive-unlink -xvf linux_tools.tgz 
#1487552776
sudo apt install gperf
#1487553009
pushd /home/external/android/
#1487553098
sudo apt install bison
#1487553232
sudo apt install xsltproc
#1487553280
sudo apt install libcore
#1487554363
sudo apt install g++ dpkg-dev gcc-multilib g++-4.8-multilib
#1487558068
pushd /home/external/android/android-4.2.2_r1/
make -j4
cd /home/external/android/
#1487665558
fastboot flash ramdisk android/android-4.2.2_r1/out/target/product/tiny4412/ramdisk.img 
#1487554363
sudo apt install g++ dpkg-dev gcc-multilib g++-4.8-multilib
#1487558068
pushd /home/external/android/android-4.2.2_r1/
#1487639075
make -j4 
#1487639075
make -j4
#1487639075
cd /home/external/android/
#1487639282
sudo apt install xfsprogs reiserfsprogs reiser4progs jfsutils kpartx dmraid gpart
#1487641744
showmount -e localhost 
#1487644111
sudo fusermount /mnt/
#1487644128
sudo fusermount -u /mnt/
#1487644266
sudo sshfs -o allow_other ubuntu@localhost:/home/external /mnt
#1487644281
sudo fusermount -u /mnt 
#1487644651
sudo mount -t nfs localhost:/home/external /mnt
#1487644686
sudo umount -v /mnt 
#1487664684
sudo ufw disable 
#1487664703
sudo apt-get remove iptables
#1487664812
sudo service nfs-kernel-server start 
#1487665009
sudo ifconfig eth0 192.168.1.10
#1487665642
sudo apt-get install gstreamer1.0-plugins*
#1487667389
sudo dnw E4412_N.bl1.bin 
#1487667497
sudo dnw bl2.bin 
#1487667578
dnw ../../u-boot.bin 
#1487667585
sudo dnw ../../u-boot.bin 
#1487667631
sudo dnw E4412_tzsw.bin 
#1487668005
sudo -s
#1487660898
tar -xf linux-3.5-20131028.tgz 
#1487660993
cp -f tiny4412_android_defconfig .config 
#1487661011
vim Makefile 
#1487661991
sudo apt install libncursesw5{,-dev}
#1487662075
make menuconfig
#1487662218
make -j3
#1487665251
sudo minicom
#1487666558
sudo minicom 
#1487668013
fastboot -w
#1487668065
fastboot flash kernel tiny4412/bunfly/source_code/linux-3.5/arch/arm/boot/zImage 
#1487668152
fastboot flash ramdisk android/android-4.2.2_r1/out/target/product/tiny4412/ramdisk.img 
#1487668188
fastboot flash system android/android-4.2.2_r1/out/target/product/tiny4412/system.img 
#1487672761
mkimage -A arm -O linux -T ramdisk -C none -a 0x40008000 -n "ramdisk" -d ramdisk.img ramdisk-uboot.img
#1487671817
sudo apt-get install uboot-mkimgage
#1487671827
sudo apt-get install uboot-mkimage
#1487671848
sudo apt-get install u-boot-tools
#1487673103
mkimage -A arm -O linux -T ramdisk -C none -a 0x40000000 -n "ramdisk" -d ramdisk.img ramdisk-uboot.img
#1487673483
sudo apt-get install kvm
#1487673632
emulator
#1487670978
sudo minicom 
#1487732002
sudo ifconfig eth0 192.168.1.10
#1487732196
sudo fastboot -w
#1487738087
sudo minicom 
#1487738165
sudo dnw arch/arm/boot/zImage 
#1487738181
sudo ifconfig 192.168.1.10
#1487738189
sudo ifconfig eth0 192.168.1.10
#1487726989
sudo apt-get install android-tools-fsutils -y
#1487727396
sudo apt-get install zlib -y
#1487728210
simg2img system.img system.img.ext4
#1487728533
simg2img old_img/system.img new_img/system.img
#1487728564
simg2img old_img/userdata.img new_img/data.img
#1487729765
cpio -pv ../../android-4.2.2 < ramdisk
#1487730938
sudo mount -o loop system.ext4.img ../../android-4.2.2/system
#1487731130
gunzip -kC -S.img ramdisk.img | cp -iv -
#1487731145
gunzip -kC -S.img ramdisk.img | cpio -iv -
#1487731230
gunzip -kvc -S.img ramdisk.img | cpio -iv -
#1487731249
gunzip -kvc -S.img ramdisk.img | cpio -iv 
#1487731422
sudo mount -o loo data.img ../android-4.2.2/data
#1487731467
sudo mount -o loop data.img ../android-4.2.2/data
#1487731525
sudo mount -o loop cache.ext4.img ../android-4.2.2/cache
#1487731777
sudo minicom 
#1487731467
sudo mount -o loop data.img ../android-4.2.2/data
#1487731525
sudo mount -o loop cache.ext4.img ../android-4.2.2/cache
#1487746665
pushd /home/external/Share/tiny4412/bunfly/source_code/
#1487746677
tar -xf uboot_tiny4412-20130729.tgz 
#1487754885
find . | cpio -ov -H newc | gzip > ../ramdisk-tmp.img
#1487755294
make_ext4fs -s -l 330000000 -a system system-new.img 
#1487755419
make_ext4fs -s -l 330000000 -a system system-new.img system
#1487756739
gunzip -kcv -S.img ../ramdisk.img | cpio -iv
#1487756836
find . | cpio -ov -H newc | gzip > ../ramdisk-uboot.img
#1487756892
mkimage -A arm -O linux -C none -a 0x40800000 -n "ramdisk" -d ramdisk-tmp.img ramdisk-uboot.img
#1487759257
make_ext4fs -s -l 330000000 -a data data.img data
#1487759370
sudo minicom 
#1487759751
sudo dnw E4412_N.bl1.bin 
#1487759863
sudo dnw bl2.bin 
#1487759909
sudo dnw ../../u-boot.bin 
#1487759969
sudo dnw E4412_tzsw.bin 
#1487760135
fastboot -w
#1487760156
sudo fastboot -w
#1487760304
sudo fastboot flash kernel zImage
#1487760332
sudo fastboot flash ramdisk ramdisk-uboot.img
#1487760384
sudo fastboot flash system system-new.img 
#1487812942
pushd /home/external/android-4.2.2
#1487812957
pushd /home/external/Share/tiny4412/bunfly/source_code/linux-3.5
#1487813012
pushd /home/external/Share/android/android-4.2.2_r1/out/target/product/tiny4412
#1487813017
pushd /home/external/Share/android/android-4.2.2_r1
#1487814777
pushd /home/external/Share/tiny4412/
#1487814977
pushd /tmp
#1487814985
sudo minicom 
#1487819212
apt install sysv-rc-conf
#1487819220
sudo apt install sysv-rc-conf -y
#1487819482
sudo apt-get install xubuntu-desktop -y
#1487822641
vim drivers/mmc/core/mmc.c 
#1487825003
sudo minicom
#1487825779
sudo fastboot flash kernel zImage 
#1487839351
sudo minicom 
#1487912548
less /usr/share/doc/bash/examples/startup-files/bashrc 
#1487912653
less /usr/share/doc/bash/examples/startup-files/Bash_aliases 
#1487912678
less /usr/share/doc/bash/examples/complete/bash_completion 
#1487912734
less /usr/share/doc/bash/examples/complete/complete-examples 
#1488161239
sudo ifconfig eth0 192.168.1.10
#1488157711
sudo minicom 
#1488173938
sudo apt-get install lib32z1 lib32ncurses5 lib32bz2-1.0 lib32stdc++6
#1488177845
make -j3 sdk
#1488185163
sudo update-alternatives --install "/usr/bin/javah" "javah" "`pwd`/javah" 1
#1488187994
sudo pkill NetworkManager 
#1488189549
android list
#1488189565
android list target
#1488189549
android list
#1488189565
android list target
#1488248460
android list targetn
#1488248466
LD_LIBRARY_PATH=. java person 
#1488248622
gcc -fPIC -shared -I/home/external/Share/android/tools/jdk6u43/include/{,linux} -o libperson.so person.c
#1488248758
LD_LIBRARY_PATH=. java person 
#1488250219
emulator -kernel $tmp2/kernel-qemu-armv7 -sysdir $tmp -system system.img -data userdata.img -ramdisk ramdisk.img
#1488250235
emulator -kernel $tmp2/kernel-qemu-armv7 -sysdir $tmp -system system.img -data userdata.img -ramdisk $tmp/ramdisk.img
#1488251226
emulator -system system.img -data ./out/target/product/tiny4412/userdata.img -ramdisk ./out/target/product/tiny4412/ramdisk.img
#1488251226
emulator -system system.img -data ./out/target/product/tiny4412/userdata.img -ramdisk ./out/target/product/tiny4412/ramdisk.img
#1488259845
sudo apt-get install exfat-* -y
#1488265699
emulator -help
#1488272466
emulator -shell -sysdir /home/external/Share/android/android-4.2.2_r1/out/target/product/tiny4412 -system system.img -ramdisk /home/external/Share/android/android-4.2.2_r1/out/target/product/tiny4412/ramdisk.img -avd test
#1488273949
android create -n test -t 1 -p . -a TestActivity -k test.android 
#1488274043
android create project -n test -t 1 -p . -a TestActivity -k test.android 
#1488274126
android create project -n test -t 1 -p ./test -a TestActivity -k test.android 
#1488330508
sudo apt-get install libreoffice-l10n-zh-cn unoconv 
#1488350147
find /home/external/Share/android/android-sdk-linux/tools/ -name "mmm“
#1488350151
find /home/external/Share/android/android-sdk-linux/tools/ -name "mmm"
#1488354733
export ANDROID_PRODUCT_TOP=`pwd`
#1488354820
export ANDROID_PRODUCT_out=`pwd`
#1488354983
mmm /home/external/back/tmp/java/test
#1488424695
android create project -n test -t 1 -p ./test -a Test -k test.android 
#1488424743
mmm /home/external/back/tmp/java/test
#1488425901
android create project -n test -t 1 -p ./test -a Test -k test.android 
#1488427601
mmm /home/external/back/tmp/java/test
#1488434677
sudo vim /etc/udev/rules.d/50-android.rules
#1488434878
sudo chmod a+rx /etc/udev/rules.d/50-android.rules 
#1488434890
sudo service udev restart 
#1488436693
mmm /home/external/back/tmp/java/test
#1488439756
mmm /home/external/back/tmp/java/test
#1488448785
mmm /home/external/back/tmp/java/test2/jni
#1488502579
mmm /home/external/back/tmp/java/test2/jni
#1488504806
sudo apt-get install android-tools-adb
#1488505057
sudo apt-get remove android-tools-adb
#1488434677
sudo vim /etc/udev/rules.d/50-android.rules
#1488434878
sudo chmod a+rx /etc/udev/rules.d/50-android.rules 
#1488434890
sudo service udev restart 
#1488436693
mmm /home/external/back/tmp/java/test
#1488439756
mmm /home/external/back/tmp/java/test
#1488504806
sudo apt-get install android-tools-adb
#1488505057
sudo apt-get remove android-tools-adb
#1488526980
mmm /home/external/back/tmp/java/test2/jni
#1488529707
mmm /home/external/back/tmp/java/test2/test
#1488530970
mmm /home/external/back/tmp/java/test2/jar
#1488531122
mmm /home/external/back/tmp/java/test2
#1488599526
mmm /home/external/back/tmp/java/test2/apk
#1488599560
mmm /home/external/back/tmp/java/test2/jar
#1488600983
sudo apt-get install android-tools-adb
#1488601266
sudo apt-get remove android-tools-adb
#1488531122
mmm /home/external/back/tmp/java/test2
#1488600983
sudo apt-get install android-tools-adb
#1488601266

#1488610070
:wq
#1488610296
mmm /home/external/back/tmp/java/test2/apk
#1488611240
mmm /home/external/back/tmp/java/test2/jar
#1488762450
mmm /home/external/back/tmp/java/test2/apk
#1488762209
android create project -n led -k andorid.test -p ./led -a Led 
#1488762223
android create project -t 1 -n led -k andorid.test -p ./led -a Led 
#1488762769
mmm /home/external/back/tmp/java/test2/apk
#1488767336
wget http://prdownloads.sourceforge.net/ctags/ctags-5.6.tar.gz
#1488600983
sudo apt-get install android-tools-adb
#1488610070
:wq
#1488610296
mmm /home/external/back/tmp/java/test2/apk
#1488611240
mmm /home/external/back/tmp/java/test2/jar
#1488762450
mmm /home/external/back/tmp/java/test2/apk
#1488762209
android create project -n led -k andorid.test -p ./led -a Led 
#1488762223
android create project -t 1 -n led -k andorid.test -p ./led -a Led 
#1488762769
mmm /home/external/back/tmp/java/test2/apk
#1488779849
ls
#1488779885
mmm /home/external/back/tmp/android/test2/apk
#1488781828
mmm /home/external/back/tmp/android/test2/jar
#1488786086
adb uninstall android.test 
#1488786869
adb install Led.apk 
#1488787449
mmm /home/external/back/tmp/android/led
#1488779567
mmm /home/external/back/tmp/android/test2/apk
#1488940641
vim led_mod.c 
#1488952211
l 
#1488960739
adb push ../bin/ledtest /system/xbin
#1488961481
mmm /home/external/back/tmp/android/led/jni
#1488940641
vim led_mod.c 
#1488949488
make ledtest
#1488949687
mmm /home/external/back/tmp/android/led/jni
#1488951902
ls
#1488952211
l 
#1488960739
adb push ../bin/ledtest /system/xbin
#1488940641
vim led_mod.c 
#1488949488
make ledtest
#1488964965

#1488965323
mmm /home/external/back/tmp/android/led/jni
#1488968423
mmm /home/external/back/tmp/android/led
#1488968450
java -jar signapk.jar platform.x509.pem platform.pk8 Led-tmp.apk Led.apk
#1488964017
mmm /home/external/back/tmp/android/led/jni
#1489032065
w
#1489107355
mmm /home/external/back/tmp/android/led/jni
#1488949488
make ledtest
#1488968450
java -jar signapk.jar platform.x509.pem platform.pk8 Led-tmp.apk Led.apk
#1489032065
w
#1489121451
mmm /home/external/back/tmp/android/checkbox
#1489126795
mmm /home/external/back/tmp/android/led/jni
#1489128495
mmm /home/external/back/tmp/android/led
#1489129718
import android.widget.CompoundButton;
#1489129718
import android.widget.CompoundButton.OnCheckedChangeListener;import android.widget.CompoundButton;
#1489135287
sudo apt-get install ncurses-*
#1489135332
sudo apt-get install ncurses-base ncurses-doc ncurses-examples 
#1489135897
sudo apt install libncurses5-dev
#1489135957
sudo apt install libncursesada2-dev
#1489112703
vim src/led/test/Led.java 
#1489117915
android create project -t 1 -p ./checkbox -a CheckBoxTest -k test.check -n checkbox
#1489121411
mmm /home/external/back/tmp/android/checkbox
#1489213177
cd graphis/ncurses/
#1489213496
sudo apt install libncurses5-dev
#1489135287
sudo apt-get install ncurses-*
#1489135332
sudo apt-get install ncurses-base ncurses-doc ncurses-examples 
#1489135897
sudo apt install libncurses5-dev
#1489135957
sudo apt install libncursesada2-dev
#1489112703
vim src/led/test/Led.java 
#1489117915
android create project -t 1 -p ./checkbox -a CheckBoxTest -k test.check -n checkbox
#1489121411
mmm /home/external/back/tmp/android/checkbox
#1489213177
cd graphis/ncurses/
#1489213496
sudo apt install libncurses5-dev
#1489388717
l 
#1489390595
adb shell rm -f /data/local/ledtest.ko
#1489392260
l ls
#1489392296
ls
#1489394729
mmm /home/external/back/misc/android/led/jni
#1489394735
mmm /home/external/back/misc/android/led
#1489395321
adb push ledtest.ko /data/local
#1489395321
adb push ledtest.ko /data/local
#1489454530
ls
#1489455409
cpio -ivmd < ../ramdisk.img 
#1489455492
find . | cpio -ov -H newc | gzip > ../ramdisk-uboot.img&&mkimage -A arm -O linux -C none -a 0x40800000 -n "ramdisk" -d ramdisk-tmp.img ramdisk-uboot.img
#1489455517
find . | cpio -ov -H newc | gzip > ../ramdisk-uboot.img&&mkimage -A arm -O linux -C none -a 0x40800000 -n "ramdisk" -d ../ramdisk-tmp.img ramdisk-uboot.img
#1489455538
find . | cpio -ov -H newc | gzip > ../ramdisk-tmp.img&&mkimage -A arm -O linux -C none -a 0x40800000 -n "ramdisk" -d ../ramdisk-tmp.img ramdisk-uboot.img
#1489456161
mmm /home/external/back/misc/android/led/jni
#1489456251
mmm /home/external/back/misc/android/led
#1489454018
make_ext4fs -s -l 330000000 -a system system-new.img system
#1490064872
mmm /home/external/back/misc/android/led
#1490179018
sudo add-apt-repository ppa:maarten-baert/simplescreenrecorder
#1490179240
sudo apt-get install simplescreenrecorder*
