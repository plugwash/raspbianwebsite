# MATE on Raspberry Pi

Gnome 2 was the most popular Linux desktop, but it’s no longer
available. MATE is a fork of Gnome 2 and provides an intuitive and
attractive desktop to Linux users using traditional metaphors.

[![Mate Desktop](_attachments/RaspbianMate/mate_screenshot.png
"Mate Desktop")](_attachments/RaspbianMate/mate_screenshot.png "{{attachment:mate_screenshot.png|Mate Desktop|width=480}}")

## About MATE

The best source of information about MATE is the [MATE
website](http://mate-desktop.org/). At the website is an explanation as
to why MATE exists, information on [installing
MATE](http://mate-desktop.org/install/) and
[forums](http://forums.mate-desktop.org/) where you can get help with
using MATE.

## Installing MATE

#### Raspbian & MATE SD Image

A Raspbian image with MATE configured as the default desktop is
[available here](PiscesMATEImages).

#### Install MATE With apt-get

For Raspbian, add the following repository to your
"/etc/apt/sources.list":

    deb http://archive.raspbian.org/mate wheezy main

Perform the following commands:

    sudo apt-get update
    sudo apt-get install mate-core
    sudo apt-get install mate-desktop-environment

## Starting MATE

### Running MATE manually with startx

In order to start MATE manually, you must add

    exec mate-session

to your \~/.xinitrc file and then run

    startx

### Running MATE automatically at boot time

TBD \[Haven't figured this out yet.\]

## Using MATE

The [Gnome 2.32 User
Guide](http://library.gnome.org/users/user-guide/2.32/user-guide.html)
provides basic documentation for the features of GNOME 2 and MATE.
However, you'll need to note the name changes in MATE related to Gnome 2
features below.

## MATE Applications

It is important to note that many Gnome 2 core applications are
rebranded for MATE, as per the licensing terms. Here is a list of common
Gnome 2 applications under MATE:

  - Nautilus is renamed caja
  - Metacity is renamed marco
  - Gconf is renamed mate-conf

Other applications and core components prefixed with Gnome (such as
Gnome Panel, Gnome Menus etc) have simply had the prefix renamed "MATE"
and become MATE Panel and MATE Menus.

Not all of the Gnome 2 extra applications (built for GTK2) have been
forked yet. The following extra applications are available in MATE:

  - Totem (mate-video-player)
  - Eye of GNOME (mate-image-viewer)
  - Gedit (mate-text-editor)
  - File Roller (mate-file-archiver)
  - GNOME Panel applets (mate-applets)
  - GNOME Terminal (mate-terminal)

## Optimizing Performance

The default configuration for MATE consumes a lot of RAM (about 175MB
just booting) and is fairly slow. However, with some configuration
changes, it may be possible to have MATE function decently on the
Raspberry Pi. Some links that may help getting MATE to run better on the
Raspberry Pi are included below:

  - [Best Gnome Performance
    Tweaks](http://penguininside.blogspot.com/2009/08/top-10-gnome-performance-tweaks.html)

  - [Gnome 2.32: Tips, Tricks &
    Tweaks](http://pclosmag.com/html/Issues/201205/page08.html)

  - [Reducing Gnome CPU
    Usage](http://docs.oracle.com/cd/E19253-01/819-0918/performance-22/index.html)

## Additional Information

I found the information on [using MATE on Arch
Linux](https://wiki.archlinux.org/index.php/MATE) useful.

## Miscellaneous Notes

#### Disable Tool Tips

For MATE panel and MATE panel applets:

Edit the file (create if necessary) `~/.gtkrc-2.0` and add the line:

    gtk-enable-tooltips = 0

#### Enable Reduced Resources Mode

The Marco window manager has a reduced resources mode which renders
windows as wireframes when you move and resize windows. When reduced
resources mode is enabled, only the outline of windows is displayed when
you move and resize windows. The contents of the window do not need to
be updated during the move or resize. The contents of the window are
displayed when the move or resize is complete. When reduced resources
mode is enabled, windows are not animated when you move and resize the
windows.

To enable reduced resources mode, execute the following command:

    # mateconftool-2 --type bool --set /apps/marco/general/reduced_resources true 

#### Turn Off Display of Icons in Menus

Some items in menus display an icon beside the item. To turn off this
feature and save CPU resources, execute the following command:

    # mateconftool-2 --type bool --set /desktop/mate/interface/menus_have_icons false

Alternatively, users can use the Menus & Toolbars preference tool to
deselect the Show icons in menus option.
