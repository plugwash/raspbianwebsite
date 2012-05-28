# Bootable Raspbian "Pisces" Image by Mike Thompson

Mike Thompson has produced a publicly available SD image of Raspbian
that is bootable on Raspberry Pi hardware. This is called the "pisces"
image as that is what Mike's Raspberry Pi system is named on his LAN.

This image is a little newer and includes a more complete installation
of Raspbian and LXDE than the more minimal Hexxeh image. This image was
created using the Debian installer so it reflects a minimal Debian
installation with the LXDE packages added for a desktop.

### Download the Image

The 466 MB image can be downloaded from this link
[rpi\_pisces\_r1.zip](http://archive.raspbian.org/images/rpi_pisces_r1.zip)
or by
[torrent](http://archive.raspbian.org/images/rpi_pisces_r1.torrent).

Once booted, log into one of the two existing accounts:

  - 

|              |              |
| ------------ | ------------ |
| **Username** | **Password** |
| root         | raspbian     |
| raspbian     | raspbian     |

Some notes concerning this release:

  - Typical Linux tools and editors are included
  - GNU C and C++ compilers included
  - SSH server included, launches on boot by default
  - Xorg and LXDE included, type "startx" to launch this after logging
    in
  - Hexxeh's rpi-update is included
  - Updated to the latest Raspberry Pi firmware and kernel as of 27th
    May

Some notes concerning this image:

  - Configure your timezone:
      - `dpkg-reconfigure tzdata`
  - Configure locale settings:
      - `apt-get install locales`
        
        `dpkg-reconfigure locales`
  - Configure keyboard settings:
      - `apt-get install console-data`
        
        `dpkg-reconfigure console-data`

### Using the Image

To use an image file, you will need to unzip it and write it to a
suitable 4G or larger SD card using the UNIX tool
[dd](http://en.wikipedia.org/wiki/Dd_\(Unix\)). Windows users should use
[Win32DiskImager](http://www.softpedia.com/get/CD-DVD-Tools/Data-CD-DVD-Burning/Win32-Disk-Imager.shtml).
Do not try to drag and drop or otherwise copy over the image without
using dd or Win`  `32`  `Disk`  `Imager – it won’t work. If you’re still
not clear on what to do, the community on the Raspberry Pi Wiki has
written a [guide for
beginners](http://elinux.org/RPi_Easy_SD_Card_Setup) on how to set up
your SD card.

### Keeping Up to Date

You can use the standard Debian way to update your installation:

  - `apt-get update && apt-get dist-upgrade`

To get the newest kernel and firmware,
[rpi-update](https://github.com/Hexxeh/rpi-update) is included in this
image.

Verify the system time and date are set correctly and then run the
following command:

  - `rpi-update`
