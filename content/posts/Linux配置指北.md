---
title: "Linux配置指北"
date: 2023-09-15T14:09:15+08:00
draft: false
featured_image: "/assets/blossom_full.jpeg"
tags: ["技术"]
---

#  Linux配置指北

> 由于今晚就要换一台mbp 16,所以写一篇blog记录自己是如何配置Linux, 最后说说为什么要换成mac

###  系统设置：

这次装机选择了Arch下的Manjaro, 原因很简单，Ubuntu下有太多难以安装的软件包了。而Arch的包管理器采用滚动更新，在AUR的加持下可以安装似乎所有最新的软件。另外，Arch有一个非常好的[中文文档](https://wiki.archlinuxcn.org/wiki/%E9%A6%96%E9%A1%B5)和[论坛](https://bbs.archlinuxcn.org/)。使用Manjaro的原因是它在Arch之上又覆盖了更多的常用配置和软件，类似 zsh等。他俩的关系类似于 Debian和 Ubuntu

但缺点是你的包一更新它就会提示你更新，有点烦人，一些软件如gnome的更新可能导致它的插件用不了。还有现在新版的Linux都有一个由系统维护/使用的Python, 对我等环境洁癖不是很友好

在约莫半年的使用过程中，系统还挂了一次，还好使用回滚更新后救了回来

如果再让我选一次使用哪个系统，我大概会尝试一下[NixOS](https://nixos-and-flakes.thiscute.world/zh/)，Reproducible builds的概念让它像个大号Docker。如果使用Nix的话大概率我就不会写这篇blog了叭

软件：

- [Clash-Verge](https://github.com/zzzgydi/clash-verge) 真正的开源+跨三平台，薄纱某ForWin

- Scrcpy 用于镜像及操作安卓手机屏幕

  小故事：在某次坐火车的时候把Mi 10屏幕摔碎了，屏幕上部80%区域都无法触摸，无法输入密码和指纹解锁，最后连自己坐哪里都是问了列车员才知道的

  然后就是开动脑筋环节，首先想到了`adb`。在借用领座大叔的热点和网友智慧之后，成功通过`adb shell input text password`解锁手机，那一刻感觉自己又活过来了。再使用Scrcpy用笔记本操纵手机，给自己打了个车回海淀。又使用手机的touch pad软件坚持了两个月直到iPhone 15发售

  最后，分享一个代码用于搜索端口号连接手机`adb connect 10.206.50.13:$(nmap 10.206.50.13 -p 37000-44000`。

- Solaar 用于配置天下第一鼠标罗技MX Anywhere 2s，如果要使用Rule Editor记得要把按键设置成Diversion，我平时会配置中键关闭`ctrl+w`，dpi键`ctrl+←`，侧键分别是`ctrl(+shift)+tab`，三个键联合开源极大提高网页浏览体验，再加上无极滚轮，爽的嘞。

- YesPlayMusic 跨平台，网抑云音乐的替代，颜值太高了，尤其是在歌词界面打开全屏，但如果歌单有会员歌曲，跳下一首的延时有点高

- [qBittorrent-Enhanced-Edition](https://github.com/c0re100/qBittorrent-Enhanced-Edition) 跨平台，补全了Linux qBit的功能，如Tracker

- Zotero 阅读PDF的最佳工具，插件系统yyds

- Typora 最佳Markdown编辑器，免费版本：`typora-free-cn`

- LinuxQQ 闪退时`rm -rf .config/QQ`，不要更新版本

- WPS 挺失望的，配置麻烦，兼容性差，体验很差

- VLC 挺失望的，做了这么久的视频播放器还这么不成熟，体验很差

快捷键：

- 将某个窗口置于前台
	```bash
	#!/bin/bash 
	if pgrep "code" > /dev/null; then
  wmctrl -a "Visual Studio Code"
	else
  code &  
	fi
	```

- 打开剪贴板、音乐相关及窗口设置

- 取色器使用eyedropper

- 英文OCR：Normcap

###  桌面设置：

桌面系统使用了gnome, 原因是因为觉得KDE没有美感，设置界面也太丑了，另外对gnome的配置也熟悉一点

导航栏使用了[Plank](https://launchpad.net/plank)，主要原因是好看，主题是[Catalinas_Original-Pill](https://www.gnome-look.org/p/1311056/)魔改。但是Plank非常容易出现崩溃和小bug，dockitem存储在`.config/plank/dock1/launchers/`

另外，它识别StartupWMClass时区分大小写，遇到一个应用两个窗口要结合前面的xprop手动修改launcher的StartupWMClass

- grub 主题使用[Fallout](https://www.gnome-look.org/p/1230882)， ~~还发了一个PR, 可惜被另一个类似PR覆盖了~~

- Fonts：MiSans, CascadiaCode, Fira Code

- Cursor: Bibata-Modern-Ice, icons: Fluent

- extensions: 见页尾

###  终端配置：

- fish是一个不错的shell, 配置少，开箱即用
- aria2c 个人认为是最强下载器
- .tmux.conf  `set -g mouse on` 在tmux窗口中开启鼠标功能，`set-option -g default-shell /bin/fish `设置默认shell
- xprop 获取光标点击的窗口信息
- xdgmime可以配置xdg-open的打开方式
- alias man=[tldr](https://github.com/dbrgn/tealdeer)

###  额外备份项：

- 浏览器：ublock blacklist、onetab、tampermonkey导出
- 终端：vimrc、zshrc、.tmux.conf
- 插件：gnome-extensons-sync
- 配置：Clash-Verge配置文件、VSCode配置文件、SSH配置文件(公钥、私钥、knowhosts)

###  为什么使用Mac：

> Steve Jobs: **People who are really serious about software should make their own hardware**

简而言之：Apple Silicon

果壳的课程安排是，中午只有一个半小时，下午只有一个小时休息时间，中间根本没有给笔记本充电的机会。另外，每周都需要开会。Win本只要两三个小时就基本寄了(Lenovo Yoga 16s)，续航尿崩。另外现在有了充裕的服务器，不需要NVIDIA显卡了

此时我发现，身边一半的人都在用Mac。另外也确实眼馋Mac的屏幕(Mini LED+ProMotion)、摄像头(比镜子好用多了)、续航等。刚好今天抢购iPhone 15, 就顺便一起买了个mbp16

--- 

<details>
<summary>gnome-extensions</summary> {"extensions":{"unlockDialogBackground@sun.wxg@gmail.com":{"/org/gnome/shell/extensions/unlock-dialog-background/":"[/]\npicture-uri='/home/forceless/Pictures/107533107_p0_master1200.jpg'\npicture-uri-dark='/home/forceless/Pictures/107533107_p0_master1200.jpg'"},"bluetooth-quick-connect@bjarosze.gmail.com":{"/org/gnome/shell/extensions/bluetooth-quick-connect/":"[/]\nbluetooth-auto-power-on=true\ndebug-mode-on=true\nkeep-menu-on-toggle=true\nrefresh-button-on=true\nshow-battery-value-on=true"},"kimpanel@kde.org":{"/org/gnome/shell/extensions/kimpanel/":""},"mediacontrols@cliffniff.github.com":{"/org/gnome/shell/extensions/mediacontrols/":"[/]\ncolored-player-icon=true\nextension-position='center'\nhide-media-notification=false\nmouse-actions=['toggle_play', 'toggle_menu', 'none', 'none', 'none', 'none', 'none', 'none']\nprefer-using-seek=false\nseperator-chars=['|', '|']\nshow-control-icons=true\nshow-player-icon=false\nshow-playpause-icon=true\nshow-seek-back=false\nshow-seek-forward=false\nshow-seperators=false\nshow-sources-menu=false\nshow-text=false\ntrack-label=['none', '-', 'none']"},"noannoyance-fork@vrba.dev":{"/org/gnome/shell/extensions/noannoyance-fork/":""},"openweather-extension@jenslody.de":{"/org/gnome/shell/extensions/openweather/":"[/]\nactual-city=0\ncity='39.9740057,116.3132061>中关村, 中关村街道, 东升镇, 海淀区, 北京市, 100086, 中国>0'\nposition-in-panel='center'"},"blur-my-shell@aunetx":{"/org/gnome/shell/extensions/blur-my-shell/":"[/]\nbrightness=0.59999999999999998\ncolor=(0.0, 0.0, 0.0, 0.0)\ncolor-and-noise=false\nhacks-level=1\nnoise-amount=0.029999999999999999\nsigma=3\n\n[applications]\nblur=false\n\n[dash-to-dock]\nblur=true\ncustomize=true\nsigma=200\n\n[hidetopbar]\ncompatibility=false\n\n[overview]\nblur=true\ncustomize=false\nsigma=4\n\n[panel]\nblur=false\nbrightness=1.0\ncustomize=true\noverride-background=false\nsigma=108\nstatic-blur=true\nunblur-in-overview=false","/org/gnome/shell/extensions/blur-my-shell/overview/":"[/]\nblur=true\ncustomize=false\nsigma=4","/org/gnome/shell/extensions/blur-my-shell/appfolder/":"","/org/gnome/shell/extensions/blur-my-shell/panel/":"[/]\nblur=false\nbrightness=1.0\ncustomize=true\noverride-background=false\nsigma=108\nstatic-blur=true\nunblur-in-overview=false","/org/gnome/shell/extensions/blur-my-shell/dash-to-dock/":"[/]\nblur=true\ncustomize=true\nsigma=200","/org/gnome/shell/extensions/blur-my-shell/applications/":"[/]\nblur=false","/org/gnome/shell/extensions/blur-my-shell/screenshot/":"","/org/gnome/shell/extensions/blur-my-shell/lockscreen/":"","/org/gnome/shell/extensions/blur-my-shell/window-list/":"","/org/gnome/shell/extensions/blur-my-shell/hidetopbar/":"[/]\ncompatibility=false","/org/gnome/shell/extensions/blur-my-shell/dash-to-panel/":""}},"keybindings":{"/org/gnome/mutter/keybindings/":"[/]\ntoggle-tiled-left=['']\ntoggle-tiled-right=['']","/org/gnome/mutter/wayland/keybindings/":"[/]\nrestore-shortcuts=['']","/org/gnome/shell/keybindings/":"[/]\nshow-screenshot-ui=['<Shift><Super>s']\ntoggle-application-view=['']\ntoggle-message-tray=@as []\ntoggle-overview=['']","/org/gnome/desktop/wm/keybindings/":"[/]\nclose=['<Alt>F4']\nmove-to-workspace-1=['']\nmove-to-workspace-10=['']\nmove-to-workspace-2=['']\nmove-to-workspace-3=['']\nmove-to-workspace-4=['']\nmove-to-workspace-5=['']\nmove-to-workspace-6=['']\nmove-to-workspace-7=['']\nmove-to-workspace-8=['']\nmove-to-workspace-9=['']\nshow-desktop=['<Super>d']\nswitch-input-source=['']\nswitch-input-source-backward=['']\nswitch-to-workspace-1=['']\nswitch-to-workspace-10=['']\nswitch-to-workspace-2=['']\nswitch-to-workspace-3=['']\nswitch-to-workspace-4=['']\nswitch-to-workspace-5=['']\nswitch-to-workspace-6=['']\nswitch-to-workspace-7=['']\nswitch-to-workspace-8=['']\nswitch-to-workspace-9=['']\nunmaximize=['']","/org/gnome/settings-daemon/plugins/media-keys/":"[/]\ncustom-keybindings=['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/']\nnext=['<Control>Right']\nprevious=['<Control>Left']\nvolume-down=['<Control>Down']\nvolume-up=['<Control>Up']\n\n[custom-keybindings/custom0]\nbinding='<Control><Alt>t'\ncommand='terminator'\nname='terminal'\n\n[custom-keybindings/custom1]\nbinding='<Super>period'\ncommand='emoji-picker'\nname='emoji-picker'\n\n[custom-keybindings/custom2]\nbinding='<Shift><Super>a'\ncommand='normcap'\nname='OCR'\n\n[custom-keybindings/custom3]\nbinding='<Shift><Super>c'\ncommand='eyedropper'\nname='ColorPicker'\n\n[custom-keybindings/custom4]\nbinding='<Super>1'\ncommand='/usr/bin/sh /home/forceless/Code/chrome.sh'\nname='chrome'\n\n[custom-keybindings/custom5]\nbinding='<Super>2'\ncommand='/usr/bin/sh /home/forceless/Code/files.sh'\nname='files'\n\n[custom-keybindings/custom6]\nbinding='<Super>3'\ncommand='/usr/bin/sh /home/forceless/Code/code.sh'\nname='code'"},"tweaks":{"/org/gnome/desktop/background/":"[/]\ncolor-shading-type='solid'\npicture-options='zoom'\npicture-uri='file:///home/forceless/.local/share/backgrounds/2023-08-25-11-46-55-acg202110.gy_21.jpg'\npicture-uri-dark='file:///home/forceless/.local/share/backgrounds/2023-08-25-11-46-55-acg202110.gy_21.jpg'\nprimary-color='#000000000000'\nsecondary-color='#000000000000'","/org/gnome/desktop/calendar/":"[/]\nshow-weekdate=false","/org/gnome/desktop/input-sources/":"[/]\nshow-all-sources=true\nsources=[('xkb', 'cn')]\nxkb-options=@as []","/org/gnome/desktop/interface/":"[/]\nclock-show-seconds=false\nclock-show-weekday=true\ncolor-scheme='default'\ncursor-theme='Bibata-Modern-Ice'\ndocument-font-name='MiSans 11'\nenable-hot-corners=false\nfont-antialiasing='rgba'\nfont-hinting='slight'\nfont-name='MiSans 11'\ngtk-key-theme='Default'\ngtk-theme='Adw'\nicon-theme='Fluent'\nlocate-pointer=false\nmonospace-font-name='Droid Sans Mono 11'\nshow-battery-percentage=false\ntoolkit-accessibility=false","/org/gnome/desktop/peripherals/":"[keyboard]\nnumlock-state=true\n\n[mouse]\nspeed=1.0\n\n[touchpad]\ndisable-while-typing=true\nspeed=0.8199052132701421","/org/gnome/desktop/screensaver/":"[/]\ncolor-shading-type='solid'\nlock-enabled=false\npicture-options='zoom'\npicture-uri='file:///home/forceless/.local/share/backgrounds/2023-08-25-11-46-55-acg202110.gy_21.jpg'\nprimary-color='#000000000000'\nsecondary-color='#000000000000'","/org/gnome/desktop/sound/":"[/]\nallow-volume-above-100-percent=true\nevent-sounds=true\ntheme-name='__custom'","/org/gnome/desktop/wm/preferences/":"[/]\nbutton-layout='close,minimize,maximize:appmenu'\nnum-workspaces=1\ntitlebar-font='MiSans Bold Italic 11'","/org/gnome/mutter/":"[/]\ncenter-new-windows=true\ndynamic-workspaces=false\nexperimental-features=['x11-randr-fractional-scaling']\noverlay-key='Super_L'\n\n[keybindings]\ntoggle-tiled-left=['']\ntoggle-tiled-right=['']\n\n[wayland/keybindings]\nrestore-shortcuts=['']","/org/gnome/settings-daemon/plugins/xsettings/":""}}%
