Firefox:一款免费的高自定义浏览器
Firefox设置: about:preferences#general
Firefox插件管理：about:addons
插件：Adblock plus,专业级的广告拦截
插件：Firebug,专业级网页js..等调试工具
插件：Nosquint,让网页能自动进行缩放
插件：UnMhtm,使网页可以另存为mhtm文档
插件：Stylish,让火狐浏览器可以使用自定义样式表
在附加组件about:addons -> 搜索并安装Stylish -> 打开Stylish，点击编写一个样式表或者搜索网络上的样式表来自定义页面样式
注意:样式表设置的字体必须已经安装到系统中，否则会使用系统字体。自定义样式表会影响火狐浏览器所有地方，包括菜单栏
！最好不要在样式表重设字体参数，因为这可能会打乱原网页的页面布局和显示方式

Firefx高级配置选项：about:config

固定一组相同网址的网页缩放比列，值为true;默认为false,此值为true时会与Firefox插件Nosquint冲突
browser.zoom.full
browser.zoom.siteSpecific
browser.zoom.updateBackgroundTabs

验证插件的签名，值如果为false，则不对插件的签名进行验证，默认为true;
xpinstall.signatures.required
windows: k_y_z_s@yeah.net psk:_512xie36_
Linux: k_y_z_s@126.com psk:_512xie36_
