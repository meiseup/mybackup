所有的gtk程序都要包含头文件gtk.h,然而这个头文件在不同的Linux发行的位置却不是一样的。
函数原型：gtk_init(int *argc,char ***argv);
从命令行参数初始化窗口，这是所有gtk图形程序都要做的工作
gtk_init(&argc,&argv);
创建一个新的顶级窗口,参数GTK_WINWOW_TOPLEVEL告诉这个窗口是顶级窗口
gtk_window_new(GTK_WINDOW_TOPLEVEL);
一旦这个函数成功调用，就会返回一个指向GtkWidget的指针。然而这个函数调用并不会让顺带将新创建的窗口显示出来。
要将窗口显示出来还要调用gtk_widget_show和gtk_main;这也是每个gtk程序都要做的工作。
gtk_widget_show(window);
gtk_main(); //开始主循环，等待X窗口事件连接.然而，在没有连接到信号之前，这个程序却是连自己退出都做不到。
GTK程序处理信号和事件的方式的函数:
g_signal_connect();
g_signal_connect_swapped();
事件：
activate
destroy
delete_event
 vim:set filetype=markdown: 
