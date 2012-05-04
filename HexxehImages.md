# Bootable Raspbian Images by Hexxeh

[Hexxeh](http://hexxeh.net/) has produced the first publicly available
SD image of Raspbian that is bootable on Raspberry Pi hardware.

Because the majority of Raspbian packages are still being built, this
image provides only a very minimal install of Raspbian that will boot to
a command prompt. However, it is an excellent tool to use for testing
hard float compilations, running benchmarks and debugging packages that
are having problems building on the Raspbian autobuilders. Once booted,
you can log into the 'root' account with the password 'hexxeh'.

The 112 MB image can be downloaded from this link:
[raspbian-r2.zip](http://distribution.hexxeh.net/raspbian/raspbian-r2.zip)

To use an image file, you will need to unzip it and write it to a
suitable SD card using the UNIX tool
[dd](http://en.wikipedia.org/wiki/Dd_\(Unix\)). Windows users should use
[Win32DiskImager](http://www.softpedia.com/get/CD-DVD-Tools/Data-CD-DVD-Burning/Win32-Disk-Imager.shtml).
Do not try to drag and drop or otherwise copy over the image without
using dd or Win`  `32`  `Disk`  `Imager – it won’t work. If you’re still
not clear on what to do, the community on the Raspberry Pi Wiki has
written a [guide for
beginners](http://elinux.org/RPi_Easy_SD_Card_Setup) on how to set up
your SD card.
