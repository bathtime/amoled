# Amoled theme for mobile devices

This KDE (colour/plasma/desktop/decoration) theme was made for the wayland KDE display manager.

Features:
- Enlarged buttons, switches, bars, borders, text... for easier touch access
- Thicker scroll bars and sliders
- Pure black background for low battery consumption on amoled devices

This theme has been tested on the Raspberry Pi 4b architecture using the 7" official Raspberry Pi touchscreen on the Phosh and KDE Manjaro images. It has also be tested on Manjaro x86-64 KDE. It has not been tested on the X window manager!


## Requirements:

Packages required:

kvantum

## Installation

```
git clone https://github.com/bathtime/amoled.git
cp -rv amoled/.* ~
```

Please note that any changes to ~/.config/gtk-3.0/gtk.css will not be seen until the user logs out and back into gnome and that this installation will overwrite your previus gtk.ss config file.


## KDE Screenshots
 
plasma launcher:
![launcher](/screenshots/launcher.png)

dolphin:
![dolphin](/screenshots/dolphin.png)

kate:
![kate](/screenshots/kate.png)

konsole:
![konsole](/screenshots/konsole.png)
 
konqueror:
![konqueror](/screenshots/konqueror.png)


