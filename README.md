# PhoshTheme

This gtk-3.0 theme was made for the phosh/gnome mobile environment. Buttons, switches, bars, borders, text... have been altered to allow for easier manipulation and viewing on small screens.

There are only 2 main colours which are generally adjusted: foreground and background. Shades of the foreground colour have been incorperated to indicate hovering, pressing, and selecting and such. Colours may (or should be able to, at least) be reversed, allowing for a complete inverse effect of colours; a white/black theme should be the exact inverse of a black/white them.

Please note that this theme has only been tested on the Raspberry Pi 4b architecture using the 7" official Raspberry Pi touchscreen on the phosh OS window manager.

You must install both gtk.css theme files to ~/.config/gtk-3.0/ and ~/.themes/ for the themes to work correctly. Any changes to ~/.config/gtk-3.0/gtk.css will not be noticed until the user logs out and back into gnome.


![Main dashboard](/screenshots/overview-clean.png)

![Main dashboard](/screenshots/overview2.png)

![gnome files](/screenshots/files.png)

![foliate (ebook reader)](/screenshots/foliate.png)

![quick menu](/screenshots/quickmenu.png)

![settings](screenshots/settings.png)

![totem](/screenshots/totem.png)

Themes may be any colour (simpy add and edit the 'phosh-red' theme:

![totem](/screenshots/phosh-red.png)

![totem](/screenshots/cyan.png)


Themes may be reverse-colours:

![totem](/screenshots/blue.png)

Example with firefox:

![totem](/screenshots/white-blue-firefox.png)


Bugs:

- The lockscreen is not completely edited and finished. I've edited the lockscreen to make the pin entry fit as well as I can on Raspberry Pi devices when in landscape mode. You will be able to enter your pin, but you'll need to press the keyboard button and then <ENTER> to submit the password.
- The main overview search bar appears to use white text. I've not yet figured out how to change this. The workaround is to use a text shadow to wash it out a little and make it more closer to the foreground colour.
- The program gnome-disks for some reason uses a strange configuration of colours which results in the program looking washed out at times. I'm going to look into this.
  


