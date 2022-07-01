# Amoled theme for mobile devices

This KDE (colour/plasma/desktop/decoration) theme was made for the wayland KDE display manager.
Features:
- Enlarged buttons, switches, bars, borders, text... for easier touch access
- Thicker scroll bars and sliders
- Panel widget (active window control) provides close and maximize/restore buttons (must be manually added to panel)
- Pure black background for low battery consumption on amoled devices
- A gnome 3.0 theme for those who want to run gnome within KDE (not being updated due to libadwaita breaking things)

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

launcher:
![launcher](/screenshots/launcher.png)

konsole:
![konsole](/screenshots/konsole.png)

kate:
![kate](/screenshots/kate.png)

dolphin:
![dolphin](/screenshots/dolphin.png)

konqueror:
![konqueror](/screenshots/konqueror.png)

keyboard (TODO):
![keyboard](/screenshots/keyboard.png)

