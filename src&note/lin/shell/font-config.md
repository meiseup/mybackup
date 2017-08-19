fontconfig基本配置：
现代Linux使用了FreeType2来渲染文字，配置文件在 /etc/fonts/fonts.conf、/etc/fonts/conf.d、$xdg_home/.config/fontconfig/fonts.conf、$xdg_home/.config/fontconfig/conf.d

fontconfig基本配置：
/etc/fonts/conf.d/99-base.conf
<?xml version='1.0' encoding='utf-8'?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
<!-- 启用抗锯齿 -->
<match target="font">
<edit name="antialias" mode="assign">
<bool>true</bool>
</edit>

<!-- 启用亚像素 -->
<edit name="rgba" mode="assign">
<const>rgb</const>
</edit>

<!-- 自动微调 -->
<edit name="autohint" mode="assign">
<bool>true</bool>
</edit>

<!-- 启用BCL解释器 -->
<edit name="hitstyle" mode="">
<const>hitfull</const>
</edit>

<!-- 显示器过滤 -->
<edit name="lcdfilter" mode="assign">
<const>lcddefault<const>
</edit>

</match>
</fontconfig>

/etc/fonts/conf.d/60-latain-free.conf
<?xml version='1.0' encoding='utf-8'?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>
<alias>
<family>monospace</family>
<prefer>
<family>Libration Mono</family>
.....................
</prefer>
</alias>
</fontconfig>

