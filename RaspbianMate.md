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

For Raspbian, add the following repository to your
"/etc/apt/sources.list":

    deb http://archive.raspbian.org/mate wheezy main

Perform the following commands:

    sudo apt-get update
    sudo apt-get install mate-core
    sudo apt-get install mate-desktop-environment
    sudo apt-get install mate-file-manager

## Starting MATE

### Running MATE manually with startx

In order to start MATE manually, you must add

    exec mate-session

to your \~/.xinitrc file and then run

    startx
