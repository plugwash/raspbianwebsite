# Bootable Raspbian "Pisces+MATE" Image by Mike Thompson

**Coming Soon**

This image is not yet available for download. This page will be updated
once the image is available.

Mike Thompson has produced a publicly available SD image of Raspbian
that is bootable on Raspberry Pi hardware. This is called the "pisces"
image as that is what Mike's Raspberry Pi system is named on his LAN.

This differs from the other [Pisces images](PiscesImages) mainly in that
in includes the [MATE/Gnome 2](RaspbianMate) desktop environment rather
than the LXDE desktop environment. Although the MATE/Gnome 2 desktop is
"heavier weight" than LXDE, for many years it served as the "standard"
desktop for many Linux distributions. Thus it is more mature and refined
than other "lighter weight" desktops. This image was created using the
Debian installer so it reflects a minimal Debian installation with the
MATE packages added for a desktop. No attempts have been made to
optimize the MATE desktop for the slower CPU and low-memory environment
of the Raspberry Pi.

### Download the Pisces+MATE R1 Image

The 700 MB image can be downloaded from this link
[rpi\_pisces\_mate\_r1.zip](http://archive.raspbian.org/images/rpi_pisces_mate_r1.zip).

Once booted, log into one of the two existing accounts:

  - 

|              |              |
| ------------ | ------------ |
| **Username** | **Password** |
| root         | raspbian     |
| raspbian     | raspbian     |

  - 
  

Once logged into the 'raspbian' account, run the following command to
start the MATE desktop.

`startx`

### Image Install

To install the image file, you will need to unzip it and write it to a
suitable 4G or larger SD card using the UNIX tool
[dd](http://en.wikipedia.org/wiki/Dd_\(Unix\)). Windows users should use
[Win32DiskImager](http://www.softpedia.com/get/CD-DVD-Tools/Data-CD-DVD-Burning/Win32-Disk-Imager.shtml).
Do not try to drag and drop or otherwise copy over the image without
using dd or Win`  `32`  `Disk`  `Imager – it won’t work. If you’re still
not clear on what to do, the community on the Raspberry Pi Wiki has
written a [guide for
beginners](http://elinux.org/RPi_Easy_SD_Card_Setup) on how to set up
your SD card.

### Image Notes

  - Typical Linux tools and editors are included
  - GNU C and C++ compilers included
  - SSH server included, launches on boot by default
  - Xorg and MATE included, type "startx" to launch this after logging
    in
  - Midori web browser
  - Hexxeh's rpi-update is included
  - Updated to the latest Raspberry Pi firmware and kernel as of June
    19th

Some notes concerning this image:

  - Remember to reset 'root' and 'raspbian' passwords and [OpenSSH
    server host
    keys](http://www.cyberciti.biz/faq/howto-regenerate-openssh-host-keys/)
    to avoid security issues.

  - Configure your timezone:
    
      - `dpkg-reconfigure tzdata`

  - Configure locale settings:
    
      - `apt-get install locales`
        
        `dpkg-reconfigure locales`

  - Configure keyboard settings:
    
      - `apt-get install keyboard-configuration`
        
        `dpkg-reconfigure keyboard-configuration`

### Keeping Up to Date

You can use the standard Debian way to update your installation:

  - `apt-get update && apt-get dist-upgrade`

To get the newest kernel and firmware,
[rpi-update](https://github.com/Hexxeh/rpi-update) is included in this
image.

Verify the system time and date are set correctly and then run the
following command:

  - `rpi-update`
