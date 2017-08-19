本地JNI(Jave Native Interface)调用C库
```Java
//Test.java
public class Test{
  native void test();
  static{
    System.loadLibrary("test");
  }
  public static void main(String args[]){
    new Test().test();
  }
}
```

编译java
```bash
javac Test.java
```
用javah生成类似C的头文件
```bash
javah [-jni] Test //Test是无后缀的Class文件
cp Test.h test.c
```

```c
//test.c
#include "Test.h"
void Java_Test_test(JNIEnv *env,jobject job)
{
  //C实现
}
```

将C编译成与地址无关的动态库
如果java是符号链接

```bash
jdk=$(readlink `which java`)
jdk=${jdk%/*}
gcc -fPIC -shared -I$jdk/../include/{,linux} -o libtest.so test.c
执行java
LD_LIBRARY_PATH=. javaTest
```
 
vim:set ft=markdown:
