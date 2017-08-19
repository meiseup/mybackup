
```
../gcc-4.9.2/configure --disable-cloog-version-check --disable-isl-version-check   --prefix=/home/external/usr/tools/gcc-4.9.2 --enable-languages=c,c++ --disable-multilib --disable-bootstrap --with-system-zlib
```


gcc常用编译选项                                                     
 *-c
 *-E
 *-W
 *-f和-shared
 *-O
 *-D



1. 静态库(a)和动态库(so)             
  静态库创建修改打包工具ar            
  ```bash
  ar crsn test.a *.o
  ```

2. 创建一个共享库 
  ```bash
  gcc -fPIC -shared -o libtest.so *.c
  ```
gcc -Wall -fdiagnostics-color=auto -o float float.c
