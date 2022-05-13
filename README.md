# Phosh theme

This gtk-3.0 theme was made for the [phosh](https://wiki.postmarketos.org/wiki/Phosh) mobile environment. Buttons, switches, bars, borders, text... have been altered to allow for easier manipulation and viewing on small screens.

There are only 2 main colours which are generally adjusted: foreground and background. Shades of the foreground colour have been incorperated to indicate hovering, pressing, and selecting. Colours may (or should be able to, at least) be reversed, allowing for a complete inverse effect of colours; a white/black theme should be the exact inverse of a black/white them.

Please note that this theme has only been tested on the Raspberry Pi 4b architecture using the 7" official Raspberry Pi touchscreen on the phosh OS window manager.

Included is the UbuntuTouch Tron icon theme, so please give this credit to its creator: https://www.gnome-look.org/p/1463203/

## Installation

```
git clone https://github.com/bathtime/PhoshTheme.git
cp -rv PhoshTheme/.* ~
cd ~/.icons && ls UbuntuTouch-Tron-*.tar.xz | xargs -n 1 tar -xvf
```

Please note that any changes to ~/.config/gtk-3.0/gtk.css will not be seen until the user logs out and back into gnome.

## Screenshots

![Main dashboard](/screenshots/overview-clean.png)

![Main dashboard](/screenshots/overview2.png)

![gnome files](/screenshots/files.png)

![foliate (ebook reader)](/screenshots/foliate.png)

![quick menu](/screenshots/quickmenu.png)

![settings](screenshots/settings.png)

![totem](/screenshots/totem.png)

Themes may be any colour (simpy edit the 'phosh-red' theme):

![totem](/screenshots/phosh-red.png)

![totem](/screenshots/cyan.png)


Themes may be reverse-colours:

![totem](/screenshots/blue.png)


## Bugs:

- The lockscreen is not completely edited and finished. I've edited the lockscreen to make the pin entry fit as well as I can on my official Raspberry Pi touchscreen. You will be able to enter your pin, but you'll need to press the keyboard button and then <ENTER> to submit the password, as the submit button won't fit on the screen in landscape mode.
- The main overview search bar appears to use white text. I've not yet figured out how to change this. The workaround is to use a text shadow to wash it out a little and make it more closer to the foreground colour.
- The program gnome-disks for some reason uses a strange configuration of colours which results in the program looking washed out at times. I'm going to look into this.
- Highlighted buttons will sometimes not unhighlight. I'm not sure if this is due to my gtk.css configuration, gnome's gtk, wayland, or phosh.
- Firefox can incorperate the colours of the theme but will not allow for certain dark shades. A black background will result in a dark greyish colour instead. There is a way to fix this, I believe, but it involves some sort of trick using transparency and solild colours to fool firefox or just simply using a colour light enough for firefox to accept.
- This theme was created mainly using a touch device. It should work with a keyboard, but some items may not draw a dotted outline when using the <TAB> button to focus. I'm fixing this, but it's taking time.


