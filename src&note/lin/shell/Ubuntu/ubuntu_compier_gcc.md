sudo ntpdate time.nist.gov
sudo clock -w
sudo ifconfig eth0 192.168.1.10
./configure --enable-gui --enable-x11 --enable-gui --enable-menu --prefix=/usr/local 
ABI=32 ./configure --enable-cxx --prefix=/usr/local --docdir=/usr/local/share/doc/gmp-6.0
tar -xf mpfr-3.1.2.tar.xz 
cd mpfr-3.1.2/
patch -Np1 -i ../mpfr-3.1.2-upstream_fixes-3.patch 
./configure --prefix=/usr/local --enable-thread-safe --docdir=/usr/local/share/doc/mpfr-3.1
tar -xf mpc-1.0.2.tar.gz 
cd mpc-1.0.2/
./configure --prefix=/usr/local --docdir=/usr/local/share/doc/mpc-1.0.2
tar -xf isl-0.12.2.tar.bz2 
cd isl-0.12.2/
./configure --prefix=/usr/local --docdir=/usr/local/share/doc/isl-0.12
tar -xf cloog-0.18.1.tar.gz 
cd cloog-0.18.1/
./configure --prefix=/usr/local --with-isl=system  --docdir=/usr/local/share/doc/cloog-0.18.1
make && sudo make install
tar -xf gcc-4.9.2.tar.bz2 
cd gcc-4.9.2/
mkdir ../gcc-4.9.2-build
cd ../gcc-4.9.2-build/
SED=sed ../gcc-4.9.2/configure --prefix=/usr/local --enable-languages=c,c++ --disable-bootstrap --with-system-zlib
make && sudo make install 
sudo make install 
#1454045607
sudo ntpdate time.nist.gov
#1484625547
sudo clock -w
#1484633282
./configure --enable-gui --enable-x11 --enable-gui --enable-menu --prefix=/usr/local 
#1484712218
ABI=32 ./configure --enable-cxx --prefix=/usr/local --docdir=/usr/local/share/doc/gmp-6.0
#1484725606
tar -xf mpfr-3.1.2.tar.xz 
#1484725609
cd mpfr-3.1.2/
#1484725629
patch -Np1 -i ../mpfr-3.1.2-upstream_fixes-3.patch 
#1484725682
./configure --prefix=/usr/local --enable-thread-safe --docdir=/usr/local/share/doc/mpfr-3.1
#1484726093
tar -xf mpc-1.0.2.tar.gz 
#1484726097
cd mpc-1.0.2/
#1484726129
./configure --prefix=/usr/local --docdir=/usr/local/share/doc/mpc-1.0.2
#1484726204
tar -xf isl-0.12.2.tar.bz2 
#1484726208
cd isl-0.12.2/
#1484726275
./configure --prefix=/usr/local --docdir=/usr/local/share/doc/isl-0.12
#1484727813
tar -xf cloog-0.18.1.tar.gz 
#1484727818
cd cloog-0.18.1/
#1484728955
./configure --prefix=/usr/local --with-isl=system  --docdir=/usr/local/share/doc/cloog-0.18.1
#1484728998
make && sudo make install
#1484729213
tar -xf gcc-4.9.2.tar.bz2 
#1484729429
cd gcc-4.9.2/
#1484729442
mkdir ../gcc-4.9.2-build
#1484729448
cd ../gcc-4.9.2-build/
#1484729590
SED=sed ../gcc-4.9.2/configure --prefix=/usr/local --enable-languages=c,c++ --disable-bootstrap --with-system-zlib
#1484729627
make && sudo make install 
#1484732179
sudo make install 
